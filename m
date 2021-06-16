Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B124A3AA519
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Jun 2021 22:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhFPUVQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Jun 2021 16:21:16 -0400
Received: from mga03.intel.com ([134.134.136.65]:45322 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233294AbhFPUVQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 16:21:16 -0400
IronPort-SDR: WV/wXa2l6QSkvY81/ZmdpZLp18aIKm2LaDjoVPR+6mD1gmV1BVbpoU7vYxkz2NcRN9lZBRKxfV
 pnMlzB0ghmHg==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="206288081"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="206288081"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2021 13:19:09 -0700
IronPort-SDR: gGYzzzjVvSxwYrdsTbANsx/pIiVEz1HP2YsOHNL9wKqEGUyQ0x2hGD5rrlTQRmsSxAMSJY9oiX
 FmuB5WOSdAgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="452486104"
Received: from spandruv-desk.jf.intel.com ([10.54.75.21])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2021 13:19:08 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     degoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] platform/x86: ISST: Use numa node id for cpu pci dev mapping
Date:   Wed, 16 Jun 2021 13:18:56 -0700
Message-Id: <20210616201856.1690143-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616201856.1690143-1-srinivas.pandruvada@linux.intel.com>
References: <20210616201856.1690143-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There is a problem in mapping CPU to a PCI device instance when the
bus numbers are reused in different packages. This was observed on
some Sapphire Rapids systems.

The current implementation reads bus number assigned to a CPU package
via MSR 0x128. This allows to establish relationship between a CPU
and a PCI device. This allows to update power related parameters to a
MMIO offset in a PCI device space which is unique to a CPU. But if
two packages uses same bus number then this mapping will not be unique.

When bus number is reused, PCI device will use different domain number
or segment number. So we need to be aware of this domain information
while matching CPU to PCI bus number. This domain information is not
available via any MSR. So need to use ACPI numa node information.

There is an interface already available in the Linux to read numa
node for a CPU and a PCI device. This change uses this interface
to check the numa node of a match PCI device with bus number.
If the bus number and numa node matches with the CPU's assigned
bus number and numa node, the matched PCI device instance will be
returned to the caller.

It is possible that before Sapphire Rapids, the numa node is not
defined for the Speed Select PCI device in some OEM systems. In this
case to restore old behavior, return the last matched PCI device
for domain 0 unlsess there are more than one matches.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel_speed_select_if/isst_if_common.c    | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
index aedb8310214c..cdd1737fcbc6 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
@@ -283,13 +283,18 @@ struct isst_if_cpu_info {
 	int bus_info[2];
 	struct pci_dev *pci_dev[2];
 	int punit_cpu_id;
+	int numa_node;
 };
 
 static struct isst_if_cpu_info *isst_cpu_info;
+#define ISST_MAX_PCI_DOMAINS	8
 
 static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn)
 {
-	int bus_number;
+	struct pci_dev *matched_pci_dev = NULL;
+	struct pci_dev *pci_dev = NULL;
+	int no_matches = 0;
+	int i, bus_number;
 
 	if (bus_no < 0 || bus_no > 1 || cpu < 0 || cpu >= nr_cpu_ids ||
 	    cpu >= num_possible_cpus())
@@ -299,7 +304,45 @@ static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn
 	if (bus_number < 0)
 		return NULL;
 
-	return pci_get_domain_bus_and_slot(0, bus_number, PCI_DEVFN(dev, fn));
+	for (i = 0; i < ISST_MAX_PCI_DOMAINS; ++i) {
+		struct pci_dev *_pci_dev;
+		int node;
+
+		_pci_dev = pci_get_domain_bus_and_slot(i, bus_number, PCI_DEVFN(dev, fn));
+		if (!_pci_dev)
+			continue;
+
+		++no_matches;
+		if (!matched_pci_dev)
+			matched_pci_dev = _pci_dev;
+
+		node = dev_to_node(&_pci_dev->dev);
+		if (node == NUMA_NO_NODE) {
+			pr_info("Fail to get numa node for CPU:%d bus:%d dev:%d fn:%d\n",
+				cpu, bus_no, dev, fn);
+			continue;
+		}
+
+		if (node == isst_cpu_info[cpu].numa_node) {
+			pci_dev = _pci_dev;
+			break;
+		}
+	}
+
+	/*
+	 * If there is no numa matched pci_dev, then there can be following cases:
+	 * 1. CONFIG_NUMA is not defined: In this case if there is only single device
+	 *    match, then we don't need numa information. Simply return last match.
+	 *    Othewise return NULL.
+	 * 2. NUMA information is not exposed via _SEG method. In this case it is similar
+	 *    to case 1.
+	 * 3. Numa information doesn't match with CPU numa node and more than one match
+	 *    return NULL.
+	 */
+	if (!pci_dev && no_matches == 1)
+		pci_dev = matched_pci_dev;
+
+	return pci_dev;
 }
 
 /**
@@ -354,6 +397,7 @@ static int isst_if_cpu_online(unsigned int cpu)
 		return ret;
 	}
 	isst_cpu_info[cpu].punit_cpu_id = data;
+	isst_cpu_info[cpu].numa_node = cpu_to_node(cpu);
 
 	isst_restore_msr_local(cpu);
 
-- 
2.30.2


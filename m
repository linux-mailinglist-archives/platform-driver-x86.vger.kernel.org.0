Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56B44152D0
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Sep 2021 23:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238088AbhIVVbn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Sep 2021 17:31:43 -0400
Received: from mga05.intel.com ([192.55.52.43]:33405 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238067AbhIVVbm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Sep 2021 17:31:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="309261969"
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="309261969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 14:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="518740347"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2021 14:30:07 -0700
Received: from debox1-server.jf.intel.com (debox1-server.jf.intel.com [10.54.39.121])
        by linux.intel.com (Postfix) with ESMTP id B2BF4580C6E;
        Wed, 22 Sep 2021 14:30:07 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     lee.jones@linaro.org, bhelgaas@google.com,
        andy.shevchenko@gmail.com
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        mgross@linux.intel.com, srinivas.pandruvada@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v3 1/5] PCI: Add #defines for accessing PCIE DVSEC fields
Date:   Wed, 22 Sep 2021 14:30:03 -0700
Message-Id: <20210922213007.2738388-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922213007.2738388-1-david.e.box@linux.intel.com>
References: <20210922213007.2738388-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add #defines for accessing Vendor ID, Revision, Length, and ID offsets
in the Designated Vendor Specific Extended Capability (DVSEC). Defined
in PCIe r5.0, sec 7.9.6.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---

v3:	No change

 include/uapi/linux/pci_regs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index e709ae8235e7..57ee51f19283 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -1080,7 +1080,11 @@
 
 /* Designated Vendor-Specific (DVSEC, PCI_EXT_CAP_ID_DVSEC) */
 #define PCI_DVSEC_HEADER1		0x4 /* Designated Vendor-Specific Header1 */
+#define  PCI_DVSEC_HEADER1_VID(x)	((x) & 0xffff)
+#define  PCI_DVSEC_HEADER1_REV(x)	(((x) >> 16) & 0xf)
+#define  PCI_DVSEC_HEADER1_LEN(x)	(((x) >> 20) & 0xfff)
 #define PCI_DVSEC_HEADER2		0x8 /* Designated Vendor-Specific Header2 */
+#define  PCI_DVSEC_HEADER2_ID(x)		((x) & 0xffff)
 
 /* Data Link Feature */
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
-- 
2.25.1


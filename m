Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992706CCC4E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Mar 2023 23:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjC1Vxj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Mar 2023 17:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjC1Vxi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Mar 2023 17:53:38 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7D92133;
        Tue, 28 Mar 2023 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680040411; x=1711576411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BYOg0v/b9Zi+4/1Zgi33E8fJWccW0mH2Odw/+Z3jsB8=;
  b=brTPTRrqM4sDxdw9plOzJshvIDpQHhkW4ac3oYTMNUqFl66Qk8iL/NLJ
   R4u8rGfMojZTdL5dxobFt5SegqXDSW1PCSYlIZHPiYtpNf7altpySnEJt
   IqOOPy22xzaBHzWTr9LgyfA1bNapMOijCrx6ExKaV0wYCyuBgMqVknpFL
   KoAGsFATbQxFpqlYbKrKEiTpW60KinQEjJhORt/5rGwv/Ks64jEOTJa/Q
   DGvjVVifVVGpcEouD9CqXsLB7j258cDXp6XRNmLCooB9+D0COhZGfQx2M
   /YeQtmkg1Bq/OikRI24YW6dI1vGU4006b6SbLtctLJV5slEPqAlG3M1pA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339426580"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="339426580"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 14:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="753331240"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="753331240"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 14:53:30 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86/intel-uncore-freq: Uncore frequency control via TPMI
Date:   Tue, 28 Mar 2023 14:53:28 -0700
Message-Id: <20230328215328.101990-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Implement support of uncore frequency control via TPMI (Topology Aware
Register and PM Capsule Interface). This driver provides the similar
functionality as the current uncore frequency driver using MSRs.

The hardware interface to read/write is basically substitution of MSR
0x620 and 0x621. There are specific MMIO offset and bits to get/set
minimum and maximum uncore ratio, similar to MSRs.

The scope of the uncore MSRs is package/die. But new generation of CPUs
have more granular control at a cluster level. Each package/die can have
multiple power domains, which further can have multiple clusters. The
TPMI interface allows control at cluster level.

The primary use case for uncore sysfs is to set maximum and minimum
uncore frequency to reduce power consumption or latency. The current
uncore sysfs control is per package/die. This is enough for the majority
of users as workload will move to different power domains as it moves
between different CPUs.

The current uncore sysfs provides controls at package/die level. When
user sets maximum/minimum limits, the driver sets the same limits to
each cluster.

Here number of power domains = number of resources in this aux device.
There are offsets and bits to discover number of clusters and offset for
each cluster level controls.

The TPMI documentation can be downloaded from:
https://github.com/intel/tpmi_power_management

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
The fine grain control at cluster level patches are here:
https://github.com/spandruvada/linux-kernel/commit/0d66ea4ff76ea19127f2d207a7e17bb86846ca32
https://github.com/spandruvada/linux-kernel/commit/cb5c2349a58318c04955821d6528cc8015541e65
But not submitting to ease in review process as I posted too many
patches this cycle.

 .../x86/intel/uncore-frequency/Kconfig        |   4 +
 .../x86/intel/uncore-frequency/Makefile       |   2 +
 .../uncore-frequency/uncore-frequency-tpmi.c  | 346 ++++++++++++++++++
 3 files changed, 352 insertions(+)
 create mode 100644 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c

diff --git a/drivers/platform/x86/intel/uncore-frequency/Kconfig b/drivers/platform/x86/intel/uncore-frequency/Kconfig
index 21b209124916..a56d55056927 100644
--- a/drivers/platform/x86/intel/uncore-frequency/Kconfig
+++ b/drivers/platform/x86/intel/uncore-frequency/Kconfig
@@ -6,9 +6,13 @@
 menu "Intel Uncore Frequency Control"
 	depends on X86_64 || COMPILE_TEST
 
+config INTEL_UNCORE_FREQ_CONTROL_TPMI
+	tristate
+
 config INTEL_UNCORE_FREQ_CONTROL
 	tristate "Intel Uncore frequency control driver"
 	depends on X86_64
+	select INTEL_UNCORE_FREQ_CONTROL_TPMI if INTEL_TPMI
 	help
 	  This driver allows control of Uncore frequency limits on
 	  supported server platforms.
diff --git a/drivers/platform/x86/intel/uncore-frequency/Makefile b/drivers/platform/x86/intel/uncore-frequency/Makefile
index e0f7968e8285..08ff57492b28 100644
--- a/drivers/platform/x86/intel/uncore-frequency/Makefile
+++ b/drivers/platform/x86/intel/uncore-frequency/Makefile
@@ -7,3 +7,5 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)	+= intel-uncore-frequency.o
 intel-uncore-frequency-y		:= uncore-frequency.o
 obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)	+= intel-uncore-frequency-common.o
 intel-uncore-frequency-common-y		:= uncore-frequency-common.o
+obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL_TPMI)	+= intel-uncore-frequency-tpmi.o
+intel-uncore-frequency-tpmi-y		:= uncore-frequency-tpmi.o
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
new file mode 100644
index 000000000000..4150bb877ab5
--- /dev/null
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -0,0 +1,346 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * intel-ufs-tpmi: Intel x86 platform uncore frequency scaling
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ * All Rights Reserved.
+ *
+ * The hardware interface to read/write is basically substitution of
+ * MSR 0x620 and 0x621.
+ * There are specific MMIO offset and bits to get/set minimum and
+ * maximum uncore ratio, similar to MSRs.
+ * The scope of the uncore MSRs was package scope. But TPMI allows
+ * new gen CPUs to have multiple uncore controls at uncore-cluster
+ * level. Each package can have multiple power domains which further
+ * can have multiple clusters.
+ * Here number of power domains = number of resources in this aux
+ * device. There are offsets and bits to discover number of clusters
+ * and offset for each cluster level controls.
+ *
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/intel_tpmi.h>
+
+#include "uncore-frequency-common.h"
+
+#define	UNCORE_HEADER_VERSION		1
+#define UNCORE_HEADER_INDEX		0
+#define UNCORE_FABRIC_CLUSTER_OFFSET	8
+
+/* status + control + adv_ctl1 + adv_ctl2 */
+#define UNCORE_FABRIC_CLUSTER_SIZE	(4 * 8)
+
+#define UNCORE_STATUS_INDEX		0
+#define UNCORE_CONTROL_INDEX		8
+
+#define UNCORE_FREQ_KHZ_MULTIPLIER	100000
+
+struct tpmi_uncore_struct;
+
+/* Information for each cluster */
+struct tpmi_uncore_cluster_info {
+	void __iomem *cluster_base;
+	struct uncore_data uncore_data;
+	struct tpmi_uncore_struct *uncore_root;
+};
+
+/* Information for each power domain */
+struct tpmi_uncore_power_domain_info {
+	void __iomem *uncore_base;
+	int ufs_header_ver;
+	int cluster_count;
+	struct tpmi_uncore_cluster_info *cluster_infos;
+};
+
+/* Information for all power domains in a package */
+struct tpmi_uncore_struct {
+	int power_domain_count;
+	struct tpmi_uncore_power_domain_info *pd_info;
+	struct tpmi_uncore_cluster_info root_cluster;
+};
+
+#define UNCORE_GENMASK_MIN_RATIO	GENMASK_ULL(21, 15)
+#define UNCORE_GENMASK_MAX_RATIO	GENMASK_ULL(14, 8)
+
+/* Helper function to read MMIO offset for max/min control frequency */
+static void read_control_freq(struct tpmi_uncore_cluster_info *cluster_info,
+			     unsigned int *min, unsigned int *max)
+{
+	u64 control;
+
+	control = readq((u8 __iomem *)cluster_info->cluster_base + UNCORE_CONTROL_INDEX);
+	*max = FIELD_GET(UNCORE_GENMASK_MAX_RATIO, control) * UNCORE_FREQ_KHZ_MULTIPLIER;
+	*min = FIELD_GET(UNCORE_GENMASK_MIN_RATIO, control) * UNCORE_FREQ_KHZ_MULTIPLIER;
+}
+
+#define UNCORE_MAX_RATIO	0x7F
+
+/* Callback for sysfs read for max/min frequencies. Called under mutex locks */
+static int uncore_read_control_freq(struct uncore_data *data, unsigned int *min,
+				    unsigned int *max)
+{
+	struct tpmi_uncore_cluster_info *cluster_info;
+	struct tpmi_uncore_struct *uncore_root;
+	int i, _min = 0, _max = 0;
+
+	cluster_info = container_of(data, struct tpmi_uncore_cluster_info, uncore_data);
+	uncore_root = cluster_info->uncore_root;
+
+	*min = UNCORE_MAX_RATIO * UNCORE_FREQ_KHZ_MULTIPLIER;
+	*max = 0;
+
+	/*
+	 * Get the max/min by looking at each cluster. Get the lowest
+	 * min and highest max.
+	 */
+	for (i = 0; i < uncore_root->power_domain_count; ++i) {
+		int j;
+
+		for (j = 0; j < uncore_root->pd_info[i].cluster_count; ++j) {
+			read_control_freq(&uncore_root->pd_info[i].cluster_infos[j],
+					  &_min, &_max);
+			if (*min > _min)
+				*min = _min;
+			if (*max < _max)
+				*max = _max;
+		}
+	}
+
+	return 0;
+}
+
+/* Helper function to write MMIO offset for max/min control frequency */
+static void write_control_freq(struct tpmi_uncore_cluster_info *cluster_info, unsigned int input,
+			      unsigned int min_max)
+{
+	u64 control;
+
+	control = readq((u8 __iomem *)cluster_info->cluster_base + UNCORE_CONTROL_INDEX);
+
+	if (min_max) {
+		control &= ~UNCORE_GENMASK_MAX_RATIO;
+		control |= FIELD_PREP(UNCORE_GENMASK_MAX_RATIO, input);
+	} else {
+		control &= ~UNCORE_GENMASK_MIN_RATIO;
+		control |= FIELD_PREP(UNCORE_GENMASK_MIN_RATIO, input);
+	}
+
+	writeq(control, ((u8 __iomem *)cluster_info->cluster_base + UNCORE_CONTROL_INDEX));
+}
+
+/* Callback for sysfs write for max/min frequencies. Called under mutex locks */
+static int uncore_write_control_freq(struct uncore_data *data, unsigned int input,
+				     unsigned int min_max)
+{
+	struct tpmi_uncore_cluster_info *cluster_info;
+	struct tpmi_uncore_struct *uncore_root;
+	int i;
+
+	input /= UNCORE_FREQ_KHZ_MULTIPLIER;
+	if (!input || input > UNCORE_MAX_RATIO)
+		return -EINVAL;
+
+	cluster_info = container_of(data, struct tpmi_uncore_cluster_info, uncore_data);
+	uncore_root = cluster_info->uncore_root;
+
+	/* Update each cluster in a package */
+	for (i = 0; i < uncore_root->power_domain_count; ++i) {
+		int j;
+
+		for (j = 0; j < uncore_root->pd_info[i].cluster_count; ++j)
+			write_control_freq(&uncore_root->pd_info[i].cluster_infos[j],
+					   input, min_max);
+	}
+
+	return 0;
+}
+
+/* Callback for sysfs read for the current uncore frequency. Called under mutex locks */
+static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
+{
+	return -ENODATA;
+}
+
+#define UNCORE_GENMASK_VERSION			GENMASK_ULL(7, 0)
+#define UNCORE_LOCAL_FABRIC_CLUSTER_ID_MASK	GENMASK_ULL(15, 8)
+#define UNCORE_CLUSTER_OFF_MASK			GENMASK_ULL(7, 0)
+#define UNCORE_MAX_CLUSTER_PER_DOMAIN		8
+
+static int tpmi_uncore_init(struct auxiliary_device *auxdev)
+{
+	struct intel_tpmi_plat_info *plat_info;
+	struct tpmi_uncore_struct *tpmi_uncore;
+	int ret, i, pkg = 0;
+	int num_resources;
+
+	/* Get number of power domains, which is equal to number of resources */
+	num_resources = tpmi_get_resource_count(auxdev);
+	if (!num_resources)
+		return -EINVAL;
+
+	/* Register callbacks to uncore core */
+	ret = uncore_freq_common_init(uncore_read_control_freq, uncore_write_control_freq,
+				      uncore_read_freq);
+	if (ret)
+		return ret;
+
+	/* Allocate uncore instance per package */
+	tpmi_uncore = devm_kzalloc(&auxdev->dev, sizeof(*tpmi_uncore), GFP_KERNEL);
+	if (!tpmi_uncore) {
+		ret = -ENOMEM;
+		goto err_rem_common;
+	}
+
+	/* Allocate memory for all power domains in a package */
+	tpmi_uncore->pd_info = devm_kcalloc(&auxdev->dev, num_resources,
+					    sizeof(*tpmi_uncore->pd_info),
+					    GFP_KERNEL);
+	if (!tpmi_uncore->pd_info) {
+		ret = -ENOMEM;
+		goto err_rem_common;
+	}
+
+	tpmi_uncore->power_domain_count = num_resources;
+
+	/* Get the package ID from the TPMI core */
+	plat_info = tpmi_get_platform_data(auxdev);
+	if (plat_info)
+		pkg = plat_info->package_id;
+
+	for (i = 0; i < num_resources; ++i) {
+		struct tpmi_uncore_power_domain_info *pd_info;
+		struct resource *res;
+		u64 cluster_offset;
+		u8 cluster_mask;
+		int mask, j;
+		u64 header;
+
+		res = tpmi_get_resource_at_index(auxdev, i);
+		if (!res)
+			continue;
+
+		pd_info = &tpmi_uncore->pd_info[i];
+
+		pd_info->uncore_base = devm_ioremap_resource(&auxdev->dev, res);
+		if (IS_ERR(pd_info->uncore_base)) {
+			ret = PTR_ERR(pd_info->uncore_base);
+			pd_info->uncore_base = NULL;
+			goto err_rem_common;
+		}
+
+		/* Check for version and skip this resource if there is mismatch */
+		header = readq(pd_info->uncore_base);
+		pd_info->ufs_header_ver = header & UNCORE_GENMASK_VERSION;
+		if (pd_info->ufs_header_ver != UNCORE_HEADER_VERSION) {
+			dev_info(&auxdev->dev, "Uncore: Unsupported version:%d\n",
+				pd_info->ufs_header_ver);
+			continue;
+		}
+
+		/* Get Cluster ID Mask */
+		cluster_mask = FIELD_GET(UNCORE_LOCAL_FABRIC_CLUSTER_ID_MASK, header);
+		if (!cluster_mask) {
+			dev_info(&auxdev->dev, "Uncore: Invalid cluster mask:%x\n", cluster_mask);
+			continue;
+		}
+
+		/* Find out number of clusters in this resource */
+		mask = 0x01;
+		for (j = 0; j < UNCORE_MAX_CLUSTER_PER_DOMAIN; ++j) {
+			if (cluster_mask & mask)
+				pd_info->cluster_count++;
+			mask <<= 1;
+		}
+
+		pd_info->cluster_infos = devm_kcalloc(&auxdev->dev, pd_info->cluster_count,
+						      sizeof(struct tpmi_uncore_cluster_info),
+						      GFP_KERNEL);
+
+		/*
+		 * Each byte in the register point to status and control
+		 * registers belonging to cluster id 0-8.
+		 */
+		cluster_offset = readq((u8 __iomem *)pd_info->uncore_base +
+					UNCORE_FABRIC_CLUSTER_OFFSET);
+
+		for (j = 0; j < pd_info->cluster_count; ++j) {
+			struct tpmi_uncore_cluster_info *cluster_info;
+
+			/* Get the offset for this cluster */
+			mask = (cluster_offset & UNCORE_CLUSTER_OFF_MASK);
+			/* Offset in QWORD, so change to bytes */
+			mask <<= 3;
+
+			cluster_info = &pd_info->cluster_infos[j];
+
+			cluster_info->cluster_base = (u8 __iomem *)pd_info->uncore_base + mask;
+
+			cluster_info->uncore_data.package_id = pkg;
+			/* There are no dies like Cascade Lake */
+			cluster_info->uncore_data.die_id = 0;
+
+			/* Point to next cluster offset */
+			cluster_offset >>= UNCORE_MAX_CLUSTER_PER_DOMAIN;
+		}
+	}
+
+	auxiliary_set_drvdata(auxdev, tpmi_uncore);
+
+	tpmi_uncore->root_cluster.uncore_root = tpmi_uncore;
+	tpmi_uncore->root_cluster.uncore_data.package_id = pkg;
+	ret = uncore_freq_add_entry(&tpmi_uncore->root_cluster.uncore_data, 0);
+	if (ret)
+		goto err_rem_common;
+
+	return 0;
+
+err_rem_common:
+	uncore_freq_common_exit();
+
+	return ret;
+}
+
+static int tpmi_uncore_remove(struct auxiliary_device *auxdev)
+{
+	struct tpmi_uncore_struct *tpmi_uncore = auxiliary_get_drvdata(auxdev);
+
+	uncore_freq_remove_die_entry(&tpmi_uncore->root_cluster.uncore_data);
+
+	uncore_freq_common_exit();
+
+	return 0;
+}
+
+static int intel_uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
+{
+	return tpmi_uncore_init(auxdev);
+}
+
+static void intel_uncore_remove(struct auxiliary_device *auxdev)
+{
+	tpmi_uncore_remove(auxdev);
+}
+
+static const struct auxiliary_device_id intel_uncore_id_table[] = {
+	{ .name = "intel_vsec.tpmi-uncore" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, intel_uncore_id_table);
+
+static struct auxiliary_driver intel_uncore_aux_driver = {
+	.id_table       = intel_uncore_id_table,
+	.remove         = intel_uncore_remove,
+	.probe          = intel_uncore_probe,
+};
+
+module_auxiliary_driver(intel_uncore_aux_driver);
+
+MODULE_IMPORT_NS(INTEL_TPMI);
+MODULE_IMPORT_NS(INTEL_UNCORE_FREQUENCY);
+MODULE_DESCRIPTION("Intel TPMI UFS Driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1


Return-Path: <platform-driver-x86+bounces-13182-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80DAF6803
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Jul 2025 04:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC1D4E412F
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Jul 2025 02:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9072367DA;
	Thu,  3 Jul 2025 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9tfXlgH"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F11822DA1B;
	Thu,  3 Jul 2025 02:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509729; cv=none; b=ohB+4mD1z2uHEfpDaRvnr8B210jik+lrLIcQOHyn7gQD0N76W5HTN9ActuZxMosfw1W1hK2cbVoVMoxLPlIvbClackZd/EtOXwkHcJmKMM/Yd8g22A74WtrfYqdoOP7u20OPz8kR7cB07ObRdh4qfpUWKuZyj3S0jmrTcIZ6TTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509729; c=relaxed/simple;
	bh=BNqtThQeA2nN6bse9YWstamqwCYkpVgaBLMtnknL77c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwyuO1Ik6AH/YsTViiEWAJI05kys3JMIvbFQnXW+m6t0Wik9zlfKM2j9yZ//ORFTPFNnQQTh2+bhB59uPaY1cUITLe20f7YwOsenTnA8vg2SkILXGTAuJ/hS5Z0nFT/BFBV/dE3ol+vKyPSRE8l79uRwzuHwyT8PwJU6kjfUSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9tfXlgH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509727; x=1783045727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BNqtThQeA2nN6bse9YWstamqwCYkpVgaBLMtnknL77c=;
  b=Y9tfXlgHXZiIfLwNUuaNuLEilfinwH9B0qR+oEmte+ZDDv3kSgS1gYLY
   JjWbrqzZfBhmI7ZGnj0yaSFgTxRB3lVo1LWJ70wyfIdJ3K03w1Cv9rKwh
   PjrELCPNJkRgg+8jxtNY1DXORqXQz1HBN6LN2vVBG10VEQoaBwnhy/beE
   K31yS3+6CaZLbh8tgZK5uOnplj9Bnau1P4mUpXSiVTS416v73OhbOQClD
   eDy9YEQzY7lz33hynM2KmUEUxiop6LzEqcxbhEtDgAZTZBK1FCXtmDeHl
   YvM/F5Wl0Frn2lsyZ1Saby4ZmVMGG3A/2h4vxLVFxmkWp8T5lkLD1bQpz
   g==;
X-CSE-ConnectionGUID: bdlPKBEpT+mYHnXWDUBGig==
X-CSE-MsgGUID: 8Mb2ipPyTf+gVS6h37qvHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450249"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:44 -0700
X-CSE-ConnectionGUID: /0sPT9/6TQyRk0OQcvncJw==
X-CSE-MsgGUID: dDGz+5hVR3KP6Yul+Xh3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594066"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:43 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH V3 10/15] platform/x86/intel/tpmi: Relocate platform info to intel_vsec.h
Date: Wed,  2 Jul 2025 19:28:25 -0700
Message-ID: <20250703022832.1302928-11-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703022832.1302928-1-david.e.box@linux.intel.com>
References: <20250703022832.1302928-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The TPMI platform information provides a mapping of OOBMSM PCI devices to
logical CPUs. Since this mapping is consistent across all OOBMSM features
(e.g., TPMI, PMT, SDSi), it can be leveraged by multiple drivers. To
facilitate reuse, relocate the struct intel_tpmi_plat_info to intel_vsec.h,
renaming it to struct oobmsm_plat_info, making it accessible to other
features. While modifying headers, place them in alphabetical order.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---

Changes in v3:
  - No changes

Changes in v2:
  - Add change for uncore-frequency-tmpi 6.16-rc1
  - In intel_tpmi.h add newline after headers
=20=20
 drivers/platform/x86/intel/plr_tpmi.c         |  3 ++-
 .../intel/speed_select_if/isst_tpmi_core.c    |  9 ++++---
 .../uncore-frequency/uncore-frequency-tpmi.c  |  7 ++---
 drivers/platform/x86/intel/vsec_tpmi.c        |  4 +--
 drivers/powercap/intel_rapl_tpmi.c            |  9 ++++---
 include/linux/intel_tpmi.h                    | 27 +++----------------
 include/linux/intel_vsec.h                    | 22 +++++++++++++++
 7 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/intel/plr_tpmi.c b/drivers/platform/x86/i=
ntel/plr_tpmi.c
index 2b55347a5a93..58132da47745 100644
--- a/drivers/platform/x86/intel/plr_tpmi.c
+++ b/drivers/platform/x86/intel/plr_tpmi.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/gfp_types.h>
 #include <linux/intel_tpmi.h>
+#include <linux/intel_vsec.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kstrtox.h>
@@ -256,7 +257,7 @@ DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
=20
 static int intel_plr_probe(struct auxiliary_device *auxdev, const struct a=
uxiliary_device_id *id)
 {
-	struct intel_tpmi_plat_info *plat_info;
+	struct oobmsm_plat_info *plat_info;
 	struct dentry *dentry;
 	int i, num_resources;
 	struct resource *res;
diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/=
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 18c035710eb9..34bff2f65a83 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -22,6 +22,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/delay.h>
 #include <linux/intel_tpmi.h>
+#include <linux/intel_vsec.h>
 #include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -1546,7 +1547,7 @@ int tpmi_sst_dev_add(struct auxiliary_device *auxdev)
 {
 	struct tpmi_per_power_domain_info *pd_info;
 	bool read_blocked =3D 0, write_blocked =3D 0;
-	struct intel_tpmi_plat_info *plat_info;
+	struct oobmsm_plat_info *plat_info;
 	struct device *dev =3D &auxdev->dev;
 	struct tpmi_sst_struct *tpmi_sst;
 	u8 i, num_resources, io_die_cnt;
@@ -1698,7 +1699,7 @@ EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_add, "INTEL_TPMI_SS=
T");
 void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
 {
 	struct tpmi_sst_struct *tpmi_sst =3D auxiliary_get_drvdata(auxdev);
-	struct intel_tpmi_plat_info *plat_info;
+	struct oobmsm_plat_info *plat_info;
=20
 	plat_info =3D tpmi_get_platform_data(auxdev);
 	if (!plat_info)
@@ -1720,7 +1721,7 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *au=
xdev)
 {
 	struct tpmi_sst_struct *tpmi_sst =3D auxiliary_get_drvdata(auxdev);
 	struct tpmi_per_power_domain_info *power_domain_info;
-	struct intel_tpmi_plat_info *plat_info;
+	struct oobmsm_plat_info *plat_info;
 	void __iomem *cp_base;
=20
 	plat_info =3D tpmi_get_platform_data(auxdev);
@@ -1748,7 +1749,7 @@ void tpmi_sst_dev_resume(struct auxiliary_device *aux=
dev)
 {
 	struct tpmi_sst_struct *tpmi_sst =3D auxiliary_get_drvdata(auxdev);
 	struct tpmi_per_power_domain_info *power_domain_info;
-	struct intel_tpmi_plat_info *plat_info;
+	struct oobmsm_plat_info *plat_info;
 	void __iomem *cp_base;
=20
 	plat_info =3D tpmi_get_platform_data(auxdev);
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-t=
pmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 44d9948ed224..6df55c8e16b7 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -22,9 +22,10 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/intel_tpmi.h>
+#include <linux/intel_vsec.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/intel_tpmi.h>
=20
 #include "../tpmi_power_domains.h"
 #include "uncore-frequency-common.h"
@@ -448,7 +449,7 @@ static void remove_cluster_entries(struct tpmi_uncore_s=
truct *tpmi_uncore)
 }
=20
 static void set_cdie_id(int domain_id, struct tpmi_uncore_cluster_info *cl=
uster_info,
-		       struct intel_tpmi_plat_info *plat_info)
+			struct oobmsm_plat_info *plat_info)
 {
=20
 	cluster_info->cdie_id =3D domain_id;
@@ -465,7 +466,7 @@ static void set_cdie_id(int domain_id, struct tpmi_unco=
re_cluster_info *cluster_
 static int uncore_probe(struct auxiliary_device *auxdev, const struct auxi=
liary_device_id *id)
 {
 	bool read_blocked =3D 0, write_blocked =3D 0;
-	struct intel_tpmi_plat_info *plat_info;
+	struct oobmsm_plat_info *plat_info;
 	struct tpmi_uncore_struct *tpmi_uncore;
 	bool uncore_sysfs_added =3D false;
 	int ret, i, pkg =3D 0;
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/=
intel/vsec_tpmi.c
index 5c383a27bbe8..d95a0d994546 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -116,7 +116,7 @@ struct intel_tpmi_info {
 	struct intel_vsec_device *vsec_dev;
 	int feature_count;
 	u64 pfs_start;
-	struct intel_tpmi_plat_info plat_info;
+	struct oobmsm_plat_info plat_info;
 	void __iomem *tpmi_control_mem;
 	struct dentry *dbgfs_dir;
 };
@@ -187,7 +187,7 @@ struct tpmi_feature_state {
 /* Used during auxbus device creation */
 static DEFINE_IDA(intel_vsec_tpmi_ida);
=20
-struct intel_tpmi_plat_info *tpmi_get_platform_data(struct auxiliary_devic=
e *auxdev)
+struct oobmsm_plat_info *tpmi_get_platform_data(struct auxiliary_device *a=
uxdev)
 {
 	struct intel_vsec_device *vsec_dev =3D auxdev_to_ivdev(auxdev);
=20
diff --git a/drivers/powercap/intel_rapl_tpmi.c b/drivers/powercap/intel_ra=
pl_tpmi.c
index af2368f4db10..82201bf4685d 100644
--- a/drivers/powercap/intel_rapl_tpmi.c
+++ b/drivers/powercap/intel_rapl_tpmi.c
@@ -9,9 +9,10 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
 #include <linux/auxiliary_bus.h>
-#include <linux/io.h>
-#include <linux/intel_tpmi.h>
 #include <linux/intel_rapl.h>
+#include <linux/intel_tpmi.h>
+#include <linux/intel_vsec.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/slab.h>
=20
@@ -48,7 +49,7 @@ enum tpmi_rapl_register {
=20
 struct tpmi_rapl_package {
 	struct rapl_if_priv priv;
-	struct intel_tpmi_plat_info *tpmi_info;
+	struct oobmsm_plat_info *tpmi_info;
 	struct rapl_package *rp;
 	void __iomem *base;
 	struct list_head node;
@@ -253,7 +254,7 @@ static int intel_rapl_tpmi_probe(struct auxiliary_devic=
e *auxdev,
 				 const struct auxiliary_device_id *id)
 {
 	struct tpmi_rapl_package *trp;
-	struct intel_tpmi_plat_info *info;
+	struct oobmsm_plat_info *info;
 	struct resource *res;
 	u32 offset;
 	int ret;
diff --git a/include/linux/intel_tpmi.h b/include/linux/intel_tpmi.h
index ff480b47ae64..94c06bf214fb 100644
--- a/include/linux/intel_tpmi.h
+++ b/include/linux/intel_tpmi.h
@@ -8,6 +8,8 @@
=20
 #include <linux/bitfield.h>
=20
+struct oobmsm_plat_info;
+
 #define TPMI_VERSION_INVALID	0xff
 #define TPMI_MINOR_VERSION(val)	FIELD_GET(GENMASK(4, 0), val)
 #define TPMI_MAJOR_VERSION(val)	FIELD_GET(GENMASK(7, 5), val)
@@ -26,30 +28,7 @@ enum intel_tpmi_id {
 	TPMI_INFO_ID =3D 0x81,	/* Special ID for PCI BDF and Package ID informati=
on */
 };
=20
-/**
- * struct intel_tpmi_plat_info - Platform information for a TPMI device in=
stance
- * @cdie_mask:       Mask of all compute dies in the partition
- * @package_id:      CPU Package id
- * @partition:       Package partition id when multiple VSEC PCI devices p=
er package
- * @segment:         PCI segment ID
- * @bus_number:      PCI bus number
- * @device_number:   PCI device number
- * @function_number: PCI function number
- *
- * Structure to store platform data for a TPMI device instance. This
- * struct is used to return data via tpmi_get_platform_data().
- */
-struct intel_tpmi_plat_info {
-	u16 cdie_mask;
-	u8 package_id;
-	u8 partition;
-	u8 segment;
-	u8 bus_number;
-	u8 device_number;
-	u8 function_number;
-};
-
-struct intel_tpmi_plat_info *tpmi_get_platform_data(struct auxiliary_devic=
e *auxdev);
+struct oobmsm_plat_info *tpmi_get_platform_data(struct auxiliary_device *a=
uxdev);
 struct resource *tpmi_get_resource_at_index(struct auxiliary_device *auxde=
v, int index);
 int tpmi_get_resource_count(struct auxiliary_device *auxdev);
 int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_i=
d, bool *read_blocked,
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index a07796d7d43b..cd78d0b2e623 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -144,6 +144,28 @@ struct intel_vsec_device {
 	unsigned long cap_id;
 };
=20
+/**
+ * struct oobmsm_plat_info - Platform information for a device instance
+ * @cdie_mask:       Mask of all compute dies in the partition
+ * @package_id:      CPU Package id
+ * @partition:       Package partition id when multiple VSEC PCI devices p=
er package
+ * @segment:         PCI segment ID
+ * @bus_number:      PCI bus number
+ * @device_number:   PCI device number
+ * @function_number: PCI function number
+ *
+ * Structure to store platform data for a OOBMSM device instance.
+ */
+struct oobmsm_plat_info {
+	u16 cdie_mask;
+	u8 package_id;
+	u8 partition;
+	u8 segment;
+	u8 bus_number;
+	u8 device_number;
+	u8 function_number;
+};
+
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name);
--=20
2.43.0



Return-Path: <platform-driver-x86+bounces-13176-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E2AF67FA
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Jul 2025 04:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4111C4A8289
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Jul 2025 02:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564E9226888;
	Thu,  3 Jul 2025 02:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXYsWB4M"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C2D21ADB5;
	Thu,  3 Jul 2025 02:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509725; cv=none; b=g2rwpwm0eT/fFZGIyYUyANtscCwZY4Hra652yBFY0QTsedxkXiXY9Be9/IrqqOR1RVFbKQ50DEyzBpZY7wvmclZod+Gpmq0NJWcJ4N7NnUVZycFaZ9EfR7c01rIjzYiHTb91GKlJLfoV2PNFZ+tvAB6I3Qfjo9/WFbphGSBPQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509725; c=relaxed/simple;
	bh=sDApYRjIB8PGWucKDPjzJJG7uNBTQS6NfE/qRGZDFFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1wzzAIcvPyASthvBilkBlwDxRk/RuO49pgY7F/IkX3o6K74L+7ul/4iSxewdYo4Lda0KYNNgA/wUTeXlFvpt1Xy3n8ferNfL+YECS/l14FLiJyutaHZxNRu6kmQZGWZwVI+5D5O4ZOKyEV/zGfguSozDI0eTKp6uZ+MFS016Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXYsWB4M; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509723; x=1783045723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sDApYRjIB8PGWucKDPjzJJG7uNBTQS6NfE/qRGZDFFg=;
  b=jXYsWB4MS9ElWGIV67F6yWE8Is6cychcw19c3IZBhaG9+RB1Kf9bh37I
   OTE2qGHDTYUosh2+9TdR72RgHZkkGvlhpOT8fMkniv5yuSd5+VRNp70/r
   5Oegd8npl5TOEEB15PNOCerxsifWsD8wcSLPLzyhJIsqRzU2xDJD61ZOr
   5UWuab85mQFuUh/LBUoxRnnyIYjbinnbfcw4opq0X75TQ0SB5B+T2aPbp
   bZYF8gxjPUTBvEEh82sbS1iTtfSGMhfAk8yeaf3oBYYtErM8FMn5pHXHZ
   fk/9fY8dWiIvqRn4bUZQSZqUj6/Hzq5d/ZGCgqcRuwzhjcDJwChZ+op0F
   A==;
X-CSE-ConnectionGUID: ffKc0IitQSSYzRZA56yWVw==
X-CSE-MsgGUID: ejcgb312QvacZ80IzZW+dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450235"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450235"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:41 -0700
X-CSE-ConnectionGUID: YtxDApS5RdiZZHlg6zfcqg==
X-CSE-MsgGUID: YQaMhHyQSe6H+aHQuNKn8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594028"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:40 -0700
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
Subject: [PATCH V3 04/15] platform/x86/intel/vsec: Add device links to enforce dependencies
Date: Wed,  2 Jul 2025 19:28:19 -0700
Message-ID: <20250703022832.1302928-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703022832.1302928-1-david.e.box@linux.intel.com>
References: <20250703022832.1302928-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

New Intel VSEC features will have dependencies on other features, requiring
certain supplier drivers to be probed before their consumers. To enforce
this dependency ordering, introduce device links using device_link_add(),
ensuring that suppliers are fully registered before consumers are probed.

- Add device link tracking by storing supplier devices and tracking their
  state.
- Implement intel_vsec_link_devices() to establish links between suppliers
  and consumers based on feature dependencies.
- Add get_consumer_dependencies() to retrieve supplier-consumer
  relationships.
- Modify feature registration logic:
  * Consumers now check that all required suppliers are registered before
    being initialized.
  * suppliers_ready() verifies that all required supplier devices are
    available.
- Prevent potential null consumer name issue in sysfs:
  - Use dev_set_name() when creating auxiliary devices to ensure a
    unique, non-null consumer name.
- Update intel_vsec_pci_probe() to loop up to the number of possible
  features or when all devices are registered, whichever comes first.
- Introduce VSEC_CAP_UNUSED to prevent sub-features (registered via
  exported APIs) from being mistakenly linked.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - In suppliers_ready() add WARN_ON_ONCE on feature check. Also include
    bug.h
  - Add found_any bool to check the return value from
    intel_vsec_get_features() and return -ENODEV if none were ever
    found.

Changes in v2:
  - Simplify dependency search in get_consumer_dependencies() per comments
    from Ilpo.
  - Add rollback for auxiliary_device_uninit() in intel_vsec_add_aux().
  - In suppliers_ready() clarify that for_each_set_bit() is searching for
    all *ready* suppliers, not all suppliers. If any is not ready and not
    ignored, it immediately returns.
  - In suppliers_ready() check device_link_add() return status.
  - In intel_vsec_probe() uses info->caps consistently.
  - Fix spelling errors and remove unrelated changes.

 drivers/platform/x86/intel/vsec.c | 223 ++++++++++++++++++++++++++++--
 include/linux/intel_vsec.h        |  28 +++-
 2 files changed, 236 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 8bdb74d86f24..aa1f7e63039d 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -15,9 +15,12 @@
=20
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
+#include <linux/bitops.h>
+#include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/idr.h>
+#include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -32,8 +35,17 @@ static DEFINE_IDA(intel_vsec_ida);
 static DEFINE_IDA(intel_vsec_sdsi_ida);
 static DEFINE_XARRAY_ALLOC(auxdev_array);
=20
+enum vsec_device_state {
+	STATE_NOT_FOUND,
+	STATE_REGISTERED,
+	STATE_SKIP,
+};
+
 struct vsec_priv {
 	struct intel_vsec_platform_info *info;
+	struct device *suppliers[VSEC_FEATURE_COUNT];
+	enum vsec_device_state state[VSEC_FEATURE_COUNT];
+	unsigned long found_caps;
 };
=20
 static const char *intel_vsec_name(enum intel_vsec_id id)
@@ -95,6 +107,74 @@ static void intel_vsec_dev_release(struct device *dev)
 	kfree(intel_vsec_dev);
 }
=20
+static const struct vsec_feature_dependency *
+get_consumer_dependencies(struct vsec_priv *priv, int cap_id)
+{
+	const struct vsec_feature_dependency *deps =3D priv->info->deps;
+	int consumer_id =3D priv->info->num_deps;
+
+	if (!deps)
+		return NULL;
+
+	while (consumer_id--)
+		if (deps[consumer_id].feature =3D=3D BIT(cap_id))
+			return &deps[consumer_id];
+
+	return NULL;
+}
+
+/*
+ * Although pci_device_id table is available in the pdev, this prototype is
+ * necessary because the code using it can be called by an exported API th=
at
+ * might pass a different pdev.
+ */
+static const struct pci_device_id intel_vsec_pci_ids[];
+
+static int intel_vsec_link_devices(struct pci_dev *pdev, struct device *de=
v,
+				   int consumer_id)
+{
+	const struct vsec_feature_dependency *deps;
+	enum vsec_device_state *state;
+	struct device **suppliers;
+	struct vsec_priv *priv;
+	int supplier_id;
+
+	if (!consumer_id)
+		return 0;
+
+	if (!pci_match_id(intel_vsec_pci_ids, pdev))
+		return 0;
+
+	priv =3D pci_get_drvdata(pdev);
+	state =3D priv->state;
+	suppliers =3D priv->suppliers;
+
+	priv->suppliers[consumer_id] =3D dev;
+
+	deps =3D get_consumer_dependencies(priv, consumer_id);
+	if (!deps)
+		return 0;
+
+	for_each_set_bit(supplier_id, &deps->supplier_bitmap, VSEC_FEATURE_COUNT)=
 {
+		struct device_link *link;
+
+		if (state[supplier_id] !=3D STATE_REGISTERED)
+			continue;
+
+		if (!suppliers[supplier_id]) {
+			dev_err(dev, "Bad supplier list\n");
+			return -EINVAL;
+		}
+
+		link =3D device_link_add(dev, suppliers[supplier_id],
+				       DL_FLAG_AUTOPROBE_CONSUMER);
+		if (!link)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name)
@@ -132,19 +212,37 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct d=
evice *parent,
 		return ret;
 	}
=20
+	/*
+	 * Assign a name now to ensure that the device link doesn't contain
+	 * a null string for the consumer name. This is a problem when a supplier
+	 * supplies more than one consumer and can lead to a duplicate name error
+	 * when the link is created in sysfs.
+	 */
+	ret =3D dev_set_name(&auxdev->dev, "%s.%s.%d", KBUILD_MODNAME, auxdev->na=
me,
+			   auxdev->id);
+	if (ret)
+		goto cleanup_aux;
+
+	ret =3D intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->cap_i=
d);
+	if (ret)
+		goto cleanup_aux;
+
 	ret =3D auxiliary_device_add(auxdev);
-	if (ret < 0) {
-		auxiliary_device_uninit(auxdev);
-		return ret;
-	}
+	if (ret)
+		goto cleanup_aux;
=20
 	return devm_add_action_or_reset(parent, intel_vsec_remove_aux,
 				       auxdev);
+
+cleanup_aux:
+	auxiliary_device_uninit(auxdev);
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
=20
 static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_head=
er *header,
-			      struct intel_vsec_platform_info *info)
+			      struct intel_vsec_platform_info *info,
+			      unsigned long cap_id)
 {
 	struct intel_vsec_device __free(kfree) *intel_vsec_dev =3D NULL;
 	struct resource __free(kfree) *res =3D NULL;
@@ -211,6 +309,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, str=
uct intel_vsec_header *he
 	intel_vsec_dev->quirks =3D info->quirks;
 	intel_vsec_dev->base_addr =3D info->base_addr;
 	intel_vsec_dev->priv_data =3D info->priv_data;
+	intel_vsec_dev->cap_id =3D cap_id;
=20
 	if (header->id =3D=3D VSEC_ID_SDSI)
 		intel_vsec_dev->ida =3D &intel_vsec_sdsi_ida;
@@ -225,6 +324,101 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, s=
truct intel_vsec_header *he
 				  intel_vsec_name(header->id));
 }
=20
+static bool suppliers_ready(struct vsec_priv *priv,
+			    const struct vsec_feature_dependency *consumer_deps,
+			    int cap_id)
+{
+	enum vsec_device_state *state =3D priv->state;
+	int supplier_id;
+
+	if (WARN_ON_ONCE(consumer_deps->feature !=3D BIT(cap_id)))
+		return false;
+
+	/*
+	 * Verify that all required suppliers have been found. Return false
+	 * immediately if any are still missing.
+	 */
+	for_each_set_bit(supplier_id, &consumer_deps->supplier_bitmap, VSEC_FEATU=
RE_COUNT) {
+		if (state[supplier_id] =3D=3D STATE_SKIP)
+			continue;
+
+		if (state[supplier_id] =3D=3D STATE_NOT_FOUND)
+			return false;
+	}
+
+	/*
+	 * All suppliers have been found and the consumer is ready to be
+	 * registered.
+	 */
+	return true;
+}
+
+static int get_cap_id(u32 header_id, unsigned long *cap_id)
+{
+	switch (header_id) {
+	case VSEC_ID_TELEMETRY:
+		*cap_id =3D ilog2(VSEC_CAP_TELEMETRY);
+		break;
+	case VSEC_ID_WATCHER:
+		*cap_id =3D ilog2(VSEC_CAP_WATCHER);
+		break;
+	case VSEC_ID_CRASHLOG:
+		*cap_id =3D ilog2(VSEC_CAP_CRASHLOG);
+		break;
+	case VSEC_ID_SDSI:
+		*cap_id =3D ilog2(VSEC_CAP_SDSI);
+		break;
+	case VSEC_ID_TPMI:
+		*cap_id =3D ilog2(VSEC_CAP_TPMI);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int intel_vsec_register_device(struct pci_dev *pdev,
+				      struct intel_vsec_header *header,
+				      struct intel_vsec_platform_info *info)
+{
+	const struct vsec_feature_dependency *consumer_deps;
+	struct vsec_priv *priv;
+	unsigned long cap_id;
+	int ret;
+
+	ret =3D get_cap_id(header->id, &cap_id);
+	if (ret)
+		return ret;
+
+	/*
+	 * Only track dependencies for devices probed by the VSEC driver.
+	 * For others using the exported APIs, add the device directly.
+	 */
+	if (!pci_match_id(intel_vsec_pci_ids, pdev))
+		return intel_vsec_add_dev(pdev, header, info, cap_id);
+
+	priv =3D pci_get_drvdata(pdev);
+	if (priv->state[cap_id] =3D=3D STATE_REGISTERED ||
+	    priv->state[cap_id] =3D=3D STATE_SKIP)
+		return -EEXIST;
+
+	priv->found_caps |=3D BIT(cap_id);
+
+	consumer_deps =3D get_consumer_dependencies(priv, cap_id);
+	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
+		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id);
+		if (ret)
+			priv->state[cap_id] =3D STATE_SKIP;
+		else
+			priv->state[cap_id] =3D STATE_REGISTERED;
+
+		return ret;
+	}
+
+	return -EAGAIN;
+}
+
 static bool intel_vsec_walk_header(struct pci_dev *pdev,
 				   struct intel_vsec_platform_info *info)
 {
@@ -233,7 +427,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
 	int ret;
=20
 	for ( ; *header; header++) {
-		ret =3D intel_vsec_add_dev(pdev, *header, info);
+		ret =3D intel_vsec_register_device(pdev, *header, info);
 		if (!ret)
 			have_devices =3D true;
 	}
@@ -281,7 +475,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
 		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
 		header.id =3D PCI_DVSEC_HEADER2_ID(hdr);
=20
-		ret =3D intel_vsec_add_dev(pdev, &header, info);
+		ret =3D intel_vsec_register_device(pdev, &header, info);
 		if (ret)
 			continue;
=20
@@ -326,7 +520,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 		header.tbir =3D INTEL_DVSEC_TABLE_BAR(table);
 		header.offset =3D INTEL_DVSEC_TABLE_OFFSET(table);
=20
-		ret =3D intel_vsec_add_dev(pdev, &header, info);
+		ret =3D intel_vsec_register_device(pdev, &header, info);
 		if (ret)
 			continue;
=20
@@ -378,7 +572,8 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id
 {
 	struct intel_vsec_platform_info *info;
 	struct vsec_priv *priv;
-	int ret;
+	int num_caps, ret;
+	bool found_any =3D false;
=20
 	ret =3D pcim_enable_device(pdev);
 	if (ret)
@@ -396,7 +591,15 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
 	priv->info =3D info;
 	pci_set_drvdata(pdev, priv);
=20
-	if (!intel_vsec_get_features(pdev, info))
+	num_caps =3D hweight_long(info->caps);
+	while (num_caps--) {
+		found_any |=3D intel_vsec_get_features(pdev, info);
+
+		if (priv->found_caps =3D=3D info->caps)
+			break;
+	}
+
+	if (!found_any)
 		return -ENODEV;
=20
 	return 0;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index bc95821f1bfb..71067afaca99 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -5,11 +5,18 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
=20
-#define VSEC_CAP_TELEMETRY	BIT(0)
-#define VSEC_CAP_WATCHER	BIT(1)
-#define VSEC_CAP_CRASHLOG	BIT(2)
-#define VSEC_CAP_SDSI		BIT(3)
-#define VSEC_CAP_TPMI		BIT(4)
+/*
+ * VSEC_CAP_UNUSED is reserved. It exists to prevent zero initialized
+ * intel_vsec devices from being automatically set to a known
+ * capability with ID 0
+ */
+#define VSEC_CAP_UNUSED		BIT(0)
+#define VSEC_CAP_TELEMETRY	BIT(1)
+#define VSEC_CAP_WATCHER	BIT(2)
+#define VSEC_CAP_CRASHLOG	BIT(3)
+#define VSEC_CAP_SDSI		BIT(4)
+#define VSEC_CAP_TPMI		BIT(5)
+#define VSEC_FEATURE_COUNT	6
=20
 /* Intel DVSEC offsets */
 #define INTEL_DVSEC_ENTRIES		0xA
@@ -81,22 +88,31 @@ struct pmt_callbacks {
 	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, =
u32 count);
 };
=20
+struct vsec_feature_dependency {
+	unsigned long feature;
+	unsigned long supplier_bitmap;
+};
+
 /**
  * struct intel_vsec_platform_info - Platform specific data
  * @parent:    parent device in the auxbus chain
  * @headers:   list of headers to define the PMT client devices to create
+ * @deps:      array of feature dependencies
  * @priv_data: private data, usable by parent devices, currently a callback
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
  * @base_addr: allow a base address to be specified (rather than derived)
+ * @num_deps:  Count feature dependencies
  */
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
+	const struct vsec_feature_dependency *deps;
 	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
+	int num_deps;
 };
=20
 /**
@@ -110,6 +126,7 @@ struct intel_vsec_platform_info {
  * @priv_data:     any private data needed
  * @quirks:        specified quirks
  * @base_addr:     base address of entries (if specified)
+ * @cap_id:        the enumerated id of the vsec feature
  */
 struct intel_vsec_device {
 	struct auxiliary_device auxdev;
@@ -122,6 +139,7 @@ struct intel_vsec_device {
 	size_t priv_data_size;
 	unsigned long quirks;
 	u64 base_addr;
+	unsigned long cap_id;
 };
=20
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
--=20
2.43.0



Return-Path: <platform-driver-x86+bounces-11701-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E1AA569D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 30 Apr 2025 23:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D71537AF589
	for <lists+platform-driver-x86@lfdr.de>; Wed, 30 Apr 2025 21:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B892C3759;
	Wed, 30 Apr 2025 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTCPkUQq"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FBF299508;
	Wed, 30 Apr 2025 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048080; cv=none; b=bxpzw5SyGBBLag1SVsXnWh7MxxinN4hR3DWsG6SfVQsl7ifXhL/i1NZ6sv5hipHxM3mSwnN6jEdemAjn6cvmdTaPZyWI8HbVdUkfpKW9umcPezVWep5MS80iIqVEZSGrXGpVUdBIibi1CbzbvMGpj+PkYY6H/O3Q6zeQ/3tvbYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048080; c=relaxed/simple;
	bh=O/ffrRkZfGAa8NXehArzvtm64EJeuW4/i9o72KLq2SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGIeVYamnNvK6QaeC412so+4p35N0N/EpHkM/8wRk7CBirUpEPV+hL/02m+SBBIEgx9nuJ8TmnZWDLWZfmNmHhJmZr9Dnv1netwm/Y42bO3l1kLBh6HT9HDwabjmNHmhk8D0Xl0p1Bbt4uMLUgDc0RfFuIFZdxhQ+afSIBZ2wHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTCPkUQq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048079; x=1777584079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O/ffrRkZfGAa8NXehArzvtm64EJeuW4/i9o72KLq2SY=;
  b=gTCPkUQqSzFyZP/mZCIZJAs20Iro4atRRmWDL+Ev8x0IQO2E2isyeNxb
   FR6QabYsSk/9LuPG6kx1Ttv/plFDL3spUHSjaYji6FWRj0oQexVHgIJk7
   DhhciYl3gbM6ZalfoLlWBg8IBTbb9nNoI0iupCOOS++Ck/JT4JZMG8o7W
   VFHNtTN34ekBNXJH3vswtKPQNL9nacRh8RnWzA0MHSBAaEhWC7irBThZm
   jau/ZWAuqAeYDxhSd+aJ54t5raEAoQqW0sfWkbA9QArtqD10AKKgj3jJh
   BLForrTVnlsMu6LjfuOhkhWGXDOmfKs3EkH1ak3CD7BExddau0gTnf1t+
   A==;
X-CSE-ConnectionGUID: TO3kQRLbRyqFMhXhF8/VHg==
X-CSE-MsgGUID: /qKLeXQLSdqmtqGzmVgDug==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257537"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257537"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
X-CSE-ConnectionGUID: rkpdKpLASQaU1qxzH5VCsw==
X-CSE-MsgGUID: ulNrzyg1RUihN2GaQmr8BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972278"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
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
Subject: [PATCH 04/15] platform/x86/intel/vsec: Add device links to enforce dependencies
Date: Wed, 30 Apr 2025 14:20:53 -0700
Message-ID: <20250430212106.369208-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
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
 drivers/platform/x86/intel/vsec.c | 214 +++++++++++++++++++++++++++++-
 include/linux/intel_vsec.h        |  28 +++-
 2 files changed, 230 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index f01651f498ca..8700ed7656df 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -15,9 +15,11 @@
=20
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/idr.h>
+#include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -32,8 +34,17 @@ static DEFINE_IDA(intel_vsec_ida);
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
@@ -95,6 +106,72 @@ static void intel_vsec_dev_release(struct device *dev)
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
+			break;
+
+	if (consumer_id < 0)
+		return NULL;
+
+	return &deps[consumer_id];
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
+		if (state[supplier_id] !=3D STATE_REGISTERED)
+			continue;
+
+		if (!suppliers[supplier_id]) {
+			dev_err(dev, "Bad supplier list\n");
+			return -EINVAL;
+		}
+
+		device_link_add(dev, suppliers[supplier_id], DL_FLAG_AUTOPROBE_CONSUMER);
+	}
+
+	return 0;
+}
+
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name)
@@ -132,6 +209,25 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct de=
vice *parent,
 		return ret;
 	}
=20
+	/*
+	 * Assign a name now to ensure that the device link doesn't contain
+	 * a null string for the consumer name. This is a problem when a supplier
+	 * supplys more than one consumer and can lead to a duplicate name error
+	 * when the link is created in sysfs.
+	 */
+	ret =3D dev_set_name(&auxdev->dev, "%s.%s.%d", KBUILD_MODNAME, auxdev->na=
me,
+			   auxdev->id);
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		return ret;
+	}
+
+	ret =3D intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->cap_i=
d);
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		return ret;
+	}
+
 	ret =3D auxiliary_device_add(auxdev);
 	if (ret < 0) {
 		auxiliary_device_uninit(auxdev);
@@ -144,7 +240,8 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct dev=
ice *parent,
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
@@ -211,6 +308,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, str=
uct intel_vsec_header *he
 	intel_vsec_dev->quirks =3D info->quirks;
 	intel_vsec_dev->base_addr =3D info->base_addr;
 	intel_vsec_dev->priv_data =3D info->priv_data;
+	intel_vsec_dev->cap_id =3D cap_id;
=20
 	if (header->id =3D=3D VSEC_ID_SDSI)
 		intel_vsec_dev->ida =3D &intel_vsec_sdsi_ida;
@@ -219,12 +317,108 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, =
struct intel_vsec_header *he
=20
 	/*
 	 * Pass the ownership of intel_vsec_dev and resource within it to
-	 * intel_vsec_add_aux()
+	 * intel_vsec_add_aux().
 	 */
 	return intel_vsec_add_aux(pdev, parent, no_free_ptr(intel_vsec_dev),
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
+	if (consumer_deps->feature !=3D BIT(cap_id))
+		return false; /* Should not happen */
+
+	/*
+	 * Find all features that are suppliers and check their state.
+	 * Only suppliers that have been successfully registered will be linked.
+	 */
+	for_each_set_bit(supplier_id, &consumer_deps->supplier_bitmap, VSEC_FEATU=
RE_COUNT) {
+		if (state[supplier_id] =3D=3D STATE_SKIP)
+			continue;
+
+		/* If any supplier is not yet found, return immediately */
+		if (state[supplier_id] =3D=3D STATE_NOT_FOUND)
+			return false;
+	}
+
+	/*
+	 * If we get here, all suppliers have been found and the consumer
+	 * is ready to be registered.
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
@@ -375,7 +569,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id
 	struct intel_vsec_platform_info *info;
 	struct vsec_priv *priv;
 	bool have_devices =3D false;
-	int ret;
+	int num_caps, ret;
=20
 	ret =3D pcim_enable_device(pdev);
 	if (ret)
@@ -393,7 +587,13 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
 	priv->info =3D info;
 	pci_set_drvdata(pdev, priv);
=20
-	intel_vsec_feature_walk(pdev, &have_devices, info);
+	num_caps =3D hweight_long(info->caps);
+	while (num_caps--) {
+		intel_vsec_feature_walk(pdev, &have_devices, info);
+
+		if (priv->found_caps =3D=3D priv->info->caps)
+			break;
+	}
=20
 	if (!have_devices)
 		return -ENODEV;
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



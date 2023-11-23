Return-Path: <platform-driver-x86+bounces-17-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D27F572F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 05:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA2A8B2114E
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 04:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1148EBE5D;
	Thu, 23 Nov 2023 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmvbrmar"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029D1D42;
	Wed, 22 Nov 2023 20:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712239; x=1732248239;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+si1jhpoNCFatqzgRfc9Cd9YOvlJraG7FOlzRdqeI88=;
  b=kmvbrmarA+n2gZaFFFhdZYz6n706ZtZUM1ffaGg7hmpkZUqinBXj/j1n
   v2e/dJtFW6uBbpRIQSGXaYl7pHUPaU49W7y1KbhW1dkp+9UvvHrNALG9z
   DE2bItFPHM4w4ryaav6yn1OVnv6lJFE3HoOGNK5e3sUsAEjuqoxLy8NjY
   mSPlQwmvlt0072hX6h+Ef8m1uPjNhNjbxg+bbGAFopBLNkluEKnSq7PWq
   P9vyW39S5QaOf8EJ8Wx016P5+jkE1RA9kDphq1h5i7z3iYu8vGZaQNDgS
   VzbYArynGw0Fou6ZsHsAQvi7ZjDlorC6rPA6XvqX9Mz9kXBWTo3RKyIXc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5334661"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="5334661"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837671151"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="837671151"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:56 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id 6EDDA580CA4;
	Wed, 22 Nov 2023 20:03:56 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 09/20] platform/x86/intel/pmt: telemetry: Export API to read telemetry
Date: Wed, 22 Nov 2023 20:03:44 -0800
Message-Id: <20231123040355.82139-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123040355.82139-1-david.e.box@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export symbols to allow access to Intel PMT Telemetry data on available
devices. Provides APIs to search, register, and read telemetry using a
kref managed pointer that serves as a handle to a telemetry endpoint.
To simplify searching for present devices, have the IDA start at 1
instead of 0 so that 0 can be used to indicate end of search.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V5 - No change

V4 - No change

V3 - Add comment for mutex lock
   - Fix multiline comments
   - Fix line lengths
   - Fix space/tab inconsistences in header doc

V2 - Add explanation of PMT_XA_START change in changelog
   - change return and argument type of pmt_telem_get_next_endpoint() to
     unsigned long
   - style fixes

 drivers/platform/x86/intel/pmt/class.c     |  21 ++-
 drivers/platform/x86/intel/pmt/class.h     |  14 ++
 drivers/platform/x86/intel/pmt/telemetry.c | 191 ++++++++++++++++++++-
 drivers/platform/x86/intel/pmt/telemetry.h | 126 ++++++++++++++
 4 files changed, 344 insertions(+), 8 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmt/telemetry.h

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 142a24e3727d..4b53940a64e2 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -17,7 +17,7 @@
 #include "../vsec.h"
 #include "class.h"
 
-#define PMT_XA_START		0
+#define PMT_XA_START		1
 #define PMT_XA_MAX		INT_MAX
 #define PMT_XA_LIMIT		XA_LIMIT(PMT_XA_START, PMT_XA_MAX)
 #define GUID_SPR_PUNIT		0x9956f43f
@@ -247,6 +247,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 				  struct intel_pmt_namespace *ns,
 				  struct device *parent)
 {
+	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
 	struct resource res = {0};
 	struct device *dev;
 	int ret;
@@ -270,7 +271,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	if (ns->attr_grp) {
 		ret = sysfs_create_group(entry->kobj, ns->attr_grp);
 		if (ret)
-			goto fail_sysfs;
+			goto fail_sysfs_create_group;
 	}
 
 	/* if size is 0 assume no data buffer, so no file needed */
@@ -295,13 +296,23 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	entry->pmt_bin_attr.size = entry->size;
 
 	ret = sysfs_create_bin_file(&dev->kobj, &entry->pmt_bin_attr);
-	if (!ret)
-		return 0;
+	if (ret)
+		goto fail_ioremap;
 
+	if (ns->pmt_add_endpoint) {
+		ret = ns->pmt_add_endpoint(entry, ivdev->pcidev);
+		if (ret)
+			goto fail_add_endpoint;
+	}
+
+	return 0;
+
+fail_add_endpoint:
+	sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
 fail_ioremap:
 	if (ns->attr_grp)
 		sysfs_remove_group(entry->kobj, ns->attr_grp);
-fail_sysfs:
+fail_sysfs_create_group:
 	device_unregister(dev);
 fail_dev_create:
 	xa_erase(ns->xa, entry->devid);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index e477a19f6700..d23c63b73ab7 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 
 #include "../vsec.h"
+#include "telemetry.h"
 
 /* PMT access types */
 #define ACCESS_BARID		2
@@ -18,6 +19,16 @@
 #define GET_BIR(v)		((v) & GENMASK(2, 0))
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
 
+struct pci_dev;
+
+struct telem_endpoint {
+	struct pci_dev		*pcidev;
+	struct telem_header	header;
+	void __iomem		*base;
+	bool			present;
+	struct kref		kref;
+};
+
 struct intel_pmt_header {
 	u32	base_offset;
 	u32	size;
@@ -26,6 +37,7 @@ struct intel_pmt_header {
 };
 
 struct intel_pmt_entry {
+	struct telem_endpoint	*ep;
 	struct intel_pmt_header	header;
 	struct bin_attribute	pmt_bin_attr;
 	struct kobject		*kobj;
@@ -43,6 +55,8 @@ struct intel_pmt_namespace {
 	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
+	int (*pmt_add_endpoint)(struct intel_pmt_entry *entry,
+				struct pci_dev *pdev);
 };
 
 bool intel_pmt_is_early_client_hw(struct device *dev);
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index f86080e8bebd..09258564dfc4 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -30,6 +30,15 @@
 /* Used by client hardware to identify a fixed telemetry entry*/
 #define TELEM_CLIENT_FIXED_BLOCK_GUID	0x10000000
 
+#define NUM_BYTES_QWORD(v)	((v) << 3)
+#define SAMPLE_ID_OFFSET(v)	((v) << 3)
+
+#define NUM_BYTES_DWORD(v)	((v) << 2)
+#define SAMPLE_ID_OFFSET32(v)	((v) << 2)
+
+/* Protects access to the xarray of telemetry endpoint handles */
+static DEFINE_MUTEX(ep_lock);
+
 enum telem_type {
 	TELEM_TYPE_PUNIT = 0,
 	TELEM_TYPE_CRASHLOG,
@@ -84,21 +93,195 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	return 0;
 }
 
+static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
+				  struct pci_dev *pdev)
+{
+	struct telem_endpoint *ep;
+
+	/* Endpoint lifetimes are managed by kref, not devres */
+	entry->ep = kzalloc(sizeof(*(entry->ep)), GFP_KERNEL);
+	if (!entry->ep)
+		return -ENOMEM;
+
+	ep = entry->ep;
+	ep->pcidev = pdev;
+	ep->header.access_type = entry->header.access_type;
+	ep->header.guid = entry->header.guid;
+	ep->header.base_offset = entry->header.base_offset;
+	ep->header.size = entry->header.size;
+	ep->base = entry->base;
+	ep->present = true;
+
+	kref_init(&ep->kref);
+
+	return 0;
+}
+
 static DEFINE_XARRAY_ALLOC(telem_array);
 static struct intel_pmt_namespace pmt_telem_ns = {
 	.name = "telem",
 	.xa = &telem_array,
 	.pmt_header_decode = pmt_telem_header_decode,
+	.pmt_add_endpoint = pmt_telem_add_endpoint,
 };
 
+/* Called when all users unregister and the device is removed */
+static void pmt_telem_ep_release(struct kref *kref)
+{
+	struct telem_endpoint *ep;
+
+	ep = container_of(kref, struct telem_endpoint, kref);
+	kfree(ep);
+}
+
+unsigned long pmt_telem_get_next_endpoint(unsigned long start)
+{
+	struct intel_pmt_entry *entry;
+	unsigned long found_idx;
+
+	mutex_lock(&ep_lock);
+	xa_for_each_start(&telem_array, found_idx, entry, start) {
+		/*
+		 * Return first found index after start.
+		 * 0 is not valid id.
+		 */
+		if (found_idx > start)
+			break;
+	}
+	mutex_unlock(&ep_lock);
+
+	return found_idx == start ? 0 : found_idx;
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_get_next_endpoint, INTEL_PMT_TELEMETRY);
+
+struct telem_endpoint *pmt_telem_register_endpoint(int devid)
+{
+	struct intel_pmt_entry *entry;
+	unsigned long index = devid;
+
+	mutex_lock(&ep_lock);
+	entry = xa_find(&telem_array, &index, index, XA_PRESENT);
+	if (!entry) {
+		mutex_unlock(&ep_lock);
+		return ERR_PTR(-ENXIO);
+	}
+
+	kref_get(&entry->ep->kref);
+	mutex_unlock(&ep_lock);
+
+	return entry->ep;
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_register_endpoint, INTEL_PMT_TELEMETRY);
+
+void pmt_telem_unregister_endpoint(struct telem_endpoint *ep)
+{
+	kref_put(&ep->kref, pmt_telem_ep_release);
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_unregister_endpoint, INTEL_PMT_TELEMETRY);
+
+int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
+{
+	struct intel_pmt_entry *entry;
+	unsigned long index = devid;
+	int err = 0;
+
+	if (!info)
+		return -EINVAL;
+
+	mutex_lock(&ep_lock);
+	entry = xa_find(&telem_array, &index, index, XA_PRESENT);
+	if (!entry) {
+		err = -ENXIO;
+		goto unlock;
+	}
+
+	info->pdev = entry->ep->pcidev;
+	info->header = entry->ep->header;
+
+unlock:
+	mutex_unlock(&ep_lock);
+	return err;
+
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_get_endpoint_info, INTEL_PMT_TELEMETRY);
+
+int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
+{
+	u32 offset, size;
+
+	if (!ep->present)
+		return -ENODEV;
+
+	offset = SAMPLE_ID_OFFSET(id);
+	size = ep->header.size;
+
+	if (offset + NUM_BYTES_QWORD(count) > size)
+		return -EINVAL;
+
+	memcpy_fromio(data, ep->base + offset, NUM_BYTES_QWORD(count));
+
+	return ep->present ? 0 : -EPIPE;
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read, INTEL_PMT_TELEMETRY);
+
+int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
+{
+	u32 offset, size;
+
+	if (!ep->present)
+		return -ENODEV;
+
+	offset = SAMPLE_ID_OFFSET32(id);
+	size = ep->header.size;
+
+	if (offset + NUM_BYTES_DWORD(count) > size)
+		return -EINVAL;
+
+	memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
+
+	return ep->present ? 0 : -EPIPE;
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, INTEL_PMT_TELEMETRY);
+
+struct telem_endpoint *
+pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
+{
+	int devid = 0;
+	int inst = 0;
+	int err = 0;
+
+	while ((devid = pmt_telem_get_next_endpoint(devid))) {
+		struct telem_endpoint_info ep_info;
+
+		err = pmt_telem_get_endpoint_info(devid, &ep_info);
+		if (err)
+			return ERR_PTR(err);
+
+		if (ep_info.header.guid == guid && ep_info.pdev == pcidev) {
+			if (inst == pos)
+				return pmt_telem_register_endpoint(devid);
+			++inst;
+		}
+	}
+
+	return ERR_PTR(-ENXIO);
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_find_and_register_endpoint, INTEL_PMT_TELEMETRY);
+
 static void pmt_telem_remove(struct auxiliary_device *auxdev)
 {
 	struct pmt_telem_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
-	for (i = 0; i < priv->num_entries; i++)
-		intel_pmt_dev_destroy(&priv->entry[i], &pmt_telem_ns);
-}
+	mutex_lock(&ep_lock);
+	for (i = 0; i < priv->num_entries; i++) {
+		struct intel_pmt_entry *entry = &priv->entry[i];
+
+		kref_put(&entry->ep->kref, pmt_telem_ep_release);
+		intel_pmt_dev_destroy(entry, &pmt_telem_ns);
+	}
+	mutex_unlock(&ep_lock);
+};
 
 static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
 {
@@ -117,7 +300,9 @@ static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxilia
 	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[priv->num_entries];
 
+		mutex_lock(&ep_lock);
 		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
+		mutex_unlock(&ep_lock);
 		if (ret < 0)
 			goto abort_probe;
 		if (ret)
diff --git a/drivers/platform/x86/intel/pmt/telemetry.h b/drivers/platform/x86/intel/pmt/telemetry.h
new file mode 100644
index 000000000000..d45af5512b4e
--- /dev/null
+++ b/drivers/platform/x86/intel/pmt/telemetry.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _TELEMETRY_H
+#define _TELEMETRY_H
+
+/* Telemetry types */
+#define PMT_TELEM_TELEMETRY	0
+#define PMT_TELEM_CRASHLOG	1
+
+struct telem_endpoint;
+struct pci_dev;
+
+struct telem_header {
+	u8	access_type;
+	u16	size;
+	u32	guid;
+	u32	base_offset;
+};
+
+struct telem_endpoint_info {
+	struct pci_dev		*pdev;
+	struct telem_header	header;
+};
+
+/**
+ * pmt_telem_get_next_endpoint() - Get next device id for a telemetry endpoint
+ * @start:  starting devid to look from
+ *
+ * This functions can be used in a while loop predicate to retrieve the devid
+ * of all available telemetry endpoints. Functions pmt_telem_get_next_endpoint()
+ * and pmt_telem_register_endpoint() can be used inside of the loop to examine
+ * endpoint info and register to receive a pointer to the endpoint. The pointer
+ * is then usable in the telemetry read calls to access the telemetry data.
+ *
+ * Return:
+ * * devid       - devid of the next present endpoint from start
+ * * 0           - when no more endpoints are present after start
+ */
+unsigned long pmt_telem_get_next_endpoint(unsigned long start);
+
+/**
+ * pmt_telem_register_endpoint() - Register a telemetry endpoint
+ * @devid: device id/handle of the telemetry endpoint
+ *
+ * Increments the kref usage counter for the endpoint.
+ *
+ * Return:
+ * * endpoint    - On success returns pointer to the telemetry endpoint
+ * * -ENXIO      - telemetry endpoint not found
+ */
+struct telem_endpoint *pmt_telem_register_endpoint(int devid);
+
+/**
+ * pmt_telem_unregister_endpoint() - Unregister a telemetry endpoint
+ * @ep:   ep structure to populate.
+ *
+ * Decrements the kref usage counter for the endpoint.
+ */
+void pmt_telem_unregister_endpoint(struct telem_endpoint *ep);
+
+/**
+ * pmt_telem_get_endpoint_info() - Get info for an endpoint from its devid
+ * @devid:  device id/handle of the telemetry endpoint
+ * @info:   Endpoint info structure to be populated
+ *
+ * Return:
+ * * 0           - Success
+ * * -ENXIO      - telemetry endpoint not found for the devid
+ * * -EINVAL     - @info is NULL
+ */
+int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info);
+
+/**
+ * pmt_telem_find_and_register_endpoint() - Get a telemetry endpoint from
+ * pci_dev device, guid and pos
+ * @pdev:   PCI device inside the Intel vsec
+ * @guid:   GUID of the telemetry space
+ * @pos:    Instance of the guid
+ *
+ * Return:
+ * * endpoint    - On success returns pointer to the telemetry endpoint
+ * * -ENXIO      - telemetry endpoint not found
+ */
+struct telem_endpoint *pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev,
+				u32 guid, u16 pos);
+
+/**
+ * pmt_telem_read() - Read qwords from counter sram using sample id
+ * @ep:     Telemetry endpoint to be read
+ * @id:     The beginning sample id of the metric(s) to be read
+ * @data:   Allocated qword buffer
+ * @count:  Number of qwords requested
+ *
+ * Callers must ensure reads are aligned. When the call returns -ENODEV,
+ * the device has been removed and callers should unregister the telemetry
+ * endpoint.
+ *
+ * Return:
+ * * 0           - Success
+ * * -ENODEV     - The device is not present.
+ * * -EINVAL     - The offset is out bounds
+ * * -EPIPE      - The device was removed during the read. Data written
+ *                 but should be considered invalid.
+ */
+int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count);
+
+/**
+ * pmt_telem_read32() - Read qwords from counter sram using sample id
+ * @ep:     Telemetry endpoint to be read
+ * @id:     The beginning sample id of the metric(s) to be read
+ * @data:   Allocated dword buffer
+ * @count:  Number of dwords requested
+ *
+ * Callers must ensure reads are aligned. When the call returns -ENODEV,
+ * the device has been removed and callers should unregister the telemetry
+ * endpoint.
+ *
+ * Return:
+ * * 0           - Success
+ * * -ENODEV     - The device is not present.
+ * * -EINVAL     - The offset is out bounds
+ * * -EPIPE      - The device was removed during the read. Data written
+ *                 but should be considered invalid.
+ */
+int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count);
+
+#endif
-- 
2.34.1



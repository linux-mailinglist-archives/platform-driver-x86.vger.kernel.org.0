Return-Path: <platform-driver-x86+bounces-4511-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B393C1F3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 Jul 2024 14:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D21928A616
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 Jul 2024 12:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6AB19AA61;
	Thu, 25 Jul 2024 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kS1vP0VC"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372719AA5B
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910249; cv=none; b=Tko0C7cuT1fkvFkEFTJKr6F8554eifws6iqWiM4S9etOrD3mi3s+XXnw+oCnJ1tic9+VRroqsQu6ttoDRaHqMT+MYi0bZ20Gw/hccuQyLxpqhYpKtug6HSX1+zbZ6ymUOXjy+B1Oh2Na46G3cZZ6MJXT+jNWJLnE0uJv5vmu2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910249; c=relaxed/simple;
	bh=WVKJz9jLuWJhZRq4+rVOokluWUkOLW9xPm97MZoSW8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/xIxfTHlIykbjbSENZzSJ7tiKM6aafxIKkA0xM8FFeZiHEnQEXWO8weY4b6YMRN/d16b9ebgRnHDxrIUmOxYY/ygcyRGRcUPrmekZ0Zg8uIFihVL7IWzq7aLur0vwKKbPyGOZdMTCLQHUSQ6Ci2kSJaqbmQZ0wOq66+JJEVecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kS1vP0VC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910248; x=1753446248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WVKJz9jLuWJhZRq4+rVOokluWUkOLW9xPm97MZoSW8Y=;
  b=kS1vP0VCoeDBQZRubaOjBfmfFJ4zE8YoHCx1yzZfhzdNOfJ54l9vfNf2
   3j2HAXC/cu9MbGm1VWRt1vcnvKxm65o3Y9ZhLszZRpQ53Ici9bEqfkSdg
   8o1rUOxoku/R0BZYFfUVlg7B+/Y6qQgrbZsq7VfFI8qmK+nDxV2pyUVQ9
   XJqpVk5NmA9icLx9otCxvoEuBij6yVNPpTArWguzlo4eLkSVzNVp6N1/y
   p51dgpm5FzYlntBcUsUltRFuLgYCfHKCK9OzpdJhyZkd34boC6WOyzOl7
   t/hWI7fTGrsXZDbQ4HNDj8vul0eKed4MZWtfAdwyIsqU5HDXyH/QuZWXe
   A==;
X-CSE-ConnectionGUID: Te0wmswUQTy0uxhmnUTKPg==
X-CSE-MsgGUID: Lpa7wiNxTP66LaLb/RsNtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19493176"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19493176"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:07 -0700
X-CSE-ConnectionGUID: d0pyl+2YShSEwGFyU0VBFw==
X-CSE-MsgGUID: Fg8tbW6XRq6R6sGXaba3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="53153614"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:07 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v9 3/6] platform/x86/intel/pmt: Use PMT callbacks
Date: Thu, 25 Jul 2024 08:23:42 -0400
Message-ID: <20240725122346.4063913-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "David E. Box" <david.e.box@linux.intel.com>

PMT providers may require device specific actions before their telemetry
may be read. If the read_telem() is assigned, call it instead of
memcpy_fromio() and return. Since this needs to be done in multiple
locations, add pmt_telem_read_mmio() as a wrapper function to perform this
and any other needed checks.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 26 +++++++++++++++++-----
 drivers/platform/x86/intel/pmt/class.h     |  8 +++++--
 drivers/platform/x86/intel/pmt/telemetry.c | 10 +++++----
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index d7939b28e937..c04bb7f97a4d 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -58,6 +58,22 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
 	return count;
 }
 
+int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
+			void __iomem *addr, u32 count)
+{
+	if (cb && cb->read_telem)
+		return cb->read_telem(pdev, guid, buf, count);
+
+	if (guid == GUID_SPR_PUNIT)
+		/* PUNIT on SPR only supports aligned 64-bit read */
+		return pmt_memcpy64_fromio(buf, addr, count);
+
+	memcpy_fromio(buf, addr, count);
+
+	return count;
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
+
 /*
  * sysfs
  */
@@ -79,11 +95,8 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count = entry->size - off;
 
-	if (entry->guid == GUID_SPR_PUNIT)
-		/* PUNIT on SPR only supports aligned 64-bit read */
-		count = pmt_memcpy64_fromio(buf, entry->base + off, count);
-	else
-		memcpy_fromio(buf, entry->base + off, count);
+	count = pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
+				    entry->base + off, count);
 
 	return count;
 }
@@ -239,6 +252,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 
 	entry->guid = header->guid;
 	entry->size = header->size;
+	entry->cb = ivdev->priv_data;
 
 	return 0;
 }
@@ -300,7 +314,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 		goto fail_ioremap;
 
 	if (ns->pmt_add_endpoint) {
-		ret = ns->pmt_add_endpoint(entry, ivdev->pcidev);
+		ret = ns->pmt_add_endpoint(ivdev, entry);
 		if (ret)
 			goto fail_add_endpoint;
 	}
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index d6f9ccaf28c8..a267ac964423 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -24,6 +24,7 @@ struct pci_dev;
 struct telem_endpoint {
 	struct pci_dev		*pcidev;
 	struct telem_header	header;
+	struct pmt_callbacks	*cb;
 	void __iomem		*base;
 	bool			present;
 	struct kref		kref;
@@ -43,6 +44,7 @@ struct intel_pmt_entry {
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
 	void __iomem		*base;
+	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
 	size_t			size;
 	u32			guid;
@@ -55,10 +57,12 @@ struct intel_pmt_namespace {
 	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
-	int (*pmt_add_endpoint)(struct intel_pmt_entry *entry,
-				struct pci_dev *pdev);
+	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
+				struct intel_pmt_entry *entry);
 };
 
+int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
+			void __iomem *addr, u32 count);
 bool intel_pmt_is_early_client_hw(struct device *dev);
 int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_pmt_namespace *ns,
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 3478f891ea0b..c9feac859e57 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -93,8 +93,8 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	return 0;
 }
 
-static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
-				  struct pci_dev *pdev)
+static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
+				  struct intel_pmt_entry *entry)
 {
 	struct telem_endpoint *ep;
 
@@ -104,13 +104,14 @@ static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
 		return -ENOMEM;
 
 	ep = entry->ep;
-	ep->pcidev = pdev;
+	ep->pcidev = ivdev->pcidev;
 	ep->header.access_type = entry->header.access_type;
 	ep->header.guid = entry->header.guid;
 	ep->header.base_offset = entry->header.base_offset;
 	ep->header.size = entry->header.size;
 	ep->base = entry->base;
 	ep->present = true;
+	ep->cb = ivdev->priv_data;
 
 	kref_init(&ep->kref);
 
@@ -218,7 +219,8 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 	if (offset + NUM_BYTES_QWORD(count) > size)
 		return -EINVAL;
 
-	memcpy_fromio(data, ep->base + offset, NUM_BYTES_QWORD(count));
+	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base + offset,
+			    NUM_BYTES_QWORD(count));
 
 	return ep->present ? 0 : -EPIPE;
 }
-- 
2.44.0



Return-Path: <platform-driver-x86+bounces-6-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CD27F5720
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 05:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8066BB210E9
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 04:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6371EB650;
	Thu, 23 Nov 2023 04:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJiYTtEi"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CF0DD;
	Wed, 22 Nov 2023 20:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712237; x=1732248237;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qja7F9e+neaOik7E6g6cxNaFAISNh0pntEcq/tEl9bY=;
  b=aJiYTtEiPxl03cYJPvkwKue7bdgQGtdpklEHOtkG64w6fxgPbgmjvodX
   mw9/WTy+L6HLw95iBIHPlhVI4vn8tO+Yb/SH9A9GQTn1/k6CayGMtZHz1
   u9yKkoT9z+Oc2O1n2zzFpvDQn/7CjHeA4Cpumin0boslyD9rD6xp/aPAw
   Z07x/2PAhD7MMhkw6AGmbiRao4PgjfYUE4I5p4oRHg6UVM6y8pTn6zJU5
   TVAo3v6ICJc7ZGPX+SvAUGpzj/DaLVu32z8rrTIb8Bf0clct650uE2ga3
   q8GPdj2ywFepLQbTrsp6z+I4g0TuOTSJiCe2JuOI+zdnnm0S5P2b5Y9FC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389347941"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="389347941"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801925645"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801925645"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:55 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id 80271580CA6;
	Wed, 22 Nov 2023 20:03:55 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 01/20] platform/x86/intel/vsec: Fix xa_alloc memory leak
Date: Wed, 22 Nov 2023 20:03:36 -0800
Message-Id: <20231123040355.82139-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123040355.82139-1-david.e.box@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes memory leak, caught be kmemleak, due to failure to erase auxiliary
device entries from an xarray on removal.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 - New patch

 drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++++--------
 drivers/platform/x86/intel/vsec.h |  1 +
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index c1f9e4471b28..ae811bb65910 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -120,6 +120,8 @@ static void intel_vsec_dev_release(struct device *dev)
 {
 	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(dev);
 
+	xa_erase(&auxdev_array, intel_vsec_dev->id);
+
 	mutex_lock(&vsec_ida_lock);
 	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
 	mutex_unlock(&vsec_ida_lock);
@@ -136,9 +138,21 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 	int ret, id;
 
 	mutex_lock(&vsec_ida_lock);
-	ret = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
+	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
 	mutex_unlock(&vsec_ida_lock);
+	if (id < 0) {
+		kfree(intel_vsec_dev->resource);
+		kfree(intel_vsec_dev);
+		return ret;
+	}
+
+	ret = xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
+		       PMT_XA_LIMIT, GFP_KERNEL);
 	if (ret < 0) {
+		mutex_lock(&vsec_ida_lock);
+		ida_free(intel_vsec_dev->ida, id);
+		mutex_unlock(&vsec_ida_lock);
+
 		kfree(intel_vsec_dev->resource);
 		kfree(intel_vsec_dev);
 		return ret;
@@ -147,7 +161,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 	if (!parent)
 		parent = &pdev->dev;
 
-	auxdev->id = ret;
+	auxdev->id = id;
 	auxdev->name = name;
 	auxdev->dev.parent = parent;
 	auxdev->dev.release = intel_vsec_dev_release;
@@ -169,12 +183,6 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 	if (ret < 0)
 		return ret;
 
-	/* Add auxdev to list */
-	ret = xa_alloc(&auxdev_array, &id, intel_vsec_dev, PMT_XA_LIMIT,
-		       GFP_KERNEL);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, INTEL_VSEC);
diff --git a/drivers/platform/x86/intel/vsec.h b/drivers/platform/x86/intel/vsec.h
index 0fd042c171ba..0a6201b4a0e9 100644
--- a/drivers/platform/x86/intel/vsec.h
+++ b/drivers/platform/x86/intel/vsec.h
@@ -45,6 +45,7 @@ struct intel_vsec_device {
 	struct ida *ida;
 	struct intel_vsec_platform_info *info;
 	int num_resources;
+	int id; /* xa */
 	void *priv_data;
 	size_t priv_data_size;
 };
-- 
2.34.1



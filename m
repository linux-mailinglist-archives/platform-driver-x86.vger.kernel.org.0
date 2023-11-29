Return-Path: <platform-driver-x86+bounces-156-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E24C7FE2E8
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 23:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C02371C212D0
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 22:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE5D3B1B0;
	Wed, 29 Nov 2023 22:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bI+BVPTi"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3D5C1;
	Wed, 29 Nov 2023 14:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296500; x=1732832500;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/oyzykdSt+VTIrV0ILfyr4YDLUq4rAc6Mhdr6VxDMvw=;
  b=bI+BVPTi03S0ruJulXVDE7POVOktWBXYEOrEdVWuXvqjcn6cYPjbl1nJ
   Oi/Wc7VkOyJBhXJbnbZFa4HbBwWw3f3HZKi2Zd2uv9uvqNGsdJaFpakpr
   1D1JORkiBpIMA+eHMhs1qvZakpI1qgv3W+wK5dwkYqDFPGNtYiAqDGzEC
   u3WmF9KvdXWAFStNUYjEQyUmJOV/VezdeGtJUo8a2dxAZHIH/DYgPpjSe
   VY5F16oY21+zZFf/hRt68+42nYTO7u61mDQ2lO5HltAChluqAc8ajxpWz
   jymMkpN5nH0xLeYWLySLSngG6bosEdi7qRM9NoFsYMw5+I0sDRRdggp8r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11936990"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11936990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070410"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070410"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:32 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id B8254580BF8;
	Wed, 29 Nov 2023 14:21:32 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 01/20] platform/x86/intel/vsec: Fix xa_alloc memory leak
Date: Wed, 29 Nov 2023 14:21:13 -0800
Message-Id: <20231129222132.2331261-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129222132.2331261-1-david.e.box@linux.intel.com>
References: <20231129222132.2331261-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 936874b77dd0 ("platform/x86/intel/vsec: Add PCI error recovery
support to Intel PMT") added an xarray to track the list of vsec devices to
be recovered after a PCI error. But it did not provide cleanup for the list
leading to a memory leak that was caught by kmemleak.  Do xa_alloc() before
devm_add_action_or_reset() so that the list may be cleaned up with
xa_erase() in the release function.

Fixes: 936874b77dd0 ("platform/x86/intel/vsec: Add PCI error recovery support to Intel PMT")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V6 - Move xa_alloc() before ida_alloc() to reduce mutex use during error
     recovery.
   - Fix return value after id_alloc() fail
   - Add Fixes tag
   - Add more detail to changelog

V5 - New patch

 drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++----------
 drivers/platform/x86/intel/vsec.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index c1f9e4471b28..2d568466b4e2 100644
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
@@ -135,19 +137,27 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
 	int ret, id;
 
-	mutex_lock(&vsec_ida_lock);
-	ret = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
-	mutex_unlock(&vsec_ida_lock);
+	ret = xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
+		       PMT_XA_LIMIT, GFP_KERNEL);
 	if (ret < 0) {
 		kfree(intel_vsec_dev->resource);
 		kfree(intel_vsec_dev);
 		return ret;
 	}
 
+	mutex_lock(&vsec_ida_lock);
+	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
+	mutex_unlock(&vsec_ida_lock);
+	if (id < 0) {
+		kfree(intel_vsec_dev->resource);
+		kfree(intel_vsec_dev);
+		return id;
+	}
+
 	if (!parent)
 		parent = &pdev->dev;
 
-	auxdev->id = ret;
+	auxdev->id = id;
 	auxdev->name = name;
 	auxdev->dev.parent = parent;
 	auxdev->dev.release = intel_vsec_dev_release;
@@ -169,12 +179,6 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
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



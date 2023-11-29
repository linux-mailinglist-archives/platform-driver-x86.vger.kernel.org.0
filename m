Return-Path: <platform-driver-x86+bounces-170-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF387FE2F8
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 23:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31EF7B20EB7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 22:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0B33B1AA;
	Wed, 29 Nov 2023 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/7rIKVP"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21CE10F3;
	Wed, 29 Nov 2023 14:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296507; x=1732832507;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bHXqITvvls58rwPqWf3sWqsK4WQUOUNsGHTtQSWEOes=;
  b=k/7rIKVPgofovhq0P3Udz4bnDq8NKVjUEL256r1yJWUP1DKNloQ91nZY
   l8tr4TqxDuZjXs51u3yGeDWJbB/23b33dv5hlRXqDOa5IWrQN8V5zS6jY
   HRdCwYyra3iu4CTPmL1lkx7177g4Z0C+8eRx1otzR5Rdu6PIzK1lfV8Ak
   0iqYVH5xV/agJp1R7UZMaeDSDZF6AGcMpLjiO84WIfuXOnPgbkJtLYMit
   IRdt9//TkWwswURlGPxXBm0yOVjXznq/GUZaCW+DM410dkjDMJNZz9mjF
   5DE4kzoCXdyFJJze2KXPod3s8PQbD3IcuTFyQAwIbv+HMF1pVIriU/ScJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937011"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937011"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070447"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070447"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id 338AD580ABB;
	Wed, 29 Nov 2023 14:21:35 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 20/20] platform/x86/intel/pmc: Show Die C6 counter on Meteor Lake
Date: Wed, 29 Nov 2023 14:21:32 -0800
Message-Id: <20231129222132.2331261-21-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129222132.2331261-1-david.e.box@linux.intel.com>
References: <20231129222132.2331261-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expose the Die C6 counter on Meteor Lake.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - no change

V5 - no change

V4 - no change

V3 - Split PATCH V2 13. Separates implementation (previous patch)
     from platform specific use (this patch)

 drivers/platform/x86/intel/pmc/mtl.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index 7ceeae507f4c..38c2f946ec23 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -10,12 +10,17 @@
 
 #include <linux/pci.h>
 #include "core.h"
+#include "../pmt/telemetry.h"
 
 /* PMC SSRAM PMT Telemetry GUIDS */
 #define SOCP_LPM_REQ_GUID	0x2625030
 #define IOEM_LPM_REQ_GUID	0x4357464
 #define IOEP_LPM_REQ_GUID	0x5077612
 
+/* Die C6 from PUNIT telemetry */
+#define MTL_PMT_DMU_DIE_C6_OFFSET	15
+#define MTL_PMT_DMU_GUID		0x1A067102
+
 static const u8 MTL_LPM_REG_INDEX[] = {0, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20};
 
 /*
@@ -968,6 +973,32 @@ static struct pmc_info mtl_pmc_info_list[] = {
 	{}
 };
 
+static void mtl_punit_pmt_init(struct pmc_dev *pmcdev)
+{
+	struct telem_endpoint *ep;
+	struct pci_dev *pcidev;
+
+	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(10, 0));
+	if (!pcidev) {
+		dev_err(&pmcdev->pdev->dev, "PUNIT PMT device not found.\n");
+		return;
+	}
+
+	ep = pmt_telem_find_and_register_endpoint(pcidev, MTL_PMT_DMU_GUID, 0);
+	if (IS_ERR(ep)) {
+		dev_err(&pmcdev->pdev->dev,
+			"pmc_core: couldn't get DMU telem endpoint, %ld\n",
+			PTR_ERR(ep));
+		return;
+	}
+
+	pci_dev_put(pcidev);
+	pmcdev->punit_ep = ep;
+
+	pmcdev->has_die_c6 = true;
+	pmcdev->die_c6_offset = MTL_PMT_DMU_DIE_C6_OFFSET;
+}
+
 #define MTL_GNA_PCI_DEV	0x7e4c
 #define MTL_IPU_PCI_DEV	0x7d19
 #define MTL_VPU_PCI_DEV	0x7d1d
@@ -1032,6 +1063,7 @@ int mtl_core_init(struct pmc_dev *pmcdev)
 	}
 
 	pmc_core_get_low_power_modes(pmcdev);
+	mtl_punit_pmt_init(pmcdev);
 
 	/* Due to a hardware limitation, the GBE LTR blocks PC10
 	 * when a cable is attached. Tell the PMC to ignore it.
-- 
2.34.1



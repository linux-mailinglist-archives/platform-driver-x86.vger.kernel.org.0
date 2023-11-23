Return-Path: <platform-driver-x86+bounces-19-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EDD7F5729
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 05:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9CBB1C20CDD
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 04:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70625BE64;
	Thu, 23 Nov 2023 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGv/COj4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0E4D4F;
	Wed, 22 Nov 2023 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712241; x=1732248241;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bTY6oidySEMa0Nzt+g/YWkffDxzQYR8+KdRFdCrHSZ4=;
  b=QGv/COj45We6y58HSStyHJQGaK/f4d8EF9GwZj55NjffXL+cmGahIgtv
   xkAFgQ18+kn0qi+/szC3n1OucaP1eb5TL8+xPLdnCsKSw/aqD1U48Aq/Z
   I09Hgrfhl7xdq9XzbZCOB6MBHoPYPXq+Oy2T2JNtQ4uTqIrZEVFKpYI0X
   YoCE3fd637C13S3vmkalAlc8/gp6xxv9LX+DW1NU/31xT8OSam+y45iUr
   4QRp/aYUT/rsq4oV/uAN1rfdbyw1bNt6IrTuXPTeopZza5jU/1uZuFJQR
   caRzDkqJhprmVtyuhtrULaGKkIFuHs9jFWzeYDEbA1Z17BPJsLOYVpEhF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5334666"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="5334666"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837671156"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="837671156"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:57 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id EB1E8580D7B;
	Wed, 22 Nov 2023 20:03:56 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 13/20] platform/x86/intel/pmc: Cleanup SSRAM discovery
Date: Wed, 22 Nov 2023 20:03:48 -0800
Message-Id: <20231123040355.82139-14-david.e.box@linux.intel.com>
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

Clean up the code handling SSRAM discovery. Handle all resource allocation
and cleanup in pmc_core_ssram_get_pmc(). Return the error status from this
function but only fail the init if we fail to discover the primary PMC.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 - Use single function to handle SSRAM discovery of all PMCs.

V4 - Add checking the return value from pmc_core_sram_init() to mtl.c
   - Use iounmap cleanup from io.h

V3 - New patch split from previous PATCH 2
   - Update changelog
   - Use cleanup.h to cleanup ioremap

V2 - no change

 drivers/platform/x86/intel/pmc/core_ssram.c | 60 +++++++++++----------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index 815950713e25..cb44394d88ce 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/pci.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 
@@ -65,44 +66,49 @@ pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
 	return 0;
 }
 
-static void
-pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, void __iomem *ssram, u32 offset,
-		       int pmc_idx)
+static int
+pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
 {
-	u64 pwrm_base;
+	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
+	void __iomem __free(iounmap) *tmp_ssram = NULL;
+	void __iomem __free(iounmap) *ssram = NULL;
+	const struct pmc_reg_map *map;
+	u64 ssram_base, pwrm_base;
 	u16 devid;
 
-	if (pmc_idx != PMC_IDX_SOC) {
-		u64 ssram_base = get_base(ssram, offset);
+	if (!pmcdev->regmap_list)
+		return -ENOENT;
 
-		if (!ssram_base)
-			return;
+	ssram_base = ssram_pcidev->resource[0].start;
+	tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
 
+	if (pmc_idx != PMC_IDX_MAIN) {
+		/*
+		 * The secondary PMC BARS (which are behind hidden PCI devices)
+		 * are read from fixed offsets in MMIO of the primary PMC BAR.
+		 */
+		ssram_base = get_base(tmp_ssram, offset);
 		ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
 		if (!ssram)
-			return;
+			return -ENOMEM;
+
+	} else {
+		ssram = no_free_ptr(tmp_ssram);
 	}
 
 	pwrm_base = get_base(ssram, SSRAM_PWRM_OFFSET);
 	devid = readw(ssram + SSRAM_DEVID_OFFSET);
 
-	if (pmcdev->regmap_list) {
-		const struct pmc_reg_map *map;
+	map = pmc_core_find_regmap(pmcdev->regmap_list, devid);
+	if (!map)
+		return -ENODEV;
 
-		map = pmc_core_find_regmap(pmcdev->regmap_list, devid);
-		if (map)
-			pmc_core_pmc_add(pmcdev, pwrm_base, map, pmc_idx);
-	}
-
-	if (pmc_idx != PMC_IDX_SOC)
-		iounmap(ssram);
+	return pmc_core_pmc_add(pmcdev, pwrm_base, map, PMC_IDX_MAIN);
 }
 
 int pmc_core_ssram_init(struct pmc_dev *pmcdev)
 {
-	void __iomem *ssram;
 	struct pci_dev *pcidev;
-	u64 ssram_base;
 	int ret;
 
 	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(20, 2));
@@ -113,18 +119,14 @@ int pmc_core_ssram_init(struct pmc_dev *pmcdev)
 	if (ret)
 		goto release_dev;
 
-	ssram_base = pcidev->resource[0].start;
-	ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
-	if (!ssram)
-		goto disable_dev;
-
 	pmcdev->ssram_pcidev = pcidev;
 
-	pmc_core_ssram_get_pmc(pmcdev, ssram, 0, PMC_IDX_SOC);
-	pmc_core_ssram_get_pmc(pmcdev, ssram, SSRAM_IOE_OFFSET, PMC_IDX_IOE);
-	pmc_core_ssram_get_pmc(pmcdev, ssram, SSRAM_PCH_OFFSET, PMC_IDX_PCH);
+	ret = pmc_core_ssram_get_pmc(pmcdev, PMC_IDX_MAIN, 0);
+	if (ret)
+		goto disable_dev;
 
-	iounmap(ssram);
+	pmc_core_ssram_get_pmc(pmcdev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
+	pmc_core_ssram_get_pmc(pmcdev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
 
 	return 0;
 
-- 
2.34.1



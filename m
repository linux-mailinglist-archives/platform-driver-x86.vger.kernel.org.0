Return-Path: <platform-driver-x86+bounces-169-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD87FE2F5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 23:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F6E1C21425
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 22:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494D247A43;
	Wed, 29 Nov 2023 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjz6VCvq"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCE810CE;
	Wed, 29 Nov 2023 14:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296505; x=1732832505;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7abKeGBqWJoe/utqW0SXcd0dRfgRj7nppTOamC8y3RM=;
  b=gjz6VCvqTvUkSKOLrGx2TmuOVmwV7rUl2nG3O1MoUio7JKgtp2HKT9Eh
   3IBOShVrRAhLEWQLhw7E8uHliBbqBG068+/qte8E7AxpaSEzsc6CN/yZV
   H4DHmtebT/OeeZWwPjPe2bbgl5DndFMWF4J5vrhbpIN/C7VY41+8qL1pP
   WuBJyNVtP0/59cUoLZNh+JjP0MHDauBB+biialodhoOTUXBDi902TnY+Z
   pi7HkF0qIbqT2WkjG/R9JfVl07zEeU0urmMMvT8/KNPuUL+IM63F4D0Jf
   wiUG3LtwwDS+QtyenR75WFasH42z0boYzz+75VjEx79TQBVYvbqjXdbyd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937008"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937008"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070431"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070431"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:34 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id 04192580BF8;
	Wed, 29 Nov 2023 14:21:34 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 11/20] platform/x86:intel/pmc: Call pmc_get_low_power_modes from platform init
Date: Wed, 29 Nov 2023 14:21:23 -0800
Message-Id: <20231129222132.2331261-12-david.e.box@linux.intel.com>
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

From: Xi Pardee <xi.pardee@intel.com>

In order to setup a table of low power mode requirements for Meteor Lake,
pmc_core_get_low_power_modes() will need to be run from platform init code
so that the enabled modes are known, allowing the use of the
pmc_for_each_mode helper. Make the function global and call it from the
platform init code.

Signed-off-by: Xi Pardee <xi.pardee@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No change

V5 - No change

V4 - No change

V3 - No change

V2 - Added clearer explanation for the change in the changelog

 drivers/platform/x86/intel/pmc/adl.c  |  2 ++
 drivers/platform/x86/intel/pmc/cnp.c  |  2 ++
 drivers/platform/x86/intel/pmc/core.c |  7 +++----
 drivers/platform/x86/intel/pmc/core.h |  1 +
 drivers/platform/x86/intel/pmc/icl.c  | 10 +++++++++-
 drivers/platform/x86/intel/pmc/mtl.c  |  4 +++-
 drivers/platform/x86/intel/pmc/spt.c  | 10 +++++++++-
 drivers/platform/x86/intel/pmc/tgl.c  |  1 +
 8 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/adl.c b/drivers/platform/x86/intel/pmc/adl.c
index 5006008e01be..64c492391ede 100644
--- a/drivers/platform/x86/intel/pmc/adl.c
+++ b/drivers/platform/x86/intel/pmc/adl.c
@@ -319,6 +319,8 @@ int adl_core_init(struct pmc_dev *pmcdev)
 	if (ret)
 		return ret;
 
+	pmc_core_get_low_power_modes(pmcdev);
+
 	/* Due to a hardware limitation, the GBE LTR blocks PC10
 	 * when a cable is attached. Tell the PMC to ignore it.
 	 */
diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
index 420aaa1d7c76..59298f184d0e 100644
--- a/drivers/platform/x86/intel/pmc/cnp.c
+++ b/drivers/platform/x86/intel/pmc/cnp.c
@@ -214,6 +214,8 @@ int cnp_core_init(struct pmc_dev *pmcdev)
 	if (ret)
 		return ret;
 
+	pmc_core_get_low_power_modes(pmcdev);
+
 	/* Due to a hardware limitation, the GBE LTR blocks PC10
 	 * when a cable is attached. Tell the PMC to ignore it.
 	 */
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 84c175b9721a..3894119d61b0 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -966,9 +966,8 @@ static bool pmc_core_pri_verify(u32 lpm_pri, u8 *mode_order)
 	return true;
 }
 
-static void pmc_core_get_low_power_modes(struct platform_device *pdev)
+void pmc_core_get_low_power_modes(struct pmc_dev *pmcdev)
 {
-	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	u8 pri_order[LPM_MAX_NUM_MODES] = LPM_DEFAULT_PRI;
 	u8 mode_order[LPM_MAX_NUM_MODES];
@@ -1000,7 +999,8 @@ static void pmc_core_get_low_power_modes(struct platform_device *pdev)
 		for (mode = 0; mode < LPM_MAX_NUM_MODES; mode++)
 			pri_order[mode_order[mode]] = mode;
 	else
-		dev_warn(&pdev->dev, "Assuming a default substate order for this platform\n");
+		dev_warn(&pmcdev->pdev->dev,
+			 "Assuming a default substate order for this platform\n");
 
 	/*
 	 * Loop through all modes from lowest to highest priority,
@@ -1250,7 +1250,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 	}
 
 	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(primary_pmc);
-	pmc_core_get_low_power_modes(pdev);
 	pmc_core_do_dmi_quirks(primary_pmc);
 
 	pmc_core_dbgfs_register(pmcdev);
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 0729f593c6a7..ccf24e0f5e50 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -490,6 +490,7 @@ extern int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value);
 
 int pmc_core_resume_common(struct pmc_dev *pmcdev);
 int get_primary_reg_base(struct pmc *pmc);
+extern void pmc_core_get_low_power_modes(struct pmc_dev *pmcdev);
 
 extern void pmc_core_ssram_init(struct pmc_dev *pmcdev);
 
diff --git a/drivers/platform/x86/intel/pmc/icl.c b/drivers/platform/x86/intel/pmc/icl.c
index d08e3174230d..71b0fd6cb7d8 100644
--- a/drivers/platform/x86/intel/pmc/icl.c
+++ b/drivers/platform/x86/intel/pmc/icl.c
@@ -53,7 +53,15 @@ const struct pmc_reg_map icl_reg_map = {
 int icl_core_init(struct pmc_dev *pmcdev)
 {
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	int ret;
 
 	pmc->map = &icl_reg_map;
-	return get_primary_reg_base(pmc);
+
+	ret = get_primary_reg_base(pmc);
+	if (ret)
+		return ret;
+
+	pmc_core_get_low_power_modes(pmcdev);
+
+	return ret;
 }
diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index 2204bc666980..c3b5f4fe01d1 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -985,7 +985,7 @@ static int mtl_resume(struct pmc_dev *pmcdev)
 int mtl_core_init(struct pmc_dev *pmcdev)
 {
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_SOC];
-	int ret = 0;
+	int ret;
 
 	mtl_d3_fixup();
 
@@ -1002,6 +1002,8 @@ int mtl_core_init(struct pmc_dev *pmcdev)
 			return ret;
 	}
 
+	pmc_core_get_low_power_modes(pmcdev);
+
 	/* Due to a hardware limitation, the GBE LTR blocks PC10
 	 * when a cable is attached. Tell the PMC to ignore it.
 	 */
diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
index 4b6f5cbda16c..ab993a69e33e 100644
--- a/drivers/platform/x86/intel/pmc/spt.c
+++ b/drivers/platform/x86/intel/pmc/spt.c
@@ -137,7 +137,15 @@ const struct pmc_reg_map spt_reg_map = {
 int spt_core_init(struct pmc_dev *pmcdev)
 {
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	int ret;
 
 	pmc->map = &spt_reg_map;
-	return get_primary_reg_base(pmc);
+
+	ret = get_primary_reg_base(pmc);
+	if (ret)
+		return ret;
+
+	pmc_core_get_low_power_modes(pmcdev);
+
+	return ret;
 }
diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
index 2449940102db..d5f1d2223c5a 100644
--- a/drivers/platform/x86/intel/pmc/tgl.c
+++ b/drivers/platform/x86/intel/pmc/tgl.c
@@ -263,6 +263,7 @@ int tgl_core_init(struct pmc_dev *pmcdev)
 	if (ret)
 		return ret;
 
+	pmc_core_get_low_power_modes(pmcdev);
 	pmc_core_get_tgl_lpm_reqs(pmcdev->pdev);
 	/* Due to a hardware limitation, the GBE LTR blocks PC10
 	 * when a cable is attached. Tell the PMC to ignore it.
-- 
2.34.1



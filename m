Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAAA7CEBAF
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Oct 2023 01:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbjJRXQd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 Oct 2023 19:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbjJRXQ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 19:16:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7F3114;
        Wed, 18 Oct 2023 16:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697670987; x=1729206987;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8VCt8DV17STK54jZDrIDZt6imOWcwv6hpZq/h5+2FW4=;
  b=D58wi+BUCFQdUm+Fg5yCjwOupkS+CuVHgm0cdvD14hPOiFBaQQUt9S7M
   9T4+EVNYvDi+V+J5VAqSxvoP4hCYeq1WCy5VMPm1WPB9wASTCWk7+nZNo
   +WWlr+tAhAMQV3d6H9MjShxFWSgp+pJ1VoJi2KK8bupcS35qGQ5PDHl17
   BHsT4J18Ub3ao0tjLq6a7wjWqgboMRW7g7+QityhiBrVoTm8xTfL04XJk
   P53Ja1sNbmEhbt2LlHLYs2dbjtHlOCOHfaMB//oKa/0BWsXDVfyJE/EXU
   PyZAYQVP3LpM9OIpt5UZatR6IgT6MPH0Fq1j/jZvM1cuW13kgC6Bzp/1X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="385013050"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="385013050"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 16:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4730735"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 16:16:30 -0700
Received: from debox1-desk4.lan (unknown [10.209.71.91])
        by linux.intel.com (Postfix) with ESMTP id 7F929580DAE;
        Wed, 18 Oct 2023 16:16:26 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ilpo.jarvinen@linux.intel.com, rajvi.jingar@linux.intel.com
Subject: [PATCH V4 15/17] platform/x86/intel/pmc: Read low power mode requirements for MTL-M and MTL-P
Date:   Wed, 18 Oct 2023 16:16:22 -0700
Message-Id: <20231018231624.1044633-16-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018231624.1044633-1-david.e.box@linux.intel.com>
References: <20231018231624.1044633-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Xi Pardee <xi.pardee@intel.com>

Add support to read the low power mode requirements for Meteor Lake M and
Meteor Lake P.

Signed-off-by: Xi Pardee <xi.pardee@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V4 - no change

V3 - directly return value from pmc_core_ssram_get_lpm_reqs()

V2 - fixed unused return value

 drivers/platform/x86/intel/pmc/mtl.c | 39 +++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index d1d3d33fb4b8..7ceeae507f4c 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -11,6 +11,13 @@
 #include <linux/pci.h>
 #include "core.h"
 
+/* PMC SSRAM PMT Telemetry GUIDS */
+#define SOCP_LPM_REQ_GUID	0x2625030
+#define IOEM_LPM_REQ_GUID	0x4357464
+#define IOEP_LPM_REQ_GUID	0x5077612
+
+static const u8 MTL_LPM_REG_INDEX[] = {0, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20};
+
 /*
  * Die Mapping to Product.
  * Product SOCDie IOEDie PCHDie
@@ -465,6 +472,7 @@ const struct pmc_reg_map mtl_socm_reg_map = {
 	.lpm_sts = mtl_socm_lpm_maps,
 	.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
 	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
+	.lpm_reg_index = MTL_LPM_REG_INDEX,
 };
 
 const struct pmc_bit_map mtl_ioep_pfear_map[] = {
@@ -782,6 +790,13 @@ const struct pmc_reg_map mtl_ioep_reg_map = {
 	.ltr_show_sts = mtl_ioep_ltr_show_map,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
+	.lpm_num_maps = ADL_LPM_NUM_MAPS,
+	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
+	.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
+	.lpm_priority_offset = MTL_LPM_PRI_OFFSET,
+	.lpm_en_offset = MTL_LPM_EN_OFFSET,
+	.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
+	.lpm_reg_index = MTL_LPM_REG_INDEX,
 };
 
 const struct pmc_bit_map mtl_ioem_pfear_map[] = {
@@ -922,6 +937,13 @@ const struct pmc_reg_map mtl_ioem_reg_map = {
 	.ltr_show_sts = mtl_ioep_ltr_show_map,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
+	.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
+	.lpm_num_maps = ADL_LPM_NUM_MAPS,
+	.lpm_priority_offset = MTL_LPM_PRI_OFFSET,
+	.lpm_en_offset = MTL_LPM_EN_OFFSET,
+	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
+	.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
+	.lpm_reg_index = MTL_LPM_REG_INDEX,
 };
 
 #define PMC_DEVID_SOCM	0x7e7f
@@ -929,16 +951,19 @@ const struct pmc_reg_map mtl_ioem_reg_map = {
 #define PMC_DEVID_IOEM	0x7ebf
 static struct pmc_info mtl_pmc_info_list[] = {
 	{
-		.devid = PMC_DEVID_SOCM,
-		.map = &mtl_socm_reg_map,
+		.guid	= SOCP_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_SOCM,
+		.map	= &mtl_socm_reg_map,
 	},
 	{
-		.devid = PMC_DEVID_IOEP,
-		.map = &mtl_ioep_reg_map,
+		.guid	= IOEP_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_IOEP,
+		.map	= &mtl_ioep_reg_map,
 	},
 	{
-		.devid = PMC_DEVID_IOEM,
-		.map = &mtl_ioem_reg_map
+		.guid	= IOEM_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_IOEM,
+		.map	= &mtl_ioem_reg_map
 	},
 	{}
 };
@@ -1014,5 +1039,5 @@ int mtl_core_init(struct pmc_dev *pmcdev)
 	dev_dbg(&pmcdev->pdev->dev, "ignoring GBE LTR\n");
 	pmc_core_send_ltr_ignore(pmcdev, 3);
 
-	return 0;
+	return pmc_core_ssram_get_lpm_reqs(pmcdev);
 }
-- 
2.34.1


Return-Path: <platform-driver-x86+bounces-14645-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79054BDB70A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Oct 2025 23:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C52C421A17
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Oct 2025 21:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B86030DD26;
	Tue, 14 Oct 2025 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCQrtxnW"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45030C60F;
	Tue, 14 Oct 2025 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760478386; cv=none; b=khaUm1YnSqXwG6bTwwFhX5r/oG7ad5sufw66AfIb3A3A3DD7MprJWJLFC2kLfWwPUbR1ApuVFYTJFfD4OAgxcXulhwWt34quwjlhQfw1LK8SiyJMAbz46dGxS8MnLVdI5mgqIkMowhqlNgbwfMVJssGo8Z4d9S2ktCnmZGK1wIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760478386; c=relaxed/simple;
	bh=7mF88/esKsfFlyBwXOX8MyPuz/QrOry0+dOI+gUH8KA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpZ4RpxkDboeJXouWGEvrDDfLEjGC5eV82Gh286uhir/MHpc4qX8X88de6HfIMyTgm4c42l2qxSP597cRDnCS49ODZLrR5WwivI7x1ya7yybnb+O4U5SkIu3ggvw7Eb61mVxpTBjM4BCAfFb0tAL1izs8dReuW0Jsn8c9HRjUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCQrtxnW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760478385; x=1792014385;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7mF88/esKsfFlyBwXOX8MyPuz/QrOry0+dOI+gUH8KA=;
  b=mCQrtxnWRVIeQ8a9z6vRluQT7J9YkSiHEAqHwq6oUXNALSQgR1hxh/Uq
   Oir3KkbrOIVbdhsHQOtI5xvdAw0FfrtpX2AuyA8T5cg9ATBYfq1aK3JwT
   usHedOj49JTOc0C7qXGhH6QPKqX/FEK6yO6PS2+T2+BbrGY/Tpla6mBTc
   YvaUEsnQS5LEHRtS+7awrYaTHOPfT0Hx2KqkomFO9oproQT+VqpnLjiHm
   S14f9BKAoha/tyP3lxGVkb2aCEU/A6ZVm5hmrTwrFTyDFsxJ1Pnh8pJM2
   kc+gyPhBvzISVtrXVmvILWmqTY0ZWSIXaOItHrN517w+GA0xUTgUxrTt2
   A==;
X-CSE-ConnectionGUID: +lslb1AgS9yi2FxNcmGXjg==
X-CSE-MsgGUID: jCKfrIuRR8qdirs6JGnY9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62682457"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62682457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 14:46:24 -0700
X-CSE-ConnectionGUID: 3Nl21WGaSi+34aixk6lPgw==
X-CSE-MsgGUID: e4t78NCFRbqpVUTr/Zpb6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="187300359"
Received: from kcaccard-desk.amr.corp.intel.com (HELO xpardee-desk.intel.com) ([10.125.111.190])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 14:46:23 -0700
From: Xi Pardee <xi.pardee@linux.intel.com>
To: xi.pardee@linux.intel.com,
	irenic.rajneesh@gmail.com,
	david.e.box@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 5/6] platform/x86:intel/pmc: Relocate lpm_req_guid to pmc_reg_map
Date: Tue, 14 Oct 2025 14:45:33 -0700
Message-ID: <20251014214548.629023-6-xi.pardee@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014214548.629023-1-xi.pardee@linux.intel.com>
References: <20251014214548.629023-1-xi.pardee@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relocate the lpm_req_guid field from pmc_info to pmc_reg_map. The
previous implementation stored lpm_req_guid in pmc_info and relied
on pmc_core_find_guid() to retrieve the correct GUID, which was
unnecessary. Since lpm_req_guid is specific to PMC, pmc_reg_map is
a more appropriate location for this information.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/arl.c  |  6 ++----
 drivers/platform/x86/intel/pmc/core.c | 15 ++-------------
 drivers/platform/x86/intel/pmc/core.h |  4 +++-
 drivers/platform/x86/intel/pmc/lnl.c  |  2 +-
 drivers/platform/x86/intel/pmc/mtl.c  |  6 +++---
 drivers/platform/x86/intel/pmc/ptl.c  |  3 +--
 6 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
index c0698ef35df89..eb23bc68340ab 100644
--- a/drivers/platform/x86/intel/pmc/arl.c
+++ b/drivers/platform/x86/intel/pmc/arl.c
@@ -281,6 +281,7 @@ static const struct pmc_reg_map arl_socs_reg_map = {
 	.etr3_offset = ETR3_OFFSET,
 	.pson_residency_offset = TGL_PSON_RESIDENCY_OFFSET,
 	.pson_residency_counter_step = TGL_PSON_RES_COUNTER_STEP,
+	.lpm_req_guid = SOCS_LPM_REQ_GUID,
 };
 
 static const struct pmc_bit_map arl_pchs_ltr_show_map[] = {
@@ -648,26 +649,23 @@ static const struct pmc_reg_map arl_pchs_reg_map = {
 	.lpm_num_maps = ADL_LPM_NUM_MAPS,
 	.lpm_reg_index = ARL_LPM_REG_INDEX,
 	.etr3_offset = ETR3_OFFSET,
+	.lpm_req_guid = PCHS_LPM_REQ_GUID,
 };
 
 static struct pmc_info arl_pmc_info_list[] = {
 	{
-		.guid	= IOEP_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_ARL_IOEP,
 		.map	= &mtl_ioep_reg_map,
 	},
 	{
-		.guid	= SOCS_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_ARL_SOCS,
 		.map	= &arl_socs_reg_map,
 	},
 	{
-		.guid	= PCHS_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_ARL_PCHS,
 		.map	= &arl_pchs_reg_map,
 	},
 	{
-		.guid	= SOCM_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_ARL_SOCM,
 		.map	= &mtl_socm_reg_map,
 	},
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 18a5aa073637a..f10445220c2aa 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1445,15 +1445,6 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev, struct pmc_dev_info
 	}
 }
 
-static u32 pmc_core_find_guid(struct pmc_info *list, const struct pmc_reg_map *map)
-{
-	for (; list->map; ++list)
-		if (list->map == map)
-			return list->guid;
-
-	return 0;
-}
-
 /*
  * This function retrieves low power mode requirement data from PMC Low
  * Power Mode (LPM) table.
@@ -1569,7 +1560,6 @@ static int pmc_core_get_telem_info(struct pmc_dev *pmcdev, struct pmc_dev_info *
 	struct pci_dev *pcidev __free(pci_dev_put) = NULL;
 	struct telem_endpoint *ep;
 	unsigned int pmc_idx;
-	u32 guid;
 	int ret;
 
 	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(20, pmc_dev_info->pci_func));
@@ -1583,11 +1573,10 @@ static int pmc_core_get_telem_info(struct pmc_dev *pmcdev, struct pmc_dev_info *
 		if (!pmc)
 			continue;
 
-		guid = pmc_core_find_guid(pmcdev->regmap_list, pmc->map);
-		if (!guid)
+		if (!pmc->map->lpm_req_guid)
 			return -ENXIO;
 
-		ep = pmt_telem_find_and_register_endpoint(pcidev, guid, 0);
+		ep = pmt_telem_find_and_register_endpoint(pcidev, pmc->map->lpm_req_guid, 0);
 		if (IS_ERR(ep)) {
 			dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %pe", ep);
 			return -EPROBE_DEFER;
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index d80257b37ca98..cccd3bcafe00d 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -356,6 +356,7 @@ struct pmc_bit_map {
  * @s0ix_blocker_offset PWRMBASE offset to S0ix blocker counter
  * @num_s0ix_blocker:	Number of S0ix blockers
  * @blocker_req_offset:	Telemetry offset to S0ix blocker low power mode substate requirement table
+ * @lpm_req_guid:	Telemetry GUID to read low power mode substate requirement table
  *
  * Each PCH has unique set of register offsets and bit indexes. This structure
  * captures them to have a common implementation.
@@ -397,6 +398,8 @@ struct pmc_reg_map {
 	const u8  *lpm_reg_index;
 	const u32 pson_residency_offset;
 	const u32 pson_residency_counter_step;
+	/* GUID for telemetry regions */
+	const u32 lpm_req_guid;
 };
 
 /**
@@ -406,7 +409,6 @@ struct pmc_reg_map {
  *			specific attributes
  */
 struct pmc_info {
-	u32 guid;
 	u16 devid;
 	const struct pmc_reg_map *map;
 };
diff --git a/drivers/platform/x86/intel/pmc/lnl.c b/drivers/platform/x86/intel/pmc/lnl.c
index 6fa027e7071f4..1cd81ee54dcf8 100644
--- a/drivers/platform/x86/intel/pmc/lnl.c
+++ b/drivers/platform/x86/intel/pmc/lnl.c
@@ -533,11 +533,11 @@ static const struct pmc_reg_map lnl_socm_reg_map = {
 	.s0ix_blocker_maps = lnl_blk_maps,
 	.s0ix_blocker_offset = LNL_S0IX_BLOCKER_OFFSET,
 	.lpm_reg_index = LNL_LPM_REG_INDEX,
+	.lpm_req_guid = SOCM_LPM_REQ_GUID,
 };
 
 static struct pmc_info lnl_pmc_info_list[] = {
 	{
-		.guid	= SOCM_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_LNL_SOCM,
 		.map	= &lnl_socm_reg_map,
 	},
diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index 19470ca311cf7..57508cbf9cd42 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -473,6 +473,7 @@ const struct pmc_reg_map mtl_socm_reg_map = {
 	.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
 	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
 	.lpm_reg_index = MTL_LPM_REG_INDEX,
+	.lpm_req_guid = SOCP_LPM_REQ_GUID,
 };
 
 static const struct pmc_bit_map mtl_ioep_pfear_map[] = {
@@ -797,6 +798,7 @@ const struct pmc_reg_map mtl_ioep_reg_map = {
 	.lpm_en_offset = MTL_LPM_EN_OFFSET,
 	.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
 	.lpm_reg_index = MTL_LPM_REG_INDEX,
+	.lpm_req_guid = IOEP_LPM_REQ_GUID,
 };
 
 static const struct pmc_bit_map mtl_ioem_pfear_map[] = {
@@ -944,21 +946,19 @@ static const struct pmc_reg_map mtl_ioem_reg_map = {
 	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
 	.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
 	.lpm_reg_index = MTL_LPM_REG_INDEX,
+	.lpm_req_guid = IOEM_LPM_REQ_GUID,
 };
 
 static struct pmc_info mtl_pmc_info_list[] = {
 	{
-		.guid	= SOCP_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_MTL_SOCM,
 		.map	= &mtl_socm_reg_map,
 	},
 	{
-		.guid	= IOEP_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_MTL_IOEP,
 		.map	= &mtl_ioep_reg_map,
 	},
 	{
-		.guid	= IOEM_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_MTL_IOEM,
 		.map	= &mtl_ioem_reg_map
 	},
diff --git a/drivers/platform/x86/intel/pmc/ptl.c b/drivers/platform/x86/intel/pmc/ptl.c
index 1b35b84e06fa2..1f48e2bbc699f 100644
--- a/drivers/platform/x86/intel/pmc/ptl.c
+++ b/drivers/platform/x86/intel/pmc/ptl.c
@@ -528,16 +528,15 @@ static const struct pmc_reg_map ptl_pcdp_reg_map = {
 	.s0ix_blocker_offset = LNL_S0IX_BLOCKER_OFFSET,
 	.num_s0ix_blocker = PTL_NUM_S0IX_BLOCKER,
 	.blocker_req_offset = PTL_BLK_REQ_OFFSET,
+	.lpm_req_guid = PCDP_LPM_REQ_GUID,
 };
 
 static struct pmc_info ptl_pmc_info_list[] = {
 	{
-		.guid	= PCDP_LPM_REQ_GUID,
 		.devid	= PMC_DEVID_PTL_PCDH,
 		.map	= &ptl_pcdp_reg_map,
 	},
 	{
-		.guid   = PCDP_LPM_REQ_GUID,
 		.devid  = PMC_DEVID_PTL_PCDP,
 		.map    = &ptl_pcdp_reg_map,
 	},
-- 
2.43.0



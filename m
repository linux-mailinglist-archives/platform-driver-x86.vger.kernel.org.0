Return-Path: <platform-driver-x86+bounces-162-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0E87FE2F0
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 23:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 177D828218B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 22:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A653B1A1;
	Wed, 29 Nov 2023 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYCIn3qp"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422EFA8;
	Wed, 29 Nov 2023 14:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296502; x=1732832502;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XwhfWuy+bq1RolUlxjYZAzfBQKpo5+rwImS6TwTG/Zg=;
  b=VYCIn3qpfDmjw/wAgXj74Qvb2LPBg5HJmAJSwjwv6H+NdKrAfwguH13L
   oUyMMVZ1q4w0XNRl7x5YUtuxIZ1BPQI9woQTHSHeAOuHS/6U0T9Vx4O3a
   Q1UxS/Sn89yh8v3xiSdXoRFjRE/EWvJlKFwP8jjrggtQs1gDehVIbKJ1m
   U47E2FbkwinqCOaKsSYcBHCnE8ZrSPEfCyYD5Wrl//G0DzHUlEFPvt7e6
   gGxJBISlXWS1tD5/yRNmS3Yf7ZJ/AguATZOlrJkFbeBxHiuzoCytCX4ow
   dcZJ/SL04R7iMX5b6fG+WQlLvF3UOEAqw8fqgieF/iyql7U9toFbz7iQQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937009"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070441"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070441"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:34 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id 977E5580BF8;
	Wed, 29 Nov 2023 14:21:34 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 16/20] platform/x86/intel/pmc: Display LPM requirements for multiple PMCs
Date: Wed, 29 Nov 2023 14:21:28 -0800
Message-Id: <20231129222132.2331261-17-david.e.box@linux.intel.com>
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

From: Rajvi Jingar <rajvi.jingar@linux.intel.com>

Update the substate_requirements attribute to display the requirements for
all the PMCs on a package.

Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - Add comment to document reason to check lpm_req_regs for NULL again

V5 - Use conditional instead of if/else to do seq_printf()

V4 - No change

V3 - Add missing submitter signoff

V2 - no change

 drivers/platform/x86/intel/pmc/core.c | 123 ++++++++++++++------------
 1 file changed, 68 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 3894119d61b0..9d3a1b6ef622 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -728,7 +728,7 @@ static int pmc_core_substate_l_sts_regs_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_l_sts_regs);
 
-static void pmc_core_substate_req_header_show(struct seq_file *s)
+static void pmc_core_substate_req_header_show(struct seq_file *s, int pmc_index)
 {
 	struct pmc_dev *pmcdev = s->private;
 	int i, mode;
@@ -743,68 +743,81 @@ static void pmc_core_substate_req_header_show(struct seq_file *s)
 static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
-	const struct pmc_bit_map **maps = pmc->map->lpm_sts;
-	const struct pmc_bit_map *map;
-	const int num_maps = pmc->map->lpm_num_maps;
-	u32 sts_offset = pmc->map->lpm_status_offset;
-	u32 *lpm_req_regs = pmc->lpm_req_regs;
-	int mp;
+	u32 sts_offset;
+	u32 *lpm_req_regs;
+	int num_maps, mp, pmc_index;
 
-	/* Display the header */
-	pmc_core_substate_req_header_show(s);
+	for (pmc_index = 0; pmc_index < ARRAY_SIZE(pmcdev->pmcs); ++pmc_index) {
+		struct pmc *pmc = pmcdev->pmcs[pmc_index];
+		const struct pmc_bit_map **maps;
 
-	/* Loop over maps */
-	for (mp = 0; mp < num_maps; mp++) {
-		u32 req_mask = 0;
-		u32 lpm_status;
-		int mode, idx, i, len = 32;
+		if (!pmc)
+			continue;
+
+		maps = pmc->map->lpm_sts;
+		num_maps = pmc->map->lpm_num_maps;
+		sts_offset = pmc->map->lpm_status_offset;
+		lpm_req_regs = pmc->lpm_req_regs;
 
 		/*
-		 * Capture the requirements and create a mask so that we only
-		 * show an element if it's required for at least one of the
-		 * enabled low power modes
+		 * When there are multiple PMCs, though the PMC may exist, the
+		 * requirement register discovery could have failed so check
+		 * before accessing.
 		 */
-		pmc_for_each_mode(idx, mode, pmcdev)
-			req_mask |= lpm_req_regs[mp + (mode * num_maps)];
-
-		/* Get the last latched status for this map */
-		lpm_status = pmc_core_reg_read(pmc, sts_offset + (mp * 4));
-
-		/*  Loop over elements in this map */
-		map = maps[mp];
-		for (i = 0; map[i].name && i < len; i++) {
-			u32 bit_mask = map[i].bit_mask;
-
-			if (!(bit_mask & req_mask))
-				/*
-				 * Not required for any enabled states
-				 * so don't display
-				 */
-				continue;
-
-			/* Display the element name in the first column */
-			seq_printf(s, "%30s |", map[i].name);
-
-			/* Loop over the enabled states and display if required */
-			pmc_for_each_mode(idx, mode, pmcdev) {
-				if (lpm_req_regs[mp + (mode * num_maps)] & bit_mask)
-					seq_printf(s, " %9s |",
-						   "Required");
-				else
-					seq_printf(s, " %9s |", " ");
+		if (!lpm_req_regs)
+			continue;
+
+		/* Display the header */
+		pmc_core_substate_req_header_show(s, pmc_index);
+
+		/* Loop over maps */
+		for (mp = 0; mp < num_maps; mp++) {
+			u32 req_mask = 0;
+			u32 lpm_status;
+			const struct pmc_bit_map *map;
+			int mode, idx, i, len = 32;
+
+			/*
+			 * Capture the requirements and create a mask so that we only
+			 * show an element if it's required for at least one of the
+			 * enabled low power modes
+			 */
+			pmc_for_each_mode(idx, mode, pmcdev)
+				req_mask |= lpm_req_regs[mp + (mode * num_maps)];
+
+			/* Get the last latched status for this map */
+			lpm_status = pmc_core_reg_read(pmc, sts_offset + (mp * 4));
+
+			/*  Loop over elements in this map */
+			map = maps[mp];
+			for (i = 0; map[i].name && i < len; i++) {
+				u32 bit_mask = map[i].bit_mask;
+
+				if (!(bit_mask & req_mask)) {
+					/*
+					 * Not required for any enabled states
+					 * so don't display
+					 */
+					continue;
+				}
+
+				/* Display the element name in the first column */
+				seq_printf(s, "pmc%d: %26s |", pmc_index, map[i].name);
+
+				/* Loop over the enabled states and display if required */
+				pmc_for_each_mode(idx, mode, pmcdev) {
+					bool required = lpm_req_regs[mp + (mode * num_maps)] &
+							bit_mask;
+					seq_printf(s, " %9s |", required ? "Required" : " ");
+				}
+
+				/* In Status column, show the last captured state of this agent */
+				seq_printf(s, " %9s |", lpm_status & bit_mask ? "Yes" : " ");
+
+				seq_puts(s, "\n");
 			}
-
-			/* In Status column, show the last captured state of this agent */
-			if (lpm_status & bit_mask)
-				seq_printf(s, " %9s |", "Yes");
-			else
-				seq_printf(s, " %9s |", " ");
-
-			seq_puts(s, "\n");
 		}
 	}
-
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_req_regs);
-- 
2.34.1



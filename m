Return-Path: <platform-driver-x86+bounces-158-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1127FE2EB
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 23:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93CDA2821F5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 22:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D042B3B1A4;
	Wed, 29 Nov 2023 22:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhTyLuFc"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42C7DC;
	Wed, 29 Nov 2023 14:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296501; x=1732832501;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nE/Fz9/Og+Wogrm3SSh3ppiII4ChSXaZ/7QfluPgCK0=;
  b=bhTyLuFcE2wblHWZayKwr42Ozk6+tSlOcacKukJN5+K0+I6FHH9aKo4u
   ImucKErp1ST7zjQvt/Eywn6e8gRTL5Zk8JT3YpE655QdahbB2Hm3SntTs
   oae6ZkHMAy+0H4xyKQHSeWJCgWSB8z9oL+gEGJOq7ZAOOUnzZvKbHbtrd
   vT9z9ukhFUDIDc75D5iXkY3C+Kb27EzJUXr0fSNqwo4Jns+gT0k80i45T
   O2MuQbP0zEYc0CS1ySYPugiKxGCArMf+08VrpZ4c6MZIiw4ikXU8g0HcF
   +4Nw4vZbDDhLfH1O34ACg52Rft/FBauYSnnL83OGfR2ZWWWNcZ5kBb/d4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937001"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070430"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070430"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:34 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id 57C08580CB8;
	Wed, 29 Nov 2023 14:21:34 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 14/20] platform/x86/intel/pmc/mtl: Use return value from pmc_core_ssram_init()
Date: Wed, 29 Nov 2023 14:21:26 -0800
Message-Id: <20231129222132.2331261-15-david.e.box@linux.intel.com>
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

Instead of checking for a NULL regbase, use the return value from
pmc_core_ssram_init() to check if PMC discovery was successful. If not, use
the legacy enumeration method (which only works for the primary PMC).

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No change

V5 - New patch. Split from previous.

 drivers/platform/x86/intel/pmc/mtl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index c3b5f4fe01d1..d1d3d33fb4b8 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -990,12 +990,16 @@ int mtl_core_init(struct pmc_dev *pmcdev)
 	mtl_d3_fixup();
 
 	pmcdev->resume = mtl_resume;
-
 	pmcdev->regmap_list = mtl_pmc_info_list;
-	pmc_core_ssram_init(pmcdev);
 
-	/* If regbase not assigned, set map and discover using legacy method */
-	if (!pmc->regbase) {
+	/*
+	 * If ssram init fails use legacy method to at least get the
+	 * primary PMC
+	 */
+	ret = pmc_core_ssram_init(pmcdev);
+	if (ret) {
+		dev_warn(&pmcdev->pdev->dev,
+			 "ssram init failed, %d, using legacy init\n", ret);
 		pmc->map = &mtl_socm_reg_map;
 		ret = get_primary_reg_base(pmc);
 		if (ret)
-- 
2.34.1



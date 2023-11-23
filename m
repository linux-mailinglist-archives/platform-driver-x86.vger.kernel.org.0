Return-Path: <platform-driver-x86+bounces-15-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD0E7F5725
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 05:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A03628176C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 04:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7883ABE52;
	Thu, 23 Nov 2023 04:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmL1X/Ve"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580E21B6;
	Wed, 22 Nov 2023 20:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712241; x=1732248241;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6wOAYg5B96EPZlKq34DSSYjbIZg9BCveMrrLsV0j/bk=;
  b=nmL1X/VeWOBuyxRWJe3UQnJzFMafvTZtTYRA1OVHpAmizThUlevVUEY2
   ms1OLTpZTZanwSKiQb8lMihs9YelUcP4QXunksnyjslTMgi0TPMYOmCEy
   O1CuwY/7jS5oASKlF31FnNgAWamlV2JeVqny9qL3aGplUqlgf5uuUfD0J
   L+dcCpmZAmR4YlYUNqbzxspBgD6z/KPO3LWmCu+UB35Iz9i62cRVhobWA
   N4TbVTN0/fy5BBFJF6b8JLlkyq39X+5ePLPkc90oBwlwoThjHpvbuTPy1
   O50Sr4jlJv6rzlAo7rRCtLScwfRaE50idT0jXjVZD83SWJ6o9OAqGGD8P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5334665"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="5334665"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837671157"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="837671157"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:57 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id 133F9580CA4;
	Wed, 22 Nov 2023 20:03:57 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 14/20] platform/x86/intel/pmc/mtl: Use return value from pmc_core_ssram_init()
Date: Wed, 22 Nov 2023 20:03:49 -0800
Message-Id: <20231123040355.82139-15-david.e.box@linux.intel.com>
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

Instead of checking for a NULL regbase, use the return value from
pmc_core_ssram_init() to check if PMC discovery was successful. If not, use
the legacy enumeration method (which only works for the primary PMC).

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
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



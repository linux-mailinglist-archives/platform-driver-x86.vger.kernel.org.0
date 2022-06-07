Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0334153B086
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Jun 2022 02:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbiFAXRz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 1 Jun 2022 19:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbiFAXRy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Jun 2022 19:17:54 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5109120C254
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jun 2022 16:17:53 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="362134816"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="362134816"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 16:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="633763304"
Received: from otc-chromeosbuild-5.ostc.intel.com (HELO otc-chromeosbuild-5.intel.com) ([10.54.29.149])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2022 16:17:52 -0700
From:   George D Sworo <gdsworo@vger.kernel.org>
To:     david.e.box@intel.com
Cc:     platform-driver-x86@vger.kernel.org,
        George D Sworo <george.d.sworo@intel.com>
Subject: [PATCH] platform/x86/intel: pmc: Support Intel Raptorlake P
Date:   Wed,  1 Jun 2022 16:17:50 -0700
Message-Id: <20220601231750.16584-1-george.d.sworo@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: George D Sworo <george.d.sworo@intel.com>

Add Raptorlake P to the list of the platforms that intel_pmc_core driver
supports for pmc_core device. Raptorlake P PCH is based on Alderlake P
PCH.

Signed-off-by: George D Sworo <george.d.sworo@intel.com>
---
 drivers/platform/x86/intel/pmc/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index edaf22e5ae98..40183bda7894 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1912,6 +1912,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE,		&tgl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L,		&tgl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
+	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
 	{}
 };
 
-- 
2.17.1


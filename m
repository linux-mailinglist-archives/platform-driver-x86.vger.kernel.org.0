Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496D81B20FD
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Apr 2020 10:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgDUIEd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Apr 2020 04:04:33 -0400
Received: from mga02.intel.com ([134.134.136.20]:45670 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726106AbgDUIEc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Apr 2020 04:04:32 -0400
IronPort-SDR: THQ9mZ/oKxrMHbJmIaCacLwR5HCuZRZlE2O8jZmKDr9hsWkoCYhR4KO9AIN2Lych2P0FJ5ZZ2q
 9wQFHrsm0u7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 01:04:31 -0700
IronPort-SDR: 3xBX9zKLFwqdK/7IV3sMMhMk6L/yrrh7Et0d1aYuIXRv+rCjuMV1CiRlzKSczQEJFzd48TA5Hq
 j7fI1aaYsxjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; 
   d="scan'208";a="402113672"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.138])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2020 01:04:29 -0700
From:   Archana Patni <archana.patni@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, david.e.box@intel.com,
        srinivas.pandruvada@intel.com, subramony.sesha@intel.com,
        divagar.mohandass@intel.com,
        Archana Patni <archana.patni@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_core: Change Jasper Lake S0ix debug reg map back to ICL
Date:   Tue, 21 Apr 2020 14:10:19 +0530
Message-Id: <1587458419-23308-1-git-send-email-archana.patni@intel.com>
X-Mailer: git-send-email 1.9.1
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Jasper Lake uses Icelake PCH IPs and the S0ix debug interfaces are same as
Icelake. It uses SLP_S0_DBG register latch/read interface from Icelake
generation. It doesn't use Tiger Lake LPM debug registers. Change the
Jasper Lake S0ix debug interface to use the ICL reg map.

Fixes: 16292bed9c ("platform/x86: intel_pmc_core: Add Atom based Jasper Lake (JSL) platform support")
Signed-off-by: Archana Patni <archana.patni@intel.com>
Acked-by: David E. Box <david.e.box@intel.com>
Tested-by: Divagar Mohandass <divagar.mohandass@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index d2a5d4c..a130859 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -255,7 +255,7 @@
 };
 
 static const struct pmc_bit_map icl_pfear_map[] = {
-	/* Ice Lake generation onwards only */
+	/* Ice Lake and Jasper Lake generation onwards only */
 	{"RES_65",		BIT(0)},
 	{"RES_66",		BIT(1)},
 	{"RES_67",		BIT(2)},
@@ -274,7 +274,7 @@
 };
 
 static const struct pmc_bit_map tgl_pfear_map[] = {
-	/* Tiger Lake, Elkhart Lake and Jasper Lake generation onwards only */
+	/* Tiger Lake and Elkhart Lake generation onwards only */
 	{"PSF9",		BIT(0)},
 	{"RES_66",		BIT(1)},
 	{"RES_67",		BIT(2)},
@@ -1156,7 +1156,7 @@ static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L,		&tgl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE,		&tgl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT,	&tgl_reg_map),
-	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&tgl_reg_map),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&icl_reg_map),
 	{}
 };
 
-- 
1.9.1


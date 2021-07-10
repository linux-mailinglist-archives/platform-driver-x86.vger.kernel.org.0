Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC9E3C3692
	for <lists+platform-driver-x86@lfdr.de>; Sat, 10 Jul 2021 21:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhGJTyX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 10 Jul 2021 15:54:23 -0400
Received: from mga14.intel.com ([192.55.52.115]:24381 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231474AbhGJTyX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Jul 2021 15:54:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10041"; a="209659942"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; 
   d="scan'208";a="209659942"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2021 12:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; 
   d="scan'208";a="411671364"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by orsmga006.jf.intel.com with ESMTP; 10 Jul 2021 12:51:37 -0700
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com, andriy.shevchenko@linux.intel.com,
        vicamo.yang@canonical.com, srinivas.pandruvada@intel.com,
        david.e.box@intel.com, linux-kernel@vger.kernel.org,
        tamar.mashiah@intel.com, gregkh@linuxfoundation.org,
        rajatja@google.com, Shyam-sundar.S-k@amd.com,
        Alexander.Deucher@amd.com, mlimonci@amd.com,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 3/5] platform/x86/intel: pmc/core: Add Latency Tolerance Reporting (LTR) support to Alder Lake
Date:   Sat, 10 Jul 2021 12:48:15 -0700
Message-Id: <5cbc8d35019cc18d4ed54a3cc40e4c4e9fdee5d2.1625944730.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625944730.git.gayatri.kammela@intel.com>
References: <cover.1625944730.git.gayatri.kammela@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support to show the Latency Tolerance Reporting for the IPs on
the Alder Lake PCH as reported by the PMC. This LTR support on
Alder Lake is slightly different from the Cannon lake PCH that is being
reused by all platforms till Tiger Lake.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Tested-by: You-Sheng Yang <vicamo.yang@canonical.com>
Acked-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel/pmc/core.c | 39 +++++++++++++++++++++++++++
 drivers/platform/x86/intel/pmc/core.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 441018e3ce96..611019bfe685 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -699,10 +699,48 @@ static const struct pmc_bit_map *ext_adl_pfear_map[] = {
 	NULL
 };
 
+static const struct pmc_bit_map adl_ltr_show_map[] = {
+	{"SOUTHPORT_A",		CNP_PMC_LTR_SPA},
+	{"SOUTHPORT_B",		CNP_PMC_LTR_SPB},
+	{"SATA",		CNP_PMC_LTR_SATA},
+	{"GIGABIT_ETHERNET",	CNP_PMC_LTR_GBE},
+	{"XHCI",		CNP_PMC_LTR_XHCI},
+	{"SOUTHPORT_F",		ADL_PMC_LTR_SPF},
+	{"ME",			CNP_PMC_LTR_ME},
+	/* EVA is Enterprise Value Add, doesn't really exist on PCH */
+	{"SATA1",		CNP_PMC_LTR_EVA},
+	{"SOUTHPORT_C",		CNP_PMC_LTR_SPC},
+	{"HD_AUDIO",		CNP_PMC_LTR_AZ},
+	{"CNV",			CNP_PMC_LTR_CNV},
+	{"LPSS",		CNP_PMC_LTR_LPSS},
+	{"SOUTHPORT_D",		CNP_PMC_LTR_SPD},
+	{"SOUTHPORT_E",		CNP_PMC_LTR_SPE},
+	{"SATA2",		CNP_PMC_LTR_CAM},
+	{"ESPI",		CNP_PMC_LTR_ESPI},
+	{"SCC",			CNP_PMC_LTR_SCC},
+	{"ISH",			CNP_PMC_LTR_ISH},
+	{"UFSX2",		CNP_PMC_LTR_UFSX2},
+	{"EMMC",		CNP_PMC_LTR_EMMC},
+	/*
+	 * Check intel_pmc_core_ids[] users of cnp_reg_map for
+	 * a list of core SoCs using this.
+	 */
+	{"WIGIG",		ICL_PMC_LTR_WIGIG},
+	{"THC0",		TGL_PMC_LTR_THC0},
+	{"THC1",		TGL_PMC_LTR_THC1},
+	{"SOUTHPORT_G",		CNP_PMC_LTR_RESERVED},
+
+	/* Below two cannot be used for LTR_IGNORE */
+	{"CURRENT_PLATFORM",	CNP_PMC_LTR_CUR_PLT},
+	{"AGGREGATED_SYSTEM",	CNP_PMC_LTR_CUR_ASLT},
+	{}
+};
+
 static const struct pmc_reg_map adl_reg_map = {
 	.pfear_sts = ext_adl_pfear_map,
 	.slp_s0_offset = ADL_PMC_SLP_S0_RES_COUNTER_OFFSET,
 	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
+	.ltr_show_sts = adl_ltr_show_map,
 	.msr_sts = msr_map,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.regmap_length = CNP_PMC_MMIO_REG_LEN,
@@ -710,6 +748,7 @@ static const struct pmc_reg_map adl_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
 };
 
 static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index c0ca20b32c6b..45b352ece6db 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -197,6 +197,8 @@ enum ppfear_regs {
 #define TGL_NUM_IP_IGN_ALLOWED			23
 #define TGL_PMC_LPM_RES_COUNTER_STEP_X2		61	/* 30.5us * 2 */
 
+#define ADL_PMC_LTR_SPF				0x1C00
+#define ADL_NUM_IP_IGN_ALLOWED			23
 #define ADL_PMC_SLP_S0_RES_COUNTER_OFFSET	0x1098
 
 /*
-- 
2.25.1


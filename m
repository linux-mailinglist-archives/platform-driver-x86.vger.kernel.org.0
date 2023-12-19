Return-Path: <platform-driver-x86+bounces-535-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2981807D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 19 Dec 2023 05:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4A61F24CFD
	for <lists+platform-driver-x86@lfdr.de>; Tue, 19 Dec 2023 04:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0E411C88;
	Tue, 19 Dec 2023 04:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elV2GlX4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422B881E;
	Tue, 19 Dec 2023 04:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702959756; x=1734495756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GjUuxEXvvyaPQm+I95H+aeBVZDcFSNDD75cGEHMcQ+o=;
  b=elV2GlX4JDLpXXn9zCM7YdVNGHDNnoQn68lcV4OIeRXGFQT5XbV5Th92
   kn/2oL1EubK0qgcX3VAdbw/gf6gsZ+ViVYSZHxkTgOeR27i1avDrJBjp5
   Vpdt2sS/azcJdaMZtoz95kcQCSe6MERnC1pjHEMmvsaPCqx/vcRO7Jdyh
   RzAi3Qq2p5/A4sf2JFqrZPv3s8954C8IjBaHyLyfiCloCvddUmJskxFnn
   HLlkCvU8U0tDh7b8WnUnjWGQhFNQeMnYGqji+JQ3rzBd0LGwPl3kIryTI
   bRIBrwoxFXV5cjBeFmjHr4kOL39w+wBm+uXV6bFSVYA8u86Ryok2afQNK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2455993"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="2455993"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 20:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="919503123"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="919503123"
Received: from mnichels-mobl1.amr.corp.intel.com (HELO rjingar-desk5.intel.com) ([10.212.29.225])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 20:22:31 -0800
From: rjingar <rajvi.jingar@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: rajvi.jingar@linux.intel.com
Subject: [PATCH 7/8] platform/x86/intel/pmc: Add Arrow Lake S support to intel_pmc_core driver
Date: Mon, 18 Dec 2023 20:22:15 -0800
Message-Id: <20231219042216.2592029-7-rajvi.jingar@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219042216.2592029-1-rajvi.jingar@linux.intel.com>
References: <20231219042216.2592029-1-rajvi.jingar@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajvi Jingar <rajvi.jingar@linux.intel.com>

Add Arrow Lake S support in intel_pmc_core driver

Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/Makefile |   2 +-
 drivers/platform/x86/intel/pmc/arl.c    | 733 ++++++++++++++++++++++++
 drivers/platform/x86/intel/pmc/core.c   |   1 +
 drivers/platform/x86/intel/pmc/core.h   |  38 ++
 4 files changed, 773 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/intel/pmc/arl.c

diff --git a/drivers/platform/x86/intel/pmc/Makefile b/drivers/platform/x86/intel/pmc/Makefile
index 3a4cf1cbc1ca..74655e176178 100644
--- a/drivers/platform/x86/intel/pmc/Makefile
+++ b/drivers/platform/x86/intel/pmc/Makefile
@@ -4,7 +4,7 @@
 #
 
 intel_pmc_core-y			:= core.o core_ssram.o spt.o cnp.o \
-					   icl.o tgl.o adl.o mtl.o
+					   icl.o tgl.o adl.o mtl.o arl.o
 obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o
 intel_pmc_core_pltdrv-y			:= pltdrv.o
 obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core_pltdrv.o
diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
new file mode 100644
index 000000000000..57a4115d9031
--- /dev/null
+++ b/drivers/platform/x86/intel/pmc/arl.c
@@ -0,0 +1,733 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file contains platform specific structure definitions
+ * and init function used by Meteor Lake PCH.
+ *
+ * Copyright (c) 2022, Intel Corporation.
+ * All Rights Reserved.
+ *
+ */
+
+#include <linux/pci.h>
+#include "core.h"
+#include "../pmt/telemetry.h"
+
+/* PMC SSRAM PMT Telemetry GUID */
+#define IOEP_LPM_REQ_GUID	0x5077612
+#define SOCS_LPM_REQ_GUID	0x8478657
+#define PCHS_LPM_REQ_GUID	0x9684572
+
+static const u8 ARL_LPM_REG_INDEX[] = {0, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20};
+
+const struct pmc_bit_map arl_socs_ltr_show_map[] = {
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
+	{"SOUTHPORT_G",		MTL_PMC_LTR_SPG},
+	{"Reserved",		ARL_SOCS_PMC_LTR_RESERVED},
+	{"IOE_PMC",		MTL_PMC_LTR_IOE_PMC},
+	{"DMI3",		ARL_PMC_LTR_DMI3},
+
+	/* Below two cannot be used for LTR_IGNORE */
+	{"CURRENT_PLATFORM",	CNP_PMC_LTR_CUR_PLT},
+	{"AGGREGATED_SYSTEM",	CNP_PMC_LTR_CUR_ASLT},
+	{}
+};
+
+const struct pmc_bit_map arl_socs_clocksource_status_map[] = {
+	{"AON2_OFF_STS",		BIT(0)},
+	{"AON3_OFF_STS",		BIT(1)},
+	{"AON4_OFF_STS",		BIT(2)},
+	{"AON5_OFF_STS",		BIT(3)},
+	{"AON1_OFF_STS",		BIT(4)},
+	{"XTAL_LVM_OFF_STS",		BIT(5)},
+	{"AON3_SPL_OFF_STS",		BIT(9)},
+	{"DMI3FPW_0_PLL_OFF_STS",	BIT(10)},
+	{"DMI3FPW_1_PLL_OFF_STS",	BIT(11)},
+	{"G5X16FPW_0_PLL_OFF_STS",	BIT(14)},
+	{"G5X16FPW_1_PLL_OFF_STS",	BIT(15)},
+	{"G5X16FPW_2_PLL_OFF_STS",	BIT(16)},
+	{"XTAL_AGGR_OFF_STS",		BIT(17)},
+	{"USB2_PLL_OFF_STS",		BIT(18)},
+	{"G5X16FPW_3_PLL_OFF_STS",	BIT(19)},
+	{"BCLK_EXT_INJ_CLK_OFF_STS",	BIT(20)},
+	{"PHY_OC_EXT_INJ_CLK_OFF_STS",	BIT(21)},
+	{"FILTER_PLL_OFF_STS",		BIT(22)},
+	{"FABRIC_PLL_OFF_STS",		BIT(25)},
+	{"SOC_PLL_OFF_STS",		BIT(26)},
+	{"PCIEFAB_PLL_OFF_STS",		BIT(27)},
+	{"REF_PLL_OFF_STS",		BIT(28)},
+	{"GENLOCK_FILTER_PLL_OFF_STS",	BIT(30)},
+	{"RTC_PLL_OFF_STS",		BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map arl_socs_power_gating_status_0_map[] = {
+	{"PMC_PGD0_PG_STS",		BIT(0)},
+	{"DMI_PGD0_PG_STS",		BIT(1)},
+	{"ESPISPI_PGD0_PG_STS",		BIT(2)},
+	{"XHCI_PGD0_PG_STS",		BIT(3)},
+	{"SPA_PGD0_PG_STS",		BIT(4)},
+	{"SPB_PGD0_PG_STS",		BIT(5)},
+	{"SPC_PGD0_PG_STS",		BIT(6)},
+	{"GBE_PGD0_PG_STS",		BIT(7)},
+	{"SATA_PGD0_PG_STS",		BIT(8)},
+	{"FIACPCB_P5x16_PGD0_PG_STS",	BIT(9)},
+	{"G5x16FPW_PGD0_PG_STS",	BIT(10)},
+	{"FIA_D_PGD0_PG_STS",		BIT(11)},
+	{"MPFPW2_PGD0_PG_STS",		BIT(12)},
+	{"SPD_PGD0_PG_STS",		BIT(13)},
+	{"LPSS_PGD0_PG_STS",		BIT(14)},
+	{"LPC_PGD0_PG_STS",		BIT(15)},
+	{"SMB_PGD0_PG_STS",		BIT(16)},
+	{"ISH_PGD0_PG_STS",		BIT(17)},
+	{"P2S_PGD0_PG_STS",		BIT(18)},
+	{"NPK_PGD0_PG_STS",		BIT(19)},
+	{"DMI3FPW_PGD0_PG_STS",		BIT(20)},
+	{"GBETSN1_PGD0_PG_STS",		BIT(21)},
+	{"FUSE_PGD0_PG_STS",		BIT(22)},
+	{"FIACPCB_D_PGD0_PG_STS",	BIT(23)},
+	{"FUSEGPSB_PGD0_PG_STS",	BIT(24)},
+	{"XDCI_PGD0_PG_STS",		BIT(25)},
+	{"EXI_PGD0_PG_STS",		BIT(26)},
+	{"CSE_PGD0_PG_STS",		BIT(27)},
+	{"KVMCC_PGD0_PG_STS",		BIT(28)},
+	{"PMT_PGD0_PG_STS",		BIT(29)},
+	{"CLINK_PGD0_PG_STS",		BIT(30)},
+	{"PTIO_PGD0_PG_STS",		BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map arl_socs_power_gating_status_1_map[] = {
+	{"USBR0_PGD0_PG_STS",		BIT(0)},
+	{"SUSRAM_PGD0_PG_STS",		BIT(1)},
+	{"SMT1_PGD0_PG_STS",		BIT(2)},
+	{"FIACPCB_U_PGD0_PG_STS",	BIT(3)},
+	{"SMS2_PGD0_PG_STS",		BIT(4)},
+	{"SMS1_PGD0_PG_STS",		BIT(5)},
+	{"CSMERTC_PGD0_PG_STS",		BIT(6)},
+	{"CSMEPSF_PGD0_PG_STS",		BIT(7)},
+	{"SBR0_PGD0_PG_STS",		BIT(8)},
+	{"SBR1_PGD0_PG_STS",		BIT(9)},
+	{"SBR2_PGD0_PG_STS",		BIT(10)},
+	{"SBR3_PGD0_PG_STS",		BIT(11)},
+	{"MPFPW1_PGD0_PG_STS",		BIT(12)},
+	{"SBR5_PGD0_PG_STS",		BIT(13)},
+	{"FIA_X_PGD0_PG_STS",		BIT(14)},
+	{"FIACPCB_X_PGD0_PG_STS",	BIT(15)},
+	{"SBRG_PGD0_PG_STS",		BIT(16)},
+	{"SOC_D2D_PGD1_PG_STS",		BIT(17)},
+	{"PSF4_PGD0_PG_STS",		BIT(18)},
+	{"CNVI_PGD0_PG_STS",		BIT(19)},
+	{"UFSX2_PGD0_PG_STS",		BIT(20)},
+	{"ENDBG_PGD0_PG_STS",		BIT(21)},
+	{"DBG_PSF_PGD0_PG_STS",		BIT(22)},
+	{"SBR6_PGD0_PG_STS",		BIT(23)},
+	{"SOC_D2D_PGD2_PG_STS",		BIT(24)},
+	{"NPK_PGD1_PG_STS",		BIT(25)},
+	{"DMI3_PGD0_PG_STS",		BIT(26)},
+	{"DBG_SBR_PGD0_PG_STS",		BIT(27)},
+	{"SOC_D2D_PGD0_PG_STS",		BIT(28)},
+	{"PSF6_PGD0_PG_STS",		BIT(29)},
+	{"PSF7_PGD0_PG_STS",		BIT(30)},
+	{"MPFPW3_PGD0_PG_STS",		BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map arl_socs_power_gating_status_2_map[] = {
+	{"PSF8_PGD0_PG_STS",		BIT(0)},
+	{"FIA_PGD0_PG_STS",		BIT(1)},
+	{"SOC_D2D_PGD3_PG_STS",		BIT(2)},
+	{"FIA_U_PGD0_PG_STS",		BIT(3)},
+	{"TAM_PGD0_PG_STS",		BIT(4)},
+	{"GBETSN_PGD0_PG_STS",		BIT(5)},
+	{"TBTLSX_PGD0_PG_STS",		BIT(6)},
+	{"THC0_PGD0_PG_STS",		BIT(7)},
+	{"THC1_PGD0_PG_STS",		BIT(8)},
+	{"PMC_PGD1_PG_STS",		BIT(9)},
+	{"FIA_P5x16_PGD0_PG_STS",	BIT(10)},
+	{"GNA_PGD0_PG_STS",		BIT(11)},
+	{"ACE_PGD0_PG_STS",		BIT(12)},
+	{"ACE_PGD1_PG_STS",		BIT(13)},
+	{"ACE_PGD2_PG_STS",		BIT(14)},
+	{"ACE_PGD3_PG_STS",		BIT(15)},
+	{"ACE_PGD4_PG_STS",		BIT(16)},
+	{"ACE_PGD5_PG_STS",		BIT(17)},
+	{"ACE_PGD6_PG_STS",		BIT(18)},
+	{"ACE_PGD7_PG_STS",		BIT(19)},
+	{"ACE_PGD8_PG_STS",		BIT(20)},
+	{"FIA_PGS_PGD0_PG_STS",		BIT(21)},
+	{"FIACPCB_PGS_PGD0_PG_STS",	BIT(22)},
+	{"FUSEPMSB_PGD0_PG_STS",	BIT(23)},
+	{}
+};
+
+const struct pmc_bit_map arl_socs_d3_status_2_map[] = {
+	{"CSMERTC_D3_STS",		BIT(1)},
+	{"SUSRAM_D3_STS",		BIT(2)},
+	{"CSE_D3_STS",			BIT(4)},
+	{"KVMCC_D3_STS",		BIT(5)},
+	{"USBR0_D3_STS",		BIT(6)},
+	{"ISH_D3_STS",			BIT(7)},
+	{"SMT1_D3_STS",			BIT(8)},
+	{"SMT2_D3_STS",			BIT(9)},
+	{"SMT3_D3_STS",			BIT(10)},
+	{"GNA_D3_STS",			BIT(12)},
+	{"CLINK_D3_STS",		BIT(14)},
+	{"PTIO_D3_STS",			BIT(16)},
+	{"PMT_D3_STS",			BIT(17)},
+	{"SMS1_D3_STS",			BIT(18)},
+	{"SMS2_D3_STS",			BIT(19)},
+	{}
+};
+
+const struct pmc_bit_map arl_socs_d3_status_3_map[] = {
+	{"GBETSN_D3_STS",		BIT(13)},
+	{"THC0_D3_STS",			BIT(14)},
+	{"THC1_D3_STS",			BIT(15)},
+	{"ACE_D3_STS",			BIT(23)},
+	{}
+};
+
+const struct pmc_bit_map arl_socs_vnn_req_status_3_map[] = {
+	{"DTS0_VNN_REQ_STS",		BIT(7)},
+	{"GPIOCOM5_VNN_REQ_STS",	BIT(11)},
+	{}
+};
+
+const struct pmc_bit_map *arl_socs_lpm_maps[] = {
+	arl_socs_clocksource_status_map,
+	arl_socs_power_gating_status_0_map,
+	arl_socs_power_gating_status_1_map,
+	arl_socs_power_gating_status_2_map,
+	mtl_socm_d3_status_0_map,
+	mtl_socm_d3_status_1_map,
+	arl_socs_d3_status_2_map,
+	arl_socs_d3_status_3_map,
+	mtl_socm_vnn_req_status_0_map,
+	mtl_socm_vnn_req_status_1_map,
+	mtl_socm_vnn_req_status_2_map,
+	arl_socs_vnn_req_status_3_map,
+	mtl_socm_vnn_misc_status_map,
+	mtl_socm_signal_status_map,
+	NULL
+};
+
+const struct pmc_bit_map arl_socs_pfear_map[] = {
+	{"RSVD64",			BIT(0)},
+	{"RSVD65",			BIT(1)},
+	{"RSVD66",			BIT(2)},
+	{"RSVD67",			BIT(3)},
+	{"RSVD68",			BIT(4)},
+	{"GBETSN",			BIT(5)},
+	{"TBTLSX",			BIT(6)},
+	{}
+};
+
+const struct pmc_bit_map *ext_arl_socs_pfear_map[] = {
+	mtl_socm_pfear_map,
+	arl_socs_pfear_map,
+	NULL
+};
+
+const struct pmc_reg_map arl_socs_reg_map = {
+	.pfear_sts = ext_arl_socs_pfear_map,
+	.ppfear_buckets = ARL_SOCS_PPFEAR_NUM_ENTRIES,
+	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.lpm_sts = arl_socs_lpm_maps,
+	.ltr_ignore_max = ARL_SOCS_NUM_IP_IGN_ALLOWED,
+	.ltr_show_sts = arl_socs_ltr_show_map,
+	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
+	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
+	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
+	.msr_sts = msr_map,
+	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
+	.regmap_length = MTL_SOC_PMC_MMIO_REG_LEN,
+	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
+	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
+	.lpm_priority_offset = MTL_LPM_PRI_OFFSET,
+	.lpm_en_offset = MTL_LPM_EN_OFFSET,
+	.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
+	.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
+	.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
+	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
+	.lpm_num_maps = ADL_LPM_NUM_MAPS,
+	.lpm_reg_index = ARL_LPM_REG_INDEX,
+	.etr3_offset = ETR3_OFFSET,
+	.pson_residency_offset = TGL_PSON_RESIDENCY_OFFSET,
+	.pson_residency_counter_step = TGL_PSON_RES_COUNTER_STEP,
+};
+
+const struct pmc_bit_map arl_pchs_ltr_show_map[] = {
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
+	{"SOUTHPORT_G",		MTL_PMC_LTR_SPG},
+	{"ESE",			MTL_PMC_LTR_ESE},
+	{"IOE_PMC",		MTL_PMC_LTR_IOE_PMC},
+	{"DMI3",		ARL_PMC_LTR_DMI3},
+
+	/* Below two cannot be used for LTR_IGNORE */
+	{"CURRENT_PLATFORM",	CNP_PMC_LTR_CUR_PLT},
+	{"AGGREGATED_SYSTEM",	CNP_PMC_LTR_CUR_ASLT},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_clocksource_status_map[] = {
+	{"AON2_OFF_STS",		BIT(0)},
+	{"AON3_OFF_STS",		BIT(1)},
+	{"AON4_OFF_STS",		BIT(2)},
+	{"AON2_SPL_OFF_STS",		BIT(3)},
+	{"AONL_OFF_STS",		BIT(4)},
+	{"XTAL_LVM_OFF_STS",		BIT(5)},
+	{"AON5_ACRO_OFF_STS",		BIT(6)},
+	{"AON6_ACRO_OFF_STS",		BIT(7)},
+	{"USB3_PLL_OFF_STS",		BIT(8)},
+	{"ACRO_OFF_STS",		BIT(9)},
+	{"AUDIO_PLL_OFF_STS",		BIT(10)},
+	{"MAIN_CRO_OFF_STS",		BIT(11)},
+	{"MAIN_DIVIDER_OFF_STS",	BIT(12)},
+	{"REF_PLL_NON_OC_OFF_STS",	BIT(13)},
+	{"DMI_PLL_OFF_STS",		BIT(14)},
+	{"PHY_EXT_INJ_OFF_STS",		BIT(15)},
+	{"AON6_MCRO_OFF_STS",		BIT(16)},
+	{"XTAL_AGGR_OFF_STS",		BIT(17)},
+	{"USB2_PLL_OFF_STS",		BIT(18)},
+	{"TSN0_PLL_OFF_STS",		BIT(19)},
+	{"TSN1_PLL_OFF_STS",		BIT(20)},
+	{"GBE_PLL_OFF_STS",		BIT(21)},
+	{"SATA_PLL_OFF_STS",		BIT(22)},
+	{"PCIE0_PLL_OFF_STS",		BIT(23)},
+	{"PCIE1_PLL_OFF_STS",		BIT(24)},
+	{"PCIE2_PLL_OFF_STS",		BIT(26)},
+	{"PCIE3_PLL_OFF_STS",		BIT(27)},
+	{"REF_PLL_OFF_STS",		BIT(28)},
+	{"PCIE4_PLL_OFF_STS",		BIT(29)},
+	{"PCIE5_PLL_OFF_STS",		BIT(30)},
+	{"REF38P4_PLL_OFF_STS",		BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_power_gating_status_0_map[] = {
+	{"PMC_PGD0_PG_STS",		BIT(0)},
+	{"DMI_PGD0_PG_STS",		BIT(1)},
+	{"ESPISPI_PGD0_PG_STS",		BIT(2)},
+	{"XHCI_PGD0_PG_STS",		BIT(3)},
+	{"SPA_PGD0_PG_STS",		BIT(4)},
+	{"SPB_PGD0_PG_STS",		BIT(5)},
+	{"SPC_PGD0_PG_STS",		BIT(6)},
+	{"GBE_PGD0_PG_STS",		BIT(7)},
+	{"SATA_PGD0_PG_STS",		BIT(8)},
+	{"FIA_X_PGD0_PG_STS",		BIT(9)},
+	{"MPFPW4_PGD0_PG_STS",		BIT(10)},
+	{"EAH_PGD0_PG_STS",		BIT(11)},
+	{"MPFPW1_PGD0_PG_STS",		BIT(12)},
+	{"SPD_PGD0_PG_STS",		BIT(13)},
+	{"LPSS_PGD0_PG_STS",		BIT(14)},
+	{"LPC_PGD0_PG_STS",		BIT(15)},
+	{"SMB_PGD0_PG_STS",		BIT(16)},
+	{"ISH_PGD0_PG_STS",		BIT(17)},
+	{"P2S_PGD0_PG_STS",		BIT(18)},
+	{"NPK_PGD0_PG_STS",		BIT(19)},
+	{"U3FPW1_PGD0_PG_STS",		BIT(20)},
+	{"PECI_PGD0_PG_STS",		BIT(21)},
+	{"FUSE_PGD0_PG_STS",		BIT(22)},
+	{"SBR8_PGD0_PG_STS",		BIT(23)},
+	{"EXE_PGD0_PG_STS",		BIT(24)},
+	{"XDCI_PGD0_PG_STS",		BIT(25)},
+	{"EXI_PGD0_PG_STS",		BIT(26)},
+	{"CSE_PGD0_PG_STS",		BIT(27)},
+	{"KVMCC_PGD0_PG_STS",		BIT(28)},
+	{"PMT_PGD0_PG_STS",		BIT(29)},
+	{"CLINK_PGD0_PG_STS",		BIT(30)},
+	{"PTIO_PGD0_PG_STS",		BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_power_gating_status_1_map[] = {
+	{"USBR0_PGD0_PG_STS",		BIT(0)},
+	{"SUSRAM_PGD0_PG_STS",		BIT(1)},
+	{"SMT1_PGD0_PG_STS",		BIT(2)},
+	{"SMT4_PGD0_PG_STS",		BIT(3)},
+	{"SMS2_PGD0_PG_STS",		BIT(4)},
+	{"SMS1_PGD0_PG_STS",		BIT(5)},
+	{"CSMERTC_PGD0_PG_STS",		BIT(6)},
+	{"CSMEPSF_PGD0_PG_STS",		BIT(7)},
+	{"SBR0_PGD0_PG_STS",		BIT(8)},
+	{"SBR1_PGD0_PG_STS",		BIT(9)},
+	{"SBR2_PGD0_PG_STS",		BIT(10)},
+	{"SBR3_PGD0_PG_STS",		BIT(11)},
+	{"SBR4_PGD0_PG_STS",		BIT(12)},
+	{"SBR5_PGD0_PG_STS",		BIT(13)},
+	{"MPFPW3_PGD0_PG_STS",		BIT(14)},
+	{"PSF1_PGD0_PG_STS",		BIT(15)},
+	{"PSF2_PGD0_PG_STS",		BIT(16)},
+	{"PSF3_PGD0_PG_STS",		BIT(17)},
+	{"PSF4_PGD0_PG_STS",		BIT(18)},
+	{"CNVI_PGD0_PG_STS",		BIT(19)},
+	{"DMI3_PGD0_PG_STS",		BIT(20)},
+	{"ENDBG_PGD0_PG_STS",		BIT(21)},
+	{"DBG_SBR_PGD0_PG_STS",		BIT(22)},
+	{"SBR6_PGD0_PG_STS",		BIT(23)},
+	{"SBR7_PGD0_PG_STS",		BIT(24)},
+	{"NPK_PGD1_PG_STS",		BIT(25)},
+	{"U3FPW3_PGD0_PG_STS",		BIT(26)},
+	{"MPFPW2_PGD0_PG_STS",		BIT(27)},
+	{"MPFPW7_PGD0_PG_STS",		BIT(28)},
+	{"GBETSN1_PGD0_PG_STS",		BIT(29)},
+	{"PSF7_PGD0_PG_STS",		BIT(30)},
+	{"FIA2_PGD0_PG_STS",		BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_power_gating_status_2_map[] = {
+	{"U3FPW2_PGD0_PG_STS",		BIT(0)},
+	{"FIA_PGD0_PG_STS",		BIT(1)},
+	{"FIACPCB_X_PGD0_PG_STS",	BIT(2)},
+	{"FIA1_PGD0_PG_STS",		BIT(3)},
+	{"TAM_PGD0_PG_STS",		BIT(4)},
+	{"GBETSN_PGD0_PG_STS",		BIT(5)},
+	{"SBR9_PGD0_PG_STS",		BIT(6)},
+	{"THC0_PGD0_PG_STS",		BIT(7)},
+	{"THC1_PGD0_PG_STS",		BIT(8)},
+	{"PMC_PGD1_PG_STS",		BIT(9)},
+	{"DBC_PGD0_PG_STS",		BIT(10)},
+	{"DBG_PSF_PGD0_PG_STS",		BIT(11)},
+	{"SPF_PGD0_PG_STS",		BIT(12)},
+	{"ACE_PGD0_PG_STS",		BIT(13)},
+	{"ACE_PGD1_PG_STS",		BIT(14)},
+	{"ACE_PGD2_PG_STS",		BIT(15)},
+	{"ACE_PGD3_PG_STS",		BIT(16)},
+	{"ACE_PGD4_PG_STS",		BIT(17)},
+	{"ACE_PGD5_PG_STS",		BIT(18)},
+	{"ACE_PGD6_PG_STS",		BIT(19)},
+	{"ACE_PGD7_PG_STS",		BIT(20)},
+	{"SPE_PGD0_PG_STS",		BIT(21)},
+	{"MPFPW5_PG_STS",		BIT(22)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_d3_status_0_map[] = {
+	{"SPF_D3_STS",			BIT(0)},
+	{"LPSS_D3_STS",			BIT(3)},
+	{"XDCI_D3_STS",			BIT(4)},
+	{"XHCI_D3_STS",			BIT(5)},
+	{"SPA_D3_STS",			BIT(12)},
+	{"SPB_D3_STS",			BIT(13)},
+	{"SPC_D3_STS",			BIT(14)},
+	{"SPD_D3_STS",			BIT(15)},
+	{"SPE_D3_STS",			BIT(16)},
+	{"ESPISPI_D3_STS",		BIT(18)},
+	{"SATA_D3_STS",			BIT(20)},
+	{"PSTH_D3_STS",			BIT(21)},
+	{"DMI_D3_STS",			BIT(22)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_d3_status_1_map[] = {
+	{"GBETSN1_D3_STS",		BIT(14)},
+	{"GBE_D3_STS",			BIT(19)},
+	{"ITSS_D3_STS",			BIT(23)},
+	{"P2S_D3_STS",			BIT(24)},
+	{"CNVI_D3_STS",			BIT(27)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_d3_status_2_map[] = {
+	{"CSMERTC_D3_STS",		BIT(1)},
+	{"SUSRAM_D3_STS",		BIT(2)},
+	{"CSE_D3_STS",			BIT(4)},
+	{"KVMCC_D3_STS",		BIT(5)},
+	{"USBR0_D3_STS",		BIT(6)},
+	{"ISH_D3_STS",			BIT(7)},
+	{"SMT1_D3_STS",			BIT(8)},
+	{"SMT2_D3_STS",			BIT(9)},
+	{"SMT3_D3_STS",			BIT(10)},
+	{"SMT4_D3_STS",			BIT(11)},
+	{"SMT5_D3_STS",			BIT(12)},
+	{"SMT6_D3_STS",			BIT(13)},
+	{"CLINK_D3_STS",		BIT(14)},
+	{"PTIO_D3_STS",			BIT(16)},
+	{"PMT_D3_STS",			BIT(17)},
+	{"SMS1_D3_STS",			BIT(18)},
+	{"SMS2_D3_STS",			BIT(19)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_d3_status_3_map[] = {
+	{"ESE_D3_STS",			BIT(3)},
+	{"GBETSN_D3_STS",		BIT(13)},
+	{"THC0_D3_STS",			BIT(14)},
+	{"THC1_D3_STS",			BIT(15)},
+	{"ACE_D3_STS",			BIT(23)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_vnn_req_status_0_map[] = {
+	{"FIA_VNN_REQ_STS",		BIT(17)},
+	{"ESPISPI_VNN_REQ_STS",		BIT(18)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_vnn_req_status_1_map[] = {
+	{"NPK_VNN_REQ_STS",		BIT(4)},
+	{"DFXAGG_VNN_REQ_STS",		BIT(8)},
+	{"EXI_VNN_REQ_STS",		BIT(9)},
+	{"GBE_VNN_REQ_STS",		BIT(19)},
+	{"SMB_VNN_REQ_STS",		BIT(25)},
+	{"LPC_VNN_REQ_STS",		BIT(26)},
+	{"CNVI_VNN_REQ_STS",		BIT(27)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_vnn_req_status_2_map[] = {
+	{"FIA2_VNN_REQ_STS",		BIT(0)},
+	{"CSMERTC_VNN_REQ_STS",		BIT(1)},
+	{"CSE_VNN_REQ_STS",		BIT(4)},
+	{"ISH_VNN_REQ_STS",		BIT(7)},
+	{"SMT1_VNN_REQ_STS",		BIT(8)},
+	{"SMT4_VNN_REQ_STS",		BIT(11)},
+	{"CLINK_VNN_REQ_STS",		BIT(14)},
+	{"SMS1_VNN_REQ_STS",		BIT(18)},
+	{"SMS2_VNN_REQ_STS",		BIT(19)},
+	{"GPIOCOM4_VNN_REQ_STS",	BIT(20)},
+	{"GPIOCOM3_VNN_REQ_STS",	BIT(21)},
+	{"GPIOCOM2_VNN_REQ_STS",	BIT(22)},
+	{"GPIOCOM1_VNN_REQ_STS",	BIT(23)},
+	{"GPIOCOM0_VNN_REQ_STS",	BIT(24)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_vnn_req_status_3_map[] = {
+	{"ESE_VNN_REQ_STS",		BIT(3)},
+	{"DTS0_VNN_REQ_STS",		BIT(7)},
+	{"GPIOCOM5_VNN_REQ_STS",	BIT(11)},
+	{"FIA1_VNN_REQ_STS",		BIT(12)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_vnn_misc_status_map[] = {
+	{"CPU_C10_REQ_STS",			BIT(0)},
+	{"TS_OFF_REQ_STS",			BIT(1)},
+	{"PNDE_MET_REQ_STS",			BIT(2)},
+	{"PCIE_DEEP_PM_REQ_STS",		BIT(3)},
+	{"FW_THROTTLE_ALLOWED_REQ_STS",		BIT(4)},
+	{"ISH_VNNAON_REQ_STS",			BIT(7)},
+	{"IOE_COND_MET_S02I2_0_REQ_STS",	BIT(8)},
+	{"IOE_COND_MET_S02I2_1_REQ_STS",	BIT(9)},
+	{"IOE_COND_MET_S02I2_2_REQ_STS",	BIT(10)},
+	{"PLT_GREATER_REQ_STS",			BIT(11)},
+	{"PMC_IDLE_FB_OCP_REQ_STS",		BIT(13)},
+	{"PM_SYNC_STATES_REQ_STS",		BIT(14)},
+	{"EA_REQ_STS",				BIT(15)},
+	{"DMI_CLKREQ_B_REQ_STS",		BIT(16)},
+	{"BRK_EV_EN_REQ_STS",			BIT(17)},
+	{"AUTO_DEMO_EN_REQ_STS",		BIT(18)},
+	{"ITSS_CLK_SRC_REQ_STS",		BIT(19)},
+	{"ARC_IDLE_REQ_STS",			BIT(21)},
+	{"DMI_IN_REQ_STS",			BIT(22)},
+	{"FIA_DEEP_PM_REQ_STS",			BIT(23)},
+	{"XDCI_ATTACHED_REQ_STS",		BIT(24)},
+	{"ARC_INTERRUPT_WAKE_REQ_STS",		BIT(25)},
+	{"PRE_WAKE0_REQ_STS",			BIT(27)},
+	{"PRE_WAKE1_REQ_STS",			BIT(28)},
+	{"PRE_WAKE2_EN_REQ_STS",		BIT(29)},
+	{"CNVI_V1P05_REQ_STS",			BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map arl_pchs_signal_status_map[] = {
+	{"LSX_Wake0_STS",		BIT(0)},
+	{"LSX_Wake1_STS",		BIT(1)},
+	{"LSX_Wake2_STS",		BIT(2)},
+	{"LSX_Wake3_STS",		BIT(3)},
+	{"LSX_Wake4_STS",		BIT(4)},
+	{"LSX_Wake5_STS",		BIT(5)},
+	{"LSX_Wake6_STS",		BIT(6)},
+	{"LSX_Wake7_STS",		BIT(7)},
+	{"Int_Timer_SS_Wake0_STS",	BIT(8)},
+	{"Int_Timer_SS_Wake1_STS",	BIT(9)},
+	{"Int_Timer_SS_Wake0_STS",	BIT(10)},
+	{"Int_Timer_SS_Wake1_STS",	BIT(11)},
+	{"Int_Timer_SS_Wake2_STS",	BIT(12)},
+	{"Int_Timer_SS_Wake3_STS",	BIT(13)},
+	{"Int_Timer_SS_Wake4_STS",	BIT(14)},
+	{"Int_Timer_SS_Wake5_STS",	BIT(15)},
+	{}
+};
+
+const struct pmc_bit_map *arl_pchs_lpm_maps[] = {
+	arl_pchs_clocksource_status_map,
+	arl_pchs_power_gating_status_0_map,
+	arl_pchs_power_gating_status_1_map,
+	arl_pchs_power_gating_status_2_map,
+	arl_pchs_d3_status_0_map,
+	arl_pchs_d3_status_1_map,
+	arl_pchs_d3_status_2_map,
+	arl_pchs_d3_status_3_map,
+	arl_pchs_vnn_req_status_0_map,
+	arl_pchs_vnn_req_status_1_map,
+	arl_pchs_vnn_req_status_2_map,
+	arl_pchs_vnn_req_status_3_map,
+	arl_pchs_vnn_misc_status_map,
+	arl_pchs_signal_status_map,
+	NULL
+};
+
+const struct pmc_reg_map arl_pchs_reg_map = {
+	.pfear_sts = ext_arl_socs_pfear_map,
+	.ppfear_buckets = ARL_SOCS_PPFEAR_NUM_ENTRIES,
+	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.ltr_ignore_max = ARL_SOCS_NUM_IP_IGN_ALLOWED,
+	.lpm_sts = arl_pchs_lpm_maps,
+	.ltr_show_sts = arl_pchs_ltr_show_map,
+	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
+	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
+	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
+	.msr_sts = msr_map,
+	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
+	.regmap_length = ARL_PCH_PMC_MMIO_REG_LEN,
+	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
+	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
+	.lpm_priority_offset = MTL_LPM_PRI_OFFSET,
+	.lpm_en_offset = MTL_LPM_EN_OFFSET,
+	.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
+	.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
+	.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
+	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
+	.lpm_num_maps = ADL_LPM_NUM_MAPS,
+	.lpm_reg_index = ARL_LPM_REG_INDEX,
+	.etr3_offset = ETR3_OFFSET,
+};
+
+#define PMC_DEVID_SOCS 0xae7f
+#define PMC_DEVID_IOEP 0x7ecf
+#define PMC_DEVID_PCHS 0x7f27
+static struct pmc_info arl_pmc_info_list[] = {
+	{
+		.guid	= IOEP_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_IOEP,
+		.map	= &mtl_ioep_reg_map,
+	},
+	{
+		.guid	= SOCS_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_SOCS,
+		.map	= &arl_socs_reg_map,
+	},
+	{
+		.guid	= PCHS_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_PCHS,
+		.map	= &arl_pchs_reg_map,
+	},
+	{}
+};
+
+#define ARL_NPU_PCI_DEV			0xad1d
+/*
+ * Set power state of select devices that do not have drivers to D3
+ * so that they do not block Package C entry.
+ */
+void arl_d3_fixup(void)
+{
+	pmc_core_set_device_d3(ARL_NPU_PCI_DEV);
+}
+
+int arl_resume(struct pmc_dev *pmcdev)
+{
+	arl_d3_fixup();
+	return pmc_core_resume_common(pmcdev);
+}
+
+int arl_core_init(struct pmc_dev *pmcdev)
+{
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_SOC];
+	int ret;
+	int func = 0;
+	bool ssram_init = true;
+
+	arl_d3_fixup();
+	pmcdev->resume = arl_resume;
+	pmcdev->regmap_list = arl_pmc_info_list;
+
+	/*
+	 * If ssram init fails use legacy method to at least get the
+	 * primary PMC
+	 */
+	ret = pmc_core_ssram_init(pmcdev, func);
+	if (ret) {
+		ssram_init = false;
+		pmc->map = &arl_socs_reg_map;
+
+		ret = get_primary_reg_base(pmc);
+		if (ret)
+			return ret;
+	}
+
+	pmc_core_get_low_power_modes(pmcdev);
+	pmc_core_punit_pmt_init(pmcdev, ARL_PMT_DMU_GUID);
+
+	/* Due to a hardware limitation, the GBE LTR blocks PC10
+	 * when a cable is attached. Tell the PMC to ignore it.
+	 */
+	dev_dbg(&pmcdev->pdev->dev, "ignoring GBE LTR\n");
+	pmc_core_send_ltr_ignore(pmcdev, 3);
+
+	if (ssram_init)	{
+		ret = pmc_core_ssram_get_lpm_reqs(pmcdev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index ac446b0f2192..67eecef7a54f 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1273,6 +1273,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE,		adl_core_init),
 	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,	adl_core_init),
 	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE_L,	mtl_core_init),
+	X86_MATCH_INTEL_FAM6_MODEL(ARROWLAKE,		arl_core_init),
 	{}
 };
 
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index e678a1205514..f9c2fee22e44 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -263,14 +263,20 @@ enum ppfear_regs {
 #define MTL_SOCM_NUM_IP_IGN_ALLOWED		25
 #define MTL_SOC_PMC_MMIO_REG_LEN		0x2708
 #define MTL_PMC_LTR_SPG				0x1B74
+#define ARL_SOCS_PMC_LTR_RESERVED		0x1B88
+#define ARL_SOCS_NUM_IP_IGN_ALLOWED		26
+#define ARL_PMC_LTR_DMI3			0x1BE4
+#define ARL_PCH_PMC_MMIO_REG_LEN		0x2720
 
 /* Meteor Lake PGD PFET Enable Ack Status */
 #define MTL_SOCM_PPFEAR_NUM_ENTRIES		8
 #define MTL_IOE_PPFEAR_NUM_ENTRIES		10
+#define ARL_SOCS_PPFEAR_NUM_ENTRIES		9
 
 /* Die C6 from PUNIT telemetry */
 #define MTL_PMT_DMU_DIE_C6_OFFSET		15
 #define MTL_PMT_DMU_GUID			0x1A067102
+#define ARL_PMT_DMU_GUID			0x1A06A000
 
 extern const char *pmc_lpm_modes[];
 
@@ -501,6 +507,37 @@ extern const struct pmc_bit_map mtl_ioem_vnn_req_status_1_map[];
 extern const struct pmc_bit_map *mtl_ioem_lpm_maps[];
 extern const struct pmc_reg_map mtl_ioem_reg_map;
 
+/* ARL */
+extern const struct pmc_bit_map arl_socs_ltr_show_map[];
+extern const struct pmc_bit_map arl_socs_clocksource_status_map[];
+extern const struct pmc_bit_map arl_socs_power_gating_status_0_map[];
+extern const struct pmc_bit_map arl_socs_power_gating_status_1_map[];
+extern const struct pmc_bit_map arl_socs_power_gating_status_2_map[];
+extern const struct pmc_bit_map arl_socs_d3_status_2_map[];
+extern const struct pmc_bit_map arl_socs_d3_status_3_map[];
+extern const struct pmc_bit_map arl_socs_vnn_req_status_3_map[];
+extern const struct pmc_bit_map *arl_socs_lpm_maps[];
+extern const struct pmc_bit_map arl_socs_pfear_map[];
+extern const struct pmc_bit_map *ext_arl_socs_pfear_map[];
+extern const struct pmc_reg_map arl_socs_reg_map;
+extern const struct pmc_bit_map arl_pchs_ltr_show_map[];
+extern const struct pmc_bit_map arl_pchs_clocksource_status_map[];
+extern const struct pmc_bit_map arl_pchs_power_gating_status_0_map[];
+extern const struct pmc_bit_map arl_pchs_power_gating_status_1_map[];
+extern const struct pmc_bit_map arl_pchs_power_gating_status_2_map[];
+extern const struct pmc_bit_map arl_pchs_d3_status_0_map[];
+extern const struct pmc_bit_map arl_pchs_d3_status_1_map[];
+extern const struct pmc_bit_map arl_pchs_d3_status_2_map[];
+extern const struct pmc_bit_map arl_pchs_d3_status_3_map[];
+extern const struct pmc_bit_map arl_pchs_vnn_req_status_0_map[];
+extern const struct pmc_bit_map arl_pchs_vnn_req_status_1_map[];
+extern const struct pmc_bit_map arl_pchs_vnn_req_status_2_map[];
+extern const struct pmc_bit_map arl_pchs_vnn_req_status_3_map[];
+extern const struct pmc_bit_map arl_pchs_vnn_misc_status_map[];
+extern const struct pmc_bit_map arl_pchs_signal_status_map[];
+extern const struct pmc_bit_map *arl_pchs_lpm_maps[];
+extern const struct pmc_reg_map arl_pchs_reg_map;
+
 extern void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev);
 extern int pmc_core_ssram_get_lpm_reqs(struct pmc_dev *pmcdev);
 extern int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value);
@@ -521,6 +558,7 @@ int tgl_l_core_init(struct pmc_dev *pmcdev);
 int tgl_core_generic_init(struct pmc_dev *pmcdev, int pch_tp);
 int adl_core_init(struct pmc_dev *pmcdev);
 int mtl_core_init(struct pmc_dev *pmcdev);
+int arl_core_init(struct pmc_dev *pmcdev);
 
 #define pmc_for_each_mode(i, mode, pmcdev)		\
 	for (i = 0, mode = pmcdev->lpm_en_modes[i];	\
-- 
2.34.1



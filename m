Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A803EDBF0
	for <lists+platform-driver-x86@lfdr.de>; Mon, 16 Aug 2021 19:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhHPRC5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 16 Aug 2021 13:02:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:11949 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232164AbhHPRCx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 13:02:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="195483068"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="195483068"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 10:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="509814925"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2021 10:02:20 -0700
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com, andriy.shevchenko@linux.intel.com,
        vicamo.yang@canonical.com, srinivas.pandruvada@intel.com,
        david.e.box@intel.com, chao.qin@intel.com,
        linux-kernel@vger.kernel.org, tamar.mashiah@intel.com,
        gregkh@linuxfoundation.org, rajatja@google.com,
        Shyam-sundar.S-k@amd.com, Alexander.Deucher@amd.com,
        mlimonci@amd.com, Gayatri Kammela <gayatri.kammela@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v7 4/5] platform/x86/intel: pmc/core: Add Alder Lake low power mode support for pmc core
Date:   Mon, 16 Aug 2021 09:58:33 -0700
Message-Id: <d27ec98589a5aaa569bbce0e937ed03779fc0a22.1629091915.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629091915.git.gayatri.kammela@intel.com>
References: <cover.1629091915.git.gayatri.kammela@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Alder Lake has 14 status registers that are memory mapped. These
registers show the status of the low power mode requirements. The
registers are latched on every C10 entry or exit and on every s0ix.y
entry/exit. Accessing these registers is useful for debugging any low
power related activities.

Thus, add debugfs entry to access low power mode status registers.

Cc: Chao Qin <chao.qin@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Tested-by: You-Sheng Yang <vicamo.yang@canonical.com>
Acked-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel/pmc/core.c | 194 ++++++++++++++++++++++++++
 drivers/platform/x86/intel/pmc/core.h |  13 ++
 2 files changed, 207 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index f2646fdf6c90..e645ede591d8 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -736,6 +736,189 @@ static const struct pmc_bit_map adl_ltr_show_map[] = {
 	{}
 };
 
+static const struct pmc_bit_map adl_clocksource_status_map[] = {
+	{"CLKPART1_OFF_STS",			BIT(0)},
+	{"CLKPART2_OFF_STS",			BIT(1)},
+	{"CLKPART3_OFF_STS",			BIT(2)},
+	{"CLKPART4_OFF_STS",			BIT(3)},
+	{"CLKPART5_OFF_STS",			BIT(4)},
+	{"CLKPART6_OFF_STS",			BIT(5)},
+	{"CLKPART7_OFF_STS",			BIT(6)},
+	{"CLKPART8_OFF_STS",			BIT(7)},
+	{"PCIE0PLL_OFF_STS",			BIT(10)},
+	{"PCIE1PLL_OFF_STS",			BIT(11)},
+	{"PCIE2PLL_OFF_STS",			BIT(12)},
+	{"PCIE3PLL_OFF_STS",			BIT(13)},
+	{"PCIE4PLL_OFF_STS",			BIT(14)},
+	{"PCIE5PLL_OFF_STS",			BIT(15)},
+	{"PCIE6PLL_OFF_STS",			BIT(16)},
+	{"USB2PLL_OFF_STS",			BIT(18)},
+	{"OCPLL_OFF_STS",			BIT(22)},
+	{"AUDIOPLL_OFF_STS",			BIT(23)},
+	{"GBEPLL_OFF_STS",			BIT(24)},
+	{"Fast_XTAL_Osc_OFF_STS",		BIT(25)},
+	{"AC_Ring_Osc_OFF_STS",			BIT(26)},
+	{"MC_Ring_Osc_OFF_STS",			BIT(27)},
+	{"SATAPLL_OFF_STS",			BIT(29)},
+	{"USB3PLL_OFF_STS",			BIT(31)},
+	{}
+};
+
+static const struct pmc_bit_map adl_power_gating_status_0_map[] = {
+	{"PMC_PGD0_PG_STS",			BIT(0)},
+	{"DMI_PGD0_PG_STS",			BIT(1)},
+	{"ESPISPI_PGD0_PG_STS",			BIT(2)},
+	{"XHCI_PGD0_PG_STS",			BIT(3)},
+	{"SPA_PGD0_PG_STS",			BIT(4)},
+	{"SPB_PGD0_PG_STS",			BIT(5)},
+	{"SPC_PGD0_PG_STS",			BIT(6)},
+	{"GBE_PGD0_PG_STS",			BIT(7)},
+	{"SATA_PGD0_PG_STS",			BIT(8)},
+	{"DSP_PGD0_PG_STS",			BIT(9)},
+	{"DSP_PGD1_PG_STS",			BIT(10)},
+	{"DSP_PGD2_PG_STS",			BIT(11)},
+	{"DSP_PGD3_PG_STS",			BIT(12)},
+	{"SPD_PGD0_PG_STS",			BIT(13)},
+	{"LPSS_PGD0_PG_STS",			BIT(14)},
+	{"SMB_PGD0_PG_STS",			BIT(16)},
+	{"ISH_PGD0_PG_STS",			BIT(17)},
+	{"NPK_PGD0_PG_STS",			BIT(19)},
+	{"PECI_PGD0_PG_STS",			BIT(21)},
+	{"XDCI_PGD0_PG_STS",			BIT(25)},
+	{"EXI_PGD0_PG_STS",			BIT(26)},
+	{"CSE_PGD0_PG_STS",			BIT(27)},
+	{"KVMCC_PGD0_PG_STS",			BIT(28)},
+	{"PMT_PGD0_PG_STS",			BIT(29)},
+	{"CLINK_PGD0_PG_STS",			BIT(30)},
+	{"PTIO_PGD0_PG_STS",			BIT(31)},
+	{}
+};
+
+static const struct pmc_bit_map adl_power_gating_status_1_map[] = {
+	{"USBR0_PGD0_PG_STS",			BIT(0)},
+	{"SMT1_PGD0_PG_STS",			BIT(2)},
+	{"CSMERTC_PGD0_PG_STS",			BIT(6)},
+	{"CSMEPSF_PGD0_PG_STS",			BIT(7)},
+	{"CNVI_PGD0_PG_STS",			BIT(19)},
+	{"DSP_PGD4_PG_STS",			BIT(26)},
+	{"SPG_PGD0_PG_STS",			BIT(27)},
+	{"SPE_PGD0_PG_STS",			BIT(28)},
+	{}
+};
+
+static const struct pmc_bit_map adl_power_gating_status_2_map[] = {
+	{"THC0_PGD0_PG_STS",			BIT(7)},
+	{"THC1_PGD0_PG_STS",			BIT(8)},
+	{"SPF_PGD0_PG_STS",			BIT(14)},
+	{}
+};
+
+static const struct pmc_bit_map adl_d3_status_0_map[] = {
+	{"ISH_D3_STS",				BIT(2)},
+	{"LPSS_D3_STS",				BIT(3)},
+	{"XDCI_D3_STS",				BIT(4)},
+	{"XHCI_D3_STS",				BIT(5)},
+	{"SPA_D3_STS",				BIT(12)},
+	{"SPB_D3_STS",				BIT(13)},
+	{"SPC_D3_STS",				BIT(14)},
+	{"SPD_D3_STS",				BIT(15)},
+	{"SPE_D3_STS",				BIT(16)},
+	{"DSP_D3_STS",				BIT(19)},
+	{"SATA_D3_STS",				BIT(20)},
+	{"DMI_D3_STS",				BIT(22)},
+	{}
+};
+
+static const struct pmc_bit_map adl_d3_status_1_map[] = {
+	{"GBE_D3_STS",				BIT(19)},
+	{"CNVI_D3_STS",				BIT(27)},
+	{}
+};
+
+static const struct pmc_bit_map adl_d3_status_2_map[] = {
+	{"CSMERTC_D3_STS",			BIT(1)},
+	{"CSE_D3_STS",				BIT(4)},
+	{"KVMCC_D3_STS",			BIT(5)},
+	{"USBR0_D3_STS",			BIT(6)},
+	{"SMT1_D3_STS",				BIT(8)},
+	{"PTIO_D3_STS",				BIT(16)},
+	{"PMT_D3_STS",				BIT(17)},
+	{}
+};
+
+static const struct pmc_bit_map adl_d3_status_3_map[] = {
+	{"THC0_D3_STS",				BIT(14)},
+	{"THC1_D3_STS",				BIT(15)},
+	{}
+};
+
+static const struct pmc_bit_map adl_vnn_req_status_0_map[] = {
+	{"ISH_VNN_REQ_STS",			BIT(2)},
+	{"ESPISPI_VNN_REQ_STS",			BIT(18)},
+	{"DSP_VNN_REQ_STS",			BIT(19)},
+	{}
+};
+
+static const struct pmc_bit_map adl_vnn_req_status_1_map[] = {
+	{"NPK_VNN_REQ_STS",			BIT(4)},
+	{"EXI_VNN_REQ_STS",			BIT(9)},
+	{"GBE_VNN_REQ_STS",			BIT(19)},
+	{"SMB_VNN_REQ_STS",			BIT(25)},
+	{"CNVI_VNN_REQ_STS",			BIT(27)},
+	{}
+};
+
+static const struct pmc_bit_map adl_vnn_req_status_2_map[] = {
+	{"CSMERTC_VNN_REQ_STS",			BIT(1)},
+	{"CSE_VNN_REQ_STS",			BIT(4)},
+	{"SMT1_VNN_REQ_STS",			BIT(8)},
+	{"CLINK_VNN_REQ_STS",			BIT(14)},
+	{"GPIOCOM4_VNN_REQ_STS",		BIT(20)},
+	{"GPIOCOM3_VNN_REQ_STS",		BIT(21)},
+	{"GPIOCOM2_VNN_REQ_STS",		BIT(22)},
+	{"GPIOCOM1_VNN_REQ_STS",		BIT(23)},
+	{"GPIOCOM0_VNN_REQ_STS",		BIT(24)},
+	{}
+};
+
+static const struct pmc_bit_map adl_vnn_req_status_3_map[] = {
+	{"GPIOCOM5_VNN_REQ_STS",		BIT(11)},
+	{}
+};
+
+static const struct pmc_bit_map adl_vnn_misc_status_map[] = {
+	{"CPU_C10_REQ_STS",			BIT(0)},
+	{"PCIe_LPM_En_REQ_STS",			BIT(3)},
+	{"ITH_REQ_STS",				BIT(5)},
+	{"CNVI_REQ_STS",			BIT(6)},
+	{"ISH_REQ_STS",				BIT(7)},
+	{"USB2_SUS_PG_Sys_REQ_STS",		BIT(10)},
+	{"PCIe_Clk_REQ_STS",			BIT(12)},
+	{"MPHY_Core_DL_REQ_STS",		BIT(16)},
+	{"Break-even_En_REQ_STS",		BIT(17)},
+	{"MPHY_SUS_REQ_STS",			BIT(22)},
+	{"xDCI_attached_REQ_STS",		BIT(24)},
+	{}
+};
+
+static const struct pmc_bit_map *adl_lpm_maps[] = {
+	adl_clocksource_status_map,
+	adl_power_gating_status_0_map,
+	adl_power_gating_status_1_map,
+	adl_power_gating_status_2_map,
+	adl_d3_status_0_map,
+	adl_d3_status_1_map,
+	adl_d3_status_2_map,
+	adl_d3_status_3_map,
+	adl_vnn_req_status_0_map,
+	adl_vnn_req_status_1_map,
+	adl_vnn_req_status_2_map,
+	adl_vnn_req_status_3_map,
+	adl_vnn_misc_status_map,
+	tgl_signal_status_map,
+	NULL
+};
+
 static const struct pmc_reg_map adl_reg_map = {
 	.pfear_sts = ext_adl_pfear_map,
 	.slp_s0_offset = ADL_PMC_SLP_S0_RES_COUNTER_OFFSET,
@@ -749,6 +932,17 @@ static const struct pmc_reg_map adl_reg_map = {
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
+	.lpm_num_modes = ADL_LPM_NUM_MODES,
+	.lpm_num_maps = ADL_LPM_NUM_MAPS,
+	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
+	.etr3_offset = ETR3_OFFSET,
+	.lpm_sts_latch_en_offset = ADL_LPM_STATUS_LATCH_EN_OFFSET,
+	.lpm_priority_offset = ADL_LPM_PRI_OFFSET,
+	.lpm_en_offset = ADL_LPM_EN_OFFSET,
+	.lpm_residency_offset = ADL_LPM_RESIDENCY_OFFSET,
+	.lpm_sts = adl_lpm_maps,
+	.lpm_status_offset = ADL_LPM_STATUS_OFFSET,
+	.lpm_live_status_offset = ADL_LPM_LIVE_STATUS_OFFSET,
 };
 
 static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 45b352ece6db..333e25981e8e 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -222,6 +222,18 @@ enum ppfear_regs {
 /* Extended Test Mode Register LPM bits (TGL and later */
 #define ETR3_CLEAR_LPM_EVENTS			BIT(28)
 
+/* Alder Lake Power Management Controller register offsets */
+#define ADL_LPM_EN_OFFSET			0x179C
+#define ADL_LPM_RESIDENCY_OFFSET		0x17A4
+#define ADL_LPM_NUM_MODES			2
+#define ADL_LPM_NUM_MAPS			14
+
+/* Alder Lake Low Power Mode debug registers */
+#define ADL_LPM_STATUS_OFFSET			0x170C
+#define ADL_LPM_PRI_OFFSET			0x17A0
+#define ADL_LPM_STATUS_LATCH_EN_OFFSET		0x1704
+#define ADL_LPM_LIVE_STATUS_OFFSET		0x1764
+
 const char *pmc_lpm_modes[] = {
 	"S0i2.0",
 	"S0i2.1",
@@ -281,6 +293,7 @@ struct pmc_reg_map {
 	const u32 pm_vric1_offset;
 	/* Low Power Mode registers */
 	const int lpm_num_maps;
+	const int lpm_num_modes;
 	const int lpm_res_counter_step_x2;
 	const u32 lpm_sts_latch_en_offset;
 	const u32 lpm_en_offset;
-- 
2.25.1


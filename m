Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2E7148E08
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Jan 2020 19:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391569AbgAXSx2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 Jan 2020 13:53:28 -0500
Received: from mga04.intel.com ([192.55.52.120]:59351 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387486AbgAXSx2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Jan 2020 13:53:28 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 10:53:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; 
   d="scan'208";a="222692810"
Received: from unknown (HELO gayuk-dev-mach.sc.intel.com) ([10.3.79.172])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2020 10:53:27 -0800
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com,
        dvhart@infradead.org, mika.westerberg@intel.com,
        peterz@infradead.org, charles.d.prestopine@intel.com,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
Subject: [PATCH v1 2/7] platform/x86: intel_pmc_core: Add debugfs entry for low power mode status registers
Date:   Fri, 24 Jan 2020 10:50:23 -0800
Message-Id: <a8d422452b8f6d7ff751c21c018a93be07657d60.1579890793.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579890793.git.gayatri.kammela@intel.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1579890793.git.gayatri.kammela@intel.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Tiger Lake has 6 status registers that are memory mapped. These
registers show the status of the low power mode requirements. The
registers are latched on every C10 entry or exit and on every s0ix.y
entry/exit. Accessing these registers is useful for debugging any low
power related activities.

Thus, add debugfs entry to access low power mode status registers.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Signed-off-by: David Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 188 ++++++++++++++++++++++++++
 drivers/platform/x86/intel_pmc_core.h |   5 +
 2 files changed, 193 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 6e7cf620bea6..4019f517167b 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -408,6 +408,152 @@ static const struct pmc_reg_map icl_reg_map = {
 	.ltr_ignore_max = ICL_NUM_IP_IGN_ALLOWED,
 };
 
+static const struct pmc_bit_map tgl_lpm0_map[] = {
+	{"USB2PLL_OFF_STS",			BIT(18)},
+	{"PCIe/USB3.1_Gen2PLL_OFF_STS",		BIT(19)},
+	{"PCIe_Gen3PLL_OFF_STS",		BIT(20)},
+	{"OPIOPLL_OFF_STS",			BIT(21)},
+	{"OCPLL_OFF_STS",			BIT(22)},
+	{"AudioPLL_OFF_STS",			BIT(23)},
+	{"MIPIPLL_OFF_STS",			BIT(24)},
+	{"Fast_XTAL_Osc_OFF_STS",		BIT(25)},
+	{"AC_Ring_Osc_OFF_STS",			BIT(26)},
+	{"MC_Ring_Osc_OFF_STS",			BIT(27)},
+	{"SATAPLL_OFF_STS",			BIT(29)},
+	{"XTAL_USB2PLL_OFF_STS",		BIT(31)},
+	{}
+};
+
+static const struct pmc_bit_map tgl_lpm1_map[] = {
+	{"SPI_PG_STS",				BIT(2)},
+	{"xHCI_PG_STS",				BIT(3)},
+	{"PCIe_Ctrller_A_PG_STS",		BIT(4)},
+	{"PCIe_Ctrller_B_PG_STS",		BIT(5)},
+	{"PCIe_Ctrller_C_PG_STS",		BIT(6)},
+	{"GBE_PG_STS",				BIT(7)},
+	{"SATA_PG_STS",				BIT(8)},
+	{"HDA0_PG_STS",				BIT(9)},
+	{"HDA1_PG_STS",				BIT(10)},
+	{"HDA2_PG_STS",				BIT(11)},
+	{"HDA3_PG_STS",				BIT(12)},
+	{"PCIe_Ctrller_D_PG_STS",		BIT(13)},
+	{"ISIO_PG_STS",				BIT(14)},
+	{"SMB_PG_STS",				BIT(16)},
+	{"ISH_PG_STS",				BIT(17)},
+	{"ITH_PG_STS",				BIT(19)},
+	{"SDX_PG_STS",				BIT(20)},
+	{"xDCI_PG_STS",				BIT(25)},
+	{"DCI_PG_STS",				BIT(26)},
+	{"CSME0_PG_STS",			BIT(27)},
+	{"CSME_KVM_PG_STS",			BIT(28)},
+	{"CSME1_PG_STS",			BIT(29)},
+	{"CSME_CLINK_PG_STS",			BIT(30)},
+	{"CSME2_PG_STS",			BIT(31)},
+	{}
+};
+
+static const struct pmc_bit_map tgl_lpm2_map[] = {
+	{"ADSP_D3_STS",				BIT(0)},
+	{"SATA_D3_STS",				BIT(1)},
+	{"xHCI0_D3_STS",			BIT(2)},
+	{"xDCI1_D3_STS",			BIT(5)},
+	{"SDX_D3_STS",				BIT(6)},
+	{"EMMC_D3_STS",				BIT(7)},
+	{"IS_D3_STS",				BIT(8)},
+	{"THC0_D3_STS",				BIT(9)},
+	{"THC1_D3_STS",				BIT(10)},
+	{"GBE_D3_STS",				BIT(11)},
+	{"GBE_TSN_D3_STS",			BIT(12)},
+	{}
+};
+
+static const struct pmc_bit_map tgl_lpm3_map[] = {
+	{"GPIO_COM0_VNN_REQ_STS",		BIT(1)},
+	{"GPIO_COM1_VNN_REQ_STS",		BIT(2)},
+	{"GPIO_COM2_VNN_REQ_STS",		BIT(3)},
+	{"GPIO_COM3_VNN_REQ_STS",		BIT(4)},
+	{"GPIO_COM4_VNN_REQ_STS",		BIT(5)},
+	{"GPIO_COM5_VNN_REQ_STS",		BIT(6)},
+	{"Audio_VNN_REQ_STS",			BIT(7)},
+	{"ISH_VNN_REQ_STS",			BIT(8)},
+	{"CNVI_VNN_REQ_STS",			BIT(9)},
+	{"eSPI_VNN_REQ_STS",			BIT(10)},
+	{"Display_VNN_REQ_STS",			BIT(11)},
+	{"DTS_VNN_REQ_STS",			BIT(12)},
+	{"SMBUS_VNN_REQ_STS",			BIT(14)},
+	{"CSME_VNN_REQ_STS",			BIT(15)},
+	{"SMLINK0_VNN_REQ_STS",			BIT(16)},
+	{"SMLINK1_VNN_REQ_STS",			BIT(17)},
+	{"CLINK_VNN_REQ_STS",			BIT(20)},
+	{"DCI_VNN_REQ_STS",			BIT(21)},
+	{"ITH_VNN_REQ_STS",			BIT(22)},
+	{"CSME_VNN_REQ_STS",			BIT(24)},
+	{"GBE_VNN_REQ_STS",			BIT(25)},
+	{}
+};
+
+static const struct pmc_bit_map tgl_lpm4_map[] = {
+	{"CPU_C10_REQ_STS_0",			BIT(0)},
+	{"PCIe_LPM_En_REQ_STS_3",		BIT(3)},
+	{"ITH_REQ_STS_5",			BIT(5)},
+	{"CNVI_REQ_STS_6",			BIT(6)},
+	{"ISH_REQ_STS_7",			BIT(7)},
+	{"USB2_SUS_PG_Sys_REQ_STS_10",		BIT(10)},
+	{"PCIe_Clk_REQ_STS_12",			BIT(12)},
+	{"MPHY_Core_DL_REQ_STS_16",		BIT(16)},
+	{"Break-even_En_REQ_STS_17",		BIT(17)},
+	{"Auto-demo_En_REQ_STS_18",		BIT(18)},
+	{"MPHY_SUS_REQ_STS_22",			BIT(22)},
+	{"xDCI_attached_REQ_STS_24",		BIT(24)},
+	{}
+};
+
+static const struct pmc_bit_map tgl_lpm5_map[] = {
+	{"LSX_Wake0_En_STS",			BIT(0)},
+	{"LSX_Wake0_Pol_STS",			BIT(1)},
+	{"LSX_Wake1_En_STS",			BIT(2)},
+	{"LSX_Wake1_Pol_STS",			BIT(3)},
+	{"LSX_Wake2_En_STS",			BIT(4)},
+	{"LSX_Wake2_Pol_STS",			BIT(5)},
+	{"LSX_Wake3_En_STS",			BIT(6)},
+	{"LSX_Wake3_Pol_STS",			BIT(7)},
+	{"LSX_Wake4_En_STS",			BIT(8)},
+	{"LSX_Wake4_Pol_STS",			BIT(9)},
+	{"LSX_Wake5_En_STS",			BIT(10)},
+	{"LSX_Wake5_Pol_STS",			BIT(11)},
+	{"LSX_Wake6_En_STS",			BIT(12)},
+	{"LSX_Wake6_Pol_STS",			BIT(13)},
+	{"LSX_Wake7_En_STS",			BIT(14)},
+	{"LSX_Wake7_Pol_STS",			BIT(15)},
+	{"Intel_Se_IO_Wake0_En_STS",		BIT(16)},
+	{"Intel_Se_IO_Wake0_Pol_STS",		BIT(17)},
+	{"Intel_Se_IO_Wake1_En_STS",		BIT(18)},
+	{"Intel_Se_IO_Wake1_Pol_STS",		BIT(19)},
+	{"Int_Timer_SS_Wake0_En_STS",		BIT(20)},
+	{"Int_Timer_SS_Wake0_Pol_STS",		BIT(21)},
+	{"Int_Timer_SS_Wake1_En_STS",		BIT(22)},
+	{"Int_Timer_SS_Wake1_Pol_STS",		BIT(23)},
+	{"Int_Timer_SS_Wake2_En_STS",		BIT(24)},
+	{"Int_Timer_SS_Wake2_Pol_STS",		BIT(25)},
+	{"Int_Timer_SS_Wake3_En_STS",		BIT(26)},
+	{"Int_Timer_SS_Wake3_Pol_STS",		BIT(27)},
+	{"Int_Timer_SS_Wake4_En_STS",		BIT(28)},
+	{"Int_Timer_SS_Wake4_Pol_STS",		BIT(29)},
+	{"Int_Timer_SS_Wake5_En_STS",		BIT(30)},
+	{"Int_Timer_SS_Wake5_Pol_STS",		BIT(31)},
+	{}
+};
+
+static const struct pmc_bit_map *tgl_lpm_maps[] = {
+	tgl_lpm0_map,
+	tgl_lpm1_map,
+	tgl_lpm2_map,
+	tgl_lpm3_map,
+	tgl_lpm4_map,
+	tgl_lpm5_map,
+	NULL
+};
+
 static const struct pmc_reg_map tgl_reg_map = {
 	.pfear_sts = ext_tgl_pfear_map,
 	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
@@ -424,6 +570,8 @@ static const struct pmc_reg_map tgl_reg_map = {
 	.ltr_ignore_max = TGL_NUM_IP_IGN_ALLOWED,
 	.lpm_en_offset = TGL_LPM_EN_OFFSET,
 	.lpm_residency_offset = TGL_LPM_RESIDENCY_OFFSET,
+	.lpm_sts = tgl_lpm_maps,
+	.lpm_status_offset = TGL_LPM_STATUS_OFFSET,
 };
 
 static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
@@ -815,6 +963,40 @@ static int pmc_core_substate_res_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_res);
 
+static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct seq_file *s,
+				 u32 offset, const char *str,
+				 const struct pmc_bit_map **maps)
+{
+	u32 lpm_regs[ARRAY_SIZE(tgl_lpm_maps)-1];
+	int index, idx, len = 32, bit_mask;
+
+	for (index = 0; tgl_lpm_maps[index]; index++) {
+		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
+		offset += 4;
+	}
+
+	for (idx = 0; maps[idx]; idx++) {
+		seq_printf(s, "\nLPM_%s_%d:\t0x%x\n", str, idx, lpm_regs[idx]);
+		for (index = 0; maps[idx][index].name && index < len; index++) {
+			bit_mask = maps[idx][index].bit_mask;
+			seq_printf(s, "%-30s %-30d\n", maps[idx][index].name,
+				   lpm_regs[idx] & bit_mask ? 1 : 0);
+		}
+	}
+}
+
+static int pmc_core_substate_sts_regs_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
+	u32 offset = pmcdev->map->lpm_status_offset;
+
+	pmc_core_lpm_display(pmcdev, s, offset, "STATUS", maps);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_sts_regs);
+
 static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
@@ -886,6 +1068,12 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 				    pmcdev->dbgfs_dir, pmcdev,
 				    &pmc_core_substate_res_fops);
 	}
+
+	if (pmcdev->map->lpm_status_offset) {
+		debugfs_create_file("substate_status_registers", 0444,
+				    pmcdev->dbgfs_dir, pmcdev,
+				    &pmc_core_substate_sts_regs_fops);
+	}
 }
 #else
 static inline void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index ff1b2645d9b4..3fdf4735c56f 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -194,6 +194,9 @@ enum ppfear_regs {
 #define TGL_LPM_EN_OFFSET			0x1C78
 #define TGL_LPM_RESIDENCY_OFFSET		0x1C80
 
+/* Tigerlake Low Power Mode debug registers */
+#define TGL_LPM_STATUS_OFFSET			0x1C3C
+
 const char *lpm_modes[] = {
 	"S0i2.0",
 	"S0i2.1",
@@ -239,6 +242,7 @@ struct pmc_reg_map {
 	const struct pmc_bit_map **slps0_dbg_maps;
 	const struct pmc_bit_map *ltr_show_sts;
 	const struct pmc_bit_map *msr_sts;
+	const struct pmc_bit_map **lpm_sts;
 	const u32 slp_s0_offset;
 	const u32 ltr_ignore_offset;
 	const int regmap_length;
@@ -252,6 +256,7 @@ struct pmc_reg_map {
 	/* Low Power Mode registers */
 	const u32 lpm_en_offset;
 	const u32 lpm_residency_offset;
+	const u32 lpm_status_offset;
 };
 
 /**
-- 
2.17.1


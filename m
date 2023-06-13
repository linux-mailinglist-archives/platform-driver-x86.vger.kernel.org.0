Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C32972EFAC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Jun 2023 00:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241185AbjFMWvr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 13 Jun 2023 18:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240605AbjFMWvm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 18:51:42 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F881981;
        Tue, 13 Jun 2023 15:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686696700; x=1718232700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b3rA9w7nxlEXttQBni+aWxEahEOqFvGpDV4OWlGNayM=;
  b=mPY2Fa6rIFljQ0k/FcQ1WP0z2P08HCnpTOxkXGmupGAW0QCQKCOnYEC1
   VrmPJ95VrNVoJ+cQK0l2nthe8UuESy6ZTvANTxrRrYg+HEbWbHzCqH+Pb
   LHTAuHbl6xERgmIzoFS27K6jdKDwjYrVLdCQhEOnw+A1KKFMnbgeUmZ8W
   IhlfYD9IVG4ABQzeSUedJB9xXiGGbeGFfE4SmWKGSwqSSCgw9dQzQI322
   jEsEfTNdkG7SZM9aGA25T8SKzT7mKZn0yJ/lKl63UOnZfMf/wdhwuzRAk
   hsnXH8/uuGJetBcqQ0ot8mDNK06gVnn3b94t4pXBx923v6MjxlsyEvK8L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444842200"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="444842200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 15:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824589651"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="824589651"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2023 15:51:38 -0700
Received: from rjingar-desk5.amr.corp.intel.com (hciettox-mobl.amr.corp.intel.com [10.212.23.107])
        by linux.intel.com (Postfix) with ESMTP id 8F6CD580D61;
        Tue, 13 Jun 2023 15:51:38 -0700 (PDT)
From:   Rajvi Jingar <rajvi.jingar@linux.intel.com>
To:     david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
        irenic.rajneesh@gmail.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Cc:     xi.pardee@intel.com, Rajvi Jingar <rajvi.jingar@linux.intel.com>
Subject: [PATCH 7/8] platform/x86:intel/pmc: Add Meteor Lake IOE-P PMC related maps
Date:   Tue, 13 Jun 2023 15:53:46 -0700
Message-Id: <20230613225347.2720665-8-rajvi.jingar@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613225347.2720665-1-rajvi.jingar@linux.intel.com>
References: <20230613225347.2720665-1-rajvi.jingar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Xi Pardee <xi.pardee@intel.com>

Add device ID and register maps for the PMC in IO expansion die P in
Meteor Lake.

Signed-off-by: Xi Pardee <xi.pardee@intel.com>
Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/core.h |  21 ++
 drivers/platform/x86/intel/pmc/mtl.c  | 322 ++++++++++++++++++++++++++
 2 files changed, 343 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 06c444917a16..0c899efaa206 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -252,12 +252,15 @@ enum ppfear_regs {
 #define MTL_LPM_LIVE_STATUS_OFFSET		0x175C
 #define MTL_PMC_LTR_IOE_PMC			0x1C0C
 #define MTL_PMC_LTR_ESE				0x1BAC
+#define MTL_PMC_LTR_RESERVED			0x1BA4
+#define MTL_IOE_PMC_MMIO_REG_LEN		0x23A4
 #define MTL_SOCM_NUM_IP_IGN_ALLOWED		25
 #define MTL_SOC_PMC_MMIO_REG_LEN		0x2708
 #define MTL_PMC_LTR_SPG				0x1B74
 
 /* Meteor Lake PGD PFET Enable Ack Status */
 #define MTL_SOCM_PPFEAR_NUM_ENTRIES		8
+#define MTL_IOE_PPFEAR_NUM_ENTRIES		10
 
 extern const char *pmc_lpm_modes[];
 
@@ -457,6 +460,24 @@ extern const struct pmc_bit_map mtl_socm_vnn_misc_status_map[];
 extern const struct pmc_bit_map mtl_socm_signal_status_map[];
 extern const struct pmc_bit_map *mtl_socm_lpm_maps[];
 extern const struct pmc_reg_map mtl_socm_reg_map;
+extern const struct pmc_bit_map mtl_ioep_pfear_map[];
+extern const struct pmc_bit_map *ext_mtl_ioep_pfear_map[];
+extern const struct pmc_bit_map mtl_ioep_ltr_show_map[];
+extern const struct pmc_bit_map mtl_ioep_clocksource_status_map[];
+extern const struct pmc_bit_map mtl_ioep_power_gating_status_0_map[];
+extern const struct pmc_bit_map mtl_ioep_power_gating_status_1_map[];
+extern const struct pmc_bit_map mtl_ioep_power_gating_status_2_map[];
+extern const struct pmc_bit_map mtl_ioep_d3_status_0_map[];
+extern const struct pmc_bit_map mtl_ioep_d3_status_1_map[];
+extern const struct pmc_bit_map mtl_ioep_d3_status_2_map[];
+extern const struct pmc_bit_map mtl_ioep_d3_status_3_map[];
+extern const struct pmc_bit_map mtl_ioep_vnn_req_status_0_map[];
+extern const struct pmc_bit_map mtl_ioep_vnn_req_status_1_map[];
+extern const struct pmc_bit_map mtl_ioep_vnn_req_status_2_map[];
+extern const struct pmc_bit_map mtl_ioep_vnn_req_status_3_map[];
+extern const struct pmc_bit_map mtl_ioep_vnn_misc_status_map[];
+extern const struct pmc_bit_map *mtl_ioep_lpm_maps[];
+extern const struct pmc_reg_map mtl_ioep_reg_map;
 
 extern void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev);
 extern int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value);
diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index b5552bb146c9..da3dba8c653b 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -467,12 +467,334 @@ const struct pmc_reg_map mtl_socm_reg_map = {
 	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
 };
 
+const struct pmc_bit_map mtl_ioep_pfear_map[] = {
+	{"PMC_0",               BIT(0)},
+	{"OPI",                 BIT(1)},
+	{"TCSS",                BIT(2)},
+	{"RSVD3",               BIT(3)},
+	{"SPA",                 BIT(4)},
+	{"SPB",                 BIT(5)},
+	{"SPC",                 BIT(6)},
+	{"IOE_D2D_3",           BIT(7)},
+
+	{"RSVD8",               BIT(0)},
+	{"RSVD9",               BIT(1)},
+	{"SPE",                 BIT(2)},
+	{"RSVD11",              BIT(3)},
+	{"RSVD12",              BIT(4)},
+	{"SPD",                 BIT(5)},
+	{"ACE_7",               BIT(6)},
+	{"RSVD15",              BIT(7)},
+
+	{"ACE_0",               BIT(0)},
+	{"FIACPCB_P",           BIT(1)},
+	{"P2S",                 BIT(2)},
+	{"RSVD19",              BIT(3)},
+	{"ACE_8",               BIT(4)},
+	{"IOE_D2D_0",           BIT(5)},
+	{"FUSE",                BIT(6)},
+	{"RSVD23",              BIT(7)},
+
+	{"FIACPCB_P5",          BIT(0)},
+	{"ACE_3",               BIT(1)},
+	{"RSF5",                BIT(2)},
+	{"ACE_2",               BIT(3)},
+	{"ACE_4",               BIT(4)},
+	{"RSVD29",              BIT(5)},
+	{"RSF10",               BIT(6)},
+	{"MPFPW5",              BIT(7)},
+
+	{"PSF9",                BIT(0)},
+	{"MPFPW4",              BIT(1)},
+	{"RSVD34",              BIT(2)},
+	{"RSVD35",              BIT(3)},
+	{"RSVD36",              BIT(4)},
+	{"RSVD37",              BIT(5)},
+	{"RSVD38",              BIT(6)},
+	{"RSVD39",              BIT(7)},
+
+	{"SBR0",                BIT(0)},
+	{"SBR1",                BIT(1)},
+	{"SBR2",                BIT(2)},
+	{"SBR3",                BIT(3)},
+	{"SBR4",                BIT(4)},
+	{"SBR5",                BIT(5)},
+	{"RSVD46",              BIT(6)},
+	{"RSVD47",              BIT(7)},
+
+	{"RSVD48",              BIT(0)},
+	{"FIA_P5",              BIT(1)},
+	{"RSVD50",              BIT(2)},
+	{"RSVD51",              BIT(3)},
+	{"RSVD52",              BIT(4)},
+	{"RSVD53",              BIT(5)},
+	{"RSVD54",              BIT(6)},
+	{"ACE_1",               BIT(7)},
+
+	{"RSVD56",              BIT(0)},
+	{"ACE_5",               BIT(1)},
+	{"RSVD58",              BIT(2)},
+	{"G5FPW1",              BIT(3)},
+	{"RSVD60",              BIT(4)},
+	{"ACE_6",               BIT(5)},
+	{"RSVD62",              BIT(6)},
+	{"GBETSN1",             BIT(7)},
+
+	{"RSVD64",              BIT(0)},
+	{"FIA",                 BIT(1)},
+	{"RSVD66",              BIT(2)},
+	{"FIA_P",               BIT(3)},
+	{"TAM",                 BIT(4)},
+	{"GBETSN",              BIT(5)},
+	{"IOE_D2D_2",           BIT(6)},
+	{"IOE_D2D_1",           BIT(7)},
+
+	{"SPF",                 BIT(0)},
+	{"PMC_1",               BIT(1)},
+	{}
+};
+
+const struct pmc_bit_map *ext_mtl_ioep_pfear_map[] = {
+	mtl_ioep_pfear_map,
+	NULL
+};
+
+const struct pmc_bit_map mtl_ioep_ltr_show_map[] = {
+	{"SOUTHPORT_A",		CNP_PMC_LTR_SPA},
+	{"SOUTHPORT_B",		CNP_PMC_LTR_SPB},
+	{"SATA",		CNP_PMC_LTR_SATA},
+	{"GIGABIT_ETHERNET",	CNP_PMC_LTR_GBE},
+	{"XHCI",		CNP_PMC_LTR_XHCI},
+	{"SOUTHPORT_F",		ADL_PMC_LTR_SPF},
+	{"ME",			CNP_PMC_LTR_ME},
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
+	{"Reserved",		MTL_PMC_LTR_RESERVED},
+	{"UFSX2",		CNP_PMC_LTR_UFSX2},
+	{"EMMC",		CNP_PMC_LTR_EMMC},
+	{"WIGIG",		ICL_PMC_LTR_WIGIG},
+	{"THC0",		TGL_PMC_LTR_THC0},
+	{"THC1",		TGL_PMC_LTR_THC1},
+	{"SOUTHPORT_G",		MTL_PMC_LTR_SPG},
+
+	/* Below two cannot be used for LTR_IGNORE */
+	{"CURRENT_PLATFORM",	CNP_PMC_LTR_CUR_PLT},
+	{"AGGREGATED_SYSTEM",	CNP_PMC_LTR_CUR_ASLT},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_clocksource_status_map[] = {
+	{"AON2_OFF_STS",                 BIT(0)},
+	{"AON3_OFF_STS",                 BIT(1)},
+	{"AON4_OFF_STS",                 BIT(2)},
+	{"AON5_OFF_STS",                 BIT(3)},
+	{"AON1_OFF_STS",                 BIT(4)},
+	{"TBT_PLL_OFF_STS",              BIT(5)},
+	{"TMU_PLL_OFF_STS",              BIT(6)},
+	{"BCLK_PLL_OFF_STS",             BIT(7)},
+	{"D2D_PLL_OFF_STS",              BIT(8)},
+	{"AON3_SPL_OFF_STS",             BIT(9)},
+	{"MPFPW4_0_PLL_OFF_STS",         BIT(12)},
+	{"MPFPW5_0_PLL_OFF_STS",         BIT(13)},
+	{"G5FPW_0_PLL_OFF_STS",          BIT(14)},
+	{"G5FPW_1_PLL_OFF_STS",          BIT(15)},
+	{"XTAL_AGGR_OFF_STS",            BIT(17)},
+	{"FABRIC_PLL_OFF_STS",           BIT(25)},
+	{"SOC_PLL_OFF_STS",              BIT(26)},
+	{"REF_PLL_OFF_STS",              BIT(28)},
+	{"RTC_PLL_OFF_STS",              BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_power_gating_status_0_map[] = {
+	{"PMC_PGD0_PG_STS",              BIT(0)},
+	{"DMI_PGD0_PG_STS",              BIT(1)},
+	{"TCSS_PGD0_PG_STS",             BIT(2)},
+	{"SPA_PGD0_PG_STS",              BIT(4)},
+	{"SPB_PGD0_PG_STS",              BIT(5)},
+	{"SPC_PGD0_PG_STS",              BIT(6)},
+	{"IOE_D2D_PGD3_PG_STS",          BIT(7)},
+	{"SPE_PGD0_PG_STS",              BIT(10)},
+	{"SPD_PGD0_PG_STS",              BIT(13)},
+	{"ACE_PGD7_PG_STS",              BIT(14)},
+	{"ACE_PGD0_PG_STS",              BIT(16)},
+	{"FIACPCB_P_PGD0_PG_STS",        BIT(17)},
+	{"P2S_PGD0_PG_STS",              BIT(18)},
+	{"ACE_PGD8_PG_STS",              BIT(20)},
+	{"IOE_D2D_PGD0_PG_STS",          BIT(21)},
+	{"FUSE_PGD0_PG_STS",             BIT(22)},
+	{"FIACPCB_P5_PGD0_PG_STS",       BIT(24)},
+	{"ACE_PGD3_PG_STS",              BIT(25)},
+	{"PSF5_PGD0_PG_STS",             BIT(26)},
+	{"ACE_PGD2_PG_STS",              BIT(27)},
+	{"ACE_PGD4_PG_STS",              BIT(28)},
+	{"PSF10_PGD0_PG_STS",            BIT(30)},
+	{"MPFPW5_PGD0_PG_STS",           BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_power_gating_status_1_map[] = {
+	{"PSF9_PGD0_PG_STS",             BIT(0)},
+	{"MPFPW4_PGD0_PG_STS",           BIT(1)},
+	{"SBR0_PGD0_PG_STS",             BIT(8)},
+	{"SBR1_PGD0_PG_STS",             BIT(9)},
+	{"SBR2_PGD0_PG_STS",             BIT(10)},
+	{"SBR3_PGD0_PG_STS",             BIT(11)},
+	{"SBR4_PGD0_PG_STS",             BIT(12)},
+	{"SBR5_PGD0_PG_STS",             BIT(13)},
+	{"FIA_P5_PGD0_PG_STS",           BIT(17)},
+	{"ACE_PGD1_PGD0_PG_STS",         BIT(23)},
+	{"ACE_PGD5_PGD1_PG_STS",         BIT(25)},
+	{"G5FPW1_PGD0_PG_STS",           BIT(27)},
+	{"ACE_PGD6_PG_STS",              BIT(29)},
+	{"GBETSN1_PGD0_PG_STS",          BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_power_gating_status_2_map[] = {
+	{"FIA_PGD0_PG_STS",              BIT(1)},
+	{"FIA_P_PGD0_PG_STS",            BIT(3)},
+	{"TAM_PGD0_PG_STS",              BIT(4)},
+	{"GBETSN_PGD0_PG_STS",           BIT(5)},
+	{"IOE_D2D_PGD2_PG_STS",          BIT(6)},
+	{"IOE_D2D_PGD1_PG_STS",          BIT(7)},
+	{"SPF_PGD0_PG_STS",              BIT(8)},
+	{"PMC_PGD1_PG_STS",              BIT(9)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_d3_status_0_map[] = {
+	{"SPF_D3_STS",                   BIT(0)},
+	{"SPA_D3_STS",                   BIT(12)},
+	{"SPB_D3_STS",                   BIT(13)},
+	{"SPC_D3_STS",                   BIT(14)},
+	{"SPD_D3_STS",                   BIT(15)},
+	{"SPE_D3_STS",                   BIT(16)},
+	{"DMI_D3_STS",                   BIT(22)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_d3_status_1_map[] = {
+	{"GBETSN1_D3_STS",               BIT(14)},
+	{"P2S_D3_STS",                   BIT(24)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_d3_status_2_map[] = {
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_d3_status_3_map[] = {
+	{"GBETSN_D3_STS",                BIT(13)},
+	{"ACE_D3_STS",                   BIT(23)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_vnn_req_status_0_map[] = {
+	{"FIA_VNN_REQ_STS",              BIT(17)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_vnn_req_status_1_map[] = {
+	{"DFXAGG_VNN_REQ_STS",           BIT(8)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_vnn_req_status_2_map[] = {
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_vnn_req_status_3_map[] = {
+	{"DTS0_VNN_REQ_STS",             BIT(7)},
+	{"DISP_VNN_REQ_STS",             BIT(19)},
+	{}
+};
+
+const struct pmc_bit_map mtl_ioep_vnn_misc_status_map[] = {
+	{"CPU_C10_REQ_STS",              BIT(0)},
+	{"TS_OFF_REQ_STS",               BIT(1)},
+	{"PNDE_MET_REQ_STS",             BIT(2)},
+	{"PCIE_DEEP_PM_REQ_STS",         BIT(3)},
+	{"PMC_CLK_THROTTLE_EN_REQ_STS",  BIT(4)},
+	{"NPK_VNNAON_REQ_STS",           BIT(5)},
+	{"VNN_SOC_REQ_STS",              BIT(6)},
+	{"USB_DEVICE_ATTACHED_REQ_STS",  BIT(8)},
+	{"FIA_EXIT_REQ_STS",             BIT(9)},
+	{"USB2_SUS_PG_REQ_STS",          BIT(10)},
+	{"PLT_GREATER_REQ_STS",          BIT(11)},
+	{"PCIE_CLKREQ_REQ_STS",          BIT(12)},
+	{"PMC_IDLE_FB_OCP_REQ_STS",      BIT(13)},
+	{"PM_SYNC_STATES_REQ_STS",       BIT(14)},
+	{"EA_REQ_STS",                   BIT(15)},
+	{"MPHY_CORE_OFF_REQ_STS",        BIT(16)},
+	{"BRK_EV_EN_REQ_STS",            BIT(17)},
+	{"AUTO_DEMO_EN_REQ_STS",         BIT(18)},
+	{"ITSS_CLK_SRC_REQ_STS",         BIT(19)},
+	{"LPC_CLK_SRC_REQ_STS",          BIT(20)},
+	{"ARC_IDLE_REQ_STS",             BIT(21)},
+	{"MPHY_SUS_REQ_STS",             BIT(22)},
+	{"FIA_DEEP_PM_REQ_STS",          BIT(23)},
+	{"UXD_CONNECTED_REQ_STS",        BIT(24)},
+	{"ARC_INTERRUPT_WAKE_REQ_STS",   BIT(25)},
+	{"USB2_VNNAON_ACT_REQ_STS",      BIT(26)},
+	{"PRE_WAKE0_REQ_STS",            BIT(27)},
+	{"PRE_WAKE1_REQ_STS",            BIT(28)},
+	{"PRE_WAKE2_EN_REQ_STS",         BIT(29)},
+	{"WOV_REQ_STS",                  BIT(30)},
+	{"CNVI_V1P05_REQ_STS",           BIT(31)},
+	{}
+};
+
+const struct pmc_bit_map *mtl_ioep_lpm_maps[] = {
+	mtl_ioep_clocksource_status_map,
+	mtl_ioep_power_gating_status_0_map,
+	mtl_ioep_power_gating_status_1_map,
+	mtl_ioep_power_gating_status_2_map,
+	mtl_ioep_d3_status_0_map,
+	mtl_ioep_d3_status_1_map,
+	mtl_ioep_d3_status_2_map,
+	mtl_ioep_d3_status_3_map,
+	mtl_ioep_vnn_req_status_0_map,
+	mtl_ioep_vnn_req_status_1_map,
+	mtl_ioep_vnn_req_status_2_map,
+	mtl_ioep_vnn_req_status_3_map,
+	mtl_ioep_vnn_misc_status_map,
+	mtl_socm_signal_status_map,
+	NULL
+};
+
+const struct pmc_reg_map mtl_ioep_reg_map = {
+	.regmap_length = MTL_IOE_PMC_MMIO_REG_LEN,
+	.pfear_sts = ext_mtl_ioep_pfear_map,
+	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
+	.ppfear_buckets = MTL_IOE_PPFEAR_NUM_ENTRIES,
+	.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
+	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
+	.lpm_sts = mtl_ioep_lpm_maps,
+	.ltr_show_sts = mtl_ioep_ltr_show_map,
+	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
+	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
+};
+
 #define PMC_DEVID_SOCM	0x7e7f
+#define PMC_DEVID_IOEP	0x7ecf
 static struct pmc_info mtl_pmc_info_list[] = {
 	{
 		.devid = PMC_DEVID_SOCM,
 		.map = &mtl_socm_reg_map,
 	},
+	{
+		.devid = PMC_DEVID_IOEP,
+		.map = &mtl_ioep_reg_map,
+	},
 	{}
 };
 
-- 
2.25.1


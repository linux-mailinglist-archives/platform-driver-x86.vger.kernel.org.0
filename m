Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6892A72EFAD
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Jun 2023 00:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241203AbjFMWvs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 13 Jun 2023 18:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240270AbjFMWvk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 18:51:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2A01BE9;
        Tue, 13 Jun 2023 15:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686696697; x=1718232697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X+teYYfIYJhkibDp86kPy0XYQnCiN9+yD7YyNXjAa+o=;
  b=P8cO8mLYmn8SieJgiFQlM1pRM8Bnxk5yEDO3mtsmJuapWNZ7GKVUjCFl
   WRxRnCRepUyC52B4hiD+5wVvCPDFBPGVsOI/E1mGfxAg7FyE1714Px1LZ
   hRySH73OPDyv/KoTz80WSCQ0/ni84AqjR76zquC06P8lrqsIKn8lPxifu
   JLDFmAnaDzkZB6m4MCZSMG7iqZdqny8oJbsldwErIjEjGU7GpWBIY+Tgj
   U8wTRppQYIzTWzYZA/8EuL1qxuWDR3Zr5+IBFD2ApLT7X9hOVO+OblwHN
   SAC7vzdsZil2CZ1nK+eXLWLDscwfl1WFVEJO+CBT45p+QCntZKedqS+ao
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444842184"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="444842184"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 15:51:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824589638"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="824589638"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2023 15:51:36 -0700
Received: from rjingar-desk5.amr.corp.intel.com (hciettox-mobl.amr.corp.intel.com [10.212.23.107])
        by linux.intel.com (Postfix) with ESMTP id E5555580BF8;
        Tue, 13 Jun 2023 15:51:35 -0700 (PDT)
From:   Rajvi Jingar <rajvi.jingar@linux.intel.com>
To:     david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
        irenic.rajneesh@gmail.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Cc:     xi.pardee@intel.com
Subject: [PATCH 3/8] platform/x86:intel/pmc: Add support to handle multiple PMCs
Date:   Tue, 13 Jun 2023 15:53:42 -0700
Message-Id: <20230613225347.2720665-4-rajvi.jingar@linux.intel.com>
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

To support platforms with multiple PMCs, add a PMC device structure to
support each PMC instance.

Signed-off-by: Xi Pardee <xi.pardee@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/adl.c  |   5 +-
 drivers/platform/x86/intel/pmc/cnp.c  |   5 +-
 drivers/platform/x86/intel/pmc/core.c | 272 ++++++++++++++------------
 drivers/platform/x86/intel/pmc/core.h |  37 +++-
 drivers/platform/x86/intel/pmc/icl.c  |   6 +-
 drivers/platform/x86/intel/pmc/mtl.c  |   5 +-
 drivers/platform/x86/intel/pmc/spt.c  |   6 +-
 drivers/platform/x86/intel/pmc/tgl.c  |  10 +-
 8 files changed, 205 insertions(+), 141 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/adl.c b/drivers/platform/x86/intel/pmc/adl.c
index f678ce308cc7..5006008e01be 100644
--- a/drivers/platform/x86/intel/pmc/adl.c
+++ b/drivers/platform/x86/intel/pmc/adl.c
@@ -311,10 +311,11 @@ const struct pmc_reg_map adl_reg_map = {
 
 int adl_core_init(struct pmc_dev *pmcdev)
 {
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	int ret;
 
-	pmcdev->map = &adl_reg_map;
-	ret = get_primary_reg_base(pmcdev);
+	pmc->map = &adl_reg_map;
+	ret = get_primary_reg_base(pmc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
index 5fb2d191ce30..420aaa1d7c76 100644
--- a/drivers/platform/x86/intel/pmc/cnp.c
+++ b/drivers/platform/x86/intel/pmc/cnp.c
@@ -206,10 +206,11 @@ const struct pmc_reg_map cnp_reg_map = {
 
 int cnp_core_init(struct pmc_dev *pmcdev)
 {
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	int ret;
 
-	pmcdev->map = &cnp_reg_map;
-	ret = get_primary_reg_base(pmcdev);
+	pmc->map = &cnp_reg_map;
+	ret = get_primary_reg_base(pmc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 0d4cda7c1833..8d774461dd29 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -53,18 +53,18 @@ const struct pmc_bit_map msr_map[] = {
 	{}
 };
 
-static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
+static inline u32 pmc_core_reg_read(struct pmc *pmc, int reg_offset)
 {
-	return readl(pmcdev->regbase + reg_offset);
+	return readl(pmc->regbase + reg_offset);
 }
 
-static inline void pmc_core_reg_write(struct pmc_dev *pmcdev, int reg_offset,
+static inline void pmc_core_reg_write(struct pmc *pmc, int reg_offset,
 				      u32 val)
 {
-	writel(val, pmcdev->regbase + reg_offset);
+	writel(val, pmc->regbase + reg_offset);
 }
 
-static inline u64 pmc_core_adjust_slp_s0_step(struct pmc_dev *pmcdev, u32 value)
+static inline u64 pmc_core_adjust_slp_s0_step(struct pmc *pmc, u32 value)
 {
 	/*
 	 * ADL PCH does not have the SLP_S0 counter and LPM Residency counters are
@@ -72,17 +72,18 @@ static inline u64 pmc_core_adjust_slp_s0_step(struct pmc_dev *pmcdev, u32 value)
 	 * programs have the legacy SLP_S0 residency counter that is using the 122
 	 * usec tick.
 	 */
-	const int lpm_adj_x2 = pmcdev->map->lpm_res_counter_step_x2;
+	const int lpm_adj_x2 = pmc->map->lpm_res_counter_step_x2;
 
-	if (pmcdev->map == &adl_reg_map)
+	if (pmc->map == &adl_reg_map)
 		return (u64)value * GET_X2_COUNTER((u64)lpm_adj_x2);
 	else
-		return (u64)value * pmcdev->map->slp_s0_res_counter_step;
+		return (u64)value * pmc->map->slp_s0_res_counter_step;
 }
 
 static int set_etr3(struct pmc_dev *pmcdev)
 {
-	const struct pmc_reg_map *map = pmcdev->map;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
 	u32 reg;
 	int err;
 
@@ -92,7 +93,7 @@ static int set_etr3(struct pmc_dev *pmcdev)
 	mutex_lock(&pmcdev->lock);
 
 	/* check if CF9 is locked */
-	reg = pmc_core_reg_read(pmcdev, map->etr3_offset);
+	reg = pmc_core_reg_read(pmc, map->etr3_offset);
 	if (reg & ETR3_CF9LOCK) {
 		err = -EACCES;
 		goto out_unlock;
@@ -100,9 +101,9 @@ static int set_etr3(struct pmc_dev *pmcdev)
 
 	/* write CF9 global reset bit */
 	reg |= ETR3_CF9GR;
-	pmc_core_reg_write(pmcdev, map->etr3_offset, reg);
+	pmc_core_reg_write(pmc, map->etr3_offset, reg);
 
-	reg = pmc_core_reg_read(pmcdev, map->etr3_offset);
+	reg = pmc_core_reg_read(pmc, map->etr3_offset);
 	if (!(reg & ETR3_CF9GR)) {
 		err = -EIO;
 		goto out_unlock;
@@ -120,11 +121,12 @@ static umode_t etr3_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
-	const struct pmc_reg_map *map = pmcdev->map;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
 	u32 reg;
 
 	mutex_lock(&pmcdev->lock);
-	reg = pmc_core_reg_read(pmcdev, map->etr3_offset);
+	reg = pmc_core_reg_read(pmc, map->etr3_offset);
 	mutex_unlock(&pmcdev->lock);
 
 	return reg & ETR3_CF9LOCK ? attr->mode & (SYSFS_PREALLOC | 0444) : attr->mode;
@@ -134,7 +136,8 @@ static ssize_t etr3_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
-	const struct pmc_reg_map *map = pmcdev->map;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
 	u32 reg;
 
 	if (!map->etr3_offset)
@@ -142,7 +145,7 @@ static ssize_t etr3_show(struct device *dev,
 
 	mutex_lock(&pmcdev->lock);
 
-	reg = pmc_core_reg_read(pmcdev, map->etr3_offset);
+	reg = pmc_core_reg_read(pmc, map->etr3_offset);
 	reg &= ETR3_CF9GR | ETR3_CF9LOCK;
 
 	mutex_unlock(&pmcdev->lock);
@@ -191,37 +194,37 @@ static const struct attribute_group *pmc_dev_groups[] = {
 
 static int pmc_core_dev_state_get(void *data, u64 *val)
 {
-	struct pmc_dev *pmcdev = data;
-	const struct pmc_reg_map *map = pmcdev->map;
+	struct pmc *pmc = data;
+	const struct pmc_reg_map *map = pmc->map;
 	u32 value;
 
-	value = pmc_core_reg_read(pmcdev, map->slp_s0_offset);
-	*val = pmc_core_adjust_slp_s0_step(pmcdev, value);
+	value = pmc_core_reg_read(pmc, map->slp_s0_offset);
+	*val = pmc_core_adjust_slp_s0_step(pmc, value);
 
 	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL, "%llu\n");
 
-static int pmc_core_check_read_lock_bit(struct pmc_dev *pmcdev)
+static int pmc_core_check_read_lock_bit(struct pmc *pmc)
 {
 	u32 value;
 
-	value = pmc_core_reg_read(pmcdev, pmcdev->map->pm_cfg_offset);
-	return value & BIT(pmcdev->map->pm_read_disable_bit);
+	value = pmc_core_reg_read(pmc, pmc->map->pm_cfg_offset);
+	return value & BIT(pmc->map->pm_read_disable_bit);
 }
 
-static void pmc_core_slps0_display(struct pmc_dev *pmcdev, struct device *dev,
+static void pmc_core_slps0_display(struct pmc *pmc, struct device *dev,
 				   struct seq_file *s)
 {
-	const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;
+	const struct pmc_bit_map **maps = pmc->map->slps0_dbg_maps;
 	const struct pmc_bit_map *map;
-	int offset = pmcdev->map->slps0_dbg_offset;
+	int offset = pmc->map->slps0_dbg_offset;
 	u32 data;
 
 	while (*maps) {
 		map = *maps;
-		data = pmc_core_reg_read(pmcdev, offset);
+		data = pmc_core_reg_read(pmc, offset);
 		offset += 4;
 		while (map->name) {
 			if (dev)
@@ -248,7 +251,7 @@ static int pmc_core_lpm_get_arr_size(const struct pmc_bit_map **maps)
 	return idx;
 }
 
-static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
+static void pmc_core_lpm_display(struct pmc *pmc, struct device *dev,
 				 struct seq_file *s, u32 offset,
 				 const char *str,
 				 const struct pmc_bit_map **maps)
@@ -262,7 +265,7 @@ static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
 		return;
 
 	for (index = 0; index < arr_size; index++) {
-		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
+		lpm_regs[index] = pmc_core_reg_read(pmc, offset);
 		offset += 4;
 	}
 
@@ -291,9 +294,9 @@ static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
 
 static bool slps0_dbg_latch;
 
-static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
+static inline u8 pmc_core_reg_read_byte(struct pmc *pmc, int offset)
 {
-	return readb(pmcdev->regbase + offset);
+	return readb(pmc->regbase + offset);
 }
 
 static void pmc_core_display_map(struct seq_file *s, int index, int idx, int ip,
@@ -307,19 +310,20 @@ static void pmc_core_display_map(struct seq_file *s, int index, int idx, int ip,
 static int pmc_core_ppfear_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map **maps = pmcdev->map->pfear_sts;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_bit_map **maps = pmc->map->pfear_sts;
 	u8 pf_regs[PPFEAR_MAX_NUM_ENTRIES];
 	int index, iter, idx, ip = 0;
 
-	iter = pmcdev->map->ppfear0_offset;
+	iter = pmc->map->ppfear0_offset;
 
-	for (index = 0; index < pmcdev->map->ppfear_buckets &&
+	for (index = 0; index < pmc->map->ppfear_buckets &&
 	     index < PPFEAR_MAX_NUM_ENTRIES; index++, iter++)
-		pf_regs[index] = pmc_core_reg_read_byte(pmcdev, iter);
+		pf_regs[index] = pmc_core_reg_read_byte(pmc, iter);
 
 	for (idx = 0; maps[idx]; idx++) {
 		for (index = 0; maps[idx][index].name &&
-		     index < pmcdev->map->ppfear_buckets * 8; ip++, index++)
+		     index < pmc->map->ppfear_buckets * 8; ip++, index++)
 			pmc_core_display_map(s, index, idx, ip,
 					     pf_regs[index / 8], maps);
 	}
@@ -329,37 +333,38 @@ static int pmc_core_ppfear_show(struct seq_file *s, void *unused)
 DEFINE_SHOW_ATTRIBUTE(pmc_core_ppfear);
 
 /* This function should return link status, 0 means ready */
-static int pmc_core_mtpmc_link_status(struct pmc_dev *pmcdev)
+static int pmc_core_mtpmc_link_status(struct pmc *pmc)
 {
 	u32 value;
 
-	value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_STS_OFFSET);
+	value = pmc_core_reg_read(pmc, SPT_PMC_PM_STS_OFFSET);
 	return value & BIT(SPT_PMC_MSG_FULL_STS_BIT);
 }
 
-static int pmc_core_send_msg(struct pmc_dev *pmcdev, u32 *addr_xram)
+static int pmc_core_send_msg(struct pmc *pmc, u32 *addr_xram)
 {
 	u32 dest;
 	int timeout;
 
 	for (timeout = NUM_RETRIES; timeout > 0; timeout--) {
-		if (pmc_core_mtpmc_link_status(pmcdev) == 0)
+		if (pmc_core_mtpmc_link_status(pmc) == 0)
 			break;
 		msleep(5);
 	}
 
-	if (timeout <= 0 && pmc_core_mtpmc_link_status(pmcdev))
+	if (timeout <= 0 && pmc_core_mtpmc_link_status(pmc))
 		return -EBUSY;
 
 	dest = (*addr_xram & MTPMC_MASK) | (1U << 1);
-	pmc_core_reg_write(pmcdev, SPT_PMC_MTPMC_OFFSET, dest);
+	pmc_core_reg_write(pmc, SPT_PMC_MTPMC_OFFSET, dest);
 	return 0;
 }
 
 static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map *map = pmcdev->map->mphy_sts;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_bit_map *map = pmc->map->mphy_sts;
 	u32 mphy_core_reg_low, mphy_core_reg_high;
 	u32 val_low, val_high;
 	int index, err = 0;
@@ -374,21 +379,21 @@ static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
 
 	mutex_lock(&pmcdev->lock);
 
-	if (pmc_core_send_msg(pmcdev, &mphy_core_reg_low) != 0) {
+	if (pmc_core_send_msg(pmc, &mphy_core_reg_low) != 0) {
 		err = -EBUSY;
 		goto out_unlock;
 	}
 
 	msleep(10);
-	val_low = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
+	val_low = pmc_core_reg_read(pmc, SPT_PMC_MFPMC_OFFSET);
 
-	if (pmc_core_send_msg(pmcdev, &mphy_core_reg_high) != 0) {
+	if (pmc_core_send_msg(pmc, &mphy_core_reg_high) != 0) {
 		err = -EBUSY;
 		goto out_unlock;
 	}
 
 	msleep(10);
-	val_high = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
+	val_high = pmc_core_reg_read(pmc, SPT_PMC_MFPMC_OFFSET);
 
 	for (index = 0; index < 8 && map[index].name; index++) {
 		seq_printf(s, "%-32s\tState: %s\n",
@@ -413,7 +418,8 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_mphy_pg);
 static int pmc_core_pll_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map *map = pmcdev->map->pll_sts;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_bit_map *map = pmc->map->pll_sts;
 	u32 mphy_common_reg, val;
 	int index, err = 0;
 
@@ -425,14 +431,14 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
 	mphy_common_reg  = (SPT_PMC_MPHY_COM_STS_0 << 16);
 	mutex_lock(&pmcdev->lock);
 
-	if (pmc_core_send_msg(pmcdev, &mphy_common_reg) != 0) {
+	if (pmc_core_send_msg(pmc, &mphy_common_reg) != 0) {
 		err = -EBUSY;
 		goto out_unlock;
 	}
 
 	/* Observed PMC HW response latency for MTPMC-MFPMC is ~10 ms */
 	msleep(10);
-	val = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
+	val = pmc_core_reg_read(pmc, SPT_PMC_MFPMC_OFFSET);
 
 	for (index = 0; map[index].name ; index++) {
 		seq_printf(s, "%-32s\tState: %s\n",
@@ -448,7 +454,8 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
 
 int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
 {
-	const struct pmc_reg_map *map = pmcdev->map;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
 	u32 reg;
 	int err = 0;
 
@@ -459,9 +466,9 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
 		goto out_unlock;
 	}
 
-	reg = pmc_core_reg_read(pmcdev, map->ltr_ignore_offset);
+	reg = pmc_core_reg_read(pmc, map->ltr_ignore_offset);
 	reg |= BIT(value);
-	pmc_core_reg_write(pmcdev, map->ltr_ignore_offset, reg);
+	pmc_core_reg_write(pmc, map->ltr_ignore_offset, reg);
 
 out_unlock:
 	mutex_unlock(&pmcdev->lock);
@@ -509,7 +516,8 @@ static const struct file_operations pmc_core_ltr_ignore_ops = {
 
 static void pmc_core_slps0_dbg_latch(struct pmc_dev *pmcdev, bool reset)
 {
-	const struct pmc_reg_map *map = pmcdev->map;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
 	u32 fd;
 
 	mutex_lock(&pmcdev->lock);
@@ -517,12 +525,12 @@ static void pmc_core_slps0_dbg_latch(struct pmc_dev *pmcdev, bool reset)
 	if (!reset && !slps0_dbg_latch)
 		goto out_unlock;
 
-	fd = pmc_core_reg_read(pmcdev, map->slps0_dbg_offset);
+	fd = pmc_core_reg_read(pmc, map->slps0_dbg_offset);
 	if (reset)
 		fd &= ~CNP_PMC_LATCH_SLPS0_EVENTS;
 	else
 		fd |= CNP_PMC_LATCH_SLPS0_EVENTS;
-	pmc_core_reg_write(pmcdev, map->slps0_dbg_offset, fd);
+	pmc_core_reg_write(pmc, map->slps0_dbg_offset, fd);
 
 	slps0_dbg_latch = false;
 
@@ -535,7 +543,7 @@ static int pmc_core_slps0_dbg_show(struct seq_file *s, void *unused)
 	struct pmc_dev *pmcdev = s->private;
 
 	pmc_core_slps0_dbg_latch(pmcdev, false);
-	pmc_core_slps0_display(pmcdev, NULL, s);
+	pmc_core_slps0_display(pmcdev->pmcs[PMC_IDX_MAIN], NULL, s);
 	pmc_core_slps0_dbg_latch(pmcdev, true);
 
 	return 0;
@@ -578,8 +586,8 @@ static u32 convert_ltr_scale(u32 val)
 
 static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 {
-	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map *map = pmcdev->map->ltr_show_sts;
+	struct pmc *pmc = s->private;
+	const struct pmc_bit_map *map = pmc->map->ltr_show_sts;
 	u64 decoded_snoop_ltr, decoded_non_snoop_ltr;
 	u32 ltr_raw_data, scale, val;
 	u16 snoop_ltr, nonsnoop_ltr;
@@ -587,7 +595,7 @@ static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 
 	for (index = 0; map[index].name ; index++) {
 		decoded_snoop_ltr = decoded_non_snoop_ltr = 0;
-		ltr_raw_data = pmc_core_reg_read(pmcdev,
+		ltr_raw_data = pmc_core_reg_read(pmc,
 						 map[index].bit_mask);
 		snoop_ltr = ltr_raw_data & ~MTPMC_MASK;
 		nonsnoop_ltr = (ltr_raw_data >> 0x10) & ~MTPMC_MASK;
@@ -613,10 +621,10 @@ static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_ltr);
 
-static inline u64 adjust_lpm_residency(struct pmc_dev *pmcdev, u32 offset,
+static inline u64 adjust_lpm_residency(struct pmc *pmc, u32 offset,
 				       const int lpm_adj_x2)
 {
-	u64 lpm_res = pmc_core_reg_read(pmcdev, offset);
+	u64 lpm_res = pmc_core_reg_read(pmc, offset);
 
 	return GET_X2_COUNTER((u64)lpm_adj_x2 * lpm_res);
 }
@@ -624,15 +632,16 @@ static inline u64 adjust_lpm_residency(struct pmc_dev *pmcdev, u32 offset,
 static int pmc_core_substate_res_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	const int lpm_adj_x2 = pmcdev->map->lpm_res_counter_step_x2;
-	u32 offset = pmcdev->map->lpm_residency_offset;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const int lpm_adj_x2 = pmc->map->lpm_res_counter_step_x2;
+	u32 offset = pmc->map->lpm_residency_offset;
 	int i, mode;
 
 	seq_printf(s, "%-10s %-15s\n", "Substate", "Residency");
 
 	pmc_for_each_mode(i, mode, pmcdev) {
 		seq_printf(s, "%-10s %-15llu\n", pmc_lpm_modes[mode],
-			   adjust_lpm_residency(pmcdev, offset + (4 * mode), lpm_adj_x2));
+			   adjust_lpm_residency(pmc, offset + (4 * mode), lpm_adj_x2));
 	}
 
 	return 0;
@@ -642,10 +651,11 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_res);
 static int pmc_core_substate_sts_regs_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
-	u32 offset = pmcdev->map->lpm_status_offset;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_bit_map **maps = pmc->map->lpm_sts;
+	u32 offset = pmc->map->lpm_status_offset;
 
-	pmc_core_lpm_display(pmcdev, NULL, s, offset, "STATUS", maps);
+	pmc_core_lpm_display(pmc, NULL, s, offset, "STATUS", maps);
 
 	return 0;
 }
@@ -654,10 +664,11 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_sts_regs);
 static int pmc_core_substate_l_sts_regs_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
-	u32 offset = pmcdev->map->lpm_live_status_offset;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_bit_map **maps = pmc->map->lpm_sts;
+	u32 offset = pmc->map->lpm_live_status_offset;
 
-	pmc_core_lpm_display(pmcdev, NULL, s, offset, "LIVE_STATUS", maps);
+	pmc_core_lpm_display(pmc, NULL, s, offset, "LIVE_STATUS", maps);
 
 	return 0;
 }
@@ -678,11 +689,12 @@ static void pmc_core_substate_req_header_show(struct seq_file *s)
 static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_bit_map **maps = pmc->map->lpm_sts;
 	const struct pmc_bit_map *map;
-	const int num_maps = pmcdev->map->lpm_num_maps;
-	u32 sts_offset = pmcdev->map->lpm_status_offset;
-	u32 *lpm_req_regs = pmcdev->lpm_req_regs;
+	const int num_maps = pmc->map->lpm_num_maps;
+	u32 sts_offset = pmc->map->lpm_status_offset;
+	u32 *lpm_req_regs = pmc->lpm_req_regs;
 	int mp;
 
 	/* Display the header */
@@ -703,7 +715,7 @@ static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
 			req_mask |= lpm_req_regs[mp + (mode * num_maps)];
 
 		/* Get the last latched status for this map */
-		lpm_status = pmc_core_reg_read(pmcdev, sts_offset + (mp * 4));
+		lpm_status = pmc_core_reg_read(pmc, sts_offset + (mp * 4));
 
 		/*  Loop over elements in this map */
 		map = maps[mp];
@@ -746,11 +758,12 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_req_regs);
 static int pmc_core_lpm_latch_mode_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	bool c10;
 	u32 reg;
 	int idx, mode;
 
-	reg = pmc_core_reg_read(pmcdev, pmcdev->map->lpm_sts_latch_en_offset);
+	reg = pmc_core_reg_read(pmc, pmc->map->lpm_sts_latch_en_offset);
 	if (reg & LPM_STS_LATCH_MODE) {
 		seq_puts(s, "c10");
 		c10 = false;
@@ -777,6 +790,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 {
 	struct seq_file *s = file->private_data;
 	struct pmc_dev *pmcdev = s->private;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	bool clear = false, c10 = false;
 	unsigned char buf[8];
 	int idx, m, mode;
@@ -813,9 +827,9 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	if (clear) {
 		mutex_lock(&pmcdev->lock);
 
-		reg = pmc_core_reg_read(pmcdev, pmcdev->map->etr3_offset);
+		reg = pmc_core_reg_read(pmc, pmc->map->etr3_offset);
 		reg |= ETR3_CLEAR_LPM_EVENTS;
-		pmc_core_reg_write(pmcdev, pmcdev->map->etr3_offset, reg);
+		pmc_core_reg_write(pmc, pmc->map->etr3_offset, reg);
 
 		mutex_unlock(&pmcdev->lock);
 
@@ -825,9 +839,9 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	if (c10) {
 		mutex_lock(&pmcdev->lock);
 
-		reg = pmc_core_reg_read(pmcdev, pmcdev->map->lpm_sts_latch_en_offset);
+		reg = pmc_core_reg_read(pmc, pmc->map->lpm_sts_latch_en_offset);
 		reg &= ~LPM_STS_LATCH_MODE;
-		pmc_core_reg_write(pmcdev, pmcdev->map->lpm_sts_latch_en_offset, reg);
+		pmc_core_reg_write(pmc, pmc->map->lpm_sts_latch_en_offset, reg);
 
 		mutex_unlock(&pmcdev->lock);
 
@@ -840,7 +854,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	 */
 	reg = LPM_STS_LATCH_MODE | BIT(mode);
 	mutex_lock(&pmcdev->lock);
-	pmc_core_reg_write(pmcdev, pmcdev->map->lpm_sts_latch_en_offset, reg);
+	pmc_core_reg_write(pmc, pmc->map->lpm_sts_latch_en_offset, reg);
 	mutex_unlock(&pmcdev->lock);
 
 	return count;
@@ -849,8 +863,8 @@ DEFINE_PMC_CORE_ATTR_WRITE(pmc_core_lpm_latch_mode);
 
 static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
 {
-	struct pmc_dev *pmcdev = s->private;
-	const struct pmc_bit_map *map = pmcdev->map->msr_sts;
+	struct pmc *pmc = s->private;
+	const struct pmc_bit_map *map = pmc->map->msr_sts;
 	u64 pcstate_count;
 	int index;
 
@@ -901,6 +915,7 @@ static bool pmc_core_pri_verify(u32 lpm_pri, u8 *mode_order)
 static void pmc_core_get_low_power_modes(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	u8 pri_order[LPM_MAX_NUM_MODES] = LPM_DEFAULT_PRI;
 	u8 mode_order[LPM_MAX_NUM_MODES];
 	u32 lpm_pri;
@@ -908,10 +923,10 @@ static void pmc_core_get_low_power_modes(struct platform_device *pdev)
 	int mode, i, p;
 
 	/* Use LPM Maps to indicate support for substates */
-	if (!pmcdev->map->lpm_num_maps)
+	if (!pmc->map->lpm_num_maps)
 		return;
 
-	lpm_en = pmc_core_reg_read(pmcdev, pmcdev->map->lpm_en_offset);
+	lpm_en = pmc_core_reg_read(pmc, pmc->map->lpm_en_offset);
 	/* For MTL, BIT 31 is not an lpm mode but a enable bit.
 	 * Lower byte is enough to cover the number of lpm modes for all
 	 * platforms and hence mask the upper 3 bytes.
@@ -919,7 +934,7 @@ static void pmc_core_get_low_power_modes(struct platform_device *pdev)
 	pmcdev->num_lpm_modes = hweight32(lpm_en & 0xFF);
 
 	/* Read 32 bit LPM_PRI register */
-	lpm_pri = pmc_core_reg_read(pmcdev, pmcdev->map->lpm_priority_offset);
+	lpm_pri = pmc_core_reg_read(pmc, pmc->map->lpm_priority_offset);
 
 
 	/*
@@ -948,21 +963,21 @@ static void pmc_core_get_low_power_modes(struct platform_device *pdev)
 	}
 }
 
-int get_primary_reg_base(struct pmc_dev *pmcdev)
+int get_primary_reg_base(struct pmc *pmc)
 {
 	u64 slp_s0_addr;
 
 	if (lpit_read_residency_count_address(&slp_s0_addr)) {
-		pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
+		pmc->base_addr = PMC_BASE_ADDR_DEFAULT;
 
-		if (page_is_ram(PHYS_PFN(pmcdev->base_addr)))
+		if (page_is_ram(PHYS_PFN(pmc->base_addr)))
 			return -ENODEV;
 	} else {
-		pmcdev->base_addr = slp_s0_addr - pmcdev->map->slp_s0_offset;
+		pmc->base_addr = slp_s0_addr - pmc->map->slp_s0_offset;
 	}
 
-	pmcdev->regbase = ioremap(pmcdev->base_addr, pmcdev->map->regmap_length);
-	if (!pmcdev->regbase)
+	pmc->regbase = ioremap(pmc->base_addr, pmc->map->regmap_length);
+	if (!pmc->regbase)
 		return -ENOMEM;
 	return 0;
 }
@@ -974,36 +989,37 @@ static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 
 static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 {
+	struct pmc *primary_pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	struct dentry *dir;
 
 	dir = debugfs_create_dir("pmc_core", NULL);
 	pmcdev->dbgfs_dir = dir;
 
-	debugfs_create_file("slp_s0_residency_usec", 0444, dir, pmcdev,
+	debugfs_create_file("slp_s0_residency_usec", 0444, dir, primary_pmc,
 			    &pmc_core_dev_state);
 
-	if (pmcdev->map->pfear_sts)
+	if (primary_pmc->map->pfear_sts)
 		debugfs_create_file("pch_ip_power_gating_status", 0444, dir,
 				    pmcdev, &pmc_core_ppfear_fops);
 
 	debugfs_create_file("ltr_ignore", 0644, dir, pmcdev,
 			    &pmc_core_ltr_ignore_ops);
 
-	debugfs_create_file("ltr_show", 0444, dir, pmcdev, &pmc_core_ltr_fops);
+	debugfs_create_file("ltr_show", 0444, dir, primary_pmc, &pmc_core_ltr_fops);
 
-	debugfs_create_file("package_cstate_show", 0444, dir, pmcdev,
+	debugfs_create_file("package_cstate_show", 0444, dir, primary_pmc,
 			    &pmc_core_pkgc_fops);
 
-	if (pmcdev->map->pll_sts)
+	if (primary_pmc->map->pll_sts)
 		debugfs_create_file("pll_status", 0444, dir, pmcdev,
 				    &pmc_core_pll_fops);
 
-	if (pmcdev->map->mphy_sts)
+	if (primary_pmc->map->mphy_sts)
 		debugfs_create_file("mphy_core_lanes_power_gating_status",
 				    0444, dir, pmcdev,
 				    &pmc_core_mphy_pg_fops);
 
-	if (pmcdev->map->slps0_dbg_maps) {
+	if (primary_pmc->map->slps0_dbg_maps) {
 		debugfs_create_file("slp_s0_debug_status", 0444,
 				    dir, pmcdev,
 				    &pmc_core_slps0_dbg_fops);
@@ -1012,13 +1028,13 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 				    dir, &slps0_dbg_latch);
 	}
 
-	if (pmcdev->map->lpm_en_offset) {
+	if (primary_pmc->map->lpm_en_offset) {
 		debugfs_create_file("substate_residencies", 0444,
 				    pmcdev->dbgfs_dir, pmcdev,
 				    &pmc_core_substate_res_fops);
 	}
 
-	if (pmcdev->map->lpm_status_offset) {
+	if (primary_pmc->map->lpm_status_offset) {
 		debugfs_create_file("substate_status_registers", 0444,
 				    pmcdev->dbgfs_dir, pmcdev,
 				    &pmc_core_substate_sts_regs_fops);
@@ -1030,7 +1046,7 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 				    &pmc_core_lpm_latch_mode_fops);
 	}
 
-	if (pmcdev->lpm_req_regs) {
+	if (primary_pmc->lpm_req_regs) {
 		debugfs_create_file("substate_requirements", 0444,
 				    pmcdev->dbgfs_dir, pmcdev,
 				    &pmc_core_substate_req_regs_fops);
@@ -1081,16 +1097,16 @@ static int quirk_xtal_ignore(const struct dmi_system_id *id)
 	return 0;
 }
 
-static void pmc_core_xtal_ignore(struct pmc_dev *pmcdev)
+static void pmc_core_xtal_ignore(struct pmc *pmc)
 {
 	u32 value;
 
-	value = pmc_core_reg_read(pmcdev, pmcdev->map->pm_vric1_offset);
+	value = pmc_core_reg_read(pmc, pmc->map->pm_vric1_offset);
 	/* 24MHz Crystal Shutdown Qualification Disable */
 	value |= SPT_PMC_VRIC1_XTALSDQDIS;
 	/* Low Voltage Mode Enable */
 	value &= ~SPT_PMC_VRIC1_SLPS0LVEN;
-	pmc_core_reg_write(pmcdev, pmcdev->map->pm_vric1_offset, value);
+	pmc_core_reg_write(pmc, pmc->map->pm_vric1_offset, value);
 }
 
 static const struct dmi_system_id pmc_core_dmi_table[]  = {
@@ -1105,12 +1121,12 @@ static const struct dmi_system_id pmc_core_dmi_table[]  = {
 	{}
 };
 
-static void pmc_core_do_dmi_quirks(struct pmc_dev *pmcdev)
+static void pmc_core_do_dmi_quirks(struct pmc *pmc)
 {
 	dmi_check_system(pmc_core_dmi_table);
 
 	if (xtal_ignore)
-		pmc_core_xtal_ignore(pmcdev);
+		pmc_core_xtal_ignore(pmc);
 }
 
 static int pmc_core_probe(struct platform_device *pdev)
@@ -1119,6 +1135,7 @@ static int pmc_core_probe(struct platform_device *pdev)
 	struct pmc_dev *pmcdev;
 	const struct x86_cpu_id *cpu_id;
 	int (*core_init)(struct pmc_dev *pmcdev);
+	struct pmc *primary_pmc;
 	int ret;
 
 	if (device_initialized)
@@ -1137,6 +1154,12 @@ static int pmc_core_probe(struct platform_device *pdev)
 
 	core_init = (int (*)(struct pmc_dev *))cpu_id->driver_data;
 
+	/* Primary PMC */
+	primary_pmc = devm_kzalloc(&pdev->dev, sizeof(*primary_pmc), GFP_KERNEL);
+	if (!primary_pmc)
+		return -ENOMEM;
+	pmcdev->pmcs[PMC_IDX_MAIN] = primary_pmc;
+
 	/*
 	 * Coffee Lake has CPU ID of Kaby Lake and Cannon Lake PCH. So here
 	 * Sunrisepoint PCH regmap can't be used. Use Cannon Lake PCH regmap
@@ -1152,13 +1175,13 @@ static int pmc_core_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(pmcdev);
+	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(primary_pmc);
 	pmc_core_get_low_power_modes(pdev);
-	pmc_core_do_dmi_quirks(pmcdev);
+	pmc_core_do_dmi_quirks(primary_pmc);
 
 	pmc_core_dbgfs_register(pmcdev);
 	pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
-			       pmc_core_adjust_slp_s0_step(pmcdev, 1));
+			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
 
 	device_initialized = true;
 	dev_info(&pdev->dev, " initialized\n");
@@ -1169,11 +1192,18 @@ static int pmc_core_probe(struct platform_device *pdev)
 static void pmc_core_remove(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); ++i) {
+		struct pmc *pmc = pmcdev->pmcs[i];
+
+		if (pmc)
+			iounmap(pmc->regbase);
+	}
 
 	pmc_core_dbgfs_unregister(pmcdev);
 	platform_set_drvdata(pdev, NULL);
 	mutex_destroy(&pmcdev->lock);
-	iounmap(pmcdev->regbase);
 }
 
 static bool warn_on_s0ix_failures;
@@ -1183,6 +1213,7 @@ MODULE_PARM_DESC(warn_on_s0ix_failures, "Check and warn for S0ix failures");
 static __maybe_unused int pmc_core_suspend(struct device *dev)
 {
 	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 
 	/* Check if the syspend will actually use S0ix */
 	if (pm_suspend_via_firmware())
@@ -1193,7 +1224,7 @@ static __maybe_unused int pmc_core_suspend(struct device *dev)
 		return -EIO;
 
 	/* Save S0ix residency for checking later */
-	if (pmc_core_dev_state_get(pmcdev, &pmcdev->s0ix_counter))
+	if (pmc_core_dev_state_get(pmc, &pmcdev->s0ix_counter))
 		return -EIO;
 
 	return 0;
@@ -1216,7 +1247,7 @@ static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
 {
 	u64 s0ix_counter;
 
-	if (pmc_core_dev_state_get(pmcdev, &s0ix_counter))
+	if (pmc_core_dev_state_get(pmcdev->pmcs[PMC_IDX_MAIN], &s0ix_counter))
 		return false;
 
 	pm_report_hw_sleep_time((u32)(s0ix_counter - pmcdev->s0ix_counter));
@@ -1229,9 +1260,10 @@ static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
 
 int pmc_core_resume_common(struct pmc_dev *pmcdev)
 {
-	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
-	int offset = pmcdev->map->lpm_status_offset;
 	struct device *dev = &pmcdev->pdev->dev;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_bit_map **maps = pmc->map->lpm_sts;
+	int offset = pmc->map->lpm_status_offset;
 
 	/* Check if the syspend used S0ix */
 	if (pm_suspend_via_firmware())
@@ -1253,10 +1285,10 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
 	/* The real interesting case - S0ix failed - lets ask PMC why. */
 	dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
 		 pmcdev->s0ix_counter);
-	if (pmcdev->map->slps0_dbg_maps)
-		pmc_core_slps0_display(pmcdev, dev, NULL);
-	if (pmcdev->map->lpm_sts)
-		pmc_core_lpm_display(pmcdev, dev, NULL, offset, "STATUS", maps);
+	if (pmc->map->slps0_dbg_maps)
+		pmc_core_slps0_display(pmc, dev, NULL);
+	if (pmc->map->lpm_sts)
+		pmc_core_lpm_display(pmc, dev, NULL, offset, "STATUS", maps);
 
 	return 0;
 }
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index a672659b8659..4f21d452a033 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -19,6 +19,7 @@
 #define SLP_S0_RES_COUNTER_MASK			GENMASK(31, 0)
 
 #define PMC_BASE_ADDR_DEFAULT			0xFE000000
+#define MAX_NUM_PMC			3
 
 /* Sunrise Point Power Management Controller PCI Device ID */
 #define SPT_PMC_PCI_DEVICE_ID			0x9d21
@@ -319,11 +320,25 @@ struct pmc_reg_map {
 };
 
 /**
- * struct pmc_dev - pmc device structure
+ * struct pmc - pmc private info structure
  * @base_addr:		contains pmc base address
  * @regbase:		pointer to io-remapped memory location
  * @map:		pointer to pmc_reg_map struct that contains platform
  *			specific attributes
+ * @lpm_req_regs:	List of substate requirements
+ *
+ * pmc contains info about one power management controller device.
+ */
+struct pmc {
+	u64 base_addr;
+	void __iomem *regbase;
+	const struct pmc_reg_map *map;
+	u32 *lpm_req_regs;
+};
+
+/**
+ * struct pmc_dev - pmc device structure
+ * @devs:		pointer to an array of pmc pointers
  * @pdev:		pointer to platform_device struct
  * @dbgfs_dir:		path to debugfs interface
  * @pmc_xram_read_bit:	flag to indicate whether PMC XRAM shadow registers
@@ -333,15 +348,12 @@ struct pmc_reg_map {
  * @s0ix_counter:	S0ix residency (step adjusted)
  * @num_lpm_modes:	Count of enabled modes
  * @lpm_en_modes:	Array of enabled modes from lowest to highest priority
- * @lpm_req_regs:	List of substate requirements
  * @resume:		Function to perform platform specific resume
  *
  * pmc_dev contains info about power management controller device.
  */
 struct pmc_dev {
-	u32 base_addr;
-	void __iomem *regbase;
-	const struct pmc_reg_map *map;
+	struct pmc *pmcs[MAX_NUM_PMC];
 	struct dentry *dbgfs_dir;
 	struct platform_device *pdev;
 	int pmc_xram_read_bit;
@@ -351,8 +363,19 @@ struct pmc_dev {
 	u64 s0ix_counter;
 	int num_lpm_modes;
 	int lpm_en_modes[LPM_MAX_NUM_MODES];
-	u32 *lpm_req_regs;
 	int (*resume)(struct pmc_dev *pmcdev);
+
+	bool has_die_c6;
+	u32 die_c6_offset;
+	struct telem_endpoint *punit_ep;
+};
+
+enum pmc_index {
+	PMC_IDX_MAIN,
+	PMC_IDX_SOC = PMC_IDX_MAIN,
+	PMC_IDX_IOE,
+	PMC_IDX_PCH,
+	PMC_IDX_MAX
 };
 
 extern const struct pmc_bit_map msr_map[];
@@ -425,7 +448,7 @@ extern void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev);
 extern int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value);
 
 int pmc_core_resume_common(struct pmc_dev *pmcdev);
-int get_primary_reg_base(struct pmc_dev *pmcdev);
+int get_primary_reg_base(struct pmc *pmc);
 
 int spt_core_init(struct pmc_dev *pmcdev);
 int cnp_core_init(struct pmc_dev *pmcdev);
diff --git a/drivers/platform/x86/intel/pmc/icl.c b/drivers/platform/x86/intel/pmc/icl.c
index a671d7e86431..d08e3174230d 100644
--- a/drivers/platform/x86/intel/pmc/icl.c
+++ b/drivers/platform/x86/intel/pmc/icl.c
@@ -52,6 +52,8 @@ const struct pmc_reg_map icl_reg_map = {
 
 int icl_core_init(struct pmc_dev *pmcdev)
 {
-	pmcdev->map = &icl_reg_map;
-	return get_primary_reg_base(pmcdev);
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+
+	pmc->map = &icl_reg_map;
+	return get_primary_reg_base(pmc);
 }
diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index a2fc96f9ef11..69df6d7fee56 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -508,15 +508,16 @@ static int mtl_resume(struct pmc_dev *pmcdev)
 
 int mtl_core_init(struct pmc_dev *pmcdev)
 {
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_SOC];
 	int ret;
 
-	pmcdev->map = &mtl_socm_reg_map;
+	pmc->map = &mtl_socm_reg_map;
 
 	mtl_d3_fixup();
 
 	pmcdev->resume = mtl_resume;
 
-	ret = get_primary_reg_base(pmcdev);
+	ret = get_primary_reg_base(pmc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
index f34015692bb8..4b6f5cbda16c 100644
--- a/drivers/platform/x86/intel/pmc/spt.c
+++ b/drivers/platform/x86/intel/pmc/spt.c
@@ -136,6 +136,8 @@ const struct pmc_reg_map spt_reg_map = {
 
 int spt_core_init(struct pmc_dev *pmcdev)
 {
-	pmcdev->map = &spt_reg_map;
-	return get_primary_reg_base(pmcdev);
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+
+	pmc->map = &spt_reg_map;
+	return get_primary_reg_base(pmc);
 }
diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
index 90807bd947ed..2449940102db 100644
--- a/drivers/platform/x86/intel/pmc/tgl.c
+++ b/drivers/platform/x86/intel/pmc/tgl.c
@@ -208,7 +208,8 @@ const struct pmc_reg_map tgl_reg_map = {
 void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
-	const int num_maps = pmcdev->map->lpm_num_maps;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const int num_maps = pmc->map->lpm_num_maps;
 	u32 lpm_size = LPM_MAX_NUM_MODES * num_maps * 4;
 	union acpi_object *out_obj;
 	struct acpi_device *adev;
@@ -246,7 +247,7 @@ void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev)
 		goto free_acpi_obj;
 
 	memcpy(lpm_req_regs, addr, lpm_size);
-	pmcdev->lpm_req_regs = lpm_req_regs;
+	pmc->lpm_req_regs = lpm_req_regs;
 
 free_acpi_obj:
 	ACPI_FREE(out_obj);
@@ -254,10 +255,11 @@ void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev)
 
 int tgl_core_init(struct pmc_dev *pmcdev)
 {
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	int ret;
 
-	pmcdev->map = &tgl_reg_map;
-	ret = get_primary_reg_base(pmcdev);
+	pmc->map = &tgl_reg_map;
+	ret = get_primary_reg_base(pmc);
 	if (ret)
 		return ret;
 
-- 
2.25.1


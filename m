Return-Path: <platform-driver-x86+bounces-5915-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C599B696
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Oct 2024 20:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A46E41F21D17
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Oct 2024 18:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC45F84A4D;
	Sat, 12 Oct 2024 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zo4z869V"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81342110E
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Oct 2024 18:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728757624; cv=none; b=GSGdQCt9rAE50ZH/0xm1Cjlvn/qDdNpXRzlpXJgWA7CN9gDPGUKwz9svNNcyLI0xHBbm2LltlNweHg60lZ5FFbpUkSqASo5+Yj2j1j4PKlohQLB+0yxE8MgXkxr9hfOrJrLzzJnlk838HKvDe3/nm2ukGri7CxgD18K5I44/+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728757624; c=relaxed/simple;
	bh=gn1pSXgV0Wlipy2wpxpUzhBM227Q0zAyDctD2PyKtOw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pMIVMtZh3TvZ1EyiBDC4D9r5+DleKTwRgGukAU/O4UxoONwdo1InsQIAk7kd2SQhtXF4XmkfWv842vc98qB50h4M8yWADZ++J3FS01nLA9CJ+yWNAjq4gkoLcdqQlir3Bp1Z0K++df87TJT08iSwK/X7aSZ4lkuGxWudsogUFFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zo4z869V; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so4748320276.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Oct 2024 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728757622; x=1729362422; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kiugjck6LqeVNWQqRF21MBTJpxvtnHKEenzbxqveaEw=;
        b=zo4z869VRuwJyEUJtj5ppGcffAtMQ4DtDHSSA+3OFXgGFgQpuBlb5uclfEmxa58bB2
         zTapC7CexkIxa9QryB7p6kgv7t9L4awQyXUlG9jJZ5guhOXEoTU9EaemJAJFJ8uWAWS2
         is/+txpsiPQfa9gXC7FoWLbZC3S6iJHlZEdJFt20AXkgADJaEF1D1yu8SXukg3GgDxkg
         DokTxiduDpde0rLYFZtNdXCrjuq+5ha6MagZ8eO0PofSRLm5WZJ8WbwfENYASYWpOZAL
         vBtEBfyK2qiQZXGozZu0+EmwCe9Xd6AQEjRuTrYJnFGutFbwqi4XflAkRG4bY3CBRndO
         DGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728757622; x=1729362422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kiugjck6LqeVNWQqRF21MBTJpxvtnHKEenzbxqveaEw=;
        b=O/vLUU4J4aZ780p5whMYRc+Yd1kv47rBjFObe7NsPFhzILasLT8qfBzunBcLVmLbcA
         QqqWVrfKJ9zCUA2X9a3YnbwL14GSTwIEW+iw95EzE1OCIo19+QWJ5SgBZp4IBe6ZQoBe
         9NgRCZB8gwaA49Mfbe/MXoccOA3LFlR9bcpx48GUmDCuVGnUMfyccSMQD20TUgQ4fQLv
         Dys7EAkbRaTCMwGtseYbk8ijTpLC6m2yuwD/99dT4AfNqbT8JSeRKInrUqjpFnYcvRI3
         +0lwQ6Hm11wY2njP30HtXSlfiKNfBIfRakbu7wv0/DBpU6qgtTnXPvr5wjE02T3Xuq2+
         WKGA==
X-Forwarded-Encrypted: i=1; AJvYcCXgJ+/h6MK9fCDpWh17+GusdRw3+w3MMSXArVUmYOgcI+UwsU+cEfvgasSph1aMLuRg04Ow34anMiS8DvqbzwMmi0rr@vger.kernel.org
X-Gm-Message-State: AOJu0YwYsl94g558QxaIY4KmqHGsdJnyX0HH1RLjUt8mjPRvLX28p1cd
	q653yxbC0yvD7tQTYS32IFm1vUOFS87eG5oPc6bOCkzDNWjqWBjwvS8Z6PZIaRdy8b7KhqcncD8
	PW62y663MhBPefw==
X-Google-Smtp-Source: AGHT+IG7TWAKVNhAzeLYSAAvRTEQSOcM2plXA1wIkIy9bAcah9V5UxQ+c4eBsHMhKubtaEI6tU85oO3ma7qMufI=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a25:8049:0:b0:e28:ee55:c3d with SMTP id
 3f1490d57ef6-e2919dc14efmr22898276.1.1728757621841; Sat, 12 Oct 2024 11:27:01
 -0700 (PDT)
Date: Sat, 12 Oct 2024 18:26:55 +0000
In-Reply-To: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241012182656.2107178-1-mmaslanka@google.com>
Subject: [PATCH] Revert "platform/x86:intel/pmc: Enable the ACPI PM Timer to
 be turned off when suspended"
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This reverts commit e86c8186d03a6ba018e881ed45f0962ad553e861.

This can cause the suspend process to hang as the pmcdev->lock in the
pmc_core_acpi_pm_timer_suspend_resume might already be held by the
pmc_core_mphy_pg_show or pmc_core_pll_show if the userspace gets frozen
when these functions are being executed.
Also, pmc_core_acpi_pm_timer_suspend_resume must not sleep, as this
function is called indirectly by the tick_freeze function in
kernel/time/tick-common.c, which holds the spinlock.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
 drivers/platform/x86/intel/pmc/adl.c  |  2 --
 drivers/platform/x86/intel/pmc/cnp.c  |  2 --
 drivers/platform/x86/intel/pmc/core.c | 46 ---------------------------
 drivers/platform/x86/intel/pmc/core.h |  8 -----
 drivers/platform/x86/intel/pmc/icl.c  |  2 --
 drivers/platform/x86/intel/pmc/mtl.c  |  2 --
 drivers/platform/x86/intel/pmc/spt.c  |  2 --
 drivers/platform/x86/intel/pmc/tgl.c  |  2 --
 8 files changed, 66 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/adl.c b/drivers/platform/x86/intel/pmc/adl.c
index 9d9c07f44ff6..e7878558fd90 100644
--- a/drivers/platform/x86/intel/pmc/adl.c
+++ b/drivers/platform/x86/intel/pmc/adl.c
@@ -295,8 +295,6 @@ const struct pmc_reg_map adl_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
 	.lpm_num_modes = ADL_LPM_NUM_MODES,
 	.lpm_num_maps = ADL_LPM_NUM_MAPS,
diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
index 513c02670c5a..dd72974bf71e 100644
--- a/drivers/platform/x86/intel/pmc/cnp.c
+++ b/drivers/platform/x86/intel/pmc/cnp.c
@@ -200,8 +200,6 @@ const struct pmc_reg_map cnp_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
 	.etr3_offset = ETR3_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index ecb47f8b4f83..4e9c8c96c8cc 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -11,7 +11,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/acpi_pmtmr.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1258,39 +1257,6 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
 	return val == 1;
 }
 
-/*
- * Enable or disable ACPI PM Timer
- *
- * This function is intended to be a callback for ACPI PM suspend/resume event.
- * The ACPI PM Timer is enabled on resume only if it was enabled during suspend.
- */
-static void pmc_core_acpi_pm_timer_suspend_resume(void *data, bool suspend)
-{
-	struct pmc_dev *pmcdev = data;
-	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
-	const struct pmc_reg_map *map = pmc->map;
-	bool enabled;
-	u32 reg;
-
-	if (!map->acpi_pm_tmr_ctl_offset)
-		return;
-
-	guard(mutex)(&pmcdev->lock);
-
-	if (!suspend && !pmcdev->enable_acpi_pm_timer_on_resume)
-		return;
-
-	reg = pmc_core_reg_read(pmc, map->acpi_pm_tmr_ctl_offset);
-	enabled = !(reg & map->acpi_pm_tmr_disable_bit);
-	if (suspend)
-		reg |= map->acpi_pm_tmr_disable_bit;
-	else
-		reg &= ~map->acpi_pm_tmr_disable_bit;
-	pmc_core_reg_write(pmc, map->acpi_pm_tmr_ctl_offset, reg);
-
-	pmcdev->enable_acpi_pm_timer_on_resume = suspend && enabled;
-}
-
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
 	debugfs_remove_recursive(pmcdev->dbgfs_dir);
@@ -1486,7 +1452,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 	struct pmc_dev *pmcdev;
 	const struct x86_cpu_id *cpu_id;
 	int (*core_init)(struct pmc_dev *pmcdev);
-	const struct pmc_reg_map *map;
 	struct pmc *primary_pmc;
 	int ret;
 
@@ -1545,11 +1510,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
 			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
 
-	map = primary_pmc->map;
-	if (map->acpi_pm_tmr_ctl_offset)
-		acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
-							 pmcdev);
-
 	device_initialized = true;
 	dev_info(&pdev->dev, " initialized\n");
 
@@ -1559,12 +1519,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 static void pmc_core_remove(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
-	const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
-	const struct pmc_reg_map *map = pmc->map;
-
-	if (map->acpi_pm_tmr_ctl_offset)
-		acpi_pmtmr_unregister_suspend_resume_callback();
-
 	pmc_core_dbgfs_unregister(pmcdev);
 	pmc_core_clean_structure(pdev);
 }
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 75fd593a7b0f..b9d3291d0bf2 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -68,8 +68,6 @@ struct telem_endpoint;
 #define SPT_PMC_LTR_SCC				0x3A0
 #define SPT_PMC_LTR_ISH				0x3A4
 
-#define SPT_PMC_ACPI_PM_TMR_CTL_OFFSET		0x18FC
-
 /* Sunrise Point: PGD PFET Enable Ack Status Registers */
 enum ppfear_regs {
 	SPT_PMC_XRAM_PPFEAR0A = 0x590,
@@ -150,8 +148,6 @@ enum ppfear_regs {
 #define SPT_PMC_VRIC1_SLPS0LVEN			BIT(13)
 #define SPT_PMC_VRIC1_XTALSDQDIS		BIT(22)
 
-#define SPT_PMC_BIT_ACPI_PM_TMR_DISABLE		BIT(1)
-
 /* Cannonlake Power Management Controller register offsets */
 #define CNP_PMC_SLPS0_DBG_OFFSET		0x10B4
 #define CNP_PMC_PM_CFG_OFFSET			0x1818
@@ -355,8 +351,6 @@ struct pmc_reg_map {
 	const u8  *lpm_reg_index;
 	const u32 pson_residency_offset;
 	const u32 pson_residency_counter_step;
-	const u32 acpi_pm_tmr_ctl_offset;
-	const u32 acpi_pm_tmr_disable_bit;
 };
 
 /**
@@ -432,8 +426,6 @@ struct pmc_dev {
 	u32 die_c6_offset;
 	struct telem_endpoint *punit_ep;
 	struct pmc_info *regmap_list;
-
-	bool enable_acpi_pm_timer_on_resume;
 };
 
 enum pmc_index {
diff --git a/drivers/platform/x86/intel/pmc/icl.c b/drivers/platform/x86/intel/pmc/icl.c
index cbbd44054468..71b0fd6cb7d8 100644
--- a/drivers/platform/x86/intel/pmc/icl.c
+++ b/drivers/platform/x86/intel/pmc/icl.c
@@ -46,8 +46,6 @@ const struct pmc_reg_map icl_reg_map = {
 	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = ICL_NUM_IP_IGN_ALLOWED,
 	.etr3_offset = ETR3_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index 91f2fa728f5c..c7d15d864039 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -462,8 +462,6 @@ const struct pmc_reg_map mtl_socm_reg_map = {
 	.ppfear_buckets = MTL_SOCM_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.lpm_num_maps = ADL_LPM_NUM_MAPS,
 	.ltr_ignore_max = MTL_SOCM_NUM_IP_IGN_ALLOWED,
 	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
index 2cd2b3c68e46..ab993a69e33e 100644
--- a/drivers/platform/x86/intel/pmc/spt.c
+++ b/drivers/platform/x86/intel/pmc/spt.c
@@ -130,8 +130,6 @@ const struct pmc_reg_map spt_reg_map = {
 	.ppfear_buckets = SPT_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
 	.pm_vric1_offset = SPT_PMC_VRIC1_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
index 371b4e30f142..e0580de18077 100644
--- a/drivers/platform/x86/intel/pmc/tgl.c
+++ b/drivers/platform/x86/intel/pmc/tgl.c
@@ -197,8 +197,6 @@ const struct pmc_reg_map tgl_reg_map = {
 	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = TGL_NUM_IP_IGN_ALLOWED,
 	.lpm_num_maps = TGL_LPM_NUM_MAPS,
 	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
-- 
2.47.0.rc1.288.g06298d1525-goog



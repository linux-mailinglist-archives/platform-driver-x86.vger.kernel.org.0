Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FC832F376
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Mar 2021 20:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhCETHa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Mar 2021 14:07:30 -0500
Received: from mga11.intel.com ([192.55.52.93]:64834 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229783AbhCETHT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 14:07:19 -0500
IronPort-SDR: Pz0z9ZgirN1XQJk90gy7MyR79bxjwSJwXvUUUz9MJb/4kWTIEXpgwcvuFU7dvt5V/nPt6tNhqM
 jgJ2uIaWNtVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9914"; a="184338723"
X-IronPort-AV: E=Sophos;i="5.81,226,1610438400"; 
   d="scan'208";a="184338723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 11:07:16 -0800
IronPort-SDR: 6OrOR0E3cTy0QjhjPeFjufHi6tbE72inF3ZI1AHfVGI0mZRGq0n+HZA5CuXUNN4Qq7NzOYqLEE
 eVKqPNatsk2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,226,1610438400"; 
   d="scan'208";a="508166776"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2021 11:07:16 -0800
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id EC20B580717;
        Fri,  5 Mar 2021 11:07:15 -0800 (PST)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     irenic.rajneesh@gmail.com, hdegoede@redhat.com,
        mgross@linux.intel.com, sasha.neftin@intel.com
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
Subject: [PATCH] platform/x86: intel_pmc: Ignore GBE LTR on Tiger Lake platforms
Date:   Fri,  5 Mar 2021 11:06:08 -0800
Message-Id: <20210305190608.1834164-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Due to a HW limitation, the Latency Tolerance Reporting (LTR) value
programmed in the Tiger Lake GBE controller is not large enough to allow
the platform to enter Package C10, which in turn prevents the platform from
achieving its low power target during suspend-to-idle.  Ignore the GBE LTR
value on Tiger Lake. LTR ignore functionality is currently performed solely
by a debugfs write call. Split out the LTR code into its own function that
can be called by both the debugfs writer and by this work around.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Sasha Neftin <sasha.neftin@intel.com>
Cc: intel-wired-lan@lists.osuosl.org
---
 drivers/platform/x86/intel_pmc_core.c | 55 ++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index ee2f757515b0..ab31eb646a1a 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -863,34 +863,45 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
 
-static ssize_t pmc_core_ltr_ignore_write(struct file *file,
-					 const char __user *userbuf,
-					 size_t count, loff_t *ppos)
+static int pmc_core_write_ltr_ignore(u32 value)
 {
 	struct pmc_dev *pmcdev = &pmc;
 	const struct pmc_reg_map *map = pmcdev->map;
-	u32 val, buf_size, fd;
-	int err;
-
-	buf_size = count < 64 ? count : 64;
-
-	err = kstrtou32_from_user(userbuf, buf_size, 10, &val);
-	if (err)
-		return err;
+	u32 fd;
+	int err = 0;
 
 	mutex_lock(&pmcdev->lock);
 
-	if (val > map->ltr_ignore_max) {
+	if (fls(value) > map->ltr_ignore_max) {
 		err = -EINVAL;
 		goto out_unlock;
 	}
 
 	fd = pmc_core_reg_read(pmcdev, map->ltr_ignore_offset);
-	fd |= (1U << val);
+	fd |= value;
 	pmc_core_reg_write(pmcdev, map->ltr_ignore_offset, fd);
 
 out_unlock:
 	mutex_unlock(&pmcdev->lock);
+
+	return err;
+}
+
+static ssize_t pmc_core_ltr_ignore_write(struct file *file,
+					 const char __user *userbuf,
+					 size_t count, loff_t *ppos)
+{
+	u32 buf_size, val;
+	int err;
+
+	buf_size = count < 64 ? count : 64;
+
+	err = kstrtou32_from_user(userbuf, buf_size, 10, &val);
+	if (err)
+		return err;
+
+	err = pmc_core_write_ltr_ignore(1U << val);
+
 	return err == 0 ? count : err;
 }
 
@@ -1189,6 +1200,15 @@ static int quirk_xtal_ignore(const struct dmi_system_id *id)
 	return 0;
 }
 
+static int quirk_ltr_ignore(u32 val)
+{
+	int err;
+
+	err = pmc_core_write_ltr_ignore(val);
+
+	return err;
+}
+
 static const struct dmi_system_id pmc_core_dmi_table[]  = {
 	{
 	.callback = quirk_xtal_ignore,
@@ -1244,6 +1264,15 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
 	dmi_check_system(pmc_core_dmi_table);
 
+	/*
+	 * On TGL, due to a hardware limitation, the GBE LTR blocks PC10 when
+	 * a cable is attached. Tell the PMC to ignore it.
+	 */
+	if (pmcdev->map == &tgl_reg_map) {
+		dev_dbg(&pdev->dev, "ignoring GBE LTR\n");
+		quirk_ltr_ignore(1U << 3);
+	}
+
 	pmc_core_dbgfs_register(pmcdev);
 
 	device_initialized = true;
-- 
2.25.1


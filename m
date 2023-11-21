Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942977F2F8D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Nov 2023 14:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbjKUNwR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Nov 2023 08:52:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjKUNwQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2023 08:52:16 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EDD170D
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Nov 2023 05:52:11 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5RAX-0005x6-JC; Tue, 21 Nov 2023 14:52:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5RAU-00Ab0W-LG; Tue, 21 Nov 2023 14:51:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r5RAU-004xfL-C9; Tue, 21 Nov 2023 14:51:58 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-pwm@vger.kernel.org, kernel@pengutronix.de,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 067/108] pwm: lpss-*: Make use of devm_pwmchip_alloc() function
Date:   Tue, 21 Nov 2023 14:50:09 +0100
Message-ID: <20231121134901.208535-68-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5601; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rw4G9VAjItptE7SqCTm4nQJSVduJCsl5Ts+FfWagOGg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLWWJyUICP3JBonY276gZyrgqP4eUqpS9omc0 1pSAAn7O32JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1lgAKCRCPgPtYfRL+ TgiMCACMeusVXJvSAah25M8ZxAFAGnD93KI8PlfagYSJuJVcVl/F9QoGo1ceeV1DyqZvXpyf0rG NETqjlKGB8txb7wO+4ot6qt4Wk6FURxgQqAkFEfzbo14tjIOhLRiyzAvD3oVAuhCnn3QH5wZr7W vGgC36Vpb4bWOZqe2t+g9l19RSP8or8K/RsvAlsbES6vl1MtnWVbjrxgs0Y9x+mEgLY8JJUjztD aOvDYD0RKvdkaP1g5vU7UowQPSkkZ9CMdsdCy+ZzWZrz/MG3BjyFdCMpn3Xb2s61GCBrBvJBBWk BwhUFGFkhkGRV3X8oSpUw/VWtSY4hr/7JICnLK1TZGw/zkkN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This prepares the pwm-lpc drivers to further changes of the pwm core
outlined in the commit introducing devm_pwmchip_alloc(). There is no
intended semantical change and the driver should behave as before.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-lpss-pci.c                 | 10 +++++-----
 drivers/pwm/pwm-lpss-platform.c            | 10 +++++-----
 drivers/pwm/pwm-lpss.c                     | 20 ++++++++++----------
 drivers/pwm/pwm-lpss.h                     |  1 -
 include/linux/platform_data/x86/pwm-lpss.h |  4 ++--
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/pwm/pwm-lpss-pci.c b/drivers/pwm/pwm-lpss-pci.c
index b4134bee2863..abaeac0e3226 100644
--- a/drivers/pwm/pwm-lpss-pci.c
+++ b/drivers/pwm/pwm-lpss-pci.c
@@ -18,7 +18,7 @@ static int pwm_lpss_probe_pci(struct pci_dev *pdev,
 			      const struct pci_device_id *id)
 {
 	const struct pwm_lpss_boardinfo *info;
-	struct pwm_lpss_chip *lpwm;
+	struct pwm_chip *chip;
 	int err;
 
 	err = pcim_enable_device(pdev);
@@ -30,11 +30,11 @@ static int pwm_lpss_probe_pci(struct pci_dev *pdev,
 		return err;
 
 	info = (struct pwm_lpss_boardinfo *)id->driver_data;
-	lpwm = devm_pwm_lpss_probe(&pdev->dev, pcim_iomap_table(pdev)[0], info);
-	if (IS_ERR(lpwm))
-		return PTR_ERR(lpwm);
+	chip = devm_pwm_lpss_probe(&pdev->dev, pcim_iomap_table(pdev)[0], info);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
 
-	pci_set_drvdata(pdev, lpwm);
+	pci_set_drvdata(pdev, chip);
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_allow(&pdev->dev);
diff --git a/drivers/pwm/pwm-lpss-platform.c b/drivers/pwm/pwm-lpss-platform.c
index 319809aac2c4..90aeafa02a3b 100644
--- a/drivers/pwm/pwm-lpss-platform.c
+++ b/drivers/pwm/pwm-lpss-platform.c
@@ -20,7 +20,7 @@
 static int pwm_lpss_probe_platform(struct platform_device *pdev)
 {
 	const struct pwm_lpss_boardinfo *info;
-	struct pwm_lpss_chip *lpwm;
+	struct pwm_chip *chip;
 	void __iomem *base;
 
 	info = device_get_match_data(&pdev->dev);
@@ -31,11 +31,11 @@ static int pwm_lpss_probe_platform(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	lpwm = devm_pwm_lpss_probe(&pdev->dev, base, info);
-	if (IS_ERR(lpwm))
-		return PTR_ERR(lpwm);
+	chip = devm_pwm_lpss_probe(&pdev->dev, base, info);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
 
-	platform_set_drvdata(pdev, lpwm);
+	platform_set_drvdata(pdev, chip);
 
 	/*
 	 * On Cherry Trail devices the GFX0._PS0 AML checks if the controller
diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 394c768f5a5f..8daa31b5028a 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -68,7 +68,7 @@ EXPORT_SYMBOL_GPL(pwm_lpss_tng_info);
 
 static inline struct pwm_lpss_chip *to_lpwm(struct pwm_chip *chip)
 {
-	return container_of(chip, struct pwm_lpss_chip, chip);
+	return pwmchip_priv(chip);
 }
 
 static inline u32 pwm_lpss_read(const struct pwm_device *pwm)
@@ -245,9 +245,10 @@ static const struct pwm_ops pwm_lpss_ops = {
 	.get_state = pwm_lpss_get_state,
 };
 
-struct pwm_lpss_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base,
+struct pwm_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base,
 					  const struct pwm_lpss_boardinfo *info)
 {
+	struct pwm_chip *chip;
 	struct pwm_lpss_chip *lpwm;
 	unsigned long c;
 	int i, ret;
@@ -256,9 +257,10 @@ struct pwm_lpss_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base
 	if (WARN_ON(info->npwm > LPSS_MAX_PWMS))
 		return ERR_PTR(-ENODEV);
 
-	lpwm = devm_kzalloc(dev, sizeof(*lpwm), GFP_KERNEL);
-	if (!lpwm)
+	chip = devm_pwmchip_alloc(dev, info->npwm, sizeof(*lpwm));
+	if (!chip)
 		return ERR_PTR(-ENOMEM);
+	lpwm = to_lpwm(chip);
 
 	lpwm->regs = base;
 	lpwm->info = info;
@@ -267,23 +269,21 @@ struct pwm_lpss_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base
 	if (!c)
 		return ERR_PTR(-EINVAL);
 
-	lpwm->chip.dev = dev;
-	lpwm->chip.ops = &pwm_lpss_ops;
-	lpwm->chip.npwm = info->npwm;
+	chip->ops = &pwm_lpss_ops;
 
-	ret = devm_pwmchip_add(dev, &lpwm->chip);
+	ret = devm_pwmchip_add(dev, chip);
 	if (ret) {
 		dev_err(dev, "failed to add PWM chip: %d\n", ret);
 		return ERR_PTR(ret);
 	}
 
 	for (i = 0; i < lpwm->info->npwm; i++) {
-		ctrl = pwm_lpss_read(&lpwm->chip.pwms[i]);
+		ctrl = pwm_lpss_read(&chip->pwms[i]);
 		if (ctrl & PWM_ENABLE)
 			pm_runtime_get(dev);
 	}
 
-	return lpwm;
+	return chip;
 }
 EXPORT_SYMBOL_GPL(devm_pwm_lpss_probe);
 
diff --git a/drivers/pwm/pwm-lpss.h b/drivers/pwm/pwm-lpss.h
index bf841250385f..b5267ab5193b 100644
--- a/drivers/pwm/pwm-lpss.h
+++ b/drivers/pwm/pwm-lpss.h
@@ -18,7 +18,6 @@
 #define LPSS_MAX_PWMS			4
 
 struct pwm_lpss_chip {
-	struct pwm_chip chip;
 	void __iomem *regs;
 	const struct pwm_lpss_boardinfo *info;
 };
diff --git a/include/linux/platform_data/x86/pwm-lpss.h b/include/linux/platform_data/x86/pwm-lpss.h
index c852fe24fe2a..752c06b47cc8 100644
--- a/include/linux/platform_data/x86/pwm-lpss.h
+++ b/include/linux/platform_data/x86/pwm-lpss.h
@@ -27,7 +27,7 @@ struct pwm_lpss_boardinfo {
 	bool other_devices_aml_touches_pwm_regs;
 };
 
-struct pwm_lpss_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base,
-					  const struct pwm_lpss_boardinfo *info);
+struct pwm_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base,
+				     const struct pwm_lpss_boardinfo *info);
 
 #endif	/* __PLATFORM_DATA_X86_PWM_LPSS_H */
-- 
2.42.0


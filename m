Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74CA873D227
	for <lists+platform-driver-x86@lfdr.de>; Sun, 25 Jun 2023 18:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjFYQ2c (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 25 Jun 2023 12:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjFYQ23 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:29 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE9BD2
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-977e0fbd742so292513466b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710506; x=1690302506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhbTmWLYenjDvgCPdawCZ0z1wOdFokFdu4M42znMvBc=;
        b=fXbr+vKHwGyxL19CpBIWWE1z4qe6yNjPqhO894jstqRJwAaJit3oJEQBw72WaSe086
         sKnAxkQfwIjFDs56AcB3QEbJA/Tz2wAq207MUz3AhBpoxtL/ShkS5buWVYxEvgpCcLBj
         zohiRxGNtl6t5cB/sR3u+wNm9xgfkoqH8cwx+6aD+qwNkSQp5UMzaHp8nNR1/DlqwyES
         as0nzyTcnULNZ2vksaBwf8P26F29m9UCkfJ5iDHULHc2p/XqO/14j7n+HZS24Ia897Rv
         9i9eUFpppp61bD1uVX9YLfyo3IInvthxasCvyEIOP+1PB4Jh5Sk8WlUvWdLbneoyLfV+
         VRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710506; x=1690302506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhbTmWLYenjDvgCPdawCZ0z1wOdFokFdu4M42znMvBc=;
        b=ZnwQizdD73l/eCJ7QKb/Cz/ZofZcoaZ0tFPj6ucK3sGD1Xlh/S7cUuSWaOIs+TLsCU
         JwKwehlICzClfU4mPfkP+3k2T6uSBTXn5S05l9PeLDHe/QJ4/sxP/WM4wU1qK4Oenzyx
         VZgY81BZ2A8Y5/ZVEts/9guUQCV0Pu8QNOSlUVhGguBcwQ2lst1YkEUeMPf6+IoQz5hr
         xwmLpQGqU+KVmiZluXBn2Ner+eQhbF63W8BmBUq9nI8llbWwU2mz1QYTk3siVkEa+2xZ
         xVe7CWHKXs4J7w0ET+1KSQVMwpS2xCuKF2eLH+3ErKeW6GesuiAtv/udbtM8nhykzrDp
         Ka1w==
X-Gm-Message-State: AC+VfDzauZVdKefR9tpfQtDMLK72EBVMKKKWQMLmiCnPLLsy12ND08rE
        noQhoGdBVIrcw/O4/ql12rrM/w==
X-Google-Smtp-Source: ACHHUZ4bjKBuuorOmHyMBtXoO/Z8+TXopFzyA1F87d9ec+rsje8E5zXmZBxUz9H/zu3qMvVjfzGwig==
X-Received: by 2002:a17:906:4fc5:b0:96f:d556:b926 with SMTP id i5-20020a1709064fc500b0096fd556b926mr21570923ejw.77.1687710506301;
        Sun, 25 Jun 2023 09:28:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 02/24] Input: gpio-vibra - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:27:55 +0200
Message-Id: <20230625162817.100397-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes since v1:
1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
---
 drivers/input/misc/gpio-vibra.c | 20 ++++++--------------
 drivers/input/misc/pwm-beeper.c | 19 +++++--------------
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index 134a1309ba92..c1c3ba5960dd 100644
--- a/drivers/input/misc/gpio-vibra.c
+++ b/drivers/input/misc/gpio-vibra.c
@@ -113,22 +113,14 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
-	err = PTR_ERR_OR_ZERO(vibrator->vcc);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request regulator: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->vcc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->vcc),
+				     "Failed to request regulator\n");
 
 	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
-	err = PTR_ERR_OR_ZERO(vibrator->gpio);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->gpio),
+				     "Failed to request main gpio\n");
 
 	INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
 
diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
index 3cf1812384e6..1e731d8397c6 100644
--- a/drivers/input/misc/pwm-beeper.c
+++ b/drivers/input/misc/pwm-beeper.c
@@ -132,13 +132,8 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	beeper->pwm = devm_pwm_get(dev, NULL);
-	if (IS_ERR(beeper->pwm)) {
-		error = PTR_ERR(beeper->pwm);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request PWM device: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(beeper->pwm))
+		return dev_err_probe(dev, PTR_ERR(beeper->pwm), "Failed to request PWM device\n");
 
 	/* Sync up PWM state and ensure it is off. */
 	pwm_init_state(beeper->pwm, &state);
@@ -151,13 +146,9 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 	}
 
 	beeper->amplifier = devm_regulator_get(dev, "amp");
-	if (IS_ERR(beeper->amplifier)) {
-		error = PTR_ERR(beeper->amplifier);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'amp' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(beeper->amplifier))
+		return dev_err_probe(dev, PTR_ERR(beeper->amplifier),
+				     "Failed to get 'amp' regulator\n");
 
 	INIT_WORK(&beeper->work, pwm_beeper_work);
 
-- 
2.34.1


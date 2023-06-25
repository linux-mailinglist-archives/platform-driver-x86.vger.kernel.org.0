Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724F973D262
	for <lists+platform-driver-x86@lfdr.de>; Sun, 25 Jun 2023 18:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjFYQaK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 25 Jun 2023 12:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjFYQ3v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:51 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E593E7C
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:35 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-988b204ce5fso303417766b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710548; x=1690302548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K8dNHvtS/DTDX2OgSrfjzOHJKj+ivECHsaC8ySzJ1Y=;
        b=l9Etg7D/dnyPtCP+Q3k3y67exIgG/tfBKLuFrycYH02Qv701cS6TRyDae4EkZ7Ehp4
         s3JL0S0IQVFnlkudFGsDU/zg36s6UY4K8DsmDOUTU7aw9STCIGUwQ2wurXyEKHRDS9Ls
         TH5r+Nh/QRQYLdWYogviHJ4Xpu+F6ghcz78PIvjvirXBVgbphWXZzzaEa65wF17AFvTy
         D3vZg68IQ0G9vONRmSrD9FKviLo/oxuYjyWCt2vZ++QUKt6Q7jwywcQ74no9qr/4mgPw
         7MryAVtLEkybtQHhCAQBMFy1VRB/UNqAQn4Y4m/cSb2mDbAWVOrD7YIE1XDdQ9RhHPAv
         hzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710548; x=1690302548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8K8dNHvtS/DTDX2OgSrfjzOHJKj+ivECHsaC8ySzJ1Y=;
        b=BN/2kH0gGio54rv4bpJbOjtj6EPPN8YKLvyPF8Kgp5Xg+NvFgVeTeBJTX92aj/GHSC
         mR0HPpOezlvFQMIiZ0DVBWcVOrkbS6+1kNTXaeMJx9/qcjqg0GVlyKXGyLY+z0WsbtFR
         GRmuG4C9AlZw0I38JO/RS/ppPRClbNCKHzxJ8PcokPwT7Z8e4lgWbCc+dy8V97CHMVtc
         0qxy6UHWst8axEAkivbk/n7canDqF3i+XX6G2Onfj0e5daOLdPZygvviu+gkwU3sKRXV
         xLJzPQSFWjoIpPUxc4PsDtPF4caRQyW8Fow0gNXRYpkwMbZQRJFyjMP8iixoi3nxnyS7
         3toA==
X-Gm-Message-State: AC+VfDx0ytw8K+oYkrjf5cCdq1kHbNlg6HHbQjGt+iSwz57hXEfsoiQ1
        JIn6UXKkaFx6g6+KHoIh3oKyWg==
X-Google-Smtp-Source: ACHHUZ4ZX2PKzIKJUsSOjLZ8Sj1YBpQ0qeV6VsS+84FOWDLesNbth3MmN5biRwkKV+v9yS2V63SLyA==
X-Received: by 2002:a17:906:ee8b:b0:974:c32c:b485 with SMTP id wt11-20020a170906ee8b00b00974c32cb485mr22659980ejb.45.1687710548393;
        Sun, 25 Jun 2023 09:29:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:29:08 -0700 (PDT)
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
Subject: [PATCH v4 24/24] Input: bu21029_ts - Use local 'client->dev' variable in probe()
Date:   Sun, 25 Jun 2023 18:28:17 +0200
Message-Id: <20230625162817.100397-25-krzysztof.kozlowski@linaro.org>
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

'dev' is shorter and simpler than '&client->dev' and in few cases it
allows to skip line wrapping. Probe function uses '&client->dev' a lot,
so this improves readability slightly.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes since v2:
1. New patch
---
 drivers/input/touchscreen/bu21029_ts.c | 35 +++++++++++---------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 3d81ebe66b66..e1dfbd92ab64 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -333,6 +333,7 @@ static void bu21029_stop_chip(struct input_dev *dev)
 
 static int bu21029_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct bu21029_ts_data *bu21029;
 	struct input_dev *in_dev;
 	int error;
@@ -341,37 +342,33 @@ static int bu21029_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_WRITE_BYTE |
 				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA |
 				     I2C_FUNC_SMBUS_READ_I2C_BLOCK)) {
-		dev_err(&client->dev,
-			"i2c functionality support is not sufficient\n");
+		dev_err(dev, "i2c functionality support is not sufficient\n");
 		return -EIO;
 	}
 
-	bu21029 = devm_kzalloc(&client->dev, sizeof(*bu21029), GFP_KERNEL);
+	bu21029 = devm_kzalloc(dev, sizeof(*bu21029), GFP_KERNEL);
 	if (!bu21029)
 		return -ENOMEM;
 
-	error = device_property_read_u32(&client->dev, "rohm,x-plate-ohms",
-					 &bu21029->x_plate_ohms);
+	error = device_property_read_u32(dev, "rohm,x-plate-ohms", &bu21029->x_plate_ohms);
 	if (error) {
-		dev_err(&client->dev,
-			"invalid 'x-plate-ohms' supplied: %d\n", error);
+		dev_err(dev, "invalid 'x-plate-ohms' supplied: %d\n", error);
 		return error;
 	}
 
-	bu21029->vdd = devm_regulator_get(&client->dev, "vdd");
+	bu21029->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(bu21029->vdd))
-		return dev_err_probe(&client->dev, PTR_ERR(bu21029->vdd),
+		return dev_err_probe(dev, PTR_ERR(bu21029->vdd),
 				     "failed to acquire 'vdd' supply\n");
 
-	bu21029->reset_gpios = devm_gpiod_get_optional(&client->dev,
-						       "reset", GPIOD_OUT_HIGH);
+	bu21029->reset_gpios = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(bu21029->reset_gpios))
-		return dev_err_probe(&client->dev, PTR_ERR(bu21029->reset_gpios),
+		return dev_err_probe(dev, PTR_ERR(bu21029->reset_gpios),
 				     "failed to acquire 'reset' gpio\n");
 
-	in_dev = devm_input_allocate_device(&client->dev);
+	in_dev = devm_input_allocate_device(dev);
 	if (!in_dev) {
-		dev_err(&client->dev, "unable to allocate input device\n");
+		dev_err(dev, "unable to allocate input device\n");
 		return -ENOMEM;
 	}
 
@@ -392,20 +389,18 @@ static int bu21029_probe(struct i2c_client *client)
 
 	input_set_drvdata(in_dev, bu21029);
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, bu21029_touch_soft_irq,
+	error = devm_request_threaded_irq(dev, client->irq, NULL,
+					  bu21029_touch_soft_irq,
 					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  DRIVER_NAME, bu21029);
 	if (error) {
-		dev_err(&client->dev,
-			"unable to request touch irq: %d\n", error);
+		dev_err(dev, "unable to request touch irq: %d\n", error);
 		return error;
 	}
 
 	error = input_register_device(in_dev);
 	if (error) {
-		dev_err(&client->dev,
-			"unable to register input device: %d\n", error);
+		dev_err(dev, "unable to register input device: %d\n", error);
 		return error;
 	}
 
-- 
2.34.1


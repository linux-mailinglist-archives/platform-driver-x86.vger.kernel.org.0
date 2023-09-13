Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A29D79E73E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Sep 2023 13:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240608AbjIMLuc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Sep 2023 07:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240564AbjIMLu2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 07:50:28 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5E61996
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 04:50:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31c8321c48fso540399f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 04:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605822; x=1695210622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSDvgG/AlTocCbtsh72PpLY+FqxqCYIc4jmjYno6s+Q=;
        b=LPBaRxGKMqxZeVdBmAh6uE6kJYetpBgLfZaeQ5ZTeaAnb7dbPzxZMLpW6rKB8MTGET
         fn6QXEMiRSoXe7fZZnCMqoZSk5OnPd/EPLDMZ3I8m2J8cEyAUQ2tqqUzd6IhD75fhBT/
         bnXfXL/3vO8x+ScWtCkhQK6+LRdN2uBXZo5RjcHixqOpCkFrZnEQ//PQRxwV0E6O83f4
         9TR2TPo6vXwxRf03TkU8G/o/UA9C0QhBRuLvTsAD2fn5LEE/r9GB5PmOdp1tpSEkLaSD
         71XMTllaBzKCrPwd7R0MhZTp7q8MG+5DjV/urg4o+eTVw8bqGmzliKPLWt6/rPmNG025
         DFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605822; x=1695210622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSDvgG/AlTocCbtsh72PpLY+FqxqCYIc4jmjYno6s+Q=;
        b=NSgSLND/sngTgQW35hwCvX4ozWnA4ogZ1i8G3Zd0pCDmGaUe9RyViGEtPWYqwISh3R
         ppy72FTVlJaqPSinimc9yheKMtCt5OcLSZBm5byMrFEALTrNTEEJgc7fP5MHvj4SD1Sp
         NYZ9VXg3EgabxOq//JarRyFzeHCheRXvkVIknTH2tdRC6dBB1z/qev3AricPPMIsWwTG
         YgKryYjXKMDsIHh7lknzkfN5cFdI0+yTmCQ9V+yEv0eaA5b9s/POGM3sxq2gI4k5+RUj
         iK1Nbr7D13dJtnWVFaMV54qr1LadXpF1cEeQrnnMMpCijF7Ap65XvnluKf9Oq/jFjCYQ
         GokQ==
X-Gm-Message-State: AOJu0YxjDkYc85qDIYm8TiCwC6cHZE44l8OLpRbIGVJJNoXK1hKUcnSP
        MkgCowwvIk7WJpprxF5CXyG4tw==
X-Google-Smtp-Source: AGHT+IESxmTjjKwZ3Mmhzu2vYwbPTXYIyEeB82mrbgAnbchaF/ankGu50kRqPiQDLeOH4+3ZF+l1XA==
X-Received: by 2002:adf:e885:0:b0:31f:9bd6:e8c3 with SMTP id d5-20020adfe885000000b0031f9bd6e8c3mr1744751wrm.22.1694605822422;
        Wed, 13 Sep 2023 04:50:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 4/5] platform/x86: int3472/discrete: use gpiod_set_active_low()
Date:   Wed, 13 Sep 2023 13:50:00 +0200
Message-Id: <20230913115001.23183-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913115001.23183-1-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the new polarity setter instead of the more cumbersome toggle
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 2 +-
 drivers/platform/x86/intel/int3472/led.c               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index ef4b3141efcd..31e520838b95 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -183,7 +183,7 @@ int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
 	}
 
 	if (polarity == GPIO_ACTIVE_LOW)
-		gpiod_toggle_active_low(int3472->clock.ena_gpio);
+		gpiod_set_active_low(int3472->clock.ena_gpio);
 
 	/* Ensure the pin is in output mode and non-active state */
 	gpiod_direction_output(int3472->clock.ena_gpio, 0);
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index bca1ce7d0d0c..46c9c569df5e 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -32,7 +32,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
 				     "getting privacy LED GPIO\n");
 
 	if (polarity == GPIO_ACTIVE_LOW)
-		gpiod_toggle_active_low(int3472->pled.gpio);
+		gpiod_set_active_low(int3472->pled.gpio);
 
 	/* Ensure the pin is in output mode and non-active state */
 	gpiod_direction_output(int3472->pled.gpio, 0);
-- 
2.39.2


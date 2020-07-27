Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBEAF22E747
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 10:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgG0IJK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 04:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgG0IJJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 04:09:09 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C0FC0619D4
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 01:09:08 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q7so16210417ljm.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YzUre4UlhllBnMYMuHGYr0fbQ1bZ62knpXVbnl3s+i0=;
        b=IHi4EBbyduwZdIt/EBVTI9u4WV4Cjg9IhYY/gFJTuqw6tcRC2b+Fse7U9Jftg8VdOm
         ailAns9yDOq0+waiCazy84BYObYkQNo31N0BgvDJhuoo3I4FbxFTba51sqjWXTKIwH7p
         CyjOLgO3Ec5iIWiJ4/uWayyHqbOly3g62Ih7kpoY+Vv18FnkEpWCTN9QBZWtQBGsOwjN
         JPGhtUhQnZ4+fTOiEQYB6V+iivcYUZEt3OIDmA0uTEx5I9iYsM7GUNojXEJwEutlbQcD
         lpO5ptZ8s7QpuuYIJyECAfBqPX66c5xj5+BR+fd9YSLBJ8Kev3obzD8jdgAjDwmdIfZ6
         PZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YzUre4UlhllBnMYMuHGYr0fbQ1bZ62knpXVbnl3s+i0=;
        b=j/02rG+tnB2QzuealdT4a/WIjiVqR49Uzmv6hnmTNq4+NRI47RRrP0s1l6eUQncZ1X
         fXIbtfrRspylDy4IayNEwOf0iH2PNqASJIIyRjs5X5zD5WT+p0/L9EqltZFvY65acUZm
         YAUrb80ERUHNfA/Uc3XkCxHtR9hDc8+i3yb+4OZpQd/VITGwsfdTTyXxun2stEBZOLoI
         iJiFIZfkYde6F8+eYXQKZoJqZr0Bjnr96i2i1YQVtBQbPrR8xCl9tWwWi5WqqK9hGWnh
         qG2CZd131IKrWu8PwMR8T8gsnzc4PaUFEbHGxqB031Y91bqhHC3W80Cecx6t1AbRBC8T
         UjKg==
X-Gm-Message-State: AOAM530lWLeKI8PFgwfP77FviB0GgtW/weXmnyaze1KtC0hDpnJSEfpY
        NjR7eopD1d4tVLnjZnWX5S1d8Dg3vAKYcg==
X-Google-Smtp-Source: ABdhPJwgAMcfQH32dQrSegCqNOU7EIeGiH91ghYypGpUT5OrMOqXuntfslE01amqHB0AY9d9AnsjoA==
X-Received: by 2002:a2e:b4ce:: with SMTP id r14mr9932730ljm.88.1595837346690;
        Mon, 27 Jul 2020 01:09:06 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id u25sm2194199ljo.140.2020.07.27.01.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:09:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org
Subject: [PATCH] x86/platform/geos: Convert LED to GPIO machine descriptor
Date:   Mon, 27 Jul 2020 10:07:03 +0200
Message-Id: <20200727080703.296254-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This makes the machine look up the LED from a GPIO machine
descriptor table. The Geode LEDs should be on the CS5535
companion chip.

Cc: linux-gpio@vger.kernel.org
Cc: linux-geode@lists.infradead.org
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/x86/platform/geode/geos.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/geode/geos.c b/arch/x86/platform/geode/geos.c
index 73a3f49b4eb6..fe66c0405af1 100644
--- a/arch/x86/platform/geode/geos.c
+++ b/arch/x86/platform/geode/geos.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
 #include <linux/dmi.h>
 
 #include <asm/geode.h>
@@ -53,21 +54,15 @@ static struct platform_device geos_buttons_dev = {
 static struct gpio_led geos_leds[] = {
 	{
 		.name = "geos:1",
-		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 1,
 	},
 	{
 		.name = "geos:2",
-		.gpio = 25,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 	{
 		.name = "geos:3",
-		.gpio = 27,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 };
 
@@ -76,6 +71,17 @@ static struct gpio_led_platform_data geos_leds_data = {
 	.leds = geos_leds,
 };
 
+static struct gpiod_lookup_table geos_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* The Geode GPIOs should be on the CS5535 companion chip */
+		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("cs5535-gpio", 25, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("cs5535-gpio", 27, NULL, 2, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device geos_leds_dev = {
 	.name = "leds-gpio",
 	.id = -1,
@@ -90,6 +96,7 @@ static struct platform_device *geos_devs[] __initdata = {
 static void __init register_geos(void)
 {
 	/* Setup LED control through leds-gpio driver */
+	gpiod_add_lookup_table(&geos_leds_gpio_table);
 	platform_add_devices(geos_devs, ARRAY_SIZE(geos_devs));
 }
 
-- 
2.26.2


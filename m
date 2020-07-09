Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D1321A7D5
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgGITch (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:32:37 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46742 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgGITch (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:32:37 -0400
Received: by mail-qk1-f194.google.com with SMTP id r22so2946364qke.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FhgEXOn2wcN8vWvTrPLpDlhU+HmUjqJEhjrrgeTRI7c=;
        b=lOYUSPHnuh8uQSYe65vghowB3biaQHfD6ifj81Z3a07STYS4aUlaOsauL7Ufgtm0Ty
         +L665brPgSK4Zb8Y2OQlFZVkPSCbu/Xn9H2Nv0dlSz6kJu7Z3IFuZZmmchhXYD4l0vY5
         atB0kNqlZKTxgnrCw0iInm6t71+evLfBxyMqI0qZylNYKei9i27Bz+xn2FsEQHAehYco
         w970K4Dn8ZYaSv1WW38PSqqQ01bTi8eNxCDwAYnMUs4RSad6eGc8yLNHY9NQQlTOiDE+
         NmKdP6Nd05QO/UXm8A+KaXUpp+4454JvhLPMmaE2V2c8GDZawjAb7lU1wbfFjLqXyQs0
         Os5A==
X-Gm-Message-State: AOAM531z7YK+0X8xst2gbN+QQAixuGF5XPVHIuTioUYpN/1q0ceFFzI7
        YD9zVPvUyHdfnOMu2h7dJZbYqQ==
X-Google-Smtp-Source: ABdhPJyWXsWUdijc1TmEEpj2cgPEYJ0K/Rm8M81fe1wr74YffM7dkdOCNK1eWXcIuYTVFgX3BiOyjQ==
X-Received: by 2002:a05:620a:11b3:: with SMTP id c19mr64071786qkk.203.1594323156315;
        Thu, 09 Jul 2020 12:32:36 -0700 (PDT)
Received: from penyfal.localdomain (pool-173-73-155-164.washdc.fios.verizon.net. [173.73.155.164])
        by smtp.gmail.com with ESMTPSA id p66sm4656602qkf.58.2020.07.09.12.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:32:35 -0700 (PDT)
Date:   Thu, 9 Jul 2020 15:32:32 -0400
From:   Nick Shipp <git@segbrk.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jeremy Soller <jeremy@system76.com>, productdev@system76.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2] system76-acpi: Fix brightness_set schedule while atomic
Message-ID: <20200709192925.GA27478@penyfal.localdomain>
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
 <CADjEuPtkKjBqCXxVUHX9f19cAkW10uss2QyYn5P-b=XNeg6gRg@mail.gmail.com>
 <CAHp75VeubG03p=A8aEERjsnF1idVc40gmGAwgB=8rp9ZOHPZGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeubG03p=A8aEERjsnF1idVc40gmGAwgB=8rp9ZOHPZGw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


`system76_set' was set as an LED `brightness_set' callback, but it calls
`acpi_evaluate_object' which is not atomic-safe. Switched to the
`brightness_set_blocking' LED callback instead.

Signed-off-by: Nick Shipp <git@segbrk.com>
---
Changes in v2:
- Fixed patch formatting (whitespace)
---
 drivers/platform/x86/system76_acpi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 4f6e4c342382..c14fd22ba196 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -103,12 +103,12 @@ static enum led_brightness ap_led_get(struct led_classdev *led)
 }
 
 // Set the airplane mode LED brightness
-static void ap_led_set(struct led_classdev *led, enum led_brightness value)
+static int ap_led_set(struct led_classdev *led, enum led_brightness value)
 {
 	struct system76_data *data;
 
 	data = container_of(led, struct system76_data, ap_led);
-	system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
+	return system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
 }
 
 // Get the last set keyboard LED brightness
@@ -121,13 +121,13 @@ static enum led_brightness kb_led_get(struct led_classdev *led)
 }
 
 // Set the keyboard LED brightness
-static void kb_led_set(struct led_classdev *led, enum led_brightness value)
+static int kb_led_set(struct led_classdev *led, enum led_brightness value)
 {
 	struct system76_data *data;
 
 	data = container_of(led, struct system76_data, kb_led);
 	data->kb_brightness = value;
-	system76_set(data, "SKBL", (int)data->kb_brightness);
+	return system76_set(data, "SKBL", (int)data->kb_brightness);
 }
 
 // Get the last set keyboard LED color
@@ -313,7 +313,7 @@ static int system76_add(struct acpi_device *acpi_dev)
 	data->ap_led.name = "system76_acpi::airplane";
 	data->ap_led.flags = LED_CORE_SUSPENDRESUME;
 	data->ap_led.brightness_get = ap_led_get;
-	data->ap_led.brightness_set = ap_led_set;
+	data->ap_led.brightness_set_blocking = ap_led_set;
 	data->ap_led.max_brightness = 1;
 	data->ap_led.default_trigger = "rfkill-none";
 	err = devm_led_classdev_register(&acpi_dev->dev, &data->ap_led);
@@ -323,7 +323,7 @@ static int system76_add(struct acpi_device *acpi_dev)
 	data->kb_led.name = "system76_acpi::kbd_backlight";
 	data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
 	data->kb_led.brightness_get = kb_led_get;
-	data->kb_led.brightness_set = kb_led_set;
+	data->kb_led.brightness_set_blocking = kb_led_set;
 	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
 		data->kb_led.max_brightness = 255;
 		data->kb_toggle_brightness = 72;
-- 
2.27.0


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3374E205505
	for <lists+platform-driver-x86@lfdr.de>; Tue, 23 Jun 2020 16:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732821AbgFWOlo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 23 Jun 2020 10:41:44 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46337 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732738AbgFWOlo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jun 2020 10:41:44 -0400
Received: by mail-qk1-f196.google.com with SMTP id r22so17482710qke.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2020 07:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oxwMlukpml8/6TD/NHdVG9LiB8RZG6IS34cYsElW7qI=;
        b=UVjiqvBiFHI7noXZbV1lAbVBSnH6kJDcMaDHxBo+bQNVeUQbdme2eqiWBVIC4wpfTX
         ltQox5kYo4SYVadUL+QE9yxOhMakngsHdGP+VAkhOWXLP4CQTolssewoWQSZ7K/o5E++
         VWHmk8TU2Tdfhrhf7Uwvg53nxmD3j7PdPINwLGB2twpEIcGGxn/XTyg6L+loIUlTt/u9
         arPSKSTv0Jl1gIf7gtuSFFHNDzd0aB6A2INSMTZK3FZGX0M2Wh7dpv/6RRFnBPF1WbcW
         I1P336mLTisCQn4G2oLudI6f5dZOcojr0KTcC1eidt+GNnAa1shOvX5i7nEAWTif4EKC
         bFVA==
X-Gm-Message-State: AOAM530g3ydmbS/Aovswcw87ps/yO/SaNw91IgHDCY/RD19L6wMXIQ1b
        EO2VVBBl99iADSlDNNJusYvlBRu6psx2k2H6N/nskVjwWDE=
X-Google-Smtp-Source: ABdhPJzI5A7eIbxTYeRTQNTewCnDOabtabKE8Sugnwa0d9mh8YJmXKwA/617bzaKZzB8CFNSr2diwC5Sf0LKUYbjVj8=
X-Received: by 2002:a37:9b01:: with SMTP id d1mr20516177qke.65.1592923303299;
 Tue, 23 Jun 2020 07:41:43 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Shipp <git@segbrk.com>
Date:   Tue, 23 Jun 2020 10:42:04 -0400
Message-ID: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
Subject: [RESEND PATCH] system76-acpi: Fix brightness_set schedule while atomic
To:     jeremy@system76.com, productdev@system76.com,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

And here's a fix for my email client and bad copy-paste, sorry about that noise.

`system76_set' was set as an LED `brightness_set' callback, but it calls
`acpi_evaluate_object' which is not atomic-safe. Switched to the
`brightness_set_blocking' LED callback instead.

Signed-off-by: Nick Shipp <git@segbrk.com>
---
 drivers/platform/x86/system76_acpi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c
b/drivers/platform/x86/system76_acpi.c
index 4f6e4c342382..c14fd22ba196 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -103,12 +103,12 @@ static enum led_brightness ap_led_get(struct
led_classdev *led)
 }

 // Set the airplane mode LED brightness
-static void ap_led_set(struct led_classdev *led, enum led_brightness value)
+static int ap_led_set(struct led_classdev *led, enum led_brightness value)
 {
        struct system76_data *data;

        data = container_of(led, struct system76_data, ap_led);
- system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
+ return system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
 }

 // Get the last set keyboard LED brightness
@@ -121,13 +121,13 @@ static enum led_brightness kb_led_get(struct
led_classdev *led)
 }

 // Set the keyboard LED brightness
-static void kb_led_set(struct led_classdev *led, enum led_brightness value)
+static int kb_led_set(struct led_classdev *led, enum led_brightness value)
 {
        struct system76_data *data;

        data = container_of(led, struct system76_data, kb_led);
        data->kb_brightness = value;
- system76_set(data, "SKBL", (int)data->kb_brightness);
+ return system76_set(data, "SKBL", (int)data->kb_brightness);
 }

 // Get the last set keyboard LED color
@@ -313,7 +313,7 @@ static int system76_add(struct acpi_device *acpi_dev)
        data->ap_led.name = "system76_acpi::airplane";
        data->ap_led.flags = LED_CORE_SUSPENDRESUME;
        data->ap_led.brightness_get = ap_led_get;
- data->ap_led.brightness_set = ap_led_set;
+ data->ap_led.brightness_set_blocking = ap_led_set;
        data->ap_led.max_brightness = 1;
        data->ap_led.default_trigger = "rfkill-none";
        err = devm_led_classdev_register(&acpi_dev->dev, &data->ap_led);
@@ -323,7 +323,7 @@ static int system76_add(struct acpi_device *acpi_dev)
        data->kb_led.name = "system76_acpi::kbd_backlight";
        data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
        data->kb_led.brightness_get = kb_led_get;
- data->kb_led.brightness_set = kb_led_set;
+ data->kb_led.brightness_set_blocking = kb_led_set;
        if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
                data->kb_led.max_brightness = 255;
                data->kb_toggle_brightness = 72;
--
2.27.0

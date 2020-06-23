Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F718205489
	for <lists+platform-driver-x86@lfdr.de>; Tue, 23 Jun 2020 16:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732734AbgFWO0r (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 23 Jun 2020 10:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732730AbgFWO0r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jun 2020 10:26:47 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF1FC061573
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2020 07:26:47 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id e2so9720181qvw.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2020 07:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=segbrk-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=yWBsSwq7Thf+YiLMtnBFU8MpcNLM8hmGCuQeI3vuOeY=;
        b=QIXqmhopdo7DAdvBdwMhQEtBrVJMZUkOAeUKLaV53mXjuPgr+kk8rxzgBg3cbAvxiu
         B0feV/MFnoSTENq8Y8LLS7PTx6/cQjL7ztubLXYI3ZlmLHtwpCRN9ivJ6/zKkZ3yv7JI
         W0tWs5fYtQrc7KMjyn5SHOw4lhLV/0ELVQb3pXBiqJY1Ry067wdHO1w8rg1WKpHqSmZy
         NKhVjZx+Od5s+ozqL26SYDlaWJSf7uA0gUDNyYRx9wJTR9PznlwpAEDakoJWNDDJyVzD
         B7XcXh1oFtWmWP5JIppJhwxv9Q41OUWYmintXXo4VGD7JJuNszT9HDUi/Ua9faPQV5Zw
         UUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=yWBsSwq7Thf+YiLMtnBFU8MpcNLM8hmGCuQeI3vuOeY=;
        b=ShxmWSNKslmvjrwIxlmSQeRPLxOHed43nteIf2bAT9nQDvucIM8H8zMyMY3Z+8Zxkn
         EhJcNItoknHIIkGeDkF5ya+fzT5NKhYBxFThpwbGs1wl20Duuc0RDO4oSErDbW62f5jm
         8xI2mKUJaTUbnBoQFI//9oJkUT9BfyQpCgVlN5rXdN0ECiiBphEbmJ20T2agCQKhf9vZ
         G2Xq8eafTjv5wEFvHV249LnbpYDCnFJGgUAtET6X9Vf7+9nICF7QaMBOVoYz9ZtXASgE
         Q0WP7chFZ0zB4+asQygp0q85jQnrmkH2h9QU3v3Mx+NVb8D5vByw5XoX6NaxQKrXNt0L
         fW8A==
X-Gm-Message-State: AOAM531u0ACJTT7GvOd5ksEwzFK/J7yh5RDrHQwyEwpaH68p0qbPveIj
        ruGYEQHEBdI8W/yr/b1i59APBJPWbYGWHM83Jf9MBw==
X-Google-Smtp-Source: ABdhPJwtjiNzeaxkwuF3SVd4vdYKy9golVYoEMeKZvfVcF5Lg1h+w6RIMFg4nqg6RH4iSL0em5Jy8zdwa3BpXNVaxCc=
X-Received: by 2002:a05:6214:a6c:: with SMTP id ef12mr7375899qvb.74.1592922406232;
 Tue, 23 Jun 2020 07:26:46 -0700 (PDT)
MIME-Version: 1.0
From:   SEGBRK SEGBRK <net@segbrk.com>
Date:   Tue, 23 Jun 2020 10:27:07 -0400
Message-ID: <CADjEuPsd8iiHMg3C6BmFKFr+3pWjWdARYQiCaKZeY-N9kmHRoA@mail.gmail.com>
Subject: [PATCH] system76-acpi: Fix brightness_set schedule while atomic
To:     jeremy@system76.com, productdev@system76.com,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Here's a fix for the issue in my previous email:

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
-
 // Set the airplane mode LED brightness
-static void ap_led_set(struct led_classdev *led, enum led_brightness value)
+static int ap_led_set(struct led_classdev *led, enum led_brightness value)
 {
 >------struct system76_data *data;
-
 >------data = container_of(led, struct system76_data, ap_led);
->------system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
+>------return system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
 }
-
 // Get the last set keyboard LED brightness
@@ -121,13 +121,13 @@ static enum led_brightness kb_led_get(struct
led_classdev *led)
 }
-
 // Set the keyboard LED brightness
-static void kb_led_set(struct led_classdev *led, enum led_brightness value)
+static int kb_led_set(struct led_classdev *led, enum led_brightness value)
 {
 >------struct system76_data *data;
-
 >------data = container_of(led, struct system76_data, kb_led);
 >------data->kb_brightness = value;
->------system76_set(data, "SKBL", (int)data->kb_brightness);
+>------return system76_set(data, "SKBL", (int)data->kb_brightness);
 }
-
 // Get the last set keyboard LED color
@@ -313,7 +313,7 @@ static int system76_add(struct acpi_device *acpi_dev)
 >------data->ap_led.name = "system76_acpi::airplane";
 >------data->ap_led.flags = LED_CORE_SUSPENDRESUME;
 >------data->ap_led.brightness_get = ap_led_get;
->------data->ap_led.brightness_set = ap_led_set;
+>------data->ap_led.brightness_set_blocking = ap_led_set;
 >------data->ap_led.max_brightness = 1;
 >------data->ap_led.default_trigger = "rfkill-none";
 >------err = devm_led_classdev_register(&acpi_dev->dev, &data->ap_led);
@@ -323,7 +323,7 @@ static int system76_add(struct acpi_device *acpi_dev)
 >------data->kb_led.name = "system76_acpi::kbd_backlight";
 >------data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
 >------data->kb_led.brightness_get = kb_led_get;
->------data->kb_led.brightness_set = kb_led_set;
+>------data->kb_led.brightness_set_blocking = kb_led_set;
 >------if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
 >------>-------data->kb_led.max_brightness = 255;
 >------>-------data->kb_toggle_brightness = 72;
---
2.27.0

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B04910DD31
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfK3Ixo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:44 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:47096 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfK3Ixo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:44 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so34332284wrl.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to;
        bh=gM5rZC97wtFsRQbYwLcHSzjWj45NCVxNRlfyYYbZ2HQ=;
        b=ARysbt7SyPEosoK+H3ZHhOF2I3r/q8m32JTt1x1+DmoUnyqTtHbq4fUgChNdUbFy5g
         fmreS82VyYZ1G6kkiHrr+9b0HCqnmcfB/t8IXgtgu4D8dvwcJgzWVOBq2whRebjprTPj
         iTpGzwxK0AN5W2m49YRDbWBoxFlGoJv0/Rh5qnTTKFzIsbQNhyg7CGBfwhyXBYQkmcVj
         LptqCwAF6KI44f+jRYNOF2QC094qzdCIDYd7zTXSPvpZKfYexK2rH3JhKjbdTSZuVqlx
         QrhGN5UuKaFafTDtwv8BJ+q/iRpqtTCCI0VTb9CIjApU45moLfRC8cll/jjQDOvXl9GW
         JqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to;
        bh=gM5rZC97wtFsRQbYwLcHSzjWj45NCVxNRlfyYYbZ2HQ=;
        b=VRoHDJRvDgTiHnUWt8qA1JkOf9Vm6X+WCyXCfsG6DrjUjfcdlzxHK3A2CJmMtVW4/k
         gtmtJ3O1c/KhE6mlry3EGg7fZaGE+bdDuRgGUgDQWDqU/5IEWe4SFzjOt/EHgSJynljG
         ka4Kgs2tPyNkyLfqXhKaAHB/tLpMbDkKrJ10iHbXK97LZ7fKKgIOayPX6hWIAvxDTxQb
         zviiUcn6wRv1r4aRSO1D9SYWpAqKLbDJbmhzw1ScVnRQwes2Gtaosj5/gVhxuxdDkzY4
         yAF19q7Ek6aAYfWul0cxd8fbylP1iwYhWEHuVM4rWppNVm9U+ITcEqq/c+3TtO5ZjpGr
         gsqg==
X-Gm-Message-State: APjAAAVGaBE5zkNPraE7Jjbz66TLBaTrHEQGmMz7KCwAXndZKYmegpaO
        wFIHI7ttDScoG1i1Wb9haHQIkuZbaA==
X-Google-Smtp-Source: APXvYqw4H7k33EqnwwPSIyULVmPwFx+LmvPynDgQsGhaAm1JN5lFAtmr0kMMVw5E7URIomT3J9BMxg==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr6607537wrw.193.1575104021879;
        Sat, 30 Nov 2019 00:53:41 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id a2sm31636588wrt.79.2019.11.30.00.53.40
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:41 -0800 (PST)
Message-Id: <f13d1bfa52cc76a134c7616b1416aab426f8b99c.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
References: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:48:53 +0200
Subject: [PATCH V2 6/7] platform/x86: lg-laptop.c: Expose reader mode as a
 LED, rather than a sysfs file for 2018 and newer models
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2018 and newer models, setting reader mode does not change display
Gamma, so treat reader mode as a LED, instead of a switch.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index ccdc93be2a9b..fd802e9f6556 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -73,6 +73,7 @@ static u32 inited;
 #define INIT_INPUT_ACPI         0x04
 #define INIT_TPAD_LED           0x08
 #define INIT_KBD_LED            0x10
+#define INIT_RDMODE_LED         0x20
 #define INIT_SPARSE_KEYMAP      0x80
 
 static int battery_limit_use_wmbb;
@@ -529,9 +530,9 @@ static DEVICE_ATTR_RW(battery_care_limit);
 static struct attribute *dev_attributes[] = {
 	&dev_attr_fan_mode.attr,
 	&dev_attr_usb_charge.attr,
-	&dev_attr_reader_mode.attr,
 	&dev_attr_fn_lock.attr,
 	&dev_attr_battery_care_limit.attr,
+	&dev_attr_reader_mode.attr, // This is last, to be easily removed
 	NULL
 };
 
@@ -555,6 +556,22 @@ static enum led_brightness tpad_led_get(struct led_classdev *cdev)
 
 static LED_DEVICE(tpad_led, 1);
 
+static void reader_mode_led_set(struct led_classdev *cdev,
+				enum led_brightness brightness)
+{
+	reader_mode_store(NULL, NULL, brightness == LED_OFF ? "0" : "1", 1);
+}
+
+static enum led_brightness reader_mode_led_get(struct led_classdev *cdev)
+{
+	char buf[BUFFER_SIZE];
+
+	reader_mode_show(NULL, NULL, buf);
+	return buf[0] != '0';
+}
+
+static LED_DEVICE(reader_mode_led, 1);
+
 static void kbd_backlight_set(struct led_classdev *cdev,
 			      enum led_brightness brightness)
 {
@@ -670,6 +687,9 @@ static int acpi_add(struct acpi_device *device)
 	if (year >= 2019)
 		battery_limit_use_wmbb = 1;
 
+	if (year >= 2018)
+		dev_attributes[4] = NULL; // Remove reader mode special file.
+
 	ret = sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group);
 	if (ret)
 		goto out_platform_device;
@@ -680,6 +700,11 @@ static int acpi_add(struct acpi_device *device)
 	if (!led_classdev_register(&pf_device->dev, &tpad_led))
 		inited |= INIT_TPAD_LED;
 
+	// For 2018 and 2019 models, reader mode only controls the LED
+	if (year >= 2018)
+		if (!led_classdev_register(&pf_device->dev, &reader_mode_led))
+			inited |= INIT_RDMODE_LED;
+
 	wmi_input_setup();
 
 	return 0;
@@ -700,6 +725,9 @@ static int acpi_remove(struct acpi_device *device)
 	if (inited & INIT_TPAD_LED)
 		led_classdev_unregister(&tpad_led);
 
+	if (inited & INIT_RDMODE_LED)
+		led_classdev_unregister(&reader_mode_led);
+
 	wmi_input_destroy();
 	platform_device_unregister(pf_device);
 	pf_device = NULL;
-- 
2.21.0


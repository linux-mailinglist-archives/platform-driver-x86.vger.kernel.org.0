Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4424EFB63A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfKMRSz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:18:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39836 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfKMRSy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:18:54 -0500
Received: by mail-wm1-f68.google.com with SMTP id t26so2919722wmi.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:to:from:date:subject;
        bh=lKaDp6CH4FJCpoSIsJPAHCWvQcNYgC/pQt3EN7nNPVA=;
        b=o8uqND2UumMKMCCJkbEfB5RdLWIUfPj85mCMtR9xQRh6hX1tLP4V9DND0/ojD6rxvP
         rn/1QcNCE/WPR79Adowcbrhnd7jv0Pf6FFnMOgLtXyDwgn/cpFUNNtsCM48fpxuune+U
         QC/UUjtOiPpgu95Rwm93qz8vynxgf/E7ywU6j5FS9pMxOa0MwAe4uBR05cTpNuTMxLpQ
         23RaPTDQMITrQoiFC4fRrKaECMfwlkJ84RrH7Oy9SS1ZqEhlI0xlEiF7nwroOCGgHVU9
         I616nM3fucpPXR99in/MlIrhLu0ke3PVfDPK33VMprvr5vHVeXljQ09nrEdHWpX8y5W/
         cG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:to:from:date
         :subject;
        bh=lKaDp6CH4FJCpoSIsJPAHCWvQcNYgC/pQt3EN7nNPVA=;
        b=RZt8ao6ffJMjlBPfJH/X8Ue6D5Fc8K23NjaSOsJFdE7wwLNGnhlshtJvHoN7QnHK3s
         z7E/adnplqykXnelq2lUW8KD6uBXQQ4AaGqvSYLVw/kCaBZUfxmWBZidif5GJvwYOapH
         oXtg2PZ2U5Soh4wtavPkHNieWJdjmZWhGKkgB064hCO7GWbngyxvoQauJ/g+YXUAhMH1
         so4wY42vH3ukJV04IbsTzYPgAChT1PMJkSNVwF+2WimAycoovmE9sX/HdKFjEB328NuH
         IYh3pPeI0lRuFFFS1ajFg6MRDtN3cKfqpAyg6KwMhUaUTdQUez77HDQObGoBLmy/W4hs
         PBxw==
X-Gm-Message-State: APjAAAXim+pOhObS6g60rvOTf/jFcZ+kkwZR7ltffAoEYEdHnp+fDx3R
        wqqyymmX2Ls3FoL0JAEIt0mwPYh6eQ==
X-Google-Smtp-Source: APXvYqw7WuUqOLO0qQBEW+rV+eXJJk2f8kq3hN1KMyBWXiinoUbZZhrbbcDhqBtf0qyTf/X1hVlQXg==
X-Received: by 2002:a05:600c:410:: with SMTP id q16mr3319092wmb.2.1573665531953;
        Wed, 13 Nov 2019 09:18:51 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id n23sm2830763wmc.18.2019.11.13.09.18.51
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:18:51 -0800 (PST)
Message-Id: <6de2f708dd7df4f78c250ea16438decfa80c80a3.1573664004.git.matan@svgalib.org>
In-Reply-To: <cover.1573664004.git.matan@svgalib.org>
References: <cover.1573664004.git.matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 17:51:33 +0200
Subject: [PATCH 6/7] Expose reader mode as a LED, rather than a sysfs file for
 2018 and later models.
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2017 and older models, setting reader mode turns on the reader mode LED
and reduces the screen colour temperature. On 2018 and later models,
setting the reader mode only turns on the LED, so expose this mode as a
LED, instead of a generic sysfs field.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 843f8f8f1eaf..6460346374b5 100644
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


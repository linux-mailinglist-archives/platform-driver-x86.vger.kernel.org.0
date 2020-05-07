Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DFF1C8ABD
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 14:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgEGM25 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 08:28:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51140 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgEGM24 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 08:28:56 -0400
Received: from mail-pf1-f198.google.com ([209.85.210.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <koba.ko@canonical.com>)
        id 1jWfcJ-0005IE-KB
        for platform-driver-x86@vger.kernel.org; Thu, 07 May 2020 12:27:07 +0000
Received: by mail-pf1-f198.google.com with SMTP id a5so5370597pfk.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 05:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=sy9MiBndjg4GbOCvHlaVis5nDlxNmExV2BMm+rKhLA4=;
        b=pGn9HcLHhDNkZAhsuUha0GbfwmsSNdJT9mt0Fg5mbGnFXxdXbDLyeqFUm7kq0DOskT
         lCG81pS/bk3/ZEgD7vWNiquxzOOz+LqPY8wbUSn70Ul71uoTf2P8pxmHM0o2/pt13nha
         JO7uPaRu099I7bBHoSRGANNVEFUlgZAqFHz7dn+VOKL2ZfjDSVfr3wtMPs6WQfVUOil4
         VGi2IqSRBWo/ZSnF/hL+YUJLSoctAbT6OoS4IXhWVM115ckDfTZPSUtaAcFB1hjuehlG
         pH2CBWiXN2bjfVwRqOHXP0mv4BM33lBx0keljsXQ/BL33vmoGPBsFdj6FzHcN/yit8aM
         FgSg==
X-Gm-Message-State: AGi0PuZGEyLNIsDsoNWJzV4fi3HIQAxVNRi9/BSmkJGGKZCdZriet8bN
        UmonZmXngyNndsPyuW3k/5V3yPjx5iWO0qu1MYgW9bIiVXwKU8OLPxaVMo5BSIPW+y47ZljSzdz
        ssO2BrWIuXIIxZxETH88Ew/ilcaj+AtC8pcDASbg0Qetzmx5ixJk=
X-Received: by 2002:a63:d74a:: with SMTP id w10mr4579322pgi.417.1588854426210;
        Thu, 07 May 2020 05:27:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypLNRMSgD+3px9iOEsOl7gSFyS/RGaRGLdJoZnsUU8G4aN/YOyXpqtVeUrfUXr4TsbeOz0GyIA==
X-Received: by 2002:a63:d74a:: with SMTP id w10mr4579303pgi.417.1588854425823;
        Thu, 07 May 2020 05:27:05 -0700 (PDT)
Received: from canonical.com (111-249-71-140.dynamic-ip.hinet.net. [111.249.71.140])
        by smtp.gmail.com with ESMTPSA id c28sm4772120pfp.200.2020.05.07.05.27.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 05:27:05 -0700 (PDT)
From:   koba.ko@canonical.com
To:     Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] platform/x86: dell-laptop: don't register platform::micmute if the related tokens don't exist.
Date:   Thu,  7 May 2020 20:27:03 +0800
Message-Id: <20200507122703.14617-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Koba Ko <koba.ko@canonical.com>

During boot up, Error messge is issued,
"platform::micmute: Setting an LED's brightness failed (-19)",
but the device isn't presented.

Get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
If one of two tokens doesn't exist,
don't call led_classdev_register() for platform::micmute.
After that, you wouldn't see the platform::micmute in /sys/class/leds/,
and the error message wouldn't see in dmesg.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
---
 drivers/platform/x86/dell-laptop.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 74e988f839e8..e315185dbdd6 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2164,7 +2164,7 @@ static struct led_classdev micmute_led_cdev = {
 static int __init dell_init(void)
 {
 	struct calling_interface_token *token;
-	int max_intensity = 0;
+	int max_intensity = 0, is_micmute_exist = 0;
 	int ret;
 
 	if (!dmi_check_system(dell_device_table))
@@ -2204,10 +2204,14 @@ static int __init dell_init(void)
 
 	dell_laptop_register_notifier(&dell_laptop_notifier);
 
-	micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-	ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
-	if (ret < 0)
-		goto fail_led;
+	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
+	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
+		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
+		if (ret < 0)
+			goto fail_led;
+		is_micmute_exist = 1;
+	}
 
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
@@ -2254,7 +2258,8 @@ static int __init dell_init(void)
 fail_get_brightness:
 	backlight_device_unregister(dell_backlight_device);
 fail_backlight:
-	led_classdev_unregister(&micmute_led_cdev);
+	if (is_micmute_exist)
+		led_classdev_unregister(&micmute_led_cdev);
 fail_led:
 	dell_cleanup_rfkill();
 fail_rfkill:
-- 
2.25.1


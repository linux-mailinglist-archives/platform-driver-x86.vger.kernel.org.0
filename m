Return-Path: <platform-driver-x86+bounces-900-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B882CDD0
	for <lists+platform-driver-x86@lfdr.de>; Sat, 13 Jan 2024 18:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2395D1F2246C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 13 Jan 2024 17:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2E44A39;
	Sat, 13 Jan 2024 17:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imUIuBgs"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB204400
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jan 2024 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2ac304e526so689100566b.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jan 2024 09:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705165432; x=1705770232; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWi9iGJO6IZ7tvnGVnt7dzqpt/AaANFCct0SFNd95O0=;
        b=imUIuBgs/cJpgnegw8Q3j0+0vInFw9rOaDhUjkIepn76QQT+UdzuWVW/7x0ZjWB7Ms
         wIV42efKPPxRFrKUbDkrb68GbrrboC5pEmYsngdvPJOPXLgxt9SkEE8TnoXgMXMK9kc6
         1eSP118EG9P4GY1mp0NK/VxWZATbSEzm31CO7TzKZI9HilKuDGBvqC0BTyAK1lmTJfl/
         m1zSHWBQqF9N/+DhiljRe8+syU0fQyTPeOq8c8Xgof8DUvefBIgQxZEgrkeqrMg0aGav
         1LTVtGRRV+QB6+jXy7TKfxOvnOjM1k3GqiGeuV92m510CMX2VENOMYkDHKtYp0EV4tC5
         WiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705165432; x=1705770232;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWi9iGJO6IZ7tvnGVnt7dzqpt/AaANFCct0SFNd95O0=;
        b=B0r6yKFPBrmswb3bNzXvaAy0DfkptxZkA2xjsxJS0E/PwRv8BzoKpLxpqc9UqMyepo
         XbLH9rpF8aLH0BF/Sp0d18nG4cSzLQH5NHFe+kk65ATwcJIHxuDoRLjh411fcjUuskRJ
         5xiIWk7/tC+4LT8g1y5hdfnkiRm11FUTi+WgQ5x/fkb+yWz+cIpsEmpWVMG2B4n8rMy/
         qMcZsnqYq7TUad1tYSCzwAb+0tI1h4SJ7qZYqaj27+AdApvgWYkD9iadXDAp0xf+uLrz
         LUp/qimiRatPBpYE+sXKIy3tF0oANFFgzCopYs6vPsuT1FK9NM3OsyuK4AX5EevthXPM
         pHSA==
X-Gm-Message-State: AOJu0YzuMQQRaluJKwykq8yLNCQv5WfFznUNrwjyhRCE6BIcEo8NEAVA
	iFF2KjoWX7QggGIH0OyjyBQ=
X-Google-Smtp-Source: AGHT+IFot6ITaY1iahUvePTvqakoVYRHDAcXnoQbXG9FzN2zQ/6n39NFCb+BKktDuBUovfWAzpjjIQ==
X-Received: by 2002:a17:907:d89:b0:a27:be67:1743 with SMTP id go9-20020a1709070d8900b00a27be671743mr1943080ejc.40.1705165432023;
        Sat, 13 Jan 2024 09:03:52 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f53:1400:f940:1690:80f6:61b6? (dynamic-2a01-0c22-6f53-1400-f940-1690-80f6-61b6.c22.pool.telefonica.de. [2a01:c22:6f53:1400:f940:1690:80f6:61b6])
        by smtp.googlemail.com with ESMTPSA id ti14-20020a170907c20e00b00a2cea055d92sm1536985ejc.176.2024.01.13.09.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 09:03:51 -0800 (PST)
Message-ID: <dc5c0a33-ad25-4dac-828c-88dc78da0c9c@gmail.com>
Date: Sat, 13 Jan 2024 18:03:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Perry Yuan <Perry.Yuan@dell.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: acpi4asus-user@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 ibm-acpi-devel@lists.sourceforge.net
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] platform/x86: remove obsolete calls to ledtrig_audio_get
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since 64f67b5240db ("leds: trigger: audio: Add an activate callback to
ensure the initial brightness is set") the audio triggers have an
activate callback which sets the LED brightness as soon as the
(default) trigger is bound to the LED device. So we can remove the
call to ledtrig_audio_get.

Positive side effect: There's no code dependency to ledtrig-audio any
longer.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/platform/x86/asus-wmi.c              | 1 -
 drivers/platform/x86/dell/dell-laptop.c      | 2 --
 drivers/platform/x86/dell/dell-wmi-privacy.c | 1 -
 drivers/platform/x86/huawei-wmi.c            | 1 -
 drivers/platform/x86/thinkpad_acpi.c         | 1 -
 5 files changed, 6 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 18be35fdb..21dee425e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1620,7 +1620,6 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
 		asus->micmute_led.name = "platform::micmute";
 		asus->micmute_led.max_brightness = 1;
-		asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
 		asus->micmute_led.brightness_set_blocking = micmute_led_set;
 		asus->micmute_led.default_trigger = "audio-micmute";
 
diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 658643835..42f7de2b4 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2252,7 +2252,6 @@ static int __init dell_init(void)
 	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
 	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE) &&
 	    !dell_privacy_has_mic_mute()) {
-		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
 		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
 		if (ret < 0)
 			goto fail_led;
@@ -2261,7 +2260,6 @@ static int __init dell_init(void)
 
 	if (dell_smbios_find_token(GLOBAL_MUTE_DISABLE) &&
 	    dell_smbios_find_token(GLOBAL_MUTE_ENABLE)) {
-		mute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MUTE);
 		ret = led_classdev_register(&platform_device->dev, &mute_led_cdev);
 		if (ret < 0)
 			goto fail_backlight;
diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
index c517bd45d..4d94603f7 100644
--- a/drivers/platform/x86/dell/dell-wmi-privacy.c
+++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
@@ -288,7 +288,6 @@ static int dell_privacy_leds_setup(struct device *dev)
 	priv->cdev.max_brightness = 1;
 	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
 	priv->cdev.default_trigger = "audio-micmute";
-	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
 	return devm_led_classdev_register(dev, &priv->cdev);
 }
 
diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 0ef1c46b6..dde139c69 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -310,7 +310,6 @@ static void huawei_wmi_leds_setup(struct device *dev)
 	huawei->cdev.max_brightness = 1;
 	huawei->cdev.brightness_set_blocking = &huawei_wmi_micmute_led_set;
 	huawei->cdev.default_trigger = "audio-micmute";
-	huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
 	huawei->cdev.dev = dev;
 	huawei->cdev.flags = LED_CORE_SUSPENDRESUME;
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c4895e9bc..d1c9f91fd 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9285,7 +9285,6 @@ static int mute_led_init(struct ibm_init_struct *iibm)
 			continue;
 		}
 
-		mute_led_cdev[i].brightness = ledtrig_audio_get(i);
 		err = led_classdev_register(&tpacpi_pdev->dev, &mute_led_cdev[i]);
 		if (err < 0) {
 			while (i--)
-- 
2.43.0



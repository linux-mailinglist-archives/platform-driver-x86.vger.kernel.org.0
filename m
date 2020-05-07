Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA411C8516
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 10:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgEGIti (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 04:49:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43077 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEGIti (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 04:49:38 -0400
Received: from mail-pf1-f198.google.com ([209.85.210.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <koba.ko@canonical.com>)
        id 1jWcDo-0003On-2N
        for platform-driver-x86@vger.kernel.org; Thu, 07 May 2020 08:49:36 +0000
Received: by mail-pf1-f198.google.com with SMTP id r5so4892930pfh.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 01:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=nOtJNSzU/IvusKVXf0pPBVCTPzZSjjhY+JMbX/BgmI0=;
        b=EljFJrB2Zg8OkLhZ+6j187M7Pe2r2iyCoejlx21hF1f+1GlZ3VeTDb3iK4AfCwOw1/
         jRuTo9cYwGf4prUVbEhzHyxQXYXAWqfa8IcXoqtAGMxJyM3m0nMhUCEcjN6hVTwGPd63
         RZs0hU9QCm7PRV0Fl+nGSxwYBpLdpMgxs584LPB451yT5Owi+HlaYq2YsJrenlV4lghN
         yxdfkXxAJiglj4yqCoygp63tqEacUIcNJabyeshlvff/1eBkLwOwoNzgcGIIO9oeBdiV
         nYI//+hRHG9ju9inOl92SXS2Ak6BAvZRDuz3xyE8b630bIUZ2EmQyRPW4fk2qvXZEART
         q42g==
X-Gm-Message-State: AGi0PuafDaDgSc+V8S38I2qEEQJpjtay9dZsmbcxcUcFQJCWmRKBVWvu
        HVGzJ7UYC4A80UuPCAyJQlYfDgwPyUMduSbB0tL0dlJ7rxPNxlg124zKDN+FRBWOul0hQUyTwWP
        nSW3GiUHbFisCpWPpjrOTsfzjj4I1L3K+oP9c/JNrCeA4IKREz9Y=
X-Received: by 2002:a05:6a00:2b4:: with SMTP id q20mr3533503pfs.104.1588841374682;
        Thu, 07 May 2020 01:49:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypJXUqWYSddTDisZFi+SRnAnomb/fR1qGtEPz+bGR8LzdXodN6VAFikD/NLG4b2CRGU95WgWTg==
X-Received: by 2002:a05:6a00:2b4:: with SMTP id q20mr3533484pfs.104.1588841374345;
        Thu, 07 May 2020 01:49:34 -0700 (PDT)
Received: from canonical.com (111-249-71-140.dynamic-ip.hinet.net. [111.249.71.140])
        by smtp.gmail.com with ESMTPSA id w11sm3279063pgj.4.2020.05.07.01.49.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 01:49:33 -0700 (PDT)
From:   koba.ko@canonical.com
To:     Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-laptop: don't register platform::micmute if the related tokens don't exist.
Date:   Thu,  7 May 2020 16:49:32 +0800
Message-Id: <20200507084932.5486-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Koba Ko <koba.ko@canonical.com>

First, get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
If one of two tokens doesn't exist, don't register platform::micmute.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
---
 drivers/platform/x86/dell-laptop.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 1e46022fb2c5..afc1ded83e56 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2208,10 +2208,13 @@ static int __init dell_init(void)
 
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
+	}
 
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
-- 
2.17.1


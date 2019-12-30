Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3B712CDB7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Dec 2019 09:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfL3Ick (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 30 Dec 2019 03:32:40 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33319 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbfL3Ick (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Dec 2019 03:32:40 -0500
Received: by mail-pf1-f196.google.com with SMTP id z16so17929789pfk.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Dec 2019 00:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3s7ohP3Z8i+XydTTvz21BD2f0Cry8Bo5p1LTlT19B4g=;
        b=EA7HTUbqUnIitOM9hMwC5NmMDjt5Dl9ltD+1qxOpdpPIW9UHf7+tI7Qy/oQwAtA4vW
         H6HG7HTUJCxGZnGuaxRKAwpEFnEbvqT/ImBccHuptDEIE4FQ9VW0q76DkR3wdHnkWOdi
         1Pgp9zYBO+fenX2k0p4jKRuM1OBeVz2LRwwGeoZh7J9sFelNo3LBBSDQ14VzONb1FfRh
         2ddpzvkaDCB/SjXaFrZ2MLI/tNWetR+/WwmDDHlplsZZwcA0P7zS4Q+TLTsk4HOh75sX
         gdTGlErVdECuB1qagkgC+e6uynre1XT9kVuEnutUu31MJIq47pBHbO9ts8g2c1SV9taI
         tcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3s7ohP3Z8i+XydTTvz21BD2f0Cry8Bo5p1LTlT19B4g=;
        b=pkM9h0PooUJJpB+MegDp5DPyXB62DibTIf6Bl89fuqDPIrUm1T0QK4bax84nDkHZKa
         AqXPlAxpOxXOd2+7ze4lmXvKhbNYlna542eVCj1xAsEUM4ldAeiM+NNHD/NsbrjV8jGo
         +tegvNHgfGrQR1nDJuk2tny9R6BqHNJwBi7VdBaRYjNZiFuJflee5klfhEwSQo1ZfOOL
         tK9kP71sLdmlOHIsQshaYMhYatvx7xqxu3GF9Vyk8A8tlNKkreMIEHh2SVCnVf7bFgDo
         OTPxil4GILXc+tsD0lEpBUu3DMYw9w4ldUGgOJVkpj5uoFU+975h003VtqFXuq8g9MGe
         BGWw==
X-Gm-Message-State: APjAAAWAxIa8yWB//5yZ9hfsY5w65Gbb9nm2BV1XBbk2ALNBUlyDN8Gi
        pTcSkzqatf16ClRCGP/ZtKq0FQ==
X-Google-Smtp-Source: APXvYqxFKKazEmaMHoujQh5jNJgTodqHmA3KCyczG78X9j4EM0Vr0BNNLetv2mkg+9uwCmoNZ4gBDQ==
X-Received: by 2002:aa7:979a:: with SMTP id o26mr70387114pfp.0.1577694760024;
        Mon, 30 Dec 2019 00:32:40 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id 17sm51485268pfv.142.2019.12.30.00.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 00:32:39 -0800 (PST)
From:   Jian-Hong Pan <jian-hong@endlessm.com>
To:     Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessm.com, Jian-Hong Pan <jian-hong@endlessm.com>
Subject: [PATCH] platform/x86: asus-wmi: Fix keyboard brightness cannot be set to 0
Date:   Mon, 30 Dec 2019 16:30:45 +0800
Message-Id: <20191230083044.11582-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of ASUS laptops like UX431FL keyboard backlight cannot be set to
brightness 0. According to ASUS' information, the brightness should be
0x80 ~ 0x83. This patch fixes it by following the logic.

Fixes: e9809c0b9670 ("asus-wmi: add keyboard backlight support")
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 821b08e01635..982f0cc8270c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -512,13 +512,7 @@ static void kbd_led_update(struct asus_wmi *asus)
 {
 	int ctrl_param = 0;
 
-	/*
-	 * bits 0-2: level
-	 * bit 7: light on/off
-	 */
-	if (asus->kbd_led_wk > 0)
-		ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
-
+	ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
 	asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
 }
 
-- 
2.20.1


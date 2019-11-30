Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F91F10DD33
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfK3Ixq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:46 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43697 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfK3Ixq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:46 -0500
Received: by mail-wr1-f66.google.com with SMTP id n1so37816729wra.10
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to;
        bh=urfOqhiw0r/dhZ3ki6fOVsyxNzj7D89kgglX+cgLtbk=;
        b=uoVLHTMA6JdrPr9udFukq5k4x0VnUYm4xprZcbbty36iMz9e9bkumqU3+vjC2uarAt
         REpGvS7rHhehnfq10Huy2ev4GTIe9eF1sbfKieaCLz7aEfPzaKhQkxi8AxlQXtmw4jxV
         fcvSsR4rsg/lIn3m7sivTDrQOOPMuenyavfF7gvb7MO4Idk0Suyj/9fEgydR8V9R0VDH
         UgAqjRAx4k3q/CQmeMgeZmWY+1V8F98C4ft2Kcnbqj4c4f01k2/K6OY5hN/fTpfe7fv3
         TZRmssXUw973GdujckiXPGbGd0TnaEYNFpYrgflpCZnme4nYgOJ6mSKm4NoxMN3QSVsd
         95qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to;
        bh=urfOqhiw0r/dhZ3ki6fOVsyxNzj7D89kgglX+cgLtbk=;
        b=i6rsBw5ZozYLfBueby4aOktMhRmIjJAyprwmsa4Mh6IzKnddWuywDxyLFtOg32CMD7
         LdnOJOEUfV3JrjtU29eaVO5cK3h0aheY1iJ/s/9VELHQaKhYfv+UOV0Qrit5obZmQKfO
         L/IBoytoFr+qXFDO/P6RQ/8RLdPHzZsjh/A2gNs2cNkNJInbm+ctBOUsfFuR1sAO0Gci
         Sue6sEoxH00SFMj6Dw89rnky6TrzeRcbZlioklgPtHr2i36Y+8oVITgXVvyOdHmuYzFy
         PQCXSKmeTNlxuBYMlfeT46rRjPryVbcABpvEE2IN1HHpvPE8Hx8FqMJQFj2kQXgCcVAQ
         zNfw==
X-Gm-Message-State: APjAAAUrneEqmLdLWgRAL0CLu7Ee60OxOpW173sam3SWeeuzBF6Y3Ac+
        an2h6j6QinSXIOnupmSrsJ2jzJjXew==
X-Google-Smtp-Source: APXvYqwtWSthLZjLmSjw7SciFLRmHPmKpoAXFuTaTuj1RIgI8YtK3zhWO5FnELJQ+j7p/H8e1NOxsA==
X-Received: by 2002:adf:f604:: with SMTP id t4mr1597132wrp.33.1575104024319;
        Sat, 30 Nov 2019 00:53:44 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id x10sm30277837wrv.60.2019.11.30.00.53.43
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:43 -0800 (PST)
Message-Id: <224d08c54cca47aae0ef658c604e699d00454ddd.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
References: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:50:55 +0200
Subject: [PATCH V2 7/7] platform/x86: lg-laptop.c: Document difference in
 reader mode handling
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reader mode is handled differently between in post 2018 and pre 2018
models.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 Documentation/admin-guide/laptops/lg-laptop.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/laptops/lg-laptop.rst b/Documentation/admin-guide/laptops/lg-laptop.rst
index ce9b14671cb9..2d3a2f863c04 100644
--- a/Documentation/admin-guide/laptops/lg-laptop.rst
+++ b/Documentation/admin-guide/laptops/lg-laptop.rst
@@ -14,6 +14,7 @@ The following FN keys are ignored by the kernel without this driver:
 
 - FN-F1 (LG control panel)   - Generates F15
 - FN-F5 (Touchpad toggle)    - Generates F13
+  On 2019 model, the firmware also generates "125-29-85" key codes.
 - FN-F6 (Airplane mode)      - Generates RFKILL
 - FN-F8 (Keyboard backlight) - Generates F16.
   This key also changes keyboard backlight mode.
@@ -27,7 +28,8 @@ Reader mode
 
 Writing 0/1 to /sys/devices/platform/lg-laptop/reader_mode disables/enables
 reader mode. In this mode the screen colors change (blue color reduced),
-and the reader mode indicator LED (on F9 key) turns on.
+and the reader mode indicator LED (on F9 key) turns on. Only available on
+2016 and 2017 models.
 
 
 FN Lock
@@ -66,7 +68,7 @@ This value is reset to 0 when the kernel boots.
 LEDs
 ~~~~
 
-The are two LED devices supported by the driver:
+The are two or three LED devices supported by the driver:
 
 Keyboard backlight
 ------------------
@@ -82,3 +84,10 @@ Touchpad indicator LED
 ----------------------
 
 On the F5 key. Controlled by led device names tpad_led.
+
+
+Reader mode LED
+---------------
+
+On the F8 Key. Controlled by led device named reader_mode_led. Only available
+on 2018 and later models.
-- 
2.21.0


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB43AFB646
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKMRVv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:21:51 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39245 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfKMRVu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:21:50 -0500
Received: by mail-wm1-f68.google.com with SMTP id t26so2929284wmi.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:to:from:date:subject;
        bh=7LgMkipKgreoJOTWkfDAs23w2R5OuNipw43ZvrMEPRM=;
        b=xoNlxcicUvu+sO3X6dmCLf5qoiUhEXqBtrc366xQkzjOuOrSE7RrmbCwr6cwXRJ98C
         sXfWkT5yvsGu8N/rPK8ISq0yppb3+F+zKgUxfYQaaQjLeG0qETaLJPz+u7qqac00SGR/
         mQfxMSQCSfm/S8twXEspXR9IDHo3NM0Mms3MLw99tp/V4OD+oO4PZcpP4a/cu27V03fm
         DLtNhH0MQ1x4nxthJQE4hZWll/AKBY2DN7FAg4+0jf5L4alNxkO/d9var6c/aFV1x/1K
         idt3UVVTIxXlZjFkhFgn3vb9ylJ9xEJJ9oSSsswOhwxfWJDpNLgdBk+ZzfrTSkkukt1x
         KeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:to:from:date
         :subject;
        bh=7LgMkipKgreoJOTWkfDAs23w2R5OuNipw43ZvrMEPRM=;
        b=TM9F0zGyDB5AqoShxieea56hU+LsWttxPDRj8jh9dr8oEUFFWX/ENbc2KDVs/rZoZZ
         v/PhbfnuZUioBCrvYX/DyCOAHcJLokFKOq8KDKWZysUAeqz2CW6CIvh4hyV0ajgHsxuP
         u6f4mB72XITayWJ1olrMYe1vuM9t95x+Ze6jzXR6kCh7xOd2vpQpdAbB47Zna0e9U0E6
         bWSexQc2g7ap7N4RGfjX8FPy6c5DvWtfRDNkZ7L4IdtCbOr0tB1qYotB3ALZmnMBVY/Q
         1TwjVwmk3i7D/Eu/FKhCLMQI90jYj8Pm8L7lhGSQ6m4IxVphyoxNBguFpGv8zJfINE5w
         sCvA==
X-Gm-Message-State: APjAAAUG+S7D/qGsEnyKVwz6CdSvDT1U2TkiEwVKXX+0NC/LkfQHYerB
        Y7pPr+JvJDTPExklnZAsW17xjoixHQ==
X-Google-Smtp-Source: APXvYqxIXZVye28gBWUKAHGpQ41BbYVTBpOS+ifwWOFWZOuk6ebCPifudI9kb3HHMaD38jqww/jrRw==
X-Received: by 2002:a1c:2dd0:: with SMTP id t199mr3692687wmt.58.1573665706731;
        Wed, 13 Nov 2019 09:21:46 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id j3sm3381035wrs.70.2019.11.13.09.21.45
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:21:45 -0800 (PST)
Message-Id: <08abf4b8e73fe623bd6b73b31e6cd69aca7ae068.1573664004.git.matan@svgalib.org>
In-Reply-To: <cover.1573664004.git.matan@svgalib.org>
References: <cover.1573664004.git.matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 17:52:49 +0200
Subject: [PATCH 7/7] Document difference in reader mode handling between
 pre-2018 models, and the later models.
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Document the reader mode changes in 2018 and later models.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 Documentation/admin-guide/laptops/lg-laptop.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/laptops/lg-laptop.rst b/Documentation/admin-guide/laptops/lg-laptop.rst
index ce9b14671cb9..ebdbf2f44e70 100644
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


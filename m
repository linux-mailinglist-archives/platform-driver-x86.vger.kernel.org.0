Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D346A9AE4
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Sep 2019 08:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731015AbfIEGrQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Sep 2019 02:47:16 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:45431 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730778AbfIEGrQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Sep 2019 02:47:16 -0400
Received: by mail-pg1-f173.google.com with SMTP id 4so825834pgm.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2019 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+u4gLw6j2OSFXXXBdcLkgNGWPn9jRYBpIqHZ9wSpUY=;
        b=bsEsTeBdupyvfF18sPED+AfjrT4VkMCIasoVqOQndDqhJ4mW7iCeV12ISAjKLqzlhg
         brPtWu4/MkGI2kk02sHKg1iE0Q18Av+agkIiL5mU/HAEiRGIJBSmkEPtO2Tg+4ADgr5z
         i820RYPAu2tWA+zu4Q4MnuP1H5eeYPE7XHB2eB2xhuT+LXVSIIEGKPLZwx+gkmAHv3+L
         iDezZL8slbCBdb2TWc5/QVeMXYgeaGWY4b6rBaWBVHeZWgaq0vdTWO8W6bjNXJ6lO/Pl
         08VBDNG2OzJgaGRxbmvM1kR5m1CGt8z7QVU5Z+KFWwUwgB7cEmS2nIRV27+cCzVak5SB
         OFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+u4gLw6j2OSFXXXBdcLkgNGWPn9jRYBpIqHZ9wSpUY=;
        b=IoC+cUWJVR5myzNohkL0B/V0C9Gcfpo1k616CYnqSyT7/3YEZf5YYQok8QNAAcVEk2
         6ibYX7x2iiP3Sc6hsN9o8mVlftjYaFyZ8nrJSku3MZb7q7RRdWXFUelPfYNlvp8YTUdM
         xIkv4792izHyPGTfB2Y+JI5BmuYerOshtO9ywF6ffglVsKhuxvwSz2h524pb7NlsOHDq
         1PWXMQ18UXM3c0/0YOE9V0P3fALI1PBuhxgWicM3J+PtCzwRPRmkgjBuLOd0Ffahh3AX
         pN2rJcLqZA5JogKBbCzstodlOnwWh8ZIeXnTFXZencM7Hs0tRZAU342RMHg8dSOXOfMf
         BZVg==
X-Gm-Message-State: APjAAAXa/e5DTWDSYDFlLDTqwlyLMYu9g8POKGNsIpQbK9jnS7BfP9Cp
        2aK1OCqRBApAo230DdrljiXkMg==
X-Google-Smtp-Source: APXvYqz4MUHdNeFbp0epKLUhUCIHdeA7O/1oxxGiDdlCc8F4pENinJdiupfeWhMkVhaIUz7yePapsg==
X-Received: by 2002:a63:b919:: with SMTP id z25mr1716995pge.201.1567666035648;
        Wed, 04 Sep 2019 23:47:15 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id 67sm1016041pjo.29.2019.09.04.23.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 23:47:14 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     eric.piel@tremplin-utc.net, dvhart@infradead.org,
        andy@infradead.org
Cc:     pavel@suse.cz, platform-driver-x86@vger.kernel.org,
        linux@endlessm.com, burman.yan@gmail.com
Subject: [PATCH 1/2] lis3lv02d: update documentation references to neverball
Date:   Thu,  5 Sep 2019 14:47:06 +0800
Message-Id: <20190905064707.7640-1-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In 2008 when this documentation was added, it was probably possible
to use the accelerometer play neverball "out of the box" as described.

That's not the case any more though.
After fixing sdl to expose the device again
(https://bugzilla.libsdl.org/show_bug.cgi?id=4789), the game is unplayable
because modern versions of neverball configure the 3rd axis
(usually the twisting action of a physical joystick) to rotate the field
of view by default. Since the Z axis is ordinarily fully positive (as
documented), this results in the field of view constantly rotating and the
game is unplayable.

Until I went closer into the details, this had me thinking that the
accelerometer was not working correctly. Update the documentation to
clarify.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 Documentation/misc-devices/lis3lv02d.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/misc-devices/lis3lv02d.rst b/Documentation/misc-devices/lis3lv02d.rst
index 959bd2b822cf..c6d3f2d616a4 100644
--- a/Documentation/misc-devices/lis3lv02d.rst
+++ b/Documentation/misc-devices/lis3lv02d.rst
@@ -20,7 +20,7 @@ This driver provides support for the accelerometer found in various HP laptops
 sporting the feature officially called "HP Mobile Data Protection System 3D" or
 "HP 3D DriveGuard". It detects automatically laptops with this sensor. Known
 models (full list can be found in drivers/platform/x86/hp_accel.c) will have
-their axis automatically oriented on standard way (eg: you can directly play
+their axis automatically oriented on standard way (eg: you can play
 neverball). The accelerometer data is readable via
 /sys/devices/platform/lis3lv02d. Reported values are scaled
 to mg values (1/1000th of earth gravity).
@@ -72,8 +72,7 @@ Axes orientation
 ----------------
 
 For better compatibility between the various laptops. The values reported by
-the accelerometer are converted into a "standard" organisation of the axes
-(aka "can play neverball out of the box"):
+the accelerometer are converted into a "standard" organisation of the axes:
 
  * When the laptop is horizontal the position reported is about 0 for X and Y
    and a positive value for Z
@@ -82,6 +81,10 @@ the accelerometer are converted into a "standard" organisation of the axes
    (becomes negative)
  * If the laptop is put upside-down, Z becomes negative
 
+This configuration of X and Y axes works for playing neverball, as long
+as you configure it to ignore the Z axis (e.g. in neverballrc, set
+joystick_axis_x1 to point to a non-existent axis).
+
 If your laptop model is not recognized (cf "dmesg"), you can send an
 email to the maintainer to add it to the database.  When reporting a new
 laptop, please include the output of "dmidecode" plus the value of
-- 
2.20.1


Return-Path: <platform-driver-x86+bounces-9666-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9283A409F7
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Feb 2025 17:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C7123B9B13
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Feb 2025 16:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2F92063E5;
	Sat, 22 Feb 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Z2iMBkm4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1E11CAF;
	Sat, 22 Feb 2025 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740241250; cv=none; b=o9d1yBbsxN+iD+UJcVLgAnKHJETClVxZsqqbAQK8TKXtVKpzehxeemp5wtDSMM7UQcAytjr7Fz3D9pY6v6Bfo1vXbJhrP0RBKqm7l02Wu1/ALRaRD5MsSPAQg7LJbetX4uFCSwBROT5MPmdj2ozs+w/qWDUs2C5C2W26fxcyYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740241250; c=relaxed/simple;
	bh=hwbg85IHRmzac4MOiU1b/r7yBMLHOMIeHyC8YX0maYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtuEEKgabALnJ1bSZwqTNvqzzUbaDI6iBV3pgHczGWvD6ONXcd3eOBZh1syRMcSZTs1XJpcfYa5k1Ncq0k40212ItGWCzHdHEvI/53IVREtt7j19Ua8JE73I5CNCeQr0QZwZyj+2A9X2TIj+lVcMge78Uu2QQ3Z3L6FwSvOuvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Z2iMBkm4; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 017EC2E08C42;
	Sat, 22 Feb 2025 18:20:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740241245;
	bh=EbAW66MOShp+FMmH6+3P02El1Ie30xboAe3WC3/AJMs=; h=From:To:Subject;
	b=Z2iMBkm4D3sX4nV9jyjTipPoy8WaHiposRA8lSTIPECUQgdDLTC5zTtXqpC3craDD
	 CFesGlhg1usS/tazBDrwYBeQJuq9pe/te5NDdmtd2IQ6oRRtAHAmn/3zfJWT+akRzf
	 pjkOpWA9XeLAtncNBKqX8tuyZYbn3pR/ILfuzjdM=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joaquin Ignacio Aramendia <samsagax@gmail.com>,
	Derek J Clark <derekjohn.clark@gmail.com>,
	Kevin Greenberg <kdgreenberg234@protonmail.com>,
	Joshua Tam <csinaction@pm.me>,
	Parth Menon <parthasarathymenon@gmail.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 12/12] ABI: testing: add tt_toggle and tt_led entries
Date: Sat, 22 Feb 2025 17:18:23 +0100
Message-ID: <20250222161824.172511-13-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222161824.172511-1-lkml@antheas.dev>
References: <20250222161824.172511-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174024124534.14264.15912875553873316250@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

When tt_toggle was introduced, it was not added to the platform sysfs.
Add it, then add documentation for tt_led. Remove the documentation
from the hwmon entry, then update its readme to be current.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 Documentation/ABI/testing/sysfs-platform-oxp | 29 +++++++++
 Documentation/hwmon/oxpec.rst                | 62 +++++++-------------
 2 files changed, 49 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-oxp

diff --git a/Documentation/ABI/testing/sysfs-platform-oxp b/Documentation/ABI/testing/sysfs-platform-oxp
new file mode 100644
index 000000000000..8727d5ecaab5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-oxp
@@ -0,0 +1,29 @@
+What:		/sys/devices/platform/<platform>/tt_toggle
+Date:		Jun 2023
+KernelVersion:	6.5
+Contact:	"Antheas Kapenekakis" <lkml@antheas.dev>
+Description:
+		Takeover TDP controls from the device. OneXPlayer devices have a
+        turbo button that can be used to switch between two TDP modes
+        (usually 15W and 25W). By setting this attribute to 1, this
+        functionality is disabled, handing TDP control over to (Windows)
+        userspace software and the Turbo button turns into a keyboard
+        shortcut over the AT keyboard of the device. In addition,
+        using this setting is a prerequisite for PWM control for most
+        devices (otherwise it NOOPs).
+
+        This attribute was originally introduced in 6.5, without a
+        corresponding documentation entry.
+
+What:		/sys/devices/platform/<platform>/tt_led
+Date:		Feb 2025
+KernelVersion:	6.15
+Contact:	"Antheas Kapenekakis" <lkml@antheas.dev>
+Description:
+		Some OneXPlayer devices (e.g., X1 series) feature a little LED
+        nested in the Turbo button. This LED is illuminated when the
+        device is in the higher TDP mode (e.g., 25W). Once tt_toggle
+        is engaged, this LED is left dangling to its last state. This
+        attribute allows userspace to control the LED state manually
+        (either with 1 or 0). Only a subset of devices contain this LED.
+
diff --git a/Documentation/hwmon/oxpec.rst b/Documentation/hwmon/oxpec.rst
index 581c4dafbfa1..0a0a7c5d0263 100644
--- a/Documentation/hwmon/oxpec.rst
+++ b/Documentation/hwmon/oxpec.rst
@@ -1,35 +1,41 @@
 .. SPDX-License-Identifier: GPL-2.0-or-later
 
-Kernel driver oxp-sensors
+Kernel driver oxpec
 =========================
 
 Authors:
     - Derek John Clark <derekjohn.clark@gmail.com>
     - Joaquín Ignacio Aramendía <samsagax@gmail.com>
+    - Antheas Kapenekakis <lkml@antheas.dev>
 
 Description:
 ------------
 
-Handheld devices from OneNetbook, AOKZOE, AYANEO, And OrangePi provide fan
-readings and fan control through their embedded controllers.
+Handheld devices from OneXPlayer and AOKZOE provide fan readings and fan
+control through their embedded controllers, which can be accessed via this
+module. If the device has the platform `tt_toggle` attribute (see
+Documentation/ABI/testing/sysfs-platform-oxp), controlling these attributes
+without having it engaged is undefined behavior.
 
-Currently supports OneXPlayer devices, AOKZOE, AYANEO, and OrangePi
-handheld devices. AYANEO devices preceding the AIR and OneXPlayer devices
-preceding the Mini A07 are not supportable as the EC model is different
-and do not have manual control capabilities.
-
-Some OneXPlayer and AOKZOE models have a toggle for changing the behaviour
-of the "Turbo/Silent" button of the device. It will change the key event
-that it triggers with a flip of the `tt_toggle` attribute. See below for
-boards that support this function.
+In addition, for legacy reasons, this driver provides hwmon functionality
+to Ayaneo devices, and the OrangePi Neo (AOKZOE is a sister company of
+OneXPlayer and uses the same EC).
 
 Supported devices
 -----------------
 
 Currently the driver supports the following handhelds:
-
  - AOKZOE A1
  - AOKZOE A1 PRO
+ - OneXPlayer 2/2 Pro
+ - OneXPlayer AMD
+ - OneXPlayer mini AMD
+ - OneXPlayer mini AMD PRO
+ - OneXPlayer OneXFly variants
+ - OneXPlayer X1 variants
+
+In addition, until a driver is upstreamed for the following, the driver
+also supports controlling them:
  - AYANEO 2
  - AYANEO 2S
  - AYANEO AIR
@@ -41,29 +47,8 @@ Currently the driver supports the following handhelds:
  - AYANEO Geek
  - AYANEO Geek 1S
  - AYANEO KUN
- - OneXPlayer 2
- - OneXPlayer 2 Pro
- - OneXPlayer AMD
- - OneXPlayer mini AMD
- - OneXPlayer mini AMD PRO
- - OneXPlayer OneXFly
- - OneXPlayer X1 A
- - OneXPlayer X1 i
- - OneXPlayer X1 mini
  - OrangePi NEO-01
 
-"Turbo/Silent" button behaviour toggle is only supported on:
- - AOK ZOE A1
- - AOK ZOE A1 PRO
- - OneXPlayer 2
- - OneXPlayer 2 Pro
- - OneXPlayer mini AMD (only with updated alpha BIOS)
- - OneXPlayer mini AMD PRO
- - OneXPlayer OneXFly
- - OneXPlayer X1 A
- - OneXPlayer X1 i
- - OneXPlayer X1 mini
-
 Sysfs entries
 -------------
 
@@ -79,11 +64,4 @@ pwm1_enable
 pwm1
   Read Write. Read this attribute to see current duty cycle in the range [0-255].
   When pwm1_enable is set to "1" (manual) write any value in the range [0-255]
-  to set fan speed.
-
-tt_toggle
-  Read Write. Read this attribute to check the status of the turbo/silent
-  button behaviour function. Write "1" to activate the switch and "0" to
-  deactivate it. The specific keycodes and behaviour is specific to the device
-  both with this function on and off. This attribute is attached to the platform
-  driver and not to the hwmon driver (/sys/devices/platform/oxp-platform/tt_toggle)
+  to set fan speed.
\ No newline at end of file
-- 
2.48.1



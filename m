Return-Path: <platform-driver-x86+bounces-9664-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968A7A409EE
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Feb 2025 17:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE0573B9625
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Feb 2025 16:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C546B1F462A;
	Sat, 22 Feb 2025 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="uvb3mLXS"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1875190468;
	Sat, 22 Feb 2025 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740241245; cv=none; b=o/u2BZp7EY0sFFTgR+0f94EER42lzEiqpj4kekeXZd9q/c7fFs1RrFy3VLXO6kdd1UyI8mOWBNvWpEDEhKk+xCOH0WpObef3yUtiMOp6xYCzuJUe+CBgFsBmcLQu/sFOrIqGj8wUhV80bXFe88V9lFwBoecs+xFvNIywT0TAsGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740241245; c=relaxed/simple;
	bh=phktHrVXrx6MvbhfYiZZQixFSku3T/sXEsrolwVxvII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miRzQk/hVvUGOeLYzLeIr8sFW12VpjuZlee1NZAcr22Tmct/LLQK+bgJBhOmO/oB3Dc2u5sM93CA0EtQ4kbPRrM4rIuMqJkfGyJyTxZoT2wqO6CanvXLC2eL+ct61onVA18UArYh3eW247K9Uu9OkTmJkUbx/utU9zpz9Ec1F5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=uvb3mLXS; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 66D852E08C34;
	Sat, 22 Feb 2025 18:20:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740241241;
	bh=fSj7m78Bdzzrg+IS9nOgqLmd78dOzf2n/LG8zeTOh3c=; h=From:To:Subject;
	b=uvb3mLXSpAoNmo8b/MvTkxpEQnGs9Q9ahHNIVC/Z0e5djSmDpGwTmQ4X7Mzr65Xeu
	 RltYOSTKGaLjUapocP1Qea175DHkFdmjFt+2Sg7wczfm3eQQkertkspvipTx9GFfUh
	 BbAyBN5NXGgwD0zCczHqHYHODVGkvMLuq4JeT1rA=
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
Subject: [PATCH v2 10/12] hwmon: (oxp-sensors) Adhere to sysfs-class-hwmon and
 enable pwm on 2
Date: Sat, 22 Feb 2025 17:18:21 +0100
Message-ID: <20250222161824.172511-11-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222161824.172511-1-lkml@antheas.dev>
References: <20250222161824.172511-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174024124164.14122.6389862011996770598@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Currently, the driver does not adhere to the sysfs-class-hwmon
specification: 0 is used for auto fan control and 1 is used for manual
control. However, it is expected that 0 sets the fan to full speed,
1 sets the fan to manual, and then 2 is used for automatic control.

Therefore, change the sysfs API to reflect this and enable pwm on 2.

As we are breaking the ABI for this driver, rename oxpec to oxp_ec,
reflecting the naming convention used by other drivers, to allow for
a smooth migration in current userspace programs.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hwmon/oxp-sensors.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index a9332312b2b1..b5ba863a762a 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -934,7 +934,27 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 		case hwmon_pwm_input:
 			return oxp_pwm_input_read(val);
 		case hwmon_pwm_enable:
-			return oxp_pwm_read(val);
+			ret = oxp_pwm_read(val);
+			if (ret)
+				return ret;
+
+			/* Check for auto and return 2 */
+			if (!*val) {
+				*val = 2;
+				return 0;
+			}
+
+			/* Return 0 if at full fan speed, 1 otherwise */
+			ret = oxp_pwm_fan_speed(val);
+			if (ret)
+				return ret;
+
+			if (*val == 255)
+				*val = 0;
+			else
+				*val = 1;
+
+			return 0;
 		default:
 			break;
 		}
@@ -948,15 +968,24 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long val)
 {
+	int ret;
+
 	switch (type) {
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_enable:
 			if (val == 1)
 				return oxp_pwm_enable();
-			else if (val == 0)
+			else if (val == 2)
 				return oxp_pwm_disable();
-			return -EINVAL;
+			else if (val != 0)
+				return -EINVAL;
+
+			/* Enable PWM and set to max speed */
+			ret = oxp_pwm_enable();
+			if (ret)
+				return ret;
+			return oxp_pwm_input_write(255);
 		case hwmon_pwm_input:
 			return oxp_pwm_input_write(val);
 		default:
@@ -1021,7 +1050,7 @@ static int oxp_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device *hwdev;
 
-	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
+	hwdev = devm_hwmon_device_register_with_info(dev, "oxp_ec", NULL,
 						     &oxp_ec_chip_info, NULL);
 
 	return PTR_ERR_OR_ZERO(hwdev);
-- 
2.48.1



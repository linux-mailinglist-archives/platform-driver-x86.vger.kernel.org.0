Return-Path: <platform-driver-x86+bounces-10487-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71DA6C9A3
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Mar 2025 11:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F344888041A
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Mar 2025 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B49B22F38B;
	Sat, 22 Mar 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="qK3aLizd"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD71F9F7A;
	Sat, 22 Mar 2025 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742639795; cv=none; b=sSZQykLYbRtBux2qbCmCKu1JaaQGzLuZZsolkdD8ygJws8WgXAsJdphCFdBb/bNaBIkrq2vn0cFvwWmREXHzbuMSKpM9lETDGqW86IuwTnRv6pr7pbxW7Gzd2CvosbVCjFNB2XfnUdYsqGQfVKyCoyLVaarilkNNW8fygnaboak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742639795; c=relaxed/simple;
	bh=EigFDMGdUKKrAh4/zpkWPSoscA6iCKzoPAPPwfiSFuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVc3awElj1diwjngn8ysV100xO48zPHORsDue+Tt6Em8Y3+pc42ZAKmT/XkvKaJyuFrXX7Et8JB80QGZl79t7UkTYNvmXkJgGt1e3mQAHbULt6Uf5IaA/+QUhTXiVNoWGVXr6su/CTyLAaGvxFm+ymmvMUqTyYVkNbw9lhQMPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=qK3aLizd; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 76FD72E08CCA;
	Sat, 22 Mar 2025 12:36:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742639791;
	bh=gyX1jh0TtSMzd5IAFmuOtj15rpr5lch7dusUXU0H4OA=; h=From:To:Subject;
	b=qK3aLizdk0X/0nF04NPz7ZgWfcuPDf1zyvwWLiOo4TPQ4Rc0vNvx90aHqEn0PpJKh
	 lwP8CjXfdjfgqE1LgNw8H8oRJ1D7w5TTt9TwTV0SVAb7sFQQMWOANZBVDONg6t1b3W
	 IPYGiUgO15fNy+2mMPnq2zdg8WJCXf+BCVxYkSWg=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joaquin Ignacio Aramendia <samsagax@gmail.com>,
	Derek J Clark <derekjohn.clark@gmail.com>,
	Kevin Greenberg <kdgreenberg234@protonmail.com>,
	Joshua Tam <csinaction@pm.me>,
	Parth Menon <parthasarathymenon@gmail.com>,
	Eileen <eileen@one-netbook.com>,
	linux-kernel@vger.kernel.org,
	sre@kernel.org,
	linux@weissschuh.net,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	mario.limonciello@amd.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v8 09/14] platform/x86: oxpec: Move pwm value read/write to
 separate functions
Date: Sat, 22 Mar 2025 11:36:01 +0100
Message-ID: <20250322103606.680401-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250322103606.680401-1-lkml@antheas.dev>
References: <20250322103606.680401-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174263979106.11693.10811701189419207842@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Currently, this driver breaks hwmon ABI by using auto as 0 and manual
as 1. However, for pwm_enable, 0 is full speed, 1 is manual, and 2 is
auto. For the correction to be possible, this means that the pwm_enable
endpoint will need access to both pwm enable and value (as for
the 0th value, the fan needs to be set to full power).

Therefore, move the pwm value read/write to separate functions.

Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 162 +++++++++++++++++++----------------
 1 file changed, 87 insertions(+), 75 deletions(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 2f31490fde64c..67bfd397802d1 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -599,6 +599,91 @@ static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
 	}
 }
 
+/* PWM input read/write functions */
+static int oxp_pwm_input_write(long val)
+{
+	if (val < 0 || val > 255)
+		return -EINVAL;
+	switch (board) {
+	case orange_pi_neo:
+		/* scale to range [1-244] */
+		val = ((val - 1) * 243 / 254) + 1;
+		return write_to_ec(ORANGEPI_SENSOR_PWM_REG, val);
+	case oxp_2:
+	case oxp_x1:
+		/* scale to range [0-184] */
+		val = (val * 184) / 255;
+		return write_to_ec(OXP_SENSOR_PWM_REG, val);
+	case aya_neo_2:
+	case aya_neo_air:
+	case aya_neo_air_1s:
+	case aya_neo_air_plus_mendo:
+	case aya_neo_air_pro:
+	case aya_neo_flip:
+	case aya_neo_geek:
+	case aya_neo_kun:
+	case oxp_mini_amd:
+	case oxp_mini_amd_a07:
+		/* scale to range [0-100] */
+		val = (val * 100) / 255;
+		return write_to_ec(OXP_SENSOR_PWM_REG, val);
+	case aok_zoe_a1:
+	case oxp_fly:
+	case oxp_mini_amd_pro:
+		return write_to_ec(OXP_SENSOR_PWM_REG, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int oxp_pwm_input_read(long *val)
+{
+	int ret;
+
+	switch (board) {
+	case orange_pi_neo:
+		ret = read_from_ec(ORANGEPI_SENSOR_PWM_REG, 1, val);
+		if (ret)
+			return ret;
+		/* scale from range [1-244] */
+		*val = ((*val - 1) * 254 / 243) + 1;
+		break;
+	case oxp_2:
+	case oxp_x1:
+		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
+		if (ret)
+			return ret;
+		/* scale from range [0-184] */
+		*val = (*val * 255) / 184;
+		break;
+	case aya_neo_2:
+	case aya_neo_air:
+	case aya_neo_air_1s:
+	case aya_neo_air_plus_mendo:
+	case aya_neo_air_pro:
+	case aya_neo_flip:
+	case aya_neo_geek:
+	case aya_neo_kun:
+	case oxp_mini_amd:
+	case oxp_mini_amd_a07:
+		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
+		if (ret)
+			return ret;
+		/* scale from range [0-100] */
+		*val = (*val * 255) / 100;
+		break;
+	case aok_zoe_a1:
+	case oxp_fly:
+	case oxp_mini_amd_pro:
+	default:
+		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
+		if (ret)
+			return ret;
+		break;
+	}
+	return 0;
+}
+
 static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 			     u32 attr, int channel, long *val)
 {
@@ -639,48 +724,7 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_input:
-			switch (board) {
-			case orange_pi_neo:
-				ret = read_from_ec(ORANGEPI_SENSOR_PWM_REG, 1, val);
-				if (ret)
-					return ret;
-				/* scale from range [1-244] */
-				*val = ((*val - 1) * 254 / 243) + 1;
-				break;
-			case oxp_2:
-			case oxp_x1:
-				ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
-				if (ret)
-					return ret;
-				/* scale from range [0-184] */
-				*val = (*val * 255) / 184;
-				break;
-			case aya_neo_2:
-			case aya_neo_air:
-			case aya_neo_air_1s:
-			case aya_neo_air_plus_mendo:
-			case aya_neo_air_pro:
-			case aya_neo_flip:
-			case aya_neo_geek:
-			case aya_neo_kun:
-			case oxp_mini_amd:
-			case oxp_mini_amd_a07:
-				ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
-				if (ret)
-					return ret;
-				/* scale from range [0-100] */
-				*val = (*val * 255) / 100;
-				break;
-			case aok_zoe_a1:
-			case oxp_fly:
-			case oxp_mini_amd_pro:
-			default:
-				ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
-				if (ret)
-					return ret;
-				break;
-			}
-			return 0;
+			return oxp_pwm_input_read(val);
 		case hwmon_pwm_enable:
 			return oxp_pwm_read(val);
 		default:
@@ -706,39 +750,7 @@ static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
 				return oxp_pwm_disable();
 			return -EINVAL;
 		case hwmon_pwm_input:
-			if (val < 0 || val > 255)
-				return -EINVAL;
-			switch (board) {
-			case orange_pi_neo:
-				/* scale to range [1-244] */
-				val = ((val - 1) * 243 / 254) + 1;
-				return write_to_ec(ORANGEPI_SENSOR_PWM_REG, val);
-			case oxp_2:
-			case oxp_x1:
-				/* scale to range [0-184] */
-				val = (val * 184) / 255;
-				return write_to_ec(OXP_SENSOR_PWM_REG, val);
-			case aya_neo_2:
-			case aya_neo_air:
-			case aya_neo_air_1s:
-			case aya_neo_air_plus_mendo:
-			case aya_neo_air_pro:
-			case aya_neo_flip:
-			case aya_neo_geek:
-			case aya_neo_kun:
-			case oxp_mini_amd:
-			case oxp_mini_amd_a07:
-				/* scale to range [0-100] */
-				val = (val * 100) / 255;
-				return write_to_ec(OXP_SENSOR_PWM_REG, val);
-			case aok_zoe_a1:
-			case oxp_fly:
-			case oxp_mini_amd_pro:
-				return write_to_ec(OXP_SENSOR_PWM_REG, val);
-			default:
-				break;
-			}
-			break;
+			return oxp_pwm_input_write(val);
 		default:
 			break;
 		}
-- 
2.48.1



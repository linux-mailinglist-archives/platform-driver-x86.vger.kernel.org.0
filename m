Return-Path: <platform-driver-x86+bounces-10114-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F12A5CB57
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Mar 2025 17:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8346D17BF35
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Mar 2025 16:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBE826139C;
	Tue, 11 Mar 2025 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="kYmnKcSZ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30141260A45;
	Tue, 11 Mar 2025 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741712073; cv=none; b=WvMGrZBeXgImzC7j1CQlGCHNaeFUf5Zct+2bCKcnNvP2tIASFcG2/nhrIdQHFuYh9gVgsA87/dgbS9cYxMx5/IY82g8rUamm4ezXs8kwUAm/10pW41A5prFExVhSDSUXci3aq8sJbFyHejScO3Ldv1u91wo8uZ1+JnM49kQSv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741712073; c=relaxed/simple;
	bh=WDazQlhRfZp95eow+bDfqAHhnY6otoyeSChs+O5/12c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGYpPrmmjUMsIgVEdvemZP4M2S5Laea0hEpPNeu/eE8cGTZIM6s2UGfkpbt0tDQJ8j2V7h5lT0YBhdOH5GqsTBNC6PpYQNWsmpBHH3wijPtoyh79h/d6O9KFJJcGtGhJMl04LnwVHnGe8U/X1YHeO7P/+nX/8f89VgeFaAqTv8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=kYmnKcSZ; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 0A1662E0922E;
	Tue, 11 Mar 2025 18:54:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1741712069;
	bh=OvoYtbYG7ah1UxSadas98AIe7sBqNDpSmQ4J+d+MHew=; h=From:To:Subject;
	b=kYmnKcSZkWB8157g2itVhGKzEJXr6BFJp7bQk5EZ3lli2mn9xR41KqVD60pGAiAjT
	 0mgNjYC0BWlAF1FzUm3LGUQMqY5OvqVI4C04wwsU9O0bW75dFOMFNfl5f2mjodhB1D
	 jORQvrJLwUKszSMw7/t8CwN8ZOJbDVv+Cpdy4fP4=
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
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v4 10/13] platform/x86: oxpec: Move pwm value read/write to
 separate functions
Date: Tue, 11 Mar 2025 17:54:02 +0100
Message-ID: <20250311165406.331046-11-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311165406.331046-1-lkml@antheas.dev>
References: <20250311165406.331046-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174171206825.19961.6580630023410387442@linux1587.grserver.gr>
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
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 162 +++++++++++++++++++----------------
 1 file changed, 87 insertions(+), 75 deletions(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 31c7d0041492..f0e70205ad19 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -806,6 +806,91 @@ static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
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
@@ -846,48 +931,7 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -913,39 +957,7 @@ static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
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



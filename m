Return-Path: <platform-driver-x86+bounces-9660-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18BA409E4
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Feb 2025 17:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C1D8189C41A
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Feb 2025 16:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D491F7092;
	Sat, 22 Feb 2025 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="RLUv/CbM"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21F190468;
	Sat, 22 Feb 2025 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740241240; cv=none; b=sum1qatdsmHI6QkKBK7/Vtq9wzht4QzsItXxIhHc7kgDaB62dk1a1+djyXMqBvTDur8ayOPsphXVSxJA0n7Fu4ubmAjqLwoLNSuvkQWprfrXbzcA3VdGhfKw98zi1zotleP4NG2mzP29NBVB9ckPeLu4AqWhIJBsgrWBkraLtt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740241240; c=relaxed/simple;
	bh=u42XE/bZRm00F2EsLFDQKgKk9ogxHYpt4wTubHuLkn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CGtpI+ITITBjoMiJKKR7sZHLhG8PZ0Aj03r7puCqsgP6JEsQlmisJqNPKvSXRdkXypYJ7RNgs//yGj1E0bZ+2S1oaXx3e2BfwFHdqGaFw3UhTDoruvoTQARzOnkD+cronP6xU4URnyEtVAfh2Cv4jKXk1FSj2i2k+jYjCafBg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=RLUv/CbM; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 0C38B2E08C3D;
	Sat, 22 Feb 2025 18:20:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740241234;
	bh=KeMqyBaVWbZx61DnT63Z+1iDimz2+bstoLs9ZuwiSr4=; h=From:To:Subject;
	b=RLUv/CbM9F60lpCFV4ArA3/wEmO1DPE/RqMrAKc5bWkKIhci8tEUtC8UbfUYhHRUU
	 gTqVUKaY0S8LJ/a67RqZRo9kFqnp8MxsSl8L8eOgj1VmhEUO0KhXmzcNYo9JCJUUc7
	 krXSEmcEyKOKhcA2CtmW6KCTNmn/xZj5jlZ0YTiA=
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
Subject: [PATCH v2 06/12] hwmon: (oxp-sensors) Add turbo led support to X1
 devices
Date: Sat, 22 Feb 2025 17:18:17 +0100
Message-ID: <20250222161824.172511-7-lkml@antheas.dev>
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
 <174024123436.13877.15976266649933873000@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The X1 and X1 mini lineups feature an LED nested within their turbo
button. When turbo takeover is not enabled, the turbo button allows
the device to switch from 18W to 25W TDP. When the device is in the
25W TDP mode, the LED is turned on.

However, when we engage turbo takeover, the turbo led remains on its
last state, which might be illuminated and cannot be currently
controlled. Therefore, add the register that controls it under sysfs,
to allow userspace to turn it off once engaging turbo takeover and
then control it as they wish.

As part of researching this topic, I verified that other OneXPlayer
devices do not have a turbo led, which makes this feature only
applicable to X1 and X1 mini devices.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hwmon/oxp-sensors.c | 84 +++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index 1c01636582d7..9c43ec0fc994 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -101,6 +101,12 @@ static enum oxp_board board;
  */
 #define OXP_X1_CHARGE_BYPASS_MASK_S3S5 0x02
 
+/* X1 Turbo LED */
+#define OXP_X1_TURBO_LED_REG           0x57
+
+#define OXP_X1_TURBO_LED_OFF           0x01
+#define OXP_X1_TURBO_LED_ON            0x02
+
 enum charge_type_value_index {
 	CT_OFF,
 	CT_S0,
@@ -466,6 +472,73 @@ static ssize_t tt_toggle_show(struct device *dev,
 
 static DEVICE_ATTR_RW(tt_toggle);
 
+/* Callbacks for turbo toggle attribute */
+static umode_t tt_led_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
+{
+	switch (board) {
+	case oxp_x1:
+		return attr->mode;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static ssize_t tt_led_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	u8 reg, val;
+	int rval;
+	bool value;
+
+	rval = kstrtobool(buf, &value);
+	if (rval)
+		return rval;
+
+	switch (board) {
+	case oxp_x1:
+		reg = OXP_X1_TURBO_LED_REG;
+		val = value ? OXP_X1_TURBO_LED_ON : OXP_X1_TURBO_LED_OFF;
+		break;
+	default:
+		return -EINVAL;
+	}
+	rval = write_to_ec(reg, val);
+
+	if (rval)
+		return rval;
+
+	return count;
+}
+
+static ssize_t tt_led_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	int retval;
+	u8 reg;
+	long enval;
+	long val;
+
+	switch (board) {
+	case oxp_x1:
+		reg = OXP_2_TURBO_SWITCH_REG;
+		enval = OXP_X1_TURBO_LED_ON;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	retval = read_from_ec(reg, 1, &val);
+	if (retval)
+		return retval;
+
+	return sysfs_emit(buf, "%d\n", val == enval);
+}
+
+static DEVICE_ATTR_RW(tt_led);
+
 /* Callbacks for turbo toggle attribute */
 static bool charge_control_supported(void)
 {
@@ -894,8 +967,19 @@ static struct attribute_group oxp_tt_toggle_attribute_group = {
 	.attrs = oxp_tt_toggle_attrs,
 };
 
+static struct attribute *oxp_tt_led_attrs[] = {
+	&dev_attr_tt_led.attr,
+	NULL
+};
+
+static struct attribute_group oxp_tt_led_attribute_group = {
+	.is_visible = tt_led_is_visible,
+	.attrs = oxp_tt_led_attrs,
+};
+
 static const struct attribute_group *oxp_ec_groups[] = {
 	&oxp_tt_toggle_attribute_group,
+	&oxp_tt_led_attribute_group,
 	NULL
 };
 
-- 
2.48.1



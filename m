Return-Path: <platform-driver-x86+bounces-13518-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894DB12C4C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Jul 2025 22:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F69017E501
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Jul 2025 20:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3B928A70A;
	Sat, 26 Jul 2025 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKXAlfBm"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2C289802;
	Sat, 26 Jul 2025 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753562453; cv=none; b=fROXjoNP2v4+GpMTAIXgWvpJb2I2D6ZRMK0CHSrxg+czklDljwdEM5smcnqdbF8w4IMyf8PGhjIX1yFMj9ehciNx4J+L+8DuoR/xNj7IqgWhV5TbV2jBCwZ+fl8662IlZOSv3nomxAF8roHvw7zga0nyb3xY8O35KZA0OiRIWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753562453; c=relaxed/simple;
	bh=v1Htla8DdqHofygRD1HT9Xzu+Qm42ioKnabPdsoKMa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtNfIUm8Js2b4nnesflSPmLTnc1Vy6/Jr3335jrSulv391kuNQnr3k7AlRdPLxiXooyHkQlkCP47LO0tkQce50rQySEZFP1wDrxRI7v8fltqxxANiiX4HaLttaLCRkvhhnJmu4VcHh03BEmxNV1rdk10iM9ZFXYJvKAPhA2uTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKXAlfBm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313a188174fso3382423a91.1;
        Sat, 26 Jul 2025 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753562450; x=1754167250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9B+o1C+e4Ggr+NPOFbsgYgyM0Nxp9h9VhXkWaGTcOo=;
        b=ZKXAlfBmkjVv67ChyfMpMocyS1XJWguwPFkJ3sKZP+rEgeKaASdUi4Rie3SilsUIIJ
         RhZzP3W0ezYyvaXWpTaKKL/I4encQcfk6LhoNTZ8VR7/Lsf5y+6C3TjLdCIeY9KsttPK
         D8vLPcoaZlCLVpQ6UIQMAD+eT6um16JAnK7oyLsyj+kFuUhA3yP4KMVugJ5B8gyUyWta
         DAxy1GHMLik2+L2TWhy0khbPF4U1PSqbQmerFJtKoETAJB8UZgo0XaVKG/66dxhfIZwF
         ZRW2qYSZHra5hoxjjlaZIPIocEjFhhT/VSICmvJ9FHIEuaY0KENPvZ8uv1TbkEpqoNQR
         MmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753562450; x=1754167250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9B+o1C+e4Ggr+NPOFbsgYgyM0Nxp9h9VhXkWaGTcOo=;
        b=VSVC3MeItJLTev9epRRRdOx+bBbgr7F/hrSxr4xk54f9tZ5xM5mMsXV8DQN1B7qQMu
         aNmCMIHbTfh804ZuYygynrjQy9KcOt6hNkUH7oF4QQaOfKPYWtGGp1Fv0KWSkIb8Jthp
         f+tWdWjrSKHixYWSRWYM63bK6Q28Fel5wN8XSVohO0M5tVkBCzlAy4wGvzIl66w8BfM5
         mvEbXxfrUPvWpanbYlDOgGwcCbZWMwggW8jRP96f+UILFtm8v5n1T9IGshHosKXzCXAi
         RlvOWousVzV+45IysjDIYvx/4Yuf7XuGZG9oHbLet5xhdnseh/D7cnGdtGnWdP4xmXzF
         l6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUnM+WCG2K1Ie24AWDH+atieZvJx2pqAFu0DTdWtr2gttlqY27q2MVIlkIt7AiNInsWocTrzFubCnzzrfnq@vger.kernel.org, AJvYcCVbLzQ6WUhp42UAT1JdFQFOBJBH2ww7HxaxV29bRkmc3w0mJwga3pRahLvvskUCHVkzQtpCOKx5waI=@vger.kernel.org, AJvYcCWLVUZueDel2hA/gVEbyMhVhAAYkttvxV696wk2Vd8ScCPQsOjyNFrIpNqhED2NIj7UXZXEJw/UIpF7xaM=@vger.kernel.org, AJvYcCXUBF8MRBa3hQGC+2eauO+4I5mZbJ8ZECB9owYviVVzAd1/ToyUqoTVBIdPjnWHxYfJCYoe3uleYsUxJdb450OshFIeEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwaCpjo/H3sYAIJPwuhCCL4E3pQwk1eU+5MZ1k6AOShnR1FIXS
	TvNPE+DxQ1zXShyfueuMT+5Kgxqg1ZzVU+iVhmdCDjqSb0hmWyg8xEJuZ9C9yQ==
X-Gm-Gg: ASbGncv+fEUCh3JA6ysn8fg3u82znWeSkO0IOfevdqvXgjpPPGLQeKCZ/IzPtbNSwoz
	DEHVRX2U/NFUywi4n9L2Ul/2GfFnncgU1IC2blao4uXM+k1q9XL5tg3TgbUDMiCtYqs8wyksBUM
	hFxtdUWIaoCZncff9PMKnG+CYOr4Xnta4MQzbx7DLkQ/POkUYXUAovqBMbzj0tqxFQQeSnqmn+Z
	hetrnYX9eVYEdMO9S/6KKyJ2fA7YQxpP1GgUfvwFs6cKJ8NjkZ8HkpDg3KE6bMvMkLV+eyWdDLp
	Q7c7z0STZLCqKs29A57ZIdRBr5nrHymy8LRRDo55R2zW3eZOORJOvkeYSVGMEiVUMnV9Fd01x5M
	vofvxpbkRhhn1T2sZ6lFqM8wTHPj1sBn4/WEwmT8qV06IAkKrKopqDPyIvPMjZnGtv2erKvcG5f
	REzA==
X-Google-Smtp-Source: AGHT+IHXW6NNkdTOWDwD1VOKEjtc2L+gA3ER179eOVlsSnxLqG34Nyt5i8ZSSuOVuJ062JcXrKwZNw==
X-Received: by 2002:a17:90a:e7ce:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-31e765d1630mr9655839a91.6.1753562450090;
        Sat, 26 Jul 2025 13:40:50 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e8ea37b21sm1905640a91.22.2025.07.26.13.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 13:40:49 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	David Box <david.e.box@linux.intel.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 3/4] platform/x86: (ayn-ec) Add RGB Interface
Date: Sat, 26 Jul 2025 13:40:40 -0700
Message-ID: <20250726204041.516440-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726204041.516440-1-derekjohn.clark@gmail.com>
References: <20250726204041.516440-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an EC controlled LED Multicolor Class Device for controlling the
RGB rings around the joysticks.

The EC provides a single register for each of the colors red, green, and
blue, as well as a mode switching register. The EC accepts values
[0-255] for all colors. There are two available effects: breathe, which is
the default when the device is started, and monocolor. When resuming from
sleep the user selected effect will be overwritten by the EC, so the
driver retains the last setting and resets on resume. When setting a
color, each color register is set before a final "write" code is sent to
the device. The EC may briefly reflect the "write" code when writing, but
quickly changes to the "monocolor" value once complete. The driver
interprets both of these values as "monocolor" in _show to simplify the
sysfs exposed to the user.

Two custom attributes are added to the standard LED parent device:
effect, a RW file descriptor used to set the effect, and effect_index,
which enumerates the available valid options.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/Kconfig  |   3 +
 drivers/platform/x86/ayn-ec.c | 285 ++++++++++++++++++++++++++++++++++
 2 files changed, 288 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4819bfcffb6b..85dfb88cca6f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -308,6 +308,9 @@ config AYN_EC
 	tristate "AYN x86 devices EC platform control"
 	depends on ACPI
 	depends on HWMON
+	depends on NEW_LEDS
+	select LEDS_CLASS
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This is a driver for AYN and Tectoy x86 handheld devices. It provides
 	  temperature monitoring, manual fan speed control, fan curve control,
diff --git a/drivers/platform/x86/ayn-ec.c b/drivers/platform/x86/ayn-ec.c
index 466cc33adcb0..25f748d7db18 100644
--- a/drivers/platform/x86/ayn-ec.c
+++ b/drivers/platform/x86/ayn-ec.c
@@ -28,6 +28,8 @@
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
@@ -68,6 +70,16 @@
 #define AYN_SENSOR_PROC_TEMP_REG	0x09 /* CPU Core */
 #define AYN_SENSOR_VCORE_TEMP_REG	0x08 /* vCore */
 
+/* EC Controlled RGB registers */
+#define AYN_LED_MC_RED_REG	0xB0 /* Range 0x00-0xFF */
+#define AYN_LED_MC_GREEN_REG	0xB1 /* Range 0x00-0xFF */
+#define AYN_LED_MC_BLUE_REG	0xB2 /* Range 0x00-0xFF */
+#define AYN_RGB_EFFECT_REG	0xB3
+
+/* RGB effect modes */
+#define AYN_RGB_EFFECT_BREATHE		0x00
+#define AYN_RGB_EFFECT_MONOCOLOR	0x55
+#define AYN_RGB_EFFECT_WRITE		0xAA
 
 /* Handle ACPI lock mechanism */
 #define ACPI_LOCK_DELAY_MS 500
@@ -86,7 +98,9 @@ int ayn_pwm_curve_registers[10] = {
 };
 
 struct ayn_device {
+	struct led_classdev *led_cdev;
 	u32 ayn_lock; /* ACPI EC Lock */
+	u8 rgb_effect;
 } drvdata;
 
 struct thermal_sensor {
@@ -103,6 +117,33 @@ static struct thermal_sensor thermal_sensors[] = {
 	{}
 };
 
+#define DEVICE_ATTR_RW_NAMED(_name, _attrname)               \
+	struct device_attribute dev_attr_##_name = {         \
+		.attr = { .name = _attrname, .mode = 0644 }, \
+		.show = _name##_show,                        \
+		.store = _name##_store,                      \
+	}
+
+#define DEVICE_ATTR_RO_NAMED(_name, _attrname)               \
+	struct device_attribute dev_attr_##_name = {         \
+		.attr = { .name = _attrname, .mode = 0444 }, \
+		.show = _name##_show,                        \
+	}
+
+/* Handle ACPI lock mechanism */
+#define ACPI_LOCK_DELAY_MS 500
+
+/* RGB effect values */
+enum RGB_EFFECT_OPTION {
+	BREATHE,
+	MONOCOLOR,
+};
+
+static const char *const RGB_EFFECT_TEXT[] = {
+	[BREATHE] = "breathe",
+	[MONOCOLOR] = "monocolor",
+};
+
 static bool lock_global_acpi_lock(void)
 {
 	return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
@@ -528,10 +569,253 @@ static struct attribute *ayn_sensors_attrs[] = {
 
 ATTRIBUTE_GROUPS(ayn_sensors);
 
+/**
+ * rgb_effect_write() - Set the RGB effect stored in drvdata.rgb_effect.
+ */
+static int rgb_effect_write(void)
+{
+	return write_to_ec(AYN_RGB_EFFECT_REG, drvdata.rgb_effect);
+};
+
+/**
+ * rgb_effect_read() - Read the RGB effect and store it in drvdata.rgb_effect.
+ */
+static int rgb_effect_read(void)
+{
+	int ret;
+	long effect;
+
+	ret = read_from_ec(AYN_RGB_EFFECT_REG, 1, &effect);
+	if (ret)
+		return ret;
+
+	switch (effect) {
+	case AYN_RGB_EFFECT_WRITE:
+	case AYN_RGB_EFFECT_MONOCOLOR:
+		drvdata.rgb_effect = AYN_RGB_EFFECT_WRITE;
+		break;
+	default:
+		drvdata.rgb_effect = AYN_RGB_EFFECT_BREATHE;
+	}
+
+	return 0;
+}
+
+/**
+ * rgb_effect_store() - Store the given RGB effect and set it.
+ *
+ * @dev: parent device of the given attribute.
+ * @attr: The attribute to write to.
+ * @buf: Input value string from sysfs write.
+ * @count: The number of bytes written.
+ *
+ * Return: The number of bytes written, or an error.
+ */
+static ssize_t rgb_effect_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	int ret;
+
+	ret = sysfs_match_string(RGB_EFFECT_TEXT, buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		drvdata.rgb_effect = AYN_RGB_EFFECT_WRITE;
+	else
+		drvdata.rgb_effect = AYN_RGB_EFFECT_BREATHE;
+
+	ret = rgb_effect_write();
+	if (ret)
+		return ret;
+
+	return count;
+};
+
+/**
+ * rgb_effect_show() - Read the current RGB effect.
+ *
+ * @dev: parent device of the given attribute.
+ * @attr: The attribute to read.
+ * @buf: Buffer to read to.
+ *
+ * Return: The number of bytes read, or an error.
+ */
+static ssize_t rgb_effect_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int ret, i;
+
+	ret = rgb_effect_read();
+	if (ret)
+		return ret;
+
+	switch (drvdata.rgb_effect) {
+	case AYN_RGB_EFFECT_WRITE:
+	case AYN_RGB_EFFECT_MONOCOLOR:
+		i = MONOCOLOR;
+		break;
+	default:
+		i = BREATHE;
+		break;
+	}
+
+	return sysfs_emit(buf, "%s\n", RGB_EFFECT_TEXT[i]);
+};
+
+static DEVICE_ATTR_RW_NAMED(rgb_effect, "effect");
+
+/**
+ * rgb_effect_show() - Display the RGB effects available.
+ *
+ * @dev: parent device of the given attribute.
+ * @attr: The attribute to read.
+ * @buf: Buffer to read to.
+ *
+ * Return: The number of bytes read, or an error.
+ */
+static ssize_t rgb_effect_index_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(RGB_EFFECT_TEXT); i++)
+		count += sysfs_emit_at(buf, count, "%s ", RGB_EFFECT_TEXT[i]);
+
+	buf[count - 1] = '\n';
+
+	return count;
+}
+
+static DEVICE_ATTR_RO_NAMED(rgb_effect_index, "effect_index");
+
+/**
+ * ayn_led_mc_brightness_set() - Write the brightness for the RGB LED.
+ *
+ * @led_cdev: Parent LED device for the led_classdev_mc.
+ * @brightness: Brightness value to write [0-255].
+ */
+static void ayn_led_mc_brightness_set(struct led_classdev *led_cdev,
+				      enum led_brightness brightness)
+{
+	struct led_classdev_mc *led_cdev_mc = lcdev_to_mccdev(led_cdev);
+	struct mc_subled s_led;
+	int i, ret, val;
+
+	switch (drvdata.rgb_effect) {
+	case AYN_RGB_EFFECT_WRITE:
+	case AYN_RGB_EFFECT_MONOCOLOR:
+		break;
+	case AYN_RGB_EFFECT_BREATHE:
+		return;
+	}
+
+	led_cdev->brightness = brightness;
+	for (i = 0; i < led_cdev_mc->num_colors; i++) {
+		s_led = led_cdev_mc->subled_info[i];
+		val = brightness * s_led.intensity / led_cdev->max_brightness;
+		ret = write_to_ec(s_led.channel, val);
+		if (ret) {
+			dev_err(led_cdev->dev,
+				"Error setting brightness:  %d\n", ret);
+			return;
+		}
+	}
+
+	/* Must write mode again to change to set color */
+	write_to_ec(AYN_RGB_EFFECT_REG, AYN_RGB_EFFECT_WRITE);
+};
+
+/**
+ * ayn_led_mc_brightness_get() - Get the brightness for the RGB LED.
+ *
+ * @led_cdev: Parent LED device for the led_classdev_mc.
+ *
+ * Return: Current brightness.
+ */
+static enum led_brightness ayn_led_mc_brightness_get(struct led_classdev *led_cdev)
+{
+	return led_cdev->brightness;
+};
+
+static struct attribute *ayn_led_mc_attrs[] = {
+	&dev_attr_rgb_effect.attr,
+	&dev_attr_rgb_effect_index.attr,
+	NULL,
+};
+
+static struct attribute_group ayn_led_mc_group = {
+	.attrs = ayn_led_mc_attrs,
+};
+
+struct mc_subled ayn_led_mc_subled_info[] = {
+	{
+		.color_index = LED_COLOR_ID_RED,
+		.brightness = 0,
+		.intensity = 0,
+		.channel = AYN_LED_MC_RED_REG,
+	},
+	{
+		.color_index = LED_COLOR_ID_GREEN,
+		.brightness = 0,
+		.intensity = 0,
+		.channel = AYN_LED_MC_GREEN_REG,
+	},
+	{
+		.color_index = LED_COLOR_ID_BLUE,
+		.brightness = 0,
+		.intensity = 0,
+		.channel = AYN_LED_MC_BLUE_REG,
+	},
+};
+
+struct led_classdev_mc ayn_led_mc = {
+	.led_cdev = {
+		.name = "ayn:rgb:joystick_rings",
+		.brightness = 0,
+		.max_brightness = 255,
+		.brightness_set = ayn_led_mc_brightness_set,
+		.brightness_get = ayn_led_mc_brightness_get,
+		.color = LED_COLOR_ID_RGB,
+	},
+	.num_colors = ARRAY_SIZE(ayn_led_mc_subled_info),
+	.subled_info = ayn_led_mc_subled_info,
+};
+
+static int ayn_ec_resume(struct platform_device *pdev)
+{
+	struct led_classdev *led_cdev = drvdata.led_cdev;
+	int ret;
+
+	ret = rgb_effect_write();
+	if (ret)
+		return ret;
+
+	ayn_led_mc_brightness_set(led_cdev, led_cdev->brightness);
+
+	return 0;
+}
+
 static int ayn_ec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device *hwdev;
+	int ret;
+
+	ret = devm_led_classdev_multicolor_register(dev, &ayn_led_mc);
+	if (ret)
+		return ret;
+
+	ret = devm_device_add_group(ayn_led_mc.led_cdev.dev, &ayn_led_mc_group);
+	if (ret)
+		return ret;
+
+	drvdata.led_cdev = &ayn_led_mc.led_cdev;
+	ret = rgb_effect_read();
+	if (ret)
+		return ret;
 
 	hwdev = devm_hwmon_device_register_with_info(dev, "aynec", NULL,
 						     &ayn_ec_chip_info,
@@ -544,6 +828,7 @@ static struct platform_driver ayn_ec_driver = {
 		.name = "ayn-ec",
 	},
 	.probe = ayn_ec_probe,
+	.resume = ayn_ec_resume,
 };
 
 static struct platform_device *ayn_ec_device;
-- 
2.50.1



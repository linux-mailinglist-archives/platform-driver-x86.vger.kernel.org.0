Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4425325CB78
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Sep 2020 22:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgICUru (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Sep 2020 16:47:50 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58587 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728397AbgICUrs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Sep 2020 16:47:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id D1AEBCA9;
        Thu,  3 Sep 2020 16:47:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 03 Sep 2020 16:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=Pp5dHxt/j6f2hRvaZ5W/KY7QgUezm
        h0Xxsd8vNLtEp4=; b=QGGEd4Ksn6qpehO5pdbuISMXTpK6vkS0ZdxgkJwBIzpzA
        OZ1ZPiTG4Xu0EdjUPh51UNvPmtpkIDpKlbC8m6oHq8qa/4PL4fOT9yTF/eZymuWm
        2oe6ZS6kB2Maomr3bTVIORhN1OH7xHkEiGCPlYA1IOF7ElnpMGrlUexQCfBDZGH8
        kWipUZjCzmxCF2LRlSx47BnjQeZUh8JC8ibUiNTQEGgIIb/MmRmykfVQup+vrvm9
        aXsls0r81R2Pjf+k5/Xw2Ir0bndxXw6DQmrMjAF4rAk1xYImlEw6+7Vz0BWb+u0E
        EGh6b1Au7SiCvj8IQsQc7Z/XDIz3tlZy9wCKWieYQ==
X-ME-Sender: <xms:c1ZRXy4jGNOc4np1cCPAvSbowjaKbEWepFPD3_o9gOtF77pMqTGjXA>
    <xme:c1ZRX75qQCtJc2DGMHoInJRd5xGdvCKHyubpi2q5x_zoUY2ujIVl-paxDjzsu39R0
    FRsiszoaivqtY1GqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghmhies
    shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeduffevleduieffvefgte
    efgfehfeekjeejiefhgfdtgfeuvdevueehkeehgffgkeenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmjeeird
    gtohhm
X-ME-Proxy: <xmx:c1ZRXxd_3GywtkUaS677Yy0jYL02-nNUmdo5i0A1xi_ZFIxtKB3gng>
    <xmx:c1ZRX_IyKNRDvAh4Z9zBqoYl-8zttkySqX7kn93znVn-8nNIti9Svg>
    <xmx:c1ZRX2LhPoJI2Pp0I3O5cIDbzYuQrIJi030Iwkelo565KZnqDEHuaA>
    <xmx:c1ZRX1n303RNh_z9jXDmS2HSYaX5uzM6sQzU8wUT3fHCYvyNIkkIJw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0E88CE00F8; Thu,  3 Sep 2020 16:47:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
Date:   Thu, 03 Sep 2020 14:47:25 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
Subject: [PATCH 1/2] platform/x86: system76_acpi: Add hwmon driver
Content-Type: text/plain
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The hwmon driver provides a kernel interface for accessing fan duty
cycle, fan speed, and temperature data as defined by firmware. Up to
eight fans and eight temperature sensors are supported. The actual
number is determined by querying the firmware.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Cc: platform-driver-x86@vger.kernel.org
---
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 40219bba6801..d2f9c3dcf4b9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1158,6 +1158,7 @@ config SONYPI_COMPAT
 config SYSTEM76_ACPI
 	tristate "System76 ACPI Driver"
 	depends on ACPI
+	depends on HWMON
 	select NEW_LEDS
 	select LEDS_CLASS
 	select LEDS_TRIGGERS
diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index c14fd22ba196..aef0ea34829d 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -10,6 +10,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -24,6 +26,9 @@ struct system76_data {
 	enum led_brightness kb_brightness;
 	enum led_brightness kb_toggle_brightness;
 	int kb_color;
+	struct device *therm;
+	union acpi_object *nfan;
+	union acpi_object *ntmp;
 };
 
 static const struct acpi_device_id device_ids[] = {
@@ -68,6 +73,54 @@ static int system76_get(struct system76_data *data, char *method)
 		return -1;
 }
 
+// Get a System76 ACPI device value by name with index
+static int system76_get_index(struct system76_data *data, char *method, int index)
+{
+	union acpi_object obj;
+	struct acpi_object_list obj_list;
+	acpi_handle handle;
+	acpi_status status;
+	unsigned long long ret = 0;
+
+	obj.type = ACPI_TYPE_INTEGER;
+	obj.integer.value = index;
+	obj_list.count = 1;
+	obj_list.pointer = &obj;
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_integer(handle, method, &obj_list, &ret);
+	if (ACPI_SUCCESS(status))
+		return (int)ret;
+	else
+		return -1;
+}
+
+// Get a System76 ACPI device object by name
+static int system76_get_object(struct system76_data *data, char *method, union acpi_object **obj)
+{
+	acpi_handle handle;
+	acpi_status status;
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_object(handle, method, NULL, &buf);
+	if (ACPI_SUCCESS(status)) {
+		*obj = (union acpi_object *)buf.pointer;
+		return 0;
+	} else {
+		return -1;
+	}
+}
+
+// Get a name from a System76 ACPI device object
+static char *system76_name(union acpi_object *obj, int index)
+{
+	if (obj && obj->type == ACPI_TYPE_PACKAGE && index <= obj->package.count) {
+		if (obj->package.elements[index].type == ACPI_TYPE_STRING)
+			return obj->package.elements[index].string.pointer;
+	}
+	return NULL;
+}
+
 // Set a System76 ACPI device value by name
 static int system76_set(struct system76_data *data, char *method, int value)
 {
@@ -270,6 +323,120 @@ static void kb_led_hotkey_color(struct system76_data *data)
 	kb_led_notify(data);
 }
 
+static umode_t thermal_is_visible(
+	const void *drvdata,
+	enum hwmon_sensor_types type,
+	u32 attr,
+	int channel)
+{
+	const struct system76_data *data = drvdata;
+
+	if (type == hwmon_fan || type == hwmon_pwm) {
+		if (system76_name(data->nfan, channel))
+			return S_IRUGO;
+	} else if (type == hwmon_temp) {
+		if (system76_name(data->ntmp, channel))
+			return S_IRUGO;
+	}
+	return 0;
+}
+
+static int thermal_read(
+	struct device *dev,
+	enum hwmon_sensor_types type,
+	u32 attr,
+	int channel,
+	long *val)
+{
+	struct system76_data *data = dev_get_drvdata(dev);
+	int raw;
+
+	if (type == hwmon_fan && attr == hwmon_fan_input) {
+		raw = system76_get_index(data, "GFAN", channel);
+		if (raw >= 0) {
+			*val = (long)((raw >> 8) & 0xFFFF);
+			return 0;
+		}
+	} else if (type == hwmon_pwm && attr == hwmon_pwm_input) {
+		raw = system76_get_index(data, "GFAN", channel);
+		if (raw >= 0) {
+			*val = (long)(raw & 0xFF);
+			return 0;
+		}
+	} else if (type == hwmon_temp && attr == hwmon_temp_input) {
+		raw = system76_get_index(data, "GTMP", channel);
+		if (raw >= 0) {
+			*val = (long)(raw * 1000);
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
+static int thermal_read_string(
+	struct device *dev,
+	enum hwmon_sensor_types type,
+	u32 attr,
+	int channel,
+	const char **str)
+{
+	struct system76_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_fan && attr == hwmon_fan_label) {
+		*str = system76_name(data->nfan, channel);
+		if (*str)
+			return 0;
+	} else if (type == hwmon_temp && attr == hwmon_temp_label) {
+		*str = system76_name(data->ntmp, channel);
+		if (*str)
+			return 0;
+	}
+	return -EINVAL;
+}
+
+static const struct hwmon_ops thermal_ops = {
+	.is_visible = thermal_is_visible,
+	.read = thermal_read,
+	.read_string = thermal_read_string,
+};
+
+// Allocate up to 8 fans and temperatures
+static const struct hwmon_channel_info *thermal_channel_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(temp,
+			HWMON_T_INPUT | HWMON_T_LABEL,
+			HWMON_T_INPUT | HWMON_T_LABEL,
+			HWMON_T_INPUT | HWMON_T_LABEL,
+			HWMON_T_INPUT | HWMON_T_LABEL,
+			HWMON_T_INPUT | HWMON_T_LABEL,
+			HWMON_T_INPUT | HWMON_T_LABEL,
+			HWMON_T_INPUT | HWMON_T_LABEL,
+			HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info thermal_chip_info = {
+	.ops = &thermal_ops,
+	.info = thermal_channel_info,
+};
+
 // Handle ACPI notification
 static void system76_notify(struct acpi_device *acpi_dev, u32 event)
 {
@@ -346,6 +513,17 @@ static int system76_add(struct acpi_device *acpi_dev)
 			return err;
 	}
 
+	system76_get_object(data, "NFAN", &data->nfan);
+	system76_get_object(data, "NTMP", &data->ntmp);
+	data->therm = devm_hwmon_device_register_with_info(
+		&acpi_dev->dev,
+		"system76_acpi",
+		data,
+		&thermal_chip_info,
+		NULL);
+	if (IS_ERR(data->therm))
+		return PTR_ERR(data->therm);
+
 	return 0;
 }
 
@@ -362,6 +540,9 @@ static int system76_remove(struct acpi_device *acpi_dev)
 
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
 
+	kfree(data->nfan);
+	kfree(data->ntmp);
+
 	system76_get(data, "FINI");
 
 	return 0;

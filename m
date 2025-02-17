Return-Path: <platform-driver-x86+bounces-9449-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69128A31F96
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Feb 2025 08:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A4D17A23A1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Feb 2025 07:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028291E9B04;
	Wed, 12 Feb 2025 07:02:23 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CACAD27;
	Wed, 12 Feb 2025 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739343742; cv=none; b=CMCbGqvrqq11JE32PtdWsdwRrK4QeKy8+RiJXkf1dKldbbZ7S+FHiv63dsplr+V7fGNRm6QEGEml+LvBWIlqWIMwPGe8REN7eWcSb1awAwvj0uVvMqSYrNQ/aor/Qyg+Pkp0QhqD5qQyMcJykgF/3LrR2WTsQijwV78jZInFknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739343742; c=relaxed/simple;
	bh=hwLa8ZuRVxhYSvjzwBj95ZQSvAhU6M0RwHlBbJgOHQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7zf5UHV7Awsm/9gU8+1yxJMx1YZ/lM2qxqHSHN1OFFd5uqVW/zo3rvYJOoPnEaAPMjnV9YBYZNTPOU6l4LYx+DFHS7jAt7aCvCMh/3rlbQAkspqCww7OczlQhI/N/ga5F6a56bGjqdHKlUM3AJfERv4UMhkbNPKs8NLOkOxhjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from test-ThinkBook-16-G8-IRL.lenovo.com (unknown[123.114.236.252])
	by rmsmtp-lg-appmail-30-12044 (RichMail) with SMTP id 2f0c67ac47621a8-335d1;
	Wed, 12 Feb 2025 15:02:07 +0800 (CST)
X-RM-TRANSID:2f0c67ac47621a8-335d1
From: Jackie Dong <xy-jackie@139.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	dongeg1@lenovo.com,
	Jackie Dong <xy-jackie@139.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v5] platform/x86: lenovo-super-hotkey-wmi.c: Support for mic and audio mute LEDs
Date: Wed, 12 Feb 2025 15:01:54 +0800
Message-ID: <20250212070154.5333-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement Lenovo utility data WMI calls needed to make LEDs
work on Ideapads that support this GUID.
This enables the mic and audio LEDs to be updated correctly.

Tested on below samples.
ThinkBook 13X Gen4 IMH
ThinkBook 14 G6 ABP
ThinkBook 16p Gen4-21J8
ThinkBook 16 G8 IRL
ThinkBook 16 G7+ ASP

Signed-off-by: Jackie Dong <xy-jackie@139.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v5:
 - Take out union acpi_object *obj __free(kfree) = output.pointer from
   if-else block
 - Remove lsk_wmi_context_lud_keys related source code

Changes in v4:
 - Add related head files include cleanup.h, dev_printk.h, device.h,
   module.h
 - Replaced kfree() by __free()
 - Remove double free for obj
 - Remove wpriv->cdev[led_type].dev = dev
 - Remove *wpriv = *(const struct lenovo_super_hotkey_wmi_private *)context
 - Remove wpriv->event == LSH_WMI_EVENT_LUD_KEYS
 - Remove lenovo_super_hotkey_wmi_remove() for unnecessary

Changes in v3:
 - Changed the name of the Kconfig entry to LENOVO_SUPER_HOTKEY_WMI
 - Renamed everything in this driver which contains the name "ideapad"
   to instead contain the name of this driver.
 - Moved struct wmi_device *led_wdev in lenovo_super_hotkey_wmi_private,
   and use container_of() to the led_wdev pointer.
 - Replaced sizeof(struct wmi_led_args) by sizeof(led_arg)
 - Added condtions checking for obj && obj->type == ACPI_TYPE_INTEGER
   and free the ACPI object after get the required value.
 - Removed led_classdev_unregister() after led_reg_failed label, but
   add lenovo_super_hotkey_wmi_remove(struct wmi_device *wdev) to free
   resource.
 - Removed IDEAPAD_WMI_EVENT_FN_KEYS/IDEAPAD_WMI_EVENT_LUD_KEYS related
   source codes and only keep LUD_WMI_METHOD_GUID.

Changes in v2:
 - Update code layout and formatting as recommended in review
 - Improved error handling in ideapad_wmi_led_init
 - Separated a WMI driver named lenovo-super-hotkey-wmi.c from
   ideapad-lap.c, it's only for Lenovo Super Hotkey WMI devices.

 drivers/platform/x86/Kconfig                  |   9 +
 drivers/platform/x86/Makefile                 |   1 +
 .../platform/x86/lenovo-super-hotkey-wmi.c    | 222 ++++++++++++++++++
 3 files changed, 232 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-super-hotkey-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..c1792e8f04e1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -475,6 +475,15 @@ config IDEAPAD_LAPTOP
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
 
+config LENOVO_SUPER_HOTKEY_WMI
+	tristate "Lenovo Super Hotkey Utility WMI extras driver"
+	depends on ACPI_WMI
+	depends on IDEAPAD_LAPTOP
+	help
+	  This driver provides WMI support for Lenovo customized hotkeys function
+	  of Lenovo NoteBooks which are for Consumer and SMB customers, such as
+	  Ideapad/YOGA/XiaoXin/Gaming/ThinkBook and so on.
+
 config LENOVO_YMC
 	tristate "Lenovo Yoga Tablet Mode Control"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..598335da9f55 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
 # IBM Thinkpad and Lenovo
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
+obj-$(CONFIG_LENOVO_SUPER_HOTKEY_WMI)	+= lenovo-super-hotkey-wmi.o
 obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
diff --git a/drivers/platform/x86/lenovo-super-hotkey-wmi.c b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
new file mode 100644
index 000000000000..86c3dc2009b8
--- /dev/null
+++ b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
+ *
+ *  Copyright (C) 2025	Lenovo
+ */
+
+#include <linux/cleanup.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+/* Lenovo Super Hotkey WMI GUIDs */
+#define LUD_WMI_METHOD_GUID	"CE6C0974-0407-4F50-88BA-4FC3B6559AD8"
+
+/* Lenovo Utility Data WMI method_id */
+#define WMI_LUD_GET_SUPPORT 1
+#define WMI_LUD_SET_FEATURE 2
+
+#define WMI_LUD_GET_MICMUTE_LED_VER   20
+#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
+
+#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
+#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
+
+/* Input parameters to mute/unmute audio LED and Mic LED */
+struct wmi_led_args {
+	u8 id;
+	u8 subid;
+	u16 value;
+};
+
+/* Values of input parameters to SetFeature of audio LED and Mic LED */
+enum hotkey_set_feature {
+	MIC_MUTE_LED_ON = 1,
+	MIC_MUTE_LED_OFF,
+	AUDIO_MUTE_LED_ON = 4,
+	AUDIO_MUTE_LED_OFF,
+};
+
+#define LSH_ACPI_LED_MAX 2
+
+struct lenovo_super_hotkey_wmi_private {
+	struct led_classdev cdev[LSH_ACPI_LED_MAX];
+	struct wmi_device *led_wdev;
+};
+
+enum mute_led_type {
+	MIC_MUTE,
+	AUDIO_MUTE,
+};
+
+static int lsh_wmi_mute_led_set(enum mute_led_type led_type, struct led_classdev *led_cdev,
+				enum led_brightness brightness)
+
+{
+	struct lenovo_super_hotkey_wmi_private *wpriv = container_of(led_cdev,
+			struct lenovo_super_hotkey_wmi_private, cdev[led_type]);
+	struct wmi_led_args led_arg = {0, 0, 0};
+	struct acpi_buffer input;
+	acpi_status status;
+
+	switch (led_type) {
+	case MIC_MUTE:
+		led_arg.id = brightness == LED_ON ? MIC_MUTE_LED_ON : MIC_MUTE_LED_OFF;
+		break;
+	case AUDIO_MUTE:
+		led_arg.id = brightness == LED_ON ? AUDIO_MUTE_LED_ON : AUDIO_MUTE_LED_OFF;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	input.length = sizeof(led_arg);
+	input.pointer = &led_arg;
+	status = wmidev_evaluate_method(wpriv->led_wdev, 0, WMI_LUD_SET_FEATURE, &input, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static int lsh_wmi_audiomute_led_set(struct led_classdev *led_cdev,
+				     enum led_brightness brightness)
+
+{
+	return lsh_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
+}
+
+static int lsh_wmi_micmute_led_set(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
+{
+	return lsh_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
+}
+
+static int lenovo_super_hotkey_wmi_led_init(enum mute_led_type led_type, struct device *dev)
+{
+	struct lenovo_super_hotkey_wmi_private *wpriv = dev_get_drvdata(dev);
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input;
+	int led_version, err = 0;
+	unsigned int wmiarg;
+	acpi_status status;
+
+	switch (led_type) {
+	case MIC_MUTE:
+		wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
+		break;
+	case AUDIO_MUTE:
+		wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	input.length = sizeof(wmiarg);
+	input.pointer = &wmiarg;
+	status = wmidev_evaluate_method(wpriv->led_wdev, 0, WMI_LUD_GET_SUPPORT, &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	union acpi_object *obj __free(kfree) = output.pointer;
+	if (obj && obj->type == ACPI_TYPE_INTEGER) {
+		led_version = obj->integer.value;
+	} else {
+		err = -EIO;
+		return err;
+	}
+
+	wpriv->cdev[led_type].max_brightness = LED_ON;
+	wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
+
+	switch (led_type) {
+	case MIC_MUTE:
+		if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
+			err = -EIO;
+			goto led_error;
+		}
+		wpriv->cdev[led_type].name = "platform::micmute";
+		wpriv->cdev[led_type].brightness_set_blocking = &lsh_wmi_micmute_led_set;
+		wpriv->cdev[led_type].default_trigger = "audio-micmute";
+
+		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
+		if (err < 0)
+			goto led_reg_failed;
+
+		break;
+	case AUDIO_MUTE:
+		if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
+			err = -EIO;
+			goto led_error;
+		}
+		wpriv->cdev[led_type].name = "platform::mute";
+		wpriv->cdev[led_type].brightness_set_blocking = &lsh_wmi_audiomute_led_set;
+		wpriv->cdev[led_type].default_trigger = "audio-mute";
+
+		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
+		if (err < 0)
+			goto led_reg_failed;
+
+		break;
+	default:
+		err = -EINVAL;
+		dev_err(dev, "Unknown LED type %d\n", led_type);
+		goto led_error;
+	}
+
+	return 0;
+
+led_reg_failed:
+	dev_err(dev, "Could not register mute LED %d : %d\n", led_type, err);
+
+led_error:
+	return err;
+}
+
+static void lenovo_super_hotkey_wmi_leds_setup(struct device *dev)
+{
+	lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev);
+	lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev);
+}
+
+static int lenovo_super_hotkey_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct lenovo_super_hotkey_wmi_private *wpriv;
+
+	wpriv = devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);
+	if (!wpriv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, wpriv);
+	wpriv->led_wdev = wdev;
+	lenovo_super_hotkey_wmi_leds_setup(&wdev->dev);
+
+	return 0;
+}
+
+static const struct wmi_device_id lenovo_super_hotkey_wmi_id_table[] = {
+	{ LUD_WMI_METHOD_GUID, NULL }, /* Utility data */
+	{ }
+};
+
+MODULE_DEVICE_TABLE(wmi, lenovo_super_hotkey_wmi_id_table);
+
+static struct wmi_driver lenovo_super_hotkey_wmi_driver = {
+	 .driver = {
+		 .name = "lenovo_super_hotkey_wmi",
+		 .probe_type = PROBE_PREFER_ASYNCHRONOUS
+	 },
+	 .id_table = lenovo_super_hotkey_wmi_id_table,
+	 .probe = lenovo_super_hotkey_wmi_probe,
+	 .no_singleton = true,
+};
+
+module_wmi_driver(lenovo_super_hotkey_wmi_driver);
+
+MODULE_INFO(depends, "wmi,ideapad-laptop");
+MODULE_AUTHOR("Jackie Dong <dongeg1@lenovo.com>");
+MODULE_DESCRIPTION("Lenovo Super Hotkey Utility WMI extras driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0




Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6E72E677F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Dec 2020 17:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbgL1QZp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 28 Dec 2020 11:25:45 -0500
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:64036 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731077AbgL1NJN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Dec 2020 08:09:13 -0500
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BSD7lsY011964;
        Mon, 28 Dec 2020 08:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=1Bgjw5mhw4Cvt9LbQ9JHFyc4QEkHWm7M4W4hBC6voP0=;
 b=VVuMN4gFB9HxuN4QIu8YU31eypGbGH/CFAvKLjoo2rLEYC+ihwOYCwVuH2KjyogEMc+b
 9cHpjoE/LNbFcdaXZUxxyBvtc9pff2Q6c7Vk9sV5C1pQneMAGUoz5RcEt5oqr3I6BJIO
 hOmLbt4ta3o4XvabgSmaXBbnizcJmt3EoX4KhmKNd+dCqR3UY8LiIeaUxk3kCgQtwlqd
 Kepq5pmqijOeR7zD0uW8Mt+vYn5Wtt+BSFZXgwRDybNu6ui8L8cpBG43eloLSTB8yFau
 ybcuxp8PQwAGj3Hb64yVxmj0SWndgz+0uNHnqiy/ZoJIkyc7JsCEUu2vKszkNdBx2AW1 DQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 35p1cpcbkf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Dec 2020 08:08:30 -0500
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BSD4RPV006058;
        Mon, 28 Dec 2020 08:08:30 -0500
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
        by mx0a-00154901.pphosted.com with ESMTP id 35pk274gx6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Dec 2020 08:08:29 -0500
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.78,455,1599541200"; 
   d="scan'208";a="1518355409"
From:   Perry Yuan <Perry.Yuan@dell.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Perry.Yuan@dell.com, Limonciello Mario <Mario.Limonciello@dell.com>
Subject: [PATCH v2 1/2] platform/x86: dell-privacy: Add support for Dell hardware privacy
Date:   Mon, 28 Dec 2020 21:08:10 +0800
Message-Id: <20201228130813.13468-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-28_11:2020-12-24,2020-12-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012280081
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012280081
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Perry Yuan <perry_yuan@dell.com>

add support for dell privacy driver for the dell units equipped
hardware privacy design, which protect users privacy
of audio and camera from hardware level. once the audio or camera
privacy mode enabled, any applications will not get any audio or
video stream.
when user pressed ctrl+F4 hotkey, audio privacy mode will be
enabled,Micmute led will be also changed accordingly.
The micmute led is fully controlled by hardware & EC.
and camera mute hotkey is ctrl+F9.currently design only emmit
SW_CAMERA_LENS_COVER event while the camera LENS shutter will be
changed by EC & HW control.

*The flow is like this:
1) User presses key. HW does stuff with this key (timeout is started)
2) Event is emitted from FW
3) Event received by dell-privacy
4) KEY_MICMUTE emitted from dell-privacy
5) Userland picks up key and modifies kcontrol for SW mute
6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
	ledtrig_audio_set(LED_AUDIO_MICMUTE,
		rt715->micmute_led ? LED_ON :LED_OFF);
7) If "LED" is set to on dell-privacy notifies ec,
  and timeout is cancelled,HW mic mute activated.

Signed-off-by: Perry Yuan  <perry_yuan@dell.com>
Signed-off-by: Limonciello Mario <mario_limonciello@dell.com>
---
v1 -> v2:
* query EC handle from EC driver directly.
* fix some code style.
* add KEY_END to keymap array.
* clean platform device when cleanup called
* use hexadecimal format for log print in dev_dbg
* remove __set_bit for the report keys from probe.
* fix keymap leak
* add err_free_keymap in dell_privacy_wmi_probe
* wmi driver will be unregistered if privacy_acpi_init() fails
* add sysfs attribute files for user space query.
* add leds micmute driver to privacy acpi
* add more design info the commit info
---
---
 drivers/platform/x86/Kconfig             |  17 ++
 drivers/platform/x86/Makefile            |   4 +-
 drivers/platform/x86/dell-laptop.c       |  29 ++-
 drivers/platform/x86/dell-privacy-acpi.c | 165 ++++++++++++
 drivers/platform/x86/dell-privacy-wmi.c  | 309 +++++++++++++++++++++++
 drivers/platform/x86/dell-privacy-wmi.h  |  33 +++
 drivers/platform/x86/dell-wmi.c          |  26 +-
 7 files changed, 567 insertions(+), 16 deletions(-)
 create mode 100644 drivers/platform/x86/dell-privacy-acpi.c
 create mode 100644 drivers/platform/x86/dell-privacy-wmi.c
 create mode 100644 drivers/platform/x86/dell-privacy-wmi.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 91e6176cdfbd..9d5cc2454b3e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -491,6 +491,23 @@ config DELL_WMI_LED
 	  This adds support for the Latitude 2100 and similar
 	  notebooks that have an external LED.
 
+config DELL_PRIVACY
+	tristate "Dell Hardware Privacy Support"
+	depends on ACPI
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on DELL_LAPTOP
+	depends on LEDS_TRIGGER_AUDIO
+	select DELL_WMI
+	help
+	This driver provides support for the "Dell Hardware Privacy" feature
+	of Dell laptops.
+	Support for a micmute and camera mute privacy will be provided as
+	hardware button Ctrl+F4 and Ctrl+F9 hotkey
+
+	To compile this driver as a module, choose M here: the module will
+	be called dell_privacy.
+
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
 	depends on RFKILL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 581475f59819..18c430456de7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -51,7 +51,9 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
 obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
 obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
-
+obj-$(CONFIG_DELL_PRIVACY)              += dell-privacy.o
+dell-privacy-objs                       := dell-privacy-wmi.o \
+	                                   dell-privacy-acpi.o
 # Fujitsu
 obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
 obj-$(CONFIG_FUJITSU_LAPTOP)	+= fujitsu-laptop.o
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 70edc5bb3a14..ea0c8a8099ff 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -30,6 +30,7 @@
 #include <acpi/video.h>
 #include "dell-rbtn.h"
 #include "dell-smbios.h"
+#include "dell-privacy-wmi.h"
 
 struct quirk_entry {
 	bool touchpad_led;
@@ -90,6 +91,7 @@ static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 static bool force_rfkill;
+static bool privacy_valid;
 
 module_param(force_rfkill, bool, 0444);
 MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
@@ -1587,10 +1589,10 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		switch (unit) {
 		case KBD_TIMEOUT_DAYS:
 			value *= 24;
-			fallthrough;
+			/* fall through */
 		case KBD_TIMEOUT_HOURS:
 			value *= 60;
-			fallthrough;
+			/* fall through */
 		case KBD_TIMEOUT_MINUTES:
 			value *= 60;
 			unit = KBD_TIMEOUT_SECONDS;
@@ -2205,11 +2207,18 @@ static int __init dell_init(void)
 	dell_laptop_register_notifier(&dell_laptop_notifier);
 
 	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
-	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
-		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
-		if (ret < 0)
-			goto fail_led;
+			dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
+#if IS_ENABLED(CONFIG_DELL_PRIVACY)
+		ret = dell_privacy_valid();
+		if (!ret)
+			privacy_valid = true;
+#endif
+		if (!privacy_valid) {
+			micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+			ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
+			if (ret < 0)
+				goto fail_led;
+		}
 	}
 
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
@@ -2257,7 +2266,8 @@ static int __init dell_init(void)
 fail_get_brightness:
 	backlight_device_unregister(dell_backlight_device);
 fail_backlight:
-	led_classdev_unregister(&micmute_led_cdev);
+	if (!privacy_valid)
+		led_classdev_unregister(&micmute_led_cdev);
 fail_led:
 	dell_cleanup_rfkill();
 fail_rfkill:
@@ -2278,7 +2288,8 @@ static void __exit dell_exit(void)
 		touchpad_led_exit();
 	kbd_led_exit();
 	backlight_device_unregister(dell_backlight_device);
-	led_classdev_unregister(&micmute_led_cdev);
+	if (!privacy_valid)
+		led_classdev_unregister(&micmute_led_cdev);
 	dell_cleanup_rfkill();
 	if (platform_device) {
 		platform_device_unregister(platform_device);
diff --git a/drivers/platform/x86/dell-privacy-acpi.c b/drivers/platform/x86/dell-privacy-acpi.c
new file mode 100644
index 000000000000..fef781555b67
--- /dev/null
+++ b/drivers/platform/x86/dell-privacy-acpi.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Dell privacy notification driver
+ *
+ * Copyright (C) 2021 Dell Inc. All Rights Reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+#include <linux/slab.h>
+#include <linux/bits.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include "dell-privacy-wmi.h"
+
+#define PRIVACY_PLATFORM_NAME	"dell-privacy-acpi"
+#define DELL_PRIVACY_GUID	"6932965F-1671-4CEB-B988-D3AB0A901919"
+
+struct privacy_acpi_priv {
+	struct device *dev;
+	struct platform_device *platform_device;
+	struct led_classdev cdev;
+};
+static struct privacy_acpi_priv *privacy_acpi;
+
+static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
+		enum led_brightness brightness)
+{
+	struct privacy_acpi_priv *priv = privacy_acpi;
+	acpi_status status;
+	acpi_handle handle;
+	char *acpi_method;
+
+	handle = ec_get_handle();
+	if (!handle)
+		return -EIO;
+	if (acpi_has_method(handle, "ECAK"))
+		acpi_method = "ECAK";
+	else
+		return -ENODEV;
+
+	status = acpi_evaluate_object(handle, acpi_method, NULL, NULL);
+	if (ACPI_FAILURE(status)) {
+		dev_err(priv->dev, "Error setting privacy EC ack value: %s\n",
+				acpi_format_exception(status));
+		return -EIO;
+	}
+	return 0;
+}
+
+static int dell_privacy_acpi_remove(struct platform_device *pdev)
+{
+	struct privacy_acpi_priv *priv = dev_get_drvdata(privacy_acpi->dev);
+
+	led_classdev_unregister(&priv->cdev);
+	dev_set_drvdata(&pdev->dev, NULL);
+
+	return 0;
+}
+/*
+ * Pressing the mute key activates a time delayed circuit to physically cut
+ * off the mute. The LED is in the same circuit, so it reflects the true
+ * state of the HW mute.  The reason for the EC "ack" is so that software
+ * can first invoke a SW mute before the HW circuit is cut off.  Without SW
+ * cutting this off first does not affect the time delayed muting or status
+ * of the LED but there is a possibility of a "popping" noise.
+ *
+ * If the EC receives the SW ack, the circuit will be activated before the
+ * delay completed.
+ *
+ * Exposing as an LED device allows the codec drivers notification path to
+ * EC ACK to work
+ */
+static void dell_privacy_leds_setup(struct device *dev)
+{
+	struct privacy_acpi_priv *priv = dev_get_drvdata(dev);
+
+	priv->cdev.name = "privacy::micmute";
+	priv->cdev.max_brightness = 1;
+	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
+	priv->cdev.default_trigger = "audio-micmute";
+	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+	priv->cdev.dev = dev;
+	devm_led_classdev_register(dev, &priv->cdev);
+}
+
+static int dell_privacy_acpi_probe(struct platform_device *pdev)
+{
+	platform_set_drvdata(pdev, privacy_acpi);
+	privacy_acpi->dev = &pdev->dev;
+	privacy_acpi->platform_device = pdev;
+	return 0;
+}
+
+static const struct acpi_device_id privacy_acpi_device_ids[] = {
+	{"PNP0C09", 0},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, privacy_acpi_device_ids);
+
+static struct platform_driver dell_privacy_platform_drv = {
+	.driver = {
+		.name = PRIVACY_PLATFORM_NAME,
+		.acpi_match_table = ACPI_PTR(privacy_acpi_device_ids),
+	},
+	.remove = dell_privacy_acpi_remove,
+};
+
+int dell_privacy_acpi_init(void)
+{
+	int err;
+	struct platform_device *pdev;
+	int privacy_capable = wmi_has_guid(DELL_PRIVACY_GUID);
+
+	if (!privacy_capable)
+		return -ENODEV;
+
+	privacy_acpi = kzalloc(sizeof(struct privacy_acpi_priv), GFP_KERNEL);
+	if (!privacy_acpi)
+		return -ENOMEM;
+
+	pdev = platform_device_register_simple(
+			PRIVACY_PLATFORM_NAME, -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		err = PTR_ERR(pdev);
+		goto pdev_err;
+	}
+	err = platform_driver_probe(&dell_privacy_platform_drv,
+			dell_privacy_acpi_probe);
+	if (err)
+		goto pdrv_err;
+
+	dell_privacy_leds_setup(&pdev->dev);
+
+	return 0;
+
+pdrv_err:
+	platform_device_unregister(pdev);
+pdev_err:
+	kfree(privacy_acpi);
+	return err;
+}
+
+void dell_privacy_acpi_exit(void)
+{
+	struct platform_device *pdev = to_platform_device(privacy_acpi->dev);
+
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&dell_privacy_platform_drv);
+	kfree(privacy_acpi);
+}
+
+MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
+MODULE_DESCRIPTION("DELL Privacy ACPI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-privacy-wmi.c b/drivers/platform/x86/dell-privacy-wmi.c
new file mode 100644
index 000000000000..80637c7f617c
--- /dev/null
+++ b/drivers/platform/x86/dell-privacy-wmi.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Dell privacy notification driver
+ *
+ * Copyright (C) 2021 Dell Inc. All Rights Reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+#include "dell-privacy-wmi.h"
+
+#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
+#define MICROPHONE_STATUS		    BIT(0)
+#define CAMERA_STATUS		        BIT(1)
+#define PRIVACY_SCREEN_STATUS		BIT(2)
+
+static int privacy_valid = -EPROBE_DEFER;
+static LIST_HEAD(wmi_list);
+static DEFINE_MUTEX(list_mutex);
+
+struct privacy_wmi_data {
+	struct input_dev *input_dev;
+	struct wmi_device *wdev;
+	struct list_head list;
+	u32 features_present;
+	u32 last_status;
+};
+
+/*
+ * Keymap for WMI Privacy events of type 0x0012
+ */
+static const struct key_entry dell_wmi_keymap_type_0012[] = {
+	/* Privacy MIC Mute */
+	{ KE_KEY, 0x0001, { KEY_MICMUTE } },
+	/* Privacy Camera Mute */
+	{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
+	{ KE_END, 0},
+};
+
+int dell_privacy_valid(void)
+{
+	int ret;
+
+	ret = wmi_has_guid(DELL_PRIVACY_GUID);
+	if (!ret)
+		return -ENODEV;
+	ret = privacy_valid;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_privacy_valid);
+
+void dell_privacy_process_event(int type, int code, int status)
+{
+	struct privacy_wmi_data *priv;
+	const struct key_entry *key;
+
+	mutex_lock(&list_mutex);
+	priv = list_first_entry_or_null(&wmi_list,
+			struct privacy_wmi_data,
+			list);
+	if (!priv) {
+		pr_err("dell privacy priv is NULL\n");
+		goto error;
+	}
+	key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 16)|code);
+	if (!key) {
+		dev_dbg(&priv->wdev->dev, "Unknown key with type 0x%04x and code 0x%04x pressed\n",
+				type, code);
+		goto error;
+	}
+	switch (code) {
+	case DELL_PRIVACY_TYPE_AUDIO: /* Mic mute */
+		priv->last_status = status;
+		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
+		break;
+	case DELL_PRIVACY_TYPE_CAMERA: /* Camera mute */
+		priv->last_status = status;
+		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
+		break;
+	default:
+			dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x",
+					type, code);
+	}
+error:
+	mutex_unlock(&list_mutex);
+}
+EXPORT_SYMBOL_GPL(dell_privacy_process_event);
+
+static ssize_t devices_supported_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", priv->features_present);
+}
+
+static ssize_t current_state_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", priv->last_status);
+}
+
+static DEVICE_ATTR_RO(devices_supported);
+static DEVICE_ATTR_RO(current_state);
+
+static struct attribute *platform_attributes[] = {
+	&dev_attr_devices_supported.attr,
+	&dev_attr_current_state.attr,
+	NULL,
+};
+
+static const struct attribute_group privacy_attribute_group = {
+	.attrs = platform_attributes
+};
+
+/*
+ * Describes the Device State class exposed by BIOS which can be consumed by
+ * various applications interested in knowing the Privacy feature capabilities.
+ * class DeviceState
+ * {
+ *  [key, read] string InstanceName;
+ *  [read] boolean ReadOnly;
+ *  [WmiDataId(1), read] uint32 DevicesSupported;
+ *   0 – None, 0x1 – Microphone, 0x2 – Camera, 0x4 -ePrivacy  Screen
+ *  [WmiDataId(2), read] uint32 CurrentState;
+ *   0:Off; 1:On. Bit0 – Microphone, Bit1 – Camera, Bit2 - ePrivacyScreen
+ * };
+ */
+
+static int get_current_status(struct wmi_device *wdev)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
+	union acpi_object *obj_present = NULL;
+	u32 *buffer;
+	int ret = 0;
+
+	if (priv == NULL) {
+		pr_err("dell privacy priv is NULL\n");
+		return -EINVAL;
+	}
+	/* check privacy support features and device states */
+	obj_present = wmidev_block_query(wdev, 0);
+	if (obj_present->type != ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Dell privacy failed to get device status!\n");
+		ret = -EIO;
+		privacy_valid = ret;
+		goto obj_free;
+	}
+	/*  Although it's not technically a failure, this would lead to
+	 *  unexpected behavior
+	 */
+	if (obj_present->buffer.length != 8) {
+		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n",
+				obj_present->buffer.length);
+		ret = -ENODEV;
+		privacy_valid = ret;
+		goto obj_free;
+	}
+	buffer = (u32 *)obj_present->buffer.pointer;
+	priv->features_present = buffer[0];
+	priv->last_status = buffer[1];
+	privacy_valid = 0;
+
+obj_free:
+	kfree(obj_present);
+	return ret;
+}
+
+static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct privacy_wmi_data *priv;
+	struct key_entry *keymap;
+	int ret, i, pos = 0;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(struct privacy_wmi_data),
+			GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, priv);
+	priv->wdev = wdev;
+	/* create evdev passing interface */
+	priv->input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!priv->input_dev)
+		return -ENOMEM;
+	/* remap the wmi keymap event to new keymap */
+	keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012) +
+			1,
+			sizeof(struct key_entry), GFP_KERNEL);
+	if (!keymap) {
+		ret = -ENOMEM;
+		goto err_free_dev;
+	}
+	/* remap the keymap code with Dell privacy key type 0x12 as prefix
+	 * KEY_MICMUTE scancode will be reported as 0x120001
+	 */
+	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
+		keymap[pos] = dell_wmi_keymap_type_0012[i];
+		keymap[pos].code |= (0x0012 << 16);
+		pos++;
+	}
+	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
+	if (ret)
+		return ret;
+	priv->input_dev->dev.parent = &wdev->dev;
+	priv->input_dev->name = "Dell Privacy Driver";
+	priv->input_dev->id.bustype = BUS_HOST;
+	if (input_register_device(priv->input_dev)) {
+		pr_debug("input_register_device failed to register!\n");
+		goto err_free_keymap;
+	}
+	mutex_lock(&list_mutex);
+	list_add_tail(&priv->list, &wmi_list);
+	mutex_unlock(&list_mutex);
+	if (get_current_status(priv->wdev))
+		goto err_free_keymap;
+	ret = sysfs_create_group(&wdev->dev.kobj, &privacy_attribute_group);
+	if (ret)
+		goto err_free_keymap;
+	return 0;
+
+err_free_keymap:
+	privacy_valid = -ENODEV;
+	kfree(keymap);
+err_free_dev:
+	return ret;
+}
+
+static int dell_privacy_wmi_remove(struct wmi_device *wdev)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
+
+	mutex_lock(&list_mutex);
+	list_del(&priv->list);
+	mutex_unlock(&list_mutex);
+	privacy_valid = -ENODEV;
+	sysfs_remove_group(&wdev->dev.kobj, &privacy_attribute_group);
+
+	return 0;
+}
+
+static const struct wmi_device_id dell_wmi_privacy_wmi_id_table[] = {
+	{ .guid_string = DELL_PRIVACY_GUID },
+	{ },
+};
+
+static struct wmi_driver dell_privacy_wmi_driver = {
+	.driver = {
+		.name = "dell-privacy",
+	},
+	.probe = dell_privacy_wmi_probe,
+	.remove = dell_privacy_wmi_remove,
+	.id_table = dell_wmi_privacy_wmi_id_table,
+};
+
+static int __init init_dell_privacy(void)
+{
+	int ret;
+
+	ret = wmi_has_guid(DELL_PRIVACY_GUID);
+	if (!ret)
+		return -ENODEV;
+
+	ret = dell_privacy_acpi_init();
+	if (ret) {
+		pr_err("failed to initialize privacy acpi driver: %d\n", ret);
+		goto err_init;
+	}
+
+	ret = wmi_driver_register(&dell_privacy_wmi_driver);
+	if (ret) {
+		pr_err("failed to initialize privacy wmi driver: %d\n", ret);
+		return ret;
+	}
+	return 0;
+
+err_init:
+	wmi_driver_unregister(&dell_privacy_wmi_driver);
+	return ret;
+}
+
+static void dell_privacy_wmi_exit(void)
+{
+	wmi_driver_unregister(&dell_privacy_wmi_driver);
+}
+
+static void __exit exit_dell_privacy(void)
+{
+	dell_privacy_wmi_exit();
+	dell_privacy_acpi_exit();
+}
+
+module_init(init_dell_privacy);
+module_exit(exit_dell_privacy);
+
+MODULE_DEVICE_TABLE(wmi, dell_wmi_privacy_wmi_id_table);
+MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
+MODULE_DESCRIPTION("Dell Privacy WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-privacy-wmi.h b/drivers/platform/x86/dell-privacy-wmi.h
new file mode 100644
index 000000000000..9fa01d084f7d
--- /dev/null
+++ b/drivers/platform/x86/dell-privacy-wmi.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Dell privacy notification driver
+ *
+ * Copyright (C) 2021 Dell Inc. All Rights Reserved.
+ */
+
+#ifndef _DELL_PRIVACY_WMI_H_
+#define _DELL_PRIVACY_WMI_H_
+
+#if IS_ENABLED(CONFIG_DELL_PRIVACY)
+int  dell_privacy_valid(void);
+void dell_privacy_process_event(int type, int code, int status);
+#else /* CONFIG_DELL_PRIVACY */
+static inline int dell_privacy_valid(void)
+{
+	return  -ENODEV;
+}
+
+static inline void dell_privacy_process_event(int type, int code, int status)
+{}
+#endif /* CONFIG_DELL_PRIVACY */
+
+int  dell_privacy_acpi_init(void);
+void dell_privacy_acpi_exit(void);
+
+/* DELL Privacy Type */
+enum {
+	DELL_PRIVACY_TYPE_UNKNOWN = 0x0,
+	DELL_PRIVACY_TYPE_AUDIO,
+	DELL_PRIVACY_TYPE_CAMERA,
+};
+#endif
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index bbdb3e860892..4b22bd21fc42 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -27,6 +27,7 @@
 #include <acpi/video.h>
 #include "dell-smbios.h"
 #include "dell-wmi-descriptor.h"
+#include "dell-privacy-wmi.h"
 
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
@@ -381,6 +382,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 	u16 *buffer_entry, *buffer_end;
 	acpi_size buffer_size;
 	int len, i;
+	int err;
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
 		pr_warn("bad response type %x\n", obj->type);
@@ -427,18 +429,30 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 
 		switch (buffer_entry[1]) {
 		case 0x0000: /* One key pressed or event occurred */
-		case 0x0012: /* Event with extended data occurred */
-			if (len > 2)
-				dell_wmi_process_key(wdev, buffer_entry[1],
-						     buffer_entry[2]);
-			/* Extended data is currently ignored */
-			break;
 		case 0x0010: /* Sequence of keys pressed */
 		case 0x0011: /* Sequence of events occurred */
 			for (i = 2; i < len; ++i)
 				dell_wmi_process_key(wdev, buffer_entry[1],
 						     buffer_entry[i]);
 			break;
+		case 0x0012:
+#if IS_ENABLED(CONFIG_DELL_PRIVACY)
+			err = dell_privacy_valid();
+			if (err == 0) {
+				dell_privacy_process_event(buffer_entry[1],
+						buffer_entry[3], buffer_entry[4]);
+			} else {
+				if (len > 2)
+					dell_wmi_process_key(wdev, buffer_entry[1],
+							buffer_entry[2]);
+			}
+#else
+			/* Extended data is currently ignored */
+			if (len > 2)
+				dell_wmi_process_key(wdev, buffer_entry[1],
+						buffer_entry[2]);
+#endif
+			break;
 		default: /* Unknown event */
 			pr_info("Unknown WMI event type 0x%x\n",
 				(int)buffer_entry[1]);
-- 
2.25.1


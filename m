Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9949375346
	for <lists+platform-driver-x86@lfdr.de>; Thu,  6 May 2021 13:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbhEFL5M (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 6 May 2021 07:57:12 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:23796 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231452AbhEFL5L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 May 2021 07:57:11 -0400
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 146BpiuZ018827;
        Thu, 6 May 2021 07:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=lqRPRGhIetxyqWUFaxRuuqQ/50yB7v7r8V4WJta2/40=;
 b=UrZmNQHiJHwcjlPjWBgVC4WTBeSiE+RLWvzJu/HcecX9lfEgJhETq41Up9UHwR9Q5tb9
 gDYh4pxyqKFhEXBiTl6cGznQV2i70nOnFQTUISO1MQf8qwsqRH412nfzQLS70by4vk09
 hU+v9qYhYi+6CkM4Wlqyw/yU7sXnc8EwXN6t4unpLLcbKQMTkZyCMd9XvgD/J7cazT4/
 NKqQVTwAlyYmgxtlxJgqUun+vtwBD7knobYSfKzu951Wsq4N0apYxOwxt6jypCWwaEPf
 6HodJVxiX+Xn11DpgL1B4I5u2MrEfHu7OaDCm7O+XCS5ylQgcb/jY9Zz0Yy+HmDSbnGn ow== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 38bebwq2x8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 May 2021 07:56:12 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 146BtQdn060090;
        Thu, 6 May 2021 07:56:12 -0400
Received: from esaploutpc120.us.dell.com ([143.166.85.211])
        by mx0b-00154901.pphosted.com with ESMTP id 38cfjagc5m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 07:56:11 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.82,277,1613455200"; 
   d="scan'208";a="9365707"
From:   Perry Yuan <Perry.Yuan@dell.com>
To:     pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
        oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
        hdegoede@redhat.com, mgross@linux.intel.com
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Perry.Yuan@dell.com,
        mario.limonciello@outlook.com, Dell.Client.Kernel@dell.com
Subject: [PATCH v8 1/2] platform/x86: dell-privacy: Add support for Dell hardware privacy
Date:   Thu,  6 May 2021 19:56:05 +0800
Message-Id: <20210506115605.1504-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-06_08:2021-05-06,2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060084
X-Proofpoint-ORIG-GUID: _dnUcyZy_g2RxS80PGJoJLmEEO0cFo5y
X-Proofpoint-GUID: _dnUcyZy_g2RxS80PGJoJLmEEO0cFo5y
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060083
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Perry Yuan <perry_yuan@dell.com>

add support for Dell privacy driver for the Dell units equipped
hardware privacy design, which protect users privacy of audio and
camera from hardware level. Once the audio or camera privacy mode
activated, any applications will not get any audio or video stream
when user pressed ctrl+F4 hotkey, audio privacy mode will be
enabled, micmute led will be also changed accordingly
The micmute led is fully controlled by hardware & EC(embedded controller)
and camera mute hotkey is Ctrl+F9. Currently design only emits
SW_CAMERA_LENS_COVER event while the camera lens shutter will be
changed by EC & HW(hardware) control

*The flow is like this:
1) User presses key. HW does stuff with this key (timeout timer is started)
2) WMI event is emitted from BIOS to kernel
3) WMI event is received by dell-privacy
4) KEY_MICMUTE emitted from dell-privacy
5) Userland picks up key and modifies kcontrol for SW mute
6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
   ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led ? LED_ON :LED_OFF);
7) If "LED" is set to on dell-privacy notifies EC, and timeout is cancelled,
   HW mic mute activated. If EC not notified, HW mic mute will also be
   activated when timeout used up, it is just later than active ack

Signed-off-by: Perry Yuan <perry_yuan@dell.com>

---
v7 -> v8:
* addressed feedback from Hans
* use sysfs_emit_at in the sysfs attributes
* Update Kconfig
* improve led_classdev_unregister logic in dell-laptop 
v6 -> v7:
* addressed feedback from Hans
* addressed feedback from Pierre
* optimize some debug format with dev_dbg()
v5 -> v6:
* remove platform driver,combined privacy acpi driver into single wmi
  driver file
* optimize sysfs interface with string added to be more clearly reading
* remove unused function and clear header file
v4 -> v5:
* addressed feedback from Randy Dunlap
* addressed feedback from Pierre-Louis Bossart
* rebase to latest 5.12 rc4 upstream kernel
* fix some space alignment problem
v3 -> v4:
* fix format for Kconfig
* add sysfs document
* add flow comments to the privacy wmi/acpi driver
* addressed feedback from Barnabás Pőcze[Thanks very much]
* export privacy_valid to make the global state simpler to query
* fix one issue which will block the dell-laptop driver to load when
  privacy driver invalid
* addressed feedback from Pierre-Louis Bossart,remove the EC ID match
v2 -> v3:
* add sysfs attributes doc
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
 .../testing/sysfs-platform-dell-privacy-wmi   |  55 +++
 drivers/platform/x86/dell/Kconfig             |  14 +
 drivers/platform/x86/dell/Makefile            |   1 +
 drivers/platform/x86/dell/dell-laptop.c       |  13 +-
 drivers/platform/x86/dell/dell-privacy-wmi.c  | 394 ++++++++++++++++++
 drivers/platform/x86/dell/dell-privacy-wmi.h  |  25 ++
 drivers/platform/x86/dell/dell-wmi.c          |   9 +-
 7 files changed, 507 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
new file mode 100644
index 000000000000..7f9e18705861
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
@@ -0,0 +1,55 @@
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_supported_type
+Date:		Apr 2021
+KernelVersion:	5.13
+Contact:	"perry.yuan@dell.com>"
+Description:
+		Display which dell hardware level privacy devices are supported
+		“Dell Privacy” is a set of HW, FW, and SW features to enhance
+		Dell’s commitment to platform privacy for MIC, Camera, and
+		ePrivacy screens.
+		The supported hardware privacy devices are:
+Attributes:
+		Microphone Mute:
+				Identifies the local microphone can be muted by hardware, no applications
+				is available to capture system mic sound
+
+		Camera Shutter:
+				Identifies camera shutter controlled by hardware, which is a micromechanical
+				shutter assembly that is built onto the camera module to block capturing images
+				from outside the laptop
+
+		supported:
+				The privacy device is supported by this system
+
+		unsupported:
+				The privacy device is not supported on this system
+
+		For example to check which privacy devices are supported:
+
+		# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_supported_type
+		[Microphone Mute] [supported]
+		[Camera Shutter] [supported]
+		[ePrivacy Screen] [unsupported]
+
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_current_state
+Date:		Apr 2021
+KernelVersion:	5.13
+Contact:	"perry.yuan@dell.com>"
+Description:
+		Allow user space to check current dell privacy device state.
+		Describes the Device State class exposed by BIOS which can be
+		consumed by various applications interested in knowing the Privacy
+		feature capabilities
+Attributes:
+		muted:
+			Identifies the privacy device is turned off and cannot send stream to OS applications
+
+		unmuted:
+			Identifies the privacy device is turned on ,audio or camera driver can get
+			stream from mic and camera module to OS applications
+
+		For example to check all supported current privacy device states:
+
+		# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_current_state
+		[Microphone] [unmuted]
+		[Camera Shutter] [unmuted]
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index e0a55337f51a..be570ccbbce0 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -204,4 +204,18 @@ config DELL_WMI_SYSMAN
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-wmi-sysman.
 
+config DELL_PRIVACY
+	tristate "Dell Hardware Privacy Support"
+	depends on ACPI
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on DELL_LAPTOP
+	depends on LEDS_TRIGGER_AUDIO
+	depends on DELL_WMI
+	help
+	  This driver provides integration with the "Dell Hardware Privacy" feature
+	  of Dell laptops.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dell_privacy.
 endif # X86_PLATFORM_DRIVERS_DELL
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index d720a3e42ae3..7da0c33dfcca 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
 obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
 obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
+obj-$(CONFIG_DELL_PRIVACY)              += dell-privacy-wmi.o
diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 70edc5bb3a14..529547fb0cb1 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -31,6 +31,8 @@
 #include "dell-rbtn.h"
 #include "dell-smbios.h"
 
+#include "dell-privacy-wmi.h"
+
 struct quirk_entry {
 	bool touchpad_led;
 	bool kbd_led_not_present;
@@ -90,6 +92,7 @@ static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 static bool force_rfkill;
+static bool micmute_led_registered;
 
 module_param(force_rfkill, bool, 0444);
 MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
@@ -2205,11 +2208,13 @@ static int __init dell_init(void)
 	dell_laptop_register_notifier(&dell_laptop_notifier);
 
 	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
-	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
+	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE) &&
+	    !dell_privacy_present()) {
 		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
 		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
 		if (ret < 0)
 			goto fail_led;
+		micmute_led_registered = true;
 	}
 
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
@@ -2257,7 +2262,8 @@ static int __init dell_init(void)
 fail_get_brightness:
 	backlight_device_unregister(dell_backlight_device);
 fail_backlight:
-	led_classdev_unregister(&micmute_led_cdev);
+	if (micmute_led_registered)
+		led_classdev_unregister(&micmute_led_cdev);
 fail_led:
 	dell_cleanup_rfkill();
 fail_rfkill:
@@ -2278,7 +2284,8 @@ static void __exit dell_exit(void)
 		touchpad_led_exit();
 	kbd_led_exit();
 	backlight_device_unregister(dell_backlight_device);
-	led_classdev_unregister(&micmute_led_cdev);
+	if (micmute_led_registered)
+		led_classdev_unregister(&micmute_led_cdev);
 	dell_cleanup_rfkill();
 	if (platform_device) {
 		platform_device_unregister(platform_device);
diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.c b/drivers/platform/x86/dell/dell-privacy-wmi.c
new file mode 100644
index 000000000000..a32d0fbd99da
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-privacy-wmi.c
@@ -0,0 +1,394 @@
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
+#include <linux/bitops.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/list.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#include "dell-privacy-wmi.h"
+
+#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
+#define MICROPHONE_STATUS		BIT(0)
+#define CAMERA_STATUS		        BIT(1)
+#define DELL_PRIVACY_AUDIO_EVENT  0x1
+#define DELL_PRIVACY_CAMERA_EVENT 0x2
+#define led_to_priv(c)       container_of(c, struct privacy_wmi_data, cdev)
+
+/*
+ * The wmi_list is used to store the privacy_priv struct with mutex protecting
+ */
+static LIST_HEAD(wmi_list);
+static DEFINE_MUTEX(list_mutex);
+
+struct privacy_wmi_data {
+	struct input_dev *input_dev;
+	struct wmi_device *wdev;
+	struct list_head list;
+	struct led_classdev cdev;
+	u32 features_present;
+	u32 last_status;
+};
+
+/* DELL Privacy Type */
+enum dell_hardware_privacy_type {
+	DELL_PRIVACY_TYPE_AUDIO = 0,
+	DELL_PRIVACY_TYPE_CAMERA,
+	DELL_PRIVACY_TYPE_SCREEN,
+	DELL_PRIVACY_TYPE_MAX,
+};
+
+static const char * const privacy_types[DELL_PRIVACY_TYPE_MAX] = {
+	[DELL_PRIVACY_TYPE_AUDIO] = "Microphone",
+	[DELL_PRIVACY_TYPE_CAMERA] = "Camera Shutter",
+	[DELL_PRIVACY_TYPE_SCREEN] = "ePrivacy Screen",
+};
+
+/*
+ * Keymap for WMI privacy events of type 0x0012
+ */
+static const struct key_entry dell_wmi_keymap_type_0012[] = {
+	/* privacy mic mute */
+	{ KE_KEY, 0x0001, { KEY_MICMUTE } },
+	/* privacy camera mute */
+	{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
+	{ KE_END, 0},
+};
+
+/*
+ * global privacy state for other modules to query if the privacy driver loaded successfully
+ * or no privacy WMI device was detected at initial probe phase
+ */
+bool dell_privacy_present(void)
+{
+	struct privacy_wmi_data *priv;
+
+	mutex_lock(&list_mutex);
+	priv = list_first_entry_or_null(&wmi_list,
+			struct privacy_wmi_data,
+			list);
+	mutex_unlock(&list_mutex);
+
+	return priv && (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO));
+}
+EXPORT_SYMBOL_GPL(dell_privacy_present);
+
+/*
+ * The flow of privacy event:
+ * 1) User presses key. HW does stuff with this key (timeout is started)
+ * 2) WMI event is emitted from BIOS
+ * 3) WMI event is received by dell-privacy
+ * 4) KEY_MICMUTE emitted from dell-privacy
+ * 5) Userland picks up key and modifies kcontrol for SW mute
+ * 6) Codec kernel driver catches and calls ledtrig_audio_set defined by
+ *    dell-privacy-acpi driver. Codec driver will call like this to switch micmute led state.
+ *    ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led ? LED_ON :LED_OFF);
+ * 7) If "LED" is set to on dell-privacy notifies EC,and timeout is cancelled,
+ *	HW mic mute activated.
+ */
+bool dell_privacy_process_event(int type, int code, int status)
+{
+	struct privacy_wmi_data *priv;
+	const struct key_entry *key;
+	bool ret = false;
+
+	mutex_lock(&list_mutex);
+	priv = list_first_entry_or_null(&wmi_list,
+			struct privacy_wmi_data,
+			list);
+	if (!priv)
+		goto error;
+
+	key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 16) | code);
+	if (!key) {
+		dev_warn(&priv->wdev->dev, "Unknown key with type 0x%04x and code 0x%04x pressed\n",
+			type, code);
+		goto error;
+	}
+	dev_dbg(&priv->wdev->dev, "Key with type 0x%04x and code 0x%04x pressed\n", type, code);
+
+	switch (code) {
+	case DELL_PRIVACY_AUDIO_EVENT: /* Mic mute */
+	case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
+		priv->last_status = status;
+		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
+		ret = true;
+		break;
+	default:
+		dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x\n", type, code);
+	}
+
+error:
+	mutex_unlock(&list_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_privacy_process_event);
+
+static ssize_t dell_privacy_supported_type_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
+	enum dell_hardware_privacy_type type;
+	u32 privacy_list;
+	int len = 0;
+
+	privacy_list = priv->features_present;
+	for (type = DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; type++) {
+		if (privacy_list & BIT(type))
+			len += sysfs_emit_at(buf, len, "[%s] [supported]\n", privacy_types[type]);
+		else
+			len += sysfs_emit_at(buf, len, "[%s] [unsupported]\n", privacy_types[type]);
+	}
+
+	return len;
+}
+
+static ssize_t dell_privacy_current_state_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
+	u32 privacy_supported = priv->features_present;
+	enum dell_hardware_privacy_type type;
+	u32 privacy_state = priv->last_status;
+	int len = 0;
+
+	for (type = DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; type++) {
+		if (privacy_supported & BIT(type)) {
+			if (privacy_state & BIT(type))
+				len += sysfs_emit_at(buf, len, "[%s] [unmuted]\n", privacy_types[type]);
+			else
+				len += sysfs_emit_at(buf, len, "[%s] [muted]\n", privacy_types[type]);
+		}
+	}
+
+	return len;
+}
+
+static DEVICE_ATTR_RO(dell_privacy_supported_type);
+static DEVICE_ATTR_RO(dell_privacy_current_state);
+
+static struct attribute *privacy_attributes[] = {
+	&dev_attr_dell_privacy_supported_type.attr,
+	&dev_attr_dell_privacy_current_state.attr,
+	NULL,
+};
+
+static const struct attribute_group privacy_attribute_group = {
+	.attrs = privacy_attributes
+};
+
+/*
+ * Describes the Device State class exposed by BIOS which can be consumed by
+ * various applications interested in knowing the Privacy feature capabilities.
+ * class DeviceState
+ * {
+ *  [key, read] string InstanceName;
+ *  [read] boolean ReadOnly;
+ *
+ *  [WmiDataId(1), read] uint32 DevicesSupported;
+ *   0 - None; 0x1 - Microphone; 0x2 - Camera; 0x4 - ePrivacy  Screen
+ *
+ *  [WmiDataId(2), read] uint32 CurrentState;
+ *   0 - Off; 1 - On; Bit0 - Microphone; Bit1 - Camera; Bit2 - ePrivacyScreen
+ * };
+ */
+static int get_current_status(struct wmi_device *wdev)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
+	union acpi_object *obj_present;
+	u32 *buffer;
+	int ret = 0;
+
+	if (!priv) {
+		dev_err(&wdev->dev, "dell privacy priv is NULL\n");
+		return -EINVAL;
+	}
+	/* check privacy support features and device states */
+	obj_present = wmidev_block_query(wdev, 0);
+	if (!obj_present) {
+		dev_err(&wdev->dev, "failed to read Binary MOF\n");
+		return -EIO;
+	}
+
+	if (obj_present->type != ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
+		ret = -EIO;
+		goto obj_free;
+	}
+	/*  Although it's not technically a failure, this would lead to
+	 *  unexpected behavior
+	 */
+	if (obj_present->buffer.length != 8) {
+		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n",
+				obj_present->buffer.length);
+		ret = -EINVAL;
+		goto obj_free;
+	}
+	buffer = (u32 *)obj_present->buffer.pointer;
+	priv->features_present = buffer[0];
+	priv->last_status = buffer[1];
+
+obj_free:
+	kfree(obj_present);
+	return ret;
+}
+
+static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	struct privacy_wmi_data *priv = led_to_priv(led_cdev);
+	static char *acpi_method = (char *)"ECAK";
+	acpi_status status;
+	acpi_handle handle;
+
+	handle = ec_get_handle();
+	if (!handle)
+		return -EIO;
+
+	if (!acpi_has_method(handle, acpi_method))
+		return -EIO;
+
+	status = acpi_evaluate_object(handle, acpi_method, NULL, NULL);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&priv->wdev->dev, "Error setting privacy EC ack value: %s\n",
+				acpi_format_exception(status));
+		return -EIO;
+	}
+
+	return 0;
+}
+
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
+static int dell_privacy_leds_setup(struct device *dev)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
+
+	priv->cdev.name = "dell-privacy::micmute";
+	priv->cdev.max_brightness = 1;
+	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
+	priv->cdev.default_trigger = "audio-micmute";
+	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+	return devm_led_classdev_register(dev, &priv->cdev);
+}
+
+static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct privacy_wmi_data *priv;
+	struct key_entry *keymap;
+	int ret, i;
+
+	ret = wmi_has_guid(DELL_PRIVACY_GUID);
+	if (!ret)
+		pr_debug("Unable to detect available Dell privacy devices!\n");
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, priv);
+	priv->wdev = wdev;
+	/* create evdev passing interface */
+	priv->input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!priv->input_dev)
+		return -ENOMEM;
+
+	/* remap the wmi keymap event to new keymap */
+	keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012),
+			sizeof(struct key_entry), GFP_KERNEL);
+	if (!keymap)
+		return -ENOMEM;
+
+	/* remap the keymap code with Dell privacy key type 0x12 as prefix
+	 * KEY_MICMUTE scancode will be reported as 0x120001
+	 */
+	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
+		keymap[i] = dell_wmi_keymap_type_0012[i];
+		keymap[i].code |= (0x0012 << 16);
+	}
+	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
+	kfree(keymap);
+	if (ret)
+		return ret;
+
+	priv->input_dev->dev.parent = &wdev->dev;
+	priv->input_dev->name = "Dell Privacy Driver";
+	priv->input_dev->id.bustype = BUS_HOST;
+
+	ret = input_register_device(priv->input_dev);
+	if (ret)
+		return ret;
+
+	ret = get_current_status(priv->wdev);
+	if (ret)
+		return ret;
+
+	ret = devm_device_add_group(&wdev->dev, &privacy_attribute_group);
+	if (ret)
+		return ret;
+
+	if (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO)) {
+		ret = dell_privacy_leds_setup(&priv->wdev->dev);
+		if (ret)
+			return ret;
+	}
+	mutex_lock(&list_mutex);
+	list_add_tail(&priv->list, &wmi_list);
+	mutex_unlock(&list_mutex);
+	return 0;
+}
+
+static int dell_privacy_wmi_remove(struct wmi_device *wdev)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
+
+	mutex_lock(&list_mutex);
+	list_del(&priv->list);
+	mutex_unlock(&list_mutex);
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
+module_wmi_driver(dell_privacy_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, dell_wmi_privacy_wmi_id_table);
+MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
+MODULE_DESCRIPTION("Dell Privacy WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.h b/drivers/platform/x86/dell/dell-privacy-wmi.h
new file mode 100644
index 000000000000..54004eed7213
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-privacy-wmi.h
@@ -0,0 +1,25 @@
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
+bool dell_privacy_present(void);
+bool dell_privacy_process_event(int type, int code, int status);
+#else /* CONFIG_DELL_PRIVACY */
+static inline bool dell_privacy_present(void)
+{
+	return -ENODEV;
+}
+
+static inline bool dell_privacy_process_event(int type, int code, int status)
+{
+	return false;
+}
+#endif /* CONFIG_DELL_PRIVACY */
+#endif
diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
index bbdb3e860892..20367a580fa0 100644
--- a/drivers/platform/x86/dell/dell-wmi.c
+++ b/drivers/platform/x86/dell/dell-wmi.c
@@ -27,6 +27,7 @@
 #include <acpi/video.h>
 #include "dell-smbios.h"
 #include "dell-wmi-descriptor.h"
+#include "dell-privacy-wmi.h"
 
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
@@ -427,7 +428,6 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 
 		switch (buffer_entry[1]) {
 		case 0x0000: /* One key pressed or event occurred */
-		case 0x0012: /* Event with extended data occurred */
 			if (len > 2)
 				dell_wmi_process_key(wdev, buffer_entry[1],
 						     buffer_entry[2]);
@@ -439,6 +439,13 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 				dell_wmi_process_key(wdev, buffer_entry[1],
 						     buffer_entry[i]);
 			break;
+		case 0x0012:
+			if ((len > 4) && dell_privacy_process_event(buffer_entry[1], buffer_entry[3],
+								    buffer_entry[4]))
+				/* dell_privacy_process_event has handled the event */;
+			else if (len > 2)
+				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2]);
+			break;
 		default: /* Unknown event */
 			pr_info("Unknown WMI event type 0x%x\n",
 				(int)buffer_entry[1]);
-- 
2.25.1


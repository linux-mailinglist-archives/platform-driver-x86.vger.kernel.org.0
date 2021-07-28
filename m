Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5139F3D94FD
	for <lists+platform-driver-x86@lfdr.de>; Wed, 28 Jul 2021 20:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhG1SH6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 28 Jul 2021 14:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32956 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229542AbhG1SH6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 14:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627495676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AX4tU0IlfDZv2jtlh/UUKbH1sVP+Xz81hRfOcYsx8ls=;
        b=KcATa4hn6nS7AZyJtCjzPGbPY1TtS7fKEmBTPaZ0d5mb2MgL7Lk+7rmUW4rM+IOt6OAwO+
        JE/aukoN68lZ+0No/OeYVKVzaFMwrjHNs+Z1dRItHKvFoL6PwYpJiK3RniYWfKL4IbsOB7
        DX31UF9hNnHPnU0J4SaFWlwXoxqhWX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Y4MlGzSeNtCd3ZkJOFmyJQ-1; Wed, 28 Jul 2021 14:07:54 -0400
X-MC-Unique: Y4MlGzSeNtCd3ZkJOFmyJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DADB118C89CC;
        Wed, 28 Jul 2021 18:07:52 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5236419C66;
        Wed, 28 Jul 2021 18:07:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [RFC 1/1] platform/x86: Add and use a dual_accel_detect() helper
Date:   Wed, 28 Jul 2021 20:07:48 +0200
Message-Id: <20210728180748.190258-2-hdegoede@redhat.com>
In-Reply-To: <20210728180748.190258-1-hdegoede@redhat.com>
References: <20210728180748.190258-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Various 360 degree hinges (yoga) style 2-in-1 devices use 2 accelerometers
to allow the OS to determine the angle between the display and the base of
the device.

On Windows these are read by a special HingeAngleService process which
calls undocumented ACPI methods, to let the firmware know if the 2-in-1 is
in tablet- or laptop-mode. The firmware may use this to disable the kbd and
touchpad to avoid spurious input in tablet-mode as well as to report
SW_TABLET_MODE info to the OS.

Since Linux does not call these undocumented methods, the SW_TABLET_MODE
info reported by various pdx86 drivers is incorrect on these devices.

Before this commit the intel-hid and thinkpad_acpi code already had 2
hardcoded checks for ACPI hardware-ids of dual-accel sensors to avoid
reporting broken info.

And now we also have a bug-report about the same problem in the intel-vbtn
code. Since there are at least 3 different ACPI hardware-ids in play, add
a new dual_accel_detect() helper which checks for all 3, rather then
adding different hardware-ids to the drivers as bug-reports trickle in.
Having shared code which checks all known hardware-ids is esp. important
for the intel-hid and intel-vbtn drivers as these are generic drivers
which are used on a lot of devices.

The BOSC0200 hardware-id requires special handling, because often it is
used for a single-accelerometer setup. Only in a few cases it refers to
a dual-accel setup, in which case there will be 2 I2cSerialBus resources
in the device's resource-list, so the helper checks for this.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209011
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig             |  3 +
 drivers/platform/x86/dual_accel_detect.h | 75 ++++++++++++++++++++++++
 drivers/platform/x86/intel-hid.c         | 21 ++-----
 drivers/platform/x86/intel-vbtn.c        | 18 +++++-
 drivers/platform/x86/thinkpad_acpi.c     |  3 +-
 5 files changed, 101 insertions(+), 19 deletions(-)
 create mode 100644 drivers/platform/x86/dual_accel_detect.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7d385c3b2239..d12db6c316ea 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -508,6 +508,7 @@ config THINKPAD_ACPI
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on I2C
 	select ACPI_PLATFORM_PROFILE
 	select HWMON
 	select NVRAM
@@ -691,6 +692,7 @@ config INTEL_HID_EVENT
 	tristate "INTEL HID Event"
 	depends on ACPI
 	depends on INPUT
+	depends on I2C
 	select INPUT_SPARSEKMAP
 	help
 	  This driver provides support for the Intel HID Event hotkey interface.
@@ -742,6 +744,7 @@ config INTEL_VBTN
 	tristate "INTEL VIRTUAL BUTTON"
 	depends on ACPI
 	depends on INPUT
+	depends on I2C
 	select INPUT_SPARSEKMAP
 	help
 	  This driver provides support for the Intel Virtual Button interface.
diff --git a/drivers/platform/x86/dual_accel_detect.h b/drivers/platform/x86/dual_accel_detect.h
new file mode 100644
index 000000000000..1a069159da91
--- /dev/null
+++ b/drivers/platform/x86/dual_accel_detect.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Helper code to detect 360 degree hinges (yoga) style 2-in-1 devices using 2 accelerometers
+ * to allow the OS to determine the angle between the display and the base of the device.
+ *
+ * On Windows these are read by a special HingeAngleService process which calls undocumented
+ * ACPI methods, to let the firmware know if the 2-in-1 is in tablet- or laptop-mode.
+ * The firmware may use this to disable the kbd and touchpad to avoid spurious input in
+ * tablet-mode as well as to report SW_TABLET_MODE info to the OS.
+ *
+ * Since Linux does not call these undocumented methods, the SW_TABLET_MODE info reported
+ * by various drivers/platform/x86 drivers is incorrect. These drivers use the detection
+ * code in this file to disable SW_TABLET_MODE reporting to avoid reporting broken info
+ * (instead userspace can derive the status itself by directly reading the 2 accels).
+ */
+
+#include <linux/acpi.h>
+#include <linux/i2c.h>
+
+static int dual_accel_i2c_resource_count(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_i2c_serialbus *sb;
+	int *count = data;
+
+	if (i2c_acpi_get_i2c_resource(ares, &sb))
+		*count = *count + 1;
+
+	return 1;
+}
+
+static int dual_accel_i2c_client_count(struct acpi_device *adev)
+{
+	int ret, count = 0;
+	LIST_HEAD(r);
+
+	ret = acpi_dev_get_resources(adev, &r, dual_accel_i2c_resource_count, &count);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&r);
+	return count;
+}
+
+static bool dual_accel_detect_bosc0200(void)
+{
+	struct acpi_device *adev;
+	int count;
+
+	adev = acpi_dev_get_first_match_dev("BOSC0200", NULL, -1);
+	if (!adev)
+		return false;
+
+	count = dual_accel_i2c_client_count(adev);
+
+	acpi_dev_put(adev);
+
+	return count == 2;
+}
+
+static bool dual_accel_detect(void)
+{
+	/* Systems which use a pair of accels with KIOX010A / KIOX020A ACPI ids */
+	if (acpi_dev_present("KIOX010A", NULL, -1))
+		return true;
+
+	/* Systems which use a single DUAL250E ACPI device to model 2 accels */
+	if (acpi_dev_present("DUAL250E", NULL, -1))
+		return true;
+
+	/* Systems which use a single BOSC0200 ACPI device to model 2 accels */
+	if (dual_accel_detect_bosc0200())
+		return true;
+
+	return false;
+}
diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index e5fbe017f8e1..2e4e97a626a5 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
+#include "dual_accel_detect.h"
 
 /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
 #define TABLET_MODE_FLAG BIT(6)
@@ -122,6 +123,7 @@ struct intel_hid_priv {
 	struct input_dev *array;
 	struct input_dev *switches;
 	bool wakeup_mode;
+	bool dual_accel;
 };
 
 #define HID_EVENT_FILTER_UUID	"eeec56b3-4442-408f-a792-4edd4d758054"
@@ -451,22 +453,9 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	 * SW_TABLET_MODE report, in these cases we enable support when receiving
 	 * the first event instead of during driver setup.
 	 *
-	 * Some 360 degree hinges (yoga) style 2-in-1 devices use 2 accelerometers
-	 * to allow the OS to determine the angle between the display and the base
-	 * of the device. On Windows these are read by a special HingeAngleService
-	 * process which calls an ACPI DSM (Device Specific Method) on the
-	 * ACPI KIOX010A device node for the sensor in the display, to let the
-	 * firmware know if the 2-in-1 is in tablet- or laptop-mode so that it can
-	 * disable the kbd and touchpad to avoid spurious input in tablet-mode.
-	 *
-	 * The linux kxcjk1013 driver calls the DSM for this once at probe time
-	 * to ensure that the builtin kbd and touchpad work. On some devices this
-	 * causes a "spurious" 0xcd event on the intel-hid ACPI dev. In this case
-	 * there is not a functional tablet-mode switch, so we should not register
-	 * the tablet-mode switch device.
+	 * See dual_accel_detect.h for more info on the dual_accel check.
 	 */
-	if (!priv->switches && (event == 0xcc || event == 0xcd) &&
-	    !acpi_dev_present("KIOX010A", NULL, -1)) {
+	if (!priv->switches && !priv->dual_accel && (event == 0xcc || event == 0xcd)) {
 		dev_info(&device->dev, "switch event received, enable switches supports\n");
 		err = intel_hid_switches_setup(device);
 		if (err)
@@ -607,6 +596,8 @@ static int intel_hid_probe(struct platform_device *device)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
 
+	priv->dual_accel = dual_accel_detect();
+
 	err = intel_hid_input_setup(device);
 	if (err) {
 		pr_err("Failed to setup Intel HID hotkeys\n");
diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 888a764efad1..309166431063 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
+#include "dual_accel_detect.h"
 
 /* Returned when NOT in tablet mode on some HP Stream x360 11 models */
 #define VGBS_TABLET_MODE_FLAG_ALT	0x10
@@ -66,6 +67,7 @@ static const struct key_entry intel_vbtn_switchmap[] = {
 struct intel_vbtn_priv {
 	struct input_dev *buttons_dev;
 	struct input_dev *switches_dev;
+	bool dual_accel;
 	bool has_buttons;
 	bool has_switches;
 	bool wakeup_mode;
@@ -160,6 +162,10 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 		input_dev = priv->buttons_dev;
 	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
 		if (!priv->has_switches) {
+			/* See dual_accel_detect.h for more info */
+			if (priv->dual_accel)
+				return;
+
 			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
 			ret = input_register_device(priv->switches_dev);
 			if (ret)
@@ -248,11 +254,15 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
 	{} /* Array terminator */
 };
 
-static bool intel_vbtn_has_switches(acpi_handle handle)
+static bool intel_vbtn_has_switches(acpi_handle handle, bool dual_accel)
 {
 	unsigned long long vgbs;
 	acpi_status status;
 
+	/* See dual_accel_detect.h for more info */
+	if (dual_accel)
+		return false;
+
 	if (!dmi_check_system(dmi_switches_allow_list))
 		return false;
 
@@ -263,13 +273,14 @@ static bool intel_vbtn_has_switches(acpi_handle handle)
 static int intel_vbtn_probe(struct platform_device *device)
 {
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
-	bool has_buttons, has_switches;
+	bool dual_accel, has_buttons, has_switches;
 	struct intel_vbtn_priv *priv;
 	acpi_status status;
 	int err;
 
+	dual_accel = dual_accel_detect();
 	has_buttons = acpi_has_method(handle, "VBDL");
-	has_switches = intel_vbtn_has_switches(handle);
+	has_switches = intel_vbtn_has_switches(handle, dual_accel);
 
 	if (!has_buttons && !has_switches) {
 		dev_warn(&device->dev, "failed to read Intel Virtual Button driver\n");
@@ -281,6 +292,7 @@ static int intel_vbtn_probe(struct platform_device *device)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
 
+	priv->dual_accel = dual_accel;
 	priv->has_buttons = has_buttons;
 	priv->has_switches = has_switches;
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 603156a6e3ed..50ff04c84650 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -73,6 +73,7 @@
 #include <linux/uaccess.h>
 #include <acpi/battery.h>
 #include <acpi/video.h>
+#include "dual_accel_detect.h"
 
 /* ThinkPad CMOS commands */
 #define TP_CMOS_VOLUME_DOWN	0
@@ -3232,7 +3233,7 @@ static int hotkey_init_tablet_mode(void)
 		 * the laptop/tent/tablet mode to the EC. The bmc150 iio driver
 		 * does not support this, so skip the hotkey on these models.
 		 */
-		if (has_tablet_mode && !acpi_dev_present("BOSC0200", "1", -1))
+		if (has_tablet_mode && !dual_accel_detect())
 			tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_GMMS;
 		type = "GMMS";
 	} else if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
-- 
2.31.1


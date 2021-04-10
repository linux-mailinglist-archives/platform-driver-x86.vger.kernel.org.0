Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2982935AF88
	for <lists+platform-driver-x86@lfdr.de>; Sat, 10 Apr 2021 20:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhDJSTf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 10 Apr 2021 14:19:35 -0400
Received: from ned.t-8ch.de ([212.47.237.191]:37962 "EHLO ned.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234392AbhDJSTf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Apr 2021 14:19:35 -0400
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1618078753;
        bh=IAK+kRS5kwVeNyt619n6qjAlMDlCizXlYR690zVVgJU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=niOiihyk4W5BFZZq4Pi7PfMkZM0gFc6PeoJ2029XJSsKvEj73z8L1y5vWfqSM7LOy
         xaGO+L6yWcX1SKdHM3g8yX4Wcc4iP5SbZSIN8ZuDNGMjWZyG5ap06Qiw3hrpnSDF0l
         9s7oYbcQjwgg2IPX2tgynPKXDq6Rh2kXVuP3HPNQ=
To:     platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [PATCH v4] platform/x86: add Gigabyte WMI temperature driver
Date:   Sat, 10 Apr 2021 20:18:56 +0200
Message-Id: <20210410181856.144988-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <6a096978-67ad-6def-6ed0-9ad38a460e95@redhat.com>
References: <6a096978-67ad-6def-6ed0-9ad38a460e95@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Changes since v3:
* Completely hide unusable sensors
* Expose force_load parameter read-only via sysfs
* Naming
* Style cleanups

-- >8 --

Tested with
* X570 I Aorus Pro Wifi (rev 1.0)
* B550M DS3H
* B550 Gaming X V2 (rev.1.x)
* Z390 I AORUS PRO WIFI (rev. 1.0)

The mainboard contains an ITE IT8688E chip for management.
This chips is also handled by drivers/hwmon/i87.c but as it is also used
by the firmware itself it needs an ACPI driver.

Unfortunately not all sensor registers are handled by the firmware and even
less are exposed via WMI.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  11 ++
 drivers/platform/x86/Makefile       |   1 +
 drivers/platform/x86/gigabyte-wmi.c | 195 ++++++++++++++++++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 drivers/platform/x86/gigabyte-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..9c10cfc00fe8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7543,6 +7543,12 @@ F:	Documentation/filesystems/gfs2*
 F:	fs/gfs2/
 F:	include/uapi/linux/gfs2_ondisk.h
 
+GIGABYTE WMI DRIVER
+M:	Thomas Weißschuh <linux@weissschuh.net>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/gigabyte-wmi.c
+
 GNSS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 S:	Maintained
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ad4e630e73e2..96622a2106f7 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -123,6 +123,17 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
+config GIGABYTE_WMI
+	tristate "Gigabyte WMI temperature driver"
+	depends on ACPI_WMI
+	depends on HWMON
+	help
+	  Say Y here if you want to support WMI-based temperature reporting on
+	  Gigabyte mainboards.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gigabyte-wmi.
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI && THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 60d554073749..1621ebfd04fd 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
+obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 
 # Acer
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
new file mode 100644
index 000000000000..c17e51fcf000
--- /dev/null
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright (C) 2021 Thomas Weißschuh <thomas@weissschuh.net>
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#define GIGABYTE_WMI_GUID	"DEADBEEF-2001-0000-00A0-C90629100000"
+#define NUM_TEMPERATURE_SENSORS	6
+
+static bool force_load;
+module_param(force_load, bool, 0444);
+MODULE_PARM_DESC(force_load, "Force loading on unknown platform");
+
+static u8 usable_sensors_mask;
+
+enum gigabyte_wmi_commandtype {
+	GIGABYTE_WMI_BUILD_DATE_QUERY       =   0x1,
+	GIGABYTE_WMI_MAINBOARD_TYPE_QUERY   =   0x2,
+	GIGABYTE_WMI_FIRMWARE_VERSION_QUERY =   0x4,
+	GIGABYTE_WMI_MAINBOARD_NAME_QUERY   =   0x5,
+	GIGABYTE_WMI_TEMPERATURE_QUERY      = 0x125,
+};
+
+struct gigabyte_wmi_args {
+	u32 arg1;
+};
+
+static int gigabyte_wmi_perform_query(struct wmi_device *wdev,
+				      enum gigabyte_wmi_commandtype command,
+				      struct gigabyte_wmi_args *args, struct acpi_buffer *out)
+{
+	const struct acpi_buffer in = {
+		.length = sizeof(*args),
+		.pointer = args,
+	};
+
+	acpi_status ret = wmidev_evaluate_method(wdev, 0x0, command, &in, out);
+
+	if ACPI_FAILURE(ret)
+		return -EIO;
+
+	return 0;
+}
+
+static int gigabyte_wmi_query_integer(struct wmi_device *wdev,
+				      enum gigabyte_wmi_commandtype command,
+				      struct gigabyte_wmi_args *args, u64 *res)
+{
+	union acpi_object *obj;
+	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
+	int ret;
+
+	ret = gigabyte_wmi_perform_query(wdev, command, args, &result);
+	if (ret)
+		return ret;
+	obj = result.pointer;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		*res = obj->integer.value;
+	else
+		ret = -EIO;
+	kfree(result.pointer);
+	return ret;
+}
+
+static int gigabyte_wmi_temperature(struct wmi_device *wdev, u8 sensor, long *res)
+{
+	struct gigabyte_wmi_args args = {
+		.arg1 = sensor,
+	};
+	u64 temp;
+	acpi_status ret;
+
+	ret = gigabyte_wmi_query_integer(wdev, GIGABYTE_WMI_TEMPERATURE_QUERY, &args, &temp);
+	if (ret == 0) {
+		if (temp == 0)
+			return -ENODEV;
+		*res = (s8)temp * 1000; // value is a signed 8-bit integer
+	}
+	return ret;
+}
+
+static int gigabyte_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+				   u32 attr, int channel, long *val)
+{
+	struct wmi_device *wdev = dev_get_drvdata(dev);
+
+	return gigabyte_wmi_temperature(wdev, channel, val);
+}
+
+static umode_t gigabyte_wmi_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+					     u32 attr, int channel)
+{
+	return usable_sensors_mask & BIT(channel) ? 0444  : 0;
+}
+
+static const struct hwmon_channel_info *gigabyte_wmi_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops gigabyte_wmi_hwmon_ops = {
+	.read = gigabyte_wmi_hwmon_read,
+	.is_visible = gigabyte_wmi_hwmon_is_visible,
+};
+
+static const struct hwmon_chip_info gigabyte_wmi_hwmon_chip_info = {
+	.ops = &gigabyte_wmi_hwmon_ops,
+	.info = gigabyte_wmi_hwmon_info,
+};
+
+static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
+{
+	int i;
+	long temp;
+	u8 r = 0;
+
+	for (i = 0; i < NUM_TEMPERATURE_SENSORS; i++) {
+		if (!gigabyte_wmi_temperature(wdev, i, &temp))
+			r |= BIT(i);
+	}
+	return r;
+}
+
+static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
+	{ .matches = {
+		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
+		DMI_EXACT_MATCH(DMI_BOARD_NAME, "B550 GAMING X V2"),
+	}},
+	{ .matches = {
+		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
+		DMI_EXACT_MATCH(DMI_BOARD_NAME, "B550M DS3H"),
+	}},
+	{ .matches = {
+		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
+		DMI_EXACT_MATCH(DMI_BOARD_NAME, "Z390 I AORUS PRO WIFI-CF"),
+	}},
+	{ .matches = {
+		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
+		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 I AORUS PRO WIFI"),
+	}},
+	{ }
+};
+
+static int gigabyte_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct device *hwmon_dev;
+
+	if (!dmi_check_system(gigabyte_wmi_known_working_platforms)) {
+		if (!force_load)
+			return -ENODEV;
+		dev_warn(&wdev->dev, "Forcing load on unknown platform");
+	}
+
+	usable_sensors_mask = gigabyte_wmi_detect_sensor_usability(wdev);
+	if (!usable_sensors_mask) {
+		dev_info(&wdev->dev, "No temperature sensors usable");
+		return -ENODEV;
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev, "gigabyte_wmi", wdev,
+							 &gigabyte_wmi_hwmon_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct wmi_device_id gigabyte_wmi_id_table[] = {
+	{ GIGABYTE_WMI_GUID, NULL },
+	{ }
+};
+
+static struct wmi_driver gigabyte_wmi_driver = {
+	.driver = {
+		.name = "gigabyte-wmi",
+	},
+	.id_table = gigabyte_wmi_id_table,
+	.probe = gigabyte_wmi_probe,
+};
+module_wmi_driver(gigabyte_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, gigabyte_wmi_id_table);
+MODULE_AUTHOR("Thomas Weißschuh <thomas@weissschuh.net>");
+MODULE_DESCRIPTION("Gigabyte WMI temperature Driver");
+MODULE_LICENSE("GPL");

base-commit: 144c79ef33536b4ecb4951e07dbc1f2b7fa99d32
-- 
2.31.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C23234C21
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 22:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgGaUU4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 16:20:56 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9297 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGaUU4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 16:20:56 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f247cc90000>; Fri, 31 Jul 2020 13:19:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 13:20:55 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 Jul 2020 13:20:55 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 20:20:54 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@dell.com>, <pobrn@protonmail.com>
CC:     <andy@infradead.org>, <dvhart@infradead.org>,
        <aplattner@nvidia.com>, Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH v2 1/2] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Date:   Fri, 31 Jul 2020 15:21:53 -0500
Message-ID: <20200731202154.11382-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596226761; bh=QYPn+58ugcma5pLegDt+y+Mv2vxHRLN5WGqcb8nKEac=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         X-Originating-IP:X-ClientProxiedBy:Content-Type;
        b=HUpoRwQhCbX5TlZCSCFWrfwlRgZvfaMIQnFkZkkhuFlla/N4FgWK0GqLoy4Y+8fYO
         iPyXBsDJKQj6WA+o/OUKz0Bcd7CTK2tXlCXJhkKRdL5iht0Sp4nkN+UxYGVkK5DRDw
         ai1vZtp73eurOtcUg3REd8/PFVRjDk5iSxb43DYUN8GvshTfJc3datMXKdxojakEFP
         45wu4Bl/BFiY3LTMB7UGvhhfbWkMmdpY9uO2wQ8ObZpxqqq8+kM/14ie0GkRaEj8PI
         W8Zq4DactJ1P3WQzNPAAzP5h5S1yVT0N2k+n0z2AbgAxD3+WQW7jyDeeoOK7sVSuAN
         srOoyDiiMjRvQ==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A number of upcoming notebook computer designs drive the internal
display panel's backlight PWM through the Embedded Controller (EC).
This EC-based backlight control can be plumbed through to an ACPI
"WMAA" method interface, which in turn can be wrapped by WMI with
the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.

Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
backlight class driver to control backlight levels on systems with
EC-driven backlights.

Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 MAINTAINERS                               |   6 +
 drivers/platform/x86/Kconfig              |  11 ++
 drivers/platform/x86/Makefile             |   2 +
 drivers/platform/x86/wmaa-backlight-wmi.c | 188 ++++++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index eeff55560759..e5ce6544a3c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18249,6 +18249,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Odd fixes
 F:	drivers/net/wireless/wl3501*
 
+WMAA BACKLIGHT DRIVER
+M:	Daniel Dadap <ddadap@nvidia.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/wmaa-backlight-wmi.c
+
 WOLFSON MICROELECTRONICS DRIVERS
 L:	patches@opensource.cirrus.com
 T:	git https://github.com/CirrusLogic/linux-drivers.git
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0ad7ad8cf8e1..db342e480aa9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1368,6 +1368,17 @@ config INTEL_TELEMETRY
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
 
+config WMAA_BACKLIGHT_WMI
+	tristate "ACPI WMAA Backlight Driver"
+	depends on ACPI_WMI
+	depends on ACPI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  This driver provides a sysfs backlight interface for notebook
+	  systems which expose the WMAA ACPI method and an associated WMI
+	  wrapper to drive LCD backlight levels through the system's
+	  Embedded Controller.
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 53408d965874..fb6e16d62031 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)		+= intel_telemetry_core.o \
 					   intel_telemetry_pltdrv.o \
 					   intel_telemetry_debugfs.o
 obj-$(CONFIG_PMC_ATOM)			+= pmc_atom.o
+
+obj-$(CONFIG_WMAA_BACKLIGHT_WMI)	+= wmaa-backlight-wmi.o
diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
new file mode 100644
index 000000000000..65117082787d
--- /dev/null
+++ b/drivers/platform/x86/wmaa-backlight-wmi.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * WMAA Backlight WMI driver
+ *
+ * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/backlight.h>
+#include <linux/wmi.h>
+
+MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
+MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
+MODULE_DESCRIPTION("WMAA Backlight WMI driver");
+MODULE_LICENSE("GPL v2");
+
+#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
+
+MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
+
+struct wmi_wmaa_priv {
+	struct backlight_device *backlight;
+};
+
+enum wmaa_method {
+	WMAA_BRIGHTNESS_LEVEL = 1,
+	WMAA_BRIGHTNESS_SOURCE = 2,
+};
+
+enum wmaa_get_or_set {
+	WMAA_GET = 0,
+	WMAA_SET = 1,
+	WMAA_GET_MAX = 2, // for WMAA_BRIGHTNESS_LEVEL only
+};
+
+enum wmaa_source {
+	WMAA_SOURCE_CLEAR = 0,
+	WMAA_SOURCE_GPU = 1,
+	WMAA_SOURCE_EC = 2,
+	WMAA_SOURCE_AUX = 3,
+	WMAA_SOURCE_COUNT
+};
+
+struct wmaa_args {
+	u32 set;
+	u32 val;
+	u32 ret;
+	u32 ignored[3];
+};
+
+static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
+	{ .guid_string = WMAA_WMI_GUID },
+	{ },
+};
+
+static struct wmi_device *wdev;
+
+static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set set,
+			 u32 *val)
+{
+	struct wmaa_args args = {
+		.set = set,
+		.val = 0,
+		.ret = 0,
+	};
+	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
+	acpi_status status;
+
+	if (set == WMAA_SET)
+		args.val = *val;
+
+	status = wmidev_evaluate_method(wdev, 0, method, &buf, &buf);
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI WMAA failed with %s\n",
+			acpi_format_exception(status));
+		return -EIO;
+	}
+
+	if (set != WMAA_SET)
+		*val = args.ret;
+
+	return 0;
+}
+
+static int wmaa_get_brightness(u32 *level)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
+}
+
+static int wmaa_set_brightness(u32 level)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
+}
+
+static int wmaa_backlight_update_status(struct backlight_device *bd)
+{
+	return wmaa_set_brightness(bd->props.brightness);
+}
+
+static int wmaa_backlight_get_brightness(struct backlight_device *bd)
+{
+	u32 level;
+	int ret = wmaa_get_brightness(&level);
+
+	WARN_ON(ret != 0);
+	return ret == 0 ? level : 0;
+}
+
+static const struct backlight_ops wmaa_backlight_ops = {
+	.update_status = wmaa_backlight_update_status,
+	.get_brightness = wmaa_backlight_get_brightness,
+};
+
+static int wmaa_get_max_brightness(u32 *level)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
+}
+
+static int wmaa_get_brightness_source(u32 *source)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
+}
+
+static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
+{
+	struct wmi_wmaa_priv *priv;
+	struct backlight_properties props = {0};
+	u32 source;
+
+	priv = devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
+	if(!priv)
+		return -ENOMEM;
+
+	wdev = w;
+
+	if (wmaa_get_brightness_source(&source))
+		return -EINVAL;
+	if (source != WMAA_SOURCE_EC)
+		return -ENODEV;
+
+	// Register a backlight handler
+	props.type = BACKLIGHT_PLATFORM;
+	if (wmaa_get_max_brightness(&props.max_brightness) ||
+	    wmaa_get_brightness(&props.brightness))
+		return -EINVAL;
+
+	priv->backlight = backlight_device_register("wmaa_backlight",
+		NULL, NULL, &wmaa_backlight_ops, &props);
+	if (IS_ERR(priv->backlight))
+		return PTR_ERR(priv->backlight);
+
+	dev_set_drvdata(&w->dev, priv);
+
+	return 0;
+}
+
+static int wmaa_backlight_wmi_remove(struct wmi_device *wdev)
+{
+	struct wmi_wmaa_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	backlight_device_unregister(priv->backlight);
+
+	return 0;
+}
+
+static struct wmi_driver wmaa_backlight_wmi_driver = {
+	.driver = {
+		.name = "wmaa-backlight",
+	},
+	.probe = wmaa_backlight_wmi_probe,
+	.remove = wmaa_backlight_wmi_remove,
+	.id_table = wmaa_backlight_wmi_id_table,
+};
+
+module_wmi_driver(wmaa_backlight_wmi_driver);
-- 
2.18.4


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BFF22FABF
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 22:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgG0Uzv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 16:55:51 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14543 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgG0Uzt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 16:55:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3efb0000>; Mon, 27 Jul 2020 13:54:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:55:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:55:49 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:55:48 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     Daniel Dadap <ddadap@nvidia.com>,
        Aaron Plattner <aplattner@nvidia.com>
Subject: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Date:   Mon, 27 Jul 2020 15:57:03 -0500
Message-ID: <20200727205703.28140-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883259; bh=cmdCrKHsnWo+U8Ny0OYGH6ChU3ARo2aqti8qI0Qo2yU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:X-Originating-IP:
         X-ClientProxiedBy:Content-Type;
        b=e/bsxDGBwE8hZh92LHtmzuflTvqwaC1ORDO4uw4zleeRhLbgZSaxVvGU8BOA17evV
         ftO3k4oG0j+uGCQ66HjxgAYohLsqO+r4b9tpNUFT51vLRnXQDLCTy5PPMQ+L0U2QDX
         TnW9sRMtjX/D0BP7ODLJ+E9NVWIAKDI1hPzrLcnwh/oDOAHjcz1iDiiJuPU1f+Pe1e
         VFT85VPWHpgIlaeQidvVFsTdArkQCIgd4c29dar+iESRD6GD2AXUPG5RxVAec7iQT2
         0qYj1CEUw6pDSCvYakDbzew1/KPKeYyfGHW8oWOaq8wvpMw76czaMw58IfUH+yLdMp
         XrEeKS5KIVdzg==
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
 drivers/platform/x86/wmaa-backlight-wmi.c | 153 ++++++++++++++++++++++
 4 files changed, 172 insertions(+)
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
index 000000000000..890e9371f91a
--- /dev/null
+++ b/drivers/platform/x86/wmaa-backlight-wmi.c
@@ -0,0 +1,153 @@
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
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/backlight.h>
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
+static struct backlight_device *backlight;
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
+	status = wmi_evaluate_method(WMAA_WMI_GUID, 0, method, &buf, &buf);
+	if (ACPI_FAILURE(status))
+		return status;
+	if (set != WMAA_SET)
+		*val = args.ret;
+	return status;
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
+	return level;
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
+static int __init wmaa_backlight_wmi_init(void)
+{
+	struct backlight_properties props;
+	u32 source;
+
+	if (!wmi_has_guid(WMAA_WMI_GUID))
+		return -ENODEV;
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
+	backlight = backlight_device_register("wmaa_backlight", NULL, NULL,
+					      &wmaa_backlight_ops, &props);
+	if (IS_ERR(backlight))
+		return PTR_ERR(backlight);
+
+	return 0;
+}
+
+static void __exit wmaa_backlight_wmi_exit(void)
+{
+	backlight_device_unregister(backlight);
+}
+
+module_init(wmaa_backlight_wmi_init);
+module_exit(wmaa_backlight_wmi_exit);
-- 
2.18.4


Return-Path: <platform-driver-x86+bounces-10638-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BBA73221
	for <lists+platform-driver-x86@lfdr.de>; Thu, 27 Mar 2025 13:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 243D91893D5C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 27 Mar 2025 12:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742EB2139B1;
	Thu, 27 Mar 2025 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="IvBs1ThM"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net [46.105.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777D213259
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077703; cv=none; b=IcT03OHni7jwyaxlnJ6KnEADKwhRnlqLOfpKokilAk/thBkBXJpBgGDrf/cu7vbz50PuMYq/1ImS80MyX2CZgWNw2ui6kXNscBOwKi3kfYn4+r6Wvq7XcdLprNnKv4smMOO4XzSgZyHmFrLHe4M2S0NJ8RGvQbb3aKWyAFJ2ztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077703; c=relaxed/simple;
	bh=1TLlo7t73tOVM8az+hO+EVPyZRzlMLh8iTLIdiN2r6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPt7ks/j7fiD1Apkub6fwnoTwgOKr6cpph/yWnPgzKjRC+y23E6u6m0Lk52fMO8aRSiBs8pnopDdiDnuFCfItGV/10eXrJLwostYTcmYyqvtia20/wC64FvXaFFNqawVsVHacXAslpohPtCMoMRIgeHr3ZAEnkkFCIlYcHs52zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=IvBs1ThM; arc=none smtp.client-ip=46.105.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.140.28])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZNhSs2ztcz1jXM
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 11:36:45 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6vhnb (unknown [10.111.174.181])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B105B1FD49;
	Thu, 27 Mar 2025 11:36:44 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-6vhnb with ESMTPSA
	id 7yJBHks45WcSBAAAcBNYtg:T2
	(envelope-from <michal.kopec@3mdeb.com>); Thu, 27 Mar 2025 11:36:44 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S0011a5b3fbf-2c67-41a2-bd09-3f4cc0c4d781,
                    05DB09BA71DD90540B36DFBD267885ED49907206) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:89.64.23.248
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com
Subject: [PATCH 1/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Thu, 27 Mar 2025 12:36:34 +0100
Message-ID: <20250327113634.314746-2-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327113634.314746-1-michal.kopec@3mdeb.com>
References: <20250327113634.314746-1-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4056898843381927208
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgeehveejkeevkeetheeuveeiuedvieekgffgheelfefhkeduheeiudekhfefhfenucfkphepuddvjedrtddrtddruddpkeelrdeigedrvdefrddvgeekpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=IJcYGAKOyLXH2D0tckaBE4tA6WFkThycnQLFd1YZDCs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743075405; v=1;
 b=IvBs1ThMM7ztMPiUSpTCUN5+zniYRYWP3cqSohAmGpstqoQF1WZQHNwfs2Yw2IvrJolpU/3C
 IUQ7XHTE9icFY7qa6s9Gjdd773pnYKmoESwUb0pNcYEYwT7I3Sf/VIrM24vns0ymO6KY6VjPvx3
 QjWX61nGEoWaX51qHaNsEL0vc+ttSPa2CpP3rv8yBGXPk4fiyQNQXPUF3sntPN5yWekCLZqueOo
 jxA/5rg6qIT7rebtAvfGFCZlYXPJiaiPzdIckkKr0f3moWtJDOcGzOwEYT0gmmp1PUirBVBSgZ6
 HevVkA61PQrqz3ViXw1t9FVGNLP6NLOo6/S5n1LF9FDyQ==

Introduce a driver for devices running Dasharo firmware. The driver
supports thermal monitoring using a new ACPI interface in Dasharo. The
initial version supports monitoring fan speeds, fan PWM duty cycles and
system temperatures as well as determining which specific interfaces are
implemented by firmware.

It has been tested on a NovaCustom laptop running pre-release Dasharo
firmware, which implements fan and thermal monitoring for the CPU and
the discrete GPU, if present.

Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
---
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 399 ++++++++++++++++++++++++++++
 3 files changed, 412 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..8168c5274a08 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1060,6 +1060,16 @@ config LENOVO_WMI_CAMERA
 	  To compile this driver as a module, choose M here: the module
 	  will be called lenovo-wmi-camera.
 
+config DASHARO_ACPI
+	tristate "Dasharo ACPI Platform Driver"
+	depends on ACPI
+	depends on HWMON
+	help
+	  This driver provides HWMON support for devices running Dasharo
+	  firmware.
+
+	  If you have a device with Dasharo firmware, choose Y or M here.
+
 source "drivers/platform/x86/x86-android-tablets/Kconfig"
 
 config FW_ATTR_CLASS
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..3ca53ae01d93 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -110,6 +110,9 @@ obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 # Inspur
 obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+= inspur_platform_profile.o
 
+# Dasharo
+obj-$(CONFIG_DASHARO_ACPI)	+= dasharo-acpi.o
+
 # Laptop drivers
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
new file mode 100644
index 000000000000..0f3bdf6bd463
--- /dev/null
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Dasharo ACPI Driver
+ *
+ * Copyright (C) 2025 3mdeb Sp. z o.o.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+enum dasharo_feature {
+	DASHARO_FEATURE_TEMPERATURE = 0,
+	DASHARO_FEATURE_FAN_PWM,
+	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_FAN_POINTS,
+	DASHARO_FEATURE_MAX,
+};
+
+enum dasharo_temperature {
+	DASHARO_TEMPERATURE_CPU_PACKAGE = 0,
+	DASHARO_TEMPERATURE_CPU_CORE,
+	DASHARO_TEMPERATURE_GPU,
+	DASHARO_TEMPERATURE_BOARD,
+	DASHARO_TEMPERATURE_CHASSIS,
+	DASHARO_TEMPERATURE_MAX,
+};
+
+enum dasharo_fan {
+	DASHARO_FAN_CPU = 0,
+	DASHARO_FAN_GPU,
+	DASHARO_FAN_CHASSIS,
+	DASHARO_FAN_MAX,
+};
+
+static char *dasharo_temp_group_name[DASHARO_TEMPERATURE_MAX] = {
+	[DASHARO_TEMPERATURE_CPU_PACKAGE] = "CPU Package",
+	[DASHARO_TEMPERATURE_CPU_CORE] = "CPU Core",
+	[DASHARO_TEMPERATURE_GPU] = "GPU",
+	[DASHARO_TEMPERATURE_BOARD] = "Board",
+	[DASHARO_TEMPERATURE_CHASSIS] = "Chassis",
+};
+
+static char *dasharo_fan_group_name[DASHARO_FAN_MAX] = {
+	[DASHARO_FAN_CPU] = "CPU",
+	[DASHARO_FAN_GPU] = "GPU",
+	[DASHARO_FAN_CHASSIS] = "Chassis",
+};
+
+#define MAX_CAP_NAME_LEN 16
+
+struct dasharo_capability {
+	int cap;
+	int index;
+	char name[MAX_CAP_NAME_LEN];
+};
+
+#define MAX_CAPS_PER_FEAT 24
+
+struct dasharo_data {
+	struct acpi_device *acpi_dev;
+	int sensors_count;
+	int fan_tachs_count;
+	int fan_pwms_count;
+	struct dasharo_capability sensors[MAX_CAPS_PER_FEAT];
+	struct dasharo_capability fan_tachs[MAX_CAPS_PER_FEAT];
+	struct dasharo_capability fan_pwms[MAX_CAPS_PER_FEAT];
+	struct device *hwmon;
+};
+
+static int dasharo_get_feature_cap_count(struct dasharo_data *data, int feat, int cap)
+{
+	union acpi_object obj[2];
+	struct acpi_object_list obj_list;
+	acpi_handle handle;
+	acpi_status status;
+	unsigned long long ret = 0;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = feat;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = cap;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_integer(handle, "GFCP", &obj_list, &ret);
+	if (ACPI_SUCCESS(status))
+		return ret;
+	return -ENODEV;
+}
+
+static int dasharo_read_value_by_cap_idx(struct dasharo_data *data, char *method, int cap, int index, long *value)
+{
+	union acpi_object obj[2];
+	struct acpi_object_list obj_list;
+	acpi_handle handle;
+	acpi_status status;
+	unsigned long long ret = 0;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = cap;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = index;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_integer(handle, method, &obj_list, &ret);
+	if (ACPI_SUCCESS(status)) {
+		*value = ret;
+		return ret;
+	}
+	return -ENODEV;
+}
+
+static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+	long value;
+
+	if (type == hwmon_temp) {
+		if (attr == hwmon_temp_input) {
+			ret = dasharo_read_value_by_cap_idx(data,
+							    "GTMP",
+							    data->sensors[channel].cap,
+							    data->sensors[channel].index,
+							    &value);
+
+			if (ret > 0)
+				*val = value * 1000;
+		}
+	} else if (type == hwmon_fan) {
+		if (attr == hwmon_fan_input) {
+			ret = dasharo_read_value_by_cap_idx(data,
+							    "GFTH",
+							    data->fan_tachs[channel].cap,
+							    data->fan_tachs[channel].index,
+							    &value);
+
+			if (ret > 0)
+				*val = value;
+		}
+	} else if (type == hwmon_pwm) {
+		if (attr == hwmon_pwm_input) {
+			ret = dasharo_read_value_by_cap_idx(data,
+							    "GFDC",
+							    data->fan_tachs[channel].cap,
+							    data->fan_tachs[channel].index,
+							    &value);
+
+			if (ret > 0)
+				*val = value;
+		}
+	}
+
+	return ret;
+}
+
+static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+
+	if (channel < data->sensors_count && type == hwmon_temp && attr == hwmon_temp_label) {
+		*str = data->sensors[channel].name;
+		return 0;
+	} else if (channel < data->fan_tachs_count && type == hwmon_fan && attr == hwmon_fan_label) {
+		*str = data->fan_tachs[channel].name;
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	const struct dasharo_data *data = drvdata;
+
+	if (channel < data->sensors_count && type == hwmon_temp)
+		return 0444;
+
+	if (channel < data->fan_pwms_count && type == hwmon_pwm)
+		return 0444;
+
+	if (channel < data->fan_tachs_count && type == hwmon_fan)
+		return 0444;
+
+	return 0;
+}
+static const struct hwmon_ops dasharo_hwmon_ops = {
+	.is_visible = dasharo_hwmon_is_visible,
+	.read_string = dasharo_hwmon_read_string,
+	.read = dasharo_hwmon_read,
+};
+
+// Max 24 capabilities per feature
+static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
+	.ops = &dasharo_hwmon_ops,
+	.info = dasharo_hwmon_info,
+};
+
+static void dasharo_fill_sensors(struct dasharo_data *data)
+{
+	int group = 0;
+	int count = 0;
+
+	while (group < DASHARO_TEMPERATURE_MAX) {
+		count = dasharo_get_feature_cap_count(data, DASHARO_FEATURE_TEMPERATURE, group);
+
+		for (int i = 0; i < count && data->sensors_count < MAX_CAPS_PER_FEAT; ++i) {
+			data->sensors[data->sensors_count].cap = group;
+			data->sensors[data->sensors_count].index = i;
+			snprintf(data->sensors[data->sensors_count].name, MAX_CAP_NAME_LEN, "%s %d", dasharo_temp_group_name[group], i);
+			data->sensors_count++;
+		}
+
+		group++;
+	}
+}
+
+static void dasharo_fill_fan_tachs(struct dasharo_data *data)
+{
+	int group = 0;
+	int count = 0;
+
+	while (group < DASHARO_FAN_MAX) {
+		count = dasharo_get_feature_cap_count(data, DASHARO_FEATURE_FAN_TACH, group);
+
+		for (int i = 0; i < count && data->fan_tachs_count < MAX_CAPS_PER_FEAT; ++i) {
+			data->fan_tachs[data->fan_tachs_count].cap = group;
+			data->fan_tachs[data->fan_tachs_count].index = i;
+			snprintf(data->fan_tachs[data->fan_tachs_count].name, MAX_CAP_NAME_LEN, "%s %d", dasharo_fan_group_name[group], i);
+			data->fan_tachs_count++;
+		}
+
+		group++;
+	}
+}
+
+static void dasharo_fill_fan_pwms(struct dasharo_data *data)
+{
+	int group = 0;
+	int count = 0;
+
+	while (group < DASHARO_FAN_MAX) {
+		count = dasharo_get_feature_cap_count(data, DASHARO_FEATURE_FAN_PWM, group);
+
+		for (int i = 0; i < count && data->fan_pwms_count < MAX_CAPS_PER_FEAT; ++i) {
+			data->fan_pwms[data->fan_pwms_count].cap = group;
+			data->fan_pwms[data->fan_pwms_count].index = i;
+			snprintf(data->fan_pwms[data->fan_pwms_count].name, MAX_CAP_NAME_LEN, "%s %d", dasharo_fan_group_name[group], i);
+			data->fan_pwms_count++;
+		}
+
+		group++;
+	}
+}
+
+static int dasharo_add(struct acpi_device *acpi_dev)
+{
+	struct dasharo_data *data;
+
+	data = devm_kzalloc(&acpi_dev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	acpi_dev->driver_data = data;
+	data->acpi_dev = acpi_dev;
+
+	pr_info("Dasharo driver loading\n");
+
+	dasharo_fill_sensors(data);
+	dasharo_fill_fan_tachs(data);
+	dasharo_fill_fan_pwms(data);
+
+	data->hwmon = devm_hwmon_device_register_with_info(&acpi_dev->dev,
+		"dasharo_acpi", data, &dasharo_hwmon_chip_info, NULL);
+
+	return 0;
+}
+
+static void dasharo_remove(struct acpi_device *acpi_dev)
+{
+	struct dasharo_data *data = acpi_driver_data(acpi_dev);
+
+	hwmon_device_unregister(data->hwmon);
+}
+
+static const struct acpi_device_id device_ids[] = {
+	{"DSHR0001", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, device_ids);
+
+static struct acpi_driver dasharo_driver = {
+	.name = "Dasharo ACPI Driver",
+	.class = "Dasharo",
+	.ids = device_ids,
+	.ops = {
+		.add = dasharo_add,
+		.remove = dasharo_remove,
+	},
+};
+module_acpi_driver(dasharo_driver);
+
+MODULE_DESCRIPTION("Dasharo ACPI Driver");
+MODULE_AUTHOR("Michał Kopeć <michal.kopec@3mdeb.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0



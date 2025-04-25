Return-Path: <platform-driver-x86+bounces-11491-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E7A9C7C3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 25 Apr 2025 13:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7B6167573
	for <lists+platform-driver-x86@lfdr.de>; Fri, 25 Apr 2025 11:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29EF241CB0;
	Fri, 25 Apr 2025 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="Jwa0ipwD"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14DC1C7019
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.59.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581133; cv=none; b=F/yQuwnZbAMjHVI2vcnYRfiDIbZCcogeQxwg2edk5H73J1KyyX4hkB8wITCWp4XQsqtVZD9QL4MxYXE43enAEbjJGN56LgCKY/UkHy/doKVQQhzzgvEbGV01HVIbyQ50ECQv7ZENTA2CEJAVZAQHsefjFF9BWciXrqucQCC3q8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581133; c=relaxed/simple;
	bh=0XbM/qYtsHC48/hF2CVmxd3BhXxbAL4AaEBrj+UaMCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uhV/2OQMVNqJlaJK+3S0k/u0eSrCRmjHJccAf5ZpsaOxwMUGBX/qI8E9rgMoeB1yotVSE7LP/TR75rANxyC+KkstqPp18M97qyKUsuzC2jbz9MUfqh6wX5gFlu/rJFcRyLbiOTAJCuSw+fDevmJcvFqtWaK5iZacD38DnVm6MFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=Jwa0ipwD; arc=none smtp.client-ip=46.105.59.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.176.118])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZkVmf07zWz1rr6
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 11:22:09 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tf4sx (unknown [10.110.164.115])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C7B701FE80;
	Fri, 25 Apr 2025 11:22:08 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-tf4sx with ESMTPSA
	id Aq1wBF9wC2jbfgAAIqE1SQ:T2
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 25 Apr 2025 11:22:08 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R001f5c0d59a-6191-43ff-b744-3be2a60ed502,
                    189BF360F9312264DCAC3AB77C65C4FB1C0F3093) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	tomasz.pakula.oficjalny@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v8 1/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri, 25 Apr 2025 13:21:47 +0200
Message-ID: <20250425112147.69308-2-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425112147.69308-1-michal.kopec@3mdeb.com>
References: <20250425112147.69308-1-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8097753607649234194
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefhhfdtgeeuleethedvkeejkeejvddvhfeftefhueefhffhheeileeivdfffeenucffohhmrghinhepuggrshhhrghrohdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=RQnNlVdD/qXGrOd4loupBjwjnbdTZKTNqoph06Dadrw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745580130; v=1;
 b=Jwa0ipwDk0niNkfgyXG0JG8M65b9m3Cv2Yrx7PkjZ87wXjrBTLvDtN7ONAUxLZ561c1QQELB
 EYWsppdAAgJYT72moQWEpkA28+enIABDqw6lPs6j+VCAL3hzqDBSquQhxXAiHZFA2iX9XTmgYDu
 itWIYLhLTcv2vIy3vSgusejFYcIs8H2fzSVqOEg2uA05tICwVqQZ9ZUhz2TpOtwhIjQPDTDClDk
 lm96jdKCVWBXaFVPbShHnEaf2T3EqeIgP4Ojio5WVDit37SfBhDg9zvDaWV4mKNVa3vwQzGfQax
 AZBsINJGVDETyZ+FXEL2Jtu94nBWBfmV7Vgli1JQ0Tz0Q==

Introduce a driver for devices running Dasharo firmware. The driver
supports thermal monitoring using a new ACPI interface in Dasharo. The
initial version supports monitoring fan speeds, fan PWM duty cycles and
system temperatures as well as determining which specific interfaces are
implemented by firmware.

It has been tested on a NovaCustom laptop running pre-release Dasharo
firmware, which implements fan and thermal monitoring for the CPU and
the discrete GPU, if present.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
---
 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 360 ++++++++++++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 00e94bec401e..6d2e0909ac63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6404,6 +6404,12 @@ F:	net/ax25/ax25_out.c
 F:	net/ax25/ax25_timer.c
 F:	net/ax25/sysctl_net_ax25.c
 
+DASHARO ACPI PLATFORM DRIVER
+M:	Michał Kopeć <michal.kopec@3mdeb.com>
+S:	Maintained
+W:	https://docs.dasharo.com/
+F:	drivers/platform/x86/dasharo_acpi.c
+
 DATA ACCESS MONITOR
 M:	SeongJae Park <sj@kernel.org>
 L:	damon@lists.linux.dev
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
index 000000000000..f10f52e44641
--- /dev/null
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Dasharo ACPI Driver
+ */
+
+#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+enum dasharo_feature {
+	DASHARO_FEATURE_TEMPERATURE = 0,
+	DASHARO_FEATURE_FAN_PWM,
+	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_MAX
+};
+
+enum dasharo_temperature {
+	DASHARO_TEMPERATURE_CPU_PACKAGE = 0,
+	DASHARO_TEMPERATURE_CPU_CORE,
+	DASHARO_TEMPERATURE_GPU,
+	DASHARO_TEMPERATURE_BOARD,
+	DASHARO_TEMPERATURE_CHASSIS,
+	DASHARO_TEMPERATURE_MAX
+};
+
+enum dasharo_fan {
+	DASHARO_FAN_CPU = 0,
+	DASHARO_FAN_GPU,
+	DASHARO_FAN_CHASSIS,
+	DASHARO_FAN_MAX
+};
+
+#define MAX_GROUPS_PER_FEAT 8
+
+static const char * const dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PER_FEAT] = {
+	[DASHARO_FEATURE_TEMPERATURE] = {
+		[DASHARO_TEMPERATURE_CPU_PACKAGE] = "CPU Package",
+		[DASHARO_TEMPERATURE_CPU_CORE] = "CPU Core",
+		[DASHARO_TEMPERATURE_GPU] = "GPU",
+		[DASHARO_TEMPERATURE_BOARD] = "Board",
+		[DASHARO_TEMPERATURE_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_PWM] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_TACH] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+};
+
+struct dasharo_capability {
+	unsigned int group;
+	unsigned int index;
+	char name[16];
+};
+
+#define MAX_CAPS_PER_FEAT 24
+
+struct dasharo_data {
+	struct platform_device *pdev;
+	int caps_found[DASHARO_FEATURE_MAX];
+	struct dasharo_capability capabilities[DASHARO_FEATURE_MAX][MAX_CAPS_PER_FEAT];
+};
+
+static int dasharo_get_feature_cap_count(struct dasharo_data *data, enum dasharo_feature feat, int cap)
+{
+	struct acpi_object_list obj_list;
+	union acpi_object obj[2];
+	acpi_handle handle;
+	acpi_status status;
+	u64 count;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = feat;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = cap;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = ACPI_HANDLE(&data->pdev->dev);
+	status = acpi_evaluate_integer(handle, "GFCP", &obj_list, &count);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	return count;
+}
+
+static int dasharo_read_channel(struct dasharo_data *data, char *method, enum dasharo_feature feat, int channel, long *value)
+{
+	struct acpi_object_list obj_list;
+	union acpi_object obj[2];
+	acpi_handle handle;
+	acpi_status status;
+	u64 val;
+
+	if (feat > ARRAY_SIZE(data->capabilities))
+		return -EINVAL;
+
+	if (channel > data->caps_found[feat])
+		return -EINVAL;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = data->capabilities[feat][channel].group;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = data->capabilities[feat][channel].index;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = ACPI_HANDLE(&data->pdev->dev);
+	status = acpi_evaluate_integer(handle, method, &obj_list, &val);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	*value = val;
+	return 0;
+}
+
+static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	long value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = dasharo_read_channel(data, "GTMP", DASHARO_FEATURE_TEMPERATURE, channel, &value);
+		if (!ret)
+			*val = value * MILLIDEGREE_PER_DEGREE;
+		break;
+	case hwmon_fan:
+		ret = dasharo_read_channel(data, "GFTH", DASHARO_FEATURE_FAN_TACH, channel, &value);
+		if (!ret)
+			*val = value;
+		break;
+	case hwmon_pwm:
+		ret = dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, channel, &value);
+		if (!ret)
+			*val = value;
+		break;
+	default:
+		return -ENODEV;
+		break;
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
+	switch (type) {
+	case hwmon_temp:
+		if (channel >= data->caps_found[DASHARO_FEATURE_TEMPERATURE])
+			return -EINVAL;
+
+		*str = data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].name;
+		break;
+	case hwmon_fan:
+		if (channel >= data->caps_found[DASHARO_FEATURE_FAN_TACH])
+			return -EINVAL;
+
+		*str = data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].name;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	const struct dasharo_data *data = drvdata;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->caps_found[DASHARO_FEATURE_TEMPERATURE])
+			return 0444;
+		break;
+	case hwmon_pwm:
+		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
+			return 0444;
+		break;
+	case hwmon_fan:
+		if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
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
+static void dasharo_fill_feature_caps(struct dasharo_data *data, enum dasharo_feature feat)
+{
+	struct dasharo_capability *cap;
+	int cap_count = 0;
+	int count;
+
+	for (int group = 0; group < MAX_GROUPS_PER_FEAT; ++group) {
+		count = dasharo_get_feature_cap_count(data, feat, group);
+		if (count <= 0)
+			continue;
+
+		for (unsigned int i = 0; i < count; ++i) {
+			if (cap_count >= ARRAY_SIZE(data->capabilities[feat]))
+				break;
+
+			cap = &data->capabilities[feat][cap_count];
+			cap->group = group;
+			cap->index = i;
+			scnprintf(cap->name, sizeof(cap->name), "%s %d",
+				  dasharo_group_names[feat][group], i);
+			cap_count++;
+		}
+	}
+	data->caps_found[feat] = cap_count;
+}
+
+static int dasharo_probe(struct platform_device *pdev)
+{
+	struct dasharo_data *data;
+	struct device *hwmon;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->pdev = pdev;
+
+	for (unsigned int i = 0; i < DASHARO_FEATURE_MAX; ++i)
+		dasharo_fill_feature_caps(data, i);
+
+	hwmon = devm_hwmon_device_register_with_info(&pdev->dev, "dasharo_acpi", data,
+						     &dasharo_hwmon_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static const struct acpi_device_id dasharo_device_ids[] = {
+	{"DSHR0001", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, dasharo_device_ids);
+
+static struct platform_driver dasharo_driver = {
+	.driver = {
+		.name = "dasharo-acpi",
+		.acpi_match_table = dasharo_device_ids,
+	},
+	.probe = dasharo_probe,
+};
+module_platform_driver(dasharo_driver);
+
+MODULE_DESCRIPTION("Dasharo ACPI Driver");
+MODULE_AUTHOR("Michał Kopeć <michal.kopec@3mdeb.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0



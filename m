Return-Path: <platform-driver-x86+bounces-8769-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B058AA14AE2
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Jan 2025 09:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964C1188A27D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Jan 2025 08:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F96F1F9ECD;
	Fri, 17 Jan 2025 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqSAGVig"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB5D1F9AA4;
	Fri, 17 Jan 2025 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101701; cv=none; b=BFJySb9vYlYKQzDCY0vmlDr/i45q1eoXfq8OvWFk+KbpYwnSoSsJU23L9UCiroee3h1HMSbZTU4s4sT84SYraXEus7rrA0S/vKW4105V+DQIxC5xysxWkTbr3yxtpuz2V6zs0xuNXENO/bKFTbZHanSamoREVYhcCGjpeiqmL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101701; c=relaxed/simple;
	bh=ArNNOLu58wufArhRYMl0E+3K3H3+CWDrh5P8Xtno/W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXUfUu+UFlgDT0ZHC8Q03T/6KtPOl53U542BAe3G97WNOPKlz06uOH9iNtbmclJPSkWHDRx/IeTP8Ej16VmjpJCZ3TghEn0sJ9sQRI+s3m+DlBwYyJZl4+TqEhss8vzl1bnfP4hnMUrTWweL2CCNc4qbP/BhcPRN2RfZhp8iwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqSAGVig; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso504443241.1;
        Fri, 17 Jan 2025 00:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101697; x=1737706497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4UuS4M70H/aRiEe/4lZSa5VYJE4NFr3fbz6BS/+wyY=;
        b=VqSAGVigYw/fJaIHdU6NFH4nk620Mx+DteClaRmLX5ygqByOFjNors87EeBtkXLC7Z
         bRzFXKh5DcbZomfzSypIsojfnhTY0ottxV0R3LBjTpOgX2SVkojXcy3qhbrTfgOdAVcK
         SM5kr84a9J2XMjfYpCUhyokYMrnttcSgSGSOxm09FzePYlTUbdru2yj6xodIY3MVSIUa
         bB1vIcGq4oUufZqWkqT/iRGQPCMlEUJmv5XG3p8IUiWbK9yrw2tsdJFuvaV0FfHnuKPD
         dIIaMlIdJduBb3mnuLwQOAmTwVavDTURSFZLaIwYsCHA6/MN3P/hHtWp4bnma5ougaZp
         hZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101697; x=1737706497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4UuS4M70H/aRiEe/4lZSa5VYJE4NFr3fbz6BS/+wyY=;
        b=ayH3OdB/2viGy4ROJWQI9SITm3Cz19vxGP409HB9hrFUzaYeARZyFRtMJzKIauqxV4
         vsvWlyJJgLBEC6h9Cd+eU00y3SF9Cfru0/m4wMbLnmYZlvlwgDBXKVmxnb8ya+DD4NUi
         7WcV2MEAVu2V57K10LFuPtWYnRhplNmtkkHu394O6fvVeeAsj0Fj2MVh/syadtQLuMwr
         QX5BbmPRm7drWWAgy7VPmBx8BMjwI7agc7EXi8DMiycSC8W3zthH/WY/bQDIWGZAS1Ui
         lxhjfq8u8RN5vLSBxvZ7rne0uJz1oI1/p8l4hQbUU3F3YTe8T3qzUtS52jp2QeHNZGTq
         P3WA==
X-Forwarded-Encrypted: i=1; AJvYcCVa8RI+YUlqKKO6fEjjHwbDA2iuBNtKm9Trhe4WLugOOd1niFZSpCShCsrUdhW+AiZybATbCGlJ6v6W0ds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JkgT8SXVjkkqn16inzSoaVlJWpLlDN7VhlwPomlu0uCnZbvx
	ZpxBA2AfN3Rcc1OEQ5uq+fL+dckZWrSnsXZhHQsy/PciXv3ERBCCR4sPSQ==
X-Gm-Gg: ASbGncvaI9caEC3cdyJb7RApUtdY0zkpy+gNMqbRZtQOoFYODQI0F11Q/cuqaHYJmgZ
	NR1DWXQ5ZjuI28zp5O/BROR3UGHpNTPytzJ0Hd7h+Jai8i1lD/OVzufXanO2BYEhlD0R/PPQoCR
	snlv1Pfx8BIxbCySa/1rP70d68G4lXVLc8Pw5HPgyJ2ETFCOulE3sAn0EIyV+7KAHNO57xMLvb3
	U1scVx6h4O5Wk1akQ0ouK1iGb+1+1Q741xbYqKfMMXQw8Uh3IovVkctR5fX8fKm
X-Google-Smtp-Source: AGHT+IGNHSKqtOtwqohWYRkycswZMS85ndQ7o/86ug2vXwyz4mboepjAoHoN3kZ0L4I5REgWJpq28Q==
X-Received: by 2002:a05:6102:571b:b0:4b4:7cb0:ac99 with SMTP id ada2fe7eead31-4b690b65075mr1146932137.2.1737101696417;
        Fri, 17 Jan 2025 00:14:56 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:55 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 11/14] platform/x86: Split the alienware-wmi driver
Date: Fri, 17 Jan 2025 03:13:44 -0500
Message-ID: <20250117081347.8573-12-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split alienware-wmi WMI drivers into different files. This is done
seamlessly by copying and pasting, however some blocks are reordered.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile            |   2 +
 .../platform/x86/dell/alienware-wmi-base.c    | 849 ------------------
 .../platform/x86/dell/alienware-wmi-legacy.c  | 100 +++
 .../platform/x86/dell/alienware-wmi-wmax.c    | 773 ++++++++++++++++
 drivers/platform/x86/dell/alienware-wmi.h     |   1 -
 5 files changed, 875 insertions(+), 850 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index f8aec8502c2f..03ba459f3d31 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -6,6 +6,8 @@
 
 obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
 alienware-wmi-objs			:= alienware-wmi-base.o
+alienware-wmi-y				+= alienware-wmi-legacy.o
+alienware-wmi-y				+= alienware-wmi-wmax.o
 obj-$(CONFIG_DCDBAS)			+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 702bf21988f2..e55c962c84d7 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -8,96 +8,21 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/bitfield.h>
-#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/platform_profile.h>
 #include <linux/dmi.h>
 #include <linux/leds.h>
-#include <linux/wmi.h>
 #include "alienware-wmi.h"
 
-#define WMAX_METHOD_HDMI_SOURCE		0x1
-#define WMAX_METHOD_HDMI_STATUS		0x2
-#define WMAX_METHOD_BRIGHTNESS		0x3
-#define WMAX_METHOD_ZONE_CONTROL	0x4
-#define WMAX_METHOD_HDMI_CABLE		0x5
-#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
-#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
-#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
-#define WMAX_METHOD_THERMAL_INFORMATION	0x14
-#define WMAX_METHOD_THERMAL_CONTROL	0x15
-#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
-
-#define WMAX_THERMAL_MODE_GMODE		0xAB
-
-#define WMAX_FAILURE_CODE		0xFFFFFFFF
-
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-static bool force_platform_profile;
-module_param_unsafe(force_platform_profile, bool, 0);
-MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
-
-static bool force_gmode;
-module_param_unsafe(force_gmode, bool, 0);
-MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
-
 enum INTERFACE_FLAGS {
 	LEGACY,
 	WMAX,
 };
 
-enum WMAX_THERMAL_INFORMATION_OPERATIONS {
-	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
-	WMAX_OPERATION_LIST_IDS			= 0x03,
-	WMAX_OPERATION_CURRENT_PROFILE		= 0x0B,
-};
-
-enum WMAX_THERMAL_CONTROL_OPERATIONS {
-	WMAX_OPERATION_ACTIVATE_PROFILE		= 0x01,
-};
-
-enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
-	WMAX_OPERATION_TOGGLE_GAME_SHIFT	= 0x01,
-	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	= 0x02,
-};
-
-enum WMAX_THERMAL_TABLES {
-	WMAX_THERMAL_TABLE_BASIC		= 0x90,
-	WMAX_THERMAL_TABLE_USTT			= 0xA0,
-};
-
-enum wmax_thermal_mode {
-	THERMAL_MODE_USTT_BALANCED,
-	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
-	THERMAL_MODE_USTT_COOL,
-	THERMAL_MODE_USTT_QUIET,
-	THERMAL_MODE_USTT_PERFORMANCE,
-	THERMAL_MODE_USTT_LOW_POWER,
-	THERMAL_MODE_BASIC_QUIET,
-	THERMAL_MODE_BASIC_BALANCED,
-	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
-	THERMAL_MODE_BASIC_PERFORMANCE,
-	THERMAL_MODE_LAST,
-};
-
-static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_MODE_LAST] = {
-	[THERMAL_MODE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
-	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-	[THERMAL_MODE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
-	[THERMAL_MODE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
-	[THERMAL_MODE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
-	[THERMAL_MODE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
-	[THERMAL_MODE_BASIC_QUIET]			= PLATFORM_PROFILE_QUIET,
-	[THERMAL_MODE_BASIC_BALANCED]			= PLATFORM_PROFILE_BALANCED,
-	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
-};
-
 struct alienfx_quirks *alienfx;
 
 static struct alienfx_quirks quirk_inspiron5675 = {
@@ -222,139 +147,8 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 	{}
 };
 
-struct wmax_brightness_args {
-	u32 led_mask;
-	u32 percentage;
-};
-
-struct wmax_basic_args {
-	u8 arg;
-};
-
-struct legacy_led_args {
-	struct color_platform colors;
-	u8 brightness;
-	u8 state;
-} __packed;
-
-struct wmax_led_args {
-	u32 led_mask;
-	struct color_platform colors;
-	u8 state;
-} __packed;
-
-struct wmax_u32_args {
-	u8 operation;
-	u8 arg1;
-	u8 arg2;
-	u8 arg3;
-};
-
-struct awcc_priv {
-	struct wmi_device *wdev;
-	struct device *ppdev;
-	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-};
-
 static u8 interface;
 
-struct awcc_quirks {
-	bool gmode;
-};
-
-static struct awcc_quirks g_series_quirks = {
-	.gmode = true,
-};
-
-static struct awcc_quirks generic_quirks = {
-	.gmode = false,
-};
-
-static const struct dmi_system_id awcc_dmi_table[] __initconst = {
-	{
-		.ident = "Alienware m17 R5",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware m18 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware x15 R1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware x17 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Dell Inc. G15 5510",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G15 5511",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G15 5515",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G3 3500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G3 3590",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G5 5500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-};
-
-struct awcc_quirks *awcc;
-
 int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 			  void *in_args, size_t in_size, u32 *out_data)
 {
@@ -589,449 +383,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
 	return priv->global_brightness;
 }
 
-/*
- *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
- *	It can toggle between standard system GPU output and HDMI input.
- */
-static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 0)
-			return sysfs_emit(buf, "[unconnected] connected unknown\n");
-		else if (out_data == 1)
-			return sysfs_emit(buf, "unconnected [connected] unknown\n");
-	}
-
-	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
-	return sysfs_emit(buf, "unconnected connected [unknown]\n");
-}
-
-static ssize_t source_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 1)
-			return sysfs_emit(buf, "[input] gpu unknown\n");
-		else if (out_data == 2)
-			return sysfs_emit(buf, "input [gpu] unknown\n");
-	}
-
-	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
-	return sysfs_emit(buf, "input gpu [unknown]\n");
-}
-
-static ssize_t source_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args args;
-	int ret;
-
-	if (strcmp(buf, "gpu\n") == 0)
-		args.arg = 1;
-	else if (strcmp(buf, "input\n") == 0)
-		args.arg = 2;
-	else
-		args.arg = 3;
-	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
-				    sizeof(args), NULL);
-
-	if (ret < 0)
-		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
-
-	return count;
-}
-
-static DEVICE_ATTR_RO(cable);
-static DEVICE_ATTR_RW(source);
-
-static bool hdmi_group_visible(struct kobject *kobj)
-{
-	return alienfx->hdmi_mux;
-}
-DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
-
-static struct attribute *hdmi_attrs[] = {
-	&dev_attr_cable.attr,
-	&dev_attr_source.attr,
-	NULL,
-};
-
-static const struct attribute_group hdmi_attribute_group = {
-	.name = "hdmi",
-	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
-	.attrs = hdmi_attrs,
-};
-
-/*
- * Alienware GFX amplifier support
- * - Currently supports reading cable status
- * - Leaving expansion room to possibly support dock/undock events later
- */
-static ssize_t status_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 0)
-			return sysfs_emit(buf, "[unconnected] connected unknown\n");
-		else if (out_data == 1)
-			return sysfs_emit(buf, "unconnected [connected] unknown\n");
-	}
-
-	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
-	return sysfs_emit(buf, "unconnected connected [unknown]\n");
-}
-
-static DEVICE_ATTR_RO(status);
-
-static bool amplifier_group_visible(struct kobject *kobj)
-{
-	return alienfx->amplifier;
-}
-DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
-
-static struct attribute *amplifier_attrs[] = {
-	&dev_attr_status.attr,
-	NULL,
-};
-
-static const struct attribute_group amplifier_attribute_group = {
-	.name = "amplifier",
-	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
-	.attrs = amplifier_attrs,
-};
-
-/*
- * Deep Sleep Control support
- * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
- */
-static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 0)
-			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
-		else if (out_data == 1)
-			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
-		else if (out_data == 2)
-			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
-	}
-
-	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
-	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
-}
-
-static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
-			       const char *buf, size_t count)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args args;
-	int ret;
-
-	if (strcmp(buf, "disabled\n") == 0)
-		args.arg = 0;
-	else if (strcmp(buf, "s5\n") == 0)
-		args.arg = 1;
-	else
-		args.arg = 2;
-	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
-				    &args, sizeof(args), NULL);
-
-	if (!ret)
-		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
-
-	return count;
-}
-
-static DEVICE_ATTR_RW(deepsleep);
-
-static bool deepsleep_group_visible(struct kobject *kobj)
-{
-	return alienfx->deepslp;
-}
-DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
-
-static struct attribute *deepsleep_attrs[] = {
-	&dev_attr_deepsleep.attr,
-	NULL,
-};
-
-static const struct attribute_group deepsleep_attribute_group = {
-	.name = "deepsleep",
-	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
-	.attrs = deepsleep_attrs,
-};
-
-/*
- * Thermal Profile control
- *  - Provides thermal profile control through the Platform Profile API
- */
-#define WMAX_THERMAL_TABLE_MASK		GENMASK(7, 4)
-#define WMAX_THERMAL_MODE_MASK		GENMASK(3, 0)
-#define WMAX_SENSOR_ID_MASK		BIT(8)
-
-static bool is_wmax_thermal_code(u32 code)
-{
-	if (code & WMAX_SENSOR_ID_MASK)
-		return false;
-
-	if ((code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_LAST)
-		return false;
-
-	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_BASIC &&
-	    (code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_BASIC_QUIET)
-		return true;
-
-	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
-	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
-		return true;
-
-	return false;
-}
-
-static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
-				    u8 arg, u32 *out_data)
-{
-	struct wmax_u32_args in_args = {
-		.operation = operation,
-		.arg1 = arg,
-		.arg2 = 0,
-		.arg3 = 0,
-	};
-	int ret;
-
-	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
-				    &in_args, sizeof(in_args), out_data);
-	if (ret < 0)
-		return ret;
-
-	if (*out_data == WMAX_FAILURE_CODE)
-		return -EBADRQC;
-
-	return 0;
-}
-
-static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
-{
-	struct wmax_u32_args in_args = {
-		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
-		.arg1 = profile,
-		.arg2 = 0,
-		.arg3 = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
-				    &in_args, sizeof(in_args), &out_data);
-	if (ret)
-		return ret;
-
-	if (out_data == WMAX_FAILURE_CODE)
-		return -EBADRQC;
-
-	return 0;
-}
-
-static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
-				  u32 *out_data)
-{
-	struct wmax_u32_args in_args = {
-		.operation = operation,
-		.arg1 = 0,
-		.arg2 = 0,
-		.arg3 = 0,
-	};
-	int ret;
-
-	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
-				    &in_args, sizeof(in_args), out_data);
-
-	if (ret < 0)
-		return ret;
-
-	if (*out_data == WMAX_FAILURE_CODE)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
-static int thermal_profile_get(struct device *dev,
-			       enum platform_profile_option *profile)
-{
-	struct awcc_priv *priv = dev_get_drvdata(dev);
-	u32 out_data;
-	int ret;
-
-	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
-				       0, &out_data);
-
-	if (ret < 0)
-		return ret;
-
-	if (out_data == WMAX_THERMAL_MODE_GMODE) {
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		return 0;
-	}
-
-	if (!is_wmax_thermal_code(out_data))
-		return -ENODATA;
-
-	out_data &= WMAX_THERMAL_MODE_MASK;
-	*profile = wmax_mode_to_platform_profile[out_data];
-
-	return 0;
-}
-
-static int thermal_profile_set(struct device *dev,
-			       enum platform_profile_option profile)
-{
-	struct awcc_priv *priv = dev_get_drvdata(dev);
-
-	if (awcc->gmode) {
-		u32 gmode_status;
-		int ret;
-
-		ret = wmax_game_shift_status(priv->wdev,
-					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
-					     &gmode_status);
-
-		if (ret < 0)
-			return ret;
-
-		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
-		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(priv->wdev,
-						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
-						     &gmode_status);
-
-			if (ret < 0)
-				return ret;
-		}
-	}
-
-	return wmax_thermal_control(priv->wdev,
-				    priv->supported_thermal_profiles[profile]);
-}
-
-static int thermal_profile_probe(void *drvdata, unsigned long *choices)
-{
-	enum platform_profile_option profile;
-	struct awcc_priv *priv = drvdata;
-	enum wmax_thermal_mode mode;
-	u8 sys_desc[4];
-	u32 first_mode;
-	u32 out_data;
-	int ret;
-
-	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
-				       0, (u32 *) &sys_desc);
-	if (ret < 0)
-		return ret;
-
-	first_mode = sys_desc[0] + sys_desc[1];
-
-	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
-					       i + first_mode, &out_data);
-
-		if (ret == -EIO)
-			return ret;
-
-		if (ret == -EBADRQC)
-			break;
-
-		if (!is_wmax_thermal_code(out_data))
-			continue;
-
-		mode = out_data & WMAX_THERMAL_MODE_MASK;
-		profile = wmax_mode_to_platform_profile[mode];
-		priv->supported_thermal_profiles[profile] = out_data;
-
-		set_bit(profile, choices);
-	}
-
-	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
-		return -ENODEV;
-
-	if (awcc->gmode) {
-		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
-			WMAX_THERMAL_MODE_GMODE;
-
-		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
-	}
-
-	return 0;
-}
-
-static const struct platform_profile_ops awcc_platform_profile_ops = {
-	.probe = thermal_profile_probe,
-	.profile_get = thermal_profile_get,
-	.profile_set = thermal_profile_set,
-};
-
-static int alienware_awcc_setup(struct wmi_device *wdev)
-{
-	struct awcc_priv *priv;
-
-	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->wdev = wdev;
-	dev_set_drvdata(&wdev->dev, priv);
-
-	priv->ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
-						     priv, &awcc_platform_profile_ops);
-
-	return PTR_ERR_OR_ZERO(priv->ppdev);
-}
-
 /*
  * Platform Driver
  */
@@ -1064,13 +415,6 @@ static const struct attribute_group *alienfx_groups[] = {
 	NULL
 };
 
-static const struct attribute_group *wmax_alienfx_groups[] = {
-	&hdmi_attribute_group,
-	&amplifier_attribute_group,
-	&deepsleep_attribute_group,
-	NULL
-};
-
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "alienware-wmi",
@@ -1110,199 +454,6 @@ void alienware_alienfx_exit(struct wmi_device *wdev)
 	platform_driver_unregister(&platform_driver);
 }
 
-/*
- * Legacy WMI driver
- */
-static int legacy_wmi_update_led(struct alienfx_priv *priv,
-				 struct wmi_device *wdev, u8 location)
-{
-	struct legacy_led_args legacy_args = {
-		.colors = priv->colors[location],
-		.brightness = priv->global_brightness,
-		.state = 0,
-	};
-	struct acpi_buffer input;
-	acpi_status status;
-
-	if (legacy_args.state != LEGACY_RUNNING) {
-		legacy_args.state = priv->lighting_control_state;
-
-		input.length = sizeof(legacy_args);
-		input.pointer = &legacy_args;
-
-		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
-					     location + 1, &input, NULL);
-		if (ACPI_FAILURE(status))
-			return -EIO;
-
-		return 0;
-	}
-
-	return alienware_wmi_command(wdev, location + 1, &legacy_args,
-				     sizeof(legacy_args), NULL);
-}
-
-static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
-					struct wmi_device *wdev, u8 brightness)
-{
-	return legacy_wmi_update_led(priv, wdev, 0);
-}
-
-static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
-{
-	struct alienfx_platdata pdata = {
-		.wdev = wdev,
-		.ops = {
-			.upd_led = legacy_wmi_update_led,
-			.upd_brightness = legacy_wmi_update_brightness,
-		},
-	};
-
-	return alienware_alienfx_setup(&pdata);
-}
-
-static void legacy_wmi_remove(struct wmi_device *wdev)
-{
-	alienware_alienfx_exit(wdev);
-}
-
-static struct wmi_device_id alienware_legacy_device_id_table[] = {
-	{ LEGACY_CONTROL_GUID, NULL },
-	{ },
-};
-MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
-
-static struct wmi_driver alienware_legacy_wmi_driver = {
-	.driver = {
-		.name = "alienware-wmi-alienfx",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.id_table = alienware_legacy_device_id_table,
-	.probe = legacy_wmi_probe,
-	.remove = legacy_wmi_remove,
-};
-
-int __init alienware_legacy_wmi_init(void)
-{
-	return wmi_driver_register(&alienware_legacy_wmi_driver);
-}
-
-void __exit alienware_legacy_wmi_exit(void)
-{
-	wmi_driver_unregister(&alienware_legacy_wmi_driver);
-}
-
-/*
- * WMAX WMI driver
- */
-static int wmax_wmi_update_led(struct alienfx_priv *priv,
-			       struct wmi_device *wdev, u8 location)
-{
-	struct wmax_led_args in_args = {
-		.led_mask = 1 << location,
-		.colors = priv->colors[location],
-		.state = priv->lighting_control_state,
-	};
-
-	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
-				     sizeof(in_args), NULL);
-}
-
-static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
-				      struct wmi_device *wdev, u8 brightness)
-{
-	struct wmax_brightness_args in_args = {
-		.led_mask = 0xFF,
-		.percentage = brightness,
-	};
-
-	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
-				     sizeof(in_args), NULL);
-}
-
-static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
-{
-	struct alienfx_platdata pdata = {
-		.wdev = wdev,
-		.ops = {
-			.upd_led = wmax_wmi_update_led,
-			.upd_brightness = wmax_wmi_update_brightness,
-		},
-	};
-	struct platform_device *pdev;
-	int ret;
-
-	if (awcc) {
-		return alienware_awcc_setup(wdev);
-	} else {
-		ret = alienware_alienfx_setup(&pdata);
-		if (ret < 0)
-			return ret;
-
-		pdev = dev_get_drvdata(&wdev->dev);
-
-		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
-		if (ret < 0)
-			alienware_alienfx_exit(wdev);
-
-		return ret;
-	}
-}
-
-static void wmax_wmi_remove(struct wmi_device *wdev)
-{
-	struct platform_device *pdev;
-
-	if (!awcc) {
-		pdev = dev_get_drvdata(&wdev->dev);
-
-		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
-		alienware_alienfx_exit(wdev);
-	}
-}
-
-static struct wmi_device_id alienware_wmax_device_id_table[] = {
-	{ WMAX_CONTROL_GUID, NULL },
-	{ },
-};
-MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
-
-static struct wmi_driver alienware_wmax_wmi_driver = {
-	.driver = {
-		.name = "alienware-wmi-wmax",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.id_table = alienware_wmax_device_id_table,
-	.probe = wmax_wmi_probe,
-	.remove = wmax_wmi_remove,
-};
-
-int __init alienware_wmax_wmi_init(void)
-{
-	const struct dmi_system_id *id;
-
-	id = dmi_first_match(awcc_dmi_table);
-	if (id)
-		awcc = id->driver_data;
-
-	if (force_platform_profile)
-		awcc = &generic_quirks;
-
-	if (force_gmode) {
-		if (awcc)
-			awcc->gmode = true;
-		else
-			pr_warn("force_gmode requires platform profile support\n");
-	}
-
-	return wmi_driver_register(&alienware_wmax_wmi_driver);
-}
-
-void __exit alienware_wmax_wmi_exit(void)
-{
-	wmi_driver_unregister(&alienware_wmax_wmi_driver);
-}
-
 static int __init alienware_wmi_init(void)
 {
 	int ret;
diff --git a/drivers/platform/x86/dell/alienware-wmi-legacy.c b/drivers/platform/x86/dell/alienware-wmi-legacy.c
new file mode 100644
index 000000000000..04c1be2efdc4
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-legacy.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Alienware LEGACY WMI device driver
+ *
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/wmi.h>
+#include "alienware-wmi.h"
+
+struct legacy_led_args {
+	struct color_platform colors;
+	u8 brightness;
+	u8 state;
+} __packed;
+
+
+/*
+ * Legacy WMI driver
+ */
+static int legacy_wmi_update_led(struct alienfx_priv *priv,
+				 struct wmi_device *wdev, u8 location)
+{
+	struct legacy_led_args legacy_args = {
+		.colors = priv->colors[location],
+		.brightness = priv->global_brightness,
+		.state = 0,
+	};
+	struct acpi_buffer input;
+	acpi_status status;
+
+	if (legacy_args.state != LEGACY_RUNNING) {
+		legacy_args.state = priv->lighting_control_state;
+
+		input.length = sizeof(legacy_args);
+		input.pointer = &legacy_args;
+
+		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
+					     location + 1, &input, NULL);
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		return 0;
+	}
+
+	return alienware_wmi_command(wdev, location + 1, &legacy_args,
+				     sizeof(legacy_args), NULL);
+}
+
+static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
+					struct wmi_device *wdev, u8 brightness)
+{
+	return legacy_wmi_update_led(priv, wdev, 0);
+}
+
+static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+		.ops = {
+			.upd_led = legacy_wmi_update_led,
+			.upd_brightness = legacy_wmi_update_brightness,
+		},
+	};
+
+	return alienware_alienfx_setup(&pdata);
+}
+
+static void legacy_wmi_remove(struct wmi_device *wdev)
+{
+	alienware_alienfx_exit(wdev);
+}
+
+static struct wmi_device_id alienware_legacy_device_id_table[] = {
+	{ LEGACY_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
+
+static struct wmi_driver alienware_legacy_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-alienfx",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_legacy_device_id_table,
+	.probe = legacy_wmi_probe,
+	.remove = legacy_wmi_remove,
+};
+
+int __init alienware_legacy_wmi_init(void)
+{
+	return wmi_driver_register(&alienware_legacy_wmi_driver);
+}
+
+void __exit alienware_legacy_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_legacy_wmi_driver);
+}
diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
new file mode 100644
index 000000000000..05284f14997d
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -0,0 +1,773 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Alienware WMAX WMI device driver
+ *
+ * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dmi.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_profile.h>
+#include <linux/wmi.h>
+#include "alienware-wmi.h"
+
+#define WMAX_METHOD_HDMI_SOURCE			0x1
+#define WMAX_METHOD_HDMI_STATUS			0x2
+#define WMAX_METHOD_HDMI_CABLE			0x5
+#define WMAX_METHOD_AMPLIFIER_CABLE		0x6
+#define WMAX_METHOD_DEEP_SLEEP_CONTROL		0x0B
+#define WMAX_METHOD_DEEP_SLEEP_STATUS		0x0C
+#define WMAX_METHOD_BRIGHTNESS			0x3
+#define WMAX_METHOD_ZONE_CONTROL		0x4
+#define WMAX_METHOD_THERMAL_INFORMATION		0x14
+#define WMAX_METHOD_THERMAL_CONTROL		0x15
+#define WMAX_METHOD_GAME_SHIFT_STATUS		0x25
+
+#define WMAX_THERMAL_MODE_GMODE			0xAB
+
+#define WMAX_FAILURE_CODE			0xFFFFFFFF
+#define WMAX_THERMAL_TABLE_MASK			GENMASK(7, 4)
+#define WMAX_THERMAL_MODE_MASK			GENMASK(3, 0)
+#define WMAX_SENSOR_ID_MASK			BIT(8)
+
+static bool force_platform_profile;
+module_param_unsafe(force_platform_profile, bool, 0);
+MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
+
+static bool force_gmode;
+module_param_unsafe(force_gmode, bool, 0);
+MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
+
+struct awcc_quirks {
+	bool gmode;
+};
+
+static struct awcc_quirks g_series_quirks = {
+	.gmode = true,
+};
+
+static struct awcc_quirks generic_quirks = {
+	.gmode = false,
+};
+
+static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware m17 R5",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware m18 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x15 R1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x17 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5511",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5515",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3590",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G5 5500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+};
+
+enum WMAX_THERMAL_INFORMATION_OPERATIONS {
+	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
+	WMAX_OPERATION_LIST_IDS			= 0x03,
+	WMAX_OPERATION_CURRENT_PROFILE		= 0x0B,
+};
+
+enum WMAX_THERMAL_CONTROL_OPERATIONS {
+	WMAX_OPERATION_ACTIVATE_PROFILE		= 0x01,
+};
+
+enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
+	WMAX_OPERATION_TOGGLE_GAME_SHIFT	= 0x01,
+	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	= 0x02,
+};
+
+enum WMAX_THERMAL_TABLES {
+	WMAX_THERMAL_TABLE_BASIC		= 0x90,
+	WMAX_THERMAL_TABLE_USTT			= 0xA0,
+};
+
+enum wmax_thermal_mode {
+	THERMAL_MODE_USTT_BALANCED,
+	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
+	THERMAL_MODE_USTT_COOL,
+	THERMAL_MODE_USTT_QUIET,
+	THERMAL_MODE_USTT_PERFORMANCE,
+	THERMAL_MODE_USTT_LOW_POWER,
+	THERMAL_MODE_BASIC_QUIET,
+	THERMAL_MODE_BASIC_BALANCED,
+	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
+	THERMAL_MODE_BASIC_PERFORMANCE,
+	THERMAL_MODE_LAST,
+};
+
+struct wmax_led_args {
+	u32 led_mask;
+	struct color_platform colors;
+	u8 state;
+} __packed;
+
+struct wmax_brightness_args {
+	u32 led_mask;
+	u32 percentage;
+};
+
+struct wmax_basic_args {
+	u8 arg;
+};
+
+struct wmax_u32_args {
+	u8 operation;
+	u8 arg1;
+	u8 arg2;
+	u8 arg3;
+};
+
+struct awcc_priv {
+	struct wmi_device *wdev;
+	struct device *ppdev;
+	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
+};
+
+static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_MODE_LAST] = {
+	[THERMAL_MODE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
+	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+	[THERMAL_MODE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
+	[THERMAL_MODE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
+	[THERMAL_MODE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
+	[THERMAL_MODE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
+	[THERMAL_MODE_BASIC_QUIET]			= PLATFORM_PROFILE_QUIET,
+	[THERMAL_MODE_BASIC_BALANCED]			= PLATFORM_PROFILE_BALANCED,
+	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
+};
+
+struct awcc_quirks *awcc;
+
+/*
+ *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
+ *	It can toggle between standard system GPU output and HDMI input.
+ */
+static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 0)
+			return sysfs_emit(buf, "[unconnected] connected unknown\n");
+		else if (out_data == 1)
+			return sysfs_emit(buf, "unconnected [connected] unknown\n");
+	}
+
+	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
+	return sysfs_emit(buf, "unconnected connected [unknown]\n");
+}
+
+static ssize_t source_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 1)
+			return sysfs_emit(buf, "[input] gpu unknown\n");
+		else if (out_data == 2)
+			return sysfs_emit(buf, "input [gpu] unknown\n");
+	}
+
+	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
+	return sysfs_emit(buf, "input gpu [unknown]\n");
+}
+
+static ssize_t source_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args args;
+	int ret;
+
+	if (strcmp(buf, "gpu\n") == 0)
+		args.arg = 1;
+	else if (strcmp(buf, "input\n") == 0)
+		args.arg = 2;
+	else
+		args.arg = 3;
+	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
+				    sizeof(args), NULL);
+
+	if (ret < 0)
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
+
+	return count;
+}
+
+static DEVICE_ATTR_RO(cable);
+static DEVICE_ATTR_RW(source);
+
+static bool hdmi_group_visible(struct kobject *kobj)
+{
+	return alienfx->hdmi_mux;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
+
+static struct attribute *hdmi_attrs[] = {
+	&dev_attr_cable.attr,
+	&dev_attr_source.attr,
+	NULL,
+};
+
+static const struct attribute_group hdmi_attribute_group = {
+	.name = "hdmi",
+	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
+	.attrs = hdmi_attrs,
+};
+
+/*
+ * Alienware GFX amplifier support
+ * - Currently supports reading cable status
+ * - Leaving expansion room to possibly support dock/undock events later
+ */
+static ssize_t status_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 0)
+			return sysfs_emit(buf, "[unconnected] connected unknown\n");
+		else if (out_data == 1)
+			return sysfs_emit(buf, "unconnected [connected] unknown\n");
+	}
+
+	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
+	return sysfs_emit(buf, "unconnected connected [unknown]\n");
+}
+
+static DEVICE_ATTR_RO(status);
+
+static bool amplifier_group_visible(struct kobject *kobj)
+{
+	return alienfx->amplifier;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
+
+static struct attribute *amplifier_attrs[] = {
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static const struct attribute_group amplifier_attribute_group = {
+	.name = "amplifier",
+	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
+	.attrs = amplifier_attrs,
+};
+
+/*
+ * Deep Sleep Control support
+ * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
+ */
+static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 0)
+			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
+		else if (out_data == 1)
+			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
+		else if (out_data == 2)
+			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
+	}
+
+	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
+	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
+}
+
+static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args args;
+	int ret;
+
+	if (strcmp(buf, "disabled\n") == 0)
+		args.arg = 0;
+	else if (strcmp(buf, "s5\n") == 0)
+		args.arg = 1;
+	else
+		args.arg = 2;
+	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
+				    &args, sizeof(args), NULL);
+
+	if (!ret)
+		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(deepsleep);
+
+static bool deepsleep_group_visible(struct kobject *kobj)
+{
+	return alienfx->deepslp;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
+
+static struct attribute *deepsleep_attrs[] = {
+	&dev_attr_deepsleep.attr,
+	NULL,
+};
+
+static const struct attribute_group deepsleep_attribute_group = {
+	.name = "deepsleep",
+	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
+	.attrs = deepsleep_attrs,
+};
+
+static const struct attribute_group *wmax_alienfx_groups[] = {
+	&hdmi_attribute_group,
+	&amplifier_attribute_group,
+	&deepsleep_attribute_group,
+	NULL
+};
+
+/*
+ * Thermal Profile control
+ *  - Provides thermal profile control through the Platform Profile API
+ */
+static bool is_wmax_thermal_code(u32 code)
+{
+	if (code & WMAX_SENSOR_ID_MASK)
+		return false;
+
+	if ((code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_LAST)
+		return false;
+
+	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_BASIC &&
+	    (code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_BASIC_QUIET)
+		return true;
+
+	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
+	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
+		return true;
+
+	return false;
+}
+
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
+{
+	struct wmax_u32_args in_args = {
+		.operation = operation,
+		.arg1 = arg,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	int ret;
+
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
+				    &in_args, sizeof(in_args), out_data);
+	if (ret < 0)
+		return ret;
+
+	if (*out_data == WMAX_FAILURE_CODE)
+		return -EBADRQC;
+
+	return 0;
+}
+
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
+{
+	struct wmax_u32_args in_args = {
+		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
+		.arg1 = profile,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
+				    &in_args, sizeof(in_args), &out_data);
+	if (ret)
+		return ret;
+
+	if (out_data == WMAX_FAILURE_CODE)
+		return -EBADRQC;
+
+	return 0;
+}
+
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
+{
+	struct wmax_u32_args in_args = {
+		.operation = operation,
+		.arg1 = 0,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	int ret;
+
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
+				    &in_args, sizeof(in_args), out_data);
+
+	if (ret < 0)
+		return ret;
+
+	if (*out_data == WMAX_FAILURE_CODE)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int thermal_profile_get(struct device *dev,
+			       enum platform_profile_option *profile)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	u32 out_data;
+	int ret;
+
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
+				       0, &out_data);
+
+	if (ret < 0)
+		return ret;
+
+	if (out_data == WMAX_THERMAL_MODE_GMODE) {
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		return 0;
+	}
+
+	if (!is_wmax_thermal_code(out_data))
+		return -ENODATA;
+
+	out_data &= WMAX_THERMAL_MODE_MASK;
+	*profile = wmax_mode_to_platform_profile[out_data];
+
+	return 0;
+}
+
+static int thermal_profile_set(struct device *dev,
+			       enum platform_profile_option profile)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+
+	if (awcc->gmode) {
+		u32 gmode_status;
+		int ret;
+
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+					     &gmode_status);
+
+		if (ret < 0)
+			return ret;
+
+		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
+		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+						     &gmode_status);
+
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
+}
+
+static int thermal_profile_probe(void *drvdata, unsigned long *choices)
+{
+	enum platform_profile_option profile;
+	struct awcc_priv *priv = drvdata;
+	enum wmax_thermal_mode mode;
+	u8 sys_desc[4];
+	u32 first_mode;
+	u32 out_data;
+	int ret;
+
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
+				       0, (u32 *) &sys_desc);
+	if (ret < 0)
+		return ret;
+
+	first_mode = sys_desc[0] + sys_desc[1];
+
+	for (u32 i = 0; i < sys_desc[3]; i++) {
+		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
+					       i + first_mode, &out_data);
+
+		if (ret == -EIO)
+			return ret;
+
+		if (ret == -EBADRQC)
+			break;
+
+		if (!is_wmax_thermal_code(out_data))
+			continue;
+
+		mode = out_data & WMAX_THERMAL_MODE_MASK;
+		profile = wmax_mode_to_platform_profile[mode];
+		priv->supported_thermal_profiles[profile] = out_data;
+
+		set_bit(profile, choices);
+	}
+
+	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
+		return -ENODEV;
+
+	if (awcc->gmode) {
+		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+			WMAX_THERMAL_MODE_GMODE;
+
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	}
+
+	return 0;
+}
+
+static const struct platform_profile_ops awcc_platform_profile_ops = {
+	.probe = thermal_profile_probe,
+	.profile_get = thermal_profile_get,
+	.profile_set = thermal_profile_set,
+};
+
+static int alienware_awcc_setup(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	priv->ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
+						     priv, &awcc_platform_profile_ops);
+
+	return PTR_ERR_OR_ZERO(priv->ppdev);
+}
+
+/*
+ * WMAX WMI driver
+ */
+static int wmax_wmi_update_led(struct alienfx_priv *priv,
+			       struct wmi_device *wdev, u8 location)
+{
+	struct wmax_led_args in_args = {
+		.led_mask = 1 << location,
+		.colors = priv->colors[location],
+		.state = priv->lighting_control_state,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
+				     sizeof(in_args), NULL);
+}
+
+static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
+				      struct wmi_device *wdev, u8 brightness)
+{
+	struct wmax_brightness_args in_args = {
+		.led_mask = 0xFF,
+		.percentage = brightness,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
+				     sizeof(in_args), NULL);
+}
+
+static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+		.ops = {
+			.upd_led = wmax_wmi_update_led,
+			.upd_brightness = wmax_wmi_update_brightness,
+		},
+	};
+	struct platform_device *pdev;
+	int ret = 0;
+
+	if (awcc) {
+		return alienware_awcc_setup(wdev);
+	} else {
+		ret = alienware_alienfx_setup(&pdata);
+		if (ret < 0)
+			return ret;
+
+		pdev = dev_get_drvdata(&wdev->dev);
+
+		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
+		if (ret < 0)
+			alienware_alienfx_exit(wdev);
+
+		return ret;
+	}
+}
+
+static void wmax_wmi_remove(struct wmi_device *wdev)
+{
+	struct platform_device *pdev;
+
+	if (!awcc) {
+		pdev = dev_get_drvdata(&wdev->dev);
+
+		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
+		alienware_alienfx_exit(wdev);
+	}
+}
+
+static struct wmi_device_id alienware_wmax_device_id_table[] = {
+	{ WMAX_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
+
+static struct wmi_driver alienware_wmax_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-wmax",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_wmax_device_id_table,
+	.probe = wmax_wmi_probe,
+	.remove = wmax_wmi_remove,
+};
+
+int __init alienware_wmax_wmi_init(void)
+{
+	const struct dmi_system_id *id;
+
+	id = dmi_first_match(awcc_dmi_table);
+	if (id)
+		awcc = id->driver_data;
+
+	if (force_platform_profile)
+		awcc = &generic_quirks;
+
+	if (force_gmode) {
+		if (awcc)
+			awcc->gmode = true;
+		else
+			pr_warn("force_gmode requires platform profile support\n");
+	}
+
+	return wmi_driver_register(&alienware_wmax_wmi_driver);
+}
+
+void __exit alienware_wmax_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_wmax_wmi_driver);
+}
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
index 00b7505e1073..188440ef096e 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -46,7 +46,6 @@ struct color_platform {
 
 struct alienfx_priv {
 	struct platform_device *pdev;
-	struct alienfx_quirks *quirks;
 	struct led_classdev global_led;
 	struct color_platform colors[4];
 	u8 global_brightness;
-- 
2.48.1



Return-Path: <platform-driver-x86+bounces-49-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762F7F7036
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 10:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080361F20F4F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 09:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BF116428;
	Fri, 24 Nov 2023 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN/QIuNk"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD658EA;
	Fri, 24 Nov 2023 01:42:17 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so1378042b3a.3;
        Fri, 24 Nov 2023 01:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700818937; x=1701423737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrmeMWw1USORDmUFPvtwFbLaQiZXCrXNlk5T2YIWwKM=;
        b=dN/QIuNkx7iD+gpXnDjr38HtoxogMnUYQIZWq0oclVWLvL6MbceIMmuMrGKW3cGrLc
         cpMMCp2IJUP6YWfMVQbaM/R8I7lZ66a4jz/p7vxgtOriGPPgkK1tmY46Z0YnhbYOVTPQ
         kPKBVX85qNLRRZGGT2qvC+LlkjfDQz8QbtiC7Q4xgetNdZY7pXh0s90lHvdmKWv35NXe
         Bc9ptg7H9zqhBzMCMVLdZSaESY0lGRp77UNFhCPdpug8YvA3YFB5MO9ZNLDSBdRjQN1h
         ttKqYa4LnxZQw8YbLGhgbyFpkNW/ZmrvGu4GvEsuY6tnT6Mq1EhY3keMFbX7AhCmCyK7
         w4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818937; x=1701423737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrmeMWw1USORDmUFPvtwFbLaQiZXCrXNlk5T2YIWwKM=;
        b=wZvs4IPTfK8UwHlUJ4jQQXQQd766LC4AALscvU2jB4mAStB+nwr8xbq5sCbYuhUcM+
         LbYmd0ZL7E3nT9ihNLA1Zcwb+kgToUSbQSHCiP2itxaq9+Loeu0/rN/nYPo2HGxN1aNx
         TFxs5sOJOI9A4J9iRfOlSyFiAacolXI6WQhVI61nXTSyE1JRr6JeMPSu0yWoJ2NRjTa1
         pxO2zuVY5WWx2rUKZDdfNCrW3hEM5lZMVbUojeqeID9X3dSlTEqKZu4FOxQ3Rj6FpFJL
         dtQ4HbZgcOmQypIzJ7rmxn+vMURiXYZeMKs8O6mrnfJaivaqoNkq2i1U4hahYFE1NyAs
         GocQ==
X-Gm-Message-State: AOJu0Yz1e8iBRq6GnALTz7C74qjlMEq1brg67TKLY8/QlEDS8YQInN1W
	L7+yTty818OQV4H8ugCUXdU=
X-Google-Smtp-Source: AGHT+IHz1CEdbMFGWNh6dIZVSqPnR1lFfaGiWCgVETOFeOfDdPRrck+lLySPy42bhMDULJXtU8RwaQ==
X-Received: by 2002:a05:6a00:2a09:b0:6cb:d24b:3568 with SMTP id ce9-20020a056a002a0900b006cbd24b3568mr1886667pfb.30.1700818937036;
        Fri, 24 Nov 2023 01:42:17 -0800 (PST)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7868a000000b006cb8c92a8acsm2489956pfo.113.2023.11.24.01.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:42:16 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: SungHwan Jung <onenowy@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v4 1/3] platform/x86: acer-wmi: Add platform profile and mode key support for Predator PHN16-71
Date: Fri, 24 Nov 2023 18:41:18 +0900
Message-ID: <20231124094122.100707-2-onenowy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124094122.100707-1-onenowy@gmail.com>
References: <20231124094122.100707-1-onenowy@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 The Acer Predator PHN16-71 has the mode key that is used to rotate
thermal modes or toggle turbo mode with predator sense app (ver. 4) on
windows.
This patch includes platform profile and the mode key support for the
device and also includes a small fix for "WMI_gaming_execute_u64"
function.

Signed-off-by: SungHwan Jung <onenowy@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 268 +++++++++++++++++++++++++++++++-
 1 file changed, 267 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 0e472aa9b..e3650dce0 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -20,6 +20,7 @@
 #include <linux/backlight.h>
 #include <linux/leds.h>
 #include <linux/platform_device.h>
+#include <linux/platform_profile.h>
 #include <linux/acpi.h>
 #include <linux/i8042.h>
 #include <linux/rfkill.h>
@@ -62,9 +63,12 @@ MODULE_LICENSE("GPL");
 
 #define ACER_WMID_SET_GAMING_LED_METHODID 2
 #define ACER_WMID_GET_GAMING_LED_METHODID 4
+#define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
 #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
 
+#define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54
+
 /*
  * Acer ACPI method GUIDs
  */
@@ -90,6 +94,10 @@ enum acer_wmi_event_ids {
 	WMID_GAMING_TURBO_KEY_EVENT = 0x7,
 };
 
+enum acer_wmi_predator_v4_sys_info_command {
+	ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS = 0x02,
+};
+
 static const struct key_entry acer_wmi_keymap[] __initconst = {
 	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
@@ -232,6 +240,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_TURBO_OC     BIT(7)
 #define ACER_CAP_TURBO_LED     BIT(8)
 #define ACER_CAP_TURBO_FAN     BIT(9)
+#define ACER_CAP_PLATFORM_PROFILE BIT(10)
 
 /*
  * Interface type flags
@@ -259,6 +268,7 @@ static bool ec_raw_mode;
 static bool has_type_aa;
 static u16 commun_func_bitmap;
 static u8 commun_fn_key_number;
+static bool cycle_gaming_thermal_profile = true;
 
 module_param(mailled, int, 0444);
 module_param(brightness, int, 0444);
@@ -266,12 +276,16 @@ module_param(threeg, int, 0444);
 module_param(force_series, int, 0444);
 module_param(force_caps, int, 0444);
 module_param(ec_raw_mode, bool, 0444);
+module_param(cycle_gaming_thermal_profile, bool, 0644);
 MODULE_PARM_DESC(mailled, "Set initial state of Mail LED");
 MODULE_PARM_DESC(brightness, "Set initial LCD backlight brightness");
 MODULE_PARM_DESC(threeg, "Set initial state of 3G hardware");
 MODULE_PARM_DESC(force_series, "Force a different laptop series");
 MODULE_PARM_DESC(force_caps, "Force the capability bitmask to this value");
 MODULE_PARM_DESC(ec_raw_mode, "Enable EC raw mode");
+MODULE_PARM_DESC(
+	cycle_gaming_thermal_profile,
+	"Set thermal mode key in cycle mode. Disabling it sets the mode key in turbo toggle mode");
 
 struct acer_data {
 	int mailled;
@@ -321,6 +335,7 @@ struct quirk_entry {
 	u8 turbo;
 	u8 cpu_fans;
 	u8 gpu_fans;
+	u8 predator_v4;
 };
 
 static struct quirk_entry *quirks;
@@ -336,6 +351,9 @@ static void __init set_quirks(void)
 	if (quirks->turbo)
 		interface->capability |= ACER_CAP_TURBO_OC | ACER_CAP_TURBO_LED
 					 | ACER_CAP_TURBO_FAN;
+
+	if (quirks->predator_v4)
+		interface->capability |= ACER_CAP_PLATFORM_PROFILE;
 }
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -370,6 +388,11 @@ static struct quirk_entry quirk_acer_predator_ph315_53 = {
 	.gpu_fans = 1,
 };
 
+static struct quirk_entry quirk_acer_predator_v4 = {
+	.predator_v4 = 1,
+};
+
+
 /* This AMW0 laptop has no bluetooth */
 static struct quirk_entry quirk_medion_md_98300 = {
 	.wireless = 1,
@@ -546,6 +569,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_predator_ph315_53,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Predator PHN16-71",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PHN16-71"),
+		},
+		.driver_data = &quirk_acer_predator_v4,
+	},
 	{
 		.callback = set_force_caps,
 		.ident = "Acer Aspire Switch 10E SW3-016",
@@ -659,6 +691,33 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
 	{}
 };
 
+static struct platform_profile_handler platform_profile_handler;
+static bool platform_profile_support;
+
+/*
+ * The profile used before turbo mode. This variable is needed for
+ * returning from turbo mode when the mode key is in toggle mode.
+ */
+static int last_non_turbo_profile;
+
+enum acer_predator_v4_thermal_profile_ec {
+	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO = 0x04,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO = 0x03,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE = 0x02,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET = 0x01,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED = 0x00,
+};
+
+enum acer_predator_v4_thermal_profile_wmi {
+	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI = 0x060B,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI = 0x050B,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI = 0x040B,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI = 0x0B,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI = 0x010B,
+};
+
+
+
 /* Find which quirks are needed for a particular vendor/ model pair */
 static void __init find_quirks(void)
 {
@@ -1339,7 +1398,7 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out)
 	struct acpi_buffer input = { (acpi_size) sizeof(u64), (void *)(&in) };
 	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
-	u32 tmp = 0;
+	u64 tmp = 0;
 	acpi_status status;
 
 	status = wmi_evaluate_method(WMID_GUID4, 0, method_id, &input, &result);
@@ -1698,6 +1757,199 @@ static int acer_toggle_turbo(void)
 	return turbo_led_state;
 }
 
+static int
+acer_predator_v4_platform_profile_get(struct platform_profile_handler *pprof,
+				      enum platform_profile_option *profile)
+{
+	u8 tp;
+	int err;
+
+	err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET, &tp);
+
+	if (err < 0)
+		return err;
+
+	switch (tp) {
+	case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
+		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+		break;
+	case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
+		*profile = PLATFORM_PROFILE_QUIET;
+		break;
+	case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
+acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
+				      enum platform_profile_option profile)
+{
+	int tp;
+	acpi_status status;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+		break;
+	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+		break;
+	case PLATFORM_PROFILE_QUIET:
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	status = WMI_gaming_execute_u64(
+		ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
+		last_non_turbo_profile = tp;
+
+	return 0;
+}
+
+static int acer_platform_profile_setup(void)
+{
+	if (quirks->predator_v4) {
+		int err;
+
+		platform_profile_handler.profile_get =
+			acer_predator_v4_platform_profile_get;
+		platform_profile_handler.profile_set =
+			acer_predator_v4_platform_profile_set;
+
+		set_bit(PLATFORM_PROFILE_PERFORMANCE,
+			platform_profile_handler.choices);
+		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+			platform_profile_handler.choices);
+		set_bit(PLATFORM_PROFILE_BALANCED,
+			platform_profile_handler.choices);
+		set_bit(PLATFORM_PROFILE_QUIET,
+			platform_profile_handler.choices);
+		set_bit(PLATFORM_PROFILE_LOW_POWER,
+			platform_profile_handler.choices);
+
+		err = platform_profile_register(&platform_profile_handler);
+		if (err)
+			return err;
+
+		platform_profile_support = true;
+
+		/* Set default non-turbo profile  */
+		last_non_turbo_profile =
+			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+	}
+	return 0;
+}
+
+static int acer_thermal_profile_change(void)
+{
+	/*
+	 * This mode key can rotate each mode or toggle turbo mode.
+	 * On battery, only ECO and BALANCED mode are available.
+	 */
+	if (quirks->predator_v4) {
+		u8 current_tp;
+		int tp, err;
+		u64 on_AC;
+		acpi_status status;
+
+		err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
+			      &current_tp);
+
+		if (err < 0)
+			return err;
+
+		/* Check power source */
+		status = WMI_gaming_execute_u64(
+			ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
+			ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
+
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		switch (current_tp) {
+		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
+			if (!on_AC)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			else if (cycle_gaming_thermal_profile)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
+			else
+				tp = last_non_turbo_profile;
+			break;
+		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
+			if (!on_AC)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			else
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+			break;
+		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
+			if (!on_AC)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
+			else if (cycle_gaming_thermal_profile)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
+			else
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+			break;
+		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
+			if (!on_AC)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			else if (cycle_gaming_thermal_profile)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			else
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+			break;
+		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
+			if (!on_AC)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			else if (cycle_gaming_thermal_profile)
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
+			else
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		status = WMI_gaming_execute_u64(
+			ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
+
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		/* Store non-turbo profile for turbo mode toggle*/
+		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
+			last_non_turbo_profile = tp;
+
+		platform_profile_notify();
+	}
+
+	return 0;
+}
+
 /*
  * Switch series keyboard dock status
  */
@@ -1997,6 +2249,8 @@ static void acer_wmi_notify(u32 value, void *context)
 	case WMID_GAMING_TURBO_KEY_EVENT:
 		if (return_value.key_num == 0x4)
 			acer_toggle_turbo();
+		if (return_value.key_num == 0x5 && has_cap(ACER_CAP_PLATFORM_PROFILE))
+			acer_thermal_profile_change();
 		break;
 	default:
 		pr_warn("Unknown function number - %d - %d\n",
@@ -2245,6 +2499,12 @@ static int acer_platform_probe(struct platform_device *device)
 	if (err)
 		goto error_rfkill;
 
+	if (has_cap(ACER_CAP_PLATFORM_PROFILE)) {
+		err = acer_platform_profile_setup();
+		if (err)
+			goto error_platform_profile;
+	}
+
 	return err;
 
 error_rfkill:
@@ -2253,6 +2513,9 @@ static int acer_platform_probe(struct platform_device *device)
 error_brightness:
 	if (has_cap(ACER_CAP_MAILLED))
 		acer_led_exit();
+error_platform_profile:
+	if (platform_profile_support)
+		platform_profile_remove();
 error_mailled:
 	return err;
 }
@@ -2265,6 +2528,9 @@ static void acer_platform_remove(struct platform_device *device)
 		acer_backlight_exit();
 
 	acer_rfkill_exit();
+
+	if (platform_profile_support)
+		platform_profile_remove();
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.43.0



Return-Path: <platform-driver-x86+bounces-8740-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C738A13D5D
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Jan 2025 16:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 396C71884420
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Jan 2025 15:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0D922BAA3;
	Thu, 16 Jan 2025 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="maIZU2Mn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884FA22B8C0
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737040445; cv=none; b=L+v3Wrzxl+4n+v9yo1F7fSet22iyrIcI7sltlKgOJnNY1O64MsRlSa7YQhxSWWz2yGJ/spNv7Hx7uxstHOi0VxZvQnaRxLfbWWySDWtXYYlkkcmb4I6YK13q51LBZCTSg6TrSZjyQYmAENL5eecCJCJMjeieff+QEK7PTYfXhhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737040445; c=relaxed/simple;
	bh=JtPNgmuhOxewMrgh16FA1wQq7KjJvwhp7WgyCfLMdgs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fQ/8BS6oXsJ/JBDCH4bDyJF136juQI//wYPAE3Dy1VYapKq+scTZinKg5gVFy6a7AFNsIqvWxNAUDZtQHYlFQr3dOGDHVjcXVGaM6xrrFR5e7fYyrhszzKDSeiaekkb017mf3oC599/UdFGCXBi6sihcLpyM0f8to0hrd7bDDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=maIZU2Mn; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [IPV6:2a02:842a:8223:5500::978] (unknown [IPv6:2a02:842a:8223:5500::978])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id DCC3378032A;
	Thu, 16 Jan 2025 16:13:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1737040439;
	bh=JtPNgmuhOxewMrgh16FA1wQq7KjJvwhp7WgyCfLMdgs=;
	h=Date:To:Cc:From:Subject:From;
	b=maIZU2MnsZ9WjFtyNyllhydvsUk1fwO17RUoEcKRijjJYxPgkJnSYDf5gB0P5HUS0
	 3UffQJZAiY/y3Qyl7A7MASuYENcT2yRPf7kTDwY8XOXIDFdkGezIiJoBZl0wVV1dYg
	 3vQ6weTx0HRxJPzzugvflwCmWGx7zieCP15I5YL4CLzCUJIU+i22wV/jGikEcQWoJl
	 qfNp/+yhHerPGUd/7iLGGe0VEc3w55IA05OJszY4G+kBrBJG21K5xukFcenNtiXk1P
	 m8dIxqnya+eKI3oaQ0xDeqKraK0M0T5udN1GbVHLOOytRFpjMW1nohJEeHkvkD3gOD
	 eHRA90fi0hEVw==
Message-ID: <7e374fd6-407a-42cc-9836-387583cfce2c@free.fr>
Date: Thu, 16 Jan 2025 16:13:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
From: Julien ROBIN <julien.robin28@free.fr>
Subject: [PATCH v4] platform/x86: hp-wmi: Add fan and thermal profile support
 for Victus 16-s1000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following patch adds support for HP Victus 16-s1000 laptop series,
by adding and fixing the following functionalities, which can be
accessed through hwmon and platform_profile sysfs:

 - Functional measured fan speed reading
 - Ability to enable and disable maximum fan speed
 - Platform profiles full setting ability for CPU and GPU

It sets appropriates CPU and GPU power settings both on AC and battery
power sources, for low-power, balanced and performance modes.

It has been thoroughly tested on a 16-s1034nf laptop based on a 8C9C DMI
board name, and behavior of the driver on previous boards is left
untouched thanks to the separated lists of DMI board names.

Signed-off-by: Julien ROBIN <julien.robin28@free.fr>
---
Changes since v3:
- Reduced the scope of coding style fixups
- Updated a comment
- Moved a parameter check at the beginning of its function

Changes since v2:
- Added 3 clearly named literal definitions, using them to avoid comments need
- Changed zero filled array initialization syntax from { 0 } to {}
- Removed blank lines between function calls and their associated error handling
- Separated variable declarations and their assignment to function calls return

Changes since v1:
- More clear description of 0xFF special effect when setting power limits
- Added structs for clearer naming of power limits and GPU power modes settings
- Retrieve and keep current GPU slowdown temp threshold (instead of hard coded)
- Removed platform_profile_victus_s_get(), re-using platform_profile_omen_get()
- Changed char variable types to u8 where it was more relevant
- Moved some comments
- Minor typo / alignment corrections
---
 drivers/platform/x86/hp/hp-wmi.c | 369 +++++++++++++++++++++++++++++--
 1 file changed, 356 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 20c55bab3b8c..8a5a606e1032 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -45,6 +45,10 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
 
+#define HP_FAN_SPEED_AUTOMATIC	 0x00
+#define HP_POWER_LIMIT_DEFAULT	 0x00
+#define HP_POWER_LIMIT_NO_CHANGE 0xFF
+
 #define ACPI_AC_CLASS "ac_adapter"
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
@@ -83,11 +87,16 @@ static const char * const omen_timed_thermal_profile_boards[] = {
 	"8BAD", "8A42", "8A15"
 };
 
-/* DMI Board names of Victus laptops */
+/* DMI Board names of Victus 16-d1xxx laptops */
 static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
+/* DMI Board names of Victus 16-s1000 laptops */
+static const char * const victus_s_thermal_profile_boards[] = {
+	"8C9C"
+};
+
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
 	HPWMI_BLUETOOTH	= 0x1,
@@ -147,12 +156,32 @@ enum hp_wmi_commandtype {
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 };
 
+struct victus_power_limits {
+	u8 pl1;
+	u8 pl2;
+	u8 pl4;
+	u8 cpu_gpu_concurrent_limit;
+};
+
+struct victus_gpu_power_modes {
+	u8 ctgp_enable;
+	u8 ppab_enable;
+	u8 dstate;
+	u8 gpu_slowdown_temp;
+};
+
 enum hp_wmi_gm_commandtype {
-	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
-	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
-	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
-	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
-	HPWMI_GET_SYSTEM_DESIGN_DATA = 0x28,
+	HPWMI_FAN_SPEED_GET_QUERY		= 0x11,
+	HPWMI_SET_PERFORMANCE_MODE		= 0x1A,
+	HPWMI_FAN_SPEED_MAX_GET_QUERY		= 0x26,
+	HPWMI_FAN_SPEED_MAX_SET_QUERY		= 0x27,
+	HPWMI_GET_SYSTEM_DESIGN_DATA		= 0x28,
+	HPWMI_FAN_COUNT_GET_QUERY		= 0x10,
+	HPWMI_GET_GPU_THERMAL_MODES_QUERY	= 0x21,
+	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
+	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
+	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
+	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
 };
 
 enum hp_wmi_command {
@@ -211,6 +240,11 @@ enum hp_thermal_profile_victus {
 	HP_VICTUS_THERMAL_PROFILE_QUIET			= 0x03,
 };
 
+enum hp_thermal_profile_victus_s {
+	HP_VICTUS_S_THERMAL_PROFILE_DEFAULT		= 0x00,
+	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
+};
+
 enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
 	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
@@ -411,6 +445,26 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	return ret;
 }
 
+/*
+ * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
+ * and/or maintains the laptop in user defined thermal and fan states, instead
+ * of using a fallback state. After a 120 seconds timeout however, the laptop
+ * goes back to its fallback state.
+ */
+static int hp_wmi_get_fan_count_userdefine_trigger(void)
+{
+	u8 fan_data[4] = {};
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_FAN_COUNT_GET_QUERY, HPWMI_GM,
+				   &fan_data, sizeof(u8),
+				   sizeof(fan_data));
+	if (ret != 0)
+		return -EINVAL;
+
+	return fan_data[0]; /* Others bytes aren't providing fan count */
+}
+
 static int hp_wmi_get_fan_speed(int fan)
 {
 	u8 fsh, fsl;
@@ -429,6 +483,23 @@ static int hp_wmi_get_fan_speed(int fan)
 	return (fsh << 8) | fsl;
 }
 
+static int hp_wmi_get_fan_speed_victus_s(int fan)
+{
+	u8 fan_data[128] = {};
+	int ret;
+
+	if (fan < 0 || fan >= sizeof(fan_data))
+		return -EINVAL;
+
+	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
+				   HPWMI_GM, &fan_data, sizeof(u8),
+				   sizeof(fan_data));
+	if (ret != 0)
+		return -EINVAL;
+
+	return fan_data[fan] * 100;
+}
+
 static int hp_wmi_read_int(int query)
 {
 	int val = 0, ret;
@@ -557,6 +628,30 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	return enabled;
 }
 
+static int hp_wmi_fan_speed_reset(void)
+{
+	int ret;
+	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
+
+	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
+				   &fan_speed, sizeof(fan_speed), 0);
+
+	return ret;
+}
+
+static int hp_wmi_fan_speed_max_reset(void)
+{
+	int ret;
+
+	ret = hp_wmi_fan_speed_max_set(0);
+	if (ret)
+		return ret;
+
+	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
+	ret = hp_wmi_fan_speed_reset();
+	return ret;
+}
+
 static int hp_wmi_fan_speed_max_get(void)
 {
 	int val = 0, ret;
@@ -1472,6 +1567,161 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
 	return 0;
 }
 
+static bool is_victus_s_thermal_profile(void)
+{
+	const char *board_name;
+
+	board_name = dmi_get_system_info(DMI_BOARD_NAME);
+	if (!board_name)
+		return false;
+
+	return match_string(victus_s_thermal_profile_boards,
+			    ARRAY_SIZE(victus_s_thermal_profile_boards),
+			    board_name) >= 0;
+}
+
+static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
+					    bool *ppab_enable,
+					    u8 *dstate,
+					    u8 *gpu_slowdown_temp)
+{
+	int ret;
+	struct victus_gpu_power_modes gpu_power_modes;
+
+	ret = hp_wmi_perform_query(HPWMI_GET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
+				   &gpu_power_modes, sizeof(gpu_power_modes),
+				   sizeof(gpu_power_modes));
+	if (ret == 0) {
+		*ctgp_enable = gpu_power_modes.ctgp_enable ? true : false;
+		*ppab_enable = gpu_power_modes.ppab_enable ? true : false;
+		*dstate = gpu_power_modes.dstate;
+		*gpu_slowdown_temp = gpu_power_modes.gpu_slowdown_temp;
+	}
+
+	return ret;
+}
+
+static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
+					    bool ppab_enable,
+					    u8 dstate)
+{
+	struct victus_gpu_power_modes gpu_power_modes;
+	int ret;
+
+	bool current_ctgp_state, current_ppab_state;
+	u8 current_dstate, current_gpu_slowdown_temp;
+
+	/* Retrieving GPU slowdown temperature, in order to keep it unchanged */
+	ret = victus_s_gpu_thermal_profile_get(&current_ctgp_state,
+					       &current_ppab_state,
+					       &current_dstate,
+					       &current_gpu_slowdown_temp);
+	if (ret < 0) {
+		pr_warn("GPU modes not updated, unable to get slowdown temp\n");
+		return ret;
+	}
+
+	gpu_power_modes.ctgp_enable = ctgp_enable ? 0x01 : 0x00;
+	gpu_power_modes.ppab_enable = ppab_enable ? 0x01 : 0x00;
+	gpu_power_modes.dstate = dstate;
+	gpu_power_modes.gpu_slowdown_temp = current_gpu_slowdown_temp;
+
+
+	ret = hp_wmi_perform_query(HPWMI_SET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
+				   &gpu_power_modes, sizeof(gpu_power_modes), 0);
+
+	return ret;
+}
+
+/* Note: HP_POWER_LIMIT_DEFAULT can be used to restore default PL1 and PL2 */
+static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
+{
+	int ret;
+	struct victus_power_limits power_limits;
+
+	power_limits.pl1 = pl1;
+	power_limits.pl2 = pl2;
+	power_limits.pl4 = HP_POWER_LIMIT_NO_CHANGE;
+	power_limits.cpu_gpu_concurrent_limit = HP_POWER_LIMIT_NO_CHANGE;
+
+	/* We need to know both PL1 and PL2 values in order to check them */
+	if (pl1 == HP_POWER_LIMIT_NO_CHANGE || pl2 == HP_POWER_LIMIT_NO_CHANGE)
+		return -EINVAL;
+
+	/* PL2 is not supposed to be lower than PL1 */
+	if (pl2 < pl1)
+		return -EINVAL;
+
+	ret = hp_wmi_perform_query(HPWMI_SET_POWER_LIMITS_QUERY, HPWMI_GM,
+				   &power_limits, sizeof(power_limits), 0);
+
+	return ret;
+}
+
+static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
+{
+	int err, tp;
+	bool gpu_ctgp_enable, gpu_ppab_enable;
+	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
+
+	switch (profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
+		gpu_ctgp_enable = true;
+		gpu_ppab_enable = true;
+		gpu_dstate = 1;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		gpu_ctgp_enable = false;
+		gpu_ppab_enable = true;
+		gpu_dstate = 1;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		gpu_ctgp_enable = false;
+		gpu_ppab_enable = false;
+		gpu_dstate = 1;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	hp_wmi_get_fan_count_userdefine_trigger();
+
+	err = omen_thermal_profile_set(tp);
+	if (err < 0) {
+		pr_err("Failed to set platform profile %d: %d\n", profile, err);
+		return err;
+	}
+
+	err = victus_s_gpu_thermal_profile_set(gpu_ctgp_enable,
+					       gpu_ppab_enable,
+					       gpu_dstate);
+	if (err < 0) {
+		pr_err("Failed to set GPU profile %d: %d\n", profile, err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int platform_profile_victus_s_set(struct platform_profile_handler *pprof,
+					 enum platform_profile_option profile)
+{
+	int err;
+
+	guard(mutex)(&active_platform_profile_lock);
+
+	err = platform_profile_victus_s_set_ec(profile);
+	if (err < 0)
+		return err;
+
+	active_platform_profile = profile;
+
+	return 0;
+}
+
 static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 				       enum platform_profile_option profile)
 {
@@ -1545,6 +1795,39 @@ static int omen_powersource_event(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static int victus_s_powersource_event(struct notifier_block *nb,
+				      unsigned long value,
+				      void *data)
+{
+	struct acpi_bus_event *event_entry = data;
+	int err;
+
+	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
+		return NOTIFY_DONE;
+
+	pr_debug("Received power source device event\n");
+
+	/*
+	 * Switching to battery power source while Performance mode is active
+	 * needs manual triggering of CPU power limits. Same goes when switching
+	 * to AC power source while Performance mode is active. Other modes
+	 * however are automatically behaving without any manual action.
+	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
+	 */
+
+	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
+		pr_debug("Triggering CPU PL1/PL2 actualization\n");
+		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
+					       HP_POWER_LIMIT_DEFAULT);
+		if (err)
+			pr_warn("Failed to actualize power limits: %d\n", err);
+
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
 static int omen_register_powersource_event_handler(void)
 {
 	int err;
@@ -1560,11 +1843,30 @@ static int omen_register_powersource_event_handler(void)
 	return 0;
 }
 
+static int victus_s_register_powersource_event_handler(void)
+{
+	int err;
+
+	platform_power_source_nb.notifier_call = victus_s_powersource_event;
+	err = register_acpi_notifier(&platform_power_source_nb);
+	if (err < 0) {
+		pr_warn("Failed to install ACPI power source notify handler\n");
+		return err;
+	}
+
+	return 0;
+}
+
 static inline void omen_unregister_powersource_event_handler(void)
 {
 	unregister_acpi_notifier(&platform_power_source_nb);
 }
 
+static inline void victus_s_unregister_powersource_event_handler(void)
+{
+	unregister_acpi_notifier(&platform_power_source_nb);
+}
+
 static int thermal_profile_setup(void)
 {
 	int err, tp;
@@ -1603,6 +1905,22 @@ static int thermal_profile_setup(void)
 		platform_profile_handler.profile_set = platform_profile_victus_set;
 
 		set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);
+	} else if (is_victus_s_thermal_profile()) {
+		/*
+		 * Being unable to retrieve laptop's current thermal profile,
+		 * during this setup, we set it to Balanced by default.
+		 */
+		active_platform_profile = PLATFORM_PROFILE_BALANCED;
+
+		err = platform_profile_victus_s_set_ec(active_platform_profile);
+		if (err < 0)
+			return err;
+
+		platform_profile_handler.profile_get = platform_profile_omen_get;
+		platform_profile_handler.profile_set = platform_profile_victus_s_set;
+
+		/* Adding an equivalent to HP Omen software ECO mode: */
+		set_bit(PLATFORM_PROFILE_LOW_POWER, platform_profile_handler.choices);
 	} else {
 		tp = thermal_profile_get();
 
@@ -1628,9 +1946,14 @@ static int thermal_profile_setup(void)
 	set_bit(PLATFORM_PROFILE_PERFORMANCE, platform_profile_handler.choices);
 
 	err = platform_profile_register(&platform_profile_handler);
-	if (err)
+	if (err == -EEXIST) {
+		pr_warn("A platform profile handler is already registered\n");
 		return err;
-
+	} else if (err) {
+		pr_err("Platform profile handler registration fail: %d\n", err);
+		return err;
+	}
+	pr_info("Registered as platform profile handler\n");
 	platform_profile_support = true;
 
 	return 0;
@@ -1759,8 +2082,13 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 	case hwmon_pwm:
 		return 0644;
 	case hwmon_fan:
-		if (hp_wmi_get_fan_speed(channel) >= 0)
-			return 0444;
+		if (is_victus_s_thermal_profile()) {
+			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
+				return 0444;
+		} else {
+			if (hp_wmi_get_fan_speed(channel) >= 0)
+				return 0444;
+		}
 		break;
 	default:
 		return 0;
@@ -1776,8 +2104,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 
 	switch (type) {
 	case hwmon_fan:
-		ret = hp_wmi_get_fan_speed(channel);
-
+		if (is_victus_s_thermal_profile())
+			ret = hp_wmi_get_fan_speed_victus_s(channel);
+		else
+			ret = hp_wmi_get_fan_speed(channel);
 		if (ret < 0)
 			return ret;
 		*val = ret;
@@ -1810,11 +2140,17 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_pwm:
 		switch (val) {
 		case 0:
+			if (is_victus_s_thermal_profile())
+				hp_wmi_get_fan_count_userdefine_trigger();
 			/* 0 is no fan speed control (max), which is 1 for us */
 			return hp_wmi_fan_speed_max_set(1);
 		case 2:
 			/* 2 is automatic speed control, which is 0 for us */
-			return hp_wmi_fan_speed_max_set(0);
+			if (is_victus_s_thermal_profile()) {
+				hp_wmi_get_fan_count_userdefine_trigger();
+				return hp_wmi_fan_speed_max_reset();
+			} else
+				return hp_wmi_fan_speed_max_set(0);
 		default:
 			/* we don't support manual fan speed control */
 			return -EINVAL;
@@ -1893,6 +2229,10 @@ static int __init hp_wmi_init(void)
 		err = omen_register_powersource_event_handler();
 		if (err)
 			goto err_unregister_device;
+	} else if (is_victus_s_thermal_profile()) {
+		err = victus_s_register_powersource_event_handler();
+		if (err)
+			goto err_unregister_device;
 	}
 
 	return 0;
@@ -1912,6 +2252,9 @@ static void __exit hp_wmi_exit(void)
 	if (is_omen_thermal_profile() || is_victus_thermal_profile())
 		omen_unregister_powersource_event_handler();
 
+	if (is_victus_s_thermal_profile())
+		victus_s_unregister_powersource_event_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 


Return-Path: <platform-driver-x86+bounces-7836-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B91C9F6E46
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Dec 2024 20:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0961889951
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Dec 2024 19:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D681D45FC;
	Wed, 18 Dec 2024 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="tV7pXhxV"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA84156991
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Dec 2024 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734550767; cv=none; b=sUHMj+SrrWDEsC1pqoDOuxRrlYMfhCHPDs8aVroz6IcH5JCl/pWPFoVSLE3FPvjSMdrt7kjGTErphvmI75Ru3qDLZ3ITxhJV+VBise9uY2GUmJtVuat4wHGmXR9xPncG2PlQQT+7Zvtg9yaTJMJA+ahnhIKIUm8qZ9AHoSGib6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734550767; c=relaxed/simple;
	bh=s4DgWbbkiSZqb9KrO9eT9TfRKxqVJ3Abd/D9GORTV3c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=BrEv4BPXVg9t8GOcCzmWv/BBbJjwxNYDFHc4AiIFeW3OJjUVGzqcoyIePVqxm5wk1BKCGwiCLXcIe3IMH0Aa02gU4Oxc/li5zC2gj362F5nImKdzPlKmaWjjGl4pSgccTdusZvjxXeTfnYeup3YExz09UK1O96JF4gcE+WNRK5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=tV7pXhxV; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [IPV6:2a02:842a:8223:5500::978] (unknown [IPv6:2a02:842a:8223:5500::978])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id C86AD78050B;
	Wed, 18 Dec 2024 20:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1734550756;
	bh=s4DgWbbkiSZqb9KrO9eT9TfRKxqVJ3Abd/D9GORTV3c=;
	h=Date:From:Subject:To:Cc:From;
	b=tV7pXhxVDKX/fDOG2TQNVZiiK+DN7JBftWsV8OqAL9STtjfRgulfBD9y0DUg68Q10
	 i6G+z3zhO7r6cjg/HSIpgRovB3OycDiCVHsl9FRnJRMqHlkOYW3D3dv72oxBqwUUfe
	 cIQQXHdaekOu6DEaGUbx0wVJiDYYpdggjmAvV3311YsN7l6qyksccXDLA4JsllMXcu
	 mwfGg4R28hEXF2wWUEObfpayqAziY4OT8GN14q8rC6TYibFfcyTeaHBVjzepjFvX3i
	 6IS6z7DpbT/h+UcqAS+W/cv4IS9UUSzySlt8t9PG6uG4Cm4Gt/ZuQzMXkwkkVf9hBh
	 74DnC04azCQ0w==
Message-ID: <69a3a3bf-fe56-4843-91a5-b765e53e337d@free.fr>
Date: Wed, 18 Dec 2024 20:39:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julien ROBIN <julien.robin28@free.fr>
Subject: [PATCH] platform/x86: hp-wmi: Add fan and thermal profile support for
 Victus 16-s1000
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
  /drivers/platform/x86/hp/hp-wmi.c | 304 ++++++++++++++++++++++++++++++++-
  1 file changed, 297 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c 
b/drivers/platform/x86/hp/hp-wmi.c
index 81ccc96..9ce2b80 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -83,11 +83,16 @@ static const char * const 
omen_timed_thermal_profile_boards[] = {
  	"8BAD", "8A42"
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
@@ -153,6 +158,11 @@ enum hp_wmi_gm_commandtype {
  	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
  	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
  	HPWMI_GET_SYSTEM_DESIGN_DATA = 0x28,
+	HPWMI_FAN_COUNT_GET_QUERY = 0x10,
+	HPWMI_SET_GPU_THERMAL_MODES_QUERY = 0x22,
+	HPWMI_SET_POWER_LIMITS_QUERY = 0x29,
+	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY = 0x2D,
+	HPWMI_FAN_SPEED_SET_QUERY = 0x2E,
  };

  enum hp_wmi_command {
@@ -211,6 +221,11 @@ enum hp_thermal_profile_victus {
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
@@ -411,6 +426,26 @@ out_free:
  	return ret;
  }

+/*
+ * Calling this hp_wmi_get_fan_count_userdefine_trigger function also 
enables
+ * and/or maintains the laptop in user defined thermal and fan states, 
instead
+ * of using a fallback state. After a 120 seconds timeout however, the 
laptop
+ * goes back to its fallback state.
+ */
+static int hp_wmi_get_fan_count_userdefine_trigger(void)
+{
+	char fan_data[4] = { 0 };
+
+	int ret = hp_wmi_perform_query(HPWMI_FAN_COUNT_GET_QUERY, HPWMI_GM,
+				       &fan_data, sizeof(char),
+				       sizeof(fan_data));
+
+	if (ret != 0)
+		return -EINVAL;
+
+	return fan_data[0]; /* Others bytes aren't providing fan count */
+}
+
  static int hp_wmi_get_fan_speed(int fan)
  {
  	u8 fsh, fsl;
@@ -429,6 +464,23 @@ static int hp_wmi_get_fan_speed(int fan)
  	return (fsh << 8) | fsl;
  }

+static int hp_wmi_get_fan_speed_victus_s(int fan)
+{
+	char fan_data[128] = { 0 };
+
+	int ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
+				       HPWMI_GM, &fan_data, sizeof(char),
+				       sizeof(fan_data));
+
+	if (ret != 0)
+		return -EINVAL;
+
+	if (fan >= 0 && fan < sizeof(fan_data))
+		return fan_data[fan] * 100;
+	else
+		return -EINVAL;
+}
+
  static int hp_wmi_read_int(int query)
  {
  	int val = 0, ret;
@@ -557,6 +609,29 @@ static int hp_wmi_fan_speed_max_set(int enabled)
  	return enabled;
  }

+static int hp_wmi_fan_speed_reset(void)
+{
+	int ret;
+	char fan_speed[2] = { 0 }; /* Restores automatic speed */
+
+	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
+				   &fan_speed, sizeof(fan_speed), 0);
+
+	return ret;
+}
+
+static int hp_wmi_fan_speed_max_reset(void)
+{
+	int ret = hp_wmi_fan_speed_max_set(0);
+
+	if (ret)
+		return ret;
+
+	/* Disabling Max fan speed on Victus s1xxx laptops needs a 2nd step: */
+	ret = hp_wmi_fan_speed_reset();
+	return ret;
+}
+
  static int hp_wmi_fan_speed_max_get(void)
  {
  	int val = 0, ret;
@@ -1472,6 +1547,127 @@ static int platform_profile_victus_set_ec(enum 
platform_profile_option profile)
  	return 0;
  }

+static bool is_victus_s_thermal_profile(void)
+{
+	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (!board_name)
+		return false;
+
+	return match_string(victus_s_thermal_profile_boards,
+			    ARRAY_SIZE(victus_s_thermal_profile_boards),
+			    board_name) >= 0;
+}
+
+static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
+					    bool ppab_enable,
+					    char dstate)
+{
+	char gpu_settings[4];
+	int ret;
+
+	gpu_settings[0] = ctgp_enable ? 0x01 : 0x00;
+	gpu_settings[1] = ppab_enable ? 0x01 : 0x00;
+	gpu_settings[2] = dstate;
+	gpu_settings[3] = 0x57; /* it tells we're setting the 3 above values */
+
+	ret = hp_wmi_perform_query(HPWMI_SET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
+				   &gpu_settings, sizeof(gpu_settings), 0);
+
+	return ret;
+}
+
+static int victus_s_set_cpu_pl1_pl2(char pl1, char pl2)
+{
+	/* Placing 0xFF in the 2 last bytes tells we're setting PL1 and PL2 */
+	char buffer[4] = { pl1, pl2, 0xFF, 0xFF };
+
+	if (pl1 == 0xFF || pl2 == 0xFF)
+		return -EINVAL; /* the 0xFF value has a special meaning */
+
+	if (pl2 < pl1)
+		return -EINVAL; /* PL2 is not supposed to be lower than PL1 */
+
+	/* Note: providing 0x00 as PL1 and PL2 is restoring default values */
+
+	int ret = hp_wmi_perform_query(HPWMI_SET_POWER_LIMITS_QUERY,
+				       HPWMI_GM,
+				       &buffer, sizeof(buffer), 0);
+
+	return ret;
+}
+
+static int platform_profile_victus_s_get(struct 
platform_profile_handler *pprof,
+					 enum platform_profile_option *profile)
+{
+	/* Same behaviour as platform_profile_omen_get */
+	return platform_profile_omen_get(pprof, profile);
+}
+
+static int platform_profile_victus_s_set_ec(enum 
platform_profile_option profile)
+{
+	int err, tp;
+	bool gpu_ctgp_enable, gpu_ppab_enable;
+	char gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
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
+static int platform_profile_victus_s_set(struct 
platform_profile_handler *pprof,
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
  static int platform_profile_victus_set(struct platform_profile_handler 
*pprof,
  				       enum platform_profile_option profile)
  {
@@ -1545,6 +1741,38 @@ static int omen_powersource_event(struct 
notifier_block *nb,
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
+	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 BIOS version.
+	 */
+
+	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
+		pr_debug("Triggering CPU PL1/PL2 actualization\n");
+		err = victus_s_set_cpu_pl1_pl2(0, 0);
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
@@ -1560,11 +1788,31 @@ static int 
omen_register_powersource_event_handler(void)
  	return 0;
  }

+static int victus_s_register_powersource_event_handler(void)
+{
+	int err;
+
+	platform_power_source_nb.notifier_call = victus_s_powersource_event;
+	err = register_acpi_notifier(&platform_power_source_nb);
+
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
@@ -1603,6 +1851,22 @@ static int thermal_profile_setup(void)
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
+		platform_profile_handler.profile_get = platform_profile_victus_s_get;
+		platform_profile_handler.profile_set = platform_profile_victus_s_set;
+
+		/* Adding an equivalent to HP Omen software ECO mode: */
+		set_bit(PLATFORM_PROFILE_LOW_POWER, platform_profile_handler.choices);
  	} else {
  		tp = thermal_profile_get();

@@ -1628,9 +1892,14 @@ static int thermal_profile_setup(void)
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
@@ -1759,8 +2028,13 @@ static umode_t hp_wmi_hwmon_is_visible(const void 
*data,
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
@@ -1776,7 +2050,10 @@ static int hp_wmi_hwmon_read(struct device *dev, 
enum hwmon_sensor_types type,

  	switch (type) {
  	case hwmon_fan:
-		ret = hp_wmi_get_fan_speed(channel);
+		if (is_victus_s_thermal_profile())
+			ret = hp_wmi_get_fan_speed_victus_s(channel);
+		else
+			ret = hp_wmi_get_fan_speed(channel);

  		if (ret < 0)
  			return ret;
@@ -1810,11 +2087,17 @@ static int hp_wmi_hwmon_write(struct device 
*dev, enum hwmon_sensor_types type,
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
@@ -1893,6 +2176,10 @@ static int __init hp_wmi_init(void)
  		err = omen_register_powersource_event_handler();
  		if (err)
  			goto err_unregister_device;
+	} else if (is_victus_s_thermal_profile()) {
+		err = victus_s_register_powersource_event_handler();
+		if (err)
+			goto err_unregister_device;
  	}

  	return 0;
@@ -1912,6 +2199,9 @@ static void __exit hp_wmi_exit(void)
  	if (is_omen_thermal_profile() || is_victus_thermal_profile())
  		omen_unregister_powersource_event_handler();

+	if (is_victus_s_thermal_profile())
+		victus_s_unregister_powersource_event_handler();
+
  	if (wmi_has_guid(HPWMI_EVENT_GUID))
  		hp_wmi_input_destroy();



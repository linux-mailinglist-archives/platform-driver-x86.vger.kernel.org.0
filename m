Return-Path: <platform-driver-x86+bounces-4211-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776319293AD
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 Jul 2024 15:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAD89B21700
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 Jul 2024 13:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C981658ABF;
	Sat,  6 Jul 2024 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWYc8quU"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B742AB6
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jul 2024 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720270938; cv=none; b=nAsCC+CF6hufDqvehXhJ+aXaGvi6EM7e7Kg70P5qFV71wWeZhYHJ4dkvUIBtFZvlC/4lXFieZdRbfj/ZJVtbEtVRhPOwVMlU9PpQwXLCnzagFg/eIjFu6vNzrg4LqtRr7b+rkWa2CY6rC0Wx7R6QR9dYVWCZJMTZv4RxbeKxoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720270938; c=relaxed/simple;
	bh=/7dRQDDiZOji2i63gPQiGsKBlo/aYRWvYYo8XpEokgQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XhdlX/Aj+0N+sDJ6RaVICfZdKq04Jdi6nAti4KiLDUxE44e9pBSmhfeCYdFlsYp5A4Ses1whEUwhCulY1UQnXr0OTfdMSxaFa46KqkalGE6CjkIdfNa2Csy4I7mEDGa/r9i347kOrIsZV/2wO/YoVux2RDQX5GDgWawMQeUWlnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWYc8quU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720270936; x=1751806936;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/7dRQDDiZOji2i63gPQiGsKBlo/aYRWvYYo8XpEokgQ=;
  b=bWYc8quURW2mmsMbXK8nYdaywU1cfP8H17j0hJQuoA0rz+Rtg5AwqPWU
   FVmpnu/CGVvbZbpZ9dJs/K3S8t+2NG9Zyx8ypgLnJNE78VxfVmilRv1sk
   2MOu+GWNGAOZGNYVzBQpvxZfaofdZZ2Eo5tmg9zUayJnn5eXn9yPvPTjM
   hMezbf7bNH7iVOC4tbDaQG9MpvI803J5j6Pxxvp+sWYN3g+NvuKphHdPp
   V+6Y+2FGmz/15SoU/8e40rN289tBQRKDPV5y3Sdrgrmgw1UqrCRL0UuFR
   7Ygdd/dNmVO/wdqAv5gulAOZkk2KCztZAOuw6EvIxV2R8u5ofQEp1OSGE
   Q==;
X-CSE-ConnectionGUID: khArXVKPQ4iVqF62RG2ZTg==
X-CSE-MsgGUID: logueqTNQda3H2zUlCJ3nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21301869"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="21301869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:02:16 -0700
X-CSE-ConnectionGUID: Lf0k86MYR8inWDP7/Ic3UA==
X-CSE-MsgGUID: ssbWMB9bQvyvNZ1HvyFQUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="52270107"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.111])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:02:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 6 Jul 2024 16:02:10 +0300 (EEST)
To: Alexis Belmonte <alexbelm48@gmail.com>
cc: W_Armin@gmx.de, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCHv9] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
In-Reply-To: <ZofRxNfk-ExL5VnN@alexis-pc>
Message-ID: <75b64561-db2b-9fa2-ecdd-d0b573f9b67e@linux.intel.com>
References: <ZofRxNfk-ExL5VnN@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jul 2024, Alexis Belmonte wrote:

> Fix a platform profile option switch/getter bug on some Omen and Victus
> laptops dismissing userspace choice when selecting performance mode in
> inadequate conditions (e.g. by being disconnected from the AC power plug)
> by
> 
>    -  hooking an ACPI notify handler through the
>       omen_register_powersource_notifier_handler method that listens to AC
>       power source changes (plugging in/out the AC power plug)
> 
>    -  keeping an intermediate active_platform_profile variable that is
>       set when userspace changes the platform profile setting
> 
>    -  restoring the selected platform profile kept in
>       active_platform_profile when AC power is plugged back into the
>       laptop, unless if the user decided to alter the platform profile
>       mid-way
> 
> This patch thus introduces a new dependency to the POWER_SUPPLY subsystem

Don't use "This patch ..." in commit message but use imperative tone.

> for this module.
> 
> This ensures that the driver follows the principles defined in the

Ambiguous "This", I don't know what ensures.

> Platform Profile Selection page of the Kernel documentation on those kind
> of laptops; which is to not "(...) let userspace know about any
> sub-optimal conditions which are impeding reaching the requested
> performance level".
> 
> Since the Omen and Victus laptops share the same embedded controller
> system, the fix is applicable to both categories of laptops.
> 
> This patch also provides improvements to how the driver sets/gets the
> platform profile through the embedded controller, by introducing
> intermediary functions to leverage code from platform_profile_omen_set and
> callers.
> 
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
> ---
> V1 -> V2: - Use register_acpi_notifier and unregister_acpi_notifier instead of
>             hooking straight through ACPI node \\_SB.ADP1
> V2 -> V3: - Rely on power_supply_is_system_supplied() instead of an EC-specific
>             field to determine if the laptop is plugged in
>           - Refactor omen_powersource_notify_handler to omen_powersource_event
>           - Refactor omen_powersource_register_notifier_handler to
>             omen_register_powersource_event_handler
>           - Use a mutex to protect the active_platform_profile variable from
>             being altered while the handler is executed
> V3 -> V4: - Remove the unnecessary enum declaration remains from the initial
>             implementation
> V4 -> V5: - Drop unnecessary modifications from the patch
>           - Call platform_profile_omen_get in platform_profile_victus_get to
>             avoid code duplication
>           - Give-up module initialization if we fail to register the ACPI
>             notifier handler
>           - Fix code style issues reported by checkpatch.pl --strict
>           - Add intermediary/helper platform_profile_omen_set_ec and
>             platform_profile_victus_set_ec functions to leverage code from
>             platform_profile_omen_set and callers, thus simplifying
>             omen_powersource_event
>           - Fix dead-lock when restoring active_platform_profile when the AC
>             power is plugged back into the laptop
> V5 -> V6: - Drop unnecessary modifications from the patch
> V6 -> V7: - Drop EC platform profile readback after set
>           - Lock the active_platform_profile mutex unconditionally
>           - Drop the usage of ACPI_FAILURE in favor of a simpler error check
>             when registering/unregistering the ACPI notifier
>           - Initialize active_platform_profile in thermal_profile_setup
> V7 -> V8: - Pass profile as a value instead of a pointer for
>             platform_profile_omen_set & platform_profile_victus_set as these
>             functions no longer alter the parameter
>           - Initialize active_platform_profile during
>             thermal_profile_setup by reading the current platform profile from
>             the embedded controller
>           - Drop vestigial active_platform_profile initialization code
>           - Add module dependency (select) to POWER_SUPPLY in Kconfig
>           - Simplify thermal profile getter check in omen_powersource_event
>           - Substitute omen_thermal_profile_get/omen_thermal_profile_set
>             with platform_profile_omen_get_ec/platform_profile_omen_set_ec and
>             platform_profile_victus_get_ec/platform_profile_victus_set_ec to
>             simplify thermal_profile_setup
> V8 -> V9: - Add missing mutex_lock call in omen_powersource_event read
>             failure code branch
> ---
>  drivers/platform/x86/hp/Kconfig  |   1 +
>  drivers/platform/x86/hp/hp-wmi.c | 209 ++++++++++++++++++++++++++++---
>  2 files changed, 193 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
> index 7fef4f12e498..d776761cd5fd 100644
> --- a/drivers/platform/x86/hp/Kconfig
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -40,6 +40,7 @@ config HP_WMI
>  	depends on ACPI_WMI
>  	depends on INPUT
>  	depends on RFKILL || RFKILL = n
> +	select POWER_SUPPLY
>  	select INPUT_SPARSEKMAP
>  	select ACPI_PLATFORM_PROFILE
>  	select HWMON
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 5fa553023842..910bc5195f8f 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -24,6 +24,7 @@
>  #include <linux/platform_profile.h>
>  #include <linux/hwmon.h>
>  #include <linux/acpi.h>
> +#include <linux/power_supply.h>
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
>  #include <linux/dmi.h>
> @@ -42,6 +43,8 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
>  #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>  
> +#define ACPI_AC_CLASS "ac_adapter"
> +
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
>  
>  /* DMI board names of devices that should use the omen specific path for
> @@ -259,10 +262,18 @@ static const struct key_entry hp_wmi_keymap[] = {
>  	{ KE_END, 0 }
>  };
>  
> +/*
> + * Mutex for the active_platform_profile variable,
> + * see omen_powersource_event.
> + */
> +DEFINE_MUTEX(active_platform_profile_lock);
> +
>  static struct input_dev *hp_wmi_input_dev;
>  static struct input_dev *camera_shutter_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
>  static struct platform_profile_handler platform_profile_handler;
> +static struct notifier_block platform_power_source_nb;
> +static enum platform_profile_option active_platform_profile;
>  static bool platform_profile_support;
>  static bool zero_insize_support;
>  
> @@ -1194,8 +1205,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	return err;
>  }
>  
> -static int platform_profile_omen_get(struct platform_profile_handler *pprof,
> -				     enum platform_profile_option *profile)
> +static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
>  {
>  	int tp;
>  
> @@ -1223,6 +1233,30 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> +static int platform_profile_omen_get(struct platform_profile_handler *pprof,
> +				     enum platform_profile_option *profile)
> +{
> +	enum platform_profile_option selected_platform_profile;
> +
> +	/*
> +	 * We directly return the stored platform profile, as the embedded
> +	 * controller will not accept switching to the performance option when
> +	 * the conditions are not met (e.g. the laptop is not plugged in).
> +	 *
> +	 * If we directly return what the EC reports, the platform profile will
> +	 * immediately "switch back" to normal mode, which is against the
> +	 * expected behaviour from a userspace point of view, as described in
> +	 * the Platform Profile Section page of the kernel documentation.
> +	 *
> +	 * See also omen_powersource_event.
> +	 */
> +	mutex_lock(&active_platform_profile_lock);
> +	selected_platform_profile = active_platform_profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return selected_platform_profile;
> +}
> +
>  static bool has_omen_thermal_profile_ec_timer(void)
>  {
>  	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> @@ -1245,8 +1279,7 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
>  	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
>  }
>  
> -static int platform_profile_omen_set(struct platform_profile_handler *pprof,
> -				     enum platform_profile_option profile)
> +static int platform_profile_omen_set_ec(enum platform_profile_option profile)
>  {
>  	int err, tp, tp_version;
>  	enum hp_thermal_profile_omen_flags flags = 0;
> @@ -1300,6 +1333,25 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> +static int platform_profile_omen_set(struct platform_profile_handler *pprof,
> +				     enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	err = platform_profile_omen_set_ec(profile);
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);

Please use guard() from linux/cleanup.h so unlock is handled automatically 
for you on error paths (+add the include if not yet there).

> +		return err;
> +	}
> +
> +	active_platform_profile = profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return 0;
> +}
> +
>  static int thermal_profile_get(void)
>  {
>  	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> @@ -1381,8 +1433,7 @@ static bool is_victus_thermal_profile(void)
>  			    board_name) >= 0;
>  }
>  
> -static int platform_profile_victus_get(struct platform_profile_handler *pprof,
> -				     enum platform_profile_option *profile)
> +static int platform_profile_victus_get_ec(enum platform_profile_option *profile)
>  {
>  	int tp;
>  
> @@ -1407,8 +1458,14 @@ static int platform_profile_victus_get(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> -static int platform_profile_victus_set(struct platform_profile_handler *pprof,
> -				     enum platform_profile_option profile)
> +static int platform_profile_victus_get(struct platform_profile_handler *pprof,
> +				       enum platform_profile_option *profile)
> +{
> +	/* Same behaviour as platform_profile_omen_get */
> +	return platform_profile_omen_get(pprof, profile);
> +}
> +
> +static int platform_profile_victus_set_ec(enum platform_profile_option profile)
>  {
>  	int err, tp;
>  
> @@ -1433,21 +1490,130 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> +static int platform_profile_victus_set(struct platform_profile_handler *pprof,
> +				       enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	err = platform_profile_victus_set_ec(profile);
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);

Ditto.

> +		return err;
> +	}
> +
> +	active_platform_profile = profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return 0;
> +}
> +
> +static int omen_powersource_event(struct notifier_block *nb,
> +				  unsigned long value,
> +				  void *data)
> +{
> +	struct acpi_bus_event *event_entry = data;
> +	enum platform_profile_option actual_profile;
> +	int err;
> +
> +	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
> +		return NOTIFY_DONE;
> +
> +	pr_debug("Received power source device event\n");
> +
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	/*
> +	 * This handler can only be called on Omen and Victus models, so
> +	 * there's no need to call is_victus_thermal_profile() here.
> +	 */
> +	if (is_omen_thermal_profile())
> +		err = platform_profile_omen_get_ec(&actual_profile);
> +	else
> +		err = platform_profile_victus_get_ec(&actual_profile);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to read current platform profile (%d)\n", err);
> +
> +		mutex_unlock(&active_platform_profile_lock);
> +
> +		/*
> +		 * Although we failed to get the current platform profile, we
> +		 * still want the other event consumers to process it.
> +		 */
> +		return NOTIFY_DONE;
> +	}
> +
> +	/*
> +	 * If we're back on AC and that the user-chosen power profile is
> +	 * different from what the EC reports, we restore the user-chosen
> +	 * one.
> +	 */
> +	if (power_supply_is_system_supplied() >= 0 ||
> +	    active_platform_profile != actual_profile) {
> +		mutex_unlock(&active_platform_profile_lock);
> +
> +		pr_debug("EC reports same platform profile, no platform profile update required\n");
> +		return NOTIFY_DONE;
> +	}
> +
> +	if (is_omen_thermal_profile())
> +		err = platform_profile_omen_set_ec(active_platform_profile);
> +	else
> +		err = platform_profile_victus_set_ec(active_platform_profile);
> +
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);
> +
> +		pr_warn("Failed to restore platform profile (%d)\n", err);

Why some prints are inside the mutex and some are not?

> +		return NOTIFY_DONE;
> +	}
> +
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int omen_register_powersource_event_handler(void)
> +{
> +	int err;
> +
> +	platform_power_source_nb.notifier_call = omen_powersource_event;
> +	err = register_acpi_notifier(&platform_power_source_nb);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to install ACPI power source notify handler\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void omen_unregister_powersource_event_handler(void)
> +{
> +	int err;
> +
> +	err = unregister_acpi_notifier(&platform_power_source_nb);
> +
> +	if (err < 0)
> +		pr_err("Failed to remove ACPI power source notify handler\n");

Do we really need this? I don't think deinit paths in general log errors 
(or handle them either).

-- 
 i.

> +}
> +
>  static int thermal_profile_setup(void)
>  {
>  	int err, tp;
>  
>  	if (is_omen_thermal_profile()) {
> -		tp = omen_thermal_profile_get();
> -		if (tp < 0)
> -			return tp;
> +		err = platform_profile_omen_get_ec(&active_platform_profile);
> +		if (err < 0)
> +			return err;
>  
>  		/*
>  		 * call thermal profile write command to ensure that the
>  		 * firmware correctly sets the OEM variables
>  		 */
> -
> -		err = omen_thermal_profile_set(tp);
> +		err = platform_profile_omen_set_ec(active_platform_profile);
>  		if (err < 0)
>  			return err;
>  
> @@ -1456,15 +1622,15 @@ static int thermal_profile_setup(void)
>  
>  		set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
>  	} else if (is_victus_thermal_profile()) {
> -		tp = omen_thermal_profile_get();
> -		if (tp < 0)
> -			return tp;
> +		err = platform_profile_victus_get_ec(&active_platform_profile);
> +		if (err < 0)
> +			return err;
>  
>  		/*
>  		 * call thermal profile write command to ensure that the
>  		 * firmware correctly sets the OEM variables
>  		 */
> -		err = omen_thermal_profile_set(tp);
> +		err = platform_profile_victus_set_ec(active_platform_profile);
>  		if (err < 0)
>  			return err;
>  
> @@ -1758,6 +1924,12 @@ static int __init hp_wmi_init(void)
>  			goto err_unregister_device;
>  	}
>  
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile()) {
> +		err = omen_register_powersource_event_handler();
> +		if (err)
> +			goto err_unregister_device;
> +	}
> +
>  	return 0;
>  
>  err_unregister_device:
> @@ -1772,6 +1944,9 @@ module_init(hp_wmi_init);
>  
>  static void __exit hp_wmi_exit(void)
>  {
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_unregister_powersource_event_handler();
> +
>  	if (wmi_has_guid(HPWMI_EVENT_GUID))
>  		hp_wmi_input_destroy();
>  
> 


Return-Path: <platform-driver-x86+bounces-5831-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114EA994530
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Oct 2024 12:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A190D2813F8
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Oct 2024 10:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C906D18C34F;
	Tue,  8 Oct 2024 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn8Uxwvn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739D17D36A;
	Tue,  8 Oct 2024 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728382717; cv=none; b=VTPcujbezgWwMOJh4UpvffmwDZVU4XVDsq0N8sOON5kzigM5IgJIauN9dTnd+ZTlboseN6JAPgrZZitdTm9Dk2Emoegz3JRTiThTVoNrBhpczpSukqoflpmRBVPyeERQ3ZQgVMpS0JwdUvc7E0kbqmx3aFIS8BeaPdyiwhFvOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728382717; c=relaxed/simple;
	bh=zTLZywdJZLtuGCcl80OhIQ3yJpbesCvpM6kby7pVAes=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oFKNN7F93ikJjBrU5TowcXEFErLFV9N/Lobg4Tt4YkUg0qUtjpf9CNcP+osxFwUQPurkbnzWfulefwy7SzanqBW7O7jBNCmWgOkyV+iCqzkyrfxDYXSwtuY1uKNMIlFMLqTTrZPWz8gf2oMw2tqGhlfN74aEb861eepxzbThqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pn8Uxwvn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728382715; x=1759918715;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zTLZywdJZLtuGCcl80OhIQ3yJpbesCvpM6kby7pVAes=;
  b=Pn8UxwvnEYN0KyT8LUtcuFl3Yxfs2D6ETbW0X6PS2C6mkcspQJymqfb3
   IS9gun3ajZ7uj2GL5xn8re6vu2xx/nQToMegoK102r1gsyB7sEiklQ2hF
   XEuBsuiVwy8omMqzi1YkONVuAORDDzjiDMaKmcsRsC5bLYge6T2pAv82m
   BXWs7n06ZlVTUVPRlVIWrqphHl3vuAZKyuXHvvPnrZ/lH5lyloYAX2OBD
   tKz78BaqjeO+vtyZ6NwcJujHLzoHcnQeZQ5SpoFCIfSWRy7b7qTo665cO
   XrWfxs9LFuu7QmjVylMavcbX/TAMUncuZ6xq8Mq4qEUYDrtF5iAfQy4yp
   A==;
X-CSE-ConnectionGUID: dNh/RLPIQiC6o1bvuB3Z9g==
X-CSE-MsgGUID: negs/jwMTf6FHQuVlfOatg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38929292"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="38929292"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 03:18:34 -0700
X-CSE-ConnectionGUID: bfTseEv3SieUCASSmMy4jA==
X-CSE-MsgGUID: WXTDqhQGTJC2uwq5SifiTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76210779"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 03:18:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Oct 2024 13:18:29 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: Re: [PATCH v2] alienware-wmi: Dell AWCC platform_profile support
In-Reply-To: <20241008044237.55146-3-kuurtb@gmail.com>
Message-ID: <4c2c29ad-924e-876b-70c3-256f4865fc88@linux.intel.com>
References: <20241007093324.49631-3-kuurtb@gmail.com> <20241008044237.55146-3-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Oct 2024, Kurt Borja wrote:

> This patch adds platform_profile support for Dell devices which implement
> User Selectable Thermal Tables (USTT) that are meant to be controlled by
> Alienware Command Center (AWCC). These devices may include newer Alienware
> M-Series, Alienware X-Series and Dell's G-Series. This patch, was tested
> by me on an Alienware x15 R1.
> 
> It is suspected that Alienware Command Center manages thermal profiles
> through the WMI interface, specifically through a device with identifier
> \_SB_.AMW1.WMAX. This device was reverse engineered and the relevant
> functionality is documented here [1]. This driver interacts with this
> WMI device and thus is able to mimic AWCC's thermal profiles functionality
> through the platform_profile API. In consequence the user would be able
> to set and retrieve thermal profiles, which are just fan speed profiles.
> 
> This driver was heavily inspired on inspur_platform_profile, special
> thanks.
> 
> Notes:
>  - Performance (FullSpeed) profile is a special profile which has it's own
>    entry in the Firmware Settings of the Alienware x15 R1. It also changes
>    the color of the F1 key. I suspect this behavior would be replicated in
>    other X-Series or M-Series laptops.
>  - G-Mode is a profile documented on [1] which mimics the behavior of
>    FullSpeed mode but it does not have an entry on the Firmware Settings of
>    the Alienware x15 R1, this may correspond to the G-Mode functionality on
>    G-Series laptops (activated by a special button) but I cannot test it. I
>    did not include this code in the driver as G-Mode causes unexpected
>    behavior on X-Series laptops.
> 
> ---
> v2:
>  - Moved functionality to alienware-wmi driver
>  - Added thermal and gmode quirks to add support based on dmi match
>  - Performance profile is now GMODE for devices that support it
>  - alienware_wmax_command now is insize agnostic to support new thermal
>    methods
> ---
>  drivers/platform/x86/dell/Kconfig         |   1 +
>  drivers/platform/x86/dell/alienware-wmi.c | 214 ++++++++++++++++++++--
>  2 files changed, 202 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 68a49788a..b06d634cd 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -21,6 +21,7 @@ config ALIENWARE_WMI
>  	depends on LEDS_CLASS
>  	depends on NEW_LEDS
>  	depends on ACPI_WMI
> +	select ACPI_PLATFORM_PROFILE
>  	help
>  	 This is a driver for controlling Alienware BIOS driven
>  	 features.  It exposes an interface for controlling the AlienFX
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index f5ee62ce1..47abb533c 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -10,6 +10,7 @@
>  #include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
>  #include <linux/dmi.h>
>  #include <linux/leds.h>
>  
> @@ -25,6 +26,15 @@
>  #define WMAX_METHOD_AMPLIFIER_CABLE	0x6
>  #define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
>  #define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
> +#define WMAX_METHOD_THERMAL_INFORMATION	0x14
> +#define WMAX_METHOD_THERMAL_CONTROL	0x15
> +
> +#define WMAX_THERMAL_QUIET			0xA3
> +#define WMAX_THERMAL_BALANCED			0xA0
> +#define WMAX_THERMAL_BALANCED_PERFORMANCE	0xA1
> +#define WMAX_THERMAL_PERFORMANCE		0xA4
> +#define WMAX_THERMAL_GMODE			0xAB
> +#define WMAX_THERMAL_LOW_POWER			0xA5
>  
>  MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>  MODULE_DESCRIPTION("Alienware special feature control");
> @@ -54,6 +64,8 @@ struct quirk_entry {
>  	u8 hdmi_mux;
>  	u8 amplifier;
>  	u8 deepslp;
> +	u8 thermal;
> +	u8 gmode;
>  };
>  
>  static struct quirk_entry *quirks;
> @@ -64,6 +76,8 @@ static struct quirk_entry quirk_inspiron5675 = {
>  	.hdmi_mux = 0,
>  	.amplifier = 0,
>  	.deepslp = 0,
> +	.thermal = 0,
> +	.gmode = 0,
>  };
>  
>  static struct quirk_entry quirk_unknown = {
> @@ -71,6 +85,8 @@ static struct quirk_entry quirk_unknown = {
>  	.hdmi_mux = 0,
>  	.amplifier = 0,
>  	.deepslp = 0,
> +	.thermal = 0,
> +	.gmode = 0,
>  };
>  
>  static struct quirk_entry quirk_x51_r1_r2 = {
> @@ -78,6 +94,8 @@ static struct quirk_entry quirk_x51_r1_r2 = {
>  	.hdmi_mux = 0,
>  	.amplifier = 0,
>  	.deepslp = 0,
> +	.thermal = 0,
> +	.gmode = 0,
>  };
>  
>  static struct quirk_entry quirk_x51_r3 = {
> @@ -85,6 +103,8 @@ static struct quirk_entry quirk_x51_r3 = {
>  	.hdmi_mux = 0,
>  	.amplifier = 1,
>  	.deepslp = 0,
> +	.thermal = 0,
> +	.gmode = 0,
>  };
>  
>  static struct quirk_entry quirk_asm100 = {
> @@ -92,6 +112,8 @@ static struct quirk_entry quirk_asm100 = {
>  	.hdmi_mux = 1,
>  	.amplifier = 0,
>  	.deepslp = 0,
> +	.thermal = 0,
> +	.gmode = 0,
>  };
>  
>  static struct quirk_entry quirk_asm200 = {
> @@ -99,6 +121,8 @@ static struct quirk_entry quirk_asm200 = {
>  	.hdmi_mux = 1,
>  	.amplifier = 0,
>  	.deepslp = 1,
> +	.thermal = 0,
> +	.gmode = 0,
>  };
>  
>  static struct quirk_entry quirk_asm201 = {
> @@ -106,6 +130,17 @@ static struct quirk_entry quirk_asm201 = {
>  	.hdmi_mux = 1,
>  	.amplifier = 1,
>  	.deepslp = 1,
> +	.thermal = 0,
> +	.gmode = 0,
> +};
> +
> +static struct quirk_entry quirk_x15_r1 = {
> +	.num_zones = 2,
> +	.hdmi_mux = 0,
> +	.amplifier = 0,
> +	.deepslp = 0,
> +	.thermal = 1,
> +	.gmode = 0,
>  };
>  
>  static int __init dmi_matched(const struct dmi_system_id *dmi)
> @@ -169,6 +204,15 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
>  		     },
>  	 .driver_data = &quirk_asm201,
>  	 },
> +	 {
> +	 .callback = dmi_matched,
> +	 .ident = "Alienware x15 R1",
> +	 .matches = {
> +		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +		     DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1")
> +		    },
> +	 .driver_data = &quirk_x15_r1,
> +	},
>  	 {
>  	 .callback = dmi_matched,
>  	 .ident = "Dell Inc. Inspiron 5675",
> @@ -218,6 +262,7 @@ static struct platform_device *platform_device;
>  static struct device_attribute *zone_dev_attrs;
>  static struct attribute **zone_attrs;
>  static struct platform_zone *zone_data;
> +static struct platform_profile_handler pp_handler;
>  
>  static struct platform_driver platform_driver = {
>  	.driver = {
> @@ -500,7 +545,7 @@ static void alienware_zone_exit(struct platform_device *dev)
>  	kfree(zone_attrs);
>  }
>  
> -static acpi_status alienware_wmax_command(struct wmax_basic_args *in_args,
> +static acpi_status alienware_wmax_command(void *in_args, size_t insize,
>  					  u32 command, int *out_data)
>  {
>  	acpi_status status;
> @@ -508,7 +553,7 @@ static acpi_status alienware_wmax_command(struct wmax_basic_args *in_args,
>  	struct acpi_buffer input;
>  	struct acpi_buffer output;
>  
> -	input.length = (acpi_size) sizeof(*in_args);
> +	input.length = (acpi_size) insize;
>  	input.pointer = in_args;
>  	if (out_data) {
>  		output.length = ACPI_ALLOCATE_BUFFER;
> @@ -541,8 +586,8 @@ static ssize_t show_hdmi_cable(struct device *dev,
>  		.arg = 0,
>  	};
>  	status =
> -	    alienware_wmax_command(&in_args, WMAX_METHOD_HDMI_CABLE,
> -				   (u32 *) &out_data);
> +	    alienware_wmax_command(&in_args, sizeof(in_args),
> +				   WMAX_METHOD_HDMI_CABLE, (u32 *) &out_data);
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 0)
>  			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> @@ -562,8 +607,8 @@ static ssize_t show_hdmi_source(struct device *dev,
>  		.arg = 0,
>  	};
>  	status =
> -	    alienware_wmax_command(&in_args, WMAX_METHOD_HDMI_STATUS,
> -				   (u32 *) &out_data);
> +	    alienware_wmax_command(&in_args, sizeof(in_args),
> +				   WMAX_METHOD_HDMI_STATUS, (u32 *) &out_data);
>  
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 1)
> @@ -589,7 +634,8 @@ static ssize_t toggle_hdmi_source(struct device *dev,
>  		args.arg = 3;
>  	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
>  
> -	status = alienware_wmax_command(&args, WMAX_METHOD_HDMI_SOURCE, NULL);
> +	status = alienware_wmax_command(&args, sizeof(args),
> +					WMAX_METHOD_HDMI_SOURCE, NULL);
>  
>  	if (ACPI_FAILURE(status))
>  		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
> @@ -642,8 +688,8 @@ static ssize_t show_amplifier_status(struct device *dev,
>  		.arg = 0,
>  	};
>  	status =
> -	    alienware_wmax_command(&in_args, WMAX_METHOD_AMPLIFIER_CABLE,
> -				   (u32 *) &out_data);
> +	    alienware_wmax_command(&in_args, sizeof(in_args),
> +				   WMAX_METHOD_AMPLIFIER_CABLE, (u32 *) &out_data);
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 0)
>  			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> @@ -694,8 +740,8 @@ static ssize_t show_deepsleep_status(struct device *dev,
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> -	status = alienware_wmax_command(&in_args, WMAX_METHOD_DEEP_SLEEP_STATUS,
> -					(u32 *) &out_data);
> +	status = alienware_wmax_command(&in_args, sizeof(in_args),
> +					WMAX_METHOD_DEEP_SLEEP_STATUS, (u32 *) &out_data);
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 0)
>  			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> @@ -723,8 +769,8 @@ static ssize_t toggle_deepsleep(struct device *dev,
>  		args.arg = 2;
>  	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
>  
> -	status = alienware_wmax_command(&args, WMAX_METHOD_DEEP_SLEEP_CONTROL,
> -					NULL);
> +	status = alienware_wmax_command(&args, sizeof(args),
> +					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
>  
>  	if (ACPI_FAILURE(status))
>  		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
> @@ -760,6 +806,140 @@ static int create_deepsleep(struct platform_device *dev)
>  	return ret;
>  }
>  
> +/*
> + * Thermal Profile control
> + *  - Provides thermal profile control through the Platform Profile API
> + */
> +

Extra newline.

> +static int platform_profile_get(struct platform_profile_handler *pprof,
> +				enum platform_profile_option *profile)
> +{
> +	acpi_status status;
> +	u32 in_args = 0x0B;

Use a named define instead of a magic number.

> +	u32 out_data;
> +
> +	status = alienware_wmax_command(&in_args, sizeof(in_args),
> +					WMAX_METHOD_THERMAL_INFORMATION, (u32 *) &out_data);

Casting to the same type??

Also, alienware_wmax_command() inputs int * which makes the cast look even 
more odd?!?

I can see there are pre-existing bogus (u32 *) casts too which would be 
nice to clean up in another patch.

> +
> +	if (ACPI_FAILURE(status) || out_data < 0)

u32 cannot be < 0??

Is this an indication of a problem in the error handling?

> +		return -EOPNOTSUPP;
> +
> +	switch (out_data) {
> +	case WMAX_THERMAL_LOW_POWER:
> +		*profile = PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case WMAX_THERMAL_QUIET:
> +		*profile = PLATFORM_PROFILE_QUIET;
> +		break;
> +	case WMAX_THERMAL_BALANCED:
> +		*profile = PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case WMAX_THERMAL_BALANCED_PERFORMANCE:
> +		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +		break;
> +	case WMAX_THERMAL_PERFORMANCE:
> +	case WMAX_THERMAL_GMODE:
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return 0;
> +}
> +
> +#define SET_MASK(prof) ((prof << 8) | 1)

Name these with two defines. One define for naming that magic 1 and 
another for the profile field, use GENMASK() + FIELD_PREP() for it.

Also, there's no need for this to be macro so change it into a static 
function.

> +static int platform_profile_set(struct platform_profile_handler *pprof,
> +				enum platform_profile_option profile)
> +{
> +	acpi_status status;
> +	u32 in_args;
> +	u32 out_data;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		in_args = SET_MASK(WMAX_THERMAL_LOW_POWER);
> +		break;
> +	case PLATFORM_PROFILE_QUIET:
> +		in_args = SET_MASK(WMAX_THERMAL_QUIET);
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		in_args = SET_MASK(WMAX_THERMAL_BALANCED);
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		in_args = SET_MASK(WMAX_THERMAL_BALANCED_PERFORMANCE);
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		in_args = SET_MASK(WMAX_THERMAL_PERFORMANCE);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	status = alienware_wmax_command(&in_args, sizeof(in_args),
> +					WMAX_METHOD_THERMAL_CONTROL, (u32 *) &out_data);

Cast to same type.

> +
> +	if (ACPI_FAILURE(status) || out_data < 0)

u32 cannot be < 0.

> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int gmode_platform_profile_set(struct platform_profile_handler *pprof,
> +				      enum platform_profile_option profile)
> +{
> +	acpi_status status;
> +	u32 in_args;
> +	u32 out_data;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		in_args = SET_MASK(WMAX_THERMAL_LOW_POWER);
> +		break;
> +	case PLATFORM_PROFILE_QUIET:
> +		in_args = SET_MASK(WMAX_THERMAL_QUIET);
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		in_args = SET_MASK(WMAX_THERMAL_BALANCED);
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		in_args = SET_MASK(WMAX_THERMAL_BALANCED_PERFORMANCE);
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		in_args = SET_MASK(WMAX_THERMAL_GMODE);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	status = alienware_wmax_command(&in_args, sizeof(in_args),

> +					WMAX_METHOD_THERMAL_CONTROL, (u32 *) &out_data);
> +	if (ACPI_FAILURE(status) || out_data < 0)

The same two issues here with the types.

> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int create_platform_profile(void)
> +{
> +	pp_handler.profile_get = platform_profile_get;
> +
> +	if (quirks->gmode > 0)
> +		pp_handler.profile_set = gmode_platform_profile_set;
> +	else
> +		pp_handler.profile_set = platform_profile_set;
> +
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, pp_handler.choices);
> +	set_bit(PLATFORM_PROFILE_QUIET, pp_handler.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, pp_handler.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, pp_handler.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, pp_handler.choices);
> +
> +	return platform_profile_register(&pp_handler);
> +}
> +
>  static int __init alienware_wmi_init(void)
>  {
>  	int ret;
> @@ -807,6 +987,12 @@ static int __init alienware_wmi_init(void)
>  			goto fail_prep_deepsleep;
>  	}
>  
> +	if (quirks->thermal > 0) {
> +		ret = create_platform_profile();
> +		if (ret)
> +			goto fail_prep_thermal_profile;
> +	}
> +
>  	ret = alienware_zone_init(platform_device);
>  	if (ret)
>  		goto fail_prep_zones;
> @@ -817,6 +1003,7 @@ static int __init alienware_wmi_init(void)
>  	alienware_zone_exit(platform_device);
>  fail_prep_deepsleep:
>  fail_prep_amplifier:
> +fail_prep_thermal_profile:
>  fail_prep_hdmi:
>  	platform_device_del(platform_device);
>  fail_platform_device2:
> @@ -836,6 +1023,7 @@ static void __exit alienware_wmi_exit(void)
>  		remove_hdmi(platform_device);
>  		platform_device_unregister(platform_device);
>  		platform_driver_unregister(&platform_driver);
> +		platform_profile_remove();

IIRC, I once checked that this will lead to a crash if it wasn't created 
first (which in your driver isn't always the case).

-- 
 i.


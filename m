Return-Path: <platform-driver-x86+bounces-6460-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094819B4EC1
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Oct 2024 17:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BE13B2293E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Oct 2024 16:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDF2197556;
	Tue, 29 Oct 2024 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL6EmigK"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF80194ACF;
	Tue, 29 Oct 2024 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217600; cv=none; b=QqVzk9r+vDul3tXGS+RZSH3Ri+R9NRIWrgVxF4d/ouoC/Po8GKLL9QWEkKYNGQIUOjqmKbGyyvu8CxGXKb+ejHG8kCDxHFAi2OllSAro+Yi8FPU2ETrMgSUSxiWMISOiqrvjz5W0bNk7DLzYtpudrK05vkSFztwv2Rz9I5pEwjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217600; c=relaxed/simple;
	bh=PWMMEFOdFLvG0u48axNp1JT7rL85+fCWrloyDCqk7Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxgnOQ6OQkY9lkLKjgboXX0V+Latuzas3yH/DSf8TaIvVqOY7zcV4KFUzWCgHWyg0ljgc++hJBE4aSKPE4Se06sM8QofG1qP5Quhbo1Oxi90siBcIW9LUuUL8pJQRB2HoV4u1J0LIMVwf8TCulrKUaV5No8EEnpgZIHdCnr06Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL6EmigK; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ede6803585so1945387a12.0;
        Tue, 29 Oct 2024 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730217597; x=1730822397; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cjbo3VnOpgbpekLcM4O4XsuloRiyX9JlL6lneXNnHTA=;
        b=WL6EmigKv19xlmoZOfv1Tdei5QjzHbU/mDsY4vL/Tgmx6w5QZXl5Tgin8WR1/oWDgU
         nVEBNqrDx70dJDOyn9s/0BGZPjqaLd4FPgO0XDdAnxpvh4lGW3RsTzbR5uDTDhN7pk2p
         evUw4RREc1gR/r9SLrZyL1TvPI9H6TPx0NDnp59ZtgBGF7JEM2s2p3aiNqIiTWLqPydv
         VFhqIW4jhYOmViOWZd1ehaGTIVdX/REd+Qg8YQxSiGjtIewnyJPywOP6UYQUdKXaFAXA
         aGTZg3CS/jPFy7adLm+BE8gfYREGfJ3UxkpaQkgiyncoeg4oJX3g9prtueFtolApwlEL
         fvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730217597; x=1730822397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjbo3VnOpgbpekLcM4O4XsuloRiyX9JlL6lneXNnHTA=;
        b=B/1T9GjnlqHGNuYqbaTG2TBDueXU1LrXmqS7zgBcd7jqj5v5rejzbocoPUB3n8r3Ta
         uzueGzl4Oirzr3NCbbyUxrcb/ptUvGbvuxULMYTAKetfdFBF2qaa54u4MmooVuMCA6AI
         tBU35sQlbXiwtCVXyB7m/k+2h5grF/MTesLJyNSv1z1gr3GZAsCk/v1FXfpY9wiaNMEZ
         UF+EtlpazQfTeZlaKBTNN8DqH3ccTN03QbjZa5JNBG5p3KX8Dt4X1ByVxMjHHoh3ZzUd
         kYK3YSwZvT86J7wbKBl/x9uApHBnrHjKG2cHub9JS7iktvh2/xYhNBKlFBMqvSOSUP4G
         uSlw==
X-Forwarded-Encrypted: i=1; AJvYcCVpmCDAolQHzyY3sxXITgQPXTOPRrc6BP3CbBGRMpk/akoVY7wHbFHJVSAUmRAeCUjvsCkr8Di7aB8ecBnlVGrGVj2BoQ==@vger.kernel.org, AJvYcCX5GvYF7OLzrp/gJHqlr4njEoHnnhccJT8y0DWgLTH10EjsY+Aqx24m3dqB6PTUjaySPccfT5365/Ut20I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWjLfo/XtgDyVLBfOXq6rN+dYjCovVty2DCzg7uEbTbDTj7pno
	BIBkVnHliL8Ya4OFTU2N1OJZBaNNARINhYuazGvVwxb/UmCfvX1s
X-Google-Smtp-Source: AGHT+IHIU+fIfUa2Jwt0kEJ/xuisuggUeo7BIa12sGgPv7MOcrhaISWynswVwD3R5Iu793KBZBhgFg==
X-Received: by 2002:a17:90b:4c4e:b0:2da:88b3:cff8 with SMTP id 98e67ed59e1d1-2e92236554emr3998994a91.6.1730217596379;
        Tue, 29 Oct 2024 08:59:56 -0700 (PDT)
Received: from alphacentauri (host95.181-12-202.telecom.net.ar. [181.12.202.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3748a56sm9620637a91.40.2024.10.29.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 08:59:56 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:59:52 -0300
From: Kurt Borja <kuurtb@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hdegoede@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v10 3/5] alienware-wmi: added platform profile support
Message-ID: <pvsp76cvdqp7irpa52mr3canryyzilgvyijhtqvxzhix3diavj@bcfuduinqlcb>
References: <20241029135107.5582-2-kuurtb@gmail.com>
 <20241029135341.5906-1-kuurtb@gmail.com>
 <9caaa4f1-9605-da2a-9afd-8f40ed33719f@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9caaa4f1-9605-da2a-9afd-8f40ed33719f@linux.intel.com>

On Tue, Oct 29, 2024 at 05:44:05PM +0200, Ilpo J�rvinen wrote:
> On Tue, 29 Oct 2024, Kurt Borja wrote:
> 
> > Implements platform profile support for Dell laptops with new WMAX thermal
> > interface, present on some Alienware X-Series, Alienware M-Series and
> > Dell's G-Series laptops. This interface is suspected to be used by
> > Alienware Command Center (AWCC), which is not available for linux
> > systems, to manage thermal profiles.
> > 
> > This implementation makes use of three WMI methods, namely
> > THERMAL_CONTROL, THERMAL_INFORMATION and GAME_SHIFT_STATUS, which take
> > u32 as input and output arguments. Each method has a set of supported
> > operations specified in their respective enums.
> > 
> > Not all models with WMAX WMI interface support these methods. Because of
> > this, models have to manually declare support through new quirks
> > `thermal` for THERMAL_CONTROL and THERMAL_INFORMATION and `gmode` for
> > GAME_SHIFT_STATUS.
> > 
> > Wrappers written for these methods support multiple operations.
> > 
> > THERMAL_CONTROL switches thermal modes through operation
> > ACTIVATE_PROFILE. Available thermal codes are auto-detected at runtime
> > and matched against a list of known thermal codes:
> > 
> > Thermal Table "User Selectable Thermal Tables" (USTT):
> > 	BALANCED			0xA0
> > 	BALANCED_PERFORMANCE		0xA1
> > 	COOL				0xA2
> > 	QUIET				0xA3
> > 	PERFORMANCE			0xA4
> > 	LOW_POWER			0xA5
> > 
> > Thermal Table Basic:
> > 	QUIET				0x96
> > 	BALANCED			0x97
> > 	BALANCED_PERFORMANCE		0x98
> > 	PERFORMANCE			0x99
> > 
> > Devices are known to implement only one of these tables without mixing
> > their thermal codes.
> > 
> > The fact that the least significant digit of every thermal code is
> > consecutive of one another is exploited to efficiently match codes
> > through arrays.
> > 
> > Autodetection of available codes is done through operation LIST_IDS of
> > method THERMAL_INFORMATION. This operation lists fan IDs, CPU sensor ID,
> > GPU sensor ID and available thermal profile codes, *in that order*. As
> > number of fans and thermal codes is very model dependent, almost every
> > ID is scanned and matched based on conditions found on
> > is_wmax_thermal_code(). The known upper bound for the number of IDs is
> > 13, corresponding to a device that have 4 fans, 2 sensors and 7 thermal
> > codes.
> > 
> > Additionally G-Series laptops have a key called G-key, which (with AWCC
> > proprietary driver) switches the thermal mode to an special mode named
> > GMODE with code 0xAB and changes Game Shift Status to 1. Game Shift is a
> > mode the manufacturer claims, increases gaming performance.
> > 
> > GAME_SHIFT_STATUS method is used to mimic this behavior when selecting
> > PLATFORM_PROFILE_PERFORMANCE option.
> > 
> > All of these profiles are known to only change fan speed profiles,
> > although there are untested claims that some of them also change power
> > profiles.
> > 
> > Activating a thermal mode with method THERMAL_CONTROL may cause short
> > hangs. This is a known problem present on every platform.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> > v10:
> >  - Corrected THERMAL_MODE_BASIC_BALANCED -> THERMAL_MODE_BASIC_QUIET in
> >    is_wmax_thermal_code() logic
> >  - `thermal` and `gmode` quirks now have to be manually selected,
> >    because not all Dell devices posses the new WMI thermal methods.
> >  - Because of the above reason, errors in create_thermal_profile are now
> >    propagated
> > v9:
> >  - Bool comparisons are now coherent with their type
> > v8:
> >  - Fixed alignment in wmax_mode_to_platform_profile[]
> >  - Quirk thermal and gmode changed from u8 -> bool
> >  - Autodetected quirk entries are not initialized
> >  - is_wmax_thermal_code refactored to increase readibility
> >  - is_wmax_thermal_code now covers all possibilities
> >  - Better commit message
> > v7:
> >  - Method operations are now clearly listed as separate enums
> >  - wmax_thermal_modes are now listed without codes in order to support
> >    autodetection, as well as getting and setting thermal profiles
> >    cleanly through arrays
> >  - Added wmax_mode_to_platform_profile[]
> >  - Added struct wmax_u32_args to replace bit mask approach of
> >    constructing arguments for wmax methods
> >  - create_thermal_profile now autodetects available thermal codes
> >    through operation 0x03 of THERMAL_INFORMATION method. These are
> >    codes are stored in supported_thermal_profiles[]
> >  - thermal_profile_get now uses wmax_mode_to_platform_profile[] instead of
> >    switch-case approach
> >  - thermal_profile_set now uses supported_thermal_profiles[] instead of
> >    switch-case approach
> >  - When gmode is autodetected, thermal_profile_set also sets Game Shift
> >    status accordingly
> > v6:
> >  - Fixed alignment on some function definitions
> >  - Fixed braces on if statment
> >  - Removed quirk thermal_ustt
> >  - Now quirk thermal can take values defined in enum WMAX_THERMAL_TABLE.
> >  - Proper removal of thermal_profile
> > ---
> >  drivers/platform/x86/dell/Kconfig         |   1 +
> >  drivers/platform/x86/dell/alienware-wmi.c | 306 ++++++++++++++++++++++
> >  2 files changed, 307 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> > index 68a49788a..b06d634cd 100644
> > --- a/drivers/platform/x86/dell/Kconfig
> > +++ b/drivers/platform/x86/dell/Kconfig
> > @@ -21,6 +21,7 @@ config ALIENWARE_WMI
> >  	depends on LEDS_CLASS
> >  	depends on NEW_LEDS
> >  	depends on ACPI_WMI
> > +	select ACPI_PLATFORM_PROFILE
> >  	help
> >  	 This is a driver for controlling Alienware BIOS driven
> >  	 features.  It exposes an interface for controlling the AlienFX
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index b27f3b64c..1d62c2ce7 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -8,8 +8,11 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  
> >  #include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/platform_profile.h>
> >  #include <linux/dmi.h>
> >  #include <linux/leds.h>
> >  
> > @@ -25,6 +28,13 @@
> >  #define WMAX_METHOD_AMPLIFIER_CABLE	0x6
> >  #define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
> >  #define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
> > +#define WMAX_METHOD_THERMAL_INFORMATION	0x14
> > +#define WMAX_METHOD_THERMAL_CONTROL	0x15
> > +#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
> > +
> > +#define WMAX_THERMAL_MODE_GMODE		0xAB
> > +
> > +#define WMAX_FAILURE_CODE		0xFFFFFFFF
> >  
> >  MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> >  MODULE_DESCRIPTION("Alienware special feature control");
> > @@ -49,11 +59,59 @@ enum WMAX_CONTROL_STATES {
> >  	WMAX_SUSPEND = 3,
> >  };
> >  
> > +enum WMAX_THERMAL_INFORMATION_OPERATIONS {
> > +	WMAX_OPERATION_LIST_IDS			= 0x03,
> > +	WMAX_OPERATION_CURRENT_PROFILE		= 0x0B,
> > +};
> > +
> > +enum WMAX_THERMAL_CONTROL_OPERATIONS {
> > +	WMAX_OPERATION_ACTIVATE_PROFILE		= 0x01,
> > +};
> > +
> > +enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
> > +	WMAX_OPERATION_TOGGLE_GAME_SHIFT	= 0x01,
> > +	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	= 0x02,
> > +};
> > +
> > +enum WMAX_THERMAL_TABLES {
> > +	WMAX_THERMAL_TABLE_BASIC		= 0x90,
> > +	WMAX_THERMAL_TABLE_USTT			= 0xA0,
> > +};
> > +
> > +enum wmax_thermal_mode {
> > +	THERMAL_MODE_USTT_BALANCED,
> > +	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
> > +	THERMAL_MODE_USTT_COOL,
> > +	THERMAL_MODE_USTT_QUIET,
> > +	THERMAL_MODE_USTT_PERFORMANCE,
> > +	THERMAL_MODE_USTT_LOW_POWER,
> > +	THERMAL_MODE_BASIC_QUIET,
> > +	THERMAL_MODE_BASIC_BALANCED,
> > +	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
> > +	THERMAL_MODE_BASIC_PERFORMANCE,
> > +	THERMAL_MODE_LAST,
> > +};
> > +
> > +static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_MODE_LAST] = {
> > +	[THERMAL_MODE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
> > +	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> > +	[THERMAL_MODE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
> > +	[THERMAL_MODE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
> > +	[THERMAL_MODE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
> > +	[THERMAL_MODE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
> > +	[THERMAL_MODE_BASIC_QUIET]			= PLATFORM_PROFILE_QUIET,
> > +	[THERMAL_MODE_BASIC_BALANCED]			= PLATFORM_PROFILE_BALANCED,
> > +	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> > +	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
> > +};
> > +
> >  struct quirk_entry {
> >  	u8 num_zones;
> >  	u8 hdmi_mux;
> >  	u8 amplifier;
> >  	u8 deepslp;
> > +	bool thermal;
> > +	bool gmode;
> >  };
> >  
> >  static struct quirk_entry *quirks;
> > @@ -64,6 +122,8 @@ static struct quirk_entry quirk_inspiron5675 = {
> >  	.hdmi_mux = 0,
> >  	.amplifier = 0,
> >  	.deepslp = 0,
> > +	.thermal = false,
> > +	.gmode = false,
> >  };
> >  
> >  static struct quirk_entry quirk_unknown = {
> > @@ -71,6 +131,8 @@ static struct quirk_entry quirk_unknown = {
> >  	.hdmi_mux = 0,
> >  	.amplifier = 0,
> >  	.deepslp = 0,
> > +	.thermal = false,
> > +	.gmode = false,
> >  };
> >  
> >  static struct quirk_entry quirk_x51_r1_r2 = {
> > @@ -78,6 +140,8 @@ static struct quirk_entry quirk_x51_r1_r2 = {
> >  	.hdmi_mux = 0,
> >  	.amplifier = 0,
> >  	.deepslp = 0,
> > +	.thermal = false,
> > +	.gmode = false,
> >  };
> >  
> >  static struct quirk_entry quirk_x51_r3 = {
> > @@ -85,6 +149,8 @@ static struct quirk_entry quirk_x51_r3 = {
> >  	.hdmi_mux = 0,
> >  	.amplifier = 1,
> >  	.deepslp = 0,
> > +	.thermal = false,
> > +	.gmode = false,
> >  };
> >  
> >  static struct quirk_entry quirk_asm100 = {
> > @@ -92,6 +158,8 @@ static struct quirk_entry quirk_asm100 = {
> >  	.hdmi_mux = 1,
> >  	.amplifier = 0,
> >  	.deepslp = 0,
> > +	.thermal = false,
> > +	.gmode = false,
> >  };
> >  
> >  static struct quirk_entry quirk_asm200 = {
> > @@ -99,6 +167,8 @@ static struct quirk_entry quirk_asm200 = {
> >  	.hdmi_mux = 1,
> >  	.amplifier = 0,
> >  	.deepslp = 1,
> > +	.thermal = false,
> > +	.gmode = false,
> >  };
> >  
> >  static struct quirk_entry quirk_asm201 = {
> > @@ -106,6 +176,17 @@ static struct quirk_entry quirk_asm201 = {
> >  	.hdmi_mux = 1,
> >  	.amplifier = 1,
> >  	.deepslp = 1,
> > +	.thermal = false,
> > +	.gmode = false,
> > +};
> > +
> > +static struct quirk_entry quirk_x_series = {
> > +	.num_zones = 2,
> > +	.hdmi_mux = 0,
> > +	.amplifier = 0,
> > +	.deepslp = 0,
> > +	.thermal = true,
> > +	.gmode = false,
> >  };
> 
> So now gmode is always false unless the module parameter from patch 4 is 
> given?

G-Series laptops can also register a quirk_entry with gmode set in the
future. I can do it ahead of time, but I don't have a G-Series laptop to
test it.

Kurt

> 
> --
>  i.
> 
> >  static int __init dmi_matched(const struct dmi_system_id *dmi)
> > @@ -178,6 +259,15 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
> >  		},
> >  		.driver_data = &quirk_inspiron5675,
> >  	},
> > +	{
> > +		.callback = dmi_matched,
> > +		.ident = "Alienware x15 R1",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> > +		},
> > +		.driver_data = &quirk_x_series,
> > +	},
> >  	{}
> >  };
> >  
> > @@ -214,10 +304,19 @@ struct wmax_led_args {
> >  	u8 state;
> >  } __packed;
> >  
> > +struct wmax_u32_args {
> > +	u8 operation;
> > +	u8 arg1;
> > +	u8 arg2;
> > +	u8 arg3;
> > +};
> > +
> >  static struct platform_device *platform_device;
> >  static struct device_attribute *zone_dev_attrs;
> >  static struct attribute **zone_attrs;
> >  static struct platform_zone *zone_data;
> > +static struct platform_profile_handler pp_handler;
> > +static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> >  
> >  static struct platform_driver platform_driver = {
> >  	.driver = {
> > @@ -761,6 +860,204 @@ static int create_deepsleep(struct platform_device *dev)
> >  	return ret;
> >  }
> >  
> > +/*
> > + * Thermal Profile control
> > + *  - Provides thermal profile control through the Platform Profile API
> > + */
> > +#define WMAX_THERMAL_TABLE_MASK		GENMASK(7, 4)
> > +#define WMAX_THERMAL_MODE_MASK		GENMASK(3, 0)
> > +#define WMAX_SENSOR_ID_MASK		BIT(8)
> > +
> > +static bool is_wmax_thermal_code(u32 code)
> > +{
> > +	if (code & WMAX_SENSOR_ID_MASK)
> > +		return false;
> > +
> > +	if ((code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_LAST)
> > +		return false;
> > +
> > +	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_BASIC &&
> > +	    (code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_BASIC_QUIET)
> > +		return true;
> > +
> > +	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
> > +	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> > +static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
> > +{
> > +	acpi_status status;
> > +	struct wmax_u32_args in_args = {
> > +		.operation = operation,
> > +		.arg1 = arg,
> > +		.arg2 = 0,
> > +		.arg3 = 0,
> > +	};
> > +
> > +	status = alienware_wmax_command(&in_args, sizeof(in_args),
> > +					WMAX_METHOD_THERMAL_INFORMATION,
> > +					out_data);
> > +
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	if (*out_data == WMAX_FAILURE_CODE)
> > +		return -EBADRQC;
> > +
> > +	return 0;
> > +}
> > +
> > +static int wmax_thermal_control(u8 profile)
> > +{
> > +	acpi_status status;
> > +	struct wmax_u32_args in_args = {
> > +		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
> > +		.arg1 = profile,
> > +		.arg2 = 0,
> > +		.arg3 = 0,
> > +	};
> > +	u32 out_data;
> > +
> > +	status = alienware_wmax_command(&in_args, sizeof(in_args),
> > +					WMAX_METHOD_THERMAL_CONTROL,
> > +					&out_data);
> > +
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	if (out_data == WMAX_FAILURE_CODE)
> > +		return -EBADRQC;
> > +
> > +	return 0;
> > +}
> > +
> > +static int wmax_game_shift_status(u8 operation, u32 *out_data)
> > +{
> > +	acpi_status status;
> > +	struct wmax_u32_args in_args = {
> > +		.operation = operation,
> > +		.arg1 = 0,
> > +		.arg2 = 0,
> > +		.arg3 = 0,
> > +	};
> > +
> > +	status = alienware_wmax_command(&in_args, sizeof(in_args),
> > +					WMAX_METHOD_GAME_SHIFT_STATUS,
> > +					out_data);
> > +
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	if (*out_data == WMAX_FAILURE_CODE)
> > +		return -EOPNOTSUPP;
> > +
> > +	return 0;
> > +}
> > +
> > +static int thermal_profile_get(struct platform_profile_handler *pprof,
> > +			       enum platform_profile_option *profile)
> > +{
> > +	u32 out_data;
> > +	int ret;
> > +
> > +	ret = wmax_thermal_information(WMAX_OPERATION_CURRENT_PROFILE,
> > +				       0, &out_data);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (out_data == WMAX_THERMAL_MODE_GMODE) {
> > +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> > +		return 0;
> > +	}
> > +
> > +	if (!is_wmax_thermal_code(out_data))
> > +		return -ENODATA;
> > +
> > +	out_data &= WMAX_THERMAL_MODE_MASK;
> > +	*profile = wmax_mode_to_platform_profile[out_data];
> > +
> > +	return 0;
> > +}
> > +
> > +static int thermal_profile_set(struct platform_profile_handler *pprof,
> > +			       enum platform_profile_option profile)
> > +{
> > +	if (quirks->gmode) {
> > +		u32 gmode_status;
> > +		int ret;
> > +
> > +		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> > +					     &gmode_status);
> > +
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
> > +		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> > +			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> > +						     &gmode_status);
> > +
> > +			if (ret < 0)
> > +				return ret;
> > +		}
> > +	}
> > +
> > +	return wmax_thermal_control(supported_thermal_profiles[profile]);
> > +}
> > +
> > +static int create_thermal_profile(void)
> > +{
> > +	u32 out_data;
> > +	enum wmax_thermal_mode mode;
> > +	enum platform_profile_option profile;
> > +	int ret;
> > +
> > +	for (u8 i = 0x2; i <= 0xD; i++) {
> > +		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
> > +					       i, &out_data);
> > +
> > +		if (ret == -EIO)
> > +			return ret;
> > +
> > +		if (ret == -EBADRQC)
> > +			break;
> > +
> > +		if (!is_wmax_thermal_code(out_data))
> > +			continue;
> > +
> > +		mode = out_data & WMAX_THERMAL_MODE_MASK;
> > +		profile = wmax_mode_to_platform_profile[mode];
> > +		supported_thermal_profiles[profile] = out_data;
> > +
> > +		set_bit(profile, pp_handler.choices);
> > +	}
> > +
> > +	if (bitmap_empty(pp_handler.choices, PLATFORM_PROFILE_LAST))
> > +		return -ENODEV;
> > +
> > +	if (quirks->gmode) {
> > +		supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> > +			WMAX_THERMAL_MODE_GMODE;
> > +
> > +		set_bit(PLATFORM_PROFILE_PERFORMANCE, pp_handler.choices);
> > +	}
> > +
> > +	pp_handler.profile_get = thermal_profile_get;
> > +	pp_handler.profile_set = thermal_profile_set;
> > +
> > +	return platform_profile_register(&pp_handler);
> > +}
> > +
> > +static void remove_thermal_profile(void)
> > +{
> > +	if (quirks->thermal)
> > +		platform_profile_remove();
> > +}
> > +
> >  static int __init alienware_wmi_init(void)
> >  {
> >  	int ret;
> > @@ -808,6 +1105,12 @@ static int __init alienware_wmi_init(void)
> >  			goto fail_prep_deepsleep;
> >  	}
> >  
> > +	if (quirks->thermal) {
> > +		ret = create_thermal_profile();
> > +		if (ret)
> > +			goto fail_prep_thermal_profile;
> > +	}
> > +
> >  	ret = alienware_zone_init(platform_device);
> >  	if (ret)
> >  		goto fail_prep_zones;
> > @@ -816,6 +1119,8 @@ static int __init alienware_wmi_init(void)
> >  
> >  fail_prep_zones:
> >  	alienware_zone_exit(platform_device);
> > +	remove_thermal_profile();
> > +fail_prep_thermal_profile:
> >  fail_prep_deepsleep:
> >  fail_prep_amplifier:
> >  fail_prep_hdmi:
> > @@ -835,6 +1140,7 @@ static void __exit alienware_wmi_exit(void)
> >  	if (platform_device) {
> >  		alienware_zone_exit(platform_device);
> >  		remove_hdmi(platform_device);
> > +		remove_thermal_profile();
> >  		platform_device_unregister(platform_device);
> >  		platform_driver_unregister(&platform_driver);
> >  	}
> > 



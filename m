Return-Path: <platform-driver-x86+bounces-7830-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CA9F5D9F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Dec 2024 04:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C28169CD4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Dec 2024 03:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB7D1494BB;
	Wed, 18 Dec 2024 03:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhIfrCby"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD3381AF;
	Wed, 18 Dec 2024 03:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734493954; cv=none; b=FszhSE8Sb/Z7TwRHuyHLNO7sMSUrSaJ+q4XvyVbbGgjEHV74BxAVegc5L5U2GRVtGyuTSY6yPEC/QGzedd7NDGxNjPVVMSNMDRVpq/6fWZSOiBH6elzcuINtI8f0oWFagpTX07cOEq1hlLclKv7r7wZnBn4v1e9FuH6KIZgWsuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734493954; c=relaxed/simple;
	bh=wMpsCCetfwRiDyamQhDQsCzsCD44aE3N+nNGQnsoJAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr/CYHrhi+GsrchO64M3EF4tb4OXd0b+fWRK95+mfCxyDxu7gjH4Rj8szVGbbn/gJNbi+bZlUNN+0VJPsIlJf6106sgQ3RE/mo2rqzPvdGOKYQesyYylljr/eN0JWtW9tzDCZPmkxoNHSUkt62Y12Pgwo0knyc0SPqU+6JnuKEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhIfrCby; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21644aca3a0so71576075ad.3;
        Tue, 17 Dec 2024 19:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734493950; x=1735098750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B80SquObb6ZKUyepM4IkKhgWkCkgnmGGV05Hu4KouFM=;
        b=IhIfrCby7YfK7tm+JP03zGqLE4v3a+RXaMoJ5Hu8WM24dIWxnebXVhl2ZkIr7eH+IQ
         ccjpKfRWfz1fC4/8y5DZWIorC/DXH0wIkT90hmwAUK8IFEU9RWMElkbnNod2iPMLItoz
         +M+vEHktYXslPYBvuDStBWswgruI1YKwxMn5t65o5YId1pyhru4GiccbtE76DI+VzlJX
         PgtsslEy4QkfmmG67v1r+XDy8WsSa5t3PLAf8QmQyff/Qpj6VaCNxdJmbsqmlkTRq9zl
         K7dWNJYyF1A5c0aaeOSdrgrPUayGcWxSHH2W+0qlsP/qF+aVb1+nE70jPls0TL6/DFOX
         531A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734493950; x=1735098750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B80SquObb6ZKUyepM4IkKhgWkCkgnmGGV05Hu4KouFM=;
        b=t/Ppkqh24tBtqdKpLoGxQp9B14RoibZncsUb0269GR14tSlDz3RpFqJdOcFR5FXPJL
         30+SjrMyccYAQs3G94MiEh7c0QWvR+jrvBil/PVvNQIJRE60ZXt9Itd8aUgq9s1UhR9U
         f//Y20tiHT8Y0jo2Zd+e5ASH1ee+Uh2u14oAoDE71dzOPr1drEUGxlhUETEzM16QH3vu
         f6mOorK+QfYUyt9/pFH5djw1l7FchND82aDc5wekkCbuOEYmKS410xUwmC4lfoCSNTLs
         gTYuShCTgOqjDS5GcOwtEzpwdk527rcMwqX95S4EBDj30E3AEU93dKsCwyC/XH4WL/1I
         qy/g==
X-Forwarded-Encrypted: i=1; AJvYcCUUd2b+9bhL171OLtWNYAnSYv/jfniXdE9g2RlOL3vjL2xSDJqOBIII2bhIanHeMn1Pi5UTcDakP7+BzG60@vger.kernel.org, AJvYcCUozEaa4U/GarUj8IaXTgz5ouyPCzln3n2hL8MliKDDaqqPI1gT2aCz9OSQ5kH/m85xjOEFTMgGKPQ=@vger.kernel.org, AJvYcCWDnApR78/kXwDuYtpwcTvGnnoekwPwKWU8gG6tzG3Zp57q9KJviLiLgaZv0aRFruCKb7NefOEEIUFmSsISCWwklqkYdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxviyuHw9PYEPCIlW2b0bIkdExXWH3GAdIRU+Yn/0ixr772Aj/o
	CYlIu6l3HWseIgD1G4h9ALEY1hXq2jl/SshZG9J5o1qLSm7MliSL
X-Gm-Gg: ASbGncslfBj9n/0e2jCe7t9pJy7o7W4ZP1sUICi6Jl52ekD1FRWPpgFJotY1QA09TYh
	JBEEiW++u78JG4ZO8gPkH3mbCOf/TTyfEr4e7ws37zCNJO05lZpTEatpSJQ5nFGE970okhPBMkZ
	2frGLhmDZiabdiVt4Nyx0fpwtJpbDqJU/l646qFSkbrQxxPTHE85gT9ZhQ5e8dNPZ9aVYeS/jIR
	0L00X7CiKsKdIyeL00b1W+KIjng33wv/huo7e52NF5ZY9RcCwuhcaEWltbpVy6HxNs/Eh5htviu
	KcniMZumgKh6bVrOLWJ/RVKoW4c1lF9f5LIET7QKYCrOH7ZFhGMnu3w=
X-Google-Smtp-Source: AGHT+IE6Db7EkLiZgLFyIvHFlcGti8a7gn76db/ajANyKMpTItPo/mM985VffCy5gHbs9xa73Yy8vw==
X-Received: by 2002:a17:903:440d:b0:216:52a5:dd41 with SMTP id d9443c01a7336-218d721ac59mr17013535ad.31.1734493949949;
        Tue, 17 Dec 2024 19:52:29 -0800 (PST)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5c586sm66889945ad.180.2024.12.17.19.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 19:52:28 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
Date: Tue, 17 Dec 2024 19:36:38 -0800
Message-ID: <20241218035227.26707-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <48320f65-8230-4e49-91c0-eeeca47ed2d2@kernel.org>
References: <48320f65-8230-4e49-91c0-eeeca47ed2d2@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mario,

Thank you for taking a look at it so quickly.

>> Adds lenovo-legion-wmi.h which provides templates and some method
>> implementations used by the lenovo-legion-wmi driver series.
>> 
>> Adds lenovo-legion-wmi-gamezone.c which provides a driver for the Lenovo
>> GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
>> Provides ACPI platform profiles over WMI.
>> 
>> Adds lenovo-legion-wmi-other.c which provides a driver for the Lenovo
>> "Other Method" WMI interface that comes on some Lenovo hardware.
>> Provides a firmware-attributes class which enables the use of tunable
>> knobs for SPL, SPPT, and FPPT.
>> 
>> Adds lenovo-legion-wmi-capdata01.c which provides a driver for the
>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Method"
>> enabled hardware. Provides an interface for querying if a given
>> attribute is supported by the hardware, as well as its default_value,
>> max_value, min_value, and step increment.
>> 
z>> Adds lenovo-legion-wmi.rst describing the available drivers and their
>> function.
>> 
>> Updates Kconfig, Makefile, and MAINTAINERS to include the new drivers.
>> 
>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>
>Hi Derek,
>
>As a high level first comment; "larger" patches are much harder to review.
>
>It seems that the drivers are logically split as described in your 
>commit message already.  For the next version could you split at least 
>each driver to it's own patch?
>
>It might also make sense to split up the individual drivers along 
>"features".

Can do. It might still make sense to have capdata01 with the other_method
driver, it has no functionality on its own and is a dependency of other_method.
It isn't a problem to have capdata01 as an earlier patch than other_method
though if preferred. I'm not sure how I would break up the drivers further
than that, except the relevant header portions per c file.

>This is my own personal opinion and not a requirement but I personally 
>like to see documentation for something new like this as it's own patch 
>at the beginning of the series so we can make sure everyone understands 
>and agrees on the design as they review the series and then can make 
>sure that the implementation matches the design as the other patches are 
>reviewed.

Acked, will add Documentation as its own 1/ patch.

>I've got various other comments sprinkled throughout the patch, please 
>see them.  I'm not 100% sure on the mutex use yet, we should review that 
>after you've got all the cleanups needed done.
>
>> ---
>>   .../wmi/devices/lenovo-legion-wmi.rst         |  79 ++++
>>   MAINTAINERS                                   |   9 +
>>   drivers/platform/x86/Kconfig                  |  35 ++
>>   drivers/platform/x86/Makefile                 |  21 +-
>>   .../x86/lenovo-legion-wmi-capdata01.c         | 103 +++++
>>   .../platform/x86/lenovo-legion-wmi-gamezone.c | 233 +++++++++++
>>   .../platform/x86/lenovo-legion-wmi-other.c    | 377 ++++++++++++++++++
>>   drivers/platform/x86/lenovo-legion-wmi.h      | 271 +++++++++++++
>>   8 files changed, 1119 insertions(+), 9 deletions(-)
>>   create mode 100644 Documentation/wmi/devices/lenovo-legion-wmi.rst
>>   create mode 100644 drivers/platform/x86/lenovo-legion-wmi-capdata01.c
>>   create mode 100644 drivers/platform/x86/lenovo-legion-wmi-gamezone.c
>>   create mode 100644 drivers/platform/x86/lenovo-legion-wmi-other.c
>>   create mode 100644 drivers/platform/x86/lenovo-legion-wmi.h
>> 
>> diff --git a/Documentation/wmi/devices/lenovo-legion-wmi.rst b/Documentation/wmi/devices/lenovo-legion-wmi.rst
>> new file mode 100644
>> index 000000000000..37b09c82c980
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/lenovo-legion-wmi.rst
>> @@ -0,0 +1,79 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +======================================================
>> +Lenovo Legion WMI Interface Driver (lenovo-legion-wmi)
>> +======================================================
>> +
>> +Introduction
>> +============
>> +The Lenovo Legion WMI interface is broken up into multiple GUID interfaces that
>> +require cross-references between GUID's for some functionality. The "Custom
>> +Mode" interface is a legacy interface for managing and displaying CPU & GPU
>> +power and hwmon settings and readings. The "Other Mode" interface is a modern
>> +interface that replaces "Custom Mode" interface methods. The "GameZone"
>> +interface adds advanced features such as fan profiles and overclocking. The
>> +"Lighting" interface adds control of various status lights related to different
>> +hardware components.
>> +
>> +Each of these interfaces has a different data structure associated with it that
>> +provide detailed information about each attribute provided by the interface.
>> +These data structs are retrieved from an additional WMI device data block GUID:
>> + - The "Custom Mode" interface uses LENOVO_CAPABILITY_DATA_00
>> + - The "Other Mode" interface uses LENOVO_CAPABILITY_DATA_01
>> + - The "Lighting" interface uses LENOVO_CAPABILITY_DATA_02
>> +
>> +.. note::
>> +   Currently only the "Gamezone", "Other Mode", and LENOVO_CAPABILITY_DATA_01
>> +   interfaces are implemented by this driver.
>
>So this is to say that lighting interface is not implemented right now, 
>right?

Custom Mode, Lighting, LENOVO_CAPABILITY_DATA_00, and LENOVO_CAPABILITY_DATA_02
are not implemented yet. For now Lenovo are okay with that but may want more
later.

>> +
>> +
>> +GameZone
>> +--------
>> +The GameZone WMI interface provides ACPI platform profile and fan curve
>> +settings for devices that fall under the "Gaming Series" of Lenovo Legion
>> +devices.
>> +
>> +The following platform profiles are supported:
>> + - quiet
>> + - balanced
>> + - performance
>> + - custom
>> +
>> +Custom Profile
>> +~~~~~~~~~~~~~~
>> +The custom profile is enabled but is not user selectable. This setting
>> +represents a hardware mode on Lenovo Legion devices that enables user
>> +modifications to Package Power Tracking settings. When an attribute exposed
>> +by the "Other Mode" WMI Interface is modified, the GameZone driver will switch
>> +to this profile automatically.
>
>I think you should explicitly mention that it's undone if the user 
>selects a fixed platform mode too.  (It does, right?)

It does as a BIOS feature, acked for fix.

>> +
>> +
>> +Other Mode
>> +----------
>> +The Other Mode WMI interface uses the fw_attributes class to expose various
>> +WMI functions provided by the interface in the sysfs. This enables CPU and GPU
>> +power limit tuning as well as various other attributes for devices that fall
>> +under the "Gaming Series" of Lenovo Legion devices. Each attribute exposed by
>> +the "Other Method" interface has corresponding LENOVO_CAPABILITY_DATA_01 pages
>> +that allow the driver to probe details about the attribute. Each attibute has
>> +multiple pages, one for each of the platform profiles managed by the "GameZone"
>> +interface, so it must be probed prior to returning the current_value. For
>> +read-only properties, only the "Custom" profile values are reported to ensure
>> +any userspace applications reading them have accurate tunable value ranges.
>> +Attributes are exposed in sysfs under the following path:
>> +/sys/class/firmware-attributes/lenovo-legion-wmi/attributes
>> +
>> +Supported Attibutes
>> +~~~~~~~~~~~~~~~~~~~
>> +The following attributes are supported:
>> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
>> +
>> +Each attribute has the following properties:
>> + - current_value
>> + - default_value
>> + - display_name
>> + - max_value
>> + - min_value
>> + - scalar_increment
>> + - type
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index baf0eeb9a355..67f7b588aa36 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13034,6 +13034,15 @@ S:	Maintained
>>   W:	http://legousb.sourceforge.net/
>>   F:	drivers/usb/misc/legousbtower.c
>>   
>> +LENOVO LEGION WMI driver
>> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/platform/x86/lenovo-legion-wmi-capdata01.c
>> +F:	drivers/platform/x86/lenovo-legion-wmi-gamezone.c
>> +F:	drivers/platform/x86/lenovo-legion-wmi-other.c
>> +F:	drivers/platform/x86/lenovo-legion-wmi.h
>> +
>>   LETSKETCH HID TABLET DRIVER
>>   M:	Hans de Goede <hdegoede@redhat.com>
>>   L:	linux-input@vger.kernel.org
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 0258dd879d64..a51a1a2fe7ba 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -459,6 +459,41 @@ config IBM_RTL
>>   	 state = 0 (BIOS SMIs on)
>>   	 state = 1 (BIOS SMIs off)
>>   
>> +config LEGION_GAMEZONE_WMI
>> +	tristate "Lenovo Legion GameZone WMI Driver"
>> +	depends on ACPI_WMI
>> +	select ACPI_PLATFORM_PROFILE
>> +	help
>> +	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
>> +	  platform-profile firmware interface.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called lenovo_legion_wmi_gamezone.
>> +
>> +config LEGION_DATA_01_WMI
>> +	tristate "Lenovo Legion WMI capability Data 01 Driver"
>> +	depends on ACPI_WMI
>> +	help
>> +	  Say Y here if you have a WMI aware Lenovo Legion device in the "Gaming Series"
>> +	  line of hardware. This interface is a dependency for exposing tunable power
>> +	  settings.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called lenovo_legion_wmi_capdata01.
>> +
>> +config LEGION_OTHER_WMI
>> +	tristate "Lenovo Legion Other Method WMI Driver"
>
>As a new user coming here, how are they going to know what "other" 
>means?  I'm sort of thinking it's better to calls this "CUSTOM_WMI"?  Or 
>maybe "CUSTOM_POWER_MODES_WMI"?  Maybe Armin or others have some input 
>here too.

Other Method is the name Lenovo gave the interface. I'm open to suggestions,
but Custom Method is the name of the older Legion WMI interface so I'd like to
reserve that in case Lenovo wants to add it later.

>> +	depends on LEGION_GAMEZONE_WMI
>> +	depends on LEGION_DATA_01_WMI
>> +	select FW_ATTR_CLASS
>> +	help
>> +	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
>> +	  firmware_attributes API to control various tunable settings typically exposed by
>> +	  Lenovo software in Windows.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called lenovo_legion_wmi_other.
>> +
>>   config IDEAPAD_LAPTOP
>>   	tristate "Lenovo IdeaPad Laptop Extras"
>>   	depends on ACPI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index e1b142947067..838ee568c3f9 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -59,15 +59,18 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
>>   obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>>   
>>   # IBM Thinkpad and Lenovo
>> -obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>> -obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
>> -obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
>> -obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>> -obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>> -obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>> -obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>> -obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>> -obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>> +obj-$(CONFIG_IBM_RTL)			+= ibm_rtl.o
>> +obj-$(CONFIG_IDEAPAD_LAPTOP)		+= ideapad-laptop.o
>> +obj-$(CONFIG_LENOVO_YMC)		+= lenovo-ymc.o
>> +obj-$(CONFIG_SENSORS_HDAPS)		+= hdaps.o
>> +obj-$(CONFIG_THINKPAD_ACPI)		+= thinkpad_acpi.o
>> +obj-$(CONFIG_THINKPAD_LMI)		+= think-lmi.o
>> +obj-$(CONFIG_YOGABOOK)			+= lenovo-yogabook.o
>> +obj-$(CONFIG_YT2_1380)			+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>> +obj-$(CONFIG_LENOVO_WMI_CAMERA)		+= lenovo-wmi-camera.o
>> +obj-$(CONFIG_LEGION_GAMEZONE_WMI)	+= lenovo-legion-wmi-gamezone.o
>> +obj-$(CONFIG_LEGION_DATA_01_WMI)	+= lenovo-legion-wmi-capdata01.o
>> +obj-$(CONFIG_LEGION_OTHER_WMI)		+= lenovo-legion-wmi-other.o
>
>Don't change the whitespace of everything else; especially not in one 
>patch.  If the whitespace is wrong, do a patch that fixes it and then 
>another patch that introduces a driver.

Only done because the length of the new entries messes up the whitespace of the
rest of the block. I can do as two patches if needed, but the whitespace would
need to be after as it is fine without them.

>>   
>>   # Intel
>>   obj-y				+= intel/
>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-capdata01.c b/drivers/platform/x86/lenovo-legion-wmi-capdata01.c
>> new file mode 100644
>> index 000000000000..99f4f35b7176
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-legion-wmi-capdata01.c
>> @@ -0,0 +1,103 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface provides
>> + * information on tunable attributes used by the "Other Method" WMI interface,
>> + * including if it is supported by the hardware, the default_value, max_value,
>> + * min_value, and step increment.
>> + *
>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>> + *
>
>I don't think you need a newline at the end here.

Acked for fix all newline comments. Thanks.

>> + */
>> +
>> +#include "lenovo-legion-wmi.h"
>> +
>> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
>> +
>> +static const struct wmi_device_id capdata_01_wmi_id_table[] = {
>> +	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>> +	{}
>> +};
>> +
>> +static struct capdata_wmi cd01_wmi = {
>> +	.mutex = __MUTEX_INITIALIZER(cd01_wmi.mutex)
>> +};
>> +
>> +int capdata_01_wmi_get(struct om_attribute_id attr_id,
>> +		       struct capability_data_01 *cap_data)
>> +{
>> +	union acpi_object *ret_obj;
>> +	int count;
>> +	int instance_id;
>> +	u32 attribute_id = *(int *)&attr_id;
>
>Can please do reverse xmas tree.
>

Acked for fix all ordering comments. Thanks.

>> +
>> +	mutex_lock(&cd01_wmi.mutex);
>> +	count = wmidev_instance_count(drvdata.cd01_wmi->wdev);
>> +	mutex_unlock(&cd01_wmi.mutex);
>
>For new mutex use I'd suggest using guard(mutex) instead so you can have 
>less lock/unlock/cleanup cases to worry about.
>

Good idea, I wasn't aware of this. Will fix up for v2.

>> +	for (instance_id = 0; instance_id < count; instance_id++) {
>> +		mutex_lock(&cd01_wmi.mutex);
>> +		ret_obj =
>> +			wmidev_block_query(drvdata.cd01_wmi->wdev, instance_id);
>> +		mutex_unlock(&cd01_wmi.mutex);
>> +		if (!ret_obj) {
>> +			pr_err("lenovo_legion_wmi_capdata_01: block query failed\n");
>
>With all the error messages you should use #define pr_fmt() at the top 
>of the file and then you don't need to do prefixes at all like this.
>

Same as above, thanks.

>> +			continue;
>> +		}
>> +
>> +		if (ret_obj->type != ACPI_TYPE_BUFFER) {
>> +			pr_err("lenovo_legion_wmi_capdata_01: block query returned type: %u\n",
>> +			       ret_obj->type);
>> +			kfree(ret_obj);
>> +			continue;
>> +		}
>> +
>> +		if (ret_obj->buffer.length != sizeof(*cap_data)) {
>> +			pr_err("lenovo_legion_wmi_capdata_01: bad buffer length, %d\n",
>> +			       ret_obj->buffer.length);
>> +			kfree(ret_obj);
>> +			continue;
>> +		}
>> +
>> +		memcpy(cap_data, ret_obj->buffer.pointer,
>> +		       ret_obj->buffer.length);
>> +		kfree(ret_obj);
>> +
>> +		if (cap_data->id != attribute_id)
>> +			continue;
>> +		break;
>> +	}
>> +	if (cap_data->id == 0) {
>> +		pr_err("lenovo_legion_wmi_capdata_01: Failed to get capability data.\n");
>> +		return -EINVAL;
>> +	}
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(capdata_01_wmi_get, "CAPDATA_WMI");
>> +
>> +/* Driver Setup */
>> +static int capdata_01_wmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	cd01_wmi.wdev = wdev;
>> +	drvdata.cd01_wmi = &cd01_wmi;
>> +	pr_info("lenovo_legion_wmi_capdata_01: Added Lenovo Capability Data 01 WMI interface.\n");
>> +
>
>Pretty noisy; no?  I think you probably should lose this message.
>

Acked for fix all pr_info comments.

>> +	return 0;
>> +}
>> +
>> +static void capdata_01_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	pr_info("lenovo_legion_wmi_capdata_01: Removed Lenovo Capability Data 01 WMI interface.\n");
>
>Pretty noisy; no?  I think you probably should lose this message.
>
>> +}
>> +
>> +static struct wmi_driver capdata_01_wmi_driver = {
>> +	.driver = { .name = "capdata_01_wmi" },
>> +	.id_table = capdata_01_wmi_id_table,
>> +	.probe = capdata_01_wmi_probe,
>> +	.remove = capdata_01_wmi_remove,
>> +};
>> +
>> +module_wmi_driver(capdata_01_wmi_driver);
>> +
>> +MODULE_DEVICE_TABLE(wmi, capdata_01_wmi_id_table);
>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-gamezone.c b/drivers/platform/x86/lenovo-legion-wmi-gamezone.c
>> new file mode 100644
>> index 000000000000..2f976dc0e367
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-legion-wmi-gamezone.c
>> @@ -0,0 +1,233 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface provides
>> + * platform profile and fan curve settings for devices that fall under the
>> + * "Gaming Series" of Lenovo Legion devices.
>> + *
>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>> + *
>Drop newline here
>> + */
>> +
>> +#include "lenovo-legion-wmi.h"
>> +
>> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>> +
>> +/* Method IDs */
>> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
>> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
>> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
>> +
>> +static const struct wmi_device_id gamezone_wmi_id_table[] = {
>> +	{ LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
>> +	{}
>> +};
>> +
>> +static struct gamezone_wmi gz_wmi = {
>> +	.mutex = __MUTEX_INITIALIZER(gz_wmi.mutex)
>> +};
>> +
>> +/* Platform Profile Methods */
>> +static int
>> +gamezone_wmi_platform_profile_supported(struct platform_profile_handler *pprof,
>> +					int *supported)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&gz_wmi.mutex);
>
>I'd use guard(mutex) instead.  By doing that your function becomes a lot 
>simpler too.
>
>guard(mutex)(&gz_wmi.mutex);
>
>return lenovo_legion_evaluate_method_1();
>
>> +	ret = lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x0,
>> +					      WMI_METHOD_ID_SMARTFAN_SUPP, 0,
>> +					      supported);
>> +	mutex_unlock(&gz_wmi.mutex);
>> +	return ret;
>> +}
>> +
>> +int gamezone_wmi_fan_profile_get(struct platform_profile_handler *pprof,
>> +				 int *sel_prof)
>> +{
>> +	int ret;
>> +	int supported;
>> +
>> +	gamezone_wmi_platform_profile_supported(&drvdata.gz_wmi->pprof,
>> +						&supported);
>> +	if (!supported) {
>> +		pr_err("lenovo_legion_wmi_gamezone: Platform profiles are not supported by this device.\n");
>
>Is this error flow real?  I sort of expect that you can avoid 
>registering if not supporting it.
>

This method is an exported symbol in GZ_WMI. I'm not aware of any hardware
without the GameZone interface that does implement the Other Method interface,
but if it does exist I was concerned about calling on an interface that isn't
registered. Perhaps a null pointer check on gz_wmi or gz_wmi.pprof->supported
check in the other method calls to this would be better? I didn't want to rely
on pprof exising for the check. I do now realize that this would call on a WMI
interface that doesn't exist if it was the case this hardware exists.

>> +		return -EOPNOTSUPP;
>> +	}
>> +	mutex_lock(&gz_wmi.mutex);
>
>guard(mutex) here too.
>
>> +	ret = lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x0,
>> +					      WMI_METHOD_ID_SMARTFAN_GET, 0,
>> +					      sel_prof);
>> +	mutex_unlock(&gz_wmi.mutex);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(gamezone_wmi_fan_profile_get, "GZ_WMI");
>> +
>> +static int
>> +gamezone_wmi_platform_profile_get(struct platform_profile_handler *pprof,
>> +				  enum platform_profile_option *profile)
>> +{
>> +	int sel_prof;
>> +	int err;
>> +
>> +	err = gamezone_wmi_fan_profile_get(pprof, &sel_prof);
>> +	if (err)
>> +		return err;
>> +
>> +	switch (sel_prof) {
>> +	case SMARTFAN_MODE_QUIET:
>> +		*profile = PLATFORM_PROFILE_QUIET;
>> +		break;
>> +	case SMARTFAN_MODE_BALANCED:
>> +		*profile = PLATFORM_PROFILE_BALANCED;
>> +		break;
>> +	case SMARTFAN_MODE_PERFORMANCE:
>> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
>> +		break;
>> +	case SMARTFAN_MODE_CUSTOM:
>> +		*profile = PLATFORM_PROFILE_CUSTOM;
>> +		break;
>> +
>Spurious newline.
>
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	drvdata.gz_wmi->current_profile = *profile;
>> +
>> +	return 0;
>> +}
>> +
>> +int gamezone_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>> +				      enum platform_profile_option profile)
>> +{
>> +	int ret;
>> +	int sel_prof;
>> +	int supported;
>> +
>> +	gamezone_wmi_platform_profile_supported(&drvdata.gz_wmi->pprof,
>> +						&supported);
>> +	if (!supported) {
>> +		pr_err("lenovo_legion_wmi_gamezone: Platform profiles are not supported by this device.\n");
>> +		return -EOPNOTSUPP;
>> +	}
>
>Same question; is this a real error flow?
>

Also an exported symbol in GZ_WMI. Will find another way to do these checks in
Other Method.

>> +
>> +	switch (profile) {
>> +	case PLATFORM_PROFILE_QUIET:
>> +		sel_prof = SMARTFAN_MODE_QUIET;
>> +		break;
>> +	case PLATFORM_PROFILE_BALANCED:
>> +		sel_prof = SMARTFAN_MODE_BALANCED;
>> +		break;
>> +	case PLATFORM_PROFILE_PERFORMANCE:
>> +		sel_prof = SMARTFAN_MODE_PERFORMANCE;
>> +		break;
>> +	case PLATFORM_PROFILE_CUSTOM:
>> +		sel_prof = SMARTFAN_MODE_CUSTOM;
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	mutex_lock(&gz_wmi.mutex);
>guard(mutex) here.
>> +	ret = lenovo_legion_evaluate_method_1(drvdata.gz_wmi->wdev, 0x0,
>> +					      WMI_METHOD_ID_SMARTFAN_SET,
>> +					      sel_prof, NULL);
>> +	mutex_unlock(&gz_wmi.mutex);
>> +
>> +	if (ret) {
>> +		pr_err("lenovo_legion_wmi_gamezone: Failed to set platform profile.\n");
>> +		return ret;
>> +	}
>> +
>> +	drvdata.gz_wmi->current_profile = profile;
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(gamezone_wmi_platform_profile_set, "GZ_WMI");
>> +
>> +/* Driver Setup */
>> +static int platform_profile_setup(struct gamezone_wmi *gz_wmi)
>> +{
>> +	int err;
>> +	int supported;
>> +
>> +	gamezone_wmi_platform_profile_supported(&gz_wmi->pprof, &supported);
>> +
>> +	gz_wmi->platform_profile_support = supported;
>> +
>> +	if (!supported) {
>> +		pr_warn("lenovo_legion_wmi_gamezone: Platform profiles are not supported by this device.\n");
>> +		return -EOPNOTSUPP;
>> +	}
>
>Yeah because of this you don't need that other flow I was mentioning above.
>
>IMO I don't think the pr_warn() is really needed, you'll only really 
>have one way that you exit -EOPNOTSUPP.
>

Will remove warn, thanks.

>> +
>> +	gz_wmi->pprof.profile_get = gamezone_wmi_platform_profile_get;
>> +	gz_wmi->pprof.profile_set = gamezone_wmi_platform_profile_set;
>> +
>> +	set_bit(PLATFORM_PROFILE_QUIET, gz_wmi->pprof.choices);
>> +	set_bit(PLATFORM_PROFILE_BALANCED, gz_wmi->pprof.choices);
>> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, gz_wmi->pprof.choices);
>> +	set_bit(PLATFORM_PROFILE_CUSTOM, gz_wmi->pprof.choices);
>> +
>> +	err = gamezone_wmi_platform_profile_get(&gz_wmi->pprof,
>> +						&gz_wmi->current_profile);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_gamezone: Failed to get current platform profile: %d\n",
>> +		       err);
>
>Drop prefix on the error and use pr_fmt().
>
>> +		return err;
>> +	}
>> +
>> +	err = platform_profile_register(&gz_wmi->pprof);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_gamezone: Failed to register platform profile support: %d\n",
>> +		       err);
>
>Drop prefix on the error and use pr_fmt().
>
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int gamezone_wmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	int err;
>> +
>> +	gz_wmi.wdev = wdev;
>> +	drvdata.gz_wmi = &gz_wmi;
>> +
>> +	err = platform_profile_setup(&gz_wmi);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_gamezone: Failed to add platform profile: %d\n",
>> +		       err);
>> +		kfree(&gz_wmi);
>
>Is this free correct?  It's a global isn't it?  I don't think you should 
>be freeing here.
>

I'll just return the error.

>> +		return err;
>> +	}
>> +
>> +	pr_info("lenovo_legion_wmi_gamezone: Added platform profile support.\n");
>
>Too noisy.
>
>> +	return 0;
>> +}
>> +
>> +static void gamezone_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	int err;
>> +
>> +	mutex_lock(&gz_wmi.mutex);
>> +	err = platform_profile_remove(&drvdata.gz_wmi->pprof);
>> +	mutex_unlock(&gz_wmi.mutex);
>> +
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_gamezone: Failed to remove platform profile: %d\n",
>> +		       err);
>> +	} else {
>> +		pr_info("lenovo_legion_wmi_gamezone: Removed platform profile support.\n");
>> +	}
>
>Considering that platform_profile_remove() doesn't really have a failure 
>path (it always returns 0). I'd just lose both of these messages and 
>make this simple.
>
>guard(mutex)();
>platform_profile_remove();
>

Acked for fix.

>> +}
>> +
>> +static struct wmi_driver gamezone_wmi_driver = {
>> +	.driver = { .name = "gamezone_wmi" },
>> +	.id_table = gamezone_wmi_id_table,
>> +	.probe = gamezone_wmi_probe,
>> +	.remove = gamezone_wmi_remove,
>> +};
>> +
>> +module_wmi_driver(gamezone_wmi_driver);
>> +
>> +MODULE_DEVICE_TABLE(wmi, gamezone_wmi_id_table);
>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/lenovo-legion-wmi-other.c b/drivers/platform/x86/lenovo-legion-wmi-other.c
>> new file mode 100644
>> index 000000000000..c09c1848eda7
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-legion-wmi-other.c
>> @@ -0,0 +1,377 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Lenovo Legion Other Method driver. This driver uses the fw_attributes
>> + * class to expose the various WMI functions provided by the "Other Method" WMI
>> + * interface. This enables CPU and GPU power limit as well as various other
>> + * attributes for devices that fall under the "Gaming Series" of Lenovo Legion
>> + * devices. Each attribute exposed by the "Other Method"" interface has a
>> + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the driver to
>> + * probe details about the attribute such as set/get support, step, min, max,
>> + * and default value. Each attibute has multiple pages, one for each of the
>> + * fan profiles managed by the GameZone interface, so it must be probed prior
>> + * to returning the current_value.
>> + *
>> + * These attributes typically don't fit anywhere else in the sysfs and are set
>> + * in Windows using one of Lenovo's multiple user applications.
>> + *
>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>> + *
>Remove the new line here.
>> + */
>> +
>> +#include "lenovo-legion-wmi.h"
>> +#include "firmware_attributes_class.h"
>> +
>> +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>> +
>> +/* Device IDs */
>> +#define WMI_DEVICE_ID_CPU 0x01
>> +
>> +/* WMI_DEVICE_ID_CPU feature IDs */
>> +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
>> +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
>> +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
>> +
>> +/* Method IDs */
>> +#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
>> +#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
>> +
>> +static const struct wmi_device_id other_method_wmi_id_table[] = {
>> +	{ LENOVO_OTHER_METHOD_GUID, NULL },
>> +	{}
>> +};
>> +
>> +/* Tunable Attributes */
>> +struct ll_tunables {
>> +	u32 ppt_pl1_spl;
>> +	u32 ppt_pl2_sppt;
>> +	u32 ppt_pl3_fppt;
>> +};
>> +
>> +static const struct class *fw_attr_class;
>> +
>> +static struct other_method_wmi om_wmi = {
>> +	.mutex = __MUTEX_INITIALIZER(om_wmi.mutex)
>> +};
>> +
>> +struct capdata_01_attr_group {
>> +	const struct attribute_group *attr_group;
>> +};
>> +
>> +/* Simple attribute creation */
>> +
>> +/*
>> + * att_current_value_store() - Set the current value of the given attribute
>> + * @kobj: Pointer to the driver object.
>> + * @kobj_attribute: Pointer to the attribute calling this function.
>> + * @buf: The buffer to read from, this is parsed to `int` type.
>> + * @count: Required by sysfs attribute macros, pass in from the callee attr.
>> + * @store_value: Pointer to where the parsed value should be stored.
>> + * @device_id: The WMI function Device ID to use.
>> + * @feature_id: The WMI function Feature ID to use.
>> + *
>> + * This function is intended to be generic so it can be called from any
>> + * attribute's "current_value_store" which works only with integers. The
>> + * integer to be sent to the WMI method is range checked and an error returned
>> + * if out of range.
>> + *
>> + * If the value is valid and WMI is success, then the sysfs attribute is
>> + * notified.
>> + *
>> + * Returns: Either count, or an error.
>> + */
>> +ssize_t attr_current_value_store(struct kobject *kobj,
>> +				 struct kobj_attribute *attr, const char *buf,
>> +				 size_t count, u32 *store_value, u8 device_id,
>> +				 u8 feature_id)
>> +{
>> +	struct capability_data_01 cap_data;
>> +	enum platform_profile_option cust_prof;
>> +	int err;
>> +	int sel_prof;
>> +	u32 value;
>> +	struct wmi_device *wdev = drvdata.om_wmi->wdev;
>> +
>> +	err = gamezone_wmi_fan_profile_get(&drvdata.gz_wmi->pprof, &sel_prof);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Error getting gamezone fan profile.\n");
>
>Use pr_fmt() for teh file instead of prefix here.
>
>> +		return -EIO;
>> +	}
>> +
>> +	/* Switch to custom profile if not currently on it. */
>> +	if (sel_prof != SMARTFAN_MODE_CUSTOM) {
>> +		pr_warn("lenovo_legion_wmi_other: Device must be in CUSTOM profile to set tunables.");
>
>As you do this "for" them, I'd lose the warning.
>

Acked for fix. Leftover from an earlier version that didn't set the profile.

>> +		cust_prof = PLATFORM_PROFILE_CUSTOM;
>> +		sel_prof = SMARTFAN_MODE_CUSTOM;
>> +		err = gamezone_wmi_platform_profile_set(&drvdata.gz_wmi->pprof,
>> +							cust_prof);
>> +		if (err) {
>> +			pr_err("lenovo_legion_wmi_other: Error setting gamezone fan profile.\n");
>> +			return -EIO;
>> +		}
>> +	}
>> +
>> +	err = kstrtouint(buf, 10, &value);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Error converting value to int.\n");
>> +		return -EIO;
>> +	}
>> +
>> +	/* Construct the attribute id */
>> +	struct om_attribute_id attr_id = { sel_prof << 8, feature_id,
>> +					   device_id };
>> +
>> +	/* Get min/max from LENOVO_CAPABILITY_DATA_01 */
>> +	err = capdata_01_wmi_get(attr_id, &cap_data);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Failed to get capability data.\n");
>> +		return -EIO;
>> +	}
>> +	if (cap_data.capability < 1) {
>> +		pr_err("lenovo_legion_wmi_other: Capability not supported.\n");
>> +		return -EPERM;
>> +	}
>> +
>> +	if (value < cap_data.min_value || value > cap_data.max_value) {
>> +		pr_warn("lenovo_legion_wmi_other: Value %d is not between %d and %d.\n",
>> +			value, cap_data.min_value, cap_data.max_value);
>> +		return -EINVAL;
>> +	}
>> +
>> +	mutex_lock(&om_wmi.mutex);
>> +	err = lenovo_legion_evaluate_method_2(wdev, 0x0,
>> +					      WMI_METHOD_ID_VALUE_SET,
>> +					      *(int *)&attr_id, value, NULL);
>> +	mutex_unlock(&om_wmi.mutex);
>> +
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Error setting attribute");
>> +		return err;
>> +	}
>> +
>> +	if (store_value)
>> +		*store_value = value;
>> +
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +	return count;
>> +}
>> +
>> +/*
>> + * attr_current_value_show() - Get the current value of the given attribute
>> + * @kobj: Pointer to the driver object.
>> + * @kobj_attribute: Pointer to the attribute calling this function.
>> + * @buf: The buffer to write to.
>> + * @retval: Pointer to returned data.
>> + * @device_id: The WMI function Device ID to use.
>> + * @feature_id: The WMI function Feature ID to use.
>> + *
>> + * This function is intended to be generic so it can be called from any "_show"
>> + * attribute which works only with integers.
>> + *
>> + * If the WMI is success, then the sysfs attribute is notified.
>> + *
>> + * Returns: Either count, or an error.
>> + */
>> +ssize_t attr_current_value_show(struct kobject *kobj,
>> +				struct kobj_attribute *attr, char *buf,
>> +				u8 device_id, u8 feature_id)
>> +{
>> +	int sel_prof; /* Current fan profile mode */
>> +	int err;
>> +	int retval;
>> +	struct wmi_device *wdev = drvdata.om_wmi->wdev;
>> +
>> +	err = gamezone_wmi_fan_profile_get(&drvdata.gz_wmi->pprof, &sel_prof);
>> +
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Error getting gamezone fan profile.\n");
>> +		return err;
>> +	}
>> +
>> +	// Construct the WMI attribute id from the given args.
>> +	struct om_attribute_id attribute_id = { sel_prof << 8, feature_id,
>> +						device_id };
>> +
>> +	mutex_lock(&om_wmi.mutex);
>> +	err = lenovo_legion_evaluate_method_1(wdev, 0x0,
>> +					      WMI_METHOD_ID_VALUE_GET,
>> +					      *(int *)&attribute_id, &retval);
>> +	mutex_unlock(&om_wmi.mutex);
>> +
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Error getting attribute");
>> +		return err;
>> +	}
>> +
>> +	return sysfs_emit(buf, "%u\n", retval);
>> +}
>> +
>> +/**
>> + * attr_capdata_01_show() - Get the value of the specified attribute property
>> + * from LENOVO_CAPABILITY_DATA_01.
>> + * @kobj: Pointer to the driver object.
>> + * @kobj_attribute: Pointer to the attribute calling this function.
>> + * @buf: The buffer to write to.
>> + * @retval: Pointer to returned data.
>> + * @device_id: The WMI functions Device ID to use.
>> + * @feature_id: The WMI functions Feature ID to use.
>> + * @prop: The property of this attribute to be read.
>> + *
>> + * This function is intended to be generic so it can be called from any "_show"
>> + * attribute which works only with integers.
>> + *
>> + * If the WMI is success, then the sysfs attribute is notified.
>> + *
>> + * Returns: Either count, or an error.
>> + */
>> +ssize_t attr_capdata_01_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			     char *buf, u8 device_id, u8 feature_id,
>> +			     enum attribute_property prop)
>> +{
>> +	struct capability_data_01 cap_data;
>> +	int err;
>> +	int retval;
>> +	int sel_prof = SMARTFAN_MODE_CUSTOM; /* Only show CUSTOM mode values */
>> +
>> +	// Construct the WMI attribute id from the given args.
>> +	struct om_attribute_id attribute_id = { sel_prof << 8, feature_id,
>> +						device_id };
>> +
>> +	err = capdata_01_wmi_get(attribute_id, &cap_data);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Failed to get capability data.\n");
>> +		return -EIO;
>> +	}
>> +
>> +	switch (prop) {
>> +	case DEFAULT_VAL:
>> +		retval = cap_data.default_value;
>> +		break;
>> +	case MAX_VAL:
>> +		retval = cap_data.max_value;
>> +		break;
>> +	case MIN_VAL:
>> +		retval = cap_data.min_value;
>> +		break;
>> +	case STEP_VAL:
>> +		retval = cap_data.step;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	return sysfs_emit(buf, "%u\n", retval);
>> +}
>> +
>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl", WMI_DEVICE_ID_CPU,
>> +			    WMI_FEATURE_ID_CPU_SPL,
>> +			    "Set the CPU sustained power limit");
>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt", WMI_DEVICE_ID_CPU,
>> +			    WMI_FEATURE_ID_CPU_SPPT,
>> +			    "Set the CPU slow package power tracking limit");
>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt", WMI_DEVICE_ID_CPU,
>> +			    WMI_FEATURE_ID_CPU_FPPT,
>> +			    "Set the CPU fast package power tracking limit");
>> +
>> +static const struct capdata_01_attr_group capdata_01_attr_groups[] = {
>> +	{ &ppt_pl1_spl_attr_group },
>> +	{ &ppt_pl2_sppt_attr_group },
>> +	{ &ppt_pl3_fppt_attr_group },
>> +	{},
>> +};
>> +
>> +static int other_method_fw_attr_add(void)
>> +{
>> +	int err, i;
>> +
>> +	err = fw_attributes_class_get(&fw_attr_class);
>> +	if (err) {
>> +		pr_err("lenovo_legion_wmi_other: Failed to get firmware_attributes_class.\n");
>> +		return err;
>> +	}
>> +
>> +	om_wmi.fw_attr_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
>> +					   NULL, "%s", DRIVER_NAME);
>> +	if (IS_ERR(om_wmi.fw_attr_dev)) {
>> +		pr_err("lenovo_legion_wmi_other: Failed to create firmware_attributes_class device.\n");
>> +		err = PTR_ERR(om_wmi.fw_attr_dev);
>> +		goto fail_class_get;
>> +	}
>> +
>> +	om_wmi.fw_attr_kset = kset_create_and_add("attributes", NULL,
>> +						  &om_wmi.fw_attr_dev->kobj);
>> +	if (!om_wmi.fw_attr_kset) {
>> +		pr_err("lenovo_legion_wmi_other: Failed to create firmware_attributes_class kset.\n");
>> +		err = -ENOMEM;
>> +		goto err_destroy_classdev;
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(capdata_01_attr_groups) - 1; i++) {
>> +		err = sysfs_create_group(&om_wmi.fw_attr_kset->kobj,
>> +					 capdata_01_attr_groups[i].attr_group);
>> +		if (err) {
>> +			pr_err("lenovo_legion_wmi_other: Failed to create sysfs-group for %s\n",
>> +			       capdata_01_attr_groups[i].attr_group->name);
>> +			goto err_remove_groups;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_remove_groups:
>> +	while (--i >= 0) {
>> +		sysfs_remove_group(&om_wmi.fw_attr_kset->kobj,
>> +				   capdata_01_attr_groups[i].attr_group);
>> +	}
>> +err_destroy_classdev:
>> +	device_destroy(fw_attr_class, MKDEV(0, 0));
>> +fail_class_get:
>> +	fw_attributes_class_put();
>> +	return err;
>> +}
>> +
>> +/* Driver Setup */
>> +static int other_method_wmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	int err;
>> +
>> +	om_wmi.wdev = wdev;
>> +	drvdata.om_wmi = &om_wmi;
>> +	om_wmi.ll_tunables = kzalloc(sizeof(*om_wmi.ll_tunables), GFP_KERNEL);
>> +	if (!om_wmi.ll_tunables)
>> +		return -ENOMEM;
>> +
>> +	err = other_method_fw_attr_add();
>> +	if (err)
>> +		return err;
>> +	pr_info("lenovo_legion_wmi_other: Firmware attributes added.\n");
>
>too noisy
>
>> +
>> +	return 0;
>> +}
>> +
>> +static void other_method_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	mutex_lock(&om_wmi.mutex);
>> +
>> +	kset_unregister(om_wmi.fw_attr_kset);
>> +	device_destroy(fw_attr_class, MKDEV(0, 0));
>> +	fw_attributes_class_put();
>> +
>> +	mutex_unlock(&om_wmi.mutex);
>> +
>> +	pr_info("lenovo_legion_wmi_other: Firmware attributes removed.\n");
>too noisy.
>
>> +}
>> +
>> +static struct wmi_driver other_method_wmi_driver = {
>> +	.driver = { .name = "other_method_wmi" },
>> +	.id_table = other_method_wmi_id_table,
>> +	.probe = other_method_wmi_probe,
>> +	.remove = other_method_wmi_remove,
>> +};
>> +
>> +module_wmi_driver(other_method_wmi_driver);
>> +
>> +MODULE_IMPORT_NS("GZ_WMI");
>> +MODULE_IMPORT_NS("CAPDATA_WMI");
>> +MODULE_DEVICE_TABLE(wmi, other_method_wmi_id_table);
>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>> +MODULE_DESCRIPTION("Lenovo Legion Other Method Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/lenovo-legion-wmi.h b/drivers/platform/x86/lenovo-legion-wmi.h
>> new file mode 100644
>> index 000000000000..65baa728f29e
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-legion-wmi.h
>> @@ -0,0 +1,271 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later
>> + *
>> + * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interface is
>> + * broken up into multiple GUID interfaces that require cross-references
>> + * between GUID's for some functionality. The "Custom Mode" interface is a
>> + * legacy interface for managing and displaying CPU & GPU power and hwmon
>> + * settings and readings. The "Other Mode" interface is a modern interface
>> + * that replaces or extends the "Custom Mode" interface methods. The "GameZone"
>> + * interface adds advanced features such as fan profiles and overclocking.
>> + * The "Lighting" interface adds control of various status lights related to
>> + * different hardware components. "Custom Mode" uses LENOVO_CAPABILITY_DATA_00
>> + * struct for capability information, "Other Mode" uses
>> + * LENOVO_CAPABILITY_DATA_01 struct for capability information, and "Lighting"
>> + * uses LENOVO_CAPABILITY_DATA_02 struct for capability information.
>> + *
>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>> + *
>Lose the newline
>
>> + */
>> +
>> +#ifndef _LENOVO_LEGION_WMI_H_
>> +#define _LENOVO_LEGION_WMI_H_
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/platform_profile.h>
>> +#include <linux/types.h>
>> +#include <linux/wmi.h>
>> +
>> +#define DRIVER_NAME "lenovo-legion-wmi"
>
>This is only used in one of the drivers, I'd move it there to make it 
>clearer.
>

Acked for fix. 

>> +
>> +/* Platform Profile Modes */
>> +#define SMARTFAN_MODE_QUIET 0x01
>> +#define SMARTFAN_MODE_BALANCED 0x02
>> +#define SMARTFAN_MODE_PERFORMANCE 0x03
>> +#define SMARTFAN_MODE_CUSTOM 0xFF
>> +
>> +struct gamezone_wmi {
>> +	struct wmi_device *wdev;
>> +	enum platform_profile_option current_profile;
>> +	struct platform_profile_handler pprof;
>> +	bool platform_profile_support;
>> +	struct mutex mutex; /* Ensure single operation on WMI device */
>> +};
>> +
>> +struct other_method_wmi {
>> +	struct wmi_device *wdev;
>> +	struct device *fw_attr_dev;
>> +	struct kset *fw_attr_kset;
>> +	struct ll_tunables *ll_tunables;
>> +	struct mutex mutex; /* Ensure single operation on WMI device */
>> +};
>> +
>> +struct capdata_wmi {
>> +	struct wmi_device *wdev;
>> +	struct mutex mutex; /* Ensure single operation on WMI device */
>> +};
>> +
>> +struct ll_drvdata {
>> +	struct other_method_wmi *om_wmi; /* Other method GUID device */
>> +	struct gamezone_wmi *gz_wmi; /* Gamezone GUID device */
>> +	struct capdata_wmi *cd01_wmi; /* Capability Data 01 GUID device */
>> +} drvdata;
>> +
>> +struct wmi_method_args {
>> +	u32 arg0;
>> +	u32 arg1;
>> +};
>> +
>> +struct om_attribute_id {
>> +	u32 mode_id : 16; /* Fan profile */
>> +	u32 feature_id : 8; /* Attribute (SPL/SPPT/...) */
>> +	u32 device_id : 8; /* CPU/GPU */
>> +} __packed;
>> +
>> +enum attribute_property {
>> +	DEFAULT_VAL = 0,
>> +	MAX_VAL,
>> +	MIN_VAL,
>> +	STEP_VAL,
>> +	SUPPORTED,
>> +};
>> +
>> +struct capability_data_01 {
>> +	u32 id;
>> +	u32 capability;
>> +	u32 default_value;
>> +	u32 step;
>> +	u32 min_value;
>> +	u32 max_value;
>> +};
>> +
>> +static int lenovo_legion_evaluate_method(struct wmi_device *wdev, u8 instance,
>> +					 u32 method_id, struct acpi_buffer *in,
>> +					 struct acpi_buffer *out)
>> +{
>> +	acpi_status status;
>> +
>> +	status = wmidev_evaluate_method(wdev, instance, method_id, in, out);
>> +
>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("lenovo_legion_wmi: wmidev_evaluate_method failed for method_id %u instance %u.\n",
>> +		       method_id, instance);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int lenovo_legion_evaluate_method_2(struct wmi_device *wdev, u8 instance,
>> +				    u32 method_id, u32 arg0, u32 arg1,
>> +				    u32 *retval);
>> +
>> +int lenovo_legion_evaluate_method_2(struct wmi_device *wdev, u8 instance,
>> +				    u32 method_id, u32 arg0, u32 arg1,
>> +				    u32 *retval)
>> +{
>> +	int ret;
>> +	u32 temp_val;
>> +	struct wmi_method_args args = { arg0, arg1 };
>> +	struct acpi_buffer input = { (acpi_size)sizeof(args), &args };
>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	union acpi_object *ret_obj = NULL;
>
>Reverse xmas tree please.
>
>> +
>> +	ret = lenovo_legion_evaluate_method(wdev, instance, method_id, &input,
>> +					    &output);
>> +
>> +	if (ret) {
>> +		pr_err("lenovo_legion_wmi: Attempt to get method_id %u value failed with error: %u\n",
>> +		       method_id, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (retval) {
>> +		ret_obj = (union acpi_object *)output.pointer;
>> +		if (ret_obj && ret_obj->type == ACPI_TYPE_INTEGER)
>> +			temp_val = (u32)ret_obj->integer.value;
>
>This is a pretty bad failure if it's not the case, no?  Should you set a 
>return value here instead perhaps?
>
>> +
>> +		*retval = temp_val
>
>If that above error I mentioned happens then you'll be assigning garbage 
>data out.
>
>;

True, good catch. Someone built with clang+lto and it warned about this section
as well as temp val is not initialized. Will fix both.

>> +	}
>> +
>> +	kfree(ret_obj);
>> +
>> +	return 0;
>> +}
>> +
>> +int lenovo_legion_evaluate_method_1(struct wmi_device *wdev, u8 instance,
>> +				    u32 method_id, u32 arg0, u32 *retval);
>> +
>> +int lenovo_legion_evaluate_method_1(struct wmi_device *wdev, u8 instance,
>> +				    u32 method_id, u32 arg0, u32 *retval)
>> +{
>> +	return lenovo_legion_evaluate_method_2(wdev, instance, method_id, arg0,
>> +					       0, retval);
>> +}
>> +
>> +int capdata_01_wmi_get(struct om_attribute_id attr_id,
>> +		       struct capability_data_01 *cap_data);
>> +
>> +int gamezone_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>> +				      enum platform_profile_option sel_prof);
>> +
>> +int gamezone_wmi_fan_profile_get(struct platform_profile_handler *pprof,
>> +				 int *sel_prof);
>> +
>> +/* current_value */
>> +ssize_t attr_current_value_store(struct kobject *kobj,
>> +				 struct kobj_attribute *attr, const char *buf,
>> +				 size_t count, u32 *store_value, u8 device_id,
>> +				 u8 feature_id);
>> +
>> +ssize_t attr_current_value_show(struct kobject *kobj,
>> +				struct kobj_attribute *attr, char *buf,
>> +				u8 device_id, u8 feature_id);
>> +
>> +/* LENOVO_CAPABILITY_DATA_01 */
>> +ssize_t attr_capdata_01_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			     char *buf, u8 device_id, u8 feature_id,
>> +			     enum attribute_property prop);
>> +
>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +		      char *buf);
>> +
>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +		      char *buf)
>> +{
>> +	return sysfs_emit(buf, "integer\n");
>> +}
>> +
>> +#define __LL_ATTR_RO(_func, _name)                                    \
>> +	{                                                             \
>> +		.attr = { .name = __stringify(_name), .mode = 0444 }, \
>> +		.show = _func##_##_name##_show,                       \
>> +	}
>> +
>> +#define __LL_ATTR_RO_AS(_name, _show)                                 \
>> +	{                                                             \
>> +		.attr = { .name = __stringify(_name), .mode = 0444 }, \
>> +		.show = _show,                                        \
>> +	}
>> +
>> +#define __LL_ATTR_RW(_func, _name) \
>> +	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
>> +
>> +/* Shows a formatted static variable */
>> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                         \
>> +	static ssize_t _attrname##_##_prop##_show(                            \
>> +		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
>> +	{                                                                     \
>> +		return sysfs_emit(buf, _fmt, _val);                           \
>> +	}                                                                     \
>> +	static struct kobj_attribute attr_##_attrname##_##_prop =             \
>> +		__LL_ATTR_RO(_attrname, _prop)
>> +
>> +/* Attribute current_value show/store */
>> +#define __LL_TUNABLE_RW_CAP01(_attrname, _dev_id, _feat_id)                   \
>> +	static ssize_t _attrname##_current_value_store(                       \
>> +		struct kobject *kobj, struct kobj_attribute *attr,            \
>> +		const char *buf, size_t count)                                \
>> +	{                                                                     \
>> +		return attr_current_value_store(                              \
>> +			kobj, attr, buf, count,                               \
>> +			&om_wmi.ll_tunables->_attrname, _dev_id, _feat_id);   \
>> +	}                                                                     \
>> +	static ssize_t _attrname##_current_value_show(                        \
>> +		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
>> +	{                                                                     \
>> +		return attr_current_value_show(kobj, attr, buf, _dev_id,      \
>> +					       _feat_id);                     \
>> +	}                                                                     \
>> +	static struct kobj_attribute attr_##_attrname##_current_value =       \
>> +		__LL_ATTR_RW(_attrname, current_value)
>> +
>> +/* Attribute property show only */
>> +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _dev_id, _feat_id, _prop_type) \
>> +	static ssize_t _attrname##_##_prop##_show(                             \
>> +		struct kobject *kobj, struct kobj_attribute *attr, char *buf)  \
>> +	{                                                                      \
>> +		return attr_capdata_01_show(kobj, attr, buf, _dev_id,          \
>> +					    _feat_id, _prop_type);             \
>> +	}                                                                      \
>> +	static struct kobj_attribute attr_##_attrname##_##_prop =              \
>> +		__LL_ATTR_RO(_attrname, _prop)
>> +
>> +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dev_id, _feat_id,    \
>> +				    _dispname)                                \
>> +	__LL_TUNABLE_RW_CAP01(_attrname, _dev_id, _feat_id);                  \
>> +	__LL_TUNABLE_RO_CAP01(default_value, _attrname, _dev_id, _feat_id,    \
>> +			      DEFAULT_VAL);                                   \
>> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);          \
>> +	__LL_TUNABLE_RO_CAP01(max_value, _attrname, _dev_id, _feat_id,        \
>> +			      MAX_VAL);                                       \
>> +	__LL_TUNABLE_RO_CAP01(min_value, _attrname, _dev_id, _feat_id,        \
>> +			      MIN_VAL);                                       \
>> +	__LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, _dev_id, _feat_id, \
>> +			      STEP_VAL);                                      \
>> +	static struct kobj_attribute attr_##_attrname##_type =                \
>> +		__LL_ATTR_RO_AS(type, int_type_show);                         \
>> +	static struct attribute *_attrname##_attrs[] = {                      \
>> +		&attr_##_attrname##_current_value.attr,                       \
>> +		&attr_##_attrname##_default_value.attr,                       \
>> +		&attr_##_attrname##_display_name.attr,                        \
>> +		&attr_##_attrname##_max_value.attr,                           \
>> +		&attr_##_attrname##_min_value.attr,                           \
>> +		&attr_##_attrname##_scalar_increment.attr,                    \
>> +		&attr_##_attrname##_type.attr,                                \
>> +		NULL,                                                         \
>> +	};                                                                    \
>> +	static const struct attribute_group _attrname##_attr_group = {        \
>> +		.name = _fsname, .attrs = _attrname##_attrs                   \
>> +	}
>> +
>> +#endif /* !_LENOVO_LEGION_WMI_H_ */


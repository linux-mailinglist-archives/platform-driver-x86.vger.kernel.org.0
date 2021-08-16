Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED993ECFED
	for <lists+platform-driver-x86@lfdr.de>; Mon, 16 Aug 2021 10:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhHPIFy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 16 Aug 2021 04:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbhHPIFs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 04:05:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4474DC0613C1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 01:05:16 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u16so5135328wrn.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iuo4P3aOYxmIblUk1PEMPyd6NT9m8+FMiJyH8cVATb8=;
        b=o/GJ+fQE0H57ygkbM+yW3lP8DFaw4BS/O/CyXCPlYBfUS74RfTXftG+KvROuHmoLzI
         t0XtbY9VdHhmrziiA07Fh/OXdKyXV0fcwMhkp7kt8RKsmfYareh1jpny23eiFSLgo8yV
         W6HNX9sN0qd7l5e2L1ikTYT+8KA4ODNUnYs4idiPI4bIhGBBWrJoFOYhGgbvvTWc9I+H
         B363DNa2pA8tTjjGDgBOC0i3vKbA829YpDJbvi3qkCf+mi7yUOpvvEJKavu0mIDp3ilT
         eBnX0D4B8irWjTp2+h7I4USd9RUbOpSlvtDrqQ2ULGlB9d9uNGa91Q3fewm3C5IDjwzz
         BDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iuo4P3aOYxmIblUk1PEMPyd6NT9m8+FMiJyH8cVATb8=;
        b=UXzsjGc6u2WbZtyDz3LtxUhleTmqPgZ8CX6lqVCP5uMpJH+QeR3EeXt9zMDAv48qZn
         xspPaS46PnAX/uXwYUSTn4OB+fvOByv1Ndl5ewjWBUjD5VEObVdQiKYuAtAK2Z3s8zr6
         mgBKhJ+17QkNaW23Z+8VED9B6GwjdzCD5SNCV90EAxevI5akkYuMfrNpRflk/Q0Wr5HZ
         H0yWWcw5wjesvjMWNEzy2y3H63Ul6Hib0Nw3gPwo4gHQVV0NfsKYbJtGxgGgR8XVM6So
         EoTA0YRSJRq6U6+6Ov7Cq0m0VQuvmDTk5JC2mygNC+/SWTrL3zK8Or1Ue6Nkom7651z9
         WIUw==
X-Gm-Message-State: AOAM531k8cCUsSE1AeVlAx203S3krrIRF2UMCbVFBBvaTfoJGEsY3+Ml
        LlhPPT/lJtwNtr5XqKGkH6b/VqxfdPLRTKSv
X-Google-Smtp-Source: ABdhPJx5gPb1V3hZSaF3VRhAPOMSGHWI8aqq0Dy3vuY8uWSNPv+rR6qygzrhEC6rvBOVHVNUjbaEjg==
X-Received: by 2002:adf:f64a:: with SMTP id x10mr16965816wrp.287.1629101114752;
        Mon, 16 Aug 2021 01:05:14 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e1b0:48c1:6199:9cb4? ([2a01:e34:ed2f:f020:e1b0:48c1:6199:9cb4])
        by smtp.googlemail.com with ESMTPSA id m6sm3061984wms.42.2021.08.16.01.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 01:05:14 -0700 (PDT)
Subject: Re: [PATCH] thermal/drivers/intel: Move intel_menlow to thermal
 drivers
To:     Hans de Goede <hdegoede@redhat.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        rui.zhang@intel.com, hpa@redhat.com, mgross@linux.intel.com,
        alex.hung@canonical.com, sujith.thomas@intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210816035356.1955982-1-srinivas.pandruvada@linux.intel.com>
 <4d1c20ab-6c81-8e9f-6d0f-180ecaa92812@redhat.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <144b2a35-bd24-2a88-c538-5c7c4a6c4fd1@linaro.org>
Date:   Mon, 16 Aug 2021 10:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4d1c20ab-6c81-8e9f-6d0f-180ecaa92812@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi Hans,

On 16/08/2021 09:55, Hans de Goede wrote:
> Hi,
> 
> On 8/16/21 5:53 AM, Srinivas Pandruvada wrote:
>> Moved drivers/platform/x86/intel_menlow.c to drivers/thermal/intel.
>>
>> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> 
> Thank you.
> 
> Rui, with this upcoming patch-series:
> 
> https://lore.kernel.org/platform-driver-x86/c6a90704-5080-d479-0022-58e5d106c026@infradead.org/T/#t
> 
> drivers/platform/x86/Kconfig + Makefile
> 
> Are going to see quite a bit of churn, is it ok if I merge this patch
> through the pdx86 tree to avoid conflicts with all those changes?
> 
> Rui, if this is ok, may I have your ack for this then ?

As co-maintainer:

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>



>> ---
>>  MAINTAINERS                                            |  4 ++--
>>  drivers/platform/x86/Kconfig                           | 10 ----------
>>  drivers/platform/x86/Makefile                          |  1 -
>>  drivers/thermal/intel/Kconfig                          |  9 +++++++++
>>  drivers/thermal/intel/Makefile                         |  1 +
>>  drivers/{platform/x86 => thermal/intel}/intel_menlow.c |  0
>>  6 files changed, 12 insertions(+), 13 deletions(-)
>>  rename drivers/{platform/x86 => thermal/intel}/intel_menlow.c (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fd25e4ecf0b9..4231aea31a6f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9459,10 +9459,10 @@ F:	include/linux/mfd/intel-m10-bmc.h
>>  
>>  INTEL MENLOW THERMAL DRIVER
>>  M:	Sujith Thomas <sujith.thomas@intel.com>
>> -L:	platform-driver-x86@vger.kernel.org
>> +L:	linux-pm@vger.kernel.org
>>  S:	Supported
>>  W:	https://01.org/linux-acpi
>> -F:	drivers/platform/x86/intel_menlow.c
>> +F:	drivers/thermal/intel/intel_menlow.c
>>  
>>  INTEL P-Unit IPC DRIVER
>>  M:	Zha Qipeng <qipeng.zha@intel.com>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index d12db6c316ea..da312426b4a5 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -720,16 +720,6 @@ config INTEL_INT0002_VGPIO
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called intel_int0002_vgpio.
>>  
>> -config INTEL_MENLOW
>> -	tristate "Thermal Management driver for Intel menlow platform"
>> -	depends on ACPI_THERMAL
>> -	select THERMAL
>> -	help
>> -	  ACPI thermal management enhancement driver on
>> -	  Intel Menlow platform.
>> -
>> -	  If unsure, say N.
>> -
>>  config INTEL_OAKTRAIL
>>  	tristate "Intel Oaktrail Platform Extras"
>>  	depends on ACPI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 7ee369aab10d..0d3af23f1186 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -72,7 +72,6 @@ obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
>>  obj-$(CONFIG_INTEL_ATOMISP2_PM)		+= intel_atomisp2_pm.o
>>  obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
>>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
>> -obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
>>  obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
>>  
>> diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kconfig
>> index e4299ca3423c..c83ea5d04a1d 100644
>> --- a/drivers/thermal/intel/Kconfig
>> +++ b/drivers/thermal/intel/Kconfig
>> @@ -90,3 +90,12 @@ config INTEL_TCC_COOLING
>>  	  Note that, on different platforms, the behavior might be different
>>  	  on how fast the setting takes effect, and how much the CPU frequency
>>  	  is reduced.
>> +
>> +config INTEL_MENLOW
>> +	tristate "Thermal Management driver for Intel menlow platform"
>> +	depends on ACPI_THERMAL
>> +	help
>> +	  ACPI thermal management enhancement driver on
>> +	  Intel Menlow platform.
>> +
>> +	  If unsure, say N.
>> diff --git a/drivers/thermal/intel/Makefile b/drivers/thermal/intel/Makefile
>> index 5ff2afa388f7..960b56268b4a 100644
>> --- a/drivers/thermal/intel/Makefile
>> +++ b/drivers/thermal/intel/Makefile
>> @@ -12,3 +12,4 @@ obj-$(CONFIG_INTEL_BXT_PMIC_THERMAL) += intel_bxt_pmic_thermal.o
>>  obj-$(CONFIG_INTEL_PCH_THERMAL)	+= intel_pch_thermal.o
>>  obj-$(CONFIG_INTEL_TCC_COOLING)	+= intel_tcc_cooling.o
>>  obj-$(CONFIG_X86_THERMAL_VECTOR) += therm_throt.o
>> +obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
>> diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/thermal/intel/intel_menlow.c
>> similarity index 100%
>> rename from drivers/platform/x86/intel_menlow.c
>> rename to drivers/thermal/intel/intel_menlow.c
>>
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A382A3ECFD1
	for <lists+platform-driver-x86@lfdr.de>; Mon, 16 Aug 2021 09:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbhHPH6J (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 16 Aug 2021 03:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30524 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234475AbhHPH4k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 03:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629100561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4WLMRCY3MaQIbeqgGRKL4QjepI64qJGmJ1RWeY5+QEA=;
        b=bJVr+4n6fOVfjDE6ypCjGapl9Po1xxV2p5G/CzoMlyG4jimLn70ICGnv0SFm8H71PVbnwL
        GMaaoAJiAb9mtqiP80KnPpjrqsfWMzGCEIx/TUFpLm/Go5CODejQprOJRiLcJXOZEfgYeH
        CIXAdv/jG/qe6zuJ7W6glXxEvsWm9Ks=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-kZeVR9ORMtmVG4eP4IPeyg-1; Mon, 16 Aug 2021 03:55:59 -0400
X-MC-Unique: kZeVR9ORMtmVG4eP4IPeyg-1
Received: by mail-ej1-f71.google.com with SMTP id j10-20020a17090686cab02905b86933b59dso3886332ejy.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 00:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4WLMRCY3MaQIbeqgGRKL4QjepI64qJGmJ1RWeY5+QEA=;
        b=W2U/mHj9MUq73btttFDJoQF88a3vm2ZJ3rzK1qpDGS5lRE7MdeODD1qPZ3E7r0v2oj
         qqkvxojC1FzqI5fZ5EAQG4ulwTd/nZYfCEz4e7HJ4zpmB4iithDNe0qgu/Vgy9RkvkXC
         LUTaEXy/LY8SLUK05Y4S2TwDX2JIi4TU4OGBSBBQ/RTJ0GZPwo0+MlM0Coq1zt9ImDGe
         jAoVy+dSYwmwQQ6tPJYIOayJOwAptw715BNsC8cXIHUAyL/TJMZn0iIDPQ9VOifrAKVd
         cN3+IepJ66Jg1x3MND5gNCPtHmU206H7ueVpbJ4GNryzo+yVdG0jw0UiSgPk774Vo3U6
         VrIQ==
X-Gm-Message-State: AOAM530RsqZ0jaKxovE154RtK9G00O0LD3HV3Ne3w4Oexu1Q3vQDCa0A
        L13WtdcOgjgiJ54QdOw7G2SLRJ21Ln7TcuZtnO8LBVS89YDClJWRJnX9jY2njuAgPIJsk40CSZN
        aBt1wMXh+75L/++8WgccXzYrmxPLD3XNIhu57y1YcIyEsjI08kAFvi4Qq861ajjLp77uKAQ9448
        KKr1yOFNNtTQ==
X-Received: by 2002:a05:6402:2049:: with SMTP id bc9mr18571058edb.130.1629100558483;
        Mon, 16 Aug 2021 00:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/dQRHTp4gm57mB2M9kVE4ksN3mLS0UrQioeKyBVDhkMCwEy2XtatfC5h9w6zqLNOBJrF7tw==
X-Received: by 2002:a05:6402:2049:: with SMTP id bc9mr18571037edb.130.1629100558329;
        Mon, 16 Aug 2021 00:55:58 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id f20sm3369243ejz.30.2021.08.16.00.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 00:55:58 -0700 (PDT)
Subject: Re: [PATCH] thermal/drivers/intel: Move intel_menlow to thermal
 drivers
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        rui.zhang@intel.com, daniel.lezcano@linaro.org, hpa@redhat.com,
        mgross@linux.intel.com, alex.hung@canonical.com,
        sujith.thomas@intel.com, andriy.shevchenko@linux.intel.com
Cc:     linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210816035356.1955982-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4d1c20ab-6c81-8e9f-6d0f-180ecaa92812@redhat.com>
Date:   Mon, 16 Aug 2021 09:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816035356.1955982-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/16/21 5:53 AM, Srinivas Pandruvada wrote:
> Moved drivers/platform/x86/intel_menlow.c to drivers/thermal/intel.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thank you.

Rui, with this upcoming patch-series:

https://lore.kernel.org/platform-driver-x86/c6a90704-5080-d479-0022-58e5d106c026@infradead.org/T/#t

drivers/platform/x86/Kconfig + Makefile

Are going to see quite a bit of churn, is it ok if I merge this patch
through the pdx86 tree to avoid conflicts with all those changes?

Rui, if this is ok, may I have your ack for this then ?

Regards,

Hans



> ---
>  MAINTAINERS                                            |  4 ++--
>  drivers/platform/x86/Kconfig                           | 10 ----------
>  drivers/platform/x86/Makefile                          |  1 -
>  drivers/thermal/intel/Kconfig                          |  9 +++++++++
>  drivers/thermal/intel/Makefile                         |  1 +
>  drivers/{platform/x86 => thermal/intel}/intel_menlow.c |  0
>  6 files changed, 12 insertions(+), 13 deletions(-)
>  rename drivers/{platform/x86 => thermal/intel}/intel_menlow.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd25e4ecf0b9..4231aea31a6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9459,10 +9459,10 @@ F:	include/linux/mfd/intel-m10-bmc.h
>  
>  INTEL MENLOW THERMAL DRIVER
>  M:	Sujith Thomas <sujith.thomas@intel.com>
> -L:	platform-driver-x86@vger.kernel.org
> +L:	linux-pm@vger.kernel.org
>  S:	Supported
>  W:	https://01.org/linux-acpi
> -F:	drivers/platform/x86/intel_menlow.c
> +F:	drivers/thermal/intel/intel_menlow.c
>  
>  INTEL P-Unit IPC DRIVER
>  M:	Zha Qipeng <qipeng.zha@intel.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..da312426b4a5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -720,16 +720,6 @@ config INTEL_INT0002_VGPIO
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called intel_int0002_vgpio.
>  
> -config INTEL_MENLOW
> -	tristate "Thermal Management driver for Intel menlow platform"
> -	depends on ACPI_THERMAL
> -	select THERMAL
> -	help
> -	  ACPI thermal management enhancement driver on
> -	  Intel Menlow platform.
> -
> -	  If unsure, say N.
> -
>  config INTEL_OAKTRAIL
>  	tristate "Intel Oaktrail Platform Extras"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..0d3af23f1186 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -72,7 +72,6 @@ obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
>  obj-$(CONFIG_INTEL_ATOMISP2_PM)		+= intel_atomisp2_pm.o
>  obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
> -obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
>  obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
>  
> diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kconfig
> index e4299ca3423c..c83ea5d04a1d 100644
> --- a/drivers/thermal/intel/Kconfig
> +++ b/drivers/thermal/intel/Kconfig
> @@ -90,3 +90,12 @@ config INTEL_TCC_COOLING
>  	  Note that, on different platforms, the behavior might be different
>  	  on how fast the setting takes effect, and how much the CPU frequency
>  	  is reduced.
> +
> +config INTEL_MENLOW
> +	tristate "Thermal Management driver for Intel menlow platform"
> +	depends on ACPI_THERMAL
> +	help
> +	  ACPI thermal management enhancement driver on
> +	  Intel Menlow platform.
> +
> +	  If unsure, say N.
> diff --git a/drivers/thermal/intel/Makefile b/drivers/thermal/intel/Makefile
> index 5ff2afa388f7..960b56268b4a 100644
> --- a/drivers/thermal/intel/Makefile
> +++ b/drivers/thermal/intel/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_INTEL_BXT_PMIC_THERMAL) += intel_bxt_pmic_thermal.o
>  obj-$(CONFIG_INTEL_PCH_THERMAL)	+= intel_pch_thermal.o
>  obj-$(CONFIG_INTEL_TCC_COOLING)	+= intel_tcc_cooling.o
>  obj-$(CONFIG_X86_THERMAL_VECTOR) += therm_throt.o
> +obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
> diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/thermal/intel/intel_menlow.c
> similarity index 100%
> rename from drivers/platform/x86/intel_menlow.c
> rename to drivers/thermal/intel/intel_menlow.c
> 


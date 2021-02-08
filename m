Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A21A314079
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Feb 2021 21:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbhBHU2w (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Feb 2021 15:28:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27943 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236832AbhBHU2r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Feb 2021 15:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612816038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sA0FM7v+6CHisYqWQBBqr2DRNUu9zisJPEzRaNIOEkM=;
        b=Lt7Kc+iAoocoQcj8PzwbJewjbiHC6uERbmH4PcG28SjAh2dUWUdRQe+0JNkCnnN5up1Vib
        VE7Dm8Mg4AIuXWFoyYS7hzXAtZPXzapSFHRvD2VWMhIZGXs6aykftsCXHpTSQzkRyHAiCy
        OZSZ2lQmFkhjk0nT5+1mA0fmAnpOuiM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-6ujt4MSUMq-n3CGn0SrlzA-1; Mon, 08 Feb 2021 15:27:14 -0500
X-MC-Unique: 6ujt4MSUMq-n3CGn0SrlzA-1
Received: by mail-ed1-f70.google.com with SMTP id i13so15095393edq.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Feb 2021 12:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sA0FM7v+6CHisYqWQBBqr2DRNUu9zisJPEzRaNIOEkM=;
        b=dbL94dzLOKGVp+ZUVNPjq15VP3USRjOgfKGiDiCe9eCNRP5opbBSmSBWP3IZt6Jkqr
         Ahm6S6otkZzMH7bBiYqT+yvl6nxDV3ttjl23hv4XtXmDQ2LSjUj2lH3VAg27YukTHFiU
         exxL0K/7mKNyzUCi+WS1q3oy+bsFG1AHIzwWpTroVBEKFacXYQHlNIMUD2yH4wRet7QU
         //Qv24LUgNUCprSk0zKm/30Wi0A2LCYT7I9JeqX/ErZFEuAHpo621lGjHu+3e0W26Ahm
         VzrnG72Ix3CwMBLkWzYTPjNHtuYwijpAA1qgDhcisWOEg+h5nLNJ3t2MeM4Mn9ReFNwA
         1fDQ==
X-Gm-Message-State: AOAM531y1slJxEJEKKc0F4/f0r+XmuZhllkJ0sH6woT1COQSMTUtOnb4
        ujHwJsqbCjXdL/+5xFc3KTmfvUTklXZ233QaCFg/Pgqcch0acnY96x9D2dDZB1x6FI43nwJCxQZ
        PORBzkoJwZkUkQx+Tjehr6OD6lsefY/jrNw==
X-Received: by 2002:a17:906:c081:: with SMTP id f1mr10997588ejz.97.1612816032764;
        Mon, 08 Feb 2021 12:27:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQABJDwfMBK+WRtkMqmOLHT6+8NrGJB6A+TQwi5zrA/+P/uZN4yk1bjXpRBGspxYJqasZ/2w==
X-Received: by 2002:a17:906:c081:: with SMTP id f1mr10997557ejz.97.1612816032371;
        Mon, 08 Feb 2021 12:27:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a9sm10234139edk.22.2021.02.08.12.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 12:27:11 -0800 (PST)
Subject: Re: [PATCH] platform/surface: Add platform profile driver
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210208194903.3039142-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cc9d27aa-955d-1cd1-19b8-9b18bdc6b8a2@redhat.com>
Date:   Mon, 8 Feb 2021 21:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208194903.3039142-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/8/21 8:49 PM, Maximilian Luz wrote:
> Add a driver to provide platform profile support on 5th- and later
> generation Microsoft Surface devices with a Surface System Aggregator
> Module. On those devices, the platform profile can be used to influence
> cooling behavior and power consumption.
> 
> For example, the default 'quiet' profile limits fan noise and in turn
> sacrifices performance of the discrete GPU found on Surface Books. Its
> full performance can only be unlocked on the 'performance' profile.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
> 
> Note: This patch builds ontop of the
> 
>     platform/surface: Add Surface Aggregator device registry
> 
> series. While that series is not strictly required for building this
> driver, it provides the device against which it loads. So (at the moment
> at least) this patch is essentially useless without that series.

Oh, another user of the new platform-profile stuff, great, that means
that the time to get this in place was probably well spend :)

A few review remarks inline.

> 
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/platform/surface/Kconfig              |  27 +++
>  drivers/platform/surface/Makefile             |   1 +
>  .../surface/surface_platform_profile.c        | 190 ++++++++++++++++++
>  4 files changed, 224 insertions(+)
>  create mode 100644 drivers/platform/surface/surface_platform_profile.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 000a82f59c76..a08d65f8f0df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11811,6 +11811,12 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/surface/surface_hotplug.c
>  
> +MICROSOFT SURFACE PLATFORM PROFILE DRIVER
> +M:	Maximilian Luz <luzmaximilian@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/surface/surface_platform_profile.c
> +
>  MICROSOFT SURFACE PRO 3 BUTTON DRIVER
>  M:	Chen Yu <yu.c.chen@intel.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
> index 1cd37c041710..e12c65909bcc 100644
> --- a/drivers/platform/surface/Kconfig
> +++ b/drivers/platform/surface/Kconfig
> @@ -131,6 +131,33 @@ config SURFACE_HOTPLUG
>  	  Select M or Y here, if you want to (fully) support hot-plugging of
>  	  dGPU devices on the Surface Book 2 and/or 3 during D3cold.
>  
> +config SURFACE_PLATFORM_PROFILE
> +	tristate "Surface Platform Profile Driver"
> +	depends on SURFACE_AGGREGATOR_BUS
> +	depends on ACPI_PLATFORM_PROFILE

Not really about this patch, but it seems to me that it would be better
to make ACPI_PLATFORM_PROFILE not user selectable and use select here
and in the other 2 Kconfig bits which have depends on ACPI_PLATFORM_PROFILE ATM.
I would certainly welcome a patch for this.

Note such a patch should probably sit on top of this one, as it will need
some coordination with Rafael to get that upstream.

Although we may need some other changes to drivers/acpi/platform_profile.c
too, see below.

> +	help
> +	  Provides support for the ACPI platform profile on 5th- and later
> +	  generation Microsoft Surface devices.
> +
> +	  More specifically, this driver provides ACPI platform profile support
> +	  on Microsoft Surface devices with a Surface System Aggregator Module
> +	  (SSAM) connected via the Surface Serial Hub (SSH / SAM-over-SSH). In
> +	  other words, this driver provides platform profile support on the
> +	  Surface Pro 5, Surface Book 2, Surface Laptop, Surface Laptop Go and
> +	  later. On those devices, the platform profile can significantly
> +	  influence cooling behavior, e.g. setting it to 'quiet' (default) or
> +	  'low-power' can significantly limit performance of the discrete GPU on
> +	  Surface Books, while in turn leading to lower power consumption and/or
> +	  less fan noise.
> +
> +	  Note that this driver currently relies on the Surface Aggregator
> +	  registry (CONFIG_SURFACE_AGGREGATOR_REGISTRY) to provide the device it
> +	  loads against. Thus, without that registry, this module is essentially
> +	  of no use.

I would prefer if you dropped this paragraph and just add a:

depends on SURFACE_AGGREGATOR_REGISTRY

Technically this could be builtin while SURFACE_AGGREGATOR_REGISTRY is a module,
while adding the depends on will disallow that, but I see no reason why someone
would want to make this builtin without also having SURFACE_AGGREGATOR_REGISTRY
builtin.

> +
> +	  Select M or Y here, if you want to include ACPI platform profile
> +	  support on the above mentioned devices.
> +
>  config SURFACE_PRO3_BUTTON
>  	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3/4 tablet"
>  	depends on INPUT
> diff --git a/drivers/platform/surface/Makefile b/drivers/platform/surface/Makefile
> index 80035ee540bf..99372c427b73 100644
> --- a/drivers/platform/surface/Makefile
> +++ b/drivers/platform/surface/Makefile
> @@ -13,4 +13,5 @@ obj-$(CONFIG_SURFACE_AGGREGATOR_CDEV)	+= surface_aggregator_cdev.o
>  obj-$(CONFIG_SURFACE_AGGREGATOR_REGISTRY) += surface_aggregator_registry.o
>  obj-$(CONFIG_SURFACE_GPE)		+= surface_gpe.o
>  obj-$(CONFIG_SURFACE_HOTPLUG)		+= surface_hotplug.o
> +obj-$(CONFIG_SURFACE_PLATFORM_PROFILE)	+= surface_platform_profile.o
>  obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
> diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
> new file mode 100644
> index 000000000000..548ad8af9cf1
> --- /dev/null
> +++ b/drivers/platform/surface/surface_platform_profile.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Surface Platform Profile / Performance Mode driver for Surface System
> + * Aggregator Module (thermal subsystem).
> + *
> + * Copyright (C) 2021 Maximilian Luz <luzmaximilian@gmail.com>
> + */
> +
> +#include <asm/unaligned.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_profile.h>
> +#include <linux/types.h>
> +
> +#include <linux/surface_aggregator/device.h>
> +
> +enum ssam_tmp_profile {
> +	SSAM_TMP_PROFILE_NORMAL             = 1,
> +	SSAM_TMP_PROFILE_BATTERY_SAVER      = 2,
> +	SSAM_TMP_PROFILE_BETTER_PERFORMANCE = 3,
> +	SSAM_TMP_PROFILE_BEST_PERFORMANCE   = 4,
> +};
> +
> +struct ssam_tmp_profile_info {
> +	__le32 profile;
> +	__le16 unknown1;
> +	__le16 unknown2;
> +} __packed;
> +
> +struct ssam_tmp_profile_device {
> +	struct ssam_device *sdev;
> +	struct platform_profile_handler handler;
> +};
> +
> +static SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_tmp_profile_get, struct ssam_tmp_profile_info, {
> +	.target_category = SSAM_SSH_TC_TMP,
> +	.command_id      = 0x02,
> +});
> +
> +static SSAM_DEFINE_SYNC_REQUEST_CL_W(__ssam_tmp_profile_set, __le32, {
> +	.target_category = SSAM_SSH_TC_TMP,
> +	.command_id      = 0x03,
> +});
> +
> +static int ssam_tmp_profile_get(struct ssam_device *sdev, enum ssam_tmp_profile *p)
> +{
> +	struct ssam_tmp_profile_info info;
> +	int status;
> +
> +	status = ssam_retry(__ssam_tmp_profile_get, sdev, &info);
> +	if (status < 0)
> +		return status;
> +
> +	*p = le32_to_cpu(info.profile);
> +	return 0;
> +}
> +
> +static int ssam_tmp_profile_set(struct ssam_device *sdev, enum ssam_tmp_profile p)
> +{
> +	__le32 profile_le = cpu_to_le32(p);
> +
> +	return ssam_retry(__ssam_tmp_profile_set, sdev, &profile_le);
> +}
> +
> +static int convert_ssam_to_profile(struct ssam_device *sdev, enum ssam_tmp_profile p)
> +{
> +	switch (p) {
> +	case SSAM_TMP_PROFILE_NORMAL:
> +		return PLATFORM_PROFILE_QUIET;
> +
> +	case SSAM_TMP_PROFILE_BATTERY_SAVER:
> +		return PLATFORM_PROFILE_LOW_POWER;
> +
> +	case SSAM_TMP_PROFILE_BETTER_PERFORMANCE:
> +		return PLATFORM_PROFILE_BALANCED;
> +
> +	case SSAM_TMP_PROFILE_BEST_PERFORMANCE:
> +		return PLATFORM_PROFILE_PERFORMANCE;
> +
> +	default:
> +		dev_err(&sdev->dev, "invalid performance profile: %d", p);
> +		return -EINVAL;
> +	}
> +}

I'm not sure about the mapping which you have chosen here. I know that at least for
gnome there are plans to make this stuff available in the UI:

https://gitlab.gnome.org/Teams/Design/settings-mockups/-/blob/master/power/power.png
http://www.hadess.net/2020/09/power-profiles-daemon-new-project.html

Notice there are only 3 levels in the UI, which will primarily be mapped to:

PLATFORM_PROFILE_LOW_POWER
PLATFORM_PROFILE_BALANCED
PLATFORM_PROFILE_PERFORMANCE

(with fallbacks to say QUIET for LOW_POWER of there is no LOW_POWER, but that
mostly is something for userspace to worry about).

And the power-profile-daemon will likely restore the last used setting on boot,
meaning with your mapping that it will always switch the profile away from
SSAM_TMP_PROFILE_NORMAL, which I assume is the default profile picked at boot ?

So ideally we would map PLATFORM_PROFILE_BALANCED (which will be the default
GNOME / power-profile-daemon setting) to SSAM_TMP_PROFILE_NORMAL.

I know the ABI docs say that drivers should try to use existing values, but
this seems like a good case to add a new value or 2 to the PLATFORM_PROFILE enum.

During the discussion the following 2 options were given because some devices
may have more then one balanced profile:

PLATFORM_PROFILE_BALANCED_LOW_POWER:

                balanced-low-power:     Balances between low power consumption
                                        and performance with a slight bias
                                        towards low power

PLATFORM_PROFILE_BALANCED_PERFORMANCE:

                balanced-performance:   Balances between performance and low
                                        power consumption with a slight bias
                                        towards performance

I think it would be better to add 1 or both of these, if we add both
we could e.g. do the following mappings:

SSAM_TMP_PROFILE_BATTERY_SAVER      ->  PLATFORM_PROFILE_LOW_POWER
SSAM_TMP_PROFILE_NORMAL             ->  PLATFORM_PROFILE_BALANCED_LOW_POWER
SSAM_TMP_PROFILE_BETTER_PERFORMANCE ->  PLATFORM_PROFILE_BALANCED_PERFORMANCE
SSAM_TMP_PROFILE_BEST_PERFORMANCE   ->  PLATFORM_PROFILE_PERFORMANCE

or we could do:

SSAM_TMP_PROFILE_BATTERY_SAVER      ->  PLATFORM_PROFILE_LOW_POWER
SSAM_TMP_PROFILE_NORMAL             ->  PLATFORM_PROFILE_BALANCED
SSAM_TMP_PROFILE_BETTER_PERFORMANCE ->  PLATFORM_PROFILE_BALANCED_PERFORMANCE
SSAM_TMP_PROFILE_BEST_PERFORMANCE   ->  PLATFORM_PROFILE_PERFORMANCE

I'm not sure which is best, I hope you have a better idea of that then me.

I might even be wrong here and NORMAL might really be more about being QUIET
then it really being BALANCED ? In which case the mapping is fine as is.

Regards,

Hans









> +
> +static int convert_profile_to_ssam(struct ssam_device *sdev, enum platform_profile_option p)
> +{
> +	switch (p) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		return SSAM_TMP_PROFILE_BATTERY_SAVER;
> +
> +	case PLATFORM_PROFILE_QUIET:
> +		return SSAM_TMP_PROFILE_NORMAL;
> +
> +	case PLATFORM_PROFILE_BALANCED:
> +		return SSAM_TMP_PROFILE_BETTER_PERFORMANCE;
> +
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		return SSAM_TMP_PROFILE_BEST_PERFORMANCE;
> +
> +	default:
> +		/* This should have already been caught by platform_profile_store(). */
> +		WARN(true, "unsupported platform profile");
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ssam_platform_profile_get(struct platform_profile_handler *pprof,
> +				     enum platform_profile_option *profile)
> +{
> +	struct ssam_tmp_profile_device *tpd;
> +	enum ssam_tmp_profile tp;
> +	int status;
> +
> +	tpd = container_of(pprof, struct ssam_tmp_profile_device, handler);
> +
> +	status = ssam_tmp_profile_get(tpd->sdev, &tp);
> +	if (status)
> +		return status;
> +
> +	status = convert_ssam_to_profile(tpd->sdev, tp);
> +	if (status < 0)
> +		return status;
> +
> +	*profile = status;
> +	return 0;
> +}
> +
> +static int ssam_platform_profile_set(struct platform_profile_handler *pprof,
> +				     enum platform_profile_option profile)
> +{
> +	struct ssam_tmp_profile_device *tpd;
> +	int tp;
> +
> +	tpd = container_of(pprof, struct ssam_tmp_profile_device, handler);
> +
> +	tp = convert_profile_to_ssam(tpd->sdev, profile);
> +	if (tp < 0)
> +		return tp;
> +
> +	return ssam_tmp_profile_set(tpd->sdev, tp);
> +}
> +
> +static int surface_platform_profile_probe(struct ssam_device *sdev)
> +{
> +	struct ssam_tmp_profile_device *tpd;
> +
> +	tpd = devm_kzalloc(&sdev->dev, sizeof(*tpd), GFP_KERNEL);
> +	if (!tpd)
> +		return -ENOMEM;
> +
> +	tpd->sdev = sdev;
> +
> +	tpd->handler.profile_get = ssam_platform_profile_get;
> +	tpd->handler.profile_set = ssam_platform_profile_set;
> +
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, tpd->handler.choices);
> +	set_bit(PLATFORM_PROFILE_QUIET, tpd->handler.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, tpd->handler.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, tpd->handler.choices);
> +
> +	platform_profile_register(&tpd->handler);
> +	return 0;
> +}
> +
> +static void surface_platform_profile_remove(struct ssam_device *sdev)
> +{
> +	platform_profile_remove();
> +}
> +
> +static const struct ssam_device_id ssam_platform_profile_match[] = {
> +	{ SSAM_SDEV(TMP, 0x01, 0x00, 0x01) },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(ssam, ssam_platform_profile_match);
> +
> +static struct ssam_device_driver surface_platform_profile = {
> +	.probe = surface_platform_profile_probe,
> +	.remove = surface_platform_profile_remove,
> +	.match_table = ssam_platform_profile_match,
> +	.driver = {
> +		.name = "surface_platform_profile",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_ssam_device_driver(surface_platform_profile);
> +
> +MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
> +MODULE_DESCRIPTION("Platform Profile Support for Surface System Aggregator Module");
> +MODULE_LICENSE("GPL");
> 


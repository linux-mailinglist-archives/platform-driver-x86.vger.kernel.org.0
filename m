Return-Path: <platform-driver-x86+bounces-2624-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34C89C33C
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 15:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3348A1C22099
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 13:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B36D823A2;
	Mon,  8 Apr 2024 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NroMxOPb"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFE76058
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712583206; cv=none; b=DSS+PTZT9ms1vIbMY5lN0v9MLjDM1++eivf9QS4HUcLxJEDM2hVQJHbwelBUMMO6TzEPM8bY8yFPUPOOsk4qYFpQ4LZxCbFUXgjz5soh+Vu95bCLfHm9o75AJU9OkFY97C9fvacLgaB3LGP+wkC0aupWAYaGUWfvWs5hlgFF0fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712583206; c=relaxed/simple;
	bh=lCvJCKPqHqwbQq66fgqLDRSM/n5Zlag3xbFtBIqQUro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6rSX+ZMK/TzX+yWuCe5xY59pEkbtLeuBvrh7H0z+vH4gixb1X7dETk5+ygfjZE8vAquxYUvEVN6QMLjo+0eKXgF4EccUiXh7ixBwiMgXV8XYZPtxTblIE5PerNI4uXDoTRVEiExaDWUxM8Nu3FLDg7gt80EiXN6pM3iKTdMGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NroMxOPb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712583203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXGfp3HEqfEtxyBGtYu42j7DuUH/kpX4Nj9pSgnUGiU=;
	b=NroMxOPbKVnBDflLcRkQI3GYxoSECV/WJ66AQPL62lHg52RjkdQrzU9jm0iVFthuEQW2Xv
	LSPTs6NRfxlFXHrRWyWpV7CjRJO68zeXAZlRO50BZ0NmDyH/+GG7IafdfogD47bSvx4pyQ
	Km7LFoXySP2LlgS+wRoyzdjDHfR09q4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-nzPLRjZNNj-bQGFnaH_R8A-1; Mon, 08 Apr 2024 09:33:22 -0400
X-MC-Unique: nzPLRjZNNj-bQGFnaH_R8A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a462e4d8c44so218496166b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 06:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712583200; x=1713188000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXGfp3HEqfEtxyBGtYu42j7DuUH/kpX4Nj9pSgnUGiU=;
        b=Dya4FgYraT0RpSacRuy2G1nAhXeaunLmj8EaIeSAiuPqHajpIO2q36A/+Xdf1NIGSk
         WmfYu3xkPfRJCanFQZVPobJmZR1XIjto5aoVmTdcEuyJgkPUNpVu5LgnFb/iiKPF7V26
         vq1UMoYQd3fujQ8n1TXhb9dTCkCfu7UZ6WI47umE/+6xaYbOR5NGFZ4W2FCF2xhpUr8W
         zSIcLm33NdJONIeTy+cjAnEPY9xs6IHbMJtrSBobFqixr7VN7YH4LlP0xaVCCNex21JS
         HJ2bOsrX+Yu2g/yF4Pn9iChdz6aHzbVrWdQZRsx7yagHNa4nI97N9M1Z+Nw6PUHr1xSG
         3UwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk5Yruz9fgj/3p+G7/602tYr7rR/9rlhqTlizw1uUhfUlqxQQTdrqb4lN2V9XAbY8MH7R1JFZZPDXzr4jfBzUakToYbMyxrg4QyoxmLM0vMGTUzQ==
X-Gm-Message-State: AOJu0YzwyXKPeDlqhyBn/TshmEQ0n4ZyD3aRjGdltvIGlgEJetQ17GTm
	sLh6JPds5D/czPxr+tdRvscA32SMAPoO73rY4x0RyDJBk/CNmhT6/3kGT1U2uISDWka4bCrt2PA
	f2YtSHYInGRnccl5gZiWXVLoB3Y1U+HTTMeRcPoZoJEnD+pbcRRv0bUBUF3YL0mpqr7gUEn4=
X-Received: by 2002:a17:906:52cd:b0:a51:b18a:ec07 with SMTP id w13-20020a17090652cd00b00a51b18aec07mr5392447ejn.9.1712583200710;
        Mon, 08 Apr 2024 06:33:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa0THg6YOL/BVSivR9nmr5jVBw/elL40p06xU1nLkoCZCZRR1baHWP4QoJJgShGiCky5CyDw==
X-Received: by 2002:a17:906:52cd:b0:a51:b18a:ec07 with SMTP id w13-20020a17090652cd00b00a51b18aec07mr5392414ejn.9.1712583200376;
        Mon, 08 Apr 2024 06:33:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906c21500b00a4e28cacbddsm4433449ejz.57.2024.04.08.06.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:33:19 -0700 (PDT)
Message-ID: <c96f45d6-41ac-4a4b-9383-733f913db224@redhat.com>
Date: Mon, 8 Apr 2024 15:33:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: Add thermal sensor driver for Surface
 Aggregator Module
To: Maximilian Luz <luzmaximilian@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ivor Wanders <ivor@iwanders.net>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20240330112409.3402943-1-luzmaximilian@gmail.com>
 <20240330112409.3402943-2-luzmaximilian@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240330112409.3402943-2-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/30/24 12:24 PM, Maximilian Luz wrote:
> Some of the newer Microsoft Surface devices (such as the Surface Book
> 3 and Pro 9) have thermal sensors connected via the Surface Aggregator
> Module (the embedded controller on those devices). Add a basic driver
> to read out the temperature values of those sensors.
> 
> Link: https://github.com/linux-surface/surface-aggregator-module/issues/59
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  MAINTAINERS                  |   6 ++
>  drivers/hwmon/Kconfig        |  10 +++
>  drivers/hwmon/Makefile       |   1 +
>  drivers/hwmon/surface_temp.c | 165 +++++++++++++++++++++++++++++++++++
>  4 files changed, 182 insertions(+)
>  create mode 100644 drivers/hwmon/surface_temp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d36c19c1bf811..bc5bc418ed479 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14738,6 +14738,12 @@ S:	Maintained
>  F:	Documentation/hwmon/surface_fan.rst
>  F:	drivers/hwmon/surface_fan.c
>  
> +MICROSOFT SURFACE SENSOR THERMAL DRIVER
> +M:	Maximilian Luz <luzmaximilian@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/surface_temp.c
> +
>  MICROSOFT SURFACE GPE LID SUPPORT DRIVER
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 83945397b6eb1..338ef73c96a3a 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2070,6 +2070,16 @@ config SENSORS_SURFACE_FAN
>  
>  	  Select M or Y here, if you want to be able to read the fan's speed.
>  
> +config SENSORS_SURFACE_TEMP
> +	tristate "Microsoft Surface Thermal Sensor Driver"
> +	depends on SURFACE_AGGREGATOR
> +	help
> +	  Driver for monitoring thermal sensors connected via the Surface
> +	  Aggregator Module (embedded controller) on Microsoft Surface devices.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called surface_temp.
> +
>  config SENSORS_ADC128D818
>  	tristate "Texas Instruments ADC128D818"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 5c31808f6378d..de8bc99719e63 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -208,6 +208,7 @@ obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>  obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
>  obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
>  obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
> +obj-$(CONFIG_SENSORS_SURFACE_TEMP)+= surface_temp.o
>  obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
>  obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
>  obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
> diff --git a/drivers/hwmon/surface_temp.c b/drivers/hwmon/surface_temp.c
> new file mode 100644
> index 0000000000000..48c3e826713f6
> --- /dev/null
> +++ b/drivers/hwmon/surface_temp.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Thermal sensor subsystem driver for Surface System Aggregator Module (SSAM).
> + *
> + * Copyright (C) 2022-2023 Maximilian Luz <luzmaximilian@gmail.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +#include <linux/surface_aggregator/controller.h>
> +#include <linux/surface_aggregator/device.h>
> +
> +
> +/* -- SAM interface. -------------------------------------------------------- */
> +
> +SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_tmp_get_available_sensors, __le16, {
> +	.target_category = SSAM_SSH_TC_TMP,
> +	.command_id      = 0x04,
> +});
> +
> +SSAM_DEFINE_SYNC_REQUEST_MD_R(__ssam_tmp_get_temperature, __le16, {
> +	.target_category = SSAM_SSH_TC_TMP,
> +	.command_id      = 0x01,
> +});
> +
> +static int ssam_tmp_get_available_sensors(struct ssam_device *sdev, s16 *sensors)
> +{
> +	__le16 sensors_le;
> +	int status;
> +
> +	status = __ssam_tmp_get_available_sensors(sdev, &sensors_le);
> +	if (status)
> +		return status;
> +
> +	*sensors = le16_to_cpu(sensors_le);
> +	return 0;
> +}
> +
> +static int ssam_tmp_get_temperature(struct ssam_device *sdev, u8 iid, long *temperature)
> +{
> +	__le16 temp_le;
> +	int status;
> +
> +	status = __ssam_tmp_get_temperature(sdev->ctrl, sdev->uid.target, iid, &temp_le);
> +	if (status)
> +		return status;
> +
> +	/* Convert 1/10 °K to 1/1000 °C */
> +	*temperature = (le16_to_cpu(temp_le) - 2731) * 100L;
> +	return 0;
> +}
> +
> +
> +/* -- Driver.---------------------------------------------------------------- */
> +
> +struct ssam_temp {
> +	struct ssam_device *sdev;
> +	s16 sensors;
> +};
> +
> +static umode_t ssam_temp_hwmon_is_visible(const void *data,
> +					  enum hwmon_sensor_types type,
> +					  u32 attr, int channel)
> +{
> +	const struct ssam_temp *ssam_temp = data;
> +
> +	if (!(ssam_temp->sensors & BIT(channel)))
> +		return 0;
> +
> +	return 0444;
> +}
> +
> +static int ssam_temp_hwmon_read(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel, long *value)
> +{
> +	const struct ssam_temp *ssam_temp = dev_get_drvdata(dev);
> +
> +	return ssam_tmp_get_temperature(ssam_temp->sdev, channel + 1, value);
> +}
> +
> +static const struct hwmon_channel_info * const ssam_temp_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),
> +	/* We have at most 16 thermal sensor channels. */
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops ssam_temp_hwmon_ops = {
> +	.is_visible = ssam_temp_hwmon_is_visible,
> +	.read = ssam_temp_hwmon_read,
> +};
> +
> +static const struct hwmon_chip_info ssam_temp_hwmon_chip_info = {
> +	.ops = &ssam_temp_hwmon_ops,
> +	.info = ssam_temp_hwmon_info,
> +};
> +
> +static int ssam_temp_probe(struct ssam_device *sdev)
> +{
> +	struct ssam_temp *ssam_temp;
> +	struct device *hwmon_dev;
> +	s16 sensors;
> +	int status;
> +
> +	status = ssam_tmp_get_available_sensors(sdev, &sensors);
> +	if (status)
> +		return status;
> +
> +	ssam_temp = devm_kzalloc(&sdev->dev, sizeof(*ssam_temp), GFP_KERNEL);
> +	if (!ssam_temp)
> +		return -ENOMEM;
> +
> +	ssam_temp->sdev = sdev;
> +	ssam_temp->sensors = sensors;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&sdev->dev,
> +			"surface_thermal", ssam_temp, &ssam_temp_hwmon_chip_info,
> +			NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	return 0;
> +}
> +
> +static const struct ssam_device_id ssam_temp_match[] = {
> +	{ SSAM_SDEV(TMP, SAM, 0x00, 0x02) },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(ssam, ssam_temp_match);
> +
> +static struct ssam_device_driver ssam_temp = {
> +	.probe = ssam_temp_probe,
> +	.match_table = ssam_temp_match,
> +	.driver = {
> +		.name = "surface_temp",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_ssam_device_driver(ssam_temp);
> +
> +MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
> +MODULE_DESCRIPTION("Thermal sensor subsystem driver for Surface System Aggregator Module");
> +MODULE_LICENSE("GPL");



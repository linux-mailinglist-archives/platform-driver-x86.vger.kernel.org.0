Return-Path: <platform-driver-x86+bounces-4894-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2A956971
	for <lists+platform-driver-x86@lfdr.de>; Mon, 19 Aug 2024 13:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE911C2168B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 19 Aug 2024 11:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2598166F07;
	Mon, 19 Aug 2024 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnSxAI55"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A91667C7
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067432; cv=none; b=Zd2raQ+Y7pVUNFPUujyE4VYGufuJzsCWoUKo4WVzUhQ/WVuAH6XrmqTDCssYtf+adTBekSPPF+eEWZFr9fTPDos2oLRgfbQOB7tXL8KeX/dOk2dJeNfqw3R07dBxUVFx3qrwRisHwpXyuzCOzXS1Ldha83yq1bX79MaCc2hIVWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067432; c=relaxed/simple;
	bh=opTswjUzHppgEeloIcv07JHGBQ7IAkSFD3TNPDbUU80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVSvJCXS1vQXY2TE0eFqnOxeeLKnoZreSTVoJRtPrzY+5cfphxQmh5K6K0stspFSAUT1nJ8ZmH/fDlyl6hRMtOLClWIgmJfiDay0m39EEQfJxsAJkne5qGOZ00uNBVt3lo76vtp4IJuP+ywCaZBfh+5ql/DKVnLj/rVQhX5PLPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnSxAI55; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724067429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aASggTj8zScZUAMVRuTxe/1yeuEnr9EhJsxLPCIt2Tk=;
	b=RnSxAI55+fpT80pVcHXUG3CSKEzZ82kJZdID54r/xC8//DfGt72LFlAXQd90EPE1ebMp+z
	s9RS2QCqy/z5Qnh2cN+8qphEoZTl5GOOTDWbB2RGlBu9+T1QwGC+ZFlfaFUFeE5Y/ExAIw
	4xljdJ/Dt8ODIHs5aldtQ+KJbysHt6M=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-whiXY1vJNo-15IavM99phA-1; Mon, 19 Aug 2024 07:37:08 -0400
X-MC-Unique: whiXY1vJNo-15IavM99phA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52f00c27b9cso3734091e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 04:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724067427; x=1724672227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aASggTj8zScZUAMVRuTxe/1yeuEnr9EhJsxLPCIt2Tk=;
        b=mJSGZpFvrq8tCXJyH4v9/MNkS5/b8obuT7kWyhE99+DLbo9Z1JSDhyMhdFiVo5ovHU
         /NyVPU6B+3+trQy3puzcxOnrWLLOcMk+bEsMM5ybwFk61EZ/7x989UK99CrCWuiFvsHB
         Dnd7enU/COoReWbiJAkLjiYWm0NHPGkE9OCFV8N1dG/htLGKIeFARDzcSR05Ay0kTmOx
         1EjZhA5TZCqQ5M3Ul5iB+WbH9ZYB36z5bZPc9prBOE8rVqqewilxVQ8Twi82vjx+XHCQ
         P0vrPUmyuezlTzCxonbIAtz1oINmXML08lr3b0pxAq0ex9SGBT/ptXvGXHec7/V+GHnT
         6Iwg==
X-Forwarded-Encrypted: i=1; AJvYcCUF2IJkh2cPeF8InY7VabkbVA5g4adJ5H9i6RSq36MEWKetXQg8sYIIdCDzUUgaPT7vhWLg1oYfPe0TVolam62BAcNcRHoDVecQ+ilVLD2KsQ/QVA==
X-Gm-Message-State: AOJu0Ywnvfj2W+oxrb0ss9QwsA+Gu7XitJMhmRVOS3FPeVYQcjBGjL28
	65rEWPs5VYvaUIyeitqMcRCeihmR1UpppMqQpI9Gpq/YfhqqP7gUFHraaGmo+fPBQylB5NB3FjY
	NJAQPqIwEMgVqF9ERAAeZI8gSk5iUxKkklE9u1Tq39bsc4IG6edpjyxHsxPMRVEAHPBKvLRpPHs
	Mvzu4=
X-Received: by 2002:a05:6512:3a82:b0:52e:be50:9c55 with SMTP id 2adb3069b0e04-5331c6e9741mr7698987e87.52.1724067426746;
        Mon, 19 Aug 2024 04:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIOifAQMPVPESrzfbzw8SGRMWYm/N0EKOvxL6PgC0QCoDMGgF5j2CYJuukUYvZTYYfF+aaqA==
X-Received: by 2002:a05:6512:3a82:b0:52e:be50:9c55 with SMTP id 2adb3069b0e04-5331c6e9741mr7698963e87.52.1724067426137;
        Mon, 19 Aug 2024 04:37:06 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6b07sm626920766b.30.2024.08.19.04.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:37:05 -0700 (PDT)
Message-ID: <bb7926e9-759b-4899-b616-c8c7ffcc9a55@redhat.com>
Date: Mon, 19 Aug 2024 13:37:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: lg-laptop: Add operation region support
To: Armin Wolf <W_Armin@gmx.de>, matan@svgalib.org, ghostwind@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240813022903.20567-1-W_Armin@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240813022903.20567-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/13/24 4:29 AM, Armin Wolf wrote:
> The LEGX0820 ACPI device is expected to provide a custom operation
> region:
> 
> 	OperationRegion (XIN1, 0x8F, Zero, 0x04B0)
>         Field (XIN1, AnyAcc, Lock, Preserve)
>         {
>             DMSG,   8,
>             HDAP,   8,
>             Offset (0x03),
>             AFNM,   8,
>             Offset (0x10),
>             P80B,   8,
>             P81B,   8,
>             P82B,   8,
>             P83B,   8,
>             P84B,   8,
>             P85B,   8,
>             P86B,   8,
>             P87B,   8,
>             Offset (0x20),
>             DTTM,   8,
>             TMP1,   8,
>             LTP1,   8,
>             HTP1,   8,
>             TMP2,   8,
>             LTP2,   8,
>             HTP2,   8,
>             Offset (0x3E8),
>             PMSG,   1600
>         }
> 
> The PMSG field is used by AML code to log debug messages when DMSG is
> true. Since those debug messages are already logged using the standard
> ACPI Debug object, we set DMSG unconditionally to 0x00 and ignore any
> writes to PMSG.
> 
> The TMPx, LTPx, HTPx and AFNM fields are used to inform the driver when
> the temperature/(presumably) trip points/fan mode changes. This only
> happens when the DTTM flag is set.
> 
> Unfortunately we have to implement support for this operation region
> because the AML codes uses code constructs like this one:
> 
> 	If (((\_SB.XINI.PLAV != Zero) && (\_SB.XINI.DTTM != Zero)))
> 
> The PLAV field gets set to 1 when the driver registers its address space
> handler, so by default XIN1 should not be accessed.
> 
> However ACPI does not use short-circuit evaluation when evaluating
> logical conditions. This causes the DTTM field to be accessed even
> when PLAV is 0, which results in an ACPI error.
> Since this check happens inside various thermal-related ACPI control
> methods, various thermal zone become unusable since any attempt to
> read their temperature results in an ACPI error.
> 
> Fix this by providing support for this operation region. I suspect
> that the problem does not happen under Windows (which seemingly does
> not use short-circuit evaluation either) because the necessary driver
> comes preinstalled with the machine.
> 
> Tested-by: Chris <ghostwind@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
> Changes since v1:
>  - attempts -> attempt
>  - sort defines in numerical order
>  - make lg_laptop_address_space_write() take a plain u64
>  - use BITS_PER_BYTE
>  - manually check fw_debug when handling fan mode updates
> ---
>  drivers/platform/x86/lg-laptop.c | 136 +++++++++++++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index 9c7857842caf..55d31d4fefd6 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -8,6 +8,9 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
>  #include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/dmi.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> @@ -31,6 +34,26 @@ MODULE_AUTHOR("Matan Ziv-Av");
>  MODULE_DESCRIPTION("LG WMI Hotkey Driver");
>  MODULE_LICENSE("GPL");
> 
> +static bool fw_debug;
> +module_param(fw_debug, bool, 0);
> +MODULE_PARM_DESC(fw_debug, "Enable printing of firmware debug messages");
> +
> +#define LG_ADDRESS_SPACE_ID			0x8F
> +
> +#define LG_ADDRESS_SPACE_DEBUG_FLAG_ADR		0x00
> +#define LG_ADDRESS_SPACE_FAN_MODE_ADR		0x03
> +
> +#define LG_ADDRESS_SPACE_DTTM_FLAG_ADR		0x20
> +#define LG_ADDRESS_SPACE_CPU_TEMP_ADR		0x21
> +#define LG_ADDRESS_SPACE_CPU_TRIP_LOW_ADR	0x22
> +#define LG_ADDRESS_SPACE_CPU_TRIP_HIGH_ADR	0x23
> +#define LG_ADDRESS_SPACE_MB_TEMP_ADR		0x24
> +#define LG_ADDRESS_SPACE_MB_TRIP_LOW_ADR	0x25
> +#define LG_ADDRESS_SPACE_MB_TRIP_HIGH_ADR	0x26
> +
> +#define LG_ADDRESS_SPACE_DEBUG_MSG_START_ADR	0x3E8
> +#define LG_ADDRESS_SPACE_DEBUG_MSG_END_ADR	0x5E8
> +
>  #define WMI_EVENT_GUID0	"E4FB94F9-7F2B-4173-AD1A-CD1D95086248"
>  #define WMI_EVENT_GUID1	"023B133E-49D1-4E10-B313-698220140DC2"
>  #define WMI_EVENT_GUID2	"37BE1AC0-C3F2-4B1F-BFBE-8FDEAF2814D6"
> @@ -646,6 +669,107 @@ static struct platform_driver pf_driver = {
>  	}
>  };
> 
> +static acpi_status lg_laptop_address_space_write(struct device *dev, acpi_physical_address address,
> +						 size_t size, u64 value)
> +{
> +	u8 byte;
> +
> +	/* Ignore any debug messages */
> +	if (address >= LG_ADDRESS_SPACE_DEBUG_MSG_START_ADR &&
> +	    address <= LG_ADDRESS_SPACE_DEBUG_MSG_END_ADR)
> +		return AE_OK;
> +
> +	if (size != sizeof(byte))
> +		return AE_BAD_PARAMETER;
> +
> +	byte = value & 0xFF;
> +
> +	switch (address) {
> +	case LG_ADDRESS_SPACE_FAN_MODE_ADR:
> +		/*
> +		 * The fan mode field is not affected by the DTTM flag, so we
> +		 * have to manually check fw_debug.
> +		 */
> +		if (fw_debug)
> +			dev_dbg(dev, "Fan mode set to mode %u\n", byte);
> +
> +		return AE_OK;
> +	case LG_ADDRESS_SPACE_CPU_TEMP_ADR:
> +		dev_dbg(dev, "CPU temperature is %u °C\n", byte);
> +		return AE_OK;
> +	case LG_ADDRESS_SPACE_CPU_TRIP_LOW_ADR:
> +		dev_dbg(dev, "CPU lower trip point set to %u °C\n", byte);
> +		return AE_OK;
> +	case LG_ADDRESS_SPACE_CPU_TRIP_HIGH_ADR:
> +		dev_dbg(dev, "CPU higher trip point set to %u °C\n", byte);
> +		return AE_OK;
> +	case LG_ADDRESS_SPACE_MB_TEMP_ADR:
> +		dev_dbg(dev, "Motherboard temperature is %u °C\n", byte);
> +		return AE_OK;
> +	case LG_ADDRESS_SPACE_MB_TRIP_LOW_ADR:
> +		dev_dbg(dev, "Motherboard lower trip point set to %u °C\n", byte);
> +		return AE_OK;
> +	case LG_ADDRESS_SPACE_MB_TRIP_HIGH_ADR:
> +		dev_dbg(dev, "Motherboard higher trip point set to %u °C\n", byte);
> +		return AE_OK;
> +	default:
> +		dev_notice_ratelimited(dev, "Ignoring write to unknown opregion address %llu\n",
> +				       address);
> +		return AE_OK;
> +	}
> +}
> +
> +static acpi_status lg_laptop_address_space_read(struct device *dev, acpi_physical_address address,
> +						size_t size, u64 *value)
> +{
> +	if (size != 1)
> +		return AE_BAD_PARAMETER;
> +
> +	switch (address) {
> +	case LG_ADDRESS_SPACE_DEBUG_FLAG_ADR:
> +		/* Debug messages are already printed using the standard ACPI Debug object */
> +		*value = 0x00;
> +		return AE_OK;
> +	case LG_ADDRESS_SPACE_DTTM_FLAG_ADR:
> +		*value = fw_debug;
> +		return AE_OK;
> +	default:
> +		dev_notice_ratelimited(dev, "Attempt to read unknown opregion address %llu\n",
> +				       address);
> +		return AE_BAD_PARAMETER;
> +	}
> +}
> +
> +static acpi_status lg_laptop_address_space_handler(u32 function, acpi_physical_address address,
> +						   u32 bits, u64 *value, void *handler_context,
> +						   void *region_context)
> +{
> +	struct device *dev = handler_context;
> +	size_t size;
> +
> +	if (bits % BITS_PER_BYTE)
> +		return AE_BAD_PARAMETER;
> +
> +	size = bits / BITS_PER_BYTE;
> +
> +	switch (function) {
> +	case ACPI_READ:
> +		return lg_laptop_address_space_read(dev, address, size, value);
> +	case ACPI_WRITE:
> +		return lg_laptop_address_space_write(dev, address, size, *value);
> +	default:
> +		return AE_BAD_PARAMETER;
> +	}
> +}
> +
> +static void lg_laptop_remove_address_space_handler(void *data)
> +{
> +	struct acpi_device *device = data;
> +
> +	acpi_remove_address_space_handler(device->handle, LG_ADDRESS_SPACE_ID,
> +					  &lg_laptop_address_space_handler);
> +}
> +
>  static int acpi_add(struct acpi_device *device)
>  {
>  	struct platform_device_info pdev_info = {
> @@ -653,6 +777,7 @@ static int acpi_add(struct acpi_device *device)
>  		.name = PLATFORM_NAME,
>  		.id = PLATFORM_DEVID_NONE,
>  	};
> +	acpi_status status;
>  	int ret;
>  	const char *product;
>  	int year = 2017;
> @@ -660,6 +785,17 @@ static int acpi_add(struct acpi_device *device)
>  	if (pf_device)
>  		return 0;
> 
> +	status = acpi_install_address_space_handler(device->handle, LG_ADDRESS_SPACE_ID,
> +						    &lg_laptop_address_space_handler,
> +						    NULL, &device->dev);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	ret = devm_add_action_or_reset(&device->dev, lg_laptop_remove_address_space_handler,
> +				       device);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = platform_driver_register(&pf_driver);
>  	if (ret)
>  		return ret;
> --
> 2.39.2
> 



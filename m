Return-Path: <platform-driver-x86+bounces-2252-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D993588A9F9
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 17:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDC61F67B33
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 16:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1071524B1;
	Mon, 25 Mar 2024 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gCx7XhtF"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F00548F5
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378980; cv=none; b=Xax+n5K/6JNg8PDvYk0/E9B+zGMS4no6nrI8XaXJTWs9Km1/giuLuMoqQ+3YA5bPchpq1BMxtaCct9Ai+yN/0SARGXgqUlPrGsVZ5hnicbtIjDzN0o6nePJEUWjbWUXj9/T8PTIljbeydu1U/nsBeX/OIBJRJKwgFbO+9+Xfpxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378980; c=relaxed/simple;
	bh=3dXPudPDiikRoCmhjxwcnF2sBV5x9RGjFXzLDmPO4wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NlhsjnjA9RYc0Ohlm9GTHQdJSdzJvJfReYNEP99XtfWjqjQXEskOz8z/ZViI51lpbTsr/lbknmJEdN6cYi2cWdUmVMEYaJ2xLOptAN+SONf2P0rmZ1lVsEcBVJTgMz+cZpnHgeC/w03L2cpMX+tlzss0mBAQpDPWdlsl+hebV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gCx7XhtF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymuBJTSOSA/JwVj1Mt7QO1lgQl0vxdz5zB3wolFGHyo=;
	b=gCx7XhtF15EaYX96SN74zTpbmNs/mU3tGS7fhenEJZbTiYT4HZ8iUvEW+1buYGFw3MKJOy
	k6+266Hq+Jc08k5ZUJSiQgaGTvbmsjGNhOF51ekpKvmfC7coV/3Xuaja0/OnNpM8syEEBv
	n30wxsmy6p2jg7PvsT+jqaTnf2GD+sY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-LC5GQou-Ps2JadPLjUAW8w-1; Mon, 25 Mar 2024 11:02:56 -0400
X-MC-Unique: LC5GQou-Ps2JadPLjUAW8w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4751b21400so139322166b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 08:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378975; x=1711983775;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymuBJTSOSA/JwVj1Mt7QO1lgQl0vxdz5zB3wolFGHyo=;
        b=cAox8DgD85/nC87xtayTzhc+x/4Y76cVtakLA8kTbudg9InMX97iEZNECU1K+rhc5s
         YiQOWmTggMjSk4gpFO+gfve+u7CRLMmqJm5Sc30QH3pjtsBpEmLWGBt7kkOdXfr6rbpG
         rdra+W1ZvtXxMGGq7yBCJ2bw80mU2ORNtZ83Nb/KBTnONmQOSe8rmcBq6TuDo1c4eE6g
         y+fJKXuGmko8gGVfNnlX4riIulkf2odJkT8AvUfifSVFvgVRf8DvXi3hMQFJMyPjcTvb
         qn2KwcJnNFJrq+TPLj8sYGHibxbPnaJFApuEuS/KMOyo7L5ZN1Q8wJ4/o4x5tKnm1WiU
         bLeg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Jfu1qPRqVEASzNM1Pe5L9JhAHzjqylZCrgnXmD6OVvCS0czPiwftlavWWFLzuSOarfyiH8xue/c1Ri7fhvXeXQfQhyVUMKjtobYXStGqcwKQjw==
X-Gm-Message-State: AOJu0Yz3gfuwwcEe3QkzakmJYPoefB5KUGWSfKX8oaJYF4UjhNDbPwOz
	bLfNvyGXoDA4rfzUIocUxdxDmfgjjbHcVXy3TKS53RGuCaRanASDGh9jgnsp2HvsTOC3krdfKXC
	AuddiIMqDhkxSX/jGRDuz818lmTCzbmnLz1MS0YYT7paMErKWaD7Iie9EGx1l6blsTd+IeG9QL1
	SkEY0=
X-Received: by 2002:a17:906:6b83:b0:a46:9be4:6037 with SMTP id l3-20020a1709066b8300b00a469be46037mr5199800ejr.30.1711378975239;
        Mon, 25 Mar 2024 08:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRliyMh0OVVZZMKE0TcTP2JC+IOgLryOmuAHHv4q8iPu/gRjj/ho94j8IwW1MhFqK5TMgD7g==
X-Received: by 2002:a17:906:6b83:b0:a46:9be4:6037 with SMTP id l3-20020a1709066b8300b00a469be46037mr5199776ejr.30.1711378974884;
        Mon, 25 Mar 2024 08:02:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b00a46d4e26301sm3117038ejk.27.2024.03.25.08.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 08:02:54 -0700 (PDT)
Message-ID: <bb7536be-9bed-4557-b111-6409ebfe48f4@redhat.com>
Date: Mon, 25 Mar 2024 16:02:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
Content-Language: en-US, nl
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-pm@vger.kernel.org
References: <20240322033736.9344-1-hpa@redhat.com>
 <20240322033736.9344-2-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240322033736.9344-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

On 3/22/24 4:37 AM, Kate Hsuan wrote:
> There is a KTD2026 LED controller to manage the indicator LED for Xiaomi
> pad2. The ACPI for it is not properly made so the kernel can't get
> a correct description of it.
> 
> This work add a description for this RGB LED controller and also set a
> trigger to indicate the chaging event (bq27520-0-charging). When it is
> charging, the indicator LED will be turn on.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also merge [PATCH v5 6/6] platform: x86-android-tablets:
others: Set the LED trigger to charging_red_full_green for Xiaomi pad2"

Once the new power_supply trigger patch this relies on has been
accepted.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  .../platform/x86/x86-android-tablets/other.c  | 82 +++++++++++++++++++
>  .../x86/x86-android-tablets/shared-psy-info.h |  2 +
>  2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index bc6bbf7ec6ea..1012a158f7b7 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -13,6 +13,8 @@
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  
> +#include <dt-bindings/leds/common.h>
> +
>  #include "shared-psy-info.h"
>  #include "x86-android-tablets.h"
>  
> @@ -593,6 +595,83 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
>  	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
>  };
>  
> +/*
> + * The fwnode for ktd2026 on Xaomi pad2. It composed of a RGB LED node
> + * with three subnodes for each color (B/G/R). The RGB LED node is named
> + * "multi-led" to align with the name in the device tree.
> + */
> +
> +/* main fwnode for ktd2026 */
> +static const struct software_node ktd2026_node = {
> +	.name = "ktd2026"
> +};
> +
> +static const struct property_entry ktd2026_rgb_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> +	PROPERTY_ENTRY_STRING("function", "indicator"),
> +	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging"),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_rgb_led_node = {
> +	.name = "multi-led",
> +	.properties = ktd2026_rgb_led_props,
> +	.parent = &ktd2026_node,
> +};
> +
> +static const struct property_entry ktd2026_blue_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_blue_led_node = {
> +	.properties = ktd2026_blue_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +static const struct property_entry ktd2026_green_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 1),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_GREEN),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_green_led_node = {
> +	.properties = ktd2026_green_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +static const struct property_entry ktd2026_red_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 2),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_red_led_node = {
> +	.properties = ktd2026_red_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +static const struct software_node *ktd2026_node_group[] = {
> +	&ktd2026_node,
> +	&ktd2026_rgb_led_node,
> +	&ktd2026_green_led_node,
> +	&ktd2026_blue_led_node,
> +	&ktd2026_red_led_node,
> +	NULL
> +};
> +
> +static int __init xiaomi_mipad2_init(void)
> +{
> +	return software_node_register_node_group(ktd2026_node_group);
> +}
> +
> +static void xiaomi_mipad2_exit(void)
> +{
> +	software_node_unregister_node_group(ktd2026_node_group);
> +}
> +
>  /*
>   * If the EFI bootloader is not Xiaomi's own signed Android loader, then the
>   * Xiaomi Mi Pad 2 X86 tablet sets OSID in the DSDT to 1 (Windows), causing
> @@ -616,6 +695,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
>  			.type = "ktd2026",
>  			.addr = 0x30,
>  			.dev_name = "ktd2026",
> +			.swnode = &ktd2026_node,
>  		},
>  		.adapter_path = "\\_SB_.PCI0.I2C3",
>  	},
> @@ -624,4 +704,6 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
>  const struct x86_dev_info xiaomi_mipad2_info __initconst = {
>  	.i2c_client_info = xiaomi_mipad2_i2c_clients,
>  	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
> +	.init = xiaomi_mipad2_init,
> +	.exit = xiaomi_mipad2_exit,
>  };
> diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> index c2d2968cddc2..8c33ec47ee12 100644
> --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> @@ -29,4 +29,6 @@ extern const char * const bq24190_modules[];
>  extern const struct platform_device_info int3496_pdevs[];
>  extern struct gpiod_lookup_table int3496_reference_gpios;
>  
> +extern const struct software_node ktd2026_leds_node;
> +
>  #endif



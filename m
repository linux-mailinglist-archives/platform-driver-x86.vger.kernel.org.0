Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE236735B0
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Jan 2023 11:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjASKhx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 19 Jan 2023 05:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjASKha (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2023 05:37:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1357494B
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674124551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dhwADmbCrhy/D6znLuGz4gejzrLgJETtIQoT0PGUu4A=;
        b=WkuC54w7c9cpzKXNNlfSY4zIQJVEUfn1El9ldpSdgTp5G97FFbPZ9jhBSkl8psGqM4j71o
        le5hu66SEmf3gh+V+1zSHsUCa3S+hBMyrZ8N4VMfp6UWgWP47WPItLUrSfCc1ldZRVwDVX
        uE5qIPBsyXT8NcjAFYN3RA8dzZZgYs8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-XATJS45XOo-V4HS801BNlw-1; Thu, 19 Jan 2023 05:35:49 -0500
X-MC-Unique: XATJS45XOo-V4HS801BNlw-1
Received: by mail-ej1-f71.google.com with SMTP id du14-20020a17090772ce00b0087108bbcfa6so1304926ejc.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 02:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhwADmbCrhy/D6znLuGz4gejzrLgJETtIQoT0PGUu4A=;
        b=ux6A3OzmYdLBYl01bAn/BECtdBJvf/eSF3V8V5Pd/RDttDtisY01yYx9ZlSFAkNXX4
         7iHniJEn0M34nEJrTJTBRZ1VI7gqDk95HKcmbSk1uhaQRxDAyiyehPatbcuRogDMRrJq
         pV5WEeLsQi1/GN7yqiwObbr+83qW1pc5hKYqtVZFJ5HIoVnIM9w3x/GxjYOSB737JXGe
         ebiun5jVqYqA85744RXh1/xQvtULFvgJwVZKeb6xIBH6j8nzY8Re4ra/WiEqfWWV0xYb
         IiWRrcsL7dP5pF7Hc+sEJ4isUlCh2zsKc7/or9W/w+v9DwIxFyKjkTEoNSRkjEJS+CwC
         ZPMw==
X-Gm-Message-State: AFqh2koZ8qYBItpmxd+trGMQxzp6priEawF4pF+oMx2k1B/gtYpfoBuX
        1VUivytvgtEdd2GYebqmfgGM9rH8KGJyXnOf0rupcOYdh+X1bpsLfCkllrO+bSc50AqCfgD+wxF
        DFNmtRenQNE4EIOBmNyB94RVw2hf8Z3Tl5A==
X-Received: by 2002:a05:6402:27cf:b0:46b:4011:9863 with SMTP id c15-20020a05640227cf00b0046b40119863mr14120402ede.39.1674124547900;
        Thu, 19 Jan 2023 02:35:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupVieluxolhh9qicdaSnuvo9lEAP7+qJh8leiAz45wglTkSB28/+4y1/Oo5maZQhFqOfFJKw==
X-Received: by 2002:a05:6402:27cf:b0:46b:4011:9863 with SMTP id c15-20020a05640227cf00b0046b40119863mr14120389ede.39.1674124547657;
        Thu, 19 Jan 2023 02:35:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fj18-20020a0564022b9200b0049e376abe96sm3278259edb.67.2023.01.19.02.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:35:47 -0800 (PST)
Message-ID: <a66ef11e-5b8a-2b32-42a6-261b0fc645dc@redhat.com>
Date:   Thu, 19 Jan 2023 11:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: en-US, nl
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230113231139.436956-1-philipp@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Philip,

One more remark.

On 1/14/23 00:11, Philip Prindeville wrote:
> From: Philip Prindeville <philipp@redfish-solutions.com>

I believe part of this code (the APU5 or APU6 bits?) are from
Ed Wildgoose right?

Then Ed Wildgoose should be set as author for that part,
you can use:

git commit --amend --author="Ed Wildgoose <lists@wildgooses.com>"

to set the author (of your last commit).

> 
> PCEngines make a number of SBC. APU5 has 5 mpcie slots + MSATA
> It also has support for 3x LTE modems with 6x SIM slots (pairs with a
> SIM switch device). Each mpcie slot for modems has a reset GPIO
> 
> To ensure that the naming is sane between APU2-6 the GPIOS are
> renamed to be modem1-reset, modem2-reset, etc. This is significant
> because the slots that can be reset change between APU2 and APU3/4
> 
> GPIO for simswap is moved to the end of the list as it could be dropped
> for APU2 boards (but causes no harm to leave it in, hardware could be
> added to a future rev of the board).
> 
> Structure of the GPIOs for APU5 is extremely similar to APU2-4, but
> many lines are moved around and there are simply more
> modems/resets/sim-swap lines to breakout.
> 
> Also added APU6, which is essentially APU4 with a different ethernet
> interface and SFP cage on eth0.
> 
> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> Reviewed-by: Philip Prindeville <philipp@redfish-solutions.com>
> Reviewed-by: Andreas Eberlein <foodeas@aeberlein.de>
> Reviewed-by: Paul Spooren <paul@spooren.de>

This is missing your Signed-off-by, since this code has passed through
your hands (and might even have been modified by you) this needs both
Ed's S-o-b as well as yours.

And if you have made significant changes, you can / may want to also
add a Co-authored-by. So in essence that would mean adding these
2 tags:

Co-authored-by: Philip Prindeville <philipp@redfish-solutions.com>
Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>

I see that you have also added a Reviewed-by: Philip Prindeville,
that is fine if you are just forwarding code upstream (with maybe
some small changes but nothing significant). If you have made
significant changes however then adding a Reviewed-by to your own
work is a bit strange.

Regards,

Hans





> ---
>  drivers/platform/x86/pcengines-apuv2.c | 113 ++++++++++++++++++++++---
>  1 file changed, 99 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index d063d91db9bcbe5ceb2ac641d3105df37651ac4d..8731564bab62c1e47e99adb6ec23b3de81b09069 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -1,10 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  /*
> - * PC-Engines APUv2/APUv3 board platform driver
> + * PC-Engines APUv2-6 board platform driver
>   * for GPIO buttons and LEDs
>   *
>   * Copyright (C) 2018 metux IT consult
> + * Copyright (C) 2022 Ed Wildgoose <lists@wildgooses.com>
>   * Author: Enrico Weigelt <info@metux.net>
>   */
>  
> @@ -22,38 +23,70 @@
>  #include <linux/platform_data/gpio/gpio-amd-fch.h>
>  
>  /*
> - * NOTE: this driver only supports APUv2/3 - not APUv1, as this one
> + * NOTE: this driver only supports APUv2-6 - not APUv1, as this one
>   * has completely different register layouts.
>   */
>  
> +/*
> + * There are a number of APU variants, with differing features
> + * APU2 has SIM slots 1/2 mapping to mPCIe sockets 1/2
> + * APU3/4 moved SIM slot 1 to mPCIe socket 3, ie logically reversed
> + * However, most APU3/4 have a SIM switch which we default on to reverse
> + * the order and keep physical SIM order matching physical modem order
> + * APU6 is approximately the same as APU4 with different ethernet layout
> + *
> + * APU5 has 3x SIM sockets, all with a SIM switch
> + * several GPIOs are shuffled (see schematic), including MODESW
> + */
> +
>  /* Register mappings */
>  #define APU2_GPIO_REG_LED1		AMD_FCH_GPIO_REG_GPIO57
>  #define APU2_GPIO_REG_LED2		AMD_FCH_GPIO_REG_GPIO58
>  #define APU2_GPIO_REG_LED3		AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>  #define APU2_GPIO_REG_MODESW		AMD_FCH_GPIO_REG_GPIO32_GE1
>  #define APU2_GPIO_REG_SIMSWAP		AMD_FCH_GPIO_REG_GPIO33_GE2
> -#define APU2_GPIO_REG_MPCIE2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> -#define APU2_GPIO_REG_MPCIE3		AMD_FCH_GPIO_REG_GPIO51
> +#define APU2_GPIO_REG_RESETM1		AMD_FCH_GPIO_REG_GPIO51
> +#define APU2_GPIO_REG_RESETM2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> +
> +#define APU5_GPIO_REG_MODESW		AMT_FCH_GPIO_REG_GEVT22
> +#define APU5_GPIO_REG_SIMSWAP1		AMD_FCH_GPIO_REG_GPIO68
> +#define APU5_GPIO_REG_SIMSWAP2		AMD_FCH_GPIO_REG_GPIO32_GE1
> +#define APU5_GPIO_REG_SIMSWAP3		AMD_FCH_GPIO_REG_GPIO33_GE2
> +#define APU5_GPIO_REG_RESETM1		AMD_FCH_GPIO_REG_GPIO51
> +#define APU5_GPIO_REG_RESETM2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> +#define APU5_GPIO_REG_RESETM3		AMD_FCH_GPIO_REG_GPIO64
>  
>  /* Order in which the GPIO lines are defined in the register list */
>  #define APU2_GPIO_LINE_LED1		0
>  #define APU2_GPIO_LINE_LED2		1
>  #define APU2_GPIO_LINE_LED3		2
>  #define APU2_GPIO_LINE_MODESW		3
> -#define APU2_GPIO_LINE_SIMSWAP		4
> -#define APU2_GPIO_LINE_MPCIE2		5
> -#define APU2_GPIO_LINE_MPCIE3		6
> +#define APU2_GPIO_LINE_RESETM1		4
> +#define APU2_GPIO_LINE_RESETM2		5
> +#define APU2_GPIO_LINE_SIMSWAP		6
> +
> +#define APU5_GPIO_LINE_LED1		0
> +#define APU5_GPIO_LINE_LED2		1
> +#define APU5_GPIO_LINE_LED3		2
> +#define APU5_GPIO_LINE_MODESW		3
> +#define APU5_GPIO_LINE_RESETM1		4
> +#define APU5_GPIO_LINE_RESETM2		5
> +#define APU5_GPIO_LINE_RESETM3		6
> +#define APU5_GPIO_LINE_SIMSWAP1		7
> +#define APU5_GPIO_LINE_SIMSWAP2		8
> +#define APU5_GPIO_LINE_SIMSWAP3		9
>  
> -/* GPIO device */
> +
> +/* GPIO device - APU2/3/4/6 */
>  
>  static int apu2_gpio_regs[] = {
>  	[APU2_GPIO_LINE_LED1]		= APU2_GPIO_REG_LED1,
>  	[APU2_GPIO_LINE_LED2]		= APU2_GPIO_REG_LED2,
>  	[APU2_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
>  	[APU2_GPIO_LINE_MODESW]		= APU2_GPIO_REG_MODESW,
> +	[APU2_GPIO_LINE_RESETM1]	= APU2_GPIO_REG_RESETM1,
> +	[APU2_GPIO_LINE_RESETM2]	= APU2_GPIO_REG_RESETM2,
>  	[APU2_GPIO_LINE_SIMSWAP]	= APU2_GPIO_REG_SIMSWAP,
> -	[APU2_GPIO_LINE_MPCIE2]		= APU2_GPIO_REG_MPCIE2,
> -	[APU2_GPIO_LINE_MPCIE3]		= APU2_GPIO_REG_MPCIE3,
>  };
>  
>  static const char * const apu2_gpio_names[] = {
> @@ -61,9 +94,9 @@ static const char * const apu2_gpio_names[] = {
>  	[APU2_GPIO_LINE_LED2]		= "front-led2",
>  	[APU2_GPIO_LINE_LED3]		= "front-led3",
>  	[APU2_GPIO_LINE_MODESW]		= "front-button",
> +	[APU2_GPIO_LINE_RESETM1]	= "modem1-reset",
> +	[APU2_GPIO_LINE_RESETM2]	= "modem2-reset",
>  	[APU2_GPIO_LINE_SIMSWAP]	= "simswap",
> -	[APU2_GPIO_LINE_MPCIE2]		= "mpcie2_reset",
> -	[APU2_GPIO_LINE_MPCIE3]		= "mpcie3_reset",
>  };
>  
>  static const struct amd_fch_gpio_pdata board_apu2 = {
> @@ -72,6 +105,40 @@ static const struct amd_fch_gpio_pdata board_apu2 = {
>  	.gpio_names	= apu2_gpio_names,
>  };
>  
> +/* GPIO device - APU5 */
> +
> +static int apu5_gpio_regs[] = {
> +	[APU5_GPIO_LINE_LED1]		= APU2_GPIO_REG_LED1,
> +	[APU5_GPIO_LINE_LED2]		= APU2_GPIO_REG_LED2,
> +	[APU5_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
> +	[APU5_GPIO_LINE_MODESW]		= APU5_GPIO_REG_MODESW,
> +	[APU5_GPIO_LINE_RESETM1]	= APU5_GPIO_REG_RESETM1,
> +	[APU5_GPIO_LINE_RESETM2]	= APU5_GPIO_REG_RESETM2,
> +	[APU5_GPIO_LINE_RESETM3]	= APU5_GPIO_REG_RESETM3,
> +	[APU5_GPIO_LINE_SIMSWAP1]	= APU5_GPIO_REG_SIMSWAP1,
> +	[APU5_GPIO_LINE_SIMSWAP2]	= APU5_GPIO_REG_SIMSWAP2,
> +	[APU5_GPIO_LINE_SIMSWAP3]	= APU5_GPIO_REG_SIMSWAP3,
> +};
> +
> +static const char * const apu5_gpio_names[] = {
> +	[APU5_GPIO_LINE_LED1]		= "front-led1",
> +	[APU5_GPIO_LINE_LED2]		= "front-led2",
> +	[APU5_GPIO_LINE_LED3]		= "front-led3",
> +	[APU5_GPIO_LINE_MODESW]		= "front-button",
> +	[APU5_GPIO_LINE_RESETM1]	= "modem1-reset",
> +	[APU5_GPIO_LINE_RESETM2]	= "modem2-reset",
> +	[APU5_GPIO_LINE_RESETM3]	= "modem3-reset",
> +	[APU5_GPIO_LINE_SIMSWAP1]	= "simswap1",
> +	[APU5_GPIO_LINE_SIMSWAP2]	= "simswap2",
> +	[APU5_GPIO_LINE_SIMSWAP3]	= "simswap3",
> +};
> +
> +static const struct amd_fch_gpio_pdata board_apu5 = {
> +	.gpio_num	= ARRAY_SIZE(apu5_gpio_regs),
> +	.gpio_reg	= apu5_gpio_regs,
> +	.gpio_names	= apu5_gpio_names,
> +};
> +
>  /* GPIO LEDs device */
>  
>  static const struct gpio_led apu2_leds[] = {
> @@ -215,6 +282,24 @@ static const struct dmi_system_id apu_gpio_dmi_table[] __initconst = {
>  		},
>  		.driver_data = (void *)&board_apu2,
>  	},
> +	/* APU5 w/ mainline BIOS */
> +	{
> +		.ident		= "apu5",
> +		.matches	= {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "apu5")
> +		},
> +		.driver_data	= (void *)&board_apu5,
> +	},
> +	/* APU6 w/ mainline BIOS */
> +	{
> +		.ident		= "apu6",
> +		.matches	= {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "apu6")
> +		},
> +		.driver_data	= (void *)&board_apu2,
> +	},
>  	{}
>  };
>  
> @@ -249,7 +334,7 @@ static int __init apu_board_init(void)
>  
>  	id = dmi_first_match(apu_gpio_dmi_table);
>  	if (!id) {
> -		pr_err("failed to detect APU board via DMI\n");
> +		pr_err("No APU board detected via DMI\n");
>  		return -ENODEV;
>  	}
>  
> @@ -288,7 +373,7 @@ module_init(apu_board_init);
>  module_exit(apu_board_exit);
>  
>  MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
> -MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
> +MODULE_DESCRIPTION("PC Engines APUv2-6 board GPIO/LEDs/keys driver");
>  MODULE_LICENSE("GPL");
>  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
>  MODULE_ALIAS("platform:pcengines-apuv2");


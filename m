Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B0E6751A6
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Jan 2023 10:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjATJwv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Jan 2023 04:52:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjATJwu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 04:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D966B881DD
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 01:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674208289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UtVHgSiI7uKPUVWG/QDy5GNbFneEf1uStEkE1Tqg120=;
        b=bIh/MJENVi8oZQI8Ix47FLa/5HR9ZgAoq7QAbZb8xSuZG8R6oKW7GqQmB55iiVcqjO13IY
        n7fiH4+q3ab8IYALvOL9lPG74hp+/cQ2t1O0QS08Wm6qz482+vO7ZvYKmZ7ZhvcYDfof9i
        m5P9TR7a8OgC6Wim9trv1LNibERH+F8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-ohqxKbrhPgScbAqw-DF7ZA-1; Fri, 20 Jan 2023 04:51:26 -0500
X-MC-Unique: ohqxKbrhPgScbAqw-DF7ZA-1
Received: by mail-ej1-f69.google.com with SMTP id du14-20020a17090772ce00b0087108bbcfa6so3460758ejc.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 01:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtVHgSiI7uKPUVWG/QDy5GNbFneEf1uStEkE1Tqg120=;
        b=v79pijPRgIj4IE+zuu0HaHT66K5ap4NqtqzsVR8XGDPucp41Gl/jqwlOdHVdUDfCRc
         3ua+po6lW665gD55tNmwaE7XIL50J1oHMGbiUIhnFQumWmnqWdQVdFpIqd3N/+51nrKF
         NJF4/Y2DKdJYOZGulVYOO6PtkXgtqOmuanL9bSzHi2Gf7/5pQRBjqXnqsGYYbrzTxE7T
         +RIHq2QtP4epmBrJ7t9ajjyo3rLE1EV8JK9gaNMRxVDpesTaiMoeUVCE1+jljQbfwRS4
         4+QqgQFiaVZpXGyv6sRc7WJxVE2Ok8EaRbKTwzpGNk7D9lCbN/ZgTkiheY1KyKoAKIyq
         hKuw==
X-Gm-Message-State: AFqh2koCYd25p0wZqLEO7zXy0ZFeUcZCO4c9ZCGN/2JPTKeqsRfXx3+X
        +dqjB12MDPkVIMiiUEsNauzNjIDqOy95EfZGo3rW3BuvbiKtpGAwPWnPdNG/CAaI2OYZVNt7VCt
        EOG9Gu+RkXH/FsmR9FJouvdhGPTOmR1840Q==
X-Received: by 2002:a05:6402:1f14:b0:49e:36d6:dead with SMTP id b20-20020a0564021f1400b0049e36d6deadmr11866169edb.6.1674208285121;
        Fri, 20 Jan 2023 01:51:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhGhKloCPrMsYYIdUObAv4bu7bD6DMMYZxZMSnv1tmL3PR08eRe4+xywRWrZR8fcJB2gt0Jg==
X-Received: by 2002:a05:6402:1f14:b0:49e:36d6:dead with SMTP id b20-20020a0564021f1400b0049e36d6deadmr11866157edb.6.1674208284786;
        Fri, 20 Jan 2023 01:51:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7d889000000b00457b5ba968csm16900548edq.27.2023.01.20.01.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 01:51:24 -0800 (PST)
Message-ID: <f5bc50fb-c3ca-bcd3-2ce0-640002e4a2e7@redhat.com>
Date:   Fri, 20 Jan 2023 10:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: en-US, nl
To:     Philip Prindeville <philipp@redfish-solutions.com>
Cc:     platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <D31F4C6E-EB3E-43CB-8446-1CC36E9629B3@redfish-solutions.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <D31F4C6E-EB3E-43CB-8446-1CC36E9629B3@redfish-solutions.com>
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

Hi,

On 1/20/23 06:34, Philip Prindeville wrote:
> 
> 
>> On Jan 19, 2023, at 3:22 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/14/23 00:11, Philip Prindeville wrote:
>>> From: Philip Prindeville <philipp@redfish-solutions.com>
>>>
>>> PCEngines make a number of SBC. APU5 has 5 mpcie slots + MSATA
>>> It also has support for 3x LTE modems with 6x SIM slots (pairs with a
>>> SIM switch device). Each mpcie slot for modems has a reset GPIO
>>>
>>> To ensure that the naming is sane between APU2-6 the GPIOS are
>>> renamed to be modem1-reset, modem2-reset, etc. This is significant
>>> because the slots that can be reset change between APU2 and APU3/4
>>>
>>> GPIO for simswap is moved to the end of the list as it could be dropped
>>> for APU2 boards (but causes no harm to leave it in, hardware could be
>>> added to a future rev of the board).
>>>
>>> Structure of the GPIOs for APU5 is extremely similar to APU2-4, but
>>> many lines are moved around and there are simply more
>>> modems/resets/sim-swap lines to breakout.
>>>
>>> Also added APU6, which is essentially APU4 with a different ethernet
>>> interface and SFP cage on eth0.
>>>
>>> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
>>> Reviewed-by: Philip Prindeville <philipp@redfish-solutions.com>
>>> Reviewed-by: Andreas Eberlein <foodeas@aeberlein.de>
>>> Reviewed-by: Paul Spooren <paul@spooren.de>
>>> ---
>>> drivers/platform/x86/pcengines-apuv2.c | 113 ++++++++++++++++++++++---
>>> 1 file changed, 99 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
>>> index d063d91db9bcbe5ceb2ac641d3105df37651ac4d..8731564bab62c1e47e99adb6ec23b3de81b09069 100644
>>> --- a/drivers/platform/x86/pcengines-apuv2.c
>>> +++ b/drivers/platform/x86/pcengines-apuv2.c
>>> @@ -1,10 +1,11 @@
>>> // SPDX-License-Identifier: GPL-2.0+
>>>
>>> /*
>>> - * PC-Engines APUv2/APUv3 board platform driver
>>> + * PC-Engines APUv2-6 board platform driver
>>>  * for GPIO buttons and LEDs
>>>  *
>>>  * Copyright (C) 2018 metux IT consult
>>> + * Copyright (C) 2022 Ed Wildgoose <lists@wildgooses.com>
>>>  * Author: Enrico Weigelt <info@metux.net>
>>>  */
>>>
>>> @@ -22,38 +23,70 @@
>>> #include <linux/platform_data/gpio/gpio-amd-fch.h>
>>>
>>> /*
>>> - * NOTE: this driver only supports APUv2/3 - not APUv1, as this one
>>> + * NOTE: this driver only supports APUv2-6 - not APUv1, as this one
>>>  * has completely different register layouts.
>>>  */
>>>
>>> +/*
>>> + * There are a number of APU variants, with differing features
>>> + * APU2 has SIM slots 1/2 mapping to mPCIe sockets 1/2
>>> + * APU3/4 moved SIM slot 1 to mPCIe socket 3, ie logically reversed
>>> + * However, most APU3/4 have a SIM switch which we default on to reverse
>>> + * the order and keep physical SIM order matching physical modem order
>>> + * APU6 is approximately the same as APU4 with different ethernet layout
>>> + *
>>> + * APU5 has 3x SIM sockets, all with a SIM switch
>>> + * several GPIOs are shuffled (see schematic), including MODESW
>>> + */
>>> +
>>> /* Register mappings */
>>> #define APU2_GPIO_REG_LED1 AMD_FCH_GPIO_REG_GPIO57
>>> #define APU2_GPIO_REG_LED2 AMD_FCH_GPIO_REG_GPIO58
>>> #define APU2_GPIO_REG_LED3 AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>>> #define APU2_GPIO_REG_MODESW AMD_FCH_GPIO_REG_GPIO32_GE1
>>> #define APU2_GPIO_REG_SIMSWAP AMD_FCH_GPIO_REG_GPIO33_GE2
>>> -#define APU2_GPIO_REG_MPCIE2 AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
>>> -#define APU2_GPIO_REG_MPCIE3 AMD_FCH_GPIO_REG_GPIO51
>>> +#define APU2_GPIO_REG_RESETM1 AMD_FCH_GPIO_REG_GPIO51
>>> +#define APU2_GPIO_REG_RESETM2 AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
>>> +
>>> +#define APU5_GPIO_REG_MODESW AMT_FCH_GPIO_REG_GEVT22
>>> +#define APU5_GPIO_REG_SIMSWAP1 AMD_FCH_GPIO_REG_GPIO68
>>> +#define APU5_GPIO_REG_SIMSWAP2 AMD_FCH_GPIO_REG_GPIO32_GE1
>>> +#define APU5_GPIO_REG_SIMSWAP3 AMD_FCH_GPIO_REG_GPIO33_GE2
>>> +#define APU5_GPIO_REG_RESETM1 AMD_FCH_GPIO_REG_GPIO51
>>> +#define APU5_GPIO_REG_RESETM2 AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
>>> +#define APU5_GPIO_REG_RESETM3 AMD_FCH_GPIO_REG_GPIO64
>>>
>>> /* Order in which the GPIO lines are defined in the register list */
>>> #define APU2_GPIO_LINE_LED1 0
>>> #define APU2_GPIO_LINE_LED2 1
>>> #define APU2_GPIO_LINE_LED3 2
>>> #define APU2_GPIO_LINE_MODESW 3
>>> -#define APU2_GPIO_LINE_SIMSWAP 4
>>> -#define APU2_GPIO_LINE_MPCIE2 5
>>> -#define APU2_GPIO_LINE_MPCIE3 6
>>> +#define APU2_GPIO_LINE_RESETM1 4
>>> +#define APU2_GPIO_LINE_RESETM2 5
>>> +#define APU2_GPIO_LINE_SIMSWAP 6
>>
>> I don't think this changing of GPIO ordering, or
>> for that part the changing of the gpio_names from 
>> "mpcie2_reset" to "modem1-reset" is a good idea.
>>
>> I'm not entirely sure how these GPIOs are supposed to be
>> consumed / used by userspace. But since they are not used
>> directly in this driver I assume userspace is supposed to
>> use either the (deprecated) sysfs GPIO API or the new ioctl
>> based GPIO API to toggle say "simswap" if it needs to.
>>
>> The old sysfs API exclusively uses pin-indexes inside a GPIO
>> chip to select the pin, so by changing the pin order you
>> have just broken the userspace API.
>>
>> And the new ioctl API can use either pin-indexes or GPIO-line-names,
>> so by changing the names you have also just potentially broken
>> that.
>>
>> Please keep the order as is and only use the new names for
>> the newly added models (so for APU6 I believe).
>>
>> I guess that means adding a new apu6_gpio_names[]
>> array for APU6, that is fine.
>>
>> Note you can still do the "MPCIE2" -> "RESETM1" defines
>> if you want, to allow reusing the defines and the apu2_gpio_regs[]
>> array. But in order to not brake uAPI you must:
>>
>> 1. Not change the order of the pins
>> 2. Keep the "mpcie2_reset" and "mpcie3_reset" names for the
>>   already supported models.
>>
>> Also can you please split this patch into 2 patches,
>> 1 adding the APU5 support and one adding the APU6 support
>> (not necessarily in that order) ?
>>
>> Regards,
>>
>> Hans
>>
>>
>> p.s.
>>
>> About the bounces I'm getting bounces for linux-x86_64@vger.kernel.org
>> (dropped) but not for Enrico's email.
> 
> 
> I can't speak for Ed, but I've gotten pre-production boards in the past where the pin assignments have changed between the rev 0.1 board that I got to write drivers for and do BSP, and what went to production.

Sure hw vendors may do such things, but we are not talking hw here,
in this case the order in which we specify the data passed to
gpio_amd_fch is the pin order.

And normally it would be a bit doubtful if pin-order is part of
the userspace API, since normally the GPIOs are wrapped in
higher-level userspace APIs like e.g. rfkill. Which makes them
unavailable for userspace.

But in this case AFAICT the only API userspace has for the
simswap and modem-reset signals is "raw" GPIO access in
which case the ordering very much matters.

Regards,

Hans




>>> +
>>> +#define APU5_GPIO_LINE_LED1 0
>>> +#define APU5_GPIO_LINE_LED2 1
>>> +#define APU5_GPIO_LINE_LED3 2
>>> +#define APU5_GPIO_LINE_MODESW 3
>>> +#define APU5_GPIO_LINE_RESETM1 4
>>> +#define APU5_GPIO_LINE_RESETM2 5
>>> +#define APU5_GPIO_LINE_RESETM3 6
>>> +#define APU5_GPIO_LINE_SIMSWAP1 7
>>> +#define APU5_GPIO_LINE_SIMSWAP2 8
>>> +#define APU5_GPIO_LINE_SIMSWAP3 9
>>>
>>> -/* GPIO device */
>>> +
>>> +/* GPIO device - APU2/3/4/6 */
>>>
>>> static int apu2_gpio_regs[] = {
>>> [APU2_GPIO_LINE_LED1] = APU2_GPIO_REG_LED1,
>>> [APU2_GPIO_LINE_LED2] = APU2_GPIO_REG_LED2,
>>> [APU2_GPIO_LINE_LED3] = APU2_GPIO_REG_LED3,
>>> [APU2_GPIO_LINE_MODESW] = APU2_GPIO_REG_MODESW,
>>> + [APU2_GPIO_LINE_RESETM1] = APU2_GPIO_REG_RESETM1,
>>> + [APU2_GPIO_LINE_RESETM2] = APU2_GPIO_REG_RESETM2,
>>> [APU2_GPIO_LINE_SIMSWAP] = APU2_GPIO_REG_SIMSWAP,
>>> - [APU2_GPIO_LINE_MPCIE2] = APU2_GPIO_REG_MPCIE2,
>>> - [APU2_GPIO_LINE_MPCIE3] = APU2_GPIO_REG_MPCIE3,
>>> };
>>>
>>> static const char * const apu2_gpio_names[] = {
>>> @@ -61,9 +94,9 @@ static const char * const apu2_gpio_names[] = {
>>> [APU2_GPIO_LINE_LED2] = "front-led2",
>>> [APU2_GPIO_LINE_LED3] = "front-led3",
>>> [APU2_GPIO_LINE_MODESW] = "front-button",
>>> + [APU2_GPIO_LINE_RESETM1] = "modem1-reset",
>>> + [APU2_GPIO_LINE_RESETM2] = "modem2-reset",
>>> [APU2_GPIO_LINE_SIMSWAP] = "simswap",
>>> - [APU2_GPIO_LINE_MPCIE2] = "mpcie2_reset",
>>> - [APU2_GPIO_LINE_MPCIE3] = "mpcie3_reset",
>>> };
>>>
>>> static const struct amd_fch_gpio_pdata board_apu2 = {
>>> @@ -72,6 +105,40 @@ static const struct amd_fch_gpio_pdata board_apu2 = {
>>> .gpio_names = apu2_gpio_names,
>>> };
>>>
>>> +/* GPIO device - APU5 */
>>> +
>>> +static int apu5_gpio_regs[] = {
>>> + [APU5_GPIO_LINE_LED1] = APU2_GPIO_REG_LED1,
>>> + [APU5_GPIO_LINE_LED2] = APU2_GPIO_REG_LED2,
>>> + [APU5_GPIO_LINE_LED3] = APU2_GPIO_REG_LED3,
>>> + [APU5_GPIO_LINE_MODESW] = APU5_GPIO_REG_MODESW,
>>> + [APU5_GPIO_LINE_RESETM1] = APU5_GPIO_REG_RESETM1,
>>> + [APU5_GPIO_LINE_RESETM2] = APU5_GPIO_REG_RESETM2,
>>> + [APU5_GPIO_LINE_RESETM3] = APU5_GPIO_REG_RESETM3,
>>> + [APU5_GPIO_LINE_SIMSWAP1] = APU5_GPIO_REG_SIMSWAP1,
>>> + [APU5_GPIO_LINE_SIMSWAP2] = APU5_GPIO_REG_SIMSWAP2,
>>> + [APU5_GPIO_LINE_SIMSWAP3] = APU5_GPIO_REG_SIMSWAP3,
>>> +};
>>> +
>>> +static const char * const apu5_gpio_names[] = {
>>> + [APU5_GPIO_LINE_LED1] = "front-led1",
>>> + [APU5_GPIO_LINE_LED2] = "front-led2",
>>> + [APU5_GPIO_LINE_LED3] = "front-led3",
>>> + [APU5_GPIO_LINE_MODESW] = "front-button",
>>> + [APU5_GPIO_LINE_RESETM1] = "modem1-reset",
>>> + [APU5_GPIO_LINE_RESETM2] = "modem2-reset",
>>> + [APU5_GPIO_LINE_RESETM3] = "modem3-reset",
>>> + [APU5_GPIO_LINE_SIMSWAP1] = "simswap1",
>>> + [APU5_GPIO_LINE_SIMSWAP2] = "simswap2",
>>> + [APU5_GPIO_LINE_SIMSWAP3] = "simswap3",
>>> +};
>>> +
>>> +static const struct amd_fch_gpio_pdata board_apu5 = {
>>> + .gpio_num = ARRAY_SIZE(apu5_gpio_regs),
>>> + .gpio_reg = apu5_gpio_regs,
>>> + .gpio_names = apu5_gpio_names,
>>> +};
>>> +
>>> /* GPIO LEDs device */
>>>
>>> static const struct gpio_led apu2_leds[] = {
>>> @@ -215,6 +282,24 @@ static const struct dmi_system_id apu_gpio_dmi_table[] __initconst = {
>>> },
>>> .driver_data = (void *)&board_apu2,
>>> },
>>> + /* APU5 w/ mainline BIOS */
>>> + {
>>> + .ident = "apu5",
>>> + .matches = {
>>> + DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
>>> + DMI_MATCH(DMI_BOARD_NAME, "apu5")
>>> + },
>>> + .driver_data = (void *)&board_apu5,
>>> + },
>>> + /* APU6 w/ mainline BIOS */
>>> + {
>>> + .ident = "apu6",
>>> + .matches = {
>>> + DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
>>> + DMI_MATCH(DMI_BOARD_NAME, "apu6")
>>> + },
>>> + .driver_data = (void *)&board_apu2,
>>> + },
>>> {}
>>> };
>>>
>>> @@ -249,7 +334,7 @@ static int __init apu_board_init(void)
>>>
>>> id = dmi_first_match(apu_gpio_dmi_table);
>>> if (!id) {
>>> - pr_err("failed to detect APU board via DMI\n");
>>> + pr_err("No APU board detected via DMI\n");
>>> return -ENODEV;
>>> }
>>>
>>> @@ -288,7 +373,7 @@ module_init(apu_board_init);
>>> module_exit(apu_board_exit);
>>>
>>> MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
>>> -MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
>>> +MODULE_DESCRIPTION("PC Engines APUv2-6 board GPIO/LEDs/keys driver");
>>> MODULE_LICENSE("GPL");
>>> MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
>>> MODULE_ALIAS("platform:pcengines-apuv2");
>>
> 


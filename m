Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29030723D17
	for <lists+platform-driver-x86@lfdr.de>; Tue,  6 Jun 2023 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237409AbjFFJVz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 6 Jun 2023 05:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237194AbjFFJVy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2023 05:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE27C1720
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jun 2023 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686043214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ShqneNSlkDfpznBiVizHOY9tJTHJFqGnQ0BxbBebLpg=;
        b=TQYxzvvK1Vtfm8lV5h5tB8b3NTqECwauuz0D9s5vAq+BSyqsjlkHd2PEq454yPZ5HgW+0U
        mKbPirgDpGgDJBD7TDY484CYnaM91MajF+P1Ot7QzHFWKPmDhefMbXldrcGkHgYv17TyG8
        wAwPNbajUkzBjDJ7VsmhOqTc6fgbBmg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-XxVhKwACO9mTGyPXda0jCg-1; Tue, 06 Jun 2023 05:20:13 -0400
X-MC-Unique: XxVhKwACO9mTGyPXda0jCg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9745c72d99cso396116166b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2023 02:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043212; x=1688635212;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShqneNSlkDfpznBiVizHOY9tJTHJFqGnQ0BxbBebLpg=;
        b=Tupvc5D/0NmGunTAIyKx8NY4QDDJ8TEipSphYk+7MrkzHJMHbns67ay+cYxIQdibWe
         /kKtzyZ7rwbZf2U3WVtGcqVuNW4BZPeu4Deo1iebI1a7/HQtGbwTlbsz029KtOXPc0ic
         ABumCszGGvahalhdLA7DnXvel3Xxhp/6X5LuklrfvPkotVy4e2He6POjOQw2wBMiNFN4
         jmqzQjmv/kNrqQHq0hx+IdN+sgLj+CaCmK+sltH1cpLW2T32QPn6nM4J7gTclg3L4id2
         +3zmyZ8Ee+4pugX98sZLTW3feYlD7Zuuo7ttqSrVADWgyMQUOdqEJ3NxCxdFTqUHjIzs
         lIEQ==
X-Gm-Message-State: AC+VfDyMW1twnUXCGdAXi5B1KJWHVF9m8GYXUi5toaFpwIoRmp33gRlC
        P6E6OG2vJa4YkeGGm6BnVs5XN0WUVQ0x8g0ebI8aNZEUVztS+4UksSYM1ZgtaFq3MrIeBzzYTjF
        Xa9D2Qq5sAz86mKOYjWsxOSZK1AFqs5yJSw==
X-Received: by 2002:a17:906:4788:b0:977:95f4:5ce1 with SMTP id cw8-20020a170906478800b0097795f45ce1mr1933154ejc.20.1686043212028;
        Tue, 06 Jun 2023 02:20:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43qD2fLFPDvmsTnq4tUeWI6D8DRcq5ViMceZQIX0DB8ztfsJ/Rzc142+q73R3Fc1rez8Br7Q==
X-Received: by 2002:a17:906:4788:b0:977:95f4:5ce1 with SMTP id cw8-20020a170906478800b0097795f45ce1mr1933140ejc.20.1686043211733;
        Tue, 06 Jun 2023 02:20:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d10-20020a1709067f0a00b0096f5781205fsm5286467ejr.165.2023.06.06.02.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:20:11 -0700 (PDT)
Message-ID: <927fd860-31f1-f17b-9aa5-a1e09bab876b@redhat.com>
Date:   Tue, 6 Jun 2023 11:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
References: <20230531134429.171337-1-hdegoede@redhat.com>
 <70e8ece9-d9eb-7749-ae8f-276891324e48@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <70e8ece9-d9eb-7749-ae8f-276891324e48@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dan,

On 5/31/23 16:45, Dan Scally wrote:
> Hello Hans and Bingbu (and thanks for both versions of the patch)
> 
> On 31/05/2023 14:44, Hans de Goede wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> On some platforms, the imaging clock should be controlled by evaluating
>> specific clock device's _DSM method instead of setting gpio, so this
>> change register clock if no gpio based clock and then use the _DSM method
>> to enable and disable clock.
> 
> 
> Interesting - is that a common thing? Are there other camera-related resources that are controlled in a similar way? I still don't know how to drive the infrared LED on most Surface platforms, so now I'm wondering if they need something similar doing.
> 
> 
> It does seem a bit strange for this to be a _DSM method against the INT3472 rather than part of _PS0 against the camera itself - isn't that where you'd usually find such things?
> 
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> Link: https://lore.kernel.org/r/20230524035135.90315-2-bingbu.cao@intel.com
>> ---
>> Changes in v2 (Hans de Goede):
>> - Minor comment / code changes (address Andy's review remarks)
>> - Add a acpi_check_dsm() call
>> - Return 0 instead of error if we already have a GPIO clk or if
>>    acpi_check_dsm() fails
>> - Rename skl_int3472_register_clock() -> skl_int3472_register_gpio_clock()
>>    and name the new function: skl_int3472_register_dsm_clock()
>> - Move the skl_int3472_register_dsm_clock() call to after
>>    acpi_dev_free_resource_list() and add error checking for it
> 
> 
> I think all these changes are good ones.
> 
>> ---
>>   .../x86/intel/int3472/clk_and_regulator.c     | 89 ++++++++++++++++++-
>>   drivers/platform/x86/intel/int3472/common.h   | 10 ++-
>>   drivers/platform/x86/intel/int3472/discrete.c |  8 +-
>>   3 files changed, 99 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> index 1086c3d83494..9bcf8c64b8e7 100644
>> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> @@ -11,6 +11,37 @@
>>     #include "common.h"
>>   +/*
>> + * 82c0d13a-78c5-4244-9bb1-eb8b539a8d11
>> + * This _DSM GUID allows controlling the sensor clk when it is not controlled
>> + * through a GPIO.
>> + */
>> +static const guid_t img_clk_guid =
>> +    GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>> +          0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>> +
>> +static void skl_int3472_enable_clk_acpi_method(struct int3472_gpio_clock *clk,
>> +                           bool enable)
>> +{
>> +    struct int3472_discrete_device *int3472 = to_int3472_device(clk);
>> +    union acpi_object args[3];
>> +    union acpi_object argv4;
>> +
>> +    args[0].integer.type = ACPI_TYPE_INTEGER;
>> +    args[0].integer.value = clk->imgclk_index;
>> +    args[1].integer.type = ACPI_TYPE_INTEGER;
>> +    args[1].integer.value = enable ? 1 : 0;
>> +    args[2].integer.type = ACPI_TYPE_INTEGER;
>> +    args[2].integer.value = 1;
>> +
>> +    argv4.type = ACPI_TYPE_PACKAGE;
>> +    argv4.package.count = 3;
>> +    argv4.package.elements = args;
>> +
>> +    acpi_evaluate_dsm(acpi_device_handle(int3472->adev), &img_clk_guid,
>> +              0, 1, &argv4);
>> +}
> 
> 
> I'm not really sure what error modes something like this might have, but acpi_evaluate_dsm() at least can fail - is there no value in error checking here so that it could be returned by skl_int3472_clk_prepare() below?

The problem is that acpi_evaluate_dsm() returns an acpi_object * not a status.

And it returns NULL on errors as well as if the _DSM method returns nothing (ACPI
equivalent of returning void).

And these clk-set calls are expected to return void.

The good news is that acpi_evaluate_dsm() does log an error one errors.

<snip>

>> @@ -100,6 +102,7 @@ struct int3472_discrete_device {
>>           struct clk_lookup *cl;
>>           struct gpio_desc *ena_gpio;
>>           u32 frequency;
>> +        u8 imgclk_index;
>>       } clock;
> 
> 
> This struct is called "int3472_gpio_clock" but perhaps now ought to just be "int3472_clock"

Ack I've fixed this up while merging the patch.

Regards,

Hans



Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891897B0521
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Sep 2023 15:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbjI0NSn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 27 Sep 2023 09:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjI0NSj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 09:18:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A1C136
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695820673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3bwPqaSphrGy3IZbd7qFF8174I53rtWlv8Z5kNQYDxg=;
        b=VZ4OjjKwWFo5cJu38W1KOYL2tHlPmJrHXRQeE2Tn4xAG2qc2ToceMO/qDaO1GISGOFgpUY
        8ItgQgaUT0j+Nlz2AP1Gv4+AQLoKLHZlvDp2Zbp775xuBIybOVpa3czxFOBSAnSa47DV3i
        C+Yn3vjJBYp9OFfnEQDKuKwzEl4f69Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-aYwtMe-1Numq5qsg4y5Mfg-1; Wed, 27 Sep 2023 09:17:51 -0400
X-MC-Unique: aYwtMe-1Numq5qsg4y5Mfg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a9f282713fso927059666b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 06:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695820670; x=1696425470;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3bwPqaSphrGy3IZbd7qFF8174I53rtWlv8Z5kNQYDxg=;
        b=NlHi+tIIA56JcT0zhjntrCrCQH73b3GRLbalCmSC9JOqWkGKvV3JQIOVsaDbodmBMW
         49u7xx1AsDlW/ITBEs3HFiPdV9lEd0XmRd+C6wlC8ntDfBxA2bl/ZahUwCqUGm25rJ0d
         HyBEbJtK9usdaq0nLcPT3kqwckFjEFQA/HwV2JQgalC9auvSf2vzBpyicl3vZ/eYvZ4K
         l0dPCsramMvynWMtaM22apNpDAkpnOXnNbumZJ25AYvmi64JfGxYlrePwaIUju7BflbI
         qzU1UoDhsAWZ1hHGTBzRBPmMXDeyHH7Wa37visVJle+4qgZ66lFtD+GR89Fny87x4hEY
         lp8A==
X-Gm-Message-State: AOJu0YwpZb6ijEzJ0DhKd16Euzr4/0q/e1iZq7APa+JZd+VXS2rhbnfU
        shJPRZpEPUrHqAAltfu5PArm7CKHKlOcSxn/IcKDAcBxw5aDld/sDNm6ch0nqqG0WmkIlM1Ci72
        VxlfLxON8LzNe0HxDi1Pnp9L99aULsdHWsA==
X-Received: by 2002:a17:907:780b:b0:9ae:6355:afe9 with SMTP id la11-20020a170907780b00b009ae6355afe9mr1834012ejc.52.1695820670355;
        Wed, 27 Sep 2023 06:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcFMBgnkkkfPmnZduR/RzERo1iFJANN51tYfOFZOeu6D+NKkAerFz89yTzT+NcrTqRmW4q9w==
X-Received: by 2002:a17:907:780b:b0:9ae:6355:afe9 with SMTP id la11-20020a170907780b00b009ae6355afe9mr1833987ejc.52.1695820669960;
        Wed, 27 Sep 2023 06:17:49 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id vw7-20020a170907058700b009b27d4153cfsm2583163ejb.176.2023.09.27.06.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 06:17:49 -0700 (PDT)
Message-ID: <681ddbf9-baeb-9876-8615-5ec8a4b6c368@redhat.com>
Date:   Wed, 27 Sep 2023 15:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 2/4] platform/x86: int3472: led: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <20230926145943.42814-3-brgl@bgdev.pl>
 <2b5db794-c00f-e9f5-c0c9-4c5fb4df0802@redhat.com>
 <CAMRc=MeSK-ZReyt4556Dik4GwgtitD-NBgVE0swe=4i+5gBLwA@mail.gmail.com>
 <3f8760f8-ae8c-c0b0-19d7-76fbbf5d25de@redhat.com>
In-Reply-To: <3f8760f8-ae8c-c0b0-19d7-76fbbf5d25de@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Again,

On 9/27/23 15:08, Hans de Goede wrote:
> Hi Bart,
> 
> On 9/27/23 12:44, Bartosz Golaszewski wrote:
>> On Wed, Sep 27, 2023 at 11:40 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 9/26/23 16:59, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>> Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), use
>>>> temporary lookup tables with appropriate lookup flags.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> ---
>>>>  drivers/platform/x86/intel/int3472/led.c | 12 ++++--------
>>>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
>>>> index bca1ce7d0d0c..62e0cd5207a7 100644
>>>> --- a/drivers/platform/x86/intel/int3472/led.c
>>>> +++ b/drivers/platform/x86/intel/int3472/led.c
>>>> @@ -25,18 +25,14 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
>>>>       if (int3472->pled.classdev.dev)
>>>>               return -EBUSY;
>>>>
>>>> -     int3472->pled.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
>>>> -                                                          "int3472,privacy-led");
>>>> +     int3472->pled.gpio = skl_int3472_gpiod_get_from_temp_lookup(
>>>> +                             int3472->dev, path, agpio->pin_table[0],
>>>> +                             "int3472,privacy-led", polarity,
>>>> +                             GPIOD_OUT_LOW);
>>>
>>> Yeah so this is not going to work, path here is an ACPI device path, e.g.
>>> on my laptop (which actually uses the INT3472 glue code) the path-s of
>>> the 2 GPIO controllers are: `\_SB_.GPI0` resp `\_SB_.PC00.XHCI.RHUB.HS08.VGPO`
>>>
>>> Where as skl_int3472_gpiod_get_from_temp_lookup() stores the passed in path
>>> in  gpiod_lookup_table.table[0].key, which is the dev_name() of the GPIO
>>> controller's parent dev which are `INTC1055:00` resp. `INTC1096:00` .
>>>
>>> So we are going to need to add some code to INT3472 to go from path to
>>> a correct value for gpiod_lookup_table.table[0].key which means partly
>>> reproducing most of acpi_get_gpiod:
>>>
>>>         struct gpio_chip *chip;
>>>         acpi_handle handle;
>>>         acpi_status status;
>>>
>>>         status = acpi_get_handle(NULL, path, &handle);
>>>         if (ACPI_FAILURE(status))
>>>                 return ERR_PTR(-ENODEV);
>>>
>>>         chip = gpiochip_find(handle, acpi_gpiochip_find);
>>>         if (!chip)
>>>                 return ERR_PTR(-EPROBE_DEFER);
>>>
>>> And then get the key from the chip. Which means using gpiochip_find
>>> in the int3472 code now, which does not sound like an improvement.
>>>
>>> I think that was is needed instead is adding an active_low flag
>>> to acpi_get_and_request_gpiod() and then have that directly
>>> set the active-low flag on the returned desc.
>>>
>>
>> Ultimately I'd like everyone to use gpiod_get() for getting
>> descriptors but for now I get it's enough. Are you find with this
>> being done in a single patch across GPIO and this driver?
> 
> Yes doing this in a single patch is fine.
> 
> Also I'm fine with merging such a patch through the gpio tree .

So thinking about this more I realized that the int3472 code already
generates GPIO lookups for the sensor device for some
(powerdown, reset) GPIOs, it only needs the gpio_desc for
the case where the GPIO is turned into a regulator, clock or led.

Since the int3472 code is already generating lookups it already
has a way to go from path to a lookup "key":

        status = acpi_get_handle(NULL, path, &handle);
        if (ACPI_FAILURE(status))
                return -EINVAL;

        adev = acpi_fetch_acpi_dev(handle);
        if (!adev)
                return -ENODEV;

        table_entry->key = acpi_dev_name(adev);

So we can get the key without needing to call gpio_find_chip()

So I do believe that the temp lookup approach should actually
work. I'm currently traveling, so no promises but I should
be able to rework your series in something which actually
works and which will:

1. Stop using gpiod_toggle_active_low()
2. Allow dropping acpi_get_and_request_gpiod()

So no need for a patch to add an active-low parameter to
acpi_get_and_request_gpiod(), sorry about the noise.

Regards,

Hans




>>>>       if (IS_ERR(int3472->pled.gpio))
>>>>               return dev_err_probe(int3472->dev, PTR_ERR(int3472->pled.gpio),
>>>>                                    "getting privacy LED GPIO\n");
>>>>
>>>> -     if (polarity == GPIO_ACTIVE_LOW)
>>>> -             gpiod_toggle_active_low(int3472->pled.gpio);
>>>> -
>>>> -     /* Ensure the pin is in output mode and non-active state */
>>>> -     gpiod_direction_output(int3472->pled.gpio, 0);
>>>> -
>>>>       /* Generate the name, replacing the ':' in the ACPI devname with '_' */
>>>>       snprintf(int3472->pled.name, sizeof(int3472->pled.name),
>>>>                "%s::privacy_led", acpi_dev_name(int3472->sensor));
>>>
>>


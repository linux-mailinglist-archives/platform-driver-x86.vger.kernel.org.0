Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E285663C084
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Nov 2022 14:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiK2NAL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 29 Nov 2022 08:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiK2NAJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Nov 2022 08:00:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B562865EB
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 04:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669726751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kiO1RrevdKHWFm11PYAGTdOWTnWPsBv4Sqqnpvu5sa4=;
        b=PGbUxwVnYCf6cDssBjnk24tXDjepnEksD8+yYk4tbpW3t9Y70lYkSh/2y3RqKWqQPAa9IG
        gOt4lgb1hU9lETQXHPTJFaIm48DCX0D0u0trcEwIvKJrXb51qwdSNUd0fTO85FvIcA5L2+
        IjNL93z8idctl+XlPkGnjFPnKdlrIII=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-QAXHYcjGN4qphfuU1Qj9gw-1; Tue, 29 Nov 2022 07:59:09 -0500
X-MC-Unique: QAXHYcjGN4qphfuU1Qj9gw-1
Received: by mail-ed1-f70.google.com with SMTP id x18-20020a05640226d200b00461e027f704so8126760edd.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 04:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kiO1RrevdKHWFm11PYAGTdOWTnWPsBv4Sqqnpvu5sa4=;
        b=ymjX1QDyXQ5VjJcQ/pJJh1795sks/tGC8TpIGWfQShd0lLU62hpJ3o3TyjfbMcOG/7
         v5RKMXowY02dMgsaaJ2aLVkG0aArcNiNOVa9Ouq08wZ3AyuNiSzkKrVzldOndMk5MHiR
         VAveSbEDiX0N0YD25dwZOU+o5OGHXzHhSVusXdjO0874ldGHmuPDruAVpwu1pPdkDLsZ
         wTrsN9G+VB7sWrFyTY97y3TNltsU560xRAuBRAAWopzdWdYCBU35CKaqXzu3QJ0PFdaN
         I6bYt81m3CQlSIWVddlf5zhkLtNcRLcPMxxfdy6SfUCkzikZFeIo8tUTxgg/0gqwdeYg
         A0rg==
X-Gm-Message-State: ANoB5pl2GfIpR+yHCDQX6Dcyda3cgBvYavqicp4C7NwDM1a+z6rpjRbd
        3uri6DVJigNXkjGZ9FWrNe6SxkdBvcHqA8C5uDGzfhRnhm7r235+KV+O2WsmerDfbvWP0uEpEWG
        c3TJl27QtAF6oSoZCVM+QHfS7NIyMOsrdDg==
X-Received: by 2002:a17:906:2810:b0:7b2:7b45:2bf6 with SMTP id r16-20020a170906281000b007b27b452bf6mr31911144ejc.467.1669726748589;
        Tue, 29 Nov 2022 04:59:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ZaVNs+uKfak+6hnm3YHu1ox5m1ZgfOGqkrfOoWLbKUuy0/C8tp4GRqJe1qeYN23d1oqLHrA==
X-Received: by 2002:a17:906:2810:b0:7b2:7b45:2bf6 with SMTP id r16-20020a170906281000b007b27b452bf6mr31911128ejc.467.1669726748396;
        Tue, 29 Nov 2022 04:59:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007933047f923sm6110595ejc.118.2022.11.29.04.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 04:59:07 -0800 (PST)
Message-ID: <e4548ec5-ef22-894e-2f73-f60fc53d7ca1@redhat.com>
Date:   Tue, 29 Nov 2022 13:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-2-hdegoede@redhat.com>
 <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
 <9a4336d1-3222-fe50-f234-93ab175d606a@redhat.com>
 <CAHp75VdEd2-YMm2kGdRh2n7WwTJDEmOk68O4ydHU1m3W+Z83Lg@mail.gmail.com>
 <1eb61f7a-3b93-32a1-21bf-6929bbb40d36@redhat.com>
 <Y4X8O382eP+DKNA+@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4X8O382eP+DKNA+@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/29/22 13:34, Andy Shevchenko wrote:
> On Tue, Nov 29, 2022 at 01:19:57PM +0100, Hans de Goede wrote:
>> On 11/29/22 12:56, Andy Shevchenko wrote:
>>> On Tue, Nov 29, 2022 at 1:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 11/29/22 11:22, Andy Shevchenko wrote:
>>>>> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
>>>>>> so that the actual value of the pin is read, rather then the value the pin
>>>>>
>>>>> than
>>>>
>>>> Ack.
>>>>
>>>>>> would output when put in output mode.
>>>>>
>>>>> I don't see it here and haven't checked the context, but the idea is
>>>>> to check the direction and return either input (if pin is in input
>>>>> mode) or [cached] output.If it's the case, the patch looks good to me.
>>>>
>>>> No the idea is to always actually use the input register when reading
>>>> the pins, independent of the input/output mode. Instead of always
>>>> reading the [cached] output register value.
>>>
>>> But why? This makes a little sense to me.
>>
>> I don't understand what your problem is with this patch ?
>>
>> This is standard behavior for GPIO drivers, the get() callback
>> always reads the actual pin values when there is a registers
>> to get the actual pin-values. AFAIK this is no different from what
>> countless other GPIO drivers do ?
> 
> If the GPIO is requested is output and the pin in the HiZ mode, what value
> should you return?

The actual value measured on the pin. The only output + HiZ mode is
the GPDO register saying the pin should be high while it is configured
as an open-drain pin and then get() should return the actual value
on the pin which might be high (pulled-up) or low, because of
being pulled down by another open-drain output on the same bus
(e.g. I2C) and presumably the caller wants to know the actual
pin value to detect e.g. clock stretching with I2C.

> 
>>>> The input buffer will still work when the device is in output mode
>>>
>>> Does this hardware support HiZ?
>>
>> Yes the 7 standard GPIO pins can be put in input mode, aka HiZ mode.
> 
> No, input and HiZ are two different states. If the hardware doesn't
> support the latter, then your patch doesn't make any difference indeed, except
> involving "in" buffer for "out" value. Which I consider an unneeded
> step instead of reading [cached] "out" value.

See above.

> [cached] here is used in a broader sense: either SW cache, or read back value
> from the GPIO out register (not all hardware support that).
> 
>>>> and if somehow an external force is pushing the pin low/high against
>>>> the output value then the input buffer will correctly reflect this
>>>> (assuming the output is current limited and thus the magic smoke
>>>> stays inside the chip).
>>>
>>> Exactly, when smoke comes out, the hardware is broken and code,
>>> whatever is it, makes no difference at all.
>>
>> The GPIO part of the TPS68470 supports open-drain outputs, to correctly
>> get the actual value on the pin from the get() callback, the GPDI
>> register must be used. And being able to detect some outside chip
>> forcing the line low in open-drain mode is important to be able to
>> e.g. implement a software I2C master.
> 
> Right, but for push-pull mode this is not needed, correct?
> 
>> As I mentioned above actually using the input buffer value in
>> the get() method is standard behavior for GPIO drivers, exactly
>> for reasons like allowing a sw I2C master implementation to
>> detect clock stretching or conflicts (in the multi master case).
> 
>> I really don't understand what is so controversial about this
>> patch?
> 
> There are couple of remarks above:
> 1) what to read at the real HiZ mode ("in" and "out" buffers are disconnected
>    from the pin) in case hardware supports it;

If your definition of real HiZ mode is the input buffer also
being disconnected from the pin, then AFAICT from the datasheet
this hw does not support real (see above for what I consider
HiZ mode).

> 2) why to read "out" value via "in" buffer in case of push-pull mode.

Because it keeps the code KISS, because even then the bus
might be short-circuited to ground?

A better question is why would a GPIO API user ever call get()
on a pin in push-pull mode. The only answer I can come up with
is to get *the actual pin value* to e.g. detect a short-circuit
on the bus to gnd / Vdd.

>> Note the datasheet describes the GPDO / GPDI bit 0  values as:
>>
>> GPDO bit 0: "Control of the GPIO0 output"
>> GPDI bit 0: "State of the GPIO0 input"
>>
>> So clearly GPDI is the correct register to use for the get()
>> callback, which is what this patch is doing.
> 

Regards,

Hans



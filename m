Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BCF642AEE
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Dec 2022 16:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbiLEPC3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 5 Dec 2022 10:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbiLEPC2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Dec 2022 10:02:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F271E1DA61
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 07:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670252486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4+b72zSyUR6VPaPzemiBrICUhvMng/83X9sfjw8ofto=;
        b=ezPwK8956hPubucJmAFx2wh8hP7/V39ooEwcLJ5BvBXwCEn9lZt/r/T+vHLdWvj2PLus7u
        1sy1uV7Pl8+nFoVa3qXXRcSB5qyGAg2NwbndwCyB4TizZkTgrOTrsk7XXNu4FXzKILzyvD
        pA59JRAkG1uElAICHJCiuzkU9+GTh50=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-JS3JYVsjOD-ceqeil1hi_w-1; Mon, 05 Dec 2022 10:01:24 -0500
X-MC-Unique: JS3JYVsjOD-ceqeil1hi_w-1
Received: by mail-ej1-f69.google.com with SMTP id jg25-20020a170907971900b007c0e98ad898so2300682ejc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Dec 2022 07:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+b72zSyUR6VPaPzemiBrICUhvMng/83X9sfjw8ofto=;
        b=2SifrCAgauHrIqadnCE6daPRkrbFslgloSyhWJWZRT4LAMYxwRCeGJz+1wD3Md9Dx4
         GmrMOH5EqKewpfTjU5QwsFaXma3KK/ul2LyYWYQsA+XpTTrUFNYVepLQOMMRQcR1H+Tg
         dLKUOwnGE4mf3zGq7GUtYaec5laUXBp9WmJdJ5woiAeW2Rc8sjh5ZCeGbS9tjWoukmU7
         CGGrcyIQsrS7UrgsIodRDIkrWnNGU5Ui7NNHfDnz425wxC2MnsAQ70E31Y6AkWh5RGeB
         PpN660NG6VyB0FK7bP4AhZA4s4JtFwBenS3E8V/InI65/Ho5XDzKhBswB70ewaDQ2Fmc
         OH4w==
X-Gm-Message-State: ANoB5plnF9rMkTY+/jfhbGXtw4NKMRCLRc45+NUs8lnD/KpKUGjlm67a
        CmBPPmR5FZPQToyKli3V3R34hdx++c7s8RltxNOg05IGdKHF7UV6Q8KwHn4qk9N7ZeUIhqYSrse
        iTls/iWNjX/U7Jc+ekUrHsS0bnMR5lToTwA==
X-Received: by 2002:a17:906:5dd2:b0:7c0:af0b:b3a2 with SMTP id p18-20020a1709065dd200b007c0af0bb3a2mr11484649ejv.654.1670252482708;
        Mon, 05 Dec 2022 07:01:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7+tigsbpcFZ5Tsy0IbQ/yttpiPih9/mSxtRi/trWF+CHKhrQBkvMZsVIvJyew5OirSFHTWow==
X-Received: by 2002:a17:906:5dd2:b0:7c0:af0b:b3a2 with SMTP id p18-20020a1709065dd200b007c0af0bb3a2mr11484601ejv.654.1670252482187;
        Mon, 05 Dec 2022 07:01:22 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i5-20020a0564020f0500b0046776f98d0csm6332739eda.79.2022.12.05.07.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 07:01:21 -0800 (PST)
Message-ID: <e04eaaa0-1a5d-7f8f-9cd9-4a2117f83aab@redhat.com>
Date:   Mon, 5 Dec 2022 16:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
From:   Hans de Goede <hdegoede@redhat.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
 <f79b9397-64af-894a-411c-5595fa136008@redhat.com>
Content-Language: en-US
In-Reply-To: <f79b9397-64af-894a-411c-5595fa136008@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 12/3/22 13:28, Hans de Goede wrote:
> Hi,
> 
> On 12/3/22 10:32, Linus Walleij wrote:
>> On Mon, Nov 28, 2022 at 10:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> Patches 1-2: 2 small bugfixes to the gpio-tps68470 code
>>
>> Good, please merge this.
>>
>>> Patch3:      Add support for the indicator LED outputs on the tps68470 as GPIOs
>>> Patch4:      Add support for a privacy LED to the ov8865 sensor driver
>>> Patch5:      Add gpio-lookup table entry for the privacy LED.
>>
>> OK so I have to call out the hippo in the room:
>>
>> these "gpios" are not called "gpios" anywhere else than in this
>> patch. General purpose input/output, remember. These are special
>> purpose LED control registers.
>>
>> So can you provide a good explanation why these registers aren't
>> handled in the drivers/led subsystem instead?
> 
> This was discussed in another thread:
> 
> https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/
> 
> There were 2 problems identified which has lead to the current
> direction of just modelling at as an (output only) GPIO:
> 
> 1. The LED class allows userspace control of the LED which is
> bad from a privacy pov. This will make it easy, too easy
> (was the conclusion) for spy-ware to turn on the camera without
> the LED turning on.
> 
> Later in the thread it was pointed out that there is a flag to
> suspend userspace control, we could use this to permanently disable
> userspace control which I guess would be some what of a solution,
> although we would then also need to look into disallow changing
> triggers, because I think those could still be used as a way around
> this.

I have spend today looking into the feasibility of using the LED
class subsystem instead of modelling these on/off only LEDs as a GPIO.

Good news, there is a LED_SYSFS_DISABLE flag which also stops
userspace from messing with the trigger of the LED, so this
first issue can easily be fixed.

> 2. GPIO(s) can be tied directly to the device so that on a device
> with both front and back privacy-LEDs (real world example) doing
>  gpiod_get(dev, "privacy-led") gets us the right privacy-led,
> where as with LED class devices tying the sensor and LED class
> device is going to be tricky.
> 
>> IIUC the leds subsystem has gained support for leds as resources.
> 
> Interesting that would mitigate problem 2 from above and since
> people keep circling back to "its a LED please use the LED class",
> this is definitely worth looking into.
> 
> Do you have any pointers / examples about led class devices as
> resources?

I have been looking into this, but atm the only way to tie a
led-classdev to a device is through a fwnode reference.

Since this is x86 where there is no DTS file where we can
easily add this, I have been looking into doing this with
swnode-s.

LED directly attached to main SoC GPIO
======================================

For the simple LED is attached to a GPIO on the main
SoC case, this requires 2 steps:

1. Have the INT3472 code register a LED classdev for the
privacy-led instead of a GPIO lookup table entry. This LED
classdev must have a swnode as fwnode, so that we can put
a reference to that swnode in a "leds" reference-array 
property on the sensor i2c_client. This is about a 100
lines of extra code and seems fine / doable.

2. Add a "leds" reference-array property on the
i2c_client device by adding a swnode with this property
to the i2c_client device.  This sounds straight forward
(once we have the swnode for the LED class-device to point to)
but this is actually not straight forward at all.

There is a whole bunch of properties which needs to be
added on the sensor to describe the media-graph between
the sensor and the IPU, as well as what VCM (if any) is paired
up with the sensor. These properties are all added through
adding a swnode from the CSI bridge driver:

drivers/media/pci/intel/ipu3/cio2-bridge.c

But a device can only have one swnode added. So we cannot
add a swnode to the sensor i2c_client in the INT3472 code.

Instead the only thing which we could do is give the swnode
for the privacy LED classdev a predictable name, derived
from the sensor's device name and then
have drivers/media/pci/intel/ipu3/cio2-bridge.c
call software_node_find_by_name() to get the swnode and
have it add the "leds" reference-array property on the
i2c_client device for the sensor.

However the INT3472 code is shared between multiple ISP/IPU
implementations, so then we would need to duplicate this code
for the other IPU versions (currently IPU6 which is out of tree),
further complicating things.

And this is for the direct usage of a SoC GPIO case.


LED attached to TPS68470 PMIC indicator LED pin
===============================================

In this case the LED-classdev should be instantiated
by a driver for a new TPS68470 MFD cell. But this
also introduces a bunch of probe ordering systems,
so modelling things as a LED classdev here would involve:

1. Making the IN3472 code create + register a swnode for
the LED classdev, this must be done here because of
probe ordering.

2. Make the IN3472 code create a new TPS68470 MFD cell
and pass the swnode as fwnode to this cell.

3. Write a new driver for the new TPS68470 MFD cell,
which registers a LED classdev using the fwnode from
the MFD cell as fwnode for the LED classdev.


And this still does not solve the issue of how to get
the privacy-LED as LED classdev model to work on the IPU6.

Alternative approach
====================

An alternative approach, would be to add support for LED
lookup tables to the LED class code (like we already have
for GPIOs) and use this to allow tying a LED classdev to
a struct device on non devicetree platforms.

Given the problems with the swnode approach from above
I believe that this would actually be better then
the swnode approach.

Lookup tables like this use device-names, so we don't need
to have swnode-s ready for both the provider and the consumer
at the time of adding the lookup table entry. Instead all
that is necessary is to know the device-names of both
the provider and the consumer which are both known in
advance.

Is this really worth all the trouble ?
======================================

So I really have to wonder what is using the LED 
classdev / framework actually buying us over using
modelling these on/off only LEDs as a GPIO ?

I know that some (x86) have a flash-LED for the back
camera and given the experience with trying to tie
a LED class dev to a specific struct device (to the
sensor's i2c_client) I guess we are eventually going to
need some sort of lookup tables for tying LED class
devices to a specific device anyways.

That and we want to avoid moving from the current
approach (for some INT3472 using devices) of tying
the privacy LED on/off to the INT3472 registered
clk being enabled/disabled to modelling this as
GPIOs, to then later modelling it as LED class
devices after all.

To avoid this double conversion issue I'm going to
give the LED class route a second go, replacing
the swnode approach which I tried today with
a lookup-table approach.

Regards,

Hans






> ###
> 
> Note though that these indicator LED outputs, both functionality
> wise as well as at the register level of this PMIC only support
> turning them on/off. So this maps pretty well to the GPIO subsystem
> and all the functionality of the LED class subsystem is mostly
> functionality which we want to avoid since we don't want userspace
> control, neither directly through sysfs or by attaching triggers.
> 
> So this does map pretty well to just modelling it as a GPIO,
> if we model this as a LED then we end up having to workaround
> a bunch of stuff the LED subsytem does which we do not want in
> this case. And this may even require patches to the LED subsystem
> to disallow userspace changing the trigger (I would need to check).
> 
> So from my pov modelling this as an output-only GPIO pin is
> actually a more KISS solution then involving the LED subsystem...
> 
>> I don't mind a LED driver inside of the GPIO driver if that is what
>> it takes as a compromise, just that it should be handled by the right
>> subsystem.
> 
> The PMIC already is a MFD device, so if we go the LED class route
> we can just add a separate MFD child device for the new LED driver
> to bind to.
> 
>> Given that flash leds which are used by cameras are already in
>> drivers/leds/flash this should be no different and there will be more
>> cameras with these privacy leds.
> 
> Actually this patch is for the back camera privacy LED on a
> Microsoft Surface Go tablet. The front camera privacy LED is
> directly attached to a GPIO of the main SoC. So for that camera
> just adding a GPIO lookup table entry to map the ACPI provided
> GPIO info to a "privacy-led" GPIO on the sensor i2c_client device
> (which we already do for the "reset" and "powerdown" gpios) also
> by far is the most KISS approach.
> 
> Doing things this way in the code translating the ACPI "magic"
> to standard Linux device-model stuff is literary a single line
> of code (add an extra case: to an existing list of cases in a
> switch-case). Where as instantiating a LED class device for this
> and then somehow tying that to the i2c_client for the sensor will
> be more code.
> 
> So again treating these on/off only LEDs, where we want to
> *disallow* userspace control, as a GPIO is by far the most KISS
> solution.
> 
> Regards,
> 
> Hans
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4235A4EF6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Aug 2022 16:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiH2OQt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 29 Aug 2022 10:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiH2OQs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Aug 2022 10:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262EA5A148
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 07:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661782606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YUSHKhGgAwBc3+U+L1GCsVozs8tqAEJzmoV09a7Iano=;
        b=GF4JZWbklQJDwFRTl0F1L4bKYLde88kZ9sVlK0Zqo5XorQT0dz5lnQwewT3BsDxksLG/7n
        +VfnxZ6I5U19SJqNMvLqwbVjvdG6/yFLbGbE3TgQkH549fbFQmGb5nj959mGXulX5dI3yR
        Gosg6aAtwA+Sd2XSRBbMOF0Y9EFKF8M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-aMfHKvshOAavXNLdKvypnA-1; Mon, 29 Aug 2022 10:16:44 -0400
X-MC-Unique: aMfHKvshOAavXNLdKvypnA-1
Received: by mail-ej1-f69.google.com with SMTP id sg35-20020a170907a42300b007414343814bso1600233ejc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 07:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YUSHKhGgAwBc3+U+L1GCsVozs8tqAEJzmoV09a7Iano=;
        b=371x+RXGjt3HNBH3HVg5f30ep9ymcWFc6gjgg1wLLcSZoH0iplHFfTfWzw23o6thL0
         jyKJeLcFuPJZ0BXTJlAOYwFYEATXL4a31JjXYj571a/0M8ANMA9k38/j0cAbVHwJD2EU
         mjn+qkpY0FLYI/yLBRj0/BSDeD09QxRzsB771jawNynjO65xvmV7jECVvhZtEQ5Oe0D5
         Y3tYDsEHVsiRZbbBo9kpmVquzNcmhujcImpwf98v/GoKNzHe5/s7KI6qMce9cRKIjTxW
         qfldsbW1Vp2p0PZBRVYYsOj2DKjpSvhukLcAtHbgR9Fs8qeAj1tmKF16tbWopGgakL9n
         KUmA==
X-Gm-Message-State: ACgBeo1uYKZxijLG2FqsbJ4Er1yPD5koneDfeDoXFaAYzc4DTuWafk7m
        salKka0ool8j3EiW7m+8JMwbf/mjYD9LV3xMxT/QF5QgCaHgZsSi+kgb9DtiL3AfUQiGwEopwS7
        JTlt0NmYZnNCCOBDbpvcFKYoAmVz++G8JMw==
X-Received: by 2002:a05:6402:248d:b0:437:dd4c:e70e with SMTP id q13-20020a056402248d00b00437dd4ce70emr16401969eda.75.1661782603708;
        Mon, 29 Aug 2022 07:16:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6GYlWJ6dZGZe+jV2YmNwczTrmfZit8cV42BdsgzQ7dgL4uA1IXIWFSTkbAW85skpLl36bU5w==
X-Received: by 2002:a05:6402:248d:b0:437:dd4c:e70e with SMTP id q13-20020a056402248d00b00437dd4ce70emr16401954eda.75.1661782603413;
        Mon, 29 Aug 2022 07:16:43 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906230d00b00722e50dab2csm4488601eja.109.2022.08.29.07.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:16:42 -0700 (PDT)
Message-ID: <f1c186ec-38b0-6466-d4a2-93b53cf20bf1@redhat.com>
Date:   Mon, 29 Aug 2022 16:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/2] [RFC] platform/x86: Fixes for Toshiba Z830
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Cc:     Azael Avalos <coproscefalo@gmail.com>,
        Linux PM <linux-pm@vger.kernel.org>
References: <20220821200821.1837460-1-lkml@vorpal.se>
 <2ddade8b-7260-8497-12f2-c8b13cf35e6a@redhat.com>
 <12a39cf6-1247-d2a3-bf07-51297e9b6640@vorpal.se>
 <123960a4-7a38-234b-24ca-dfe3655e32de@redhat.com>
 <3c6b5583-9a1c-7e7b-446e-f7db7591a2b8@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3c6b5583-9a1c-7e7b-446e-f7db7591a2b8@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/27/22 13:42, Arvid Norlander wrote:
> On 2022-08-26 14:07, Hans de Goede wrote:
>> Hi,
>>
>> On 8/24/22 14:31, Arvid Norlander wrote:
>>> On 2022-08-22 13:39, Hans de Goede wrote:
>>
>> <snip>
>>
>>>> For 2. you can actually just copy and paste a lot of this email,
>>>> I believe that having the info in this email in a
>>>> Documentation/admin-guide/laptops/toshiba_acpi.rst file
>>>> will make it a lot easier to find in the future then only having
>>>> it in the mailinglist archives.
>>>>
>>>>> * For the hardware buttons I describe below, is a solution specific to
>>>>>   toshiba_acpi preferred, or should additional effort be spent on
>>>>>   investigating a generic solution?
>>>>
>>>> Ok, this is interesting there actually is a specification from
>>>> Microsoft for this:
>>>> http://download.microsoft.com/download/9/c/5/9c5b2167-8017-4bae-9fde-d599bac8184a/dirapplaunch.docx
>>>>
>>>> And there was a previous attempt to add support for the PNP0C32 devices:
>>>> https://marc.info/?l=linux-acpi&m=120550727131007
>>>> https://lkml.org/lkml/2010/5/28/327
>>>>
>>>> And this even made it into drivers/staging for a while, if you do:
>>>> git revert 0be013e3dc2ee79ffab8a438bbb4e216837e3d52
>>>> you will get a: drivers/staging/quickstart/quickstart.c file.
>>>>
>>>> Note this is not great code:
>>>>
>>>> 1. If you do:
>>>>   ls /sys/bus/platform/devices
>>>>   You should already see a couple of PNP0C32 platform devices there and the
>>>>   driver should simply bind to those rather then creating its own platform device
>>>> 2. As mentioned this really should use the standard /dev/input/event interface
>>>>   for event reporting and allow userspace to change the scancode to EV_KEY*
>>>>   mapping. You can do this e.g. by using a sparse_keymap for the scancode to
>>>>   EV_KEY* mapping which will give you this for free.
>>>
>>> I have yet to have time to look at it. However this seems to suggest that
>>> these buttons should work when the laptop is off. That is not the case on
>>> the Z830. They only do anything when the computer is on and I can't find
>>> any settings to change that.
>>
>> Not necessarily fully off, but maybe when suspended ?
> 
> Tested it. Nope. In fact there is no code in the DSDT to handle the wakeup
> case. Or rather, only some partial lines of code are left over from that.
> That functionality is definitely non-functional on this laptop.
> 
> In addition the Microsoft specification lists _PRW as being a required
> method. This is missing. Only _STA (which does something funky based on
> variables set based on _OSI, haven't bothered figuring that out yet), _HID,
> _UID and GHID exist as methods on the button objects.
> 
>>
>>> Looking at the specification it also mentions several different
>>> notification codes for the button. The only one used on the Z830 is 0x80.
>>> That is, as far as I can tell from the decompilation of the DSDT.
>>>
>>> Thus I worry I will not be able to test any sort of generic implementation
>>> very well, if the Z830 only implements a small subset of the functionality.
>>
>> Right I understand still I think there should be a separate
>>
>> drivers/platform/x86/acpi_pnp0c32_buttons.c 
>>
>> driver for this IMHO. If it is only tested on your one model that
>> is fine (should be documented with a comment in the code though).
>>
>> Then at least we have something to serve as a basis for if people
>> want to add support for this on more laptop models.
>>
>> Does that sound reasonable ?
> 
> Sure, we may have talked past each other, as this is what I also believe I
> suggested.

Ah ok, good :)

> I just don't see how I can possibly implement the wakeup
> handling part of this, as no laptop I own has that.

Right, I fully agree.

> Unless you know some
> else who has a laptop that would allow testing that part.
> 
> Would a sensible option be to only implement support for key presses while
> the laptop is awake?

Yes that is fine.

> If someone comes along with a laptop that has the
> support for these buttons waking from sleep they can add that missing
> functionality at that point.

Ack.

> (It seems rather unlikely that will happen
> though: I get the feeling that this type of button never became a hit and
> is mostly a forgotten relic of the past. And if no one came along and
> bothered to add support in the decade+ since it was introduced, it was
> probably quite rare back then as well.)

Also ack.

>>>>> 4. Battery charge mode [implemented in patch 2]
>>>>> ======================
>>>>>
>>>>> This laptop supports not charging the battery fully in order to prolong
>>>>> battery life. Unlike for example ThinkPads where this control is granular
>>>>> here it is just off/on. When off it charges to 100%. When on it charges to
>>>>> about 80%.
>>>>>
>>>>> According to the Windows program used to control the feature the setting
>>>>> will not take effect until the battery has been discharged to around 50%.
>>>>> However, in my testing it takes effect as soon as the charge drops below
>>>>> 80%. On Windows Toshiba branded this feature as "Eco charging"
>>>>>
>>>>> In the following example ACPI calls I will use the following newly defined
>>>>> constants:
>>>>> #define HCI_BATTERY_CHARGE_MODE 0xba
>>>>> #define BATTERY_CHARGE_FULL 0
>>>>> #define BATTERY_CHARGE_80_PERCENT 1
>>>>>
>>>>> To set the feature:
>>>>>   {HCI_SET, HCI_BATTERY_CHARGE_MODE, charge_mode, 0, 0, 0}
>>>>> To query for the existence of the feature:
>>>>>   {HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 0}
>>>>> To read the feature:
>>>>>   {HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 1}
>>>>>
>>>>> The read may need to be retried if TOS_DATA_NOT_AVAILABLE is returned as
>>>>> the status code. This rarely happens (I have never observed it on Linux),
>>>>> but I have seen it happen under Windows once, and the software did retry
>>>>> it.
>>>>
>>>> Hmm, this is interesting if you look at:
>>>>
>>>> Documentation/ABI/testing/sysfs-class-power
>>>>
>>>> You will see there already is a standard API for this in the form of
>>>> adding a "charge_control_end_threshold" attribute to the standard
>>>> ACPI /sys/class/power_supply/BAT*/ sysfs interface. See e.g.
>>>> drivers/platform/x86/thinkpad_acpi.c
>>>>
>>>> For an example of how to add sysfs attributes to a battery
>>>> which is managed by the standard drivers/acpi/battery.c driver.
>>>>
>>>> I think you can use this standard attribute enabling eco charging
>>>> for any writes with a value <= 90 and disabling it for values
>>>>> 90 (90 being halfway between 80 and 100).
>>>>
>>>> While always showing 80 or 100 on read.
>>>>
>>>> You should then also write a patch for:
>>>>
>>>> Documentation/ABI/testing/sysfs-class-power
>>>>
>>>> Adding something like this to the "charge_control_end_threshold"
>>>> section:
>>>>
>>>> "not all hardware is capable of setting this to an arbitrary
>>>> percentage. Drivers will round written values to the nearest
>>>> supported value. Reading back the value will show the actual
>>>> threshold set by the driver."
>>>>
>>>> (feel free to copy verbatim, but maybe you can do better)
>>>>
>>>>
>>>
>>> This makes perfect sense, but I don't know if it is guaranteed to be 80%
>>> on all Toshiba laptops. Do you know of any other Toshiba laptops that
>>> have/had this feature, and if so, what the limits are? The Windows driver
>>> for this laptop does not document exactly what the limit is. 80% is simply
>>> what I have observed in practice.
>>
>> Right, the idea is to document that the hw/fw/driver may only
>> support some fixed values and that written values will be
>> rounded to one of the supported fixed values. There is no need
>> to document what those fixed values are.  The idea is that
>> userspace consumers will read back the value to see what
>> they actually got.
> 
> I think we might be slightly talking past each other here. I absolutely
> agree with your idea. My only worry is that toshiba_acpi returning 80%
> might not be the right choice. This could be model dependent.

Ah I see. 80% seems to be pretty common as max-charge value for
reducing the wear on the battery so I believe that just harcoding
80% in toshiba_acpi is fine.

If people com[plain that it actually is say 85% on some models then
we can see from there.

> Since I only have a sample size of one, it could even depend on the current
> condition of the battery for all I know (though that is probably not
> likely).

Right that seems unlikely.

> The Windows software and the manual do not specify any sort of
> percentage. It is just documented as a mode that prolongs battery life
> while reducing full charge basically. Without putting any qualifiers on
> "how much".
> 
> An option would be to return 80% for the Z830, and the string "unknown" for
> other models. Though I guess there is a risk of breaking user space
> software that only expects numeric values, so it may be a no-go.

Right, reporting non-numeric values here is not allowed, so lets
not do that.

> I guess the user space software using this interface consists of *at least*
> "tlp" and whatever KDE uses to handle it ("powerdevil" I belive?).

Right and upower / GNOME is also working towards using these.

Regards,

Hans


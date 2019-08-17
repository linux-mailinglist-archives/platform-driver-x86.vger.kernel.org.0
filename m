Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45068913AC
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Aug 2019 01:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfHQXXv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 17 Aug 2019 19:23:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49764 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbfHQXXv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Aug 2019 19:23:51 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 773256412F
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Aug 2019 23:23:50 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id y15so5524104edu.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Aug 2019 16:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ln2BNAj6KH80MzmKn8E6qfDrlsol2hmNDNzc8nn2bZE=;
        b=twF/0ajrmf5c8/qg8u1mm8t05x8AieuRVMrrpfxKauOj8PXbETQcVPcxRZCHMx585l
         ZgqqKeMdWQieil6CAOJ99DaqEgH88VyESMNAIpQ3SF/seWIpOy2nYlPJe0slB2Mhi4oQ
         F0dO2gD+tsTNwOOvI879g9gPHnWQJPr+cpvlX1fBEzrlDejO7VhvGaZB5jg65GRXY5Jo
         iQDISudgxGGDQU5LE2DbSbvy3PTZKzmhB4zQrcC3jNM5b0xeQQZJR3njtEFwmqPMGHU9
         MEyxVNlbg2OEytE2YXnYEqI2111x6j8qIVZNC5jfyfO2GaxttQf7O0xUyXL0W54C5bx4
         13AQ==
X-Gm-Message-State: APjAAAVTIUiSMSNFJ2B2AaIIvq7/NJ0j3gC3hdkk+O7kFTYQdrrm0j1J
        Xz2EIOiTbR2Y1DLmhRDCkUOARpEtQQZw+DInabdNTGadkOLBmFZsCVJFCXcGJXGtsvhPjxhUWEP
        /NW89202r1hV7eu74c1szxOHUlOg7XSgyqg==
X-Received: by 2002:a17:906:19d3:: with SMTP id h19mr15398206ejd.58.1566084228627;
        Sat, 17 Aug 2019 16:23:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWYe09bko2VsJxgQnb7aOyzSQWc+DvpPr3f6Z9umXJcxzZkq3GgGAMVvbsQcEQZ3iNxAT5aw==
X-Received: by 2002:a17:906:19d3:: with SMTP id h19mr15398196ejd.58.1566084228413;
        Sat, 17 Aug 2019 16:23:48 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id e3sm1384828ejm.16.2019.08.17.16.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Aug 2019 16:23:47 -0700 (PDT)
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
 <CACRpkdZhd1Bk-cBaxGaKo-mMoCT8T7yGqbPWFBiL10x3xkgDgA@mail.gmail.com>
 <495416a8-ca52-c55e-ec21-28ce31c3217f@redhat.com>
 <CACRpkdavQKAhp+7dqu-vHajmoja4b2HUBv-6iAgEUyVKtEFZ7Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d1be469f-acb2-532b-21f0-5cdd725999eb@redhat.com>
Date:   Sun, 18 Aug 2019 01:23:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdavQKAhp+7dqu-vHajmoja4b2HUBv-6iAgEUyVKtEFZ7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 18-08-19 00:26, Linus Walleij wrote:
> On Fri, Aug 16, 2019 at 9:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 8/16/19 7:16 PM, Linus Walleij wrote:
> 
>>> Sorry but just so I understand this report: when you say the
>>> interrupt storm is back, do you mean that this patch brings
>>> it back, or do you mean the interrupt storm is there
>>> even before this patch?
>>
>> I mean that the patch brings it back, iow the patch causes
>> a regression.
> 
> Gnah that's too bad. :/
> 
>>> This patch does bring semantic differences, but very
>>> small ones.
>>
>> Could it be that the parent device of the IRQ controller is
>> different after this?
> 
> If you mean parent_device in struct irq_chip then no,
> the gpiolib core doesn't touch that neither before or
> after this patch.
> 
>> I think that the ACPI subsys relies
>> on the parent being the INT0002 ACPI instantiated platform
>> device.
> 
> But this driver never sets up parent_device in struct
> irq_chip even today... it just passes in in pretty open coded
> with NULL as parent_device (compiletime default).
> 
>>>> Notice that the driver has attached itself as shared irq-handler
>>>> to the ACPI  IRQ
>>>
>>> What is it sharing it with?
>>
>> With the ACPI subsys, this IRQ is called the GPE which is an
>> interrupt normally reserved for events to be handled by the
>> ACPI subsys.
> 
> Aha I get it, I think.
> 
>> The ACPI subsys has the ability to attach an event handler
>> written in ACPI byte code (AML code) to GPIO events (GPIO
>> triggered IRQs), quoting the same piece of AML as before:
>>
>>
>>           Device (GPED)
>>           {
>>               Name (_ADR, Zero)  // _ADR: Address
>>               Name (_HID, "INT0002" /* Virtual GPIO Controller */)  // _HID: Hardw
>>               Name (_CID, "INT0002" /* Virtual GPIO Controller */)  // _CID: Compa
>>               Name (_DDN, "Virtual GPIO controller")  // _DDN: DOS Device Name
>>               ...
>>               Method (_AEI, 0, NotSerialized)  // _AEI: ACPI Event Interrupts
>>               {
>>                   Name (RBUF, ResourceTemplate ()
>>                   {
>>                       GpioInt (Level, ActiveHigh, ExclusiveAndWake, PullDown, 0x00
>>                           "\\_SB.GPED", 0x00, ResourceConsumer, ,
>>                           )
>>                           {   // Pin list
>>                               0x0002
>>                           }
>>                   })
>>                   Return (RBUF) /* \_SB_.GPED._AEI.RBUF */
>>               }
>>
>>               Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
>>               {
>>                   ...
>>               }
>>           }
>>
>> So what we are seeing here is an AEI (ACPI Event Interrupt) entry pointing
>> to pin 2 of the INT0002 GPIO chip, note this is not a real GPIO chip, but
>> a way to attach an ACPI event handler to GPE interrupts, while only
>> running the event handler when a specific status bit is set.
> 
> I see ... that's a bit complex way to solve an easy problem but I
> guess the ACPI gods want it that way.
> 
>> So what the ACPI subsys does is it looksup the GPIO with index 2
>> on the INT0003 gpiochip (which is unchanged) and the calls gpio_to_irq
>> on the found GPIO, it seems that the gpio_to_irq is no longer working,
>> causing the:
>>
>>    123:          0          0          0          0  INT0002 Virtual GPIO    2  ACPI:Event
>>
>> Line in cat/ /proc/interrupts to disappear. That or gpio_to_irq works
>> but then for some reason the subsequent request irq fails.
> 
> OK I get it, I try to see what the problem may come from.
> I suspect gpio[d]_to_irq isn't working as expected for some
> reason.
> 
> We are checking the valid_mask to see if the IRQ is valid for
> mapping. Could it be that something is wrong with the valid_mask?
> 
> It used to be that we:
> 
> 1. Set up the (only) GPIO chip
> 2. Set up the valid mask (now allocated)
> 3. Register the irqchip
> 4. Register the irqhandler
> 
> and now we instead:
> 
> 1. Set up the (only) GPIO chip
> 2. Register the irqchip
> 3. Register the irqhandler
> 4. Set up the valid mask (now allocated)
> 
> The valid_mask in the GPIO chip itself has a special callback
> to set up the mask, maybe we need to have the same for
> the irqchip if that needs to happen in the same flow as
> before.
> 
> It's a weird driver cascading a single GPIO IRQ that isn't
> really a GPIO so my head is spinning a bit :D

Ok, so the change to when the valid mask is set sounds like a possible
reason for the regression.

The GPIO lookup and gpio[d]_to_irq call happen from
acpi_gpiochip_request_interrupts which gets called at the end of
gpiochip_add_irqchip.

So yes it sounds like the irqmask getting set too late may very well
be the problem here.

Note that the acpi_gpiochip_request_interrupts call also does a
gpiochip_lock_as_irq call on the GPIO.

Basically the 3 relevant calls are:

         desc = gpiochip_request_own_desc(chip, pin, "ACPI:Event",
                                          GPIO_ACTIVE_HIGH, GPIOD_IN);

         ret = gpiochip_lock_as_irq(chip, pin);

         irq = gpiod_to_irq(desc);

I see now that all 3 of these have error handling + dev_err calls,
so if you want I can retest and look for errors in dmesg, I guess I
should have done that right away...

Regards,

Hans

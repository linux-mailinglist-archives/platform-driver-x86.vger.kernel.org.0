Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E0B908A6
	for <lists+platform-driver-x86@lfdr.de>; Fri, 16 Aug 2019 21:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfHPTnr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 16 Aug 2019 15:43:47 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:47023 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbfHPTmp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Aug 2019 15:42:45 -0400
Received: by mail-ed1-f66.google.com with SMTP id z51so6061285edz.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Aug 2019 12:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jguDOx8LMDMOMDZikoYIij4QthF8nC+qQV1T0dKyn/8=;
        b=cfiiA8dvvj9HkKaj5DyoYc7xa48Jdnx0I3NKFhxlDCkEWcSFv6jl1lAmrZGClAHzfp
         /hnu/SU92qaZOO6tBpY0peE0SiRb0wv8fpmJ+VjIwSpmYtJMPMouN0mmBTaHmXauBZ8j
         JsvZonS7hzp+aXhEbxlla8N6YZtis6ahwpSmGzTy2RUngtTCCkNcE/V00bqIgEDwL62g
         grI4MpLogPuJhSQmYTuEUVgIr/h6WS1GOfG/9vnErIxkJSGmiRm/TP/IqqkcD6SCbwvT
         EOhsYZb/7KHBEHkIpTSqEcN6Kal1QB9/0zn3YwXHmdEJC7Nmzg1CZ+WdaR3gSl+9hU3B
         H/OA==
X-Gm-Message-State: APjAAAX4Ortb+x/VDJdjwOLPzmqJdjXODHAlPCSM4ymg76iOSjOiiTRU
        +U6wTkZit9Fm4/50eSYLO2dkMw==
X-Google-Smtp-Source: APXvYqwmXLAxfy7cfTUdNHeoH/1kMGFBgT7zfe0NmBQEDC1A/WEwZZSMohv5GBCGGCfzMqufPwawdw==
X-Received: by 2002:a17:906:d7a9:: with SMTP id pk9mr10979392ejb.171.1565984562999;
        Fri, 16 Aug 2019 12:42:42 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id a18sm930966ejp.2.2019.08.16.12.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2019 12:42:42 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <495416a8-ca52-c55e-ec21-28ce31c3217f@redhat.com>
Date:   Fri, 16 Aug 2019 21:42:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZhd1Bk-cBaxGaKo-mMoCT8T7yGqbPWFBiL10x3xkgDgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/16/19 7:16 PM, Linus Walleij wrote:
> Hi Hans,
> 
> On Fri, Aug 16, 2019 at 11:18 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> So I've just tested this on a Cherry Trail machine and
>> the interrupt storm, fixing which is the reason the
>> intel_int0002_vgpio.c driver was introduced, is back:
> 
> Sorry but just so I understand this report: when you say the
> interrupt storm is back, do you mean that this patch brings
> it back, or do you mean the interrupt storm is there
> even before this patch?

I mean that the patch brings it back, iow the patch causes
a regression.

> This patch does bring semantic differences, but very
> small ones.

Could it be that the parent device of the IRQ controller is
different after this? I think that the ACPI subsys relies
on the parent being the INT0002 ACPI instantiated platform
device.

>> Notice that the driver has attached itself as shared irq-handler
>> to the ACPI  IRQ
> 
> What is it sharing it with?

With the ACPI subsys, this IRQ is called the GPE which is an
interrupt normally reserved for events to be handled by the
ACPI subsys.

>> Do I need any patches on top of 5.3-rc4 to test this patch?
> 
> No, none that I know of.
> 
> It is weird that this driver registers a chained
> interrupt handler but int0002_irq() doesn't call
> chained_irq_[enter|exit].
> 
> I don't understand the ACPI code but I'm confused about
> a "virtual" GPIO controller with very real interrupt lines
> attached to it. If it is actually virtual then just trying to
> abuse gpiolib to cascade interrupts like the shared
> interrupts were some, you know, cascaded GPIO IRQ line,
> I guess all the consumers should just grab the interrupt
> independently and shared instead, the idea being that
> each of them will drop their pull of the shared level IRQ
> line until it is eventually deasserted.
> 
> I'm just confused....

The ACPI subsys has the ability to attach an event handler
written in ACPI byte code (AML code) to GPIO events (GPIO
triggered IRQs), quoting the same piece of AML as before:


         Device (GPED)
         {
             Name (_ADR, Zero)  // _ADR: Address
             Name (_HID, "INT0002" /* Virtual GPIO Controller */)  // _HID: Hardw
             Name (_CID, "INT0002" /* Virtual GPIO Controller */)  // _CID: Compa
             Name (_DDN, "Virtual GPIO controller")  // _DDN: DOS Device Name
             ...
             Method (_AEI, 0, NotSerialized)  // _AEI: ACPI Event Interrupts
             {
                 Name (RBUF, ResourceTemplate ()
                 {
                     GpioInt (Level, ActiveHigh, ExclusiveAndWake, PullDown, 0x00
                         "\\_SB.GPED", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0002
                         }
                 })
                 Return (RBUF) /* \_SB_.GPED._AEI.RBUF */
             }

             Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
             {
                 ...
             }
         }

So what we are seeing here is an AEI (ACPI Event Interrupt) entry pointing
to pin 2 of the INT0002 GPIO chip, note this is not a real GPIO chip, but
a way to attach an ACPI event handler to GPE interrupts, while only
running the event handler when a specific status bit is set.

So what the ACPI subsys does is it looksup the GPIO with index 2
on the INT0003 gpiochip (which is unchanged) and the calls gpio_to_irq
on the found GPIO, it seems that the gpio_to_irq is no longer working,
causing the:

  123:          0          0          0          0  INT0002 Virtual GPIO    2  ACPI:Event

Line in cat/ /proc/interrupts to disappear. That or gpio_to_irq works
but then for some reason the subsequent request irq fails.

Regards,

Hans





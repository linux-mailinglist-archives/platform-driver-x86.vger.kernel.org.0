Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2738B91379
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Aug 2019 00:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfHQW0k (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 17 Aug 2019 18:26:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41901 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfHQW0k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Aug 2019 18:26:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id m24so8282862ljg.8
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Aug 2019 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wgPjAzULUuyfheHoVLEnJ58DGwGFxq4sYpiskj0fSks=;
        b=WGi8G7xnu8rc0L6Zj+3IGrUZ6W4QovFQc+aFbboLqUncV+mln9He7qHiQsdAsXSiNt
         V6fdMBp0j8lUBKf8D3ehj0x2EUq9Bk0CJkDT39UfhZff3M/3mxCmseZGVjsiS5yzJVRZ
         cRIp6lpLR2KbBRc9zNJuxXah3z+GoiGq5ZZoCY52ehzJFM4ZxaxZ1RZWS+0mVwI3Pats
         wgVblCPkDl8rhMtim23PewCQCB7EDDVOdLmAcpdGsAwb0KM4IcNqzxFCREtesoJ5Al6q
         Xx9Pw5H+9FX5/0RmtpQOYeNmvP9ha/a36i3q5tfdWeakGktJFLCFOyQFOTw/SQRCGUVd
         lbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wgPjAzULUuyfheHoVLEnJ58DGwGFxq4sYpiskj0fSks=;
        b=hovc53rWbM0KprDpLp9CgwgPSI/mKTGs19ef+QtudoXW/nhMY/9QivDslBoJ42X7PV
         mJXzJXkSlMiNxz52hP0viyadi18+o5on30C/ru8jjpVwJEZHbDt9l9qejKwzuj/oqx5P
         e7cTGGT3gNiEo48DJ87dN3aydg1Dksm2yJmlXyksp7tPEITscN48d2pl9s+7cF3lC5h6
         RzlnHIF935zhN2+XOQdkNTBTsRjkQtfSaZuJJElxwSBf24i5f4u4BWdapYpridvPdYcA
         BZ9v9xpJM7Uak5mhfpyCCb6sVptOI2lHptwYr72ouhweSbMmZRWR17myPS3dyT9gE6sy
         Ix5w==
X-Gm-Message-State: APjAAAU+SJZh2QXfwnZmZ710aI65W0bJEXnKbQ3YimlqJdN0zI7WkxGX
        RRCa2cKErltmS22Ub7soSnQIPNcoEfTKS+Vx4pNY2A==
X-Google-Smtp-Source: APXvYqxRRhS1VS9bFyLtmUgcJleEcu1JZg5NoKaDUhgBum19qALrR1z857aVb5uEi/pQ5MGRdPDjNoOh4XhJeyyUYIc=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr6706822ljg.62.1566080797434;
 Sat, 17 Aug 2019 15:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com> <CACRpkdZhd1Bk-cBaxGaKo-mMoCT8T7yGqbPWFBiL10x3xkgDgA@mail.gmail.com>
 <495416a8-ca52-c55e-ec21-28ce31c3217f@redhat.com>
In-Reply-To: <495416a8-ca52-c55e-ec21-28ce31c3217f@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 18 Aug 2019 00:26:25 +0200
Message-ID: <CACRpkdavQKAhp+7dqu-vHajmoja4b2HUBv-6iAgEUyVKtEFZ7Q@mail.gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Aug 16, 2019 at 9:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 8/16/19 7:16 PM, Linus Walleij wrote:

> > Sorry but just so I understand this report: when you say the
> > interrupt storm is back, do you mean that this patch brings
> > it back, or do you mean the interrupt storm is there
> > even before this patch?
>
> I mean that the patch brings it back, iow the patch causes
> a regression.

Gnah that's too bad. :/

> > This patch does bring semantic differences, but very
> > small ones.
>
> Could it be that the parent device of the IRQ controller is
> different after this?

If you mean parent_device in struct irq_chip then no,
the gpiolib core doesn't touch that neither before or
after this patch.

> I think that the ACPI subsys relies
> on the parent being the INT0002 ACPI instantiated platform
> device.

But this driver never sets up parent_device in struct
irq_chip even today... it just passes in in pretty open coded
with NULL as parent_device (compiletime default).

> >> Notice that the driver has attached itself as shared irq-handler
> >> to the ACPI  IRQ
> >
> > What is it sharing it with?
>
> With the ACPI subsys, this IRQ is called the GPE which is an
> interrupt normally reserved for events to be handled by the
> ACPI subsys.

Aha I get it, I think.

> The ACPI subsys has the ability to attach an event handler
> written in ACPI byte code (AML code) to GPIO events (GPIO
> triggered IRQs), quoting the same piece of AML as before:
>
>
>          Device (GPED)
>          {
>              Name (_ADR, Zero)  // _ADR: Address
>              Name (_HID, "INT0002" /* Virtual GPIO Controller */)  // _HID: Hardw
>              Name (_CID, "INT0002" /* Virtual GPIO Controller */)  // _CID: Compa
>              Name (_DDN, "Virtual GPIO controller")  // _DDN: DOS Device Name
>              ...
>              Method (_AEI, 0, NotSerialized)  // _AEI: ACPI Event Interrupts
>              {
>                  Name (RBUF, ResourceTemplate ()
>                  {
>                      GpioInt (Level, ActiveHigh, ExclusiveAndWake, PullDown, 0x00
>                          "\\_SB.GPED", 0x00, ResourceConsumer, ,
>                          )
>                          {   // Pin list
>                              0x0002
>                          }
>                  })
>                  Return (RBUF) /* \_SB_.GPED._AEI.RBUF */
>              }
>
>              Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
>              {
>                  ...
>              }
>          }
>
> So what we are seeing here is an AEI (ACPI Event Interrupt) entry pointing
> to pin 2 of the INT0002 GPIO chip, note this is not a real GPIO chip, but
> a way to attach an ACPI event handler to GPE interrupts, while only
> running the event handler when a specific status bit is set.

I see ... that's a bit complex way to solve an easy problem but I
guess the ACPI gods want it that way.

> So what the ACPI subsys does is it looksup the GPIO with index 2
> on the INT0003 gpiochip (which is unchanged) and the calls gpio_to_irq
> on the found GPIO, it seems that the gpio_to_irq is no longer working,
> causing the:
>
>   123:          0          0          0          0  INT0002 Virtual GPIO    2  ACPI:Event
>
> Line in cat/ /proc/interrupts to disappear. That or gpio_to_irq works
> but then for some reason the subsequent request irq fails.

OK I get it, I try to see what the problem may come from.
I suspect gpio[d]_to_irq isn't working as expected for some
reason.

We are checking the valid_mask to see if the IRQ is valid for
mapping. Could it be that something is wrong with the valid_mask?

It used to be that we:

1. Set up the (only) GPIO chip
2. Set up the valid mask (now allocated)
3. Register the irqchip
4. Register the irqhandler

and now we instead:

1. Set up the (only) GPIO chip
2. Register the irqchip
3. Register the irqhandler
4. Set up the valid mask (now allocated)

The valid_mask in the GPIO chip itself has a special callback
to set up the mask, maybe we need to have the same for
the irqchip if that needs to happen in the same flow as
before.

It's a weird driver cascading a single GPIO IRQ that isn't
really a GPIO so my head is spinning a bit :D

Yours,
Linus Walleij

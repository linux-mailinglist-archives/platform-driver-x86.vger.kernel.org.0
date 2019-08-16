Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1008FFA5
	for <lists+platform-driver-x86@lfdr.de>; Fri, 16 Aug 2019 12:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfHPKD3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 16 Aug 2019 06:03:29 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46815 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfHPKD2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Aug 2019 06:03:28 -0400
Received: by mail-pg1-f193.google.com with SMTP id m3so2114315pgv.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Aug 2019 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ojGnDwch/FcjQHTKF4noUzWT9ik7x6pWQXhAIvfai9c=;
        b=BSGqhv1/wr3ZCKbzPXS85U9K74UEe6j0RY6EJmfUenVKmzqZTUizYPlwF9+IJ8LpNB
         nV2+Ntd7g4sWJc1fPbgNJf/VOmSrKU0nX4FHv0bv/sVOIbVVjkXn5DeQF+UMOYfHq7hE
         npwCr1PE/0X+dndNkKUr9I/k6MtIHoTiGNOQjchIqEaNl3v3zE4pwck5lBk8SlXCVVhX
         aRIFjWW5Fq6UbpgKrH31WOwlJEKGGi2M2+5aesybgW9m/jMzZb77KI9bm9yuN+Gr8Eso
         j7nzV19CaTU+hGQeZCvXL4vB4ybbLNI3awTcG6T0xcZAb/A2sxW5hBHPrIpa6gLHJEeJ
         JLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ojGnDwch/FcjQHTKF4noUzWT9ik7x6pWQXhAIvfai9c=;
        b=uMnaGgIHGgPaesCuRqAoqWMYVOlP9xoePjGjBbQGtY/DEw/gAd8ugMMyk5XftljHvv
         XrzPXLOowyDelhGjeShdS+0iXk+YkNODijdnn4cVur4riEJTvc6D0d8GK7JiIp/d95Gs
         ljXL+ME3O9M3ZEcMmiTwiRG2MiX5WjmYsWIY1Axs3RsgD3oSLzG4ErdM4PWbN32s1WnB
         Za22IlHwJvthig8BJEhaqV97tbgByHszxc2ij2daRTmbf/czp4aheSgKEvaBZSVPn1Xu
         ju2p3QHstSpetaXcvv87q0FAJmBLrGto/cJrzNg2N190DMumoHobBP2bfsWeiIFVbpn5
         XcMA==
X-Gm-Message-State: APjAAAVHlgTDO+NZmDOFiyeerYgKrzPJKKEktO8uoEPNm2yVQ34BqBSv
        jshZ8DYIRpRQshY3D9Ace1xlfx1ixViw94mpCeA=
X-Google-Smtp-Source: APXvYqwmIVFU5zL2BZRWuYLfXfdxvqE+Lf67x9HHILKe+BrhxU0pURzHTHSlenEv9l6IWNYx/dpltXRt19DxRgUGUOU=
X-Received: by 2002:a17:90a:7788:: with SMTP id v8mr6609072pjk.132.1565949807955;
 Fri, 16 Aug 2019 03:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190812135335.10104-1-linus.walleij@linaro.org> <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
In-Reply-To: <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Aug 2019 13:03:16 +0300
Message-ID: <CAHp75Vc7hLuh99wUmkLXZEeeTnB5Zfim0oqFeTCCSnnLSG0TTQ@mail.gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Aug 16, 2019 at 12:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Linus,
>
> On 12-08-19 15:53, Linus Walleij wrote:
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip. For more info see
> > drivers/gpio/TODO.
> >
> > For chained irqchips this is a pretty straight-forward
> > conversion.
> >
> > Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Andy please merge this into your platform tree when you
> > feel happy with the patch, would be great of someone
> > can test it on hardware as well.
>
> So I've just tested this on a Cherry Trail machine and
> the interrupt storm, fixing which is the reason the
> intel_int0002_vgpio.c driver was introduced, is back:

Hans, thanks for testing.
I postpone this one.

>
> [root@localhost ~]# cat /proc/interrupts | grep INT0002
>     9:          0   23429420          0          0   IO-APIC    9-fasteoi   acpi, INT0002
>
> 23 million interrupts and counting, normally this is 0
> at boot low 10s after a suspend/resume with wakeup by
> USB keyboard.
>
> Notice that the driver has attached itself as shared irq-handler
> to the ACPI  IRQ,  but it seems something is going wrong with the
> registration of its own IRQ and/or for some reason the ACPI
> subsys is no longer attaching the ACPI event handler for the
> child IRQ to it, here is a the same command on a working
> kernel:
>
> [root@localhost ~]# cat /proc/interrupts | grep INT0002
>     9:          0          0          0          0   IO-APIC    9-fasteoi   acpi, INT0002
>   123:          0          0          0          0  INT0002 Virtual GPIO    2  ACPI:Event
>
> Do I need any patches on top of 5.3-rc4 to test this patch?
>
> Note that it is important that the single irq on the chip is
> advertised as irq number 2 (so the third irq) because that
> is what the ACPI event code expects:
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
> Anyways, this will need to be fixed before we can merge this.
>
> Regards,
>
> Hans
>
>
>
>
> > ---
> >   drivers/platform/x86/intel_int0002_vgpio.c | 29 +++++++++-------------
> >   1 file changed, 12 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
> > index d9542c661ddc..493a97ce0b08 100644
> > --- a/drivers/platform/x86/intel_int0002_vgpio.c
> > +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> > @@ -156,8 +156,8 @@ static int int0002_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> >       const struct x86_cpu_id *cpu_id;
> > -     struct irq_chip *irq_chip;
> >       struct gpio_chip *chip;
> > +     struct gpio_irq_chip *girq;
> >       int irq, ret;
> >
> >       /* Menlow has a different INT0002 device? <sigh> */
> > @@ -186,17 +186,9 @@ static int int0002_probe(struct platform_device *pdev)
> >       chip->ngpio = GPE0A_PME_B0_VIRT_GPIO_PIN + 1;
> >       chip->irq.need_valid_mask = true;
> >
> > -     ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
> > -     if (ret) {
> > -             dev_err(dev, "Error adding gpio chip: %d\n", ret);
> > -             return ret;
> > -     }
> > -
> > -     bitmap_clear(chip->irq.valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
> > -
> >       /*
> > -      * We manually request the irq here instead of passing a flow-handler
> > -      * to gpiochip_set_chained_irqchip, because the irq is shared.
> > +      * We directly request the irq here instead of passing a flow-handler
> > +      * to the gpio irqchip, because the irq is shared.
> >        */
> >       ret = devm_request_irq(dev, irq, int0002_irq,
> >                              IRQF_SHARED, "INT0002", chip);
> > @@ -204,17 +196,20 @@ static int int0002_probe(struct platform_device *pdev)
> >               dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
> >               return ret;
> >       }
> > +     girq = &chip->irq;
> > +     girq->chip = (struct irq_chip *)cpu_id->driver_data;
> > +     girq->parent_handler = NULL;
> > +     girq->num_parents = 0;
> > +     girq->default_type = IRQ_TYPE_NONE;
> > +     girq->handler = handle_edge_irq;
> >
> > -     irq_chip = (struct irq_chip *)cpu_id->driver_data;
> > -
> > -     ret = gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
> > -                                IRQ_TYPE_NONE);
> > +     ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
> >       if (ret) {
> > -             dev_err(dev, "Error adding irqchip: %d\n", ret);
> > +             dev_err(dev, "Error adding gpio chip: %d\n", ret);
> >               return ret;
> >       }
> >
> > -     gpiochip_set_chained_irqchip(chip, irq_chip, irq, NULL);
> > +     bitmap_clear(chip->irq.valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
> >
> >       return 0;
> >   }
> >



-- 
With Best Regards,
Andy Shevchenko

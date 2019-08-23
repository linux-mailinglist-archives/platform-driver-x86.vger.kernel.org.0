Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F519B264
	for <lists+platform-driver-x86@lfdr.de>; Fri, 23 Aug 2019 16:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395348AbfHWOr7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 23 Aug 2019 10:47:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42742 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393839AbfHWOr7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Aug 2019 10:47:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id p3so5896357pgb.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2019 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zGoEaHMKRAQIDGcMI4XxelBhf8eKxEFj7DvD6NEYqFQ=;
        b=SY44Ns9CsQAXwLeFQmpauW9abJ4Dh1bzIsefVjLTqwtBNPSaY1PBLVbhOutovHyIY/
         QUEM/3PM5UMbBqWyusJBIP8UYnnV/ruhz9TDFFojD7JJczu5xW45+NWyI+B1pXUPEemb
         7WSoVHVYWoxaxifncMXBV/i/g+/icJOWb0sGOv2t3looAnpjejFQo3zHfNUI8rWDfFen
         hZFm6PKKkDCQo0hB1WFYv2uxIhsFbUoghissOyGJ33tR9HQb2M4WvwQDiT/IPVy/z4Ys
         Ox0t53lakm3y/bMK/Zdxrw5GazlQwD/VH0jJjcov8kUuFTu1NR19ZSQPNfFvJgvj1xqS
         0t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zGoEaHMKRAQIDGcMI4XxelBhf8eKxEFj7DvD6NEYqFQ=;
        b=fFhLm8VpC6Tq3vTZakZWK6viS/X6Asc12XiwtPczeDjgZLMqxQVCN0wWOb7MsM7+lx
         otE6yCsAOJotYk+jwIPx4Ac1twTamh3Ou2KUfmszYJTXnnPg/ESmD6B+Up4taP04U294
         LC0aV2lhjyLkDDxVV0RSU63JM/DMjcuaWXK4CAhuNjb4y/cUOZuQvzltBDX2/9l5695V
         xMzrYt8KLhfkARKVYtKXRaLzLgZ4WWjHuUUnQeTFMe5ikAHfOCsnOsSyGwqvVLERxiLn
         Wnz7X4O6UnQsg57yV+lVQGzAu7d1ke9/A6x2uvKMzYvjC+wiOO++McO8pbvN5jl8IETl
         jBpg==
X-Gm-Message-State: APjAAAXDvqNL4/EGLlMo5+SL4Swl6HC6bL7tCqlPCB0aGkEWG5ZTOhdW
        ggZ/xIWQkLfUQe0+koS+DqFggSBIQa4itHwu4MA=
X-Google-Smtp-Source: APXvYqxFN0jLjAC3RgEpeW3Q4Mn3qNXzuEwyTcoY3co/jyI1b+GiefkluM4scwLbOucDajIls7Hf9pRgYtEg8HcJ6j8=
X-Received: by 2002:a17:90a:dd41:: with SMTP id u1mr5834714pjv.132.1566571678708;
 Fri, 23 Aug 2019 07:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com> <20190818132433.GT30120@smile.fi.intel.com>
 <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com> <20190818140419.GU30120@smile.fi.intel.com>
 <9d455011-bbe2-4a8c-0441-4291fc9e0d7b@redhat.com> <CACRpkdZ_0Hbj40zFAsp3YD6T-ZjmwDwUGG92W7fTDc2JWqTxhQ@mail.gmail.com>
 <d2844de9-bafb-7042-4cc3-2f6340aa324a@redhat.com>
In-Reply-To: <d2844de9-bafb-7042-4cc3-2f6340aa324a@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Aug 2019 17:47:43 +0300
Message-ID: <CAHp75Ve7qVAG3JxvAyRgj-6tk1OUAk5kyHLPY=WmnookVCWT3A@mail.gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Aug 23, 2019 at 5:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 8/20/19 10:41 AM, Linus Walleij wrote:
> > On Sun, Aug 18, 2019 at 6:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> >> Note that the gpio_chip structure already has a init_valid_mask
> >> callback which runs after gpiochip_irqchip_init_valid_mask wich
> >> allocs gpio_chip.irq.valid_mask, so we might use that, but:
> >>
> >> That is intended to setup the valid_mask for the pins, not for
> >> the IRQs, which would mean we are abusing it a bit and it runs
> >> after gpiochip_add_irqchip(), which might be too late I guess.
> >
> > Yeah there are two of them which is quite confusing. I am trying
> > to clean up the mess step by step. The initialization of the valid_mask
> > for the pins itself (which is BTW also there for ACPI mainly) is
> > rewritten, I just merged these:
> > https://lore.kernel.org/linux-gpio/20190819084904.30027-1-linus.walleij@linaro.org/
> > https://lore.kernel.org/linux-gpio/20190819091140.622-1-linus.walleij@linaro.org/
> > https://lore.kernel.org/linux-gpio/20190819093058.10863-1-linus.walleij@linaro.org/
> >
> > This makes things a bit clearer, now I "just" need to do the same
> > for the gpio_irq_chip.
> >
> >> So it looks like we need a gpio_chip.irq.init_valid_mask callback
> >> to fix this ordering problem and until this is fixed we should revert
> >> 2e65e0fad935f578e998656d3e7be5a26e072b0e.
> >
> > Do you think this patch, created in response to an ACPI bug in
> > similar vein for PL061 fixes the ordering problem:
> > https://lore.kernel.org/linux-gpio/20190820080527.11796-1-linus.walleij@linaro.org/
> >
> > Just applying it on top and see if the interrups storm is fixed
> > would be super...
>
> I can confirm that that patch, fixed the issue I was seeing with
> your "platform: x86: vgpio: Pass irqchip when adding gpiochip" patch
> with both patches combined things work fine.

Thank you very much, Hans, for testing and, Linus, for fixing.
Linus, I'll wait your patch appears in next rc and then I will reapply
your clean ups.

-- 
With Best Regards,
Andy Shevchenko

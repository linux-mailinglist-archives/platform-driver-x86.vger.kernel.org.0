Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B203F959FB
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Aug 2019 10:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbfHTIld (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 20 Aug 2019 04:41:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41021 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbfHTIld (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Aug 2019 04:41:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id m24so4321464ljg.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2019 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=whQZzhmbBZDOCTybvZluAr0mi4tOHfIsfYbXjPu4xUw=;
        b=ewQIU96ST2XEa1jLQACBj+0jDEvituy7qCAwMb5yFyZSbNG5PSJIat9rwR07SNXEGn
         n3J3Bj5/o6ORRwTEHdc/qlOJmsJ/6pJCpvXS3o27ZfN6J03aEzU+W+0aaKZ5iizMJqnV
         QQnhK6FKroyHPzToZDXMSSH2LVBdJ2YOtWN3kez0kUxEnLO4MeNSzqr7I6CzFiVd6unR
         IhfvlHhv9sm+5Zop2ivUU+XdunkU+I5GHhHoDhtA8w9Ps2oCThW07KXJY4wPdPEw4aoO
         8HvVIlClN1Y6b865PjnfkoKNmM5Z7ET6O0vbzO7JoyI8QWpO1K9mbgl2OnLd0hqCjRKh
         V6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=whQZzhmbBZDOCTybvZluAr0mi4tOHfIsfYbXjPu4xUw=;
        b=YhwMrlJ0P9kT8AUbs1KlqkDckyZ0PP14pg6uuucOZ8kTeMdwudPEin9OSd9chQTqxu
         GG+A/JAxbBLTRN/kAfcyPXpU1TSW/axnkoDVWxuvm3pUyP1nGMyn7wlWaipdYzTylnTb
         8UoVf/jgx62jPmuEC8+R5JGo4vB2l/ZBejy5Z2OEvbc6IiSkQuvwlnYJ22wKYiu2tW2y
         z7q2vC8f46pMxOqfAIm9tFEqJnQYH2JLyRfF8h8e7lf2ySTgKr9wWT4gFPygm98gqQ6h
         S5hIwuHQ2wRHQwchS3gZ1Z+Dbejvella40nw4dQLQKPJum9G0SrpVR6Wn10GKj5aWrxx
         g9wA==
X-Gm-Message-State: APjAAAWDUuHrYR7eZymdvDTXhUZsnTDn9R8rvwR0Wt4gwTOSFz8sP/5c
        Dw+w/E8OgmktU61/3db2X5MQUXVXdAGrne7txNslgKeMhQihGg==
X-Google-Smtp-Source: APXvYqyVgXqmcOWnXbgj6MUGD53aBn606C4ktWNHCaikEmaDwwZAGsZsQGa5DY/Zycwxx0QLDxnTpx+FejVE6XYQPbM=
X-Received: by 2002:a2e:b174:: with SMTP id a20mr12394250ljm.108.1566290490882;
 Tue, 20 Aug 2019 01:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com> <20190818132433.GT30120@smile.fi.intel.com>
 <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com> <20190818140419.GU30120@smile.fi.intel.com>
 <9d455011-bbe2-4a8c-0441-4291fc9e0d7b@redhat.com>
In-Reply-To: <9d455011-bbe2-4a8c-0441-4291fc9e0d7b@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Aug 2019 10:41:17 +0200
Message-ID: <CACRpkdZ_0Hbj40zFAsp3YD6T-ZjmwDwUGG92W7fTDc2JWqTxhQ@mail.gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Hans de Goede <hdegoede@redhat.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 18, 2019 at 6:19 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Note that the gpio_chip structure already has a init_valid_mask
> callback which runs after gpiochip_irqchip_init_valid_mask wich
> allocs gpio_chip.irq.valid_mask, so we might use that, but:
>
> That is intended to setup the valid_mask for the pins, not for
> the IRQs, which would mean we are abusing it a bit and it runs
> after gpiochip_add_irqchip(), which might be too late I guess.

Yeah there are two of them which is quite confusing. I am trying
to clean up the mess step by step. The initialization of the valid_mask
for the pins itself (which is BTW also there for ACPI mainly) is
rewritten, I just merged these:
https://lore.kernel.org/linux-gpio/20190819084904.30027-1-linus.walleij@linaro.org/
https://lore.kernel.org/linux-gpio/20190819091140.622-1-linus.walleij@linaro.org/
https://lore.kernel.org/linux-gpio/20190819093058.10863-1-linus.walleij@linaro.org/

This makes things a bit clearer, now I "just" need to do the same
for the gpio_irq_chip.

> So it looks like we need a gpio_chip.irq.init_valid_mask callback
> to fix this ordering problem and until this is fixed we should revert
> 2e65e0fad935f578e998656d3e7be5a26e072b0e.

Do you think this patch, created in response to an ACPI bug in
similar vein for PL061 fixes the ordering problem:
https://lore.kernel.org/linux-gpio/20190820080527.11796-1-linus.walleij@linaro.org/

Just applying it on top and see if the interrups storm is fixed
would be super...

I actually don't think it is the setting up of .irq.valid_mask after
registering the chip that is the problem, but rather the semantic
ordering in the gpiochip_add_data_with_key() function that this
patch tries to fix.

Yours,
Linus Walleij

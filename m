Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E93917CD
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Aug 2019 18:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfHRQ0m (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Aug 2019 12:26:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53324 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfHRQ0m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Aug 2019 12:26:42 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 812592D1EF1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Aug 2019 16:26:41 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id k10so3894226wru.23
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Aug 2019 09:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jwwCkIhvGK0dGh6ZndnOgpNadE1D56rLrTzjNhs/50M=;
        b=mYMkDPmMNt1DCTa6kpUl0cvLm4R5QZCVs57YVYmBfThnjrkeNNCUlro4jBYs54qZQm
         gpaVBe46lBS91J6+L+9ynHVqE9ffyAVd+N+hLQ8mnbbL2IMevd4zBvbtAkzz16WptwNT
         /TMaTpcj16jNeqlgLpfE1r5aIgPP/MVd/+JF6TCYKnbH8haLQsFuRQAtg0s59SsvyMce
         4Bg3rILO+qe5D4XTsbMQvcDA02d3eN9iMNSEGGYVo6GtPVWUwUPreWX79Ja48O1xvVdw
         tYf4jVJNPytkFYvKq08ESKemAvFtQYnWJ0Q8vGGX940yb675pkKtnXPuWBWgPU0VjbQI
         521g==
X-Gm-Message-State: APjAAAXY4E/cVNMKqxVgO6Oq1XhQRVqNVPSKMMNMfjMZrAXyT4JjDTOR
        /ELxgtIkfaLRRgxVZcWNwTMxy+cg18GH884QQh4R1lUWPjquiLrQ0N2vWTsedn+OT4NOXuT3GiO
        F/Fk0CyACoqjEk1Z1VOZIWwaqDfMUDzpS+w==
X-Received: by 2002:adf:ea01:: with SMTP id q1mr23212497wrm.271.1566145599768;
        Sun, 18 Aug 2019 09:26:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDpglQKWXZX+iwD5UPvvIO/qvtD2YtlZZtBAnF96QydAyt5fHKHszKD46Mv3nifTXvTib3rg==
X-Received: by 2002:adf:ea01:: with SMTP id q1mr23212486wrm.271.1566145599581;
        Sun, 18 Aug 2019 09:26:39 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id r190sm13015906wmf.0.2019.08.18.09.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2019 09:26:38 -0700 (PDT)
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
 <20190818132433.GT30120@smile.fi.intel.com>
 <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com>
 <20190818140419.GU30120@smile.fi.intel.com>
 <9d455011-bbe2-4a8c-0441-4291fc9e0d7b@redhat.com>
Message-ID: <f24156f0-c8da-b0b6-c3d3-2f1e1b8f94e3@redhat.com>
Date:   Sun, 18 Aug 2019 18:26:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9d455011-bbe2-4a8c-0441-4291fc9e0d7b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 18-08-19 18:19, Hans de Goede wrote:
> Hi,
> 
> On 18-08-19 16:04, Andy Shevchenko wrote:
>> On Sun, Aug 18, 2019 at 03:38:17PM +0200, Hans de Goede wrote:
>>> On 18-08-19 15:24, Andy Shevchenko wrote:
>>>> On Fri, Aug 16, 2019 at 11:18:22AM +0200, Hans de Goede wrote:
>>>>> On 12-08-19 15:53, Linus Walleij wrote:
>>>>
>>>>> Anyways, this will need to be fixed before we can merge this.
>>>>
>>>> It might affect the behaviour of pinctrl-baytrail as well.
>>>>
>>>> Hans, do you have any Baytrail at hand to test latest linux-next, or take my
>>>> for-next branch from
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git?
>>>
>>> Given all the hw-enablement work I've done for BYT/CHT I have a whole
>>> stack of Bay Trail devices. Is there anything specific you want me to
>>> test?  Or should I just take the first one of the stack which uses a
>>> GPIO from the SoC as IRQ for something and then test that something?
>>
>>  From the thread I got that it should be one which uses GPIO for GPE.
>> Given that we have a fix there against misconfigured pins by firmware [1, 2],
>> which utilizes need_valid_mask, probably ASUS T100TA is a good candidate.
>>
>> [1]: https://www.spinics.net/lists/linux-gpio/msg18842.html
>> [2]: commit 49c03096263871a68c9dea3e86b7d1e163d2fba8
> 
> Thanks for the context, so for testing I need a Bay Trail device which
> uses a GPIO interrupt line with a "Interrupt" descriptor, like this:
> 
>                          Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusiv
>                          {
>                              0x00000045,
>                          }
> 
> Instead of the more modern GpioInt descriptors. My Asus T100TA is in my
> storage-bin at the localhackerspace ATM, but I have a T200TA here which
> is the same wrt touchscreen IRQ routing.
> 
> I'm currently charging it because its battery was very dead TM, but in
> the mean time I've been looking at the code and I can already tell
> that a kernel with the 2e65e0fad935f578e998656d3e7be5a26e072b0e
> ("pinctrl: intel: baytrail: Pass irqchip when adding gpiochip")
> is not going to boot, that commit moves the call to
> byt_gpio_irq_init_hw() to before the call to devm_gpiochip_add_data().
> 
> devm_gpiochip_add_data() allocs gpio_chip.irq.valid_mask and
> byt_gpio_irq_init_hw() does:
> 
>                  if (value & BYT_DIRECT_IRQ_EN) {
>                          clear_bit(i, gc->irq.valid_mask);
> 
> Which means it will trigger a NULL deref after the
> "pinctrl: intel: baytrail: Pass irqchip when adding gpiochip"
> commit, sine now byt_gpio_irq_init_hw() runs before
> devm_gpiochip_add_data().
> 
> Note that the gpio_chip structure already has a init_valid_mask
> callback which runs after gpiochip_irqchip_init_valid_mask wich
> allocs gpio_chip.irq.valid_mask, so we might use that, but:
> 
> That is intended to setup the valid_mask for the pins, not for
> the IRQs, which would mean we are abusing it a bit and it runs
> after gpiochip_add_irqchip(), which might be too late I guess.
> 
> So it looks like we need a gpio_chip.irq.init_valid_mask callback
> to fix this ordering problem and until this is fixed we should revert
> 2e65e0fad935f578e998656d3e7be5a26e072b0e.

So thinking a bit more about this, I think a better fix would be to
export gpiochip_irqchip_init_valid_mask and make it proof against
multiple calls. Then drivers which need this before
devm_gpiochip_add_data() time can simply call it in advance.

Maybe (not sure if this is a good idea) we can eventually even
drop gpio_chip.irq.need_valid_mask and simply have all users of
the valid_mask explictly call gpiochip_irqchip_init_valid_mask.
If this second bit is a good idea depends on how much users there
are I guess and what the changes to those users would look like.

Regards,

Hans

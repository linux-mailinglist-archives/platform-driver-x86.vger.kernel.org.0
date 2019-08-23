Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290FB9B601
	for <lists+platform-driver-x86@lfdr.de>; Fri, 23 Aug 2019 20:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389214AbfHWSAA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 23 Aug 2019 14:00:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41686 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388081AbfHWSAA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Aug 2019 14:00:00 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8D7E059465
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2019 17:59:59 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id k10so5138664wru.23
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2019 10:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h75RuiQHTEwQ+y5l7PZSKILhRzwUFBuD2x6p27Fwh2w=;
        b=k83GvXqzU1zZhboWqPWIbAMpgFbeRHlCv1Bs/QywLbrebg4v3IemMdLLlRYvcmhxwW
         qT6CFzXI0KjpwN1AKhVDIctFzB19/FfhwuyfM6qZh3Z+y1P9taNfhohgBlALabISXaCr
         Pbh3zMrYkkveMvYwehdkdIJn1l8isgFRaBrlcBe32zarU4bTh/nWk2ahTf6BiVxpX6ti
         hoK/2bnKCGEgpB1LjmU8Wg3cALq7zpD+8p2Epps5Sk66JqM3LblmXYARLTmGx+OjN+yS
         ZPQAxq0w3B5CoEsnazkk3e0jlF3M3anC7qLYCDCjZBD0FBddDnGJVLP7wjswjafhDuW2
         76Hg==
X-Gm-Message-State: APjAAAUvIgiOpOD5/+n4uz2U4sDLCWbvxymiscxJsUjYJ4F2DUi/qHyx
        uOsoinT/7gcOJc6NsPdIvOKkiazfxTlQLZ3UTIKLiOtv1jIptW7Q2NLwV71f87ont6K9d2khbfR
        lvopMgNv5OC6Y/2ZjyiUJwtk1V/VE91StDA==
X-Received: by 2002:adf:bace:: with SMTP id w14mr7045647wrg.283.1566583198321;
        Fri, 23 Aug 2019 10:59:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySR7YHyv1Y4gpUtZfuOQ3K+5vsq/ids7Zmy5eLz/4VdMcRBJVf4xh4pNrV9XB1lqKqOAsVqQ==
X-Received: by 2002:adf:bace:: with SMTP id w14mr7045634wrg.283.1566583198169;
        Fri, 23 Aug 2019 10:59:58 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id m23sm4180073wml.41.2019.08.23.10.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 10:59:57 -0700 (PDT)
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
 <20190818132433.GT30120@smile.fi.intel.com>
 <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com>
 <20190818140419.GU30120@smile.fi.intel.com>
 <9d455011-bbe2-4a8c-0441-4291fc9e0d7b@redhat.com>
 <CACRpkdZ_0Hbj40zFAsp3YD6T-ZjmwDwUGG92W7fTDc2JWqTxhQ@mail.gmail.com>
 <d2844de9-bafb-7042-4cc3-2f6340aa324a@redhat.com>
 <CAHp75Ve7qVAG3JxvAyRgj-6tk1OUAk5kyHLPY=WmnookVCWT3A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c8fc217-a359-33dd-9c6f-6e936f32eaad@redhat.com>
Date:   Fri, 23 Aug 2019 19:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve7qVAG3JxvAyRgj-6tk1OUAk5kyHLPY=WmnookVCWT3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/23/19 4:47 PM, Andy Shevchenko wrote:
> On Fri, Aug 23, 2019 at 5:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 8/20/19 10:41 AM, Linus Walleij wrote:
>>> On Sun, Aug 18, 2019 at 6:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>>> Note that the gpio_chip structure already has a init_valid_mask
>>>> callback which runs after gpiochip_irqchip_init_valid_mask wich
>>>> allocs gpio_chip.irq.valid_mask, so we might use that, but:
>>>>
>>>> That is intended to setup the valid_mask for the pins, not for
>>>> the IRQs, which would mean we are abusing it a bit and it runs
>>>> after gpiochip_add_irqchip(), which might be too late I guess.
>>>
>>> Yeah there are two of them which is quite confusing. I am trying
>>> to clean up the mess step by step. The initialization of the valid_mask
>>> for the pins itself (which is BTW also there for ACPI mainly) is
>>> rewritten, I just merged these:
>>> https://lore.kernel.org/linux-gpio/20190819084904.30027-1-linus.walleij@linaro.org/
>>> https://lore.kernel.org/linux-gpio/20190819091140.622-1-linus.walleij@linaro.org/
>>> https://lore.kernel.org/linux-gpio/20190819093058.10863-1-linus.walleij@linaro.org/
>>>
>>> This makes things a bit clearer, now I "just" need to do the same
>>> for the gpio_irq_chip.
>>>
>>>> So it looks like we need a gpio_chip.irq.init_valid_mask callback
>>>> to fix this ordering problem and until this is fixed we should revert
>>>> 2e65e0fad935f578e998656d3e7be5a26e072b0e.
>>>
>>> Do you think this patch, created in response to an ACPI bug in
>>> similar vein for PL061 fixes the ordering problem:
>>> https://lore.kernel.org/linux-gpio/20190820080527.11796-1-linus.walleij@linaro.org/
>>>
>>> Just applying it on top and see if the interrups storm is fixed
>>> would be super...
>>
>> I can confirm that that patch, fixed the issue I was seeing with
>> your "platform: x86: vgpio: Pass irqchip when adding gpiochip" patch
>> with both patches combined things work fine.
> 
> Thank you very much, Hans, for testing and, Linus, for fixing.
> Linus, I'll wait your patch appears in next rc and then I will reapply
> your clean ups.

Note Linus' reordering patch only fixes the issue with ACPI event handlers
no longer registering. The ordering issue in the BYT pinctrl code where
it tries to write chip.irq.valid_mask[x] while valid_mask is a NULL
pointer is NOT fixed by this.

Regards,

Hans




drivers/platform/x86/intel_int0002_vgpio.c
> 

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 842219B1C8
	for <lists+platform-driver-x86@lfdr.de>; Fri, 23 Aug 2019 16:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390413AbfHWOWN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 23 Aug 2019 10:22:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42460 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731256AbfHWOWN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Aug 2019 10:22:13 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0D7197DD11
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2019 14:22:13 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id h25so5403405edb.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2019 07:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UuyAtYSlUw2nXqvVRniOaYO8UOzWNXT8PkrnMllwSrs=;
        b=kCncyzJl97CHdA8XPfMNSYOOMSR2BdlOxfP/6coL/WRQ2G3zZ2iXRZSscYCGsuFUqT
         1/hHYy36jcyD3aDq8UdrTwqmByJziSLpBX1QvINa3LfeCMmMM4uly9nT8auYGcRwRNla
         n38VH6YjnCxKA8N7xRSpQTAsoD+VlgU/eZwGQZs4JiqervbzX4uRZ8aPRepnJK8ct9mR
         Ms5CET62mRHiVNd0Lxr5kjpGv/Lpd/3rsXSzRdLOtcdNYUGG1Fynxh0eMTDChfWnpd9w
         kct4XNeUD+G/ZP7S8iL7zmIx3DMcFXcX4lwBpB/JkDM4fiZJhlKDmfdT3czfTuvPab21
         L7IA==
X-Gm-Message-State: APjAAAU6+m/GSdQAql8y2ejjkeD2XJn7f9d0va0P/q1p3b24VZLZRjIP
        BdAT20leztVZgpfyAQmAimmcp79FbP0XdGCqWl41AItOJymzYzzCYfscajzWTtSdDZE3MXzW061
        9+pTbCKv452PfOjodfghQiXTqwDZAkZSoDg==
X-Received: by 2002:aa7:c74e:: with SMTP id c14mr4688331eds.223.1566570131847;
        Fri, 23 Aug 2019 07:22:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8miM+9bw6eF0yhN6SPprtnhxHLoPRvD8IY8Qg7Xri9H+vr7Bkrg9FPrw0dheWeJL+cuMLew==
X-Received: by 2002:aa7:c74e:: with SMTP id c14mr4688312eds.223.1566570131699;
        Fri, 23 Aug 2019 07:22:11 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id b12sm566616edj.93.2019.08.23.07.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 07:22:11 -0700 (PDT)
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d2844de9-bafb-7042-4cc3-2f6340aa324a@redhat.com>
Date:   Fri, 23 Aug 2019 16:22:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ_0Hbj40zFAsp3YD6T-ZjmwDwUGG92W7fTDc2JWqTxhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/20/19 10:41 AM, Linus Walleij wrote:
> On Sun, Aug 18, 2019 at 6:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Note that the gpio_chip structure already has a init_valid_mask
>> callback which runs after gpiochip_irqchip_init_valid_mask wich
>> allocs gpio_chip.irq.valid_mask, so we might use that, but:
>>
>> That is intended to setup the valid_mask for the pins, not for
>> the IRQs, which would mean we are abusing it a bit and it runs
>> after gpiochip_add_irqchip(), which might be too late I guess.
> 
> Yeah there are two of them which is quite confusing. I am trying
> to clean up the mess step by step. The initialization of the valid_mask
> for the pins itself (which is BTW also there for ACPI mainly) is
> rewritten, I just merged these:
> https://lore.kernel.org/linux-gpio/20190819084904.30027-1-linus.walleij@linaro.org/
> https://lore.kernel.org/linux-gpio/20190819091140.622-1-linus.walleij@linaro.org/
> https://lore.kernel.org/linux-gpio/20190819093058.10863-1-linus.walleij@linaro.org/
> 
> This makes things a bit clearer, now I "just" need to do the same
> for the gpio_irq_chip.
> 
>> So it looks like we need a gpio_chip.irq.init_valid_mask callback
>> to fix this ordering problem and until this is fixed we should revert
>> 2e65e0fad935f578e998656d3e7be5a26e072b0e.
> 
> Do you think this patch, created in response to an ACPI bug in
> similar vein for PL061 fixes the ordering problem:
> https://lore.kernel.org/linux-gpio/20190820080527.11796-1-linus.walleij@linaro.org/
> 
> Just applying it on top and see if the interrups storm is fixed
> would be super...

I can confirm that that patch, fixed the issue I was seeing with
your "platform: x86: vgpio: Pass irqchip when adding gpiochip" patch
with both patches combined things work fine.

Regards,

Hans

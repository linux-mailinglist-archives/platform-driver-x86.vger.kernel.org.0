Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A9E2A43B0
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Nov 2020 12:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgKCLDJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 3 Nov 2020 06:03:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23500 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727068AbgKCLDI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 06:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604401386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h03m0nuXBEL9u2J74eBv2ws7yXsUAnziFIknIjP1JI0=;
        b=P+6L/C3vNIpTX5iHuT80qnmiiyo/8behwpwi6HA4zasFRf8Trcoe7DydoAhj73k+zJi5bm
        +OVsFuJAVOy+nU0yQVq5t+nJss3OGfUpXl5A7bLqW8E5t/y77S8WomuINFnbrIctad654j
        6rL7qhc5Ho+LOZqVQ8c48lzuD1PuMHU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-QXtcwsS3N_GnHvuED7X5Eg-1; Tue, 03 Nov 2020 06:03:04 -0500
X-MC-Unique: QXtcwsS3N_GnHvuED7X5Eg-1
Received: by mail-ed1-f71.google.com with SMTP id c2so1995262edw.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 03:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h03m0nuXBEL9u2J74eBv2ws7yXsUAnziFIknIjP1JI0=;
        b=QPitJPl4d3mILiruCPJumfGdkOF/MuD2ox3AOpd7ReDsPsEOZvkmH8FkITKnZ3wYf4
         dHCTH58VtJtkI0exmNCiPYOpk7hXZKDasT1HXCNEmYyDZnplvkVh9gQKj7SNlJoTRFZM
         BehYayHIiRa1t24rHD5z0QLKPpSOMPsugz1B53ETIsz2b8+aK9sYlTd/GvYaaBpt/cbb
         i612uC2vjsGmJAmPKS2Qhs23c/ZPKLT7MqX1A6uOz2xRgmeuYbnOfCRzP4JUp2dYO3QF
         RDzrFKGPZUXRJXRJdOX21XAfTrhN/2pc6Pfku5TWdhWNBPt7kTghXtVvgUVYO5P1cn+2
         1VZA==
X-Gm-Message-State: AOAM531Ofmm0PwDa7VMrZM4mTSRPLtAX3IKa4hZ8hkPfKuTKflrKUhxB
        qMPRbC/3RHpzugtWQnkerqr4S4YDDrh7Pon1fyPCjKVNct9kojFEPhJa7JbNbHXxnZU8Yq/lsIw
        gu9iluedvW1CcqIiWM4OOORUuagi7Z6FomQ==
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr2597555ejz.234.1604401383066;
        Tue, 03 Nov 2020 03:03:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXHN8sTj9UxiSv70BE7DfGnjadd3F4LS/k9+kHEIYyd+d36l5m3tUNasEDAoFcDeQiuHcuCA==
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr2597538ejz.234.1604401382909;
        Tue, 03 Nov 2020 03:03:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id k23sm10659224ejo.108.2020.11.03.03.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 03:03:02 -0800 (PST)
Subject: Re: [PATCH 1/3 v3] x86/platform/geode: Convert net5501 LED to GPIO
 machine descriptor
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org
References: <20201103000439.325448-1-linus.walleij@linaro.org>
 <967ce9e6-0197-c488-2a7d-c7f491d9b361@redhat.com>
 <CAHp75VdZSF_9N+PR5nSf0bzXGH12M3eF8hnLA9HhNbq+PG+mCw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d85e748a-b450-1b0d-59f3-661c89e6264f@redhat.com>
Date:   Tue, 3 Nov 2020 12:03:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdZSF_9N+PR5nSf0bzXGH12M3eF8hnLA9HhNbq+PG+mCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/3/20 11:39 AM, Andy Shevchenko wrote:
> On Tue, Nov 3, 2020 at 12:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/3/20 1:04 AM, Linus Walleij wrote:
>>> This makes the machine look up the LED from a GPIO machine
>>> descriptor table. The Geode LEDs should be on the CS5535
>>> companion chip.
>>>
>>> Cc: linux-gpio@vger.kernel.org
>>> Cc: Andres Salomon <dilinger@queued.net>
>>> Cc: linux-geode@lists.infradead.org
>>> Cc: Darren Hart <dvhart@infradead.org>
>>> Cc: platform-driver-x86@vger.kernel.org
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Linus, in case you did not know yet, I have take over
>> drivers/platform/x86 maintainership from Andy.
>>
>> Andy, the MAINTAINERS entry for arch/x86/platform says:
> 
> Yes, it's a bit orthogonal to PDx86, but it makes sense to have the
> below list of reviewers to be in sync with PDx86 maintainers. I'm
> happy to give my place in the below to you.

I'm not familiar with most of the code there, so how about
adding me while keeping you there too ?

And maybe drop Darren I guess ?  Darren if you are reading
along, please let us know what you want.

>> X86 PLATFORM DRIVERS - ARCH
>> R:      Darren Hart <dvhart@infradead.org>
>> R:      Andy Shevchenko <andy@infradead.org>
>> L:      platform-driver-x86@vger.kernel.org
>> L:      x86@kernel.org
>> S:      Maintained
>> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
>> F:      arch/x86/platform
>>
>> Andy, so I guess that with your Reviewed-by added, these are expected to
>> get picked up by the tip tree people ?
> 
> That's correct.
> 
>> Linus, it seems that you did not "Cc: x86@kernel.org" which is
>> listed in MAINTAINERS for these, and is probably necessary to
>> get these merged through the tip tree.
>>
>> Note I'm happy to pick these up through:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/
>>
>> I actually had them in my local review-hans branch before noticing that
>> that they went to arch/x86/platform. But I've dropped them now as I'm
>> not sure if merging them through the pdx86 tree is the right thing to do,
>> the MAINTAINERS file at least suggests things should be done differently.
> 
> arch/x86 should go via TIP tree, except cases confirmed by TIP maintainers.

Ok, then I think a v4 with the TIP maintainers actually in the addressing
list is necessary.

>> Linus, if a v4 with "Cc: x86@kernel.org" is necessary you may add my:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> To the entire series.

And this still applies.

Regards,

Hans


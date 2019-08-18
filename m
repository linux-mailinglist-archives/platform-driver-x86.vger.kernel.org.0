Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51031916CF
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Aug 2019 15:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfHRNiV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Aug 2019 09:38:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34778 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbfHRNiV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Aug 2019 09:38:21 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CB0BB81DEC
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Aug 2019 13:38:20 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id h8so3735458wrb.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Aug 2019 06:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z2Fs/IeWOohB7/VnQU8Xd4vh5HJy8YM2DHBJvC0OBDU=;
        b=ETdfvgERgvN4DdLk8Yx+R7TjGIfniFQ7dQoi9nRg1QabtAA9aNM9MdlmaPiUA09gH9
         TQGOO3G6XKXUWYxwzf6LHvL2z6mpLJRhfJDirswINiBuImzOrG6Yy+OtVhViotj5CIdW
         WKtQCxMSTttPRi083hJMwsP7AQk4GanY6fPvNG8V/0SOBJeDcnCusF+TNdsTzFLrIZBW
         hA7REB/iX5x+45P7DdK04Jp6D5VXC5yx4evoA1vZiAViT9Tm6eP8+kIs/S5cSnsyu430
         LdOc7OoOjazDY2IsKMJ0tixggWV3k9rZdELEw7EbRtOl3vANy84jqaB1mvLQv3Oku8td
         yPqw==
X-Gm-Message-State: APjAAAUEQe0PuQcW3yoduAhJKgq+jHnBGNBRswCnMcucVMW4FXzJ6DXl
        p2sNCfMiNFWWX5ROv7jJB6EIzzy7Ff/yJEaCSV3R6J7A3Weqnndb/A9IR5aQld+gUkYR6b+k417
        V3SStb9bhk4c90Z78T64RVQ0I/8dpyubbSw==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr16426532wme.3.1566135499596;
        Sun, 18 Aug 2019 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0cuC+zTSHcz6FAJL808Q+aeSPIO9cX0o52+qRbIN2ZmRs4xQlpqMYWamoQOSvfhshwSzqLQ==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr16426523wme.3.1566135499451;
        Sun, 18 Aug 2019 06:38:19 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id m188sm14267213wmm.32.2019.08.18.06.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2019 06:38:18 -0700 (PDT)
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
 <20190818132433.GT30120@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com>
Date:   Sun, 18 Aug 2019 15:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818132433.GT30120@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 18-08-19 15:24, Andy Shevchenko wrote:
> On Fri, Aug 16, 2019 at 11:18:22AM +0200, Hans de Goede wrote:
>> On 12-08-19 15:53, Linus Walleij wrote:
> 
>> Anyways, this will need to be fixed before we can merge this.
> 
> It might affect the behaviour of pinctrl-baytrail as well.
> 
> Hans, do you have any Baytrail at hand to test latest linux-next, or take my
> for-next branch from
> git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git?

Given all the hw-enablement work I've done for BYT/CHT I have a whole
stack of Bay Trail devices. Is there anything specific you want me to
test?  Or should I just take the first one of the stack which uses a
GPIO from the SoC as IRQ for something and then test that something?

> Linus, shall I postpone Baytrail patch as well?

Unlike the INT0002 virtual GPIO driver changes this one does not seem
to move anything to a later point in time...

Regards,

Hans



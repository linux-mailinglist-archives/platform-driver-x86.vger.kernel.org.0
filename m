Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2CD214D5A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 16:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbfEFOvE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 10:51:04 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36954 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfEFOvD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 10:51:03 -0400
Received: by mail-ed1-f65.google.com with SMTP id w37so15610012edw.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2019 07:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WILAIYS5L39NX5qaghFqLvb4HjkqylYpmgnllvPlJjg=;
        b=URI+/CeI377U8MeW3GakonZ1E2mYL8b0wY/IYjg8/3A8zBxKODbRSpeFgfDWHCjPXP
         AEhbpXDXoDgAfkiv3nj8WdkwvHihwDuI6mqDC4a3pOesE33/3UlKJ+6MYDiF+FOQfnDY
         QTYxCs72aLgvn824Ig25kphJb2DobZJFZOLqrcn1Gcvpmw6k/6AGeodKuZaQJmmBUsK3
         4UtzCqnQ49uU/ejNGgu9QkJM92F95ou+pRsswhQ4Z/UrwxrW97r26MSyDf3Llh+QxQc0
         dxs2qekJsFzZ4bu5haUJO5zWjtw1UM3+xYVzVtQSY7a+QWzJzzSFHra6UfCREzkS85R7
         8djw==
X-Gm-Message-State: APjAAAUWdziSo69x5uHlZYZMxJxF/q55Ge00FFrwQht1clNfv7nJIgBN
        UTezPyMiWGnNN9Q1pOI2Tinbkk++3p0=
X-Google-Smtp-Source: APXvYqxtOyAlYjQxfUDU7l6TzpK8MooojS7/5sM8tPSiP4KeZYsMNp2wlWeIWPLe9qOpa7t38MBgpw==
X-Received: by 2002:a50:89b0:: with SMTP id g45mr26933010edg.200.1557154261729;
        Mon, 06 May 2019 07:51:01 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id b23sm3155976ede.75.2019.05.06.07.51.00
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 07:51:00 -0700 (PDT)
Subject: Re: [PATCH 0/1] Add several Beckhoff Automation boards to
 critclk_systems DMI table
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel-dev@beckhoff.com, Stephen Boyd <sboyd@kernel.org>
Cc:     Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190502130351.5341-1-linux-kernel-dev@beckhoff.com>
 <CAHp75Vc4xWbnGoaS8tRDV4_F-Qifh7K1hoFn0V-OObun2Sd0DA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <21677236-b7fc-c51b-958a-269b5e65af54@redhat.com>
Date:   Mon, 6 May 2019 16:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc4xWbnGoaS8tRDV4_F-Qifh7K1hoFn0V-OObun2Sd0DA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 06-05-19 14:40, Andy Shevchenko wrote:
> On Thu, May 2, 2019 at 4:04 PM <linux-kernel-dev@beckhoff.com> wrote:
>>
>> From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
>>
>> There are several Beckhoff Automation industrial PC boards which use
>> pmc_plt_clk* clocks for ethernet controllers. The patch adds affected boards
>> to critclk_systems DMI table so the clocks are marked as CLK_CRITICAL and
>> not turned off.
>> This should be applied on top of another patch as both change
>> the same table:
>> [PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table
> 
> Yes, that's why it either should go via CLK tree, or I need an
> immutable tag or branch from them.
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

As I just mentioned in your reply to the "[PATCH] platform/x86: pmc_atom:
Add Lex 3I380D industrial PC to critclk_systems DMI table":

"Stephen added the patches this depends on to his fixes branch, so they
are in the 5.1 / Torvald's master branch, since we are now in the 5.2 merge
window, you should be able to cleanly apply this directly."

So both that patch and this patch should be able to go through the d-p-x86 tree
unless I'm missing something?

Regards,

Hans

> 
>>
>> Steffen Dirkwinkel (1):
>>    platform/x86: pmc_atom: Add several Beckhoff Automation boards to
>>      critclk_systems DMI table
>>
>>   drivers/platform/x86/pmc_atom.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> --
>> 2.21.0
> 
> 
> 

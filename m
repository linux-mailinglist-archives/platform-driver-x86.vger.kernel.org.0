Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B22F14EDE
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 17:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfEFPFz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 11:05:55 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35562 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfEFPFq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 11:05:46 -0400
Received: by mail-ed1-f65.google.com with SMTP id p26so15675091edr.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2019 08:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EG9y7f+OaOLQCxmo5YAdYV2d8wQYYdrdIyT2YfdhqrA=;
        b=jEybsHU6zjN5MYZuOJnL/5bYlSRWmCKYUrQGxyKM2LOyyuo8m6zdLv4XsV8VRvVdnc
         60HfK/olkUuZIpEXGq7COP2X6cKyIvsW4sCPjgyDzKk7jeiIc0WqXA6Juq6QmIXbmQGp
         nEp1wA3CIgZlzp1yzswNgXO6hhinQEbGCIXn73S2+3WqCLURr50opezQjjNTN/Vex77z
         7jRdhmMaakZa1GkAlBmN/xVtYIujxTa6SqTs0ytRjuC+w167JXWDFFi1sJa5ZTdjLsCs
         4QF6SAPPVZX0jIvG0RN6kEleZx6cGoDSZDD7JLrPcfMPQGIybzWc/yJ4nI4qa8Glmcr0
         to6Q==
X-Gm-Message-State: APjAAAU/ZYWN4ywSxk5CQjjxVk/hF4CHeyxaarSgbOU6Fh/8chxwJjJb
        HRET5OV//fMwVczP4OapQFh/lw==
X-Google-Smtp-Source: APXvYqwG7U8NKXeMCYsnsKEeNFfADW0dBrFnKXzISgYtUcSEK+XfEplGea/2X6qLq5ujIDfyCx/gVw==
X-Received: by 2002:a50:9007:: with SMTP id b7mr25564744eda.194.1557155144500;
        Mon, 06 May 2019 08:05:44 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id b42sm2996983edd.83.2019.05.06.08.05.43
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 08:05:43 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to
 critclk_systems DMI table
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Semyon Verchenko <semverchenko@factor-ts.ru>
References: <20190429150135.15070-1-hdegoede@redhat.com>
 <CAHp75VeE=88mCcgVx3Y3PQJPQ819Z7=3s=jRGz1y=t09phk=rA@mail.gmail.com>
 <085c5b6e-d220-ebd1-38d2-def7efca24b8@redhat.com>
 <CAHp75Vfe9uK_b_V+uG29wb1L6J7u1hpbU+P4beXso9KNPM+8Rg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <568ba27d-a6a5-b158-bab1-f22cd8ccb34e@redhat.com>
Date:   Mon, 6 May 2019 17:05:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfe9uK_b_V+uG29wb1L6J7u1hpbU+P4beXso9KNPM+8Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 06-05-19 16:59, Andy Shevchenko wrote:
> On Mon, May 6, 2019 at 5:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 06-05-19 14:38, Andy Shevchenko wrote:
>>> On Mon, Apr 29, 2019 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> The Lex 3I380D industrial PC has 4 ethernet controllers on board
>>>> which need pmc_plt_clk0 - 3 to function, add it to the critclk_systems
>>>> DMI table, so that drivers/clk/x86/clk-pmc-atom.c will mark the clocks
>>>> as CLK_CRITICAL and they will not get turned off.
>>>>
>>>
>>> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> supposedly to go via CLK tree.
>>>
>>> P.S. If you want it through PDx86, I need immutable branch / tag from CLK.
>>
>> Stephen added the patches this depends on to his fixes branch, so they
>> are in the 5.1 / Torvald's master branch, since we are now in the 5.2 merge
>> window, you should be able to cleanly apply this directly.
> 
> We don't do back merges, so, our base is v5.1-rc1. Does it mean the
> commit in question is in v5.1-rc1?
> AFAICS it was appeared in v5.1-rc5.

Ah, I see, my bad.

Stephen can you pick up this patch and the
"[PATCH 1/1] Add several Beckhoff Automation boards to critclk_systems DMI table"
patch then?

Regards,

Hans


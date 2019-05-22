Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BEE263E4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 May 2019 14:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbfEVMcQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 May 2019 08:32:16 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:32827 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729260AbfEVMcM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 May 2019 08:32:12 -0400
Received: by mail-ed1-f68.google.com with SMTP id n17so3648948edb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2019 05:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UxD9CqtHlLU4IuEq6GugZqRtNJ+uKMvnAJoQBTBkYxQ=;
        b=p6vOxryS0TPBUqtLunatj3c7PF/swOfglhELN/T5I7tDmeHhPDmcXlZ9vzmAamrQDL
         NwIfenCcuCP8bcnnz2Qs/BijlPVlIuhGF9O0mFwfZDEwHuJiEsA2rS1sUOK3SdcCPy+h
         TbfHqBNyB4LgkZ1d+ltaZ+19ucl4OzB/RRUYxY3rhisOhj2+cnesI4uARDQNmFHXdInv
         BWPu+7khQ7EC6E3nRWnvs1pajQpPCnRdKwMdz8GdaSwt/CZ1IYrPyQ2gPzbCGrsq9K0X
         IdFczIrtsoCgrNucux6S1qwkqS0SpVsSw2svdv0mEspukXWvykPsjAPoSX8p62zPDvvi
         bKkg==
X-Gm-Message-State: APjAAAXa37+ebMYungdMq41huCPI5PcU/0DEefE89dIOHwRgKLvT0Bp/
        EzxDpW5vOaKbBa6cUG3ZSVQ7WA==
X-Google-Smtp-Source: APXvYqy74cB0t4fkZ5monSncLbwC2MfQNgsB0SuIJa/kKlz+YqfJMN8QVCmlhbK/lvMOuMppzBnfMQ==
X-Received: by 2002:a50:e707:: with SMTP id a7mr83647835edn.68.1558528331206;
        Wed, 22 May 2019 05:32:11 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id dd15sm3942196ejb.74.2019.05.22.05.32.10
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 05:32:10 -0700 (PDT)
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
 <568ba27d-a6a5-b158-bab1-f22cd8ccb34e@redhat.com>
 <155726027056.14659.1724431433952718602@swboyd.mtv.corp.google.com>
 <10c8864c-6ee7-4dfd-6274-b1996e767653@redhat.com>
 <CAHp75VdnxRQi3X6J9hLGUjGsOYTkjoPN5MakJc=mUSumoC+wag@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c5546043-4f2d-979a-3718-a46f72bae20b@redhat.com>
Date:   Wed, 22 May 2019 14:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdnxRQi3X6J9hLGUjGsOYTkjoPN5MakJc=mUSumoC+wag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

On 08-05-19 10:42, Andy Shevchenko wrote:
> On Wed, May 8, 2019 at 10:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 07-05-19 22:17, Stephen Boyd wrote:
>>> Quoting Hans de Goede (2019-05-06 08:05:42)
> 
>>> I guess this is urgent?
>>
>> Somewhat, getting this into e.g. rc2 would be fine too, waiting till 5.3
>> would be bad.
> 
> So, I can do it as a fixes for rc2, just ping me after merge window.

The merge window is done now, can you please get the patch from this
thread and the
"PATCH 1/1] platform/x86: pmc_atom: Add several Beckhoff Automation boards to critclk_systems DMI table"
patch queued up as fixes for 5.2 now ?

Regards,

Hans






Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9082174F7
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 May 2019 11:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfEHJU4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 May 2019 05:20:56 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45076 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727258AbfEHJUz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 May 2019 05:20:55 -0400
Received: by mail-ed1-f65.google.com with SMTP id g57so21371624edc.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 May 2019 02:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q1/Ami51IditDxTB6HqWlJbnPuZ7kZ+MUhIVVJBzKrY=;
        b=EVZANI7+mApQDGlHgJMYCJ23Z2tU5Ly13AbaBtsh4TKoHxCujAiyyW29BB/33QiZ1B
         KuBK+HGqrA3raTSwlEKoxNMGfJtQqH525Lsfcu7lLwcLrzCEnoRYnt4YegybDaw3C8+S
         D3Omh15XDwhpRDeup5tpm2r18dDxEWiN0/bQS+SgmWAAwVVnKk7bjPkK6aUs+EQYjche
         Or8JKOU+LaOa46m4mXiPcBQrLSFO74ODpd6FDbDsBL+DbCDo6PfmfMNpx3OJasGkCWJR
         VhhedQ/RbIZ2J0q7zewsnmKcwFQQQjmnkrgpHp1oLYGNfK/e5q+v6iYphBkuuLH+rVQT
         z80g==
X-Gm-Message-State: APjAAAWjgYJci+tan7XCLUcaPK+MoOqSKhjF34C2xEwq7Mp9lrd9mcVq
        mv8x0PlrHlC8+KSg2b0bHbB8Lw==
X-Google-Smtp-Source: APXvYqxkn8yeB+GGdQTJpOKRUXz0WQyk93FDhXeo+tfTW/c79Jd2tLZGpC5uCOPTF3Zn+FlYrqeivA==
X-Received: by 2002:a17:906:708d:: with SMTP id b13mr28454778ejk.120.1557307253935;
        Wed, 08 May 2019 02:20:53 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id x49sm3153396edm.25.2019.05.08.02.20.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 02:20:53 -0700 (PDT)
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
Message-ID: <e9c92d24-9044-c37d-3f18-4884d97047d5@redhat.com>
Date:   Wed, 8 May 2019 11:20:52 +0200
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

Hi,

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

Ok, will do.

Regards,

Hans


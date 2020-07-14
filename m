Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABCD21ECF4
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Jul 2020 11:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgGNJd6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 Jul 2020 05:33:58 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39182 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbgGNJd6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Jul 2020 05:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594719236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DD/NJLwq0bamxwrGSpcfsRcNRSxti2z+zdKscIzsmx8=;
        b=aqpdiJTbxSyzYz5A5oM5qGBwedN6Z2XP4krUBoIdGuqI8/RAzX06Ic/k2gil0u0eVB9BgF
        XPC0VgGtHu9pkvLdW/6KV3xVbsDyanNFMG/LRh61N71X6F+eNZTXzOyyw6mSSvM9/PMCFP
        LajOPPz1TeZb7IFgq0b4C49EEgzFkkA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-VpkIDccfNC6yyjdrlWF0Wg-1; Tue, 14 Jul 2020 05:33:54 -0400
X-MC-Unique: VpkIDccfNC6yyjdrlWF0Wg-1
Received: by mail-wr1-f72.google.com with SMTP id 89so20857250wrr.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2020 02:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DD/NJLwq0bamxwrGSpcfsRcNRSxti2z+zdKscIzsmx8=;
        b=CGFb7mx2B+fyivN+oUwo6igUUNIOT4rV6Gau5I6qecUaWw279bUCe9PwGMUep3MLTl
         3M7lh3pYObJ1aNWulBSiHaahjCPGWXiiiPidRshX0Fo4UuDSepDA8mdsZhAtJu9jrfR2
         4T/q0yW9f7HKFpa8d8u39BpiioS70SmT2jkyzA7/x5fKBH7Wwrv695fcMi31yOd2uETu
         JbndsX8BXns6x3H+BLx1wpGjMubrqtEk8q1yGhYOETXGAaKGFCYsr6/wf+OweodHSmj5
         dXvfCl6DH24CAa4EQ2CRe52ibMMXvEnZ66lm2s1h/VHL2ZlXREgwBVELyPwSk/HeJ33n
         yhLg==
X-Gm-Message-State: AOAM533Ifcj0OHdwDYbEdlSqAdKSVhoGZw0Q0yrnVNz6naKtUORoe91E
        ECkSep1li0m+3Ebl1ol+i+KXeS/bXPYJbwpNbZRkdZu7KDeEQWpjfGyoqjcK4ZuAGjw3mTp8QRj
        ecI6AETHNELIT237MYZdv+BDfBEcBpIjfmw==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr4055588wrc.218.1594719233555;
        Tue, 14 Jul 2020 02:33:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1p/qy7933UavAoXwgcWhVOtbvoAlMJGxZoS0PdD7U/ByU3kIkzqqn/GZmkZDBKPgptMqMYw==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr4055578wrc.218.1594719233348;
        Tue, 14 Jul 2020 02:33:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a12sm28522958wrv.41.2020.07.14.02.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 02:33:52 -0700 (PDT)
Subject: Re: [PATCH 5.8 regression fix] platform/x86: thinkpad_acpi: Revert:
 Use strndup_user() in dispatch_proc_write()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200714081510.6070-1-hdegoede@redhat.com>
 <CAHp75Vd6uGNw5m3-Tc1tkABLT_Wi7CtW2yo8+B5TpYV4U8XE9A@mail.gmail.com>
 <CAHp75Ve9HF4WVkiUA77s9LsN6d8oaFPRgjLi86FnDSHgmVvTNA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <af1a7c41-071f-4c26-9a9a-7c6ffb5dde88@redhat.com>
Date:   Tue, 14 Jul 2020 11:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve9HF4WVkiUA77s9LsN6d8oaFPRgjLi86FnDSHgmVvTNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/14/20 10:27 AM, Andy Shevchenko wrote:
> On Tue, Jul 14, 2020 at 11:21 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, Jul 14, 2020 at 11:15 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Commit 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user()
>>> in dispatch_proc_write()") cleaned up dispatch_proc_write() by replacing
>>> the code to copy the passed in data from userspae with strndup_user().
>>
>> user space

Ack, do you want me to send a v2, or can you fix this up after applying.

>>> But strndup_user() expects a 0 terminated input buffer and the buffer
>>> passed to dispatch_proc_write() is NOT 0 terminated.
> 
> Second though, perhaps it's a simple wrong count parameter?
> strndup_user(..., min(count, PAGE_SIZE)) or so would work?

I honestly have not looked at a better fix and given that you've just come
up with 2 suggestions which may or may not work, combined with
where we are in the 5.8 cycle I believe it would be best to just
play it safe and go with the revert for 5.8.

If you then take a second attempt at cleaning this up for 5.9 and
send it to me, I can test it for you.

Regards,

Hans


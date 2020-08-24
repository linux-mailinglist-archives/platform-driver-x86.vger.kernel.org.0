Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A81C2509EB
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Aug 2020 22:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgHXUXt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Aug 2020 16:23:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39131 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725904AbgHXUXs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Aug 2020 16:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598300626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vyGWJDyvJY00FAgxgq+e/EO1rMAhwTyKYmnU6NFOHNM=;
        b=VNmyywejfVGoB7l5poeZNfzwQULZYKtJJrn26bSkaS1LraRo2PsM0MOUJyj9fPUouBGE6P
        eyQmlM4wao/EGdz9StVw5pKGjuNTw9I7RSvolVNeYTLVxKYOxK2jmeh8vTC+4zD0xhnMWo
        4OBum0kHk/RkPSaYD6Y4YrbVh5sFy4U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-neWgOpNGNtOLrkgp5ClD0g-1; Mon, 24 Aug 2020 16:23:45 -0400
X-MC-Unique: neWgOpNGNtOLrkgp5ClD0g-1
Received: by mail-ej1-f71.google.com with SMTP id g20so951846ejd.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2020 13:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vyGWJDyvJY00FAgxgq+e/EO1rMAhwTyKYmnU6NFOHNM=;
        b=TqhiAuEeU5moHkU3gJK1TX5kUbchvGD/J/8j1vOIC6jCBS0oiFKoyycyJNsWwPzsLg
         NM7zKigJTdhj9TJfLkfw1QkN9CiKHd0c/3HyqTmHBsiyW2DQJE2NKA8bHbhdAnrWLBH1
         6U6ERVmFrI44pRNFuTKTvGL4sV2+wpBMbmyEY87G+XvXAG0phTU2GIPRx5XnH33GcHnX
         oPlXn18MuotPIkF0plombbPl99C3DSxHMNVozwgt2ct7G/+WIpYBrm9IP5wdNlWNidSL
         ZWvPvrQ7jYquT2LDDattomJDLi/2HHpJFiaHKAzewIA9Z2BnUJemv5gt4LrB1+8BnTXi
         U8gg==
X-Gm-Message-State: AOAM5318+aTNuSy5Q2yitomOhNm2pjxTaL/9qjrrJWVuoTQ5fzv8ExCz
        DJnxXY99Pl8umkD0mATk6UNCfe0Eax1fRygzabWrfPp+ZjICCfVOGIAVRkozZkfhNovy5yjR6Mw
        copLpt7mAI7/KkmAUWGHweMstdn5OKZR0xA==
X-Received: by 2002:a17:906:5914:: with SMTP id h20mr3220523ejq.346.1598300623519;
        Mon, 24 Aug 2020 13:23:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeD6HnHevj3va0/Fax9qNYuz+WC3HQpEdQ4D4Q8SJBcTi8yhbtEiIpIC7cYWTj44KV6lGJsg==
X-Received: by 2002:a17:906:5914:: with SMTP id h20mr3220518ejq.346.1598300623341;
        Mon, 24 Aug 2020 13:23:43 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id o15sm10591298edr.67.2020.08.24.13.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 13:23:42 -0700 (PDT)
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
To:     Marius Iacob <themariusus@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
 <20200824190043.tvy3ryzr27su4bg4@archer-mini>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
Date:   Mon, 24 Aug 2020 22:23:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824190043.tvy3ryzr27su4bg4@archer-mini>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/24/20 9:00 PM, Marius Iacob wrote:
> On 20-08-24 12:02:12, Hans de Goede wrote:
>> Hi,
>>
>> On 8/24/20 10:25 AM, Andy Shevchenko wrote:
>>> On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
>>>
>>>> I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
>>>
>>> Can you be more specific, why that module is not loaded?
>>
>> Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
>> kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.
>>
> 
> I'm sorry, forgot to mention, because my device is a 2-in-1 it uses a detachable keyboard/touchpad and is connected by USB interface. So when trying to load i8042 module (also tried reset/nomux) it always says in dmesg "i8042: PNP: No PS/2 controller found." I'm guessing there is no PS/2 controller on this device...

Ah I see, and I guess that after the "i8042: PNP: No PS/2 controller found." message (which is fine) the module fails to load, right ?

That really is a bug in the i8042 code, if a module is providing symbols to another module it should never exit with an error from
its module_init function.

I guess most people do not have this problem because in the typical distro config the i8042 driver is built into the kernel.

>>>> I see that i8042 is used in asus-nb-wmi for a quirk, so it's not necessary all the time. How can I make it an optional dependecy?
>>
>> include/linux/i8042.h
>>
>> Contains a stub for i8042_install_filter() for when CONFIG_SERIO_I8042 is not enabled, so you can build
>> your own kernel with that option unset. But we really ought to come up with a better fix which will also
>> work for standard distro kernels, see above.
> 
> I've built a asus-nb-wmi module without i8042 references and it works. I had to add "BATC" for battery RSOC (my battery is named BATC). And yes, I also have tried to make the module work for my device around the i8042 dependecy, tried to add IS_REACHABLE(CONFIG_SERIO_I8042) in .c and imply SERIO_I8042 in Kconfig, but it didn't work, so I don't think I was on the right track. I have little experience with kernel development and I figured asking some more experienced people was a better idea.
> Thanks for your reply. If you have any ideas I'm more than happy to try/code them out and submit a patch if/when it works.

If I understand things correctly (see above) then the right fix for the I8042 driver issue is to patch
its module_init function to return with 0 instead of -ENODEV (I guess) when it hits the code path with the
"i8042: PNP: No PS/2 controller found." message.

Let me know if you need any help with that.

As for the "I had to add "BATC" for battery RSOC (my battery is named BATC)" bit I'm missing some
context there / not entirely following you, but lets first tackle the i8042 thing and then look
at that other issue later.

Regards,

Hans


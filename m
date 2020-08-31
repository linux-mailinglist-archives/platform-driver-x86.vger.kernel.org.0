Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F371257468
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Aug 2020 09:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgHaHgf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Aug 2020 03:36:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38073 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725794AbgHaHgd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Aug 2020 03:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598859390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H1Q+eiB3hPzLx9V+90SSVtq1VwhomVrsSmFVzW5+Obw=;
        b=Q8VUbOq/G7E8tYD0M2Cq4BxwJjvjPEVJ241LGqWEEwEfvDroc5FNPnedFh+qj0BY0lK69Y
        STBEGeGoVShebWU7OyPv8koctIluD24XmQ/cD3cXpi+WdfCPCs1vaLVMzz/gMPj3T0W9S/
        5dsE4Fo0eOWihuuQ/v3FZ5n5RZPUSCE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-N3TP7raBNmCeMupQIIxYBA-1; Mon, 31 Aug 2020 03:36:28 -0400
X-MC-Unique: N3TP7raBNmCeMupQIIxYBA-1
Received: by mail-ed1-f71.google.com with SMTP id c3so117773edm.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 00:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H1Q+eiB3hPzLx9V+90SSVtq1VwhomVrsSmFVzW5+Obw=;
        b=cpylhgcQzbe/KyGa9vBqTK9RdbpJqzgnaFf9wHg33bpo/A0gday42duOr2MEPRv2wB
         spjVeLnF1sBVe6QKp9dYnU9WqFwjVAQ34DmSeDvC14i165UrhNftQU+qavmMDBdmCGIF
         KvO08N5gerO1O+EDKv4ubXjkObcVADj7YiUvLBe68aoXR5BsDA0sCzvVZPES9v5yTwbD
         oO266Ib/UjURkHzMgFdEcGBVtGtNg3/JTS/IUUm0tPPcfju5jNzGJujHXYGiGX/MUEvp
         GVgBGQG522HFOWizeGCDBNvdZhsPFcBguanPw9DgLjgL17RcLA1GNQh5biTfpTdpVzHF
         6hqA==
X-Gm-Message-State: AOAM5317s5XsP0HoN+zAAXUsXmUh+N9/4vemHjQFZraElwyHTYPOZtvP
        XJsjud+LF3ok81ATYQdSsopiJy91PT2+YSgmWIiRvRLMpPhkrhpVPW0Qw6ItbzVzGbqZEOEZa4I
        OvKcwclnyiOOaCbkqRnXEzd0tydsCqNzUNQ==
X-Received: by 2002:a17:906:a84f:: with SMTP id dx15mr10647376ejb.377.1598859386700;
        Mon, 31 Aug 2020 00:36:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNTkdvx5CftlcH/vUw8sUD8lwMFv53VKV0deKAF2VHpDAj0Eio04Ibx03Cfx3rsI3VVhoWCg==
X-Received: by 2002:a17:906:a84f:: with SMTP id dx15mr10647359ejb.377.1598859386416;
        Mon, 31 Aug 2020 00:36:26 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id e4sm6689514edv.73.2020.08.31.00.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 00:36:25 -0700 (PDT)
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
To:     Marius Iacob <themariusus@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
 <20200824190043.tvy3ryzr27su4bg4@archer-mini>
 <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
 <20200830211750.bmi2fpylctehqsnm@archer>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a7a5b70e-47bb-e4bc-76ac-82e83fd4d746@redhat.com>
Date:   Mon, 31 Aug 2020 09:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200830211750.bmi2fpylctehqsnm@archer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/30/20 11:17 PM, Marius Iacob wrote:
> On 20-08-24 22:23:41, Hans de Goede wrote:
>> Hi,
>>
>> On 8/24/20 9:00 PM, Marius Iacob wrote:
>>> On 20-08-24 12:02:12, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 8/24/20 10:25 AM, Andy Shevchenko wrote:
>>>>> On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
>>>>>
>>>>>> I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
>>>>>
>>>>> Can you be more specific, why that module is not loaded?
>>>>
>>>> Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
>>>> kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.
>>>>
>>>
>>> I'm sorry, forgot to mention, because my device is a 2-in-1 it uses a detachable keyboard/touchpad and is connected by USB interface. So when trying to load i8042 module (also tried reset/nomux) it always says in dmesg "i8042: PNP: No PS/2 controller found." I'm guessing there is no PS/2 controller on this device...
>>
>> Ah I see, and I guess that after the "i8042: PNP: No PS/2 controller found." message (which is fine) the module fails to load, right ?
> 
> Yes, modprobe: ERROR: could not insert 'i8042': No such device, and there's no trace of i8042 in lsmod output.
> 
>> That really is a bug in the i8042 code, if a module is providing symbols to another module it should never exit with an error from
>> its module_init function.
> 
> i8042 is doing a full init in its module_init. I've bypassed the PNP controller check and it fail while trying to talk to the controller:
> 	i8042: PNP detection disabled
> 	i8042: Can't read CTR while initializing i8042
> 	i8042: probe of i8042 failed with error -5
> I'm guessing it's module_init should look like asus-wmi's: a message saying it's loaded and return 0; but I don't have enough kernel development experience to do this modification.

I haven't looked at the code (yet) but going by your description the trick would be to keep the PnP
check in the module_init function and instead of -ENODEV just return 0 when the check fails so that
the rest of the init function gets skipped.

You probably want to check module_exit in this case to see if that is safe to run with the
rest of module_init skipped.

Let me know if you need more help with this, I believe that fixing this should be pretty easy.


>> I guess most people do not have this problem because in the typical distro config the i8042 driver is built into the kernel.
> 
> I guess I could ask the Arch Linux devs to build the kernel with i8042 in it. But that wouldn't be my first choice.
> 
>>>>>> I see that i8042 is used in asus-nb-wmi for a quirk, so it's not necessary all the time. How can I make it an optional dependecy?
>>>>
>>>> include/linux/i8042.h
>>>>
>>>> Contains a stub for i8042_install_filter() for when CONFIG_SERIO_I8042 is not enabled, so you can build
>>>> your own kernel with that option unset. But we really ought to come up with a better fix which will also
>>>> work for standard distro kernels, see above.
>>>
>>> I've built a asus-nb-wmi module without i8042 references and it works. I had to add "BATC" for battery RSOC (my battery is named BATC). And yes, I also have tried to make the module work for my device around the i8042 dependecy, tried to add IS_REACHABLE(CONFIG_SERIO_I8042) in .c and imply SERIO_I8042 in Kconfig, but it didn't work, so I don't think I was on the right track. I have little experience with kernel development and I figured asking some more experienced people was a better idea.
>>> Thanks for your reply. If you have any ideas I'm more than happy to try/code them out and submit a patch if/when it works.
>>
>> If I understand things correctly (see above) then the right fix for the I8042 driver issue is to patch
>> its module_init function to return with 0 instead of -ENODEV (I guess) when it hits the code path with the
>> "i8042: PNP: No PS/2 controller found." message.
>>
>> Let me know if you need any help with that.
> 
> As I explained above, I think it's more complicated than that. If you have any suggestions of what would be a good course of action here I'd be happy to do the grunt work.

See my answer above, again let me know if you need more help (I will
likely just write a patch for this myself then).

>> As for the "I had to add "BATC" for battery RSOC (my battery is named BATC)" bit I'm missing some
>> context there / not entirely following you, but lets first tackle the i8042 thing and then look
>> at that other issue later.
> 
> The short story for this is that the battery on my device is named BATC and I've had to add a check for BATC (there were alredy checks for BAT0,BAT1,BATT) in asus_wmi_battery_add in asus-wmi.c that is used when asus-nb-wmi is loaded. And this was the main reason I wanted to make this module work, for the battery charge limit.

Ah I see, I was not aware of the existing checks and yes being able to set
battery charge limits is quite useful. So this needs to go into a separate
patch (obviously, since the other patch will be for the i8042 code), but
otherwise this sounds fine for upstream.

Regards,

Hans


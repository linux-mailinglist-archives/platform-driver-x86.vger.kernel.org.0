Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094502C4580
	for <lists+platform-driver-x86@lfdr.de>; Wed, 25 Nov 2020 17:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730519AbgKYQms (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 25 Nov 2020 11:42:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55835 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731920AbgKYQmr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 11:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606322565;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=juZK3f3JocuxFuk0+WI3w/+Fxzz+7CnaTQk8bHSGA3E=;
        b=iNjPLcQH685M9hxaYEBGzGqxqiHwVSZoMK8wVsd/D0LRk2LXAVD7Tu2G/nQgPqNLVJDT+C
        3cxZGsdTnnfSfD7BT7QE9wd962bzt3rOw5iuwCwGNKBnXbGRH6QeN4kLDXPr1JtSuSWZAS
        IWYSOK/M2/xfcpgqPTwymuJ0oUpUo20=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-U6xQ27K9PNuVZoJ14sSkHQ-1; Wed, 25 Nov 2020 11:42:43 -0500
X-MC-Unique: U6xQ27K9PNuVZoJ14sSkHQ-1
Received: by mail-ed1-f69.google.com with SMTP id b68so1281891edf.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 08:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=juZK3f3JocuxFuk0+WI3w/+Fxzz+7CnaTQk8bHSGA3E=;
        b=GG3uTU1IakI4raqUFQOZIvT8jja13AUPCOxIGQVGV+EILs6XcuEilgnhVK6TOhPsNI
         He35cY8pwJQS2sw36J+kD+i+7CUSW8eGPdL3TJ/ZAt7lqVbPnQmEFHipSCFCsqIuRSVG
         ax7xUeOONUIW0fm4xR3qc+Hk594IYeq3PLDhVriWQf0Dz+GKE+p6AwL3HXyqLI3LaQEt
         mMKqAOzAaD5XZRnP0RXcxEaDR2cTzcs434guj2RDT5Zpn/3/1GtAo6jXCXUPM1XFsgZI
         LofwJtE2a9X3AAk03CT0WQjh2DZE23O3Ft4uH2BtHLelTYoaCo00UsqYePtQJHlhU227
         6gWQ==
X-Gm-Message-State: AOAM532+/JowrBL5pW7qKiWoalrIhOSZ+rih9LFHr2DKI01gCklANu4p
        +V5yy9JqmxXEj9fUoCIcACBUme0eOwgsCno2JvlHCqRgvrmZo/gyfcR1Hn8Hzia1bkFZCtsaVv1
        CTMS7SRbxC7Cbc5cEWE47XpqOW5u0aic0+g==
X-Received: by 2002:a17:906:5587:: with SMTP id y7mr3982709ejp.138.1606322562128;
        Wed, 25 Nov 2020 08:42:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxh4Or8HKr+83KVECYRNchQtRYvcSXXNPpLk3nCfBYBpeXj3O9Xk6eX7x5Aodkdv7/36INpA==
X-Received: by 2002:a17:906:5587:: with SMTP id y7mr3982687ejp.138.1606322561889;
        Wed, 25 Nov 2020 08:42:41 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id bn25sm1560291ejb.76.2020.11.25.08.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 08:42:40 -0800 (PST)
Subject: Re: [PATCH v3] ACPI: platform-profile: Add platform profile support
To:     Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "mario.limonciello@dell.com" <mario.limonciello@dell.com>,
        "eliadevito@gmail.com" <eliadevito@gmail.com>,
        "bberg@redhat.com" <bberg@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
References: <markpearson@lenovo.com>
 <20201115004402.342838-1-markpearson@lenovo.com>
 <nRyY5CKaU6WrkbMiM25gTT_bJlrQjTY_UCcQkj8ty-2mPEMVZd4BB9KwrRp7z4GaE3TTOFCXuXnt0_7J_Tj50syusBxTmS5yNZAvYX02X74=@protonmail.com>
 <761671b3-ad26-230b-e709-05ce3bd69498@redhat.com>
 <27a41e3d678f9d7fc889a3a77df87f9ed408887d.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <92a564fa-686f-455d-a0cb-962d4d87a8c7@redhat.com>
Date:   Wed, 25 Nov 2020 17:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <27a41e3d678f9d7fc889a3a77df87f9ed408887d.camel@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/20 4:30 PM, Bastien Nocera wrote:
> On Sat, 2020-11-21 at 15:27 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/20/20 8:50 PM, Barnabás Pőcze wrote:
>>> Hi
>>>
>>>
>>> 2020. november 15., vasárnap 1:44 keltezéssel, Mark Pearson írta:
>>>
>>>> [...]
>>>> +int platform_profile_register(struct platform_profile_handler
>>>> *pprof)
>>>> +{
>>>> +       mutex_lock(&profile_lock);
>>>> +       /* We can only have one active profile */
>>>> +       if (cur_profile) {
>>>> +               mutex_unlock(&profile_lock);
>>>> +               return -EEXIST;
>>>> +       }
>>>> +
>>>> +       cur_profile = pprof;
>>>> +       mutex_unlock(&profile_lock);
>>>> +       return sysfs_create_group(acpi_kobj,
>>>> &platform_profile_group);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(platform_profile_register);
>>>> +
>>>> +int platform_profile_unregister(void)
>>>> +{
>>>> +       mutex_lock(&profile_lock);
>>>> +       sysfs_remove_group(acpi_kobj, &platform_profile_group);
>>>> +       cur_profile = NULL;
>>>> +       mutex_unlock(&profile_lock);
>>>> +       return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(platform_profile_unregister);
>>>> [...]
>>>
>>>
>>> I just realized that the sysfs attributes are only created if a
>>> profile provider
>>> is registered, and it is removed when the provide unregisters
>>> itself. I believe
>>> it would be easier for system daemons if those attributes existed
>>> from module load
>>> to module unload since they can just just open the file and watch
>>> it using poll,
>>> select, etc. If it goes away when the provider unregisters itself,
>>> then I believe
>>> a more complicated mechanism (like inotify) would need to be
>>> implemented in the
>>> daemons to be notified when a new provider is registered. Thus my
>>> suggestion
>>> for the next iteration is to create the sysfs attributes on module
>>> load,
>>> and delete them on unload.
>>>
>>> What do you think?
>>
>> Actually I asked Mark to move this to the register / unregister time
>> since
>> having a non functioning files in sysfs is a bit weird.
>>
>> You make a good point about userspace having trouble figuring when
>> this will
>> show up though (I'm not worried about removal that will normally
>> never happen).
>>
>> I would expect all modules to be loaded before any interested daemons
>> load,
>> but that is an assumption and I must admit that that is a bit racy.
>>
>> Bastien, what do you think about Barnabás' suggestion to always have
>> the
>> files present and use poll (POLL_PRI) on it to see when it changes,
>> listing
>> maybe "none" as available profiles when there is no provider?
> 
> Whether the file exists or doesn't, we have ways to monitor it
> appearing or disappearing. I can monitor the directory with inotify to
> see the file appearing or disappearing, or I can monitor the file with
> inotify to see whether it changes.

Ok, do you have a preference either way? I personally think having the
file only appear if its functional is a bit cleaner. So if it does not
matter much for userspace either way then I suggest we go that route.

> But that doesn't solve the challenges from user-space.
> 
> How do I know whether the computer will have this facility at any
> point? Is "none" a placeholder, or a definite answer as to whether the
> computer will have support for "platform profile"?
> 
> How am I supposed to handle fallbacks, eg. how can I offer support for,
> say, changing the "energy performance preference" from the Intel p-
> state driver if ACPI platform profile isn't available?
> 
> I'm fine with throwing more code at fixing that race, so whatever's
> easier for you, it'll be a pain for user-space either way.
 
Ugh, right this is a bit different from other hotplug cases, where
you just wait for a device to show up before using it, since in
this case you want to use the p-state driver as alternative mechanism
when there is no platform_profile provider.

I'm afraid that the answer here is that the kernel does not really
have anything to help you here. Since the advent of hotplug we had
this issue of determining when the initial hardware probing / driver
loading is done. This is basically an impossible problem since with
things like thunderbolt, etc. probing may be a bit slow and then if
there is a lot of USB devices connected to the thunderbolt dock,
those are slow to probe too, etc. See either we wait 5 minutes just to
be sure, or we cannot really tell when probing is done.

Time has taught us that determining when probing is done is an unsolvable
problem.

We had e.g. udev-settle for this. But that was both slow and not reliable,
so that is deprectated and we don't want to bring it back. In general whenever
someone wants something like udev-settle the answer is to make the
code wanting that more event driven/dynamic. So I'm afraid that that
is the answer here too.

I have the feeling that in most cases the platform_profile driver will have
loaded before the daemon starts. So you could use that as a base assumption
and then do something somewhat ugly like log a message + restart in case you
loose the race. Assuming that that is easy to implement, you could do that
for starters and then if loosing the race becomes a real problem, then
implement something smarter (and more complicated) later.

Sorry, I have no easy answers here.

Regards,

Hans


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12495F8154
	for <lists+platform-driver-x86@lfdr.de>; Sat,  8 Oct 2022 01:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiJGXoS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 7 Oct 2022 19:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJGXoR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2022 19:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04605ABD5E
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 Oct 2022 16:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665186254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G9JJFXsFH0cxxZNhHLJVotmibuFesHsy5hhPOapnY+g=;
        b=SkzUn1pAbb+eTrEvmvuCvc+NIeagwNtmvVXLaDuxDehfTc7DxCJlJrK4vSJEoXB+xpAL8E
        iCpAGuzFb1Kvjxh5zDKm4bGfCeVtuRi5+wd81YKR6I/+q7UKF6hgi3DuNZt/mQDeiR+jMZ
        q1gOM/UT4dwi6f2TgRPGFdlOd2JclAo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-jqfZF_8wM-qpWLrsvAb8Bw-1; Fri, 07 Oct 2022 19:44:12 -0400
X-MC-Unique: jqfZF_8wM-qpWLrsvAb8Bw-1
Received: by mail-ed1-f70.google.com with SMTP id y9-20020a056402270900b00451dfbbc9b2so4831546edd.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Oct 2022 16:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9JJFXsFH0cxxZNhHLJVotmibuFesHsy5hhPOapnY+g=;
        b=toItLHFd4UjMPc4qIyuAMCpiI7DicrcUmV+q1wQGe2hcv4F/M1Ee/UVqIZB0BGf48R
         Wvthq9KO11KHmEoSA7WExNTnQ4t32sH7/tTsR1jeC/ZdxbG1Bqy+MwAiTG+R3JfDc4F3
         +o2sj2GJQEWlundLwZ8nAKyqf/3uZ2geJoFMD2cwErwHCE5z2Cn2tyCJv11xw7zbYYiX
         hZ5Qjtq6JRbS9f9p6fYLsjLnMbfG9HT/p/plbt4V+53vTbw/RzoleSHnj1fPe4W/TsH/
         XGxr8K8LNewZpO5A9Za82QhM9R62MGcmm0N6G/G+bwSJN8hoy0aO69Room6DJtPA55iq
         CObA==
X-Gm-Message-State: ACrzQf2SEuVd3LbzhLf8PjAVLzkCu+W2JubYW5+/L5ci8cxDjrk32kRF
        aftKQ9UJn+XDmpv77xN/kC0I0Jb2apXhFimhA6rbUqbGaWEgEBqdBEGdUPGW/Ywmf/PfsGeDLon
        M2VjJSFaYk9RiwA+mQmumL7FC0A53j2FFGw==
X-Received: by 2002:a05:6402:249f:b0:453:eb1b:1f8b with SMTP id q31-20020a056402249f00b00453eb1b1f8bmr6675988eda.235.1665186251193;
        Fri, 07 Oct 2022 16:44:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Dc1yVugHJ9N1naxQoLDRlS2sUcaBH8hx7fE9VZbkBHR/i0g9dTBlaP2GUUZChhYq952e5+w==
X-Received: by 2002:a05:6402:249f:b0:453:eb1b:1f8b with SMTP id q31-20020a056402249f00b00453eb1b1f8bmr6675973eda.235.1665186250985;
        Fri, 07 Oct 2022 16:44:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ku2-20020a170907788200b0073dc5bb7c32sm1890537ejc.64.2022.10.07.16.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 16:44:10 -0700 (PDT)
Message-ID: <c59c4112-32f6-821b-4176-bc334a68241c@redhat.com>
Date:   Sat, 8 Oct 2022 01:44:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH RFC v2 0/2] Quickstart buttons driver and Toshiba Z830
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input@vger.kernel.org, Azael Avalos <coproscefalo@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <20220922182424.934340-1-lkml@vorpal.se>
 <5179a1cb-6ff4-2e4c-b1cb-cec53c2f41aa@redhat.com>
In-Reply-To: <5179a1cb-6ff4-2e4c-b1cb-cec53c2f41aa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/7/22 13:42, Hans de Goede wrote:
> Hi,
> 
> On 9/22/22 20:24, Arvid Norlander wrote:
>> Hi,
>>
>> This is version 2 of this patch series, incorporating the various feedback
>> on the first version. However, there are some remaining issues that makes
>> me keep this marked RFC:
>> 1. I tried to get rid of the memory allocation in quickstart_acpi_ghid (as
>>    suggested by Barnabás Pőcze), but I could not get that working. I'm not
>>    sure why I did wrong, but I kept getting ACPI errors indicating a buffer
>>    overflow. I would appreciate knowing how to allocate the buffer on stack
>>    properly in this case. The memory leak is at least fixed on the error
>>    path though.
> 
> It can be quite hard to predict how large an object ACPI methods will
> return. Even if you get it right for your laptop model it may fail
> on other models. So using ACPI_ALLOCATE_BUFFER here (which I assume this
> is about) is absolutely fine, I would even say it is a good idea :)
> 
>> 2. The open question mentioned in the original cover letter remains
>>    undiscussed. I would still like some feedback on those points as well.
>>
>> The original cover letter follows:
>>
>> In the following patch series I implement support for three buttons on
>> the Toshiba Satellite/Portege Z830 (same laptop, different markets).
>>
>> These buttons work via a PNP0C32 ACPI device. Hans de Goede pointed out
>> an old and flawed attempt to implement this as a staging driver.
>>
>> With that staging driver as a starting point I have now implemented proper
>> support. I believe I have fixed the flaws with the original staging driver.
>> As it required almost a complete rewrite I have decided to present it as a
>> new driver instead of starting with a revert commit to restore the old
>> driver and then apply fixes on top.
>>
>> The specification for PNP0C32 devices exists as a Microsoft specification.
>> It was previously available on their web site, but seems to have been taken
>> down during the last month. I had a local copy and I have uploaded it to
>> archive.org. It is available here for anyone interested (including a
>> conversion of the docx to PDF):
>>
>> https://archive.org/details/microsoft-acpi-dirapplaunch
>>
>> The old emails about support for these buttons can be found at:
>> https://marc.info/?l=linux-acpi&m=120550727131007
>> https://lkml.org/lkml/2010/5/28/327
>>
>> Table of contents:
>> 1. Summary of standard
>> 2. Issues
>> 2.1. Issue 1: Wake support
>> 2.2. Issue 2: Button identification
>> 2.3. Issue 3: GHID: 64-bit values?
>> 2.4. Issue 4: MAINTAINERS?
>> 3. User space API
>> 3.1. Input device
>> 3.2. Sysfs file: button_id (Read only)
>> 3.3. Sysfs file: wakeup_cause (Read write)
>> 4. HCI_HOTKEY_EVENT register (toshiba_acpi)
>>
>>
>> 1. Summary of standard
>> ======================
>>
>> Here is a brief high level summary of the standard for PNP0C32. See
>> https://archive.org/details/microsoft-acpi-dirapplaunch for the full
>> standard.
>>
>> PNP0C32 devices are "Direct Application Launch" buttons. The idea is that
>> they should work while the laptop is in various sleep modes (or even off).
>> The Z830 does not support waking from any sleep mode using these buttons,
>> it only supports them while it is awake.
>>
>> Each PNP0C32 device represents a single button. Their meaning is completely
>> vendor defined. On Windows you can either:
>> * Make them launch an application when pressed (defined in the registry)
>> * Or an application can subscribe to specific Window messages to get
>>   notified when they are pressed (this is how they are used by the Toshiba
>>   software).
>>
>> 2. Issues
>> =========
>> Unfortunately there are a few issues where I would like some input.
>>
>> On top of that I'm sure there are lots of issues as I'm fairly new to
>> kernel programming!
>>
>> 2.1. Issue 1: Wake support
>> --------------------------
>> This is untested as the Toshiba Z830 that I have simply does not support
>> this part in the firmware. I left the old behaviour in and only adapted it
>> slightly.
>>
>> The driver adds a sysfs file "wakeup_cause" to each PNP0C32 device
>> (inspired by old approach) that would read "true" after causing the wakeup.
>> It would be up to user space query this and reset the value to false.
>> This is basically what the old staging driver did, only moved from an
>> (un-needed) platform driver to each ACPI driver.
>>
>> As I cannot test it (the Z830 does not support the wakeup part of the spec)
>> I'm more inclined to just drop this feature, especially if the current
>> approach is suboptimal. It would then be up to someone else to implement
>> this in the future.
> 
> Hmm, since you have already written / ported the wakeup_cause code
> I would prefer to retain it.
> 
> You could add a module_param (boolean, default off) to enable this using
> a is_visible callback which returns 0 as mode when the boolean is not set
> (thus hiding the wakeup_cause sysfs attribute).
> Then people can easily test this on other models and if it turns out to
> be useful (and works as is) then we can drop the parameter and just
> always enable this.
> 
> That is not the prettiest of solutions, but this way we atleast preserve
> the work/functionality from the staging driver.

So thinking more about this, I believe that the module param would be
over kill and I think it is best to just keep this with the suggested
changes from the review added.

If it works on other models then it might be useful to some users;
and if it turns out to not work then we can change/fix it without
worrying about breaking existing users of the API since if it does
not work in the first place then there won't be any users.

Regards,

Hans


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C193F61EE
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Aug 2021 17:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbhHXPqG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 24 Aug 2021 11:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28127 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238439AbhHXPqE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Aug 2021 11:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629819920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JVoo6nTkJ7onhQ8/CbaBbPdUOugN0zdQ83L6Nre1d/4=;
        b=Nnp8ndRCOsKjwDb43K+vbENIM8sQ02xLNZSyYAqcoSs3BWB7cZGgOtwCbUo4OfxGnv/bl5
        MWu9Y0swfnQZaAHX+HM727pT3XeKjFnOu0bmjTvECXURY0cFp06aeVZW1xXNqQYo38XNd2
        4OQjCK/6kG7mapjdutE95cdsK7r0c9g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-nL-Fym69MRKCP-_-O94pvQ-1; Tue, 24 Aug 2021 11:45:19 -0400
X-MC-Unique: nL-Fym69MRKCP-_-O94pvQ-1
Received: by mail-ed1-f69.google.com with SMTP id z4-20020a05640240c4b02903be90a10a52so10750383edb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Aug 2021 08:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JVoo6nTkJ7onhQ8/CbaBbPdUOugN0zdQ83L6Nre1d/4=;
        b=dkdRkgNA/5Ji5VA/b8EUinaL0BzLPlmgAAXsx2PyhL9OfI2qZWlQ4hQKSMAjI4JQly
         UsRyvAke6t8dA7C/S4EjC+YjvZJPsMwxnriazo0JgECCybI9j1rLzkTAfxEr1lZiTtbi
         baA9OvtaoPfBc0K63pkDSfuPjiWdqb94RBNdOkDh1OOtSCwBsiWYyT/jzNHoAGQKlNRO
         p+1phi88k7CG07WlL2jf5PNaoZYCaMCqONEVH39lFKDJTc1pZxTEg9nMlWa9SqgIl632
         tOVEjFZOA7BMbYkA5UL23qDMaD11E0hL662NWy6mII8Uqg1UNxI7aJuOMSO0CY8TiTNj
         DLFg==
X-Gm-Message-State: AOAM5327MT+DScPFRFJWxF+U4v2YeQsMHkE4612W8Mzv4e6S1CJKPlOi
        +LgPNlBwDAWHlC6Zn5Xf7f9r8MaQW4pweBdbEKcu8gVu122Niw/azbvqQ1YgOeLVk3aZlP5Mc4R
        83MIZItaqBvfNzkOMUbeTdL3d2dXYEUDOsdz415O3WDTsqVNCIBY9/NwiF/d1S8xsm/vBkTc+VZ
        oeDTAvwu42Ig==
X-Received: by 2002:a05:6402:4243:: with SMTP id g3mr43684710edb.85.1629819917689;
        Tue, 24 Aug 2021 08:45:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVx8RAn4hwiP40u7XXIYB7TjFyNpv0G+nlhEnW5KjfCeR11YNw0/WQvHw+BulZl/Xd87r3wQ==
X-Received: by 2002:a05:6402:4243:: with SMTP id g3mr43684699edb.85.1629819917521;
        Tue, 24 Aug 2021 08:45:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k6sm11736160edv.77.2021.08.24.08.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 08:45:16 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] asus-wmi: Add support for custom fan curves
To:     Bastien Nocera <hadess@hadess.net>, Luke Jones <luke@ljones.dev>
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210820095726.14131-1-luke@ljones.dev>
 <20210820095726.14131-2-luke@ljones.dev>
 <321afe1a293be3a623a9be53feea3a008e044b31.camel@hadess.net>
 <L0W4YQ.ZVWQDLFJE8NR2@ljones.dev>
 <e7fbcf85f61b5c727a93df07b3bfe1624547067f.camel@hadess.net>
 <c19dfdde11754c234ca8a45c4af2187699498ee8.camel@hadess.net>
 <U8X4YQ.79I8GZJ1LDW02@ljones.dev>
 <b20a879dce98f27dfc68b86aaf486be9e623eacf.camel@hadess.net>
 <1EQ5YQ.6O8MNIPTU6V4@ljones.dev>
 <7a8a8d56c4e6addfc41b5dd5262968bd169f538f.camel@hadess.net>
 <GGIAYQ.PS5EB67PH64N@ljones.dev>
 <65260602-a1f4-fc8a-a823-ca5a6e4fca60@redhat.com>
 <3bc459afe71eb49c8c0c1f0a0b38855170ae507d.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <23b77371-ee55-6ee2-042d-aedcc41f0748@redhat.com>
Date:   Tue, 24 Aug 2021 17:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3bc459afe71eb49c8c0c1f0a0b38855170ae507d.camel@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/24/21 2:33 PM, Bastien Nocera wrote:
> On Mon, 2021-08-23 at 13:45 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 8/23/21 1:26 PM, Luke Jones wrote:
>>>
>>>
>>> On Mon, Aug 23 2021 at 12:28:21 +0200, Bastien Nocera
>>> <hadess@hadess.net> wrote:
>>>> On Sat, 2021-08-21 at 09:30 +1200, Luke Jones wrote:
>>>>>
>>>>>
>>>>>  On Fri, Aug 20 2021 at 13:39:02 +0200, Bastien Nocera
>>>>>  <hadess@hadess.net> wrote:
>>>>>  > On Fri, 2021-08-20 at 23:00 +1200, Luke Jones wrote:
>>>>>  > >
>>>>>  > >
>>>>>  > >  On Fri, Aug 20 2021 at 12:51:08 +0200, Bastien Nocera
>>>>>  > >  <hadess@hadess.net> wrote:
>>>>>  > >  > On Fri, 2021-08-20 at 12:43 +0200, Bastien Nocera
>>>>> wrote:
>>>>>  > >  > >  On Fri, 2021-08-20 at 22:33 +1200, Luke Jones wrote:
>>>>>  > >  > >  > > Am I going to get bug reports from Asus users
>>>>> that will
>>>>>  > >  > > complain
>>>>>  > >  > >  > > that
>>>>>  > >  > >  > > power-profiles-daemon doesn't work correctly,
>>>>> where I
>>>>>  > > will
>>>>>  > >  > > have
>>>>>  > >  > >  > > to
>>>>>  > >  > >  > > wearily ask if they're using an Asus Rog laptop?
>>>>>  > >  > >  >
>>>>>  > >  > >  > No. Definitely not. The changes to fan curves per-
>>>>> profile
>>>>>  > > need
>>>>>  > >  > > to
>>>>>  > >  > >  > be
>>>>>  > >  > >  > explicitly enabled and set. So a new user will be
>>>>> unaware
>>>>>  > > that
>>>>>  > >  > > this
>>>>>  > >  > >  > control exists (until they look for it) and their
>>>>> laptop
>>>>>  > > will
>>>>>  > >  > >  > behave
>>>>>  > >  > >  > exactly as default.
>>>>>  > >  > >
>>>>>  > >  > >  "The user will need to change the fan curves
>>>>> manually so
>>>>>  > > will
>>>>>  > >  > >  definitely remember to mention it in bug reports" is
>>>>> a very
>>>>>  > >  > > different
>>>>>  > >  > >  thing to "the user can't change the fan curves to be
>>>>>  > > nonsensical
>>>>>  > >  > > and
>>>>>  > >  > >  mean opposite things".
>>>>>  > >  > >
>>>>>  > >  > >  I can assure you that I will eventually get bug
>>>>> reports
>>>>>  > > from
>>>>>  > >  > > "power
>>>>>  > >  > >  users" who break their setup and wonder why things
>>>>> don't
>>>>>  > > work
>>>>>  > >  > >  properly,
>>>>>  > >  > >  without ever mentioning the changes they made
>>>>> changes to
>>>>>  > > the
>>>>>  > > fan
>>>>>  > >  > >  curves, or anything else they might have changed.
>>>>>  > >  >
>>>>>  > >  > A way to taint the settings that power-profiles-daemon
>>>>> could
>>>>>  > > catch
>>>>>  > >  > would be fine by me. I absolutely don't want to have to
>>>>>  > > support
>>>>>  > >  > somebody's tweaks until they undo them.
>>>>>  > >
>>>>>  > >  Definitely understood. Do you have something in mind?
>>>>>  >
>>>>>  > A sysfs attribute with boolean data that shows whether
>>>>> custom fan
>>>>>  > curves are used would be enough.
>>>>>
>>>>>  The path /sys/devices/platform/asus-nb-
>>>>> wmi/active_fan_curve_profiles
>>>>>  should be usable like this? I added this as the method for
>>>>>  controlling
>>>>>  which fan curves for which profiles are active.
>>>>>
>>>>>  If empty, then no custom fan curves are active at all. If it
>>>>> contains
>>>>>  any combination of strings "quiet, balanced, performance" then
>>>>> those
>>>>>  associated (named) platform_profiles have an active fan curve
>>>>> and you
>>>>>  can throw up a general warning, maybe add the contents of that
>>>>> file
>>>>>  too?
>>>>
>>>> That works for me, although I would probably have preferred a way
>>>> that
>>>> wasn't specific to the asus-wmi module, I'm sure I can made do
>>>> with
>>>> that.
>>>
>>> Oh I see, you were looking to get a more general solution
>>> implemented? Maybe something like "/sys/devices/platform/asus-nb-
>>> wmi/platform_profile_tainted"? This could be an opportunity to
>>> maybe make a standardised naming scheme for it.
>>
>> That would standardize the name, but not the location (path to the
>> name);
>> so I'm not sure how helpful that would be. I think that for now
>> going with /sys/devices/platform/asus-nb-
>> wmi/active_fan_curve_profiles is fine
>> and if we hit the same situation with a 2nd driver then maybe do
>> something under the /sys/firmware/acpi/platform_profile* namespace.
>>
>> Maybe something like:
>>
>> /sys/firmware/acpi/platform_profile_flags or something which can
>> communicate a bunch of 0 (keyword not present) / 1 values
>> by containing a list of space separated keywords like:
>> "custom-fan-profiles", where "custom-fan-profiles" would only
>> show up when they are activated ?
> 
> That would work for me but let's wait until there's something to make
> more generic before doing it, as you mentioned.

Ack.

Regards,

Hans


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7B7298125
	for <lists+platform-driver-x86@lfdr.de>; Sun, 25 Oct 2020 11:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415075AbgJYKNd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 25 Oct 2020 06:13:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22433 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1415074AbgJYKNc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Oct 2020 06:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603620811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pb5hNdlEn/EncaYY/4uh2BYj1mke68pTBE2+lMQ4Oos=;
        b=fDlhmuh9LCTf4wHrObzpDyTmVttN0+Iv2xMknyP+WenV7PfUKMAcKaEmtmHBaHdbDdKIhP
        BqxPvBxgf6C3valgahKJZY8B0Aw73FgsMJ52SYUQfm+xvXyVBYTbInV1UvcvWAwoXBAt4J
        UUy5TEj5fEZ3MZxUXB5eX7gq6oB47wI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-pjVOcVGSN4GB4H9uhGIocg-1; Sun, 25 Oct 2020 06:13:29 -0400
X-MC-Unique: pjVOcVGSN4GB4H9uhGIocg-1
Received: by mail-ej1-f71.google.com with SMTP id z8so3341548ejw.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2020 03:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pb5hNdlEn/EncaYY/4uh2BYj1mke68pTBE2+lMQ4Oos=;
        b=LfQ9M6QapSiztKZi2uuJZxbikGPPM0Z/jfzNejNa+A+fgi9wWVFo+lMN6G+TquhPZW
         pqwNOHU68GCQ629ckCsap1HiprG4N7VA9aEzUY4jck/zpjJl77SgGijwPPYpNMT+fqfs
         oHt/a2js41LLI9qr1oMsw8aDZpRzAmzkHxWrpGkuFMzRryOiCGBoMuH7kfpCYjeH3pJR
         ySoFGJM2nfK8LfIhMaeT38Bgk2cAjIgQ4k+Ar6NYLKnmuzhwLRj+xq4n0QY+eWm/+LEK
         JwJVWeKh5qh820vsYrkzi53vrSDfSnMLq4sF13HLQKmNrp0gdt2X+Mh1U3Fmfbc7dEIv
         mE6A==
X-Gm-Message-State: AOAM5333OkDTCKxqRQK6RZo7oMACA9+NP62nivmpkyyYSX60mLPEReo0
        5Ewx6Py8AnusmLXemn9iWJ8ruc5px8Txt9g0y+uvOo3+rHldTNJwaFHOFbjmhDPRS62AdU8SR4d
        YuePFVk9/onvh/rs79OIHbcNhNMh826kPyg==
X-Received: by 2002:a17:906:cc18:: with SMTP id ml24mr9999231ejb.298.1603620808019;
        Sun, 25 Oct 2020 03:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzii2I2p+uPYryV3JMadmz6b4rXa0rwU5fYXqoXq/8FzbO4ENadmDUtGSvTSNw5Oyqc+4Zxg==
X-Received: by 2002:a17:906:cc18:: with SMTP id ml24mr9999191ejb.298.1603620807551;
        Sun, 25 Oct 2020 03:13:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id p16sm3706340ejz.103.2020.10.25.03.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2020 03:13:26 -0700 (PDT)
Subject: Re: Fw: [External] Re: [RFC] Documentation: Add documentation for new
 performance_profile sysfs class (Also Re: [PATCH 0/4] powercap/dtpm: Add the
 DTPM framework)
To:     Mark Pearson <markpearson@lenovo.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Srinivas Pandruvada ,>" <srinivas.pandruvada@linux.intel.com>,
        "Lukasz Luba ,>" <lukasz.luba@arm.com>,
        "Linux Kernel Mailing List ,>" <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "> Zhang, Rui" <rui.zhang@intel.com>,
        Bastien Nocera <hadess@hadess.net>,
        "> Mark Pearson" <mpearson@lenovo.com>,
        "Limonciello, Mario ,>" <Mario.Limonciello@dell.com>,
        Darren Hart <dvhart@infradead.org>,
        "Andy ,> Shevchenko" <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        "> Elia Devito" <eliadevito@gmail.com>,
        Benjamin Berg <bberg@redhat.com>,
        "> linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "> platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20201006122024.14539-1-daniel.lezcano@linaro.org>
 <eb26a00d-eee0-a4d1-ed25-61a661ad5683@redhat.com>
 <8be66efd-7833-2c8a-427d-b0055c2f6ec1@linaro.org>
 <97e5368b-228d-eca1-85a5-b918dfcfd336@redhat.com>
 <CAJZ5v0gwc_d1vnwDVWXY+i4f0T2r0tAz8xuWV7oS_afsy7OocQ@mail.gmail.com>
 <63dfa6a1-0424-7985-7803-756c0c5cc4a5@redhat.com>
 <CAJZ5v0jpYpu3Tk7qq_MCVs0wUr-Dw0rY5EZELrVbQta0NZaoVA@mail.gmail.com>
 <87d9a808-39d6-4949-c4f9-6a80d14a3768@redhat.com>
 <CAJZ5v0iWmmu5WV7cX7uNb61NMYQ7s0dnhg1K+T0x90b3sBfU9w@mail.gmail.com>
 <943531a7-74d6-7c7f-67bc-2645b3ba7b8a@redhat.com>
 <CAJZ5v0j8o5Ot-4U0HmUtckUUBSNqC+TRB6CCRzqdjeE0p_XfvA@mail.gmail.com>
 <25d000cc-0c00-3b17-50f7-ca8de8b7a65b@redhat.com>
 <CAJZ5v0jC=rrTEtqoTvjw5vi=OH7i5OGC-KFuJgjCaXaDsKhUeQ@mail.gmail.com>
 <64de7cf0-5d52-f8b3-426a-431fb3a6a6ec@redhat.com>
 <HK2PR0302MB24494037019FBC7720976735BD1E0@HK2PR0302MB2449.apcprd03.prod.outlook.com>
 <7189685b-4975-ff09-8ac0-59f4e3204359@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cac9cb9b-da8a-a8d6-ed22-bfae75d2e10a@redhat.com>
Date:   Sun, 25 Oct 2020 11:13:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7189685b-4975-ff09-8ac0-59f4e3204359@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/19/20 8:49 PM, Mark Pearson wrote:
> Hi
> 
>> On 19/10/2020 14:43, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 10/18/20 2:31 PM, Rafael J. Wysocki wrote:
>>> On Sun, Oct 18, 2020 at 11:41 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 10/16/20 4:51 PM, Rafael J. Wysocki wrote:
>>>>> On Fri, Oct 16, 2020 at 1:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> <note folding the 2 threads we are having on this into one, adding every one from both threads to the Cc>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 10/14/20 5:42 PM, Rafael J. Wysocki wrote:
>>>>>>> On Wed, Oct 14, 2020 at 4:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>> On 10/14/20 3:33 PM, Rafael J. Wysocki wrote:
>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>>>> First, a common place to register a DPTF system profile seems to be
>>>>>>>>> needed and, as I said above, I wouldn't expect more than one such
>>>>>>>>> thing to be present in the system at any given time, so it may be
>>>>>>>>> registered along with the list of supported profiles and user space
>>>>>>>>> will have to understand what they mean.
>>>>>>>>
>>>>>>>> Mostly Ack, I would still like to have an enum for DPTF system
>>>>>>>> profiles in the kernel and have a single piece of code map that
>>>>>>>> enum to profile names. This enum can then be extended as
>>>>>>>> necessary, but I want to avoid having one driver use
>>>>>>>> "Performance" and the other "performance" or one using
>>>>>>>> "performance-balanced" and the other "balanced-performance", etc.
>>>>>>>>
>>>>>>>> With the goal being that new drivers use existing values from
>>>>>>>> the enum as much as possible, but we extend it where necessary.
>>>>>>>
>>>>>>> IOW, just a table of known profile names with specific indices assigned to them.
>>>>>>
>>>>>> Yes.
>>>>>>
>>>>>>> This sounds reasonable.
>>>>>>>
>>>>>>>>> Second, irrespective of the above, it may be useful to have a
>>>>>>>>> consistent way to pass performance-vs-power preference information
>>>>>>>>> from user space to different parts of the kernel so as to allow them
>>>>>>>>> to adjust their operation and this could be done with a system-wide
>>>>>>>>> power profile attribute IMO.
>>>>>>>>
>>>>>>>> I agree, which is why I tried to tackle both things in one go,
>>>>>>>> but as you said doing both in 1 API is probably not the best idea.
>>>>>>>> So I believe we should park this second issue for now and revisit it
>>>>>>>> when we find a need for it.
>>>>>>>
>>>>>>> Agreed.
>>>>>>>
>>>>>>>> Do you have any specific userspace API in mind for the
>>>>>>>> DPTF system profile selection?
>>>>>>>
>>>>>>> Not really.
>>>>>>
>>>>>> So before /sys/power/profile was mentioned, but that seems more like
>>>>>> a thing which should have a set of fixed possible values, iow that is
>>>>>> out of scope for this discussion.
>>>>>
>>>>> Yes.
>>>>>
>>>>>> Since we all seem to agree that this is something which we need
>>>>>> specifically for DPTF profiles maybe just add:
>>>>>>
>>>>>> /sys/power/dptf_current_profile    (rw)
>>>>>> /sys/power/dptf_available_profiles (ro)
>>>>>>
>>>>>> (which will only be visible if a dptf-profile handler
>>>>>>   has been registered) ?
>>>>>>
>>>>>> Or more generic and thus better (in case other platforms
>>>>>> later need something similar) I think, mirror the:
>>>>>>
>>>>>> /sys/bus/cpu/devices/cpu#/cpufreq/energy_performance_* bits
>>>>>> for a system-wide energy-performance setting, so we get:
>>>>>>
>>>>>> /sys/power/energy_performance_preference
>>>>>> /sys/power/energy_performance_available_preferences
>>>>>
>>>>> But this is not about energy vs performance only in general, is it?
>>>>>
>>>>>> (again only visible when applicable) ?
>>>>>>
>>>>>> I personally like the second option best.
>>>>>
>>>>> But I would put it under /sys/firmware/ instead of /sys/power/ and I
>>>>> would call it something like platform_profile (and
>>>>> platform_profile_choices or similar).
>>>>
>>>> Currently we only have dirs under /sys/firmware:
>>>>
>>>> [hans@x1 ~]$ ls /sys/firmware
>>>> acpi  dmi  efi  memmap
>>>>
>>>> But we do have /sys/firmware/apci/pm_profile:
>>>>
>>>> Documentation/ABI/stable/sysfs-acpi-pmprofile
>>>>
>>>> What:           /sys/firmware/acpi/pm_profile
>>>> Date:           03-Nov-2011
>>>> KernelVersion:  v3.2
>>>> Contact:        linux-acpi@vger.kernel.org
>>>> Description:    The ACPI pm_profile sysfs interface exports the platform
>>>>                  power management (and performance) requirement expectations
>>>>                  as provided by BIOS. The integer value is directly passed as
>>>>                  retrieved from the FADT ACPI table.
>>>> Values:         For possible values see ACPI specification:
>>>>                  5.2.9 Fixed ACPI Description Table (FADT)
>>>>                  Field: Preferred_PM_Profile
>>>>
>>>>                  Currently these values are defined by spec:
>>>>                  0 Unspecified
>>>>                  1 Desktop
>>>>                  2 Mobile
>>>>                  3 Workstation
>>>>                  4 Enterprise Server
>>>>                  ...
>>>>
>>>> Since all platforms which we need this for are ACPI based
>>>> (and the involved interfaces are also all ACPI interfaces)
>>>> how about:
>>>>
>>>> /sys/firmware/acpi/platform_profile
>>>> /sys/firmware/acpi/platform_profile_choices
>>>>
>>>> ?
>>>>
>>>> I think this goes nice together with /sys/firmware/acpi/pm_profile
>>>> although that is read-only and this is a read/write setting.
>>>>
>>>> Rafel, would:
>>>>
>>>> /sys/firmware/acpi/platform_profile
>>>> /sys/firmware/acpi/platform_profile_choices
>>>>
>>>> work for you ?
>>>
>>> Yes, it would.
>>
>> Great. So I think hat means that we have the most important part
>> for moving forward with this.
>>
>> So I guess the plan for this now looks something like this.
>>
>> 1. Rewrite my API docs RFC to update it for the new /sys/firmware/acpi/platform_profile[_choices]
>>     plan (should be easy and a bunch of stuff like the "type" bit can just be dropped)
>>
>> 2. Add code somewhere under drivers/acpi which allows code from else where
>>     to register itself as platform_profile handler/provider.
>>
>> Rafael, any suggestions / preference for where this should be added under
>> drivers/acpi ?  In a new .c file perhaps ?
>>
>> 3.1 Use the code from 2 to add support for platform-profile selection in
>>      thinkpad_acpi (something for me or Mark Pearson) to do
>> 3.2 Use the code from 2 to add support for platform-profile selection
>>      to hp-wmi
>> 3.3 (and to other drivers in the future).
>>
>>
>> An open question is who will take care of 1. and 2. Mark (Pearson)
>> do you feel up to this? or do you want me to take care of this?
>>
>> Regards,
>>
>> Hans
>>
> 
> Definitely up for (2) and will happily have a go at number (1).
> 
> If there's an example of something similar I can look at for reference that would be helpful :)

So what I would do is something like this:

1.  Create a new include/acpi/platform_profile_provider.h file and
    in that file define:
1.1 An enum with possible profile values (as discussed we want the driver
    API to use an enum (which may be extended) and then use an array with
    strings inside the shared code to avoid differences like "Performance"
    vs "performance", etc. The enum should end with something like:
    ACPI_PLATFORM_PROFILE_COUNT
1.2 An acpi_platform_profile_provider struct in which contains a number of
    function-pointers for set/get callbacks (these callbacks should get/set
    the enum type, not strings) a "void *user_data" (to be passed back to the callbacks)
    and a: "unsigned long profile_choices[BITS_TO_LONGS(ACPI_PLATFORM_PROFILE_COUNT)]
    member.
1.3 A function to register / unregister a platform_profile_provider

2. Add a new .c file for this under drivers/acpi which should
   contain the actual implementation of the API (left to you) and at least
   2 global variables a "struct acpi_platform_profile_provider *profile_provider;"
   and a mutex protecting this. The register/unregister function should lock
   the mutex to protect the pointer and the register function should check that
   this is the first provider being registered if there already is a provider
   registered then -EBUSY should be returned.
   The register/unregister functions should also add / remove the 2
   /sys/firmware/acpi/platform_profile[_choices] files.

   Hint for the read function of the platform_profile_choices function you
   should use for_each_set_bit(bit, profile_choices, ACPI_PLATFORM_PROFILE_COUNT) {}

Note this is more or less what I would do (minus any changes I would come up
with when implementing this), feel free to use your own judgement here.

Rafael, do you have any comments on this approach ?

Regards,

Hans


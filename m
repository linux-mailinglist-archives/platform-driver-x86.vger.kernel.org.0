Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FC52916C3
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Oct 2020 11:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgJRJlw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Oct 2020 05:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30264 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725385AbgJRJlv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Oct 2020 05:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603014110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TudAeQsUJ5pd5Y9j32+DABfeXi6VPO6ucETRD2xY/80=;
        b=SgwDQIIu0A04Xnf99o+R1ehtC2qY8Jx449HjFD8ccCmoVaCOFpifg4D21gZt9gvOSIhcu2
        sVs44E7mP8Cvt8IcdrE8dOovPmJmuDCCT+Zx90X8r1EoUwHqQoodx8WcjZd8ua/8fhnG0v
        zFZKZWDLroYgEcnv7v2BK8TbXl7UBTA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-rYV-AdVNPj6cTMA3s5YDmg-1; Sun, 18 Oct 2020 05:41:48 -0400
X-MC-Unique: rYV-AdVNPj6cTMA3s5YDmg-1
Received: by mail-ed1-f71.google.com with SMTP id t4so3518130edv.7
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2020 02:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TudAeQsUJ5pd5Y9j32+DABfeXi6VPO6ucETRD2xY/80=;
        b=GU54nD0cd8vZgzyC9GuTpnqsIXsX97BTnqgRBQUDUEG7cDvR0ZDQjwG1oc+bMICFrd
         QRZd13NCm1r9DJvzcQklWndloOIQprkZN9/RHuhyrKaXoj4cjW8Hbh9ABx7YfNnMN4gZ
         JKIPq0ogwx6jT713NnDQHRNJ6kJtOjH7BOShHNatHLhl82ePqcYJv1SzCZ8PF5AO7Fg+
         mWm+rwvQ5a99iaKVyR7Nl/yoo/j/+BovEqi0T9akQJ8aucHvfJUcdFxrG5855h0x6eP/
         uZMHjywefQKfEC5IZakJGUIjlkF7BtzZZ7nrjY3yLMKAgzDMmExNTrq0wozyHrh6NrO+
         omlQ==
X-Gm-Message-State: AOAM530SBSVIzDKH0Ze2HJ7zbl0zF0gl0FWwt0/pbd5QjuvsNAggjel7
        Aznyy17xIpVWh5C/fgS/ROPajpqVgkdS1AHszUqqVnvh7E+SsLCyuTjV5+VT9Nxkv7q0RKVLQkM
        UdqACCkDshVA6oZh4CXZoAMxsj5VisIj/+Q==
X-Received: by 2002:a17:906:4b10:: with SMTP id y16mr12440826eju.395.1603014106693;
        Sun, 18 Oct 2020 02:41:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcnIf9lwkS7uf9YuTtQEMADmv9iWsC1b8Wz5e5LENkpMb7HO4p498S/QnYsgaX90GOyZUqoA==
X-Received: by 2002:a17:906:4b10:: with SMTP id y16mr12440808eju.395.1603014106415;
        Sun, 18 Oct 2020 02:41:46 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id os11sm7040204ejb.104.2020.10.18.02.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2020 02:41:45 -0700 (PDT)
Subject: Re: [RFC] Documentation: Add documentation for new
 performance_profile sysfs class (Also Re: [PATCH 0/4] powercap/dtpm: Add the
 DTPM framework)
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Zhang, Rui" <rui.zhang@intel.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Pearson <mpearson@lenovo.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Elia Devito <eliadevito@gmail.com>,
        Benjamin Berg <bberg@redhat.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <25d000cc-0c00-3b17-50f7-ca8de8b7a65b@redhat.com>
Date:   Sun, 18 Oct 2020 11:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0j8o5Ot-4U0HmUtckUUBSNqC+TRB6CCRzqdjeE0p_XfvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/16/20 4:51 PM, Rafael J. Wysocki wrote:
> On Fri, Oct 16, 2020 at 1:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> <note folding the 2 threads we are having on this into one, adding every one from both threads to the Cc>
>>
>> Hi,
>>
>> On 10/14/20 5:42 PM, Rafael J. Wysocki wrote:
>>> On Wed, Oct 14, 2020 at 4:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 10/14/20 3:33 PM, Rafael J. Wysocki wrote:
>>
>> <snip>
>>
>>>>> First, a common place to register a DPTF system profile seems to be
>>>>> needed and, as I said above, I wouldn't expect more than one such
>>>>> thing to be present in the system at any given time, so it may be
>>>>> registered along with the list of supported profiles and user space
>>>>> will have to understand what they mean.
>>>>
>>>> Mostly Ack, I would still like to have an enum for DPTF system
>>>> profiles in the kernel and have a single piece of code map that
>>>> enum to profile names. This enum can then be extended as
>>>> necessary, but I want to avoid having one driver use
>>>> "Performance" and the other "performance" or one using
>>>> "performance-balanced" and the other "balanced-performance", etc.
>>>>
>>>> With the goal being that new drivers use existing values from
>>>> the enum as much as possible, but we extend it where necessary.
>>>
>>> IOW, just a table of known profile names with specific indices assigned to them.
>>
>> Yes.
>>
>>> This sounds reasonable.
>>>
>>>>> Second, irrespective of the above, it may be useful to have a
>>>>> consistent way to pass performance-vs-power preference information
>>>>> from user space to different parts of the kernel so as to allow them
>>>>> to adjust their operation and this could be done with a system-wide
>>>>> power profile attribute IMO.
>>>>
>>>> I agree, which is why I tried to tackle both things in one go,
>>>> but as you said doing both in 1 API is probably not the best idea.
>>>> So I believe we should park this second issue for now and revisit it
>>>> when we find a need for it.
>>>
>>> Agreed.
>>>
>>>> Do you have any specific userspace API in mind for the
>>>> DPTF system profile selection?
>>>
>>> Not really.
>>
>> So before /sys/power/profile was mentioned, but that seems more like
>> a thing which should have a set of fixed possible values, iow that is
>> out of scope for this discussion.
> 
> Yes.
> 
>> Since we all seem to agree that this is something which we need
>> specifically for DPTF profiles maybe just add:
>>
>> /sys/power/dptf_current_profile    (rw)
>> /sys/power/dptf_available_profiles (ro)
>>
>> (which will only be visible if a dptf-profile handler
>>  has been registered) ?
>>
>> Or more generic and thus better (in case other platforms
>> later need something similar) I think, mirror the:
>>
>> /sys/bus/cpu/devices/cpu#/cpufreq/energy_performance_* bits
>> for a system-wide energy-performance setting, so we get:
>>
>> /sys/power/energy_performance_preference
>> /sys/power/energy_performance_available_preferences
> 
> But this is not about energy vs performance only in general, is it?
> 
>> (again only visible when applicable) ?
>>
>> I personally like the second option best.
> 
> But I would put it under /sys/firmware/ instead of /sys/power/ and I
> would call it something like platform_profile (and
> platform_profile_choices or similar).

Currently we only have dirs under /sys/firmware:

[hans@x1 ~]$ ls /sys/firmware
acpi  dmi  efi  memmap

But we do have /sys/firmware/apci/pm_profile:

Documentation/ABI/stable/sysfs-acpi-pmprofile

What:           /sys/firmware/acpi/pm_profile
Date:           03-Nov-2011
KernelVersion:  v3.2
Contact:        linux-acpi@vger.kernel.org
Description:    The ACPI pm_profile sysfs interface exports the platform
                power management (and performance) requirement expectations
                as provided by BIOS. The integer value is directly passed as
                retrieved from the FADT ACPI table.
Values:         For possible values see ACPI specification:
                5.2.9 Fixed ACPI Description Table (FADT)
                Field: Preferred_PM_Profile

                Currently these values are defined by spec:
                0 Unspecified
                1 Desktop
                2 Mobile
                3 Workstation
                4 Enterprise Server
		...

Since all platforms which we need this for are ACPI based
(and the involved interfaces are also all ACPI interfaces)
how about:

/sys/firmware/acpi/platform_profile
/sys/firmware/acpi/platform_profile_choices

?

I think this goes nice together with /sys/firmware/acpi/pm_profile
although that is read-only and this is a read/write setting.

Rafel, would:

/sys/firmware/acpi/platform_profile
/sys/firmware/acpi/platform_profile_choices

work for you ?

Regards,

Hans



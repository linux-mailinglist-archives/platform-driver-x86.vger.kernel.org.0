Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E63A27253E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 21 Sep 2020 15:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgIUNSn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 21 Sep 2020 09:18:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41577 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726353AbgIUNSm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 09:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600694319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=35I3qr6WLeCCn4WPkLuTptC2Ivu0yAxB872vFqkh5Dw=;
        b=QoiX8t/W1icbxMG/nLKR3SF1wXnsdg9+BghSusm/mGAODIO5zADplok0RSUim55VBVazKD
        1civHMdlfYGN/l+2Riigp1VVzQw90ubwFi5ZvMjdH1TDmtAzi40SoDvl3bHBSM71/G8DiE
        d8GoahgM0rqcfqrmqdYhDVFkApbgccU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-vjeuBzvOP5OGS_IZ95iYtQ-1; Mon, 21 Sep 2020 09:18:37 -0400
X-MC-Unique: vjeuBzvOP5OGS_IZ95iYtQ-1
Received: by mail-ed1-f72.google.com with SMTP id r8so4566720edy.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 06:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=35I3qr6WLeCCn4WPkLuTptC2Ivu0yAxB872vFqkh5Dw=;
        b=EpqeUa4MXrLQEX2S0DTZTlaaLxwd0ukzwWT038JYRglqkJGqBiO9QADY751SYeKQbs
         OCa1ktpeB7CaSEx3wnMGGl3Ubzd10yaDor6lxKLP172TVuodWGLv4UrGMMH3GXmxIjUn
         yGuquyPXEb4ODGa9u3nEfVNxsH5BPrDhIVW9siiuZmtvYtlbGIQzxVXfVHX+9BABkI84
         4EVaou4Yv94vQvwk5Aj1cauV4EhB2XXQV2lFEPXpXqHyvRoM1e/MeeHOjuMokR1xo/Kb
         HVEVCM/YSyCYcJqr0XCy70mPkTzes3a//0TQwUj0dKUWALeYiOeEMjOgC4U6jvFENx0k
         IiPQ==
X-Gm-Message-State: AOAM53313+VExeA/prgtUNcBN1wELf2fdbT1ExKDVYpcd9jXJnnO6ZNB
        4bKEq7WzWmEYTEZgqirzKx0+MMHF6MXtHe5DZdVuOV7OCmYscDTq/YvTQBX2Bn77uh2gfsanYmz
        qUcc/+QwKeYLiyCfmX6Mf0FWqE/JRnfBeCg==
X-Received: by 2002:a17:907:40c1:: with SMTP id nv1mr51759794ejb.318.1600694316256;
        Mon, 21 Sep 2020 06:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRtkGueuz4hL5qdUjnxB0y/mdXCSRegEnE/f5KzfWGN4E5QxVyuFeU8/KWdTtTwyjchJs/Kg==
X-Received: by 2002:a17:907:40c1:: with SMTP id nv1mr51759748ejb.318.1600694315776;
        Mon, 21 Sep 2020 06:18:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id be2sm8589193edb.0.2020.09.21.06.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 06:18:35 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/3] platform/x86: Intel PMT Crashlog capability driver
To:     Alexander Duyck <alexander.duyck@gmail.com>
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>, dvhart@infradead.org,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-4-david.e.box@linux.intel.com>
 <6e3738db-bfff-7fd2-65e6-bd0d126f9eaa@redhat.com>
 <CAKgT0UcxSwRseMBdMd0_HDUS=JGZDAZnAy-tkLkB-hMXLYtucw@mail.gmail.com>
 <CAKgT0UfM0534GZcKzgTeEa3nq2+FWHk4PfA593smGOLun4d97A@mail.gmail.com>
 <67f5816a-1307-da81-ff71-cea1f907b58b@redhat.com>
 <CAKgT0UdvuLuDRnE5nzOr6fWkC9TJVQNRa+kf1Pcb9mUxGMBXPw@mail.gmail.com>
Message-ID: <e7abdcfe-174c-d8e2-c867-107801041742@redhat.com>
Date:   Mon, 21 Sep 2020 15:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKgT0UdvuLuDRnE5nzOr6fWkC9TJVQNRa+kf1Pcb9mUxGMBXPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 11:35 PM, Alexander Duyck wrote:
> On Thu, Sep 17, 2020 at 5:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 9/15/20 12:35 AM, Alexander Duyck wrote:
>>> On Mon, Sep 14, 2020 at 11:07 AM Alexander Duyck
>>> <alexander.duyck@gmail.com> wrote:
>>>>
>>>> On Mon, Sep 14, 2020 at 6:42 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 9/11/20 9:45 PM, David E. Box wrote:
>>>>>> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>>
>>>>>> Add support for the Intel Platform Monitoring Technology crashlog
>>>>>> interface.  This interface provides a few sysfs values to allow for
>>>>>> controlling the crashlog telemetry interface as well as a character driver
>>>>>> to allow for mapping the crashlog memory region so that it can be accessed
>>>>>> after a crashlog has been recorded.
>>>>>>
>>>>>> This driver is meant to only support the server version of the crashlog
>>>>>> which is identified as crash_type 1 with a version of zero. Currently no
>>>>>> other types are supported.
>>>>>>
>>>>>> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>>>>>> ---
>>>>>>     .../ABI/testing/sysfs-class-pmt_crashlog      |  66 ++
>>>>>>     drivers/platform/x86/Kconfig                  |  10 +
>>>>>>     drivers/platform/x86/Makefile                 |   1 +
>>>>>>     drivers/platform/x86/intel_pmt_crashlog.c     | 588 ++++++++++++++++++
>>>>>>     4 files changed, 665 insertions(+)
>>>>>>     create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_crashlog
>>>>>>     create mode 100644 drivers/platform/x86/intel_pmt_crashlog.c
>>>>>>
>>>>>> diff --git a/Documentation/ABI/testing/sysfs-class-pmt_crashlog b/Documentation/ABI/testing/sysfs-class-pmt_crashlog
>>>>>> new file mode 100644
>>>>>> index 000000000000..40fb4ff437a6
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/ABI/testing/sysfs-class-pmt_crashlog
>>>>>> @@ -0,0 +1,66 @@
>>>>>> +What:                /sys/class/pmt_crashlog/
>>>>>> +Date:                September 2020
>>>>>> +KernelVersion:       5.10
>>>>>> +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> +Description:
>>>>>> +             The pmt_crashlog/ class directory contains information
>>>>>> +             for devices that expose crashlog capabilities using the Intel
>>>>>> +             Platform Monitoring Technology (PTM).
>>>>>> +
>>>>>> +What:                /sys/class/pmt_crashlog/crashlogX
>>>>>> +Date:                September 2020
>>>>>> +KernelVersion:       5.10
>>>>>> +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> +Description:
>>>>>> +             The crashlogX directory contains files for configuring an
>>>>>> +             instance of a PMT crashlog device that can perform crash data
>>>>>> +             recoring. Each crashlogX device has an associated
>>>>>> +             /dev/crashlogX device node. This node can be opened and mapped
>>>>>> +             to access the resulting crashlog data. The register layout for
>>>>>> +             the log can be determined from an XML file of specified guid
>>>>>> +             for the parent device.
>>>>>> +
>>>>>> +What:                /sys/class/pmt_crashlog/crashlogX/guid
>>>>>> +Date:                September 2020
>>>>>> +KernelVersion:       5.10
>>>>>> +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> +Description:
>>>>>> +             (RO) The guid for this crashlog device. The guid identifies the
>>>>>> +             version of the XML file for the parent device that should be
>>>>>> +             used to determine the register layout.
>>>>>> +
>>>>>> +What:                /sys/class/pmt_crashlog/crashlogX/size
>>>>>> +Date:                September 2020
>>>>>> +KernelVersion:       5.10
>>>>>> +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> +Description:
>>>>>> +             (RO) The length of the result buffer in bytes that corresponds
>>>>>> +             to the mapping size for the /dev/crashlogX device node.
>>>>>> +
>>>>>> +What:                /sys/class/pmt_crashlog/crashlogX/offset
>>>>>> +Date:                September 2020
>>>>>> +KernelVersion:       5.10
>>>>>> +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> +Description:
>>>>>> +             (RO) The offset of the buffer in bytes that corresponds
>>>>>> +             to the mapping for the /dev/crashlogX device node.
>>>>>> +
>>>>>> +What:                /sys/class/pmt_crashlog/crashlogX/enable
>>>>>> +Date:                September 2020
>>>>>> +KernelVersion:       5.10
>>>>>> +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> +Description:
>>>>>> +             (RW) Boolean value controlling if the crashlog functionality
>>>>>> +             is enabled for the /dev/crashlogX device node.
>>>>>> +
>>>>>> +What:                /sys/class/pmt_crashlog/crashlogX/trigger
>>>>>> +Date:                September 2020
>>>>>> +KernelVersion:       5.10
>>>>>> +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>>> +Description:
>>>>>> +             (RW) Boolean value controlling  the triggering of the
>>>>>> +             /dev/crashlogX device node. When read it provides data on if
>>>>>> +             the crashlog has been triggered. When written to it can be
>>>>>> +             used to either clear the current trigger by writing false, or
>>>>>> +             to trigger a new event if the trigger is not currently set.
>>>>>> +
>>>>>
>>>>> Both the pmt_crashlog and the attributes suggest that this is highly
>>>>> Intel PMT specific. /sys/class/foo interfaces are generally speaking
>>>>> meant to be generic interfaces.
>>>>>
>>>>> If this was defining a generic, vendor and implementation agnostic interface for
>>>>> configuring / accessing crashlogs, then using a class would be fine, but that
>>>>> is not the case, so I believe that this should not implement / register a class.
>>>>>
>>>>> Since the devices are instantiated through MFD there already is a
>>>>> static sysfs-path which can be used to find the device in sysfs:
>>>>> /sys/bus/platform/device/pmt_crashlog
>>>>>
>>>>> So you can register the sysfs attributes directly under the platform_device
>>>>> and then userspace can easily find them, so there really is no need to
>>>>> use a class here.
>>>>
>>>> I see. So we change the root directory from "/sys/class/pmt_crashlog/"
>>>> to "/sys/bus/platform/device/pmt_crashlog" while retaining the same
>>>> functionality. That should be workable.
>>>
>>> So one issue as I see it is that if we were to change this then we
>>> probably need to to change the telemetry functionality that was
>>> recently accepted
>>> (https://lore.kernel.org/lkml/20200819180255.11770-1-david.e.box@linux.intel.com/)

You say that this has been accepted, by I don't see any intel_pmt.c
file here yet: ?

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mfd/

>>> as well. The general idea with using the /sys/class/pmt_crashlog/
>>> approach was to keep things consistent with how the pmt_telemetry was
>>> being accessed. So if we change this then we end up with very
>>> different interfaces for the two very similar pieces of functionality.
>>> So ideally we would want to change both telemetry and crashlog to
>>> function the same way.
>>
>> I agree that the telemetry interface should be changed in a similar way.
>>
>> Luckily it seems that this is not in Linus' tree yet and I'm also not
>> seeing it in next yet, e.g. :
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/platform/x86/intel_pmt_telemetry.c
>> does not exist.
>>
>> So we seem to still have time to also get the telemetry driver userspace API
>> fixed too.
>>
>> I see that Andy gave his Reviewed-by for the intel_pmt_telemetry.c code.
>>
>> Andy, I have some concerns about the userspace API choices made here,
>> see my earlier review of this patch. Do you agree with my suggestions,
>> or do you think it would be ok to move forward with the telemetry and
>> now also the crashlog API each registering their own private class
>> under /sys/class ?
>>
>> AFAIK classes are supposed to be generic and not driver-private, so
>> that seems wrong to me.  Also PMC is Intel specific and vendor specific
>> stuff really does not belong under /sys/class AFAIK ?
>>
>>> Do you have any good examples of anything that has done something
>>> similar? From what I can tell it looks like we need to clean up the
>>> naming to drop the ".%d.auto" for the bus directory names
>>
>> Assuming there will only be one of each platform-device, then you
>> can just replace the PLATFORM_DEVID_AUTO param to devm_mfd_add_devices()
>> with PLATFORM_DEVID_NONE and the .%d.auto will go away.
> 
> We will have multiples of each platform device. So for example we can
> have multiple OOBMSM in each system and each OOBMSM may have multiple
> telemetry regions and maybe one crashlog.

What is a OOBMSM ? Please don't make the person reviewing your patches
do detective work. Only use acronyms if they are something of which
you could reasonably expect any mailinglist reader to know what
they are.

So looking at:
https://lore.kernel.org/lkml/20200819180255.11770-3-david.e.box@linux.intel.com/

What you are saying (I guess) is that both the pmt_pci_probe()
function may run multiple times; and that for a single pmt_pci_probe()
call, pmt_add_dev() may hit the DVSEC_INTEL_ID_TELEMETRY case more then
once?

If I understand either one correct, then indeed we need PLATFORM_DEVID_AUTO.

Which I guess makes using a class for enumeration somewhat sensible.

But I really do not think we need 2 separate classes, one for
pmt_telemetry and one for pmt_crashlog. Also since this is rather
Intel specific lets at least make that clear in the name.

So how about intel_pmt as class and then register both the telemetry
and the crashlog devs there? (the type can easily be deferred from
the name part before the .%d.auto suffix) ?


>>> and then
>>> look at adding a folder to handle all of the instances of either
>>> telemetry or crashlog, assuming we follow the reg-dummy or serial8250
>>> model.
>>
>> So there can be multiple instances, you mean like the multiple chardevs
>> you add now, or can there be multiple platform-devices of the same
>> time instantiated through the MFD code ?
>>
>> If you mean like the multiple chardevs, then yes you could add a folder
>> for the binary sysfs attributes replacing those, or register them
>> with a dynamic name with a number appended to the name.
> 
> In addition to just the binary sysfs we need to expose several other
> fields including the GUID, the size, and controls for enabling,
> disabling, and either triggering or checking to see if the crashlog
> has already been triggered. As such we would end up with a folder per
> device and the binary sysfs would probably be living in the folder.

Erm, in the Documentation/ABI/testing/sysfs-class-pmt_crashlog
file from above you already put all that in sysfs ?

So just add the binary sysfs file replacing the char-device next
to (in the same dir as) the existing sysfs attributes for these.

>>> Similarly the crashlog and telemetry both rely on similar mechanisms
>>> to display the MMIO region containing the data. I still need to spend
>>> some more time looking into what is involved in switching from a char
>>> device to a binary sysfs, but I think with the example I found earlier
>>> of the resourceN bit from the PCI sysfs I can probably make that work
>>> for both cases.
>>
>> I'm not sure that the PCI sysfs io resources are the best example,
>> as mentioned those mmap to actual memory-mapped io, which is somewhat
>> special.
> 
> The reason why I bring them up is because there are cases for
> telemetry where the applications will likely want to be able to just
> memory map the region and poll on certain statistics. So if nothing
> else we may end up supporting both a mmap and a read option.

Ok.

Regards,

Hans


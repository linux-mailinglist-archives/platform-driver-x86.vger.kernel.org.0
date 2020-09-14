Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983B526880D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Sep 2020 11:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgINJOE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Sep 2020 05:14:04 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47240 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726285AbgINJOB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Sep 2020 05:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600074837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CfJskBQHpZ9+0kSwLmzC02tWH8sjBa4yGY+QGL9Ecbg=;
        b=cy/llAoH/ik1fOffYstaawNlSu/8zhyVx50fSNmtkSrZrWyWkS27jvCwdm07d9ztae2Lre
        HfrEFv8I/9CSLC4BojNyfamnzNfd4s3AYOS6Xg9ZHiPoWbVslnZEGCtJPnFqVB0qTIrpDL
        etFiLfuVDTnxQ+GYmpusstqGSwbG3gM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-_TmTjAusMKCM1ZtXMNogRw-1; Mon, 14 Sep 2020 05:13:55 -0400
X-MC-Unique: _TmTjAusMKCM1ZtXMNogRw-1
Received: by mail-ed1-f70.google.com with SMTP id m10so1042828edj.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 02:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CfJskBQHpZ9+0kSwLmzC02tWH8sjBa4yGY+QGL9Ecbg=;
        b=jBIgc1cdsy1YitiZRIFzl81+YaZUZZ8H5vGrWtJzX5oy8KghqJ2ZsOPvjGPjmKb/Rh
         T7Xt0tRWz7abt2WYa9Aoo6ZLU6PSBIgPI3U7SHKwoIQZVq4ungtlBglo87QeR6w02P65
         /IhzBbD9haZv6C0LI8g3GO5Bp0oXQQ05QoVzdxKYmWZb168wg9C7m/DTeUKHzT5fw6fD
         jDITgG59WBkqTzFTqquxOKrZlcLtYZzqgKfwi0TSKeCEUbFccasUu9twjJzOlA1wuKkT
         ampO4BMvqk0P4Aez/Y5jKFq8512KymJL6gSVp8ejjHGAKeXnCVhg2tgyOwpfOM+Ydwev
         iB0w==
X-Gm-Message-State: AOAM530YFmxwJNSvDlwMEtXLshLzGctqF2ma1awunbaSAtW9egXqpN5+
        S0O1FDPZLdsC29In9lbgCSi/Mpc6Gmra+2KhoUgWmmKZQ1t0aqbZdErPCQBLKYj+tB8/D9fazMT
        +fykzYQ0vNGZV4ZpjASOGT7G90sxn4PXedg==
X-Received: by 2002:a17:906:cf82:: with SMTP id um2mr13570483ejb.49.1600074834290;
        Mon, 14 Sep 2020 02:13:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysL1pyes10CScG4wjxSTQHVK5ShSVXdhDVlsBVuhhKnzo+TmMEVrrtEd6BYfUO/oEh2yB8qg==
X-Received: by 2002:a17:906:cf82:: with SMTP id um2mr13570450ejb.49.1600074833896;
        Mon, 14 Sep 2020 02:13:53 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id ot19sm7243799ejb.121.2020.09.14.02.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 02:13:53 -0700 (PDT)
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>,
        Richard Hughes <rhughes@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <d3de1d27-25ac-be43-54d8-dcbfffa31e1d@redhat.com>
 <DM6PR19MB26364970D0981212E811E1B0FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <67ca316a-227f-80f6-ad22-7d08112b2584@redhat.com>
Date:   Mon, 14 Sep 2020 11:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26364970D0981212E811E1B0FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/1/20 4:17 PM, Limonciello, Mario wrote:

<snip>

>> So first of all some comments on the userspace (sysfs) API for that. Getting
>> this
>> part right is the most important part of this patch, as that will be set in
>> stone
>> once merged.
>>
>> My first reaction to the suggest API is that I find the sorting by type thing
>> really weird,
>> so if I were to do:
>>
>> ls /sys/devices/platform/dell-wmi-sysman/attributes/
>>
>> I would get the following as output:
>>
>> enumeration
>> integer
>> string
>>
>> And then to see the actual attributes I would need to do:
>>
>> ls /sys/devices/platform/dell-wmi-sysman/attributes/{enumeration,integer,string}
>>
>> This feels less then ideal both when interacting from a shell, but also when
>> e.g. envisioning C-code enumerating attributes.
>>
>> IMHO it would be better to have:
>>
>> /sys/devices/platform/dell-wmi-sysman/attributes/<attr>/type
>>
>> Which can be one of "enumeration,integer,string"
>>
>> and then have the other sysfs files (default_Value, current_value, max..., etc.)
>> as:
>>
>> /sys/devices/platform/dell-wmi-sysman/attributes/<attr>/default_value
>> etc.
>>
>> Where which files exactly are present for a specific <attr> depends on the type.
>>
>> This will make e.g C-code enumerating all attributes be a single readdir,
>> followed
>> by reading the type for each dir entry; and if we add a new type the C-code can
>> warn the user that it encountered an atribute with unknown type <new-type>,
>> rather then not being aware that there is a fourth dir (for the new type) with
>> attributes to check.
> 
> I agree this is the most important part to get correct.  This proposal seems pretty
> good to me.
> 
>>
>> Other then that the sysfs interface generally looks good to me, except for
>> one other big thing (and one small thing, see below).
>>
>> This interface seems pretty generic (which is a good thing), but then having
>> it live in the hardcoded /sys/devices/platform/dell-wmi-sysman/attributes
>> name-space seems less then ideal. I also see in the code that you are creating
>> a dummy platform device, just to have a place/parent to register the attributes
>> dir with.
>>
>> Combining these 2 things I think that it would be better to make a new class
>> for this, like how we e.g. have a backlight class under /sys/class/backlight
>> we could have a /sys/class/firmware_attributes class and then we would get
>> a dell_wmi entry under that (and drop the "attributes" dir), so we would get:
>>
>> /sys/class/firmware_attributes/dell_wmi/<attr>/type
>>
>> Etc.
>>
>> So instead of creating a dummy platform device, you would create a
>> firmware_attributes
>> class device.
>>
>> I think it is likely that other vendors may eventually also support modifying
>> BIOS settings without going into the BIOS setup menu and I would like us to
>> use one unified userspace API for this.  Note this changes little for the Dell
>> code /
>> this patch (although eventually some code may be moved into shared helpers), but
>> it does allow userspace to discover if the firmware-attr sysfs API is supported
>> in
>> a vendor agnostic API by doing a readdir on /sys/class/firmware_attributes
>>
> 
> This area I'm not sure I'm aligned.  Two reasons come to mind:
> 
> 1) The interface that Dell offers isn't guaranteed to work the same as any other
> Vendors. Do we want to force them to use the same interface as Dell?  For example what
> if another vendor doesn't offer an interface from their firmware to enumerate possible
> options for any attribute but you have to know them in advance?

So my thinking here is as follows:

1. AFAIK other vendors may want to do something similar in the near future
2. The interface you (Dell) have come up with looks pretty generic / complete to me

> Would those possible options
> be hardcoded in their kernel driver?

Maybe, so the firmware implementation of an enum type, can take 2 forms:
a) An integer in the range of 0-# where 0-# is like the integer value backing an enum in C
b) Reading the current value as a string and when writing only a value from a fixed list of strings is valid

Now in both cases, either not knowing what the numbers actually mean, or not knowing
which values are valid for writing would make the interface pretty hard to use,
close to useless. So yes in that case the driver may need to hardcode to values
(assuming that scales for that vendor and they don't have a gazillion different
enums).

Also note that sysfs attributes can be marked as optional, so we could mark
things like possible enum-values, min/max/scalar_inc as optal right from the start.
We could for now mark everything optional except for type, current_value and
display-name. That should make it easy for other vendors implementations to
adhere to / implement the API.

> Dell sets precedent here by having the first driver.

Right and normally I may have wanted to wait until a second vendor implements
a similar mechanism under Linux so that we can find common ground between the
2 implementations for the generic userspace API for this.

The problem with that approach is that because we do not break userspace,
we then get to carry the "temporary" vendor-specific implementation of the
userspace API around for ever, since it may very well have existing users
before we replace it with the generic API.

This scenario would mean that after some point in time (when the generic API gets
added to the kernel) Dell needs to support 2 userspace APIs the one which is
being introduced by this patch + the generic one going forward.

Since to me the current API/ABI Dell is proposing is pretty generic I'm
trying to avoid this having 2 maintain 2 different userspace APIs problem
by making this the generic API from the get go.

> 2) Dell has some extensions planned for other authentication mechanisms than password.
> That is *definitely* going to be Dell specific, so should it be done in this vendor
> agnostic directory?

Well each property:

/sys/class/firmware-properties/dell-bios/<property-name>

Will have a type attribute:

/sys/class/firmware-properties/dell-bios/<property-name>/type

You can use dell-special-auth-mechanism as type for this and
then it is clear it is dell specific. As mentioned above I
fully expect new types to get added over this and userspace tools
will be expected to just skip properties with unknown types
(possibly with a warning).

We could even do something like we have for .desktop files
fields, where we add something to the sysfs ABI documentation
that vendors may add vendor specific types prefixed with X-<vendorname>.

So all in all I believe that we can make using the proposed sysfs ABI
a generic one work, and that this will be worth it to avoid having the
issue of eventually having both a couple of vendor specific APIs +
one grant unified generic API replacing those vendor-APIs
(where we can never drop the vendor specific APIs because of
backward compat. guarantees).

>> There could even be multiple instances implementing this interface, e.g. if
>> their
>> is an add-on card with its own option-ROM, see for iscsi booting then the iscsi
>> boot
>> options could be available under:
>>
>> /sys/class/firmware_attributes/iscsi_boot_nic/<attr>/*
>>
>> While the main system firmware settings would be available under:
>>
>> /sys/class/firmware_attributes/dell_wmi/<attr>/*
>>
>> Since you have already designed a nice generic API for this it seems
>> sensible to me to make it possible to use this outside the Dell WMI case.
>>
>>
>> So as mentioned I also have one smaller issue with the API, how is a
>> UI supposed to represent all these attributes?  In the BIOS setup screen
>> they are typically grouped together under e.g. CPU settings, power-management
>> settings,
>> etc.  I wonder if it would be possible to add a "group" sysfs file to each
>> attribute
>> which represent the typical grouping. E.g. for pm related settings the group
>> file
>> would contain "Power Management" then an userspace Ui can enumerate the groups
>> and
>> have e.g. 1 tab per group, or a tree with the groups as parents oof the
>> attributes
>> for each group. This is just an idea I don't know if such grouping info is
>> available
>> in the WMI interface for this.
> 
> This information isn't available in the ACPI-WMI interface unfortunately.

Ok, too bad, but understandable.

Regards,

Hans


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A268A26C51B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 18:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgIPQYN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 12:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56895 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726325AbgIPQT7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 12:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600273144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F7EEevl0DbnyCSqGW5Qa/ogR19sqKEfkn4KdK6oR3Nc=;
        b=FUVEO3KByYinAQLfFWkweMYip33LsEVP53cdSRTEnJ8HneROTBx3t1ycjqkvowOb0VZ7bn
        /NuA5sgIdffKBkQNfgVHi4EtWQqMfClFwvN9Mr0ukMVFaWZF09hBnAHo9PY5fFl3wi8sr5
        z2vVxaV8MtZIFkGRD0sg0zcp+ti30JY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-pzNcWSBQOISKG7e-iYbCmA-1; Wed, 16 Sep 2020 11:00:52 -0400
X-MC-Unique: pzNcWSBQOISKG7e-iYbCmA-1
Received: by mail-ed1-f72.google.com with SMTP id n4so2580693edo.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 08:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F7EEevl0DbnyCSqGW5Qa/ogR19sqKEfkn4KdK6oR3Nc=;
        b=YcerreGwAX1U47z1Z077wmLUql+gen/utKbGwRjbcFBa6cDhhr9esIU2J7mj7MzEcd
         Cq8h2/WBXtzWI3lywg5qTP/xVO3CBalwp3vCivVvD1aoZ3dlqrdr2vQ+cklJKUoSKuxW
         WD8lknpFwu4bcj7ODoTPpmoDFAH8+s9QoLL/sCy/JapCiwp3FWeVZceOQXlp6uAQ9Hxe
         8fLaMqq2G/cIAKCVNpc7C2/de4EVE0z5zX9cF5FO3yoanjB00Gne93OAKe0DABhfrHM5
         rZywCSlv+X2USps9co79NqEFElhLedfLNa/8ZJW0NyU8ekGx3dondtOGLEJ31c7spQaM
         w0yw==
X-Gm-Message-State: AOAM532MkIBtBGNelIxlCI1UC7QaZFGNhRLsRJLeJxsjFf2ChnvNnWVH
        VhvDw8CKfe/X5HqENnGWrDGXpmniwdxD1iGydplc5wV8u4IK00I24fjBeNSupSzqF6QPbOE/Iph
        KJHasQqmUHQ4p6SdnIqhg00u3e3vBDHOI6g==
X-Received: by 2002:a17:906:82d1:: with SMTP id a17mr25649727ejy.385.1600268451132;
        Wed, 16 Sep 2020 08:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPgUvLUiP7j9s6JrzXpWfwgVjqySRSCOIGMILWpc6Xe6VeGaH1o+ZaS6bt9qDnpFxnHRyi/g==
X-Received: by 2002:a17:906:82d1:: with SMTP id a17mr25649701ejy.385.1600268450773;
        Wed, 16 Sep 2020 08:00:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id z16sm14224659edr.56.2020.09.16.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 08:00:50 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always
 reporting 1 on the Asus UX360CA
To:     =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20200911132618.187297-1-hdegoede@redhat.com>
 <8035726f-536e-4e62-2ef3-b27e43e15759@redhat.com>
 <86d3f91e-8ada-2992-7197-dfca738f7974@redhat.com>
 <20200916140008.5rlepwg5j4v6qx4d@fastboi.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <055d8a05-fd09-ba51-7f2b-737b66202994@redhat.com>
Date:   Wed, 16 Sep 2020 17:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916140008.5rlepwg5j4v6qx4d@fastboi.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/20 4:00 PM, Samuel Čavoj wrote:
> Hello,
> 
> On 16.09.2020 15:13, Hans de Goede wrote:
>> Hi,
>>
>> On 9/16/20 3:04 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 9/11/20 3:26 PM, Hans de Goede wrote:
>>>> On the Asus UX360CA the ASUS_WMI_DEVID_KBD_DOCK devstate always reports 0,
>>>> which we translate to SW_TABLET_MODE=1. Which causes libinput to disable
>>>> the keyboard and touchpad even if the 360 degree hinges style 2-in-1 is
>>>> in laptop mode.
>>>>
>>>> Samuel found out that this model has another WMI "object" with an devid of
>>>> 0x00060062 which correctly reports laptop vs tablet-mode on the
>>>> Asus UX360CA.
>>>>
>>>> All the models on which the SW_TABLET_MODE code was previously tested do
>>>> not have this new devid 0x00060062 object.
>>>>
>>>> This commit adds support for the new devid 0x00060062 object and prefers it
>>>> over the older 0x00120063 object when present, fixing SW_TABLET_MODE always
>>>> being reported as 1 on these models.
>>>>
>>>> Reported-and-tested-by: Samuel Čavoj <samuel@cavoj.net>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Self NACK, preferring the newer ASUS WMI device-id for the switch when present
>>> does not fix this everywhere.
>>>
>>> Recently there have been more bug-reports about this and at least the Asus E200HA
>>> laptop does not have the newer ASUS WMI device-id in its DSDT:
>>>
>>>     https://bugzilla.redhat.com/show_bug.cgi?id=1875339
>>>     https://bugzilla.redhat.com/show_bug.cgi?id=1875828
>>>     https://bugzilla.redhat.com/show_bug.cgi?id=1876997
>>>
>>> So I'm preparing a new patch which uses a DMI based whitelist for the SW_TABLET_MODE
>>> functionality, Using the existing DMI quirks mechanism in asus-nb-wmi.c .
>>
>> p.s.
>>
>> Note the new ASUS-WMI device-id did actually give a working SW_TABLET_MODE
>> on the Asus Zenbook Flip UX360CA.
>>
>> Samuel Čavoj, perhaps you can do a follow-up patch to my fix (once I've
>> posted it) enabling the new dev-id on devices with "Zenbook Flip*" as
>> DMI product-name ?
> 
> I would be happy to.
> 
>>
>> At least I hope the DMI product-name starts with a prefix which has Flip in it?  See:
>> at /sys/class/dmi/id/product_name
> 
> Unfortunately, this is not the case. product_name is just "UX360CAK" and
> none of the other values contain anything useful either. (e.g.
> product_family is just "UX")

It seems all the UX360 models are flip models (I guess the 360 refers
to 360 degree hinges), so you could do a non-exact (the default) DMI_MATCH
on product-name containing UX360.

> Two solutions come to my mind:
>   1. Manually build up a whitelist of devices with DEVID_FLIP_TABLET_MODE.
>   2. Keep the logic of first checking the DEVID_FLIP_TABLET_MODE. If
>      present use it, if not present then fall back to your DMI whitelist
>      for the DEVID_KDB_DOCK.
> 
> The first solution sounds like an uphill battle and I don't know how I
> would even start collecting devices. The second one is risky, but as we
> haven't yet seen a device which misreports DEVID_FLIP_TABLET_MODE, I
> think it should be fine. Unless ASUS does it yet again, of course.

I fully expect Asus to have done this again.

> What do you think?

One advantage of the DEVID_FLIP_TABLET_MODE is that it directly
returns SW_TABLET_MODE, where as ASUS_WMI_DEVID_KBD_DOCK returns 1
when a Transformer model is attached to its kbd-dock, so we need
to invert the value to get SW_TABLET_MODE and it seems that on
all non transformers ASUS_WMI_DEVID_KBD_DOCK simply always returns 0
which we invert to 1, causing the issue at hand.

So assuming that on non flips DEVID_FLIP_TABLET_MODE defaults
to returning 0, we should avoid the alwasy reporting 1 problem.

But the mere presence of a SW_TABLET_MODE switch hints to userspace
that it is dealing with a 2-in-1 which might make userspace change
some behavior even if currently not in tablet-mode.

> Hans, you have a collection of DSTS's, is that right? Could you try
> searching it for DEVID_FLIP_TABLET_MODE and seeing if the devices which
> have it actually also have a 360 degree hinge? This could shed some
> light on the situation. I have indirect access to a UX434FLC as well (it
> does not have the hinge) so I can check it myself.

Most of my Asus DSDTs are from various Transformer models. Of the
non transform DSDTs which I have both the FX503VD and the GL503VD
have the DEVID_FLIP_TABLET_MODE even though they are not 2-in-1s
so I believe that it would be best to support DEVID_FLIP_TABLET_MODE
through an allow-list too, just like I'm doing for the
ASUS_WMI_DEVID_KBD_DOCK in my upcoming fix.

Regards,

Hans


>>>> ---
>>>>    drivers/platform/x86/asus-wmi.c            | 32 ++++++++++++++++++----
>>>>    include/linux/platform_data/x86/asus-wmi.h |  1 +
>>>>    2 files changed, 28 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>>> index 8f4acdc06b13..c8689da0323b 100644
>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>> @@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
>>>>    #define NOTIFY_KBD_BRTTOGGLE        0xc7
>>>>    #define NOTIFY_KBD_FBM            0x99
>>>>    #define NOTIFY_KBD_TTP            0xae
>>>> +#define NOTIFY_FLIP_TABLET_MODE_CHANGE    0xfa
>>>>    #define ASUS_WMI_FNLOCK_BIOS_DISABLED    BIT(0)
>>>> @@ -173,6 +174,7 @@ struct asus_wmi {
>>>>        int spec;
>>>>        int sfun;
>>>>        bool wmi_event_queue;
>>>> +    bool use_flip_tablet_mode;
>>>>        struct input_dev *inputdev;
>>>>        struct backlight_device *backlight_device;
>>>> @@ -365,12 +367,22 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>>>>        if (err)
>>>>            goto err_free_dev;
>>>> -    result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
>>>> +    result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_FLIP_TABLET_MODE);
>>>>        if (result >= 0) {
>>>> +        asus->use_flip_tablet_mode = true;
>>>>            input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>>>> -        input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
>>>> -    } else if (result != -ENODEV) {
>>>> -        pr_err("Error checking for keyboard-dock: %d\n", result);
>>>> +        input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>>>> +    } else {
>>>> +        if (result != -ENODEV)
>>>> +            pr_err("Error checking for flip-tablet-mode: %d\n", result);
>>>> +
>>>> +        result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
>>>> +        if (result >= 0) {
>>>> +            input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>>>> +            input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
>>>> +        } else if (result != -ENODEV) {
>>>> +            pr_err("Error checking for keyboard-dock: %d\n", result);
>>>> +        }
>>>>        }
>>>>        err = input_register_device(asus->inputdev);
>>>> @@ -2114,7 +2126,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>>>            return;
>>>>        }
>>>> -    if (code == NOTIFY_KBD_DOCK_CHANGE) {
>>>> +    if (!asus->use_flip_tablet_mode && code == NOTIFY_KBD_DOCK_CHANGE) {
>>>>            result = asus_wmi_get_devstate_simple(asus,
>>>>                                  ASUS_WMI_DEVID_KBD_DOCK);
>>>>            if (result >= 0) {
>>>> @@ -2125,6 +2137,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>>>            return;
>>>>        }
>>>> +    if (asus->use_flip_tablet_mode && code == NOTIFY_FLIP_TABLET_MODE_CHANGE) {
>>>> +        result = asus_wmi_get_devstate_simple(asus,
>>>> +                              ASUS_WMI_DEVID_FLIP_TABLET_MODE);
>>>> +        if (result >= 0) {
>>>> +            input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>>>> +            input_sync(asus->inputdev);
>>>> +        }
>>>> +        return;
>>>> +    }
>>>> +
>>>>        if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
>>>>            fan_boost_mode_switch_next(asus);
>>>>            return;
>>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>>> index 897b8332a39f..1897b4683562 100644
>>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>>> @@ -62,6 +62,7 @@
>>>>    /* Misc */
>>>>    #define ASUS_WMI_DEVID_CAMERA        0x00060013
>>>> +#define ASUS_WMI_DEVID_FLIP_TABLET_MODE    0x00060062
>>>>    /* Storage */
>>>>    #define ASUS_WMI_DEVID_CARDREADER    0x00080013
>>>>
>>
> 


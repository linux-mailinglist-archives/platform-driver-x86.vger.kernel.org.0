Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4920E26C50F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 18:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgIPQW1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 12:22:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38486 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726236AbgIPQUG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 12:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600273150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+WfnnhvoYSa6LBKbGzC0cndcrDQmAe6PIqNm70Ow6Ic=;
        b=TNfv0hcRuojzEn1dg1imq3RI+6nBsY3DkEoqjpbubw9F7LeY3I4XYJfIo3fjfjhd+pFaoZ
        erT8iz+8nc1fOoHawalsDu0e9JjuyH7awlY/ipYbCHvUDB+4JOm6FlYu9jYFC9Fsb8aubB
        UqmxY6I8fEbQnc0M5m4tdRtb45G2djs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-v_KtSvL7Mkuuz3eLK9o2zA-1; Wed, 16 Sep 2020 12:10:22 -0400
X-MC-Unique: v_KtSvL7Mkuuz3eLK9o2zA-1
Received: by mail-ed1-f70.google.com with SMTP id b12so2669472edw.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 09:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+WfnnhvoYSa6LBKbGzC0cndcrDQmAe6PIqNm70Ow6Ic=;
        b=VL0DSbV4UQDRDibtVaH77EyBObs+Z+4KAtmsep3M7CAKqkAguAR804LXcPlCon4EN/
         FX0SgXfti4hJ4D86ahuSDQx3NIsppB8p4OjYzRfJANWO0Os7w3bxA7X49rYpds7aR2YB
         RhtN8fFQAWHEkeHTBfcsqIC1CIs8Z/FgQMfcDd6RW/7nA2u6tQFKpncYTcd7MhwBG+Dp
         zF26QT2t5xd6sXfHo+DKk2K0eXJssuS3FV/OK31hJm3Yre+uHJ+kCbAe5RORfUL5I1Lc
         ftqbxF8m+j1U9chuoKW9N0chWFe9YGv14z37R7KYCH18v/s9v6Mrr8cAP6IyxmxMvkaM
         ecJg==
X-Gm-Message-State: AOAM533a0Jm/LO+04IjPFvmGm9r1HamdC2H3UO1MQKgu6nzGJuTYy4oM
        TSAx6GcNJG7PSexxN/L78zMvRaf9X31y49OD2+q9VORNIUK1byhiFJyeMyUm1+Bn9NOQS39pKNL
        9CxaxPTpWwPpG566NMzujpBTl4pU2dr9K0Q==
X-Received: by 2002:a17:906:7695:: with SMTP id o21mr23185061ejm.176.1600272620542;
        Wed, 16 Sep 2020 09:10:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7fo3t3Udv4tj6BHUiPWdKHb8U0RX7Zu9Rmsv339zBnlnZAEc/rr/3cF2Wfs67Qm8as6jFtQ==
X-Received: by 2002:a17:906:7695:: with SMTP id o21mr23185044ejm.176.1600272620280;
        Wed, 16 Sep 2020 09:10:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k1sm12238752eji.20.2020.09.16.09.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 09:10:19 -0700 (PDT)
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
 <055d8a05-fd09-ba51-7f2b-737b66202994@redhat.com>
 <20200916160605.2wx735h2jn5773fs@fastboi.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <29819a1e-680f-47ee-e2c9-4aaa3ecde081@redhat.com>
Date:   Wed, 16 Sep 2020 18:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916160605.2wx735h2jn5773fs@fastboi.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/20 6:06 PM, Samuel Čavoj wrote:
> On 16.09.2020 17:00, Hans de Goede wrote:
>> Hi,
>>
>> On 9/16/20 4:00 PM, Samuel Čavoj wrote:
>>> Hello,
>>>
>>> On 16.09.2020 15:13, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/16/20 3:04 PM, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 9/11/20 3:26 PM, Hans de Goede wrote:
>>>>>> On the Asus UX360CA the ASUS_WMI_DEVID_KBD_DOCK devstate always reports 0,
>>>>>> which we translate to SW_TABLET_MODE=1. Which causes libinput to disable
>>>>>> the keyboard and touchpad even if the 360 degree hinges style 2-in-1 is
>>>>>> in laptop mode.
>>>>>>
>>>>>> Samuel found out that this model has another WMI "object" with an devid of
>>>>>> 0x00060062 which correctly reports laptop vs tablet-mode on the
>>>>>> Asus UX360CA.
>>>>>>
>>>>>> All the models on which the SW_TABLET_MODE code was previously tested do
>>>>>> not have this new devid 0x00060062 object.
>>>>>>
>>>>>> This commit adds support for the new devid 0x00060062 object and prefers it
>>>>>> over the older 0x00120063 object when present, fixing SW_TABLET_MODE always
>>>>>> being reported as 1 on these models.
>>>>>>
>>>>>> Reported-and-tested-by: Samuel Čavoj <samuel@cavoj.net>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>
>>>>> Self NACK, preferring the newer ASUS WMI device-id for the switch when present
>>>>> does not fix this everywhere.
>>>>>
>>>>> Recently there have been more bug-reports about this and at least the Asus E200HA
>>>>> laptop does not have the newer ASUS WMI device-id in its DSDT:
>>>>>
>>>>>      https://bugzilla.redhat.com/show_bug.cgi?id=1875339
>>>>>      https://bugzilla.redhat.com/show_bug.cgi?id=1875828
>>>>>      https://bugzilla.redhat.com/show_bug.cgi?id=1876997
>>>>>
>>>>> So I'm preparing a new patch which uses a DMI based whitelist for the SW_TABLET_MODE
>>>>> functionality, Using the existing DMI quirks mechanism in asus-nb-wmi.c .
>>>>
>>>> p.s.
>>>>
>>>> Note the new ASUS-WMI device-id did actually give a working SW_TABLET_MODE
>>>> on the Asus Zenbook Flip UX360CA.
>>>>
>>>> Samuel Čavoj, perhaps you can do a follow-up patch to my fix (once I've
>>>> posted it) enabling the new dev-id on devices with "Zenbook Flip*" as
>>>> DMI product-name ?
>>>
>>> I would be happy to.
>>>
>>>>
>>>> At least I hope the DMI product-name starts with a prefix which has Flip in it?  See:
>>>> at /sys/class/dmi/id/product_name
>>>
>>> Unfortunately, this is not the case. product_name is just "UX360CAK" and
>>> none of the other values contain anything useful either. (e.g.
>>> product_family is just "UX")
>>
>> It seems all the UX360 models are flip models (I guess the 360 refers
>> to 360 degree hinges), so you could do a non-exact (the default) DMI_MATCH
>> on product-name containing UX360.
> 
> I didn't realize that. Yeah, it sounds reasonable.
> 
>>
>>> Two solutions come to my mind:
>>>    1. Manually build up a whitelist of devices with DEVID_FLIP_TABLET_MODE.
>>>    2. Keep the logic of first checking the DEVID_FLIP_TABLET_MODE. If
>>>       present use it, if not present then fall back to your DMI whitelist
>>>       for the DEVID_KDB_DOCK.
>>>
>>> The first solution sounds like an uphill battle and I don't know how I
>>> would even start collecting devices. The second one is risky, but as we
>>> haven't yet seen a device which misreports DEVID_FLIP_TABLET_MODE, I
>>> think it should be fine. Unless ASUS does it yet again, of course.
>>
>> I fully expect Asus to have done this again.
> 
> Right on. I guess I'm still new enough to this that I have hope.
> 
>>
>>> What do you think?
>>
>> One advantage of the DEVID_FLIP_TABLET_MODE is that it directly
>> returns SW_TABLET_MODE, where as ASUS_WMI_DEVID_KBD_DOCK returns 1
>> when a Transformer model is attached to its kbd-dock, so we need
>> to invert the value to get SW_TABLET_MODE and it seems that on
>> all non transformers ASUS_WMI_DEVID_KBD_DOCK simply always returns 0
>> which we invert to 1, causing the issue at hand.
>>
>> So assuming that on non flips DEVID_FLIP_TABLET_MODE defaults
>> to returning 0, we should avoid the alwasy reporting 1 problem.
>>
>> But the mere presence of a SW_TABLET_MODE switch hints to userspace
>> that it is dealing with a 2-in-1 which might make userspace change
>> some behavior even if currently not in tablet-mode.
>>
>>> Hans, you have a collection of DSTS's, is that right? Could you try
>>> searching it for DEVID_FLIP_TABLET_MODE and seeing if the devices which
>>> have it actually also have a 360 degree hinge? This could shed some
>>> light on the situation. I have indirect access to a UX434FLC as well (it
>>> does not have the hinge) so I can check it myself.
>>
>> Most of my Asus DSDTs are from various Transformer models. Of the
>> non transform DSDTs which I have both the FX503VD and the GL503VD
>> have the DEVID_FLIP_TABLET_MODE even though they are not 2-in-1s
> 
> Oh well. That's unfortunate.
> 
>> so I believe that it would be best to support DEVID_FLIP_TABLET_MODE
>> through an allow-list too, just like I'm doing for the
>> ASUS_WMI_DEVID_KBD_DOCK in my upcoming fix.
> 
> Yeah, that does seem best indeed. I'll give it a shot.

Great,

Thank you.

Regards,

Hans


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298C826C98D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 21:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgIPRkc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 13:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57105 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727301AbgIPRkN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 13:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600278010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E4ewFpKvs2GwUbsjDBIXcM6s6phUquheYcz06coAAXs=;
        b=YoPeaAjZBoLDGys9PBYuoO2Wwmo9op/CodQDwudmKFAQXlFT1iA76BVOoqCcPwk5KVlj3D
        kN+dfWnXtZ3NfHJtaLFCtqSB+LO+789KdATWeOn3d+TgCCG+ULYGAVjp9bOcnV9FeU+KNC
        kpq9Iu5BzfghAko+5PoQW2S3Wk/pARI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-QhlVRA6oPuqaGLD8tfgfBw-1; Wed, 16 Sep 2020 09:13:36 -0400
X-MC-Unique: QhlVRA6oPuqaGLD8tfgfBw-1
Received: by mail-ed1-f72.google.com with SMTP id n4so2446823edo.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 06:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E4ewFpKvs2GwUbsjDBIXcM6s6phUquheYcz06coAAXs=;
        b=FpQfaeQXtb44fSMA8iMB+xdiux68s0nm/wC6nsv1sFkVzUUwWqqgsOhA4Q+H6WjMbC
         WrG++LsMLsYkqGWBueJYOXeYzKLTsXh1hoUxmDdDdFgzsRUYHUrika6DGEFr2WAR1YWv
         7WgM3bADzKSgrh7qw5aDrJcKiwzDXHtZjyBeYTN3g8vrFB+OxwSsVAWRiVosqN4haN0F
         2WlCwjAyLWMVHUAd3nQIV90MUBA1mYnC7aFNWJh6rKrOwoQdj5BlbiyABmUV2dTPQd4Z
         20SSbUpk2fM3TN2jgoly2qMMcgckYNEDRLyBXYUMO09gPREWjn6r8V14oY0gMbs1agoU
         Mrww==
X-Gm-Message-State: AOAM532eEdiAH2QQWfF06tGcrGBTvSkTUvLth0dwM5mzPzNHX1OHxuBU
        r4LQhCaBqLDaOdW5R1nmmE1oqRqS3p12RDsRHIubtJsxguGi42QY52dc5NSYipWuIaLCBIXVG/v
        NDih6yMiZV2MAjIowwQ6mXn2h/78V/V7l6g==
X-Received: by 2002:a17:906:2618:: with SMTP id h24mr24342062ejc.198.1600262014751;
        Wed, 16 Sep 2020 06:13:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGrZ/KoLLAQzglr7MFm4KKJZ7ZZ2UWDsdn426npfeQPPS5vnDPQr4tJP5VwcFBhn0qG1ayAg==
X-Received: by 2002:a17:906:2618:: with SMTP id h24mr24342040ejc.198.1600262014536;
        Wed, 16 Sep 2020 06:13:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id z4sm14403066ede.65.2020.09.16.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 06:13:33 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always
 reporting 1 on the Asus UX360CA
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>
References: <20200911132618.187297-1-hdegoede@redhat.com>
 <8035726f-536e-4e62-2ef3-b27e43e15759@redhat.com>
Message-ID: <86d3f91e-8ada-2992-7197-dfca738f7974@redhat.com>
Date:   Wed, 16 Sep 2020 15:13:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8035726f-536e-4e62-2ef3-b27e43e15759@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/20 3:04 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/11/20 3:26 PM, Hans de Goede wrote:
>> On the Asus UX360CA the ASUS_WMI_DEVID_KBD_DOCK devstate always reports 0,
>> which we translate to SW_TABLET_MODE=1. Which causes libinput to disable
>> the keyboard and touchpad even if the 360 degree hinges style 2-in-1 is
>> in laptop mode.
>>
>> Samuel found out that this model has another WMI "object" with an devid of
>> 0x00060062 which correctly reports laptop vs tablet-mode on the
>> Asus UX360CA.
>>
>> All the models on which the SW_TABLET_MODE code was previously tested do
>> not have this new devid 0x00060062 object.
>>
>> This commit adds support for the new devid 0x00060062 object and prefers it
>> over the older 0x00120063 object when present, fixing SW_TABLET_MODE always
>> being reported as 1 on these models.
>>
>> Reported-and-tested-by: Samuel Čavoj <samuel@cavoj.net>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Self NACK, preferring the newer ASUS WMI device-id for the switch when present
> does not fix this everywhere.
> 
> Recently there have been more bug-reports about this and at least the Asus E200HA
> laptop does not have the newer ASUS WMI device-id in its DSDT:
> 
>    https://bugzilla.redhat.com/show_bug.cgi?id=1875339
>    https://bugzilla.redhat.com/show_bug.cgi?id=1875828
>    https://bugzilla.redhat.com/show_bug.cgi?id=1876997
> 
> So I'm preparing a new patch which uses a DMI based whitelist for the SW_TABLET_MODE
> functionality, Using the existing DMI quirks mechanism in asus-nb-wmi.c .

p.s.

Note the new ASUS-WMI device-id did actually give a working SW_TABLET_MODE
on the Asus Zenbook Flip UX360CA.

Samuel Čavoj, perhaps you can do a follow-up patch to my fix (once I've
posted it) enabling the new dev-id on devices with "Zenbook Flip*" as
DMI product-name ?

At least I hope the DMI product-name starts with a prefix which has Flip in it?  See:
at /sys/class/dmi/id/product_name

Regards,

Hans



>> ---
>>   drivers/platform/x86/asus-wmi.c            | 32 ++++++++++++++++++----
>>   include/linux/platform_data/x86/asus-wmi.h |  1 +
>>   2 files changed, 28 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 8f4acdc06b13..c8689da0323b 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
>>   #define NOTIFY_KBD_BRTTOGGLE        0xc7
>>   #define NOTIFY_KBD_FBM            0x99
>>   #define NOTIFY_KBD_TTP            0xae
>> +#define NOTIFY_FLIP_TABLET_MODE_CHANGE    0xfa
>>   #define ASUS_WMI_FNLOCK_BIOS_DISABLED    BIT(0)
>> @@ -173,6 +174,7 @@ struct asus_wmi {
>>       int spec;
>>       int sfun;
>>       bool wmi_event_queue;
>> +    bool use_flip_tablet_mode;
>>       struct input_dev *inputdev;
>>       struct backlight_device *backlight_device;
>> @@ -365,12 +367,22 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>>       if (err)
>>           goto err_free_dev;
>> -    result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
>> +    result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_FLIP_TABLET_MODE);
>>       if (result >= 0) {
>> +        asus->use_flip_tablet_mode = true;
>>           input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>> -        input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
>> -    } else if (result != -ENODEV) {
>> -        pr_err("Error checking for keyboard-dock: %d\n", result);
>> +        input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>> +    } else {
>> +        if (result != -ENODEV)
>> +            pr_err("Error checking for flip-tablet-mode: %d\n", result);
>> +
>> +        result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
>> +        if (result >= 0) {
>> +            input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>> +            input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
>> +        } else if (result != -ENODEV) {
>> +            pr_err("Error checking for keyboard-dock: %d\n", result);
>> +        }
>>       }
>>       err = input_register_device(asus->inputdev);
>> @@ -2114,7 +2126,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>           return;
>>       }
>> -    if (code == NOTIFY_KBD_DOCK_CHANGE) {
>> +    if (!asus->use_flip_tablet_mode && code == NOTIFY_KBD_DOCK_CHANGE) {
>>           result = asus_wmi_get_devstate_simple(asus,
>>                                 ASUS_WMI_DEVID_KBD_DOCK);
>>           if (result >= 0) {
>> @@ -2125,6 +2137,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>           return;
>>       }
>> +    if (asus->use_flip_tablet_mode && code == NOTIFY_FLIP_TABLET_MODE_CHANGE) {
>> +        result = asus_wmi_get_devstate_simple(asus,
>> +                              ASUS_WMI_DEVID_FLIP_TABLET_MODE);
>> +        if (result >= 0) {
>> +            input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>> +            input_sync(asus->inputdev);
>> +        }
>> +        return;
>> +    }
>> +
>>       if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
>>           fan_boost_mode_switch_next(asus);
>>           return;
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 897b8332a39f..1897b4683562 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -62,6 +62,7 @@
>>   /* Misc */
>>   #define ASUS_WMI_DEVID_CAMERA        0x00060013
>> +#define ASUS_WMI_DEVID_FLIP_TABLET_MODE    0x00060062
>>   /* Storage */
>>   #define ASUS_WMI_DEVID_CARDREADER    0x00080013
>>


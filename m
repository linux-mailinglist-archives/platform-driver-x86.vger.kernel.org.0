Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B216B267918
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Sep 2020 11:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgILJRY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 12 Sep 2020 05:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58553 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725814AbgILJRX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Sep 2020 05:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599902240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h0lbY43b8bFd7RQBViLIBOfIk9CNnPBxO5WDs+9MZEk=;
        b=XHoL1gS72/d/eWT/Ob9UnHDmZu3Q1MvGpyFeHemX1aTr9NIE94do2WLRR6915/DbAAK/zU
        0w6MQETJ/mEf4n4M1SwpdZ0vZNEL3e2cEYhPxIFxhzQXogoR6Ebsh5nWNES2ppNx1QoaFK
        RaO0J01pc33BvbCsM0KJwQ9r0O9ldwI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-kejbGriEPZa3vghrHW7unQ-1; Sat, 12 Sep 2020 05:17:17 -0400
X-MC-Unique: kejbGriEPZa3vghrHW7unQ-1
Received: by mail-ed1-f72.google.com with SMTP id c25so6406565edx.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2020 02:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h0lbY43b8bFd7RQBViLIBOfIk9CNnPBxO5WDs+9MZEk=;
        b=L8tV3Ufl2ri/Dq6ZjvbRJLXBWMyOVFVKMl4JF8jEHhwZt4RGxjU+kvqfZZPzfAwngC
         QKT4dIV61yqmZ93BlHDfkVOwnq/Xk1i0IEXVEF0NFYNyvqKZUemgjV4cq3roY4nzUTEM
         hoCFxP8Kr2RM+nG11jK4IA9pWDOrXjv0oRFDFi5ufFfc/N9KRgg9avwmiIHzNXXvzVAJ
         bfMp4T5KE4j31A5fJxP7W/hBrXacd+TA2F8/XCurJSj1iGv0QxVPfdHo100BltfnczBS
         y4PJF0VYeNRLp7AHWOUCkRDq1+C2Twur72rRf6ujbHHOFT1MpxI2HG9GFEO3UJvuFN/C
         uZqw==
X-Gm-Message-State: AOAM533THKZTz5WsmInCmYNKJ90PvnIZxLPQCqXW5QX+mFTe+fSjbYuP
        2VGhRTbyyVpD715XwGN9s6QUS/I9fhJ74OFG8A7ePJQoaKybyJR1v2gw4zEMgG2orenq7JkxfFF
        GDtDYX9qqLPK9CuK0Rq1Kc7yBiPAlNzwUzQ==
X-Received: by 2002:a17:906:f1d5:: with SMTP id gx21mr5125543ejb.165.1599902234910;
        Sat, 12 Sep 2020 02:17:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws4eIqKqHOygOTJXsSQBZsMJ5V6puQYY1F2BhEoDP1HgSpLxO/8sp5HuBoH3MQj88yEA/w0g==
X-Received: by 2002:a17:906:f1d5:: with SMTP id gx21mr5125518ejb.165.1599902234488;
        Sat, 12 Sep 2020 02:17:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id i7sm2982162ejo.22.2020.09.12.02.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 02:17:13 -0700 (PDT)
Subject: Re: Asus illuminated numpads
To:     Dmitry Tunin <hanipouspilot@gmail.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <btissoir@redhat.com>
References: <CANoib0GPQTABpuHrBBCLCwhRG7LMR215ZmKk-KazMzY7rYVP8Q@mail.gmail.com>
 <ed3a0dd2-0865-cb84-975a-2c8e9f28d6eb@redhat.com>
 <CANoib0HSpPR=dX7qbW-p62S1BGhYmARACcSQy-ag6B1tNT58Yg@mail.gmail.com>
 <ce966e85-7cd9-5373-f552-5e4347e00945@redhat.com>
 <CANoib0FdxEud0Rav8f1TxF28LS_1FBF4WucgdPM9BYqV+6MYvw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6245647a-558d-9e37-c36d-01f8c60f2509@redhat.com>
Date:   Sat, 12 Sep 2020 11:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANoib0FdxEud0Rav8f1TxF28LS_1FBF4WucgdPM9BYqV+6MYvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/20 7:08 AM, Dmitry Tunin wrote:
> пт, 11 сент. 2020 г. в 23:58, Hans de Goede <hdegoede@redhat.com>:
>>
>> Hi,
>>
>> On 9/11/20 10:40 PM, Dmitry Tunin wrote:
>>> Hi Hans,
>>>
>>> Thanks for the reply.
>>>>
>>>> Hi Dmitry,
>>>>
>>>> So I found some pictures and when you say "press a button on the touchpad"
>>>> you mean touch the icon in the top right corner of the touchpad I assume?
>>>
>>> Exactly.
>>>>
>>>> So not really a physical button, right ?  Given that there is a keyboard
>>>> HID interface on the touchpad, I guess that that corner-button is handled
>>>> in software by the Windows driver and the Windows driver then sends a command
>>>> to the touchpad to switch to numpad mode and then the rest is handled by
>>>> firmware in the touchpad.
>>>>
>>>> Which leaves the challenge of switching the touchpad to numpad mode
>>>> (and back again).
>>>>
>>>> BTW what is the top left corner icon on the touchpad supposed to do ?
>>> I don't have anything at the top left corner
>>
>> Ah I see, I went by this picture:
>>
>> https://tweakers.net/i/NE-bFDSJ5PKJU3d1u4r5DSzfWs0=/x800/filters:strip_icc():strip_exif()/i/2003833862.jpeg?f=imagegallery
>>
>> Which also has a top left icon.
>>
>>>> What might help is as root, with secure-boot off, do:
>>>>
>>>> cat /sys/kernel/debug/hid/0018:04F3:30F2.0001/rdesc > rdesc
>>>>
>>>> This will give us the HID descriptors of the touchpad,
>>>> which will help interpret the i2c traffic.
>>>
>>> 05 01 09 02 a1 01 85 01 09 01 a1 00 05 09 19 01 29 02 15 00 25 01 75
>>> 01 95 02 81 02 95 06 81 03 05 01 09 30 09 31 09 38 15 81 25 7f 75 08
>>> 95 03 81 06 05 0c 0a 38 02 95 01 81 06 75 08 95 03 81 03 c0 c0 05 0d
>>> 09 05 a1 01 85 04 09 22 a1 02 15 00 25 01 09 47 09 42 95 02 75 01 81
>>> 02 75 01 95 02 81 03 95 01 75 04 25 0f 09 51 81 02 05 01 15 00 26 78
>>> 0c 75 10 55 0e 65 13 09 30 35 00 46 90 01 95 01 81 02 46 d3 00 26 93
>>> 06 26 93 06 09 31 81 02 05 0d 15 00 25 64 95 03 c0 55 0c 66 01 10 47
>>> ff ff 00 00 27 ff ff 00 00 75 10 95 01 09 56 81 02 09 54 25 7f 95 01
>>> 75 08 81 02 05 09 09 01 25 01 75 01 95 01 81 02 95 07 81 03 09 c5 75
>>> 08 95 04 81 03 05 0d 85 02 09 55 09 59 75 04 95 02 25 0f b1 02 85 07
>>> 09 60 75 01 95 01 15 00 25 01 b1 02 95 0f b1 03 06 00 ff 06 00 ff 85
>>> 06 09 c5 15 00 26 ff 00 75 08 96 00 01 b1 02 85 0d 09 c4 15 00 26 ff
>>> 00 75 08 95 04 b1 02 85 0c 09 c6 96 8a 02 75 08 b1 02 85 0b 09 c7 95
>>> 80 75 08 b1 02 c0 05 0d 09 0e a1 01 85 03 09 22 a1 00 09 52 15 00 25
>>> 0a 75 10 95 01 b1 02 c0 09 22 a1 00 85 05 09 57 09 58 15 00 75 01 95
>>> 02 25 03 b1 02 95 0e b1 03 c0 c0 05 01 09 06 a1 01 85 0e 05 07 19 e0
>>> 29 e7 15 00 25 01 75 01 95 08 81 02 81 03 95 05 05 08 19 01 29 05 91
>>> 02 95 01 75 03 91 01 95 06 75 08 15 00 26 a4 00 05 07 19 00 2a a4 00
>>> 81 00 c0
>>
>> <snip>
>>
>> Thanks, one question, does the touchpad already work as
>> a multi-touch touchpad, or is it in mouse emulation mode ?
> The touchpad is detected as 3 input devices:
> 
> ELAN1401:00 04F3:30F2 Touchpad
> ELAN1401:00 04F3:30F2 Mouse
> ELAN1401:00 04F3:30F2 Keyboard
> 
> The first one works as a full feature touchpad with abs coordinates
> and multitouch, the other two are disabled and don't work.
> 
> 
>> You can check this by running evemu-record and then
>> selecting the touchpad interface and see if you get abs_x/abs_y
>> coordinates.
>>
>> If not then it *might* help to add the ACPI id for the i2c-client
>> for the touchpad to: include/linux/input/elan-i2c-ids.h so that the
>> drivers/input/mouse/elan_i2c_*.c code will be used for it
>> instead of the generic HID code
> Surprisingly it works without adding the code to elan_i2c.

That means that it is support the standard HID multi-touch /
Windows precision touchpad spec. That is not really surprising
for newer laptops, but sometimes we still encounter a touchpad
which needs the non standard drivers/input/mouse/elan_i2c* code.

 >> Let's add Elan folks in case they can share the command to switch
 >> touchpad mode with us.
 >>
 >
 > It looks like really it is the trickiest part to get the command. If
 > we can enable the keyboard, everything else  is clear enough. Maybe
 > not quite simple, but doable.
 > Setting the numpad button area and catching events from it can be done
 > even in user space.

Notice that as mentioned in a previous mail, with a Windows DSDT
override you can sniff the i2c bus. This is not bery easy, but it
also is not very hard. Various users have successfully used this
method before to help us debug i2c-hid issues.

Regards,

Hans


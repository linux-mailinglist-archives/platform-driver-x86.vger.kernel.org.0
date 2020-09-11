Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6BE2669D7
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Sep 2020 22:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgIKU6z (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Sep 2020 16:58:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35740 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725871AbgIKU6x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Sep 2020 16:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599857932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p86+cSryv3J995+oooYlszwrNiYmkzn+HGY5Makchok=;
        b=KSXoz4foKNp6WuFRlywEWPVq4jC3gx49TAR+UDwktzdnbZHgE6UPmcAFFk7gwWz152FlSc
        Bo29fCklUmCLPhcxGq376GmuBYHj7VAsrBduPnjluWWA89C/PCzD4AIarl5YUopPCQKQbM
        75XGJzn9k73ROxRGVVKxMU/3Xw0QGiw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-JiICxYg-PSKXgYJBfEV9CA-1; Fri, 11 Sep 2020 16:58:48 -0400
X-MC-Unique: JiICxYg-PSKXgYJBfEV9CA-1
Received: by mail-ej1-f69.google.com with SMTP id b1so5457175eje.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 13:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p86+cSryv3J995+oooYlszwrNiYmkzn+HGY5Makchok=;
        b=tB6/LERbVb3OsPwahaER8twggOSPcisC7+odKhnhagCMdze4CaxMna322VaW75C5KX
         FlpjbhB+xJbsxRvsaIO6V5Lo8cIeoa4R5JVHFbixtv7pq23ya2thXWzuetZ/yKVhXUbC
         H9F7s515HwON6PFo8e6DuZsKeAYH3MmFXxz26DF4QXSQ+fJGiWNbDkcIQMKCMWcrLs/s
         28vN1z3D/bwjydH7zWhg3xQgNThLC0iVAMWu0uGQIvZjCf6FIsR4Dtyc1Xnww86+UkLs
         u0f0xKpvYWpl153eJUrfeQwi73EudXomOGrYCGQxpntNLfjjDHePhs8Wg7vuK25iUsSg
         acKQ==
X-Gm-Message-State: AOAM532jhJ7oe7o+UDY2rk6keYJr1MszLSmP2k7EtOYaU3T6iZIzA+f9
        CiS8QMJfFyMjWAe3dWUGoWoOZmbQzdVW4nz8JVznuRink8Hg/4eaR6KvLw1Sv0Mpymkw2qyQVr0
        YWEhxgKWw0J4NGSu/iCzpo5ddFEZb05I2yw==
X-Received: by 2002:a17:907:72c2:: with SMTP id du2mr3932075ejc.512.1599857926227;
        Fri, 11 Sep 2020 13:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzYj/UhotF3YYr0R9QUNvNWknAfM4EE1en9WU3YGqnK0P3YTCKWa8HcHXwE3e4SExQMYBlLw==
X-Received: by 2002:a17:907:72c2:: with SMTP id du2mr3932055ejc.512.1599857925948;
        Fri, 11 Sep 2020 13:58:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id z21sm2198611eja.72.2020.09.11.13.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 13:58:45 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce966e85-7cd9-5373-f552-5e4347e00945@redhat.com>
Date:   Fri, 11 Sep 2020 22:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANoib0HSpPR=dX7qbW-p62S1BGhYmARACcSQy-ag6B1tNT58Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/11/20 10:40 PM, Dmitry Tunin wrote:
> Hi Hans,
> 
> Thanks for the reply.
>>
>> Hi Dmitry,
>>
>> So I found some pictures and when you say "press a button on the touchpad"
>> you mean touch the icon in the top right corner of the touchpad I assume?
> 
> Exactly.
>>
>> So not really a physical button, right ?  Given that there is a keyboard
>> HID interface on the touchpad, I guess that that corner-button is handled
>> in software by the Windows driver and the Windows driver then sends a command
>> to the touchpad to switch to numpad mode and then the rest is handled by
>> firmware in the touchpad.
>>
>> Which leaves the challenge of switching the touchpad to numpad mode
>> (and back again).
>>
>> BTW what is the top left corner icon on the touchpad supposed to do ?
> I don't have anything at the top left corner

Ah I see, I went by this picture:

https://tweakers.net/i/NE-bFDSJ5PKJU3d1u4r5DSzfWs0=/x800/filters:strip_icc():strip_exif()/i/2003833862.jpeg?f=imagegallery

Which also has a top left icon.

>> What might help is as root, with secure-boot off, do:
>>
>> cat /sys/kernel/debug/hid/0018:04F3:30F2.0001/rdesc > rdesc
>>
>> This will give us the HID descriptors of the touchpad,
>> which will help interpret the i2c traffic.
> 
> 05 01 09 02 a1 01 85 01 09 01 a1 00 05 09 19 01 29 02 15 00 25 01 75
> 01 95 02 81 02 95 06 81 03 05 01 09 30 09 31 09 38 15 81 25 7f 75 08
> 95 03 81 06 05 0c 0a 38 02 95 01 81 06 75 08 95 03 81 03 c0 c0 05 0d
> 09 05 a1 01 85 04 09 22 a1 02 15 00 25 01 09 47 09 42 95 02 75 01 81
> 02 75 01 95 02 81 03 95 01 75 04 25 0f 09 51 81 02 05 01 15 00 26 78
> 0c 75 10 55 0e 65 13 09 30 35 00 46 90 01 95 01 81 02 46 d3 00 26 93
> 06 26 93 06 09 31 81 02 05 0d 15 00 25 64 95 03 c0 55 0c 66 01 10 47
> ff ff 00 00 27 ff ff 00 00 75 10 95 01 09 56 81 02 09 54 25 7f 95 01
> 75 08 81 02 05 09 09 01 25 01 75 01 95 01 81 02 95 07 81 03 09 c5 75
> 08 95 04 81 03 05 0d 85 02 09 55 09 59 75 04 95 02 25 0f b1 02 85 07
> 09 60 75 01 95 01 15 00 25 01 b1 02 95 0f b1 03 06 00 ff 06 00 ff 85
> 06 09 c5 15 00 26 ff 00 75 08 96 00 01 b1 02 85 0d 09 c4 15 00 26 ff
> 00 75 08 95 04 b1 02 85 0c 09 c6 96 8a 02 75 08 b1 02 85 0b 09 c7 95
> 80 75 08 b1 02 c0 05 0d 09 0e a1 01 85 03 09 22 a1 00 09 52 15 00 25
> 0a 75 10 95 01 b1 02 c0 09 22 a1 00 85 05 09 57 09 58 15 00 75 01 95
> 02 25 03 b1 02 95 0e b1 03 c0 c0 05 01 09 06 a1 01 85 0e 05 07 19 e0
> 29 e7 15 00 25 01 75 01 95 08 81 02 81 03 95 05 05 08 19 01 29 05 91
> 02 95 01 75 03 91 01 95 06 75 08 15 00 26 a4 00 05 07 19 00 2a a4 00
> 81 00 c0

<snip>

Thanks, one question, does the touchpad already work as
a multi-touch touchpad, or is it in mouse emulation mode ?

You can check this by running evemu-record and then
selecting the touchpad interface and see if you get abs_x/abs_y
coordinates.

If not then it *might* help to add the ACPI id for the i2c-client
for the touchpad to: include/linux/input/elan-i2c-ids.h so that the
drivers/input/mouse/elan_i2c_*.c code will be used for it
instead of the generic HID code.

Regards,

Hans


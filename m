Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AE232F02C
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Mar 2021 17:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhCEQhB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Mar 2021 11:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46089 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231151AbhCEQg3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 11:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614962188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/WT9UENyKU6PRq/wSyFDmyON1pQr5AFXQ6KBDlTAJ9g=;
        b=A65YjijcdjTIwqGIhA9Sf5bidazzdB0ztKYSmHXwyPylnCCpTofIHr4KfDWbei5w5scHF/
        8BXezUg2wncERZ0ivAf/SefV8ZfZV+kwlTbArRa2JhnhW/DtmHoTLYAXNKSN4hqSjQU4Qg
        flbv1sdztShPECJFjL9DpyI54fwiOqg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-pRFhokcpPauAerotfp8siQ-1; Fri, 05 Mar 2021 11:36:27 -0500
X-MC-Unique: pRFhokcpPauAerotfp8siQ-1
Received: by mail-ed1-f72.google.com with SMTP id q2so1171863edt.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Mar 2021 08:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/WT9UENyKU6PRq/wSyFDmyON1pQr5AFXQ6KBDlTAJ9g=;
        b=tUmX3zzLp3VN7KKRKEYtOtajCfmDBnglFMDDwlF+0yjses4Nvy/7Fr2/NlgiI1vD8Q
         a8n28Y7hz4ns7LjRWjllyYydOceCjBxSXK2rSvBeQ4hbVcnLn8+NP9HucwfRdSJRrVqj
         HGrdF5bwdfvYWdOtVV2e7Ef7sG63HUT1AE55LtpneskRpVXqbf1FIybwg+KxcAzuh1n+
         bC+vUAs/jE9ionkGeRMLmI73tQGj3FnBQz8ZPIovk1aDw0yOh6/TPgq2mIU3d9XWL3da
         LIYXFXlBR+tr9eUNsMuPkW7z7qnWHZ2V997llFby9hUWCAlAWNMkt2h/mvcENCY41FPh
         3yew==
X-Gm-Message-State: AOAM530nJ16ZXCbUU18KtpTZyqCSid5l5x8sDqOErg/Lx/3IqRt1B6Nw
        O++RUj49nwNkdToaIuIAcJkpsRlY2VvIkVOEh+0zs194ITxDEnfKwoKEOlLyFF2v1MHeL/UH375
        eC06xnKnzwfhliOUzNpox3cV6KX17T+DJ8g==
X-Received: by 2002:a17:906:d214:: with SMTP id w20mr3003138ejz.284.1614962185925;
        Fri, 05 Mar 2021 08:36:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOaVPg3Ianv/9w3GJSDlIHYZEcyMO16SQ5LT1ow29LZTuibMGbCrbAmwe+AZhbnu5Px0uCYw==
X-Received: by 2002:a17:906:d214:: with SMTP id w20mr3003113ejz.284.1614962185753;
        Fri, 05 Mar 2021 08:36:25 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u15sm1769835ejy.48.2021.03.05.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 08:36:25 -0800 (PST)
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com>
 <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com>
 <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
 <ec54b2ba-3eb2-0981-e409-4d8f9d3e45c1@redhat.com>
 <CAHp75Vd+mXRw0gKi4TzCPDn1XqJkTjHNWCLht0674=BpMjjg+g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e04ceb70-bd52-1af9-a6ec-6eef5a5226b7@redhat.com>
Date:   Fri, 5 Mar 2021 17:36:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd+mXRw0gKi4TzCPDn1XqJkTjHNWCLht0674=BpMjjg+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/5/21 5:25 PM, Andy Shevchenko wrote:
> On Fri, Mar 5, 2021 at 6:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 3/5/21 4:42 PM, Andy Shevchenko wrote:
>>> On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 3/4/21 11:11 AM, Andy Shevchenko wrote:
>>>>> On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
>>>>> <henning.schild@siemens.com> wrote:
> 
> ...
> 
>>>>> Oy vey! I know what this is and let's do it differently. I have some
>>>>> (relatively old) patch series I can send you privately for testing.
>>>>
>>>> This bit stood out the most to me too, it would be good if we can this fixed
>>>> in some cleaner work. So I'm curious how things will look with Andy's work
>>>> integrated.
>>>>
>>>> Also I don't think this should be exported. Instead this (or its replacement)
>>>> should be used to get the address for an IOMEM resource to add the platform
>>>> devices when they are instantiated. Then the platform-dev drivers can just
>>>> use the regular functions to get their resources instead of relying on this
>>>> module.
>>>
>>> I have published a WIP branch [1]. I have no means to test (I don't
>>> know what hardware at hand I can use right now), but I made it compile
>>> after 4 years of gathering dust...
>>
>> So I took a quick look at the following 2 commits:
> 
> (One of the latter commits moves the code to drivers/pci/pci-p2sb.c,
> do you think it's better like that? The idea is to deduplicate
> __pci_bus_read_base() call)
> 
>> "platform/x86: p2sb: New Primary to Sideband bridge support library"
>> "mfd: lpc_ich: Switch to generic p2sb_bar()"
>>
>> And this looks good to me, although compared to the code from this
>> patch-set you are missing the pci_lock_rescan_remove(); and
>> pci_unlock_rescan_remove(); calls.
> 
> Oh, indeed.
> 
>>> Feel free to give any kind of comments or share your ideas on how it
>>> can be improved (the above idea on IOMEM resource is interesting, but
>>> devices are PCI, not sure how this can be done).
>>
>> The code added by this patch introduces a register_platform_devices()
>> function which creates a bunch of platform-devices; and then the
>> device-drivers for those call simatic_ipc_get_membase0() to get their
>> base-address.
> 
> Sounds like an MFD approach...

Yes except that there does not seem to be a clear parent for
these devices, so it is MFD-ish.

IOW I'm not sure this should be changed to use the MFD framework,
but I was thinking along those line myself too.

Henning did you look into using the MFD framework + MFD cell
descriptions to instantiate the platform-devices for you ?

Regards,

Hans


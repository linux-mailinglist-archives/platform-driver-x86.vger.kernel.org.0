Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA7730F13E
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Feb 2021 11:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235484AbhBDKvh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Feb 2021 05:51:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42816 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235435AbhBDKvf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 05:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612435808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ExcdpvdW4w9z0j1rSZqVqf3PX+bGLK8NJ4uHHCnJ7SI=;
        b=Ckj4V9W55B7e90v71yhXsJNTIbxnM9fjsphF04l3kGfyJz9RY6n6HMRkaIK5ZegenqDVbI
        tpMmnkhjqk5lEj7FTH3aBe5xvFf4yuK4e+AlNtje/JGBP8RSVuWm9kDwUWUBeb5r2/Gy3X
        AULraChdaU8ugH8Ao7JJgAA1aTqYdPc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-5UHyHkJBMuSBMrmteJ88Qg-1; Thu, 04 Feb 2021 05:50:06 -0500
X-MC-Unique: 5UHyHkJBMuSBMrmteJ88Qg-1
Received: by mail-ej1-f70.google.com with SMTP id x22so2430971ejb.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 02:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ExcdpvdW4w9z0j1rSZqVqf3PX+bGLK8NJ4uHHCnJ7SI=;
        b=asU7buhryk5GFw9Gfix7odlYbnj2JT35FonrIYZD5jfjvd4lC2Tm8e6ZmeZAICHptR
         OHMv3wbYEIc3DndnWb1YPQ+H7Nehi93KawdUnhYEljmvzfZK5f7jkeX8ywBUzw0lyk2a
         4RTSty2eV8783soRv8hN2z311Nch6MH5r64/ujPTsAzrdwYAXFCI7Ti5vSSOseq8smTf
         fEuVqgVoTDveGMx40+CuMA13u50sjaGra6BEA4oSZW7ZBheqKQkwLlwT6HZqcH2bIIch
         YXQcQIZ9FjcBQADxClGJtWHCv35oGgtmWpO+DIcU7De8ZPW6tP3WYfxI50tjPQ0VFlJ5
         BESg==
X-Gm-Message-State: AOAM5315OF3UaDAA47dz11TnyozP0tIU0Dlk3aDWei4vJ9oryRLrvqhN
        lw/+sNMdmIixEVv+HzqRSRWLFpC35ZMhnQxgFkURN+zHw7bcIAhK1BMJ4y2tx5Pgg8hf3yv1lud
        5SciDL4B2xFOMvzHj+SxmJjMfMs8lsSWsEg==
X-Received: by 2002:a50:e40d:: with SMTP id d13mr7199522edm.286.1612435805422;
        Thu, 04 Feb 2021 02:50:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrLq4STTB5oHsAxoJ/eqPScYWEXm044cXSlN/alKGEooRBz1nK3qDv8a2u2yCHeu/QD1EDgg==
X-Received: by 2002:a50:e40d:: with SMTP id d13mr7199513edm.286.1612435805290;
        Thu, 04 Feb 2021 02:50:05 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id n16sm2273045ejd.116.2021.02.04.02.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 02:50:04 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
 <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
 <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <797cf4ac-ffdc-e73e-cb58-d027beb6e3b4@redhat.com>
Date:   Thu, 4 Feb 2021 11:50:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/21 11:36 AM, Daniel Vetter wrote:
> On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
>>
>> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>>
>>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
>>> <patrik.r.jakobsson@gmail.com> wrote:
>>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>
>>>>> Hi guys,
>>>>>
>>>>> This is first part of Intel MID outdated platforms removal. It's collected into
>>>>> immutable branch with a given tag, please pull to yours subsystems.
>>>>
>>>> Hi Andy,
>>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
>>>> then I should probably start looking at removing the corresponding
>>>> parts in GMA500.
>>>
>>> I have noticed new commits in DRM against GMA500 and it seems now in a
>>> conflict with my immutable branch. Are you sure you don't forget to
>>> pull it?
>>
>> Hi Andy, sorry I missed pulling the immutable branch before taking the
>> gma500 medfield removal. I was unsure how to do that through drm-misc
>> and it's tools so I got sidetracked. What would be the correct way to
>> fix this?
> 
> Imo Linus can resolve this, it's pretty trivial, as long as both pull
> requests point it out to him.

The removal of older Intel platforms touches a number of subsystem trees,
the idea about the IM branch was that all subsystem-trees would merge that.

I can certainly point out the problem in the pdx86 pull-req to Linus,
but the GPIO pull-req also contains a merge of the IM branch as will
the x86/tip and rtc pull-reqs I believe. We can add a remark to all
the pull-reqs about the issue I guess ?

But it might be better to still merge the branch into drm-misc-next and
resolve the conflict there. I think that should avoid Linus seeing it ?

Regards,

Hans


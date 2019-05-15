Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5CE1EAC6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 May 2019 11:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbfEOJQM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 15 May 2019 05:16:12 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45926 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfEOJQM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 May 2019 05:16:12 -0400
Received: by mail-ed1-f68.google.com with SMTP id g57so3066661edc.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 May 2019 02:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6QZfgWls6jz2eNfkscuHU8XPgviaa1sLig++6LVw+Jw=;
        b=jlogLoK2qaBmMbScLuJSmdM8KcRzRLpWv33eyJb7E9viW2tCFxYUzU8Ek2AkWnW1S8
         5k+cNAQXCshpYvj+7e+tuG2BygZn+Ijd9/WCjoMHgomjHfBwIAw1fCcchscTJt8uPuiG
         fwNPWxyC9ZBksMVxt34/pd06avKThN2UlTsk6lCroopp/Wz+fR/9r9ATzHewdq+y5zk4
         merAB9hmEMuvXfAOHb6KmGbSkUZjhexEf7XDDPgImYzVnE+W/c0aAkfERzQXlrcAvljz
         BUNmNY84svNGYn8qvO7jX1oWew9iLNiLd8IliTxlO0dQkkmGdfX7e2sD0MWOC7rbC2WU
         568w==
X-Gm-Message-State: APjAAAUKo+vqm+eAZ2BWB8l4QDs6xYiwnlTOhZw3PvHYiWZtze2ir5IA
        ap7LUycMk+eLvasLtbXr+NeGhQ==
X-Google-Smtp-Source: APXvYqzpUPv4tWc85Kz758BKgGQe1Zo7KWebgXJPAjat2CjpFng5P6SqrYZFU6/+H6lm1WO+7RBq6Q==
X-Received: by 2002:a17:906:7b58:: with SMTP id n24mr32062773ejo.224.1557911770790;
        Wed, 15 May 2019 02:16:10 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id v2sm587433eds.69.2019.05.15.02.16.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 02:16:10 -0700 (PDT)
Subject: Re: Commit 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS
 will handle the display off hotkey") causes broken display on Asus 1025C
To:     =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        sashal@kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ben@decadent.org.uk, hackurx@gmail.com,
        Linux Upstreaming Team <linux@endlessm.com>,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <999f988f-63ce-ee29-6cb5-42d4bf94fdbe@redhat.com>
 <CAOcMMif8wK-mtSLNsV9X07uR8D1TAt0aDKnCyNFpMQ1pRB3_vg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <087e4f64-f5ca-0f29-8782-27bcdb6a79f9@redhat.com>
Date:   Wed, 15 May 2019 11:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcMMif8wK-mtSLNsV9X07uR8D1TAt0aDKnCyNFpMQ1pRB3_vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Thank you for your input and for the quick reply.

On 15-05-19 00:42, João Paulo Rechi Vita wrote:
> Hello Hans, thanks for reaching out.
> 
> On Tue, May 14, 2019 at 1:23 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi João, All,
>>
>> I've been helping a Fedora user debugging a problem where the backlight turns off and
>> never turns on again with newer kernels:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1697069
>>
>> At this point I'm pretty sure this commit is the culprit:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=78f3ac76d9e5
>>
>> The breakage happens between 4.20.4 and 4.20.5 and that commit is the only one
>> standing out; and blacklisting eeepc-wmi fixes things.
>>
>> For now I'm going to add a new DMI quirk for this (patch for this will follow later)
>> but this is something to keep in mind if we get more reports about backlight/display
>> breakage on eeepc laptops. I'm thinking that maybe the new behavior introduced
>> by commit 78f3ac76d9e5 should only be applied to laptops using
>> asus-nb-wmi and not to laptop using eeepc-wmi (the code modified
>> by the commit is common to both drivers).
>>
> 
> Actually there was another report from a user via private email with
> similar symptoms on a Asus Eee PC 1015BX -- no backlight after
> starting the kernel (probably after eeepc-wmi is probed) -- which I've
> been meaning to reply for a couple of weeks now, so I'm also cc'ing
> others involved in that thread.

Hmm, that one is using an AMD CPU + graphics, so it indeed seems that
this impacts multiple devices using eeepc-wmi and is not limited to
just Intel Cedar Trail machines.

> In that case the user was able to work
> around the problem by passing acpi_backlight=vendor, just to add an
> extra datapoint.

Right, that is logical, because the problematic commit adds the else of
this bit of code:

         if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
                 err = asus_wmi_backlight_init(asus);
                 if (err && err != -ENODEV)
                         goto fail_backlight;
         } else
                 err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);


And passing acpi_backlight=vendor makes the if condition true, so it never
executes the line added by commit 78f3ac76d9e5.

>> João, can you check if the 11 models mentioned in the commit msg
>> (or a bunch of similar models you have access too) are using asus-nb-wmi;
>> or eeepc-wmi ?
>>
> 
> All of the 11 models where we saw this problem are using asus_nb_wmi:
> E203NAS, GL553VE, X441NC, X441UVK, X541UVK, X555DG, X555UB, X555UQ,
> X560UD, X570ZD, X705FD.
> 
> Furthermore, from the 144 Asus models we have in our database at
> Endless, only 10 probe the eeepc_wmi module: D320SF-K, D415MT, D520MT,
> D640SA, D830MT, G11DF, V221ID, V272UN, ZN220IC-K, ZN241IC.
> 
> 6 out of these 10 also probe asus_nb_wmi: D640SA, G11DF, V221ID,
> V272UN, ZN220IC-K, ZN241IC.
> 
> And the 4 that only probe eeepc_wmi are all desktop models: D320SF-K,
> D415MT, D520MT, D830MT.
> 
> I agree with limiting this behavior to asus-nb-wmi only on mainline --
> it will still apply to the original affected hardware, and it is much
> better than keep updating a list of DMI quirks. We will also need to
> send it to a few linux-stable branches as well.

I agree that given the new info it indeed seems to best to only do
the asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL) call
when the asus_nb_wmi driver is loaded, I will prepare a patch for
this with a fixes tag pointing to commit 78f3ac76d9e5.

Regards,

Hans

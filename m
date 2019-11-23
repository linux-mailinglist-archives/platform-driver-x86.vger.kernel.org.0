Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65653107C87
	for <lists+platform-driver-x86@lfdr.de>; Sat, 23 Nov 2019 03:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfKWCnx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 Nov 2019 21:43:53 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38906 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfKWCnx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Nov 2019 21:43:53 -0500
Received: by mail-qk1-f196.google.com with SMTP id e2so8084951qkn.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2019 18:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yloWUIBHB2AosJ0RasMRxYxwY32qCzkOeBOvUNrtTlw=;
        b=m6CKgytI1hCCEAKAxq586d9Y72ihHnzD3wPDhuWMY0kL5f1FwS7YcfP21L+guYrinJ
         LFu3R7mLGAXEVGc0fTqbVK+Uk71764lKXIL+9nqIQZTJsf69Ax4aAcYlVan6uP4o8UON
         1looOJbl3+zrXzSC2yugPX4MCs6v6U2i7XakpPwuzrDFNIWEQ+Xezc+ABsdfp7TiQGWY
         zmHm1Jk6Oun6adeIHuKs05LxsvxNWkO/E6/HP3uQfpW06Fq0FwnOopZW+Z+Pq8v5c261
         lmr8pbjo1CCC9UoD8OsQhtneLGXdJm0PLTL5j8HZPlwJ24smN5SRGFhautlzSoxbX2qQ
         XA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yloWUIBHB2AosJ0RasMRxYxwY32qCzkOeBOvUNrtTlw=;
        b=OsTsjJvlra9zvCRU93f+XuyKrY+SnDJ542dM3dWGJ99pgVOoHXgwEEk71a6i3pKmKw
         BBXoqXxsSPre3Wryc9BlyKLBfnqShqCr8S4D6bRBmkm5ME9lqo+7yOZKhhe0a9p6gkyd
         Wl9yycLf6EwslP9O230XiHt/6t9nR1f5Oh4s55k/XPAa+ZBCGl5QjR+ba4wsadvB/Vkg
         A7XFJ4LJSr2l/BOpB8thMZHxN7QT3Pv6QmmwOTGsVmXPgwAkUz4wWm2jMrIW+ntBM5Ms
         i0qb8R1xdD/a+dOTmiGCEk0vyO4WiygvvEXHkwSnRI7iGSEzPxXoMRJrYEPaByfOAyJc
         WDDQ==
X-Gm-Message-State: APjAAAVqpzJb7NmRH3q4TdVKPrnnJ6HtWdjsetmeU2L9XsEkjfygik8e
        Dz1uvqElCeGKaGkl75GqIn4=
X-Google-Smtp-Source: APXvYqz+fPOiduLHNDWex470ep7zb0WGpXYgXium2/T4gJeTyxzzhZruVPt1IiW13HaY5Q9RhlarnA==
X-Received: by 2002:a37:ef11:: with SMTP id j17mr16129166qkk.397.1574477032313;
        Fri, 22 Nov 2019 18:43:52 -0800 (PST)
Received: from [192.168.1.101] ([104.246.133.66])
        by smtp.gmail.com with ESMTPSA id h12sm4431054qtj.37.2019.11.22.18.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2019 18:43:51 -0800 (PST)
Subject: Re: Bug Report - Kernel Branch 4.4.y - asus-wmi.c
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kristian Angelov <kristiana2000@abv.bg>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <82dfb75a-e743-e8db-df6f-22b768f7c112@gmail.com>
 <CAHp75VcHf94QWYsyRg7hYqGK4JCRSxxLZ_ziiF2rjqcKR8rPEA@mail.gmail.com>
 <7535264f-b8c9-7ba7-47b5-bd7415f109b3@redhat.com>
From:   Bob Funk <bobfunk11@gmail.com>
Message-ID: <4574014c-8b5d-1f03-40da-3c8cce4d3f3d@gmail.com>
Date:   Fri, 22 Nov 2019 20:42:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <7535264f-b8c9-7ba7-47b5-bd7415f109b3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thank you for the response. I have sent an email to the stable branch
maintainers as Hans suggested. The patch was intended to fix a non
functional display hotkey but I have no problem asking for it to be reverted
if it corrects a non functional system.

Regards,

Bob Funk


On 11/22/19 2:13 PM, Hans de Goede wrote:
> Hi,
>
> On 11/22/19 12:31 PM, Andy Shevchenko wrote:
>> +Cc: Kristian, João, Hans
>>
>> It seems Kristian reported same (?)  / similar issue.
>
> If some patch added to 4.4.x as a fix is causing issues it should IMHO
> be reverted, for which you (Bob) should talk to the 4.4.x maintainer.
>
> 4.4.x is quite old and if the problem does not reproduce with mainline
> kernels then I have little interest in debugging this.
>
> Regards,
>
> Hans
>
>
>
>>
>> On Fri, Nov 22, 2019 at 5:16 AM Bob Funk <bobfunk11@gmail.com> wrote:
>>>
>>> Hello,
>>>
>>> My apologies if you are receiving a duplicate of this message. I
>>> attempted to email this earlier but was sent a delivery failure status
>>> reply due to html content. I will attempt to resend it as plain text.
>>>
>>> Original Email:
>>>
>>> The 2019-01-26 commit to the asus-wmi.c driver code in the 4.4 kernel
>>> branch has introduced a bug with several known models of EeePC 
>>> netbooks.
>>>
>>> Description of Problem:
>>> The bug occurs during boot, where the screen (possibly backlight?) will
>>> shut off and display hotkeys are unable to bring it back on. The 
>>> problem
>>> is present on all kernels
>>> since the 2019-01-26 commit. There have been several reports of the
>>> issue in the slackware forum at linuxquestions.org
>>>
>>> Corrective actions taken so far:
>>> Appending acpi_osi=Linux will circumvent the issue and keep the screen
>>> on, but this causes several error messages
>>> in the boot log about eeepc_wmi "failing to load both WMI and and 
>>> legacy
>>> ATKD devices", and warns not to use acpi_osi=Linux.
>>>
>>> Appending acpi_backlight=vendor also prevents the screen from shutting
>>> off during boot. However, pressing the brightness hotkeys
>>> causes the system to hang.
>>>
>>> Reversing the asus-wmi.c patch that was committed on 2019-01-26 and
>>> rebuilding the 4.4 series module also fixes the problem, and brightness
>>> hotkeys work normally. The commit in question is
>>> 0c4a25cc6f2934f3aa99a0bbfd20b71949bcad25
>>>
>>> Model I have tested this on: ASUS EeePC 1000H (Slackware 14.2, kernels
>>> 4.4.201, 4.4.202)
>>> Additional models reporting this issue: ASUS Eee PC 1005HAB, ASUS 
>>> Eee PC
>>> 1225b, ASUS Eee PC 1025c (Slackware 14.2, various kernels from 4.4.172
>>> and higher)
>>>
>>> Additional Notes:
>>> This problem seems to have been corrected in the 4.19 kernel branch, as
>>> reported by several users in the slackware forum.
>>> I attempted to test some of the fixes from the 4.19 code as patches to
>>> the 4.4 code but had no success. There have been multiple
>>> changes in that branch and I am unsure what exactly has corrected the
>>> bug in that version.
>>>
>>> If there is any additional information that I can provide, please 
>>> let me
>>> know.
>>>
>>> Regards,
>>>
>>> Bob Funk
>>
>>
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
>>
>

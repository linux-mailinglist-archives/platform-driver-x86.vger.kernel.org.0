Return-Path: <platform-driver-x86+bounces-4711-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65494DCFB
	for <lists+platform-driver-x86@lfdr.de>; Sat, 10 Aug 2024 14:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCC6E1F21AC2
	for <lists+platform-driver-x86@lfdr.de>; Sat, 10 Aug 2024 12:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149E91586C0;
	Sat, 10 Aug 2024 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iydXJ78m"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB215854F
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723294775; cv=none; b=RzEfW4CCSi09Bo81YKdAyHHZ3rI4rKhjlbpf6aV89tK2qMRF8amBMAJwssWACk0tk47ppMQLmrrm69r7xXkfGoZl67X0237XRIlGffZ5KtiStuLBdr6dJY+ufX00pb/MAsPTE9B7V9Che+QRvklc92ulQfySMJ60XQiXrSUoFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723294775; c=relaxed/simple;
	bh=4xMARRpxMyjYvn6zvTU8voFeT0apV/kJbjQgmxLGwnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rx6iW+bTne85R3GABrt9hm3KZ5ftP5kvgZ40IkyJrLbGfcfpqkJH85JfKEolLpZPMGTDg8HP3xVmalzEVSuxRCE90xUIMxbdXDIvdwTeafCYdKhcKq9KOB3VKQSBxBhUdWxghyrKTVuMiVzu8E0BcWcNANYcjBEJjcfzOxdr7DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iydXJ78m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723294772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SjvVUVvgAL2gERfNzI9KolPmlWkbo256Glc2DD5/Uk=;
	b=iydXJ78m1PzNwTz6bL5kCNK7qB+NEUGbUy05tzb2dxGLXGfSXonEdX9dBlTGMGbqJrz+cf
	VWWTEIaubNP7yt3ynDEsWFcpo16PtVVkdNsFWwhN1r9gLNgNtW9k74d1qsDJyaQrqR9tQS
	itHWyXZGAlb6Ec6WR4qwdZO5osQPIX0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-mrK-Tu_0Mkm1ZcAsc4z-Zg-1; Sat, 10 Aug 2024 08:59:30 -0400
X-MC-Unique: mrK-Tu_0Mkm1ZcAsc4z-Zg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57c93227bbeso2471137a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 05:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723294769; x=1723899569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SjvVUVvgAL2gERfNzI9KolPmlWkbo256Glc2DD5/Uk=;
        b=o5uiWcQH1GdtiGKqvKiQi56wodVK/c6/ufqWS4Ekjj1hVJQaGjbRdNTty9af1pehYd
         IR5WBodd5uoQTmbrrA4kdi9v2Lry03vwC96lbOndQSUlwFzpMFpr6BmRXMOr1pIuuWvu
         v7G6YW4dl6QKvtQ3PVur9yNzzYD60B5Nkz1P/4dC0iMgYUnQfHRnKXSNyHWLFwPbB1xx
         AxvIMnqZ/+19AXJxhqB7DkCj4d2oZo9bF+zQDzO9Fu+vus/XMtVQtiI58qvDKwLYFtBX
         qkNT6TPBOWgsEKUpJZx74YeOzEax7wu107aWjQhzDM2CW0lOW2gFlVKuVdmukSLI0b4Y
         vjAA==
X-Forwarded-Encrypted: i=1; AJvYcCXE7eugl/Hfw6xzvV7coE7Bvdmk4C0tAHaGh1G3my8/9pSuXLZIEj6NPkbCfACIYFx0pWs64WFt5XgrQGg0j99gy/QiMkbml1pOX5udc/cP1mYZ8Q==
X-Gm-Message-State: AOJu0YwFGOioI6HYOmtocCwwAdY4TXd848fAYrNAE/kOb1+46w++Xe8d
	gKYMcTEk7XJMYEk3Z5GKzWP9Do9Fmz98sGMSbfEytI8rqh06LVHHb386OG9oqb+wQ9qCfmHnGgB
	2rzXXj0OTUrvHiHG1cjCHyYAvi+U21zETHwAWRGzNDm3GWuy6ENtBrR4ELsy3A/klc6Uju2Y=
X-Received: by 2002:a05:6402:354a:b0:5a1:7570:8914 with SMTP id 4fb4d7f45d1cf-5bd0a52c34emr3554851a12.11.1723294768989;
        Sat, 10 Aug 2024 05:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFvlVpIFdTgHoe/ixjssCg4o+lh9/VDy285qw2rcVy4mUhC1WJGJxA307Pi5qq3nlg/YZV1g==
X-Received: by 2002:a05:6402:354a:b0:5a1:7570:8914 with SMTP id 4fb4d7f45d1cf-5bd0a52c34emr3554829a12.11.1723294768406;
        Sat, 10 Aug 2024 05:59:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd190ac8b9sm601641a12.23.2024.08.10.05.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Aug 2024 05:59:27 -0700 (PDT)
Message-ID: <e317fe7a-174c-4b21-abde-4452eee502be@redhat.com>
Date: Sat, 10 Aug 2024 14:59:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: psmouse - add resync_on_resume dmi check
To: Jonathan Denose <jdenose@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, jefferymiller@google.com,
 Jonathan Denose <jdenose@google.com>, Raul Rangel <rrangel@chromium.org>,
 linux-input@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20231102075243.1.Idb37ff8043a29f607beab6440c32b9ae52525825@changeid>
 <ZcKs589qYxviC1J4@google.com>
 <CALNJtpV0KsOusPQeGv8bQ3jKy2sUj+k=mPHc172f+vMaTDYPfg@mail.gmail.com>
 <ZcZ2oG1Rls-oR593@google.com>
 <CALNJtpWNbSZdpxky9hTiSRsaGgLDUnM66QGEy213d3Lhra0hsw@mail.gmail.com>
 <ZeDLq9gPs5InBmdK@google.com>
 <CALNJtpWwhen2H9OT1-rZ4bt+huwXPOPz6qVDJ5g+emE1wRSLsw@mail.gmail.com>
 <ZeoHcH59Qsiv90b-@google.com>
 <b9f08bfb-4c1c-4d1b-9061-8a4b1013497d@redhat.com>
 <ZrEDOnxYzbJpC-pH@google.com>
 <CALNJtpUmb70zJnMfk4V6kTAhBEdzjZEch-CbRUojt26WmQFPvQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CALNJtpUmb70zJnMfk4V6kTAhBEdzjZEch-CbRUojt26WmQFPvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jonathan,

On 8/9/24 5:35 PM, Jonathan Denose wrote:
> Hello Hans and Dmitry,
> 
> Yes, as Dmitry described that's the issue that I was seeing but it was
> on a Lenovo N24 and not an Ideapad Z570.

Ah ok, so the initial diagnosis that this was an issue with the
ideapad-laptop module turned out to not be true ?

And the a69ce592cbe0 ("Input: elantech - fix touchpad state on resume
for Lenovo N24") commit which Dmitry mentiones has resolved this,
correct ?

IOW no changes to the ideapad-laptop module are necessary ?

Regards,

Hans




> 
> On Mon, Aug 5, 2024 at 11:52 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> Hi Hans,
>>
>> On Mon, Aug 05, 2024 at 04:18:57PM +0200, Hans de Goede wrote:
>>> Hi Dmitry,
>>>
>>> On 3/7/24 7:29 PM, Dmitry Torokhov wrote:
>>>> On Mon, Mar 04, 2024 at 11:17:31AM -0600, Jonathan Denose wrote:
>>>>> I disabled the ideapad driver by rebuilding the kernel without the
>>>>> ideapad_laptop module. That does fix the suspend/resume issue!
>>>>>
>>>>> Attached are the logs. Is there a way to make this permanent?
>>>>>
>>>>> On Thu, Feb 29, 2024 at 12:23 PM Dmitry Torokhov
>>>>> <dmitry.torokhov@gmail.com> wrote:
>>>>>>
>>>>>> On Mon, Feb 12, 2024 at 02:57:08PM -0600, Jonathan Denose wrote:
>>>>>> ...
>>>>>>> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
>>>>>>> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
>>>>>>> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
>>>>>>> [   50.247406] i8042: [49434] a8 -> i8042 (command)
>>>>>>> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
>>>>>> ...
>>>>>>> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>>>>>>> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>>>>>>> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>>>>>>> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>>>>>> ...
>>>>>>> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
>>>>>>> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
>>>>>>> [   50.248407] i8042: [49435] aa -> i8042 (command)
>>>>>>> [   50.248601] i8042: [49435] 00 <- i8042 (return)
>>>>>>> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55
>>>>>>
>>>>>> So here I see the ideapad-laptop driver trying to access i8042 before it
>>>>>> even starts resuming. I wonder, does it help if you disable
>>>>>> (temporarily) the ideapad driver?
>>>>
>>>> OK, so I tried to cook up a patch that would allow ideapad-laptop driver
>>>> to establish device link with i8042 so that the resume will be processed
>>>> after i8042 resumes, but the longer I think about it, the more I think
>>>> that ideapad driver should not be messing with the touchpad state
>>>> directly. The disable event may come up in a middle of the touchpad
>>>> resume transition, or when we decide to change touchpad mode for one
>>>> reason or another. It also does not respect inhibit/uninhibit controls
>>>> for input devices. I think that the proper way for ideapad driver to
>>>> handle this is to only send KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON to
>>>> userspace and let userspace deal with toggling touchpad input (via
>>>> inhibit or by other means).
>>>>
>>>> CC-ing ideapad maintainers for their thoughts.
>>>
>>> Sorry for the very slow reply.
>>>
>>> The interesting thing is that sometime ago I already removed the i8042_command()
>>> command being done on most models now the ideapad driver already only
>>> sends KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON except on the ideapad Z570 for
>>> which the i8042_command() call was initially added.
>>>
>>> I agree that this should probably just be removed.
>>>
>>> Jonathan, I presume that you are seeing this on an Ideapad Z570 ?
>>> (since that is the only model where this is still done by default).
>>>
>>> Since the i8042_command() call has already been disabled on all other
>>> ideapad models I agree that it would be best to just remove it entirely
>>> relying on userspace filtering out touchpad events after receiving
>>> a KEY_TOUCHPAD_OFF.
>>>
>>> I have submitted a patch to do just that:
>>>
>>> https://lore.kernel.org/platform-driver-x86/20240805141608.170844-1-hdegoede@redhat.com/
>>>
>>> Jonathan can you give this patch a try (with a kernel with
>>> the ideapad-laptop module re-enabled) and then confirm that this
>>> fixes things ?
>>
>> IIRC Jonathan observed the touchpad being stuck on resume even after
>> disabling ideapad-laptop module. So we ended up with a69ce592cbe0
>> ("Input: elantech - fix touchpad state on resume for Lenovo N24") that
>> sends disable and then enable command to the mouse/touchpad on resume
>> which makes touchpad work after resume.
>>
>> Thanks.
>>
>> --
>> Dmitry
> 



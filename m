Return-Path: <platform-driver-x86+bounces-4609-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E8947CB4
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Aug 2024 16:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1851EB20A26
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Aug 2024 14:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70716CDC8;
	Mon,  5 Aug 2024 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PFY40yKR"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3D1386B4
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722867545; cv=none; b=Q2R+bUqAr9Ab0AgYXQlJjQP0nClxVPjjAlDj/z4KJ1M5ilctGYmM9eZJH3evYllRy+Ei8V0BK6zENhJ+Y+NHYkcCE9jOwbY8h4+SWDu4w4FyaCKEN/AtoxX5ypkNHDM4M4Zir/5F8ZQRlWYcLknMuVpAd92FrtHGlCQX1CGo5ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722867545; c=relaxed/simple;
	bh=ClylnsI9TEab7/7gwFTXOiJw+iXRmxLYdF3sJQmSh18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0m140hL1ZmD+iOPuqgwkh0Sq9W1yiH9ehJ2dJ28Rch9X9KlNOkevYYn2JOU99YA8gS7tnAFxDFYLWq8Ht9I3ybhriimxSO60s2NrboWzSHZUy2iY0BVMd/NebiDGbeRfLRfTdkqrkGPocTVTLssiP9xknY/TpVYlN3SERvs3gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PFY40yKR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722867543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCe3y1uIiM1GL00L5pvAaivaCp9AaRAt7xh7KLQ6VRY=;
	b=PFY40yKROpnVrr7pS6mxdqvp0nuhWFAl6M5M2qhLPMfBQjZOFttDZK71Z/O+Mv2HV5/8rF
	x0q/ULlyfo9+lnshX97sRYuTyyWvlyWeVJa3Plfos+jGde0nZ2+UuNeAqaE7fInSBHcEah
	plXcxMHYCJXnInDI0OE546jvuyevpI0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-2ta32xgcMjOCcuV91m9UyA-1; Mon, 05 Aug 2024 10:19:01 -0400
X-MC-Unique: 2ta32xgcMjOCcuV91m9UyA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7aa020cef5so892488666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Aug 2024 07:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722867540; x=1723472340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCe3y1uIiM1GL00L5pvAaivaCp9AaRAt7xh7KLQ6VRY=;
        b=M7erPqMQJuc4+8hn4jQSE9iahn+xbI0rAvSwOiDMyij6IEpsiX0mdTj5s9YKiwQK+a
         Sa/j3YPz9PDFjbDphQuPacLXPV2B9GfXS92lk8XD2jR3r3FmXlK+1Gfwz6xtc8qRdlCV
         XBnKBMMpBHvuuzCPJnd+O/77yNLIGI2m1i41A0QmkQR450pqhl9di5Y1LgQAlBQPm12/
         5U8PT7rhtypXUG5+hhdoI38o8HauNrG/+jz8ns/Rqg2PNsdUqUJOT1YHYjhmcdD4O948
         5qUIA+Q+ind7j0axZouHMURlgjWV8mr/oj8MLlQGJ0MVZzRVwnvOUH1WzxtBqg1m2lY1
         hzBg==
X-Forwarded-Encrypted: i=1; AJvYcCXhqU1iUHgKL/RxYg4offExdO7w0nFE4IkVr1u4XwuA/A0v2GmH9eTyTEyPrW4bON/tQ9S8Emzyv9JwLsOdPabuo8U5uul1jm/dTgFw8bZpGU2ZPA==
X-Gm-Message-State: AOJu0YxMGeptTZ/32qX1YhNdJkgS9jPRiq1Hw2TbDnS3YJoYyKXEGu0c
	YJoPeDAu1Ue04Z0UKz4pscYqdHhHjCMsmhnlebWf2uHg6b6+ei4dO37vtbGGm+WU32LgqD54bQF
	Ti1ajgFKUFZ7cYA+xesQmcU22+eILHSV8LXDvUnPBNv7tKxzOI+CCgItWKw5eVUakYTfohVg=
X-Received: by 2002:a17:907:9707:b0:a7a:9f0f:ab1d with SMTP id a640c23a62f3a-a7dc4ff81a3mr737738666b.38.1722867540143;
        Mon, 05 Aug 2024 07:19:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjNaZi5y4QE6NT6L8dOeFDNmDmImyEA4FZExvAKW+ysWuKaNGRS8gQcFN9P9YkOqNKYsAFHA==
X-Received: by 2002:a17:907:9707:b0:a7a:9f0f:ab1d with SMTP id a640c23a62f3a-a7dc4ff81a3mr737737766b.38.1722867539667;
        Mon, 05 Aug 2024 07:18:59 -0700 (PDT)
Received: from [192.168.211.203] ([109.38.137.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d427b4sm458078266b.130.2024.08.05.07.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 07:18:59 -0700 (PDT)
Message-ID: <b9f08bfb-4c1c-4d1b-9061-8a4b1013497d@redhat.com>
Date: Mon, 5 Aug 2024 16:18:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: psmouse - add resync_on_resume dmi check
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Denose <jdenose@chromium.org>
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
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZeoHcH59Qsiv90b-@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dmitry,

On 3/7/24 7:29 PM, Dmitry Torokhov wrote:
> On Mon, Mar 04, 2024 at 11:17:31AM -0600, Jonathan Denose wrote:
>> I disabled the ideapad driver by rebuilding the kernel without the
>> ideapad_laptop module. That does fix the suspend/resume issue!
>>
>> Attached are the logs. Is there a way to make this permanent?
>>
>> On Thu, Feb 29, 2024 at 12:23 PM Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>>
>>> On Mon, Feb 12, 2024 at 02:57:08PM -0600, Jonathan Denose wrote:
>>> ...
>>>> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
>>>> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
>>>> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
>>>> [   50.247406] i8042: [49434] a8 -> i8042 (command)
>>>> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
>>> ...
>>>> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>>>> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>>>> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>>>> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>>> ...
>>>> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
>>>> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
>>>> [   50.248407] i8042: [49435] aa -> i8042 (command)
>>>> [   50.248601] i8042: [49435] 00 <- i8042 (return)
>>>> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55
>>>
>>> So here I see the ideapad-laptop driver trying to access i8042 before it
>>> even starts resuming. I wonder, does it help if you disable
>>> (temporarily) the ideapad driver?
> 
> OK, so I tried to cook up a patch that would allow ideapad-laptop driver
> to establish device link with i8042 so that the resume will be processed
> after i8042 resumes, but the longer I think about it, the more I think
> that ideapad driver should not be messing with the touchpad state
> directly. The disable event may come up in a middle of the touchpad
> resume transition, or when we decide to change touchpad mode for one
> reason or another. It also does not respect inhibit/uninhibit controls
> for input devices. I think that the proper way for ideapad driver to
> handle this is to only send KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON to
> userspace and let userspace deal with toggling touchpad input (via
> inhibit or by other means).
> 
> CC-ing ideapad maintainers for their thoughts.

Sorry for the very slow reply.

The interesting thing is that sometime ago I already removed the i8042_command()
command being done on most models now the ideapad driver already only
sends KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON except on the ideapad Z570 for
which the i8042_command() call was initially added.

I agree that this should probably just be removed.

Jonathan, I presume that you are seeing this on an Ideapad Z570 ?
(since that is the only model where this is still done by default).

Since the i8042_command() call has already been disabled on all other
ideapad models I agree that it would be best to just remove it entirely
relying on userspace filtering out touchpad events after receiving
a KEY_TOUCHPAD_OFF.

I have submitted a patch to do just that:

https://lore.kernel.org/platform-driver-x86/20240805141608.170844-1-hdegoede@redhat.com/

Jonathan can you give this patch a try (with a kernel with
the ideapad-laptop module re-enabled) and then confirm that this
fixes things ?

Regards,

Hans



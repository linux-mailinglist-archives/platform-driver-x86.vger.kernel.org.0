Return-Path: <platform-driver-x86+bounces-2834-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB328A6BBB
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Apr 2024 15:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01D59282061
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Apr 2024 13:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C5C12BF15;
	Tue, 16 Apr 2024 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLyWlW6A"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C53BB30
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272648; cv=none; b=JfqmbfYzb4sga+wMclgrNSlY4OnAN4AdExYAOycPlyUTHQCtRX6A3J/QkV8xiz14LmIt1pYZGbdZvZY56XF7Uy0vHTzCntYjcM2gmaZjO5dXNidWM/h1b0FujvXmw8duUPU2PBEic8hyprFjxFLdYdkKQI0Ogu0lsixpTjNjUxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272648; c=relaxed/simple;
	bh=qT/DvLtEkEItSkMTF9Uox1gRjssFhj4HKwwSm+BHJ0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StIv/J+6R2wu133vSdvnCPONEAvEiqs2nUGgyrqW+WlaE3O5KXamdZS6WSD/dHdCA0Qpw8JNBkBhVdHsipg0VhK1LhF8nl24EEyfa1rnZ6Icu9fXvANAHkeugK+8C4UY/RQoBvPVxIbN55J5S8e+xGC7K3m0HbBBFigXdrbjji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLyWlW6A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713272641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyZsCqTRWaYYj9xBevyUAJcY+8ZqAtLMg3glbQpBclQ=;
	b=bLyWlW6AhZaEBpYdb46pflMJhXb5GouMzwNxXngxuYZLeJsVaVyeJ6bv0Np1v52JzOVMjg
	kB8Wnt/Yv6pEk8FnyBDgjrHeMq0FijiRogpea0VTXpj9DMmbZRbegPP8ktVKRA9CdZrIQs
	aRLYicLbhTWk1Fh5j5pOlcMlRWclrPU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-Dx1lPmWeOR2taEcjnYtVvA-1; Tue, 16 Apr 2024 09:03:42 -0400
X-MC-Unique: Dx1lPmWeOR2taEcjnYtVvA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a52233a228aso312247466b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 06:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713272615; x=1713877415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EyZsCqTRWaYYj9xBevyUAJcY+8ZqAtLMg3glbQpBclQ=;
        b=mydd0Q1pZ2S7qq7S1R6u+A9KP797fUg5EpuWHmcVFEuw4RWM1syJ6mp8VplBNH8rSs
         cLd6gRtkGdEnNFQ0cKtXdkAEBzBJ8fll9NOxZ+1T2W/J/51OIfekoWYJPcRKE4lWGW/u
         hNWx5YtZU1QgyEMwr8uhAz0vkgWjK5sZi5HVpXnnjSi2uueqIkMSf2mPNqpBn1xTPNO7
         5T7h3atJUtln4ZPvCN/zpe9EwOPnP5CSZSDswGZwik98mNM+m/kf8PMS2w1MYVc3BFG9
         pgdX22L0F3ThOGmDYrAJ9O/Zr0ONm1kS2DGMhzKyNc/kzDIR8B2k1gzRoGLInJop7UoF
         e/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWj6ZTK+jUzy9pgvkKeY63Zd5x7+7Na+qubhSXS83HSOqEFF62mwY1PGMpRorRO4q8vi6IxtKY3GWz2/inXmydebvqtKb7K7DPrU6rLhzvnvmPyug==
X-Gm-Message-State: AOJu0YzC/m0IdG5HfeZQfPnO9mOhkXWLPA7DcSFSvR2SFtLlrO3YnzBi
	cUl8vMi7i3eex//ApAmkIEMK0G8T/R5uDYRbu3oNlclwoeIGzeQY6XHN/QZsdptWtS1hbTjBO2+
	EsD5s6loe1IbdedmR1yDYYrXz9AY2q5QlrxhP/JvwyU6IonU/IpGnkac/dd8/fKofF9WPYsw=
X-Received: by 2002:a17:907:9443:b0:a52:3f00:616d with SMTP id dl3-20020a170907944300b00a523f00616dmr10806129ejc.30.1713272615237;
        Tue, 16 Apr 2024 06:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm9WuOkPYxc8NIQM6HlhhY8n33HCRKTIxsrjvllC0jCz/6K3ToAOq8L8k+RaJucTkWbwUdUg==
X-Received: by 2002:a17:907:9443:b0:a52:3f00:616d with SMTP id dl3-20020a170907944300b00a523f00616dmr10806103ejc.30.1713272614816;
        Tue, 16 Apr 2024 06:03:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ao3-20020a170907358300b00a5256d8c956sm3946568ejc.61.2024.04.16.06.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 06:03:34 -0700 (PDT)
Message-ID: <75ed406b-cb96-4e73-a9d6-06cb0332f9bd@redhat.com>
Date: Tue, 16 Apr 2024 15:03:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Hutterer <peter.hutterer@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>, Vishnu Sankar <vsankar@lenovo.com>
References: <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
 <92ee5cb2-565e-413c-b968-81393a9211c4@app.fastmail.com>
 <ZhcogDESvZmUPEEf@google.com>
 <91593303-4a6a-49c9-87a0-bb6f72f512a1@app.fastmail.com>
 <Zh2CtKy1NfKfojzS@google.com>
 <484638e2-1565-454b-97f8-4fcc6514a69c@redhat.com>
 <Zh2G85df29tPP6OK@google.com>
 <539776c5-6243-464b-99ae-5b1b1fb40e4b@app.fastmail.com>
 <Zh2wO0Bnyr8vFSpc@google.com>
 <7de52ec3-86f3-4a1d-ac87-a106ae1acb5d@app.fastmail.com>
 <27b1b6cf-759c-4778-a53c-5d01442120b7@redhat.com>
 <ce28b0e5-a867-458e-bcb4-cc327be5f19e@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ce28b0e5-a867-458e-bcb4-cc327be5f19e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/16/24 2:48 PM, Mark Pearson wrote:
> Hi Hans
> 
> On Tue, Apr 16, 2024, at 4:33 AM, Hans de Goede wrote:
>> Hi Mark,
>>
>> On 4/16/24 1:57 AM, Mark Pearson wrote:
>>> Hi Dmitry,
>>>
>>> On Mon, Apr 15, 2024, at 6:54 PM, Dmitry Torokhov wrote:
>>>> On Mon, Apr 15, 2024 at 04:28:19PM -0400, Mark Pearson wrote:
>>>>> Hi
>>>>>
>>>>> On Mon, Apr 15, 2024, at 3:58 PM, Dmitry Torokhov wrote:
>>>>>> On Mon, Apr 15, 2024 at 09:50:37PM +0200, Hans de Goede wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 4/15/24 9:40 PM, Dmitry Torokhov wrote:
>>>>>>>> On Wed, Apr 10, 2024 at 10:48:10PM -0400, Mark Pearson wrote:
>>>>>>>>>
>>>>>>>>> I have a stronger preference to keep the KEY_DOUBLECLICK - that one seems less controversial as a genuine new input event.
>>>>>>>>
>>>>>>>> Please see my response to Peter's letter. I think it very much depends
>>>>>>>> on how it will be used (associated with the pointer or standalone as it
>>>>>>>> is now).
>>>>>>>>
>>>>>>>> For standalone application, recalling your statement that on Win you
>>>>>>>> have this gesture invoke configuration utility I would argue for
>>>>>>>> KEY_CONFIG for it.
>>>>>>>
>>>>>>> KEY_CONFIG is already generated by Fn + F# on some ThinkPads to launch
>>>>>>> the GNOME/KDE control center/panel and I believe that at least GNOME
>>>>>>> comes with a default binding to map KEY_CONFIG to the control-center.
>>>>>>
>>>>>> Not KEY_CONTROLPANEL?
>>>>>>
>>>>>> Are there devices that use both Fn+# and the doubleclick? Would it be an
>>>>>> acceptable behavior for the users to have them behave the same?
>>>>>>
>>>>> Catching up with the thread, thanks for all the comments.
>>>>>
>>>>> For FN+N (originally KEY_DEBUG_SYS_INFO) the proposal was to now use
>>>>> KEY_VENDOR there. My conclusion was that this is targeting vendor
>>>>> specific functionality, and that was the closest fit, if a new keycode
>>>>> was not preferred.
>>>>
>>>> Fn+N -> KEY_VENDOR mapping sounds good to me.
>>>>
>>>>>
>>>>> For the doubletap (which is a unique input event - not related to the
>>>>> pointer) I would like to keep it as a new unique event. 
>>>>>
>>>>> I think it's most likely use would be for control panel, but I don't
>>>>> think it should be limited to that. I can see it being useful if users
>>>>> are able to reconfigure it to launch something different (browser or
>>>>> music player maybe?), hence it would be best if it did not conflict
>>>>> with an existing keycode function. I also can't confirm it doesn't
>>>>> clash on existing or future systems - it's possible.
>>>>
>>>> So here is the problem. Keycodes in linux input are not mere
>>>> placeholders for something that will be decided later how it is to be
>>>> used, they are supposed to communicate intent and userspace ideally does
>>>> not need to have any additional knowledge about where the event is
>>>> coming from. A keyboard either internal or external sends KEY_SCREENLOCK
>>>> and the system should lock the screen. It should not be aware that one
>>>> device was a generic USB external keyboard while another had an internal
>>>> sensor that recognized hovering palm making swiping motion to the right
>>>> because a vendor decided to make it. Otherwise you have millions of
>>>> input devices all generating unique codes and you need userspace to
>>>> decide how to interpret data coming from each device individually.
>>>>
>>>> If you truly do not have a defined use case for it you have a couple
>>>> options:
>>>>
>>>> - assign it KEY_RESERVED, ensure your driver allows remapping to an
>>>>   arbitrary keycode, let user or distro assign desired keycode to it
>>>>
>>>> - assign KEY_PROG1 .. KEY_PROG4 - pretty much the same - leave it in the
>>>>   hand of the user to define a shortcut in their DE to make it useful
>>>>
>>>>>
>>>>> FWIW - I wouldn't be surprised with some of the new gaming systems
>>>>> we're seeing (Steamdeck, Legion-Go, etc), that a doubletap event on a
>>>>> joystick might be useful to have, if the HW supports it?
>>>>
>>>> What would it do exactly? Once we have this answer we can define key or
>>>> button code (although I do agree that game controller buttons are
>>>> different from "normal" keys because they map to the geometry of the
>>>> controller which in turn defines their commonly understood function).
>>>>
>>>> But in any case you would not reuse the same keycode for something that
>>>> is supposed to invoke a configuration utility and also to let's say
>>>> drop a flash grenade in a game.
>>>>
>>>
>>> Understood.
>>>
>>> I don't see a path forward within your stated parameters. I did not realise that there were such limitations, so my apologies for wasting everybody's time, and thank you for your patience and guidance.
>>>
>>> I will drop this patch from the series and proceed using existing defined codes only.
>>>
>>> Hans, I'll need to rejig things a bits but I have some ideas and I think I can make it work and stay within the pdx86 tree, which will make it simpler.
>>
>> Ok this sounds good to me. For Fn + N using KEY_VENDOR sounds good for
>> me and for the doubletap any one of 
>> KEY_CONFIG/KEY_CONTROLPANEL/KEY_INFO/KEY_PROG1
>> or some other suitable KEY_foo define works for me.
>>
> I think this should be a configurable input, by design. So my preference (if not allowed a new keycode, which I personally think is the better option) is for PROG1.
> 
> I discussed with Peter last night and it looks likely OK on their side. I do plan on doing some testing first, so it might take a few days to get the next set of patches out.

Ok, PROG1 works for me.

Regards,

Hans





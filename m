Return-Path: <platform-driver-x86+bounces-10534-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6116DA6DA04
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Mar 2025 13:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C893A8DB6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Mar 2025 12:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7DE25E818;
	Mon, 24 Mar 2025 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZsxdY2Pg"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE2B25E810
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818999; cv=none; b=fRlo7aOx9qTtAlm71Nw/FgFAOWum24t6uXPLnG5gKy2BkH/Kb9bIQBb1846u8iDRv7NGmJXp4O/BJSSn4VUq1259zbcSbWeJFrAqNaMiDmLfncIOZYwM9/TBx727zJvwdegEpdwK3VNGpoj3HgXOGUO5IwsRFa7wm5BTEotmHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818999; c=relaxed/simple;
	bh=iRo2aveHmLWkBNCL5SEiofEt4hIesCgvoYzS/ClRhOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oE/l9oZ4PU79fZllgUInroo/+kvUHsKzkTaa+86QAGuQKJ3+6b8NHGN2pdb+IjFN/g5nqmdC9oTl6MQDwXXA5h5OaLodhP7owWDBZCYmp4OZhRXyvR2+nc+Mvga/a4G+pmhS2ICo0GN9khNuTDDGRBau8GIen6Q4d08ZrNXu+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZsxdY2Pg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742818996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UL6yf8pVoqUJi6CAtn5bxl1qeOZOEvMAkGqxmElztU=;
	b=ZsxdY2Pg4Rfh35spWL6ujs33yivUowAnJAfdcqsLsHrGmB2V83X71L8J5VqRGvi3sVTJZF
	/YriEmtxB3oJptqsJyt0S1Iqbfvi0iKfuK5E5xEXxpmTKxKgosSn2gTthM79oka4hau2uH
	uJ0Fnh68HuPSeP8tKY35eQLPC3UPKCE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-3XXuK-grNmyxizd3LQKRBw-1; Mon, 24 Mar 2025 08:23:14 -0400
X-MC-Unique: 3XXuK-grNmyxizd3LQKRBw-1
X-Mimecast-MFC-AGG-ID: 3XXuK-grNmyxizd3LQKRBw_1742818994
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5eb195f01so3788550a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 05:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818993; x=1743423793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UL6yf8pVoqUJi6CAtn5bxl1qeOZOEvMAkGqxmElztU=;
        b=DytnE/cw3/2Bx4EQROBZAiLoAI4/1xV4NUE6LvQKPPxzdJqKBU2WTqvUbtYauqfOUx
         PGi54Z8AvuPJPifadzgVuPRKTyv5b5gYKCSJ62TptdOQGj5DV/L7jF6p9hkkd+fHmJa4
         NYrNNqtmIE0AdGHa5VxlVBd0mK5o2mjVYOik6MaC9lKWzGNnx68LZ9AOLyj8/lsjXKXm
         fpv79ciSaLDaKj4+/Wty0OtPrVTcLMXG+V74zExlBMyEvCv8f0xumVfzq5WDrWYXmLaW
         zjceXe0/4l6ShfUrtSH8hAy9qwAhi69cZxtisGmPYP2l/kJQT23EVp39Gflk3OegsRfh
         pM8g==
X-Forwarded-Encrypted: i=1; AJvYcCVCMxgSKpmn08J+xNI4NSG0xQCvS9PxI03/BxgkBjIAx7OrsJXHdV897/bQuUciHqqp6fuqKBnePzEQ5SddXq79+9PU@vger.kernel.org
X-Gm-Message-State: AOJu0YxffAQBKo/p/B194cMrZyc0uxCa2SOOyL7j05D5e5/nIfmADIDV
	teHRckJNEd8FHpY/a9uKsZtaWBtbY5vAFhySDQY2mE3DiqNrFSIAYpp7wiYI0rLTFaxRDwmGjc/
	B23EJBTm2xFmbsPzYZccOTwHn/KukAiLw9FRMJkw2cYq6aPeUGUodmyJyNYYQv5dkBXad3fA=
X-Gm-Gg: ASbGncu7zIiwYxxHgoA79SLuCh3W4WhIo8HDnRuj1x444QrfzMC4SfeKCZYUBYNTpig
	OrPdTo5g7BwNzXdojU32jNzSQAtPy5FchTmrZY4ZRoMzPfN0C6yXnAaodpBsiBY0EQaim8/t4Dh
	dEjzRc3fZ6/Qtv6Xc4XpAGyO0AjHtjbHf9tSPTdoSeeiJj18RmQoX9ogeSUL+MfYzuRYH2cs81o
	sr/l64M4b4fEMbajMuC6j4ZfcpK6kxKqJEoERSf0dsTUhNypl45sgSuzxHJcACRE7dzGNarL6qS
	+6JaZyMtsZLYsLFYdyI=
X-Received: by 2002:a05:6402:414f:b0:5ec:9513:1eaa with SMTP id 4fb4d7f45d1cf-5ec95131f99mr3819833a12.23.1742818993449;
        Mon, 24 Mar 2025 05:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnGPYLDDHMUs1wuwVWQ8LPcGj4UDEWtD12fPq5VEedaTqRUPGCKPgbqMJDKi/DIJ/P3bVQLw==
X-Received: by 2002:a05:6402:414f:b0:5ec:9513:1eaa with SMTP id 4fb4d7f45d1cf-5ec95131f99mr3819818a12.23.1742818992995;
        Mon, 24 Mar 2025 05:23:12 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf67990sm5931665a12.2.2025.03.24.05.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:23:12 -0700 (PDT)
Message-ID: <35969669-48b6-469e-9cd2-26929fb33e5f@redhat.com>
Date: Mon, 24 Mar 2025 13:23:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Added support for a some new buttons in ideapad-laptop
 driver Added entries to unsuported wmi codes in ideapad_keymap[] and one
 check in wmi_nofify in order to get wmi code 0x13d to trigger
 platform_profile_cycle
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ikepanhc@gmail.com, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <20250321083003.84661-1-gasper.nemgar@gmail.com>
 <ce934c71-2220-c8f9-ff3a-5633360a8935@linux.intel.com>
 <CAKi4K-jVGw58nbxdWKizaNJRzPc3izE9ipZUOwUq=v-hAAjd8w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKi4K-jVGw58nbxdWKizaNJRzPc3izE9ipZUOwUq=v-hAAjd8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 21-Mar-25 15:47, Gašper Nemgar wrote:
> Hello, yes I have noticed it messed up the title and will change it,


> I just have a question about the performance button aka WMI code 0x13d, is it smart to hardwire it into platorm_profile_cycle() or is it better to leave it as KEY_PROG4 keycode. Thanks

That depends on what the key does under Windows, if it cycles through performance
settings under Windows then calling platorm_profile_cycle() is the right thing to do.

If it opens some sort of performance settings dialog / Windows then a free KEY_PROG#
would be better.

Regards,

Hans



> 
> 
> On Fri, 21 Mar 2025 at 15:17, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com <mailto:ilpo.jarvinen@linux.intel.com>> wrote:
> 
>     On Fri, 21 Mar 2025, Gašper Nemgar wrote:
> 
>     Hi Gasper,
> 
>     Thanks for the patch. I think the changelog text got messed up during send
>     as it should here, not in the subject.
> 
>     Also please change "Added support" to "Add support", add the correct
>     prefix into the shortlog (the line in Subject), and add parenthesis after
>     functions in the description.
> 
>     -- 
>      i.
> 
>     > Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com <mailto:gasper.nemgar@gmail.com>>"
>     > ---
>     >  drivers/platform/x86/ideapad-laptop.c | 16 ++++++++++++++++
>     >  1 file changed, 16 insertions(+)
>     >
>     > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>     > index 30bd366d7..a03377d87 100644
>     > --- a/drivers/platform/x86/ideapad-laptop.c
>     > +++ b/drivers/platform/x86/ideapad-laptop.c
>     > @@ -1308,6 +1308,16 @@ static const struct key_entry ideapad_keymap[] = {
>     >       /* Specific to some newer models */
>     >       { KE_KEY,       0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>     >       { KE_KEY,       0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
>     > +     /* Star- (User Asignable Key) */
>     > +     { KE_KEY,       0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
>     > +     /* Eye */
>     > +     { KE_KEY,       0x45 | IDEAPAD_WMI_KEY, { KEY_BRIGHTNESS_CYCLE } },
>     > +     /* Performance toggle also Fn+Q */
>     > +     { KE_KEY,       0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
>     > +     /* shift + prtsc */
>     > +     { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
>     > +     { KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
>     > +     { KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
>     > 
>     >       { KE_END },
>     >  };
>     > @@ -2093,6 +2103,12 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>     > 
>     >               dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>     >                       data->integer.value);
>     > +                             
>     > +             /* performance button triggered by  ...  */
>     > +             if ((data->integer.value | IDEAPAD_WMI_KEY) == 0x13d ) {
>     > +                     platform_profile_cycle();
>     > +                     break;
>     > +             }
>     > 
>     >               /* 0x02 FnLock, 0x03 Esc */
>     >               if (data->integer.value == 0x02 || data->integer.value == 0x03)
>     >
> 



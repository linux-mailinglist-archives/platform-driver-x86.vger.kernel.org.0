Return-Path: <platform-driver-x86+bounces-2901-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0439C8A9D5A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Apr 2024 16:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C36C2B21401
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Apr 2024 14:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFD21649DA;
	Thu, 18 Apr 2024 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMqwb0L8"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB04715FA73
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713451382; cv=none; b=KiUV4S2FwXeD4fvmAWAn0CMRKHghlTvntasfsrJVNxVMhtf/yD06WQOCGHVcwXAAajZj+XBEMQazBXJeJC9qXwb+rDHooNK1pOA9Tis0FWlzhVaImvNGOtfuRn2WIF9kUzfq80TUCWh1pSCCF7pjF2DASVUd6U0gezL4dU+mwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713451382; c=relaxed/simple;
	bh=3K68nrF2JdYrQUwVMNCXY/PuccHh9vrIKiN5ajEtkII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=em9QmhuTl81MKp6jJVqF6pWJGLiYibVV2aj3SZD69z44GiMam/K6NjOoL1k7jQ3RaCaTIHR2iHeBxuaAy2B7v12QT5hi+8MR/oz2SjXeieHcjdhS63S6MmsJIxdG+mhytn0fM/TFp59xDehOY5pdCKsr80BtYD95Ivm0Xy/XXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMqwb0L8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713451380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEulY1IMYG1CkL7+y8mcNYU6ll3ZaZWsDvpO/gddOTE=;
	b=aMqwb0L8CUofymgbk/dIiaFnOouYUwCi8TR1M9wilmfY7vXZNzQS3uPFKjmAJ4QAf7jipP
	LuGGALcCMyLMcyv6yI5U/LtppvMYEXyEdikB+SJW5ZZb7rwYdmAA3DmK/o716wJuLWvPtU
	q/bw/2Oy/7qpb56PhSabn9IzgOwg9dE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-JO-27LkYNryCpPUV1XArXA-1; Thu, 18 Apr 2024 10:42:58 -0400
X-MC-Unique: JO-27LkYNryCpPUV1XArXA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d45c064742so10675581fa.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 07:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713451376; x=1714056176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEulY1IMYG1CkL7+y8mcNYU6ll3ZaZWsDvpO/gddOTE=;
        b=rvJulcnYLzRCagMi1LT1UIO5oW3TFL8Rhx9lQilL6rIGJgGEMASMytyhOO7l1gJbKj
         AMhy/+ZtYmplU89mUqq1O1ypYn65Fb8yh1/KS1wNVVkx79H4TyrVn2+q87y3G/dANDhq
         lwjma1tuRioZwHdCh7Q8ucOzgNhI9GUdMFfTivrZeGhre7+QTQUhJZuBt9i4Kv6D+grk
         oXiJOPt5ZsayBifN53YFlSF3AzQRgwxPaL6HgEhVLh93mlb/0O+yOqPJZnAHq0dDyD3K
         Njt3pAAgFk97o/Zg4sjpD/EJIq/uQkg1H+HfcuuDMUUXl9rEATw6SXQ4+SK2XeHZ126/
         fnng==
X-Forwarded-Encrypted: i=1; AJvYcCVNjRzenFf2Utcg7+BSpz3Yx+Zv8IxdmzILVmTgvqJMzoKFhlbg4Tgf/BbYkUom2vP6JtUf6pnBJQ1T2Jf0O31+ubiVBXQqwODX7Is2/4C4mZMW1A==
X-Gm-Message-State: AOJu0Yz3sHIzPovTlSI6x1cPaogkApcZLix0UOw7aReFhG+45rD3f2y7
	QhMlrvZ94iHxq/WFRJEuqbqq6K/SKUCNZpUNvxnbfuxN/eH3++YEthJWJDErtMW8ct9xWG3LZLQ
	jcJWXHgvIlp5D2ydIzD6JmqGrjxrPNJfLVKaTyhu/Zja/G7BYthkuFWswCS/8ZZyHRC4kJMy17b
	X3cdI=
X-Received: by 2002:a19:5e55:0:b0:519:5df9:d945 with SMTP id z21-20020a195e55000000b005195df9d945mr1745986lfi.4.1713451376353;
        Thu, 18 Apr 2024 07:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELpXwRPctoeGKFEBAu2CYwaNSavV4jtl33oD/gar4gd/CLiWonOSCOeeOnpK7gTrukHkmE5w==
X-Received: by 2002:a19:5e55:0:b0:519:5df9:d945 with SMTP id z21-20020a195e55000000b005195df9d945mr1745961lfi.4.1713451375758;
        Thu, 18 Apr 2024 07:42:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k13-20020a508acd000000b0056ff510c327sm985991edk.94.2024.04.18.07.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:42:55 -0700 (PDT)
Message-ID: <472cf6b8-dbc2-4446-9c6e-aa3a257013c3@redhat.com>
Date: Thu, 18 Apr 2024 16:42:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: thinkpad_acpi: Support for
 trackpoint doubletap
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Nitin Joshi1 <njoshi1@lenovo.com>,
 Vishnu Sankar <vsankar@lenovo.com>,
 Peter Hutterer <peter.hutterer@redhat.com>,
 Vishnu Sankar <vishnuocv@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20240417173124.9953-1-mpearson-lenovo@squebb.ca>
 <20240417173124.9953-2-mpearson-lenovo@squebb.ca>
 <98082080-0fcf-470f-afa5-76ec2bbffee7@redhat.com>
 <55ded7c3-fbc5-4fa5-8b63-da4d7aa4966c@redhat.com>
 <a7f7d94a-f1c8-4d6a-9c65-b5de59b9f7c0@app.fastmail.com>
 <76d92fdc-ad0a-40a2-9e1b-d550f8e07267@redhat.com>
 <0917e5bc-a198-4aa8-812e-31434408e78d@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0917e5bc-a198-4aa8-812e-31434408e78d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/18/24 2:24 PM, Mark Pearson wrote:
> Hi Hans,
> 
> On Thu, Apr 18, 2024, at 7:34 AM, Hans de Goede wrote:
>> Hi Mark,
>>
>> On 4/18/24 1:57 AM, Mark Pearson wrote:
>>> Hi Hans,
>>>
>>> On Wed, Apr 17, 2024, at 4:06 PM, Hans de Goede wrote:
>>>> Hi Mark,
>>>>
>>>> On 4/17/24 9:39 PM, Hans de Goede wrote:
>>>>> Hi Mark,
>>>>>
>>>>> Thank you for the new version of this series, overall this looks good,
>>>>> one small remark below.
>>>>>
>>>>> On 4/17/24 7:31 PM, Mark Pearson wrote:
>>>>>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>>>>>> This handles the doubletap event and sends the KEY_PROG1 event to
>>>>>> userspace.
>>>>>>
>>>>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>>>> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>>  - Use KEY_PROG1 instead of KEY_DOUBLETAP as input maintainer doesn't
>>>>>>    want new un-specific key codes added.
>>>>>>  - Add doubletap to hotkey scan code table and use existing hotkey
>>>>>>    functionality.
>>>>>>  - Tested using evtest, and then gnome settings to configure a custom shortcut
>>>>>>    to launch an application.
>>>>>>
>>>>>>  drivers/platform/x86/thinkpad_acpi.c | 18 ++++++++++++++++++
>>>>>>  1 file changed, 18 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>>>> index 3b48d893280f..6d04d45e8d45 100644
>>>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>>>> @@ -232,6 +232,9 @@ enum tpacpi_hkey_event_t {
>>>>>>  
>>>>>>  	/* Misc */
>>>>>>  	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
>>>>>> +
>>>>>> +	/* Misc2 */
>>>>>> +	TP_HKEY_EV_TRACK_DOUBLETAP      = 0x8036, /* trackpoint doubletap */
>>>>>>  };
>>>>>>  
>>>>>>  /****************************************************************************
>>>>>> @@ -1786,6 +1789,7 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
>>>>>>  	TP_ACPI_HOTKEYSCAN_NOTIFICATION_CENTER,
>>>>>>  	TP_ACPI_HOTKEYSCAN_PICKUP_PHONE,
>>>>>>  	TP_ACPI_HOTKEYSCAN_HANGUP_PHONE,
>>>>>
>>>>> I understand why you've done this but I think this needs a comment,
>>>>> something like:
>>>>>
>>>>>         /*
>>>>>          * For TP_HKEY_EV_TRACK_DOUBLETAP, unlike the codes above which map to:
>>>>>          * (hkey_event - 0x1300) + TP_ACPI_HOTKEYSCAN_EXTENDED_START, this is
>>>>>          * hardcoded for TP_HKEY_EV_TRACK_DOUBLETAP handling. Therefor this must
>>>>>          * always be the last entry (after any 0x1300-0x13ff entries).
>>>>>          */
>>>>> +	TP_ACPI_HOTKEYSCAN_DOUBLETAP,
>>>>
>>>> Ugh, actually this will not work becuuse we want hotkeyscancodes to be stable
>>>> because these are userspace API since they can be remapped using hwdb so we
>>>> cannot have the hotkeyscancode changing when new 0x1300-0x13ff range entries
>>>> get added.
>>>>
>>>> So we need to either grow the table a lot and reserve a whole bunch of space
>>>> for future 0x13xx - 0x13ff codes or maybe something like this:
>>>>
>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>>>> b/drivers/platform/x86/thinkpad_acpi.c
>>>> index 771aaa7ae4cf..af3279889ecc 100644
>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>> @@ -1742,7 +1742,12 @@ enum {	/* hot key scan codes (derived from ACPI 
>>>> DSDT) */
>>>>  	TP_ACPI_HOTKEYSCAN_VOLUMEDOWN,
>>>>  	TP_ACPI_HOTKEYSCAN_MUTE,
>>>>  	TP_ACPI_HOTKEYSCAN_THINKPAD,
>>>> -	TP_ACPI_HOTKEYSCAN_UNK1,
>>>> +	/*
>>>> +	 * Note this gets send both on 0x1019 and on 
>>>> TP_HKEY_EV_TRACK_DOUBLETAP
>>>> +	 * hotkey-events. 0x1019 events have never been seen on any actual hw
>>>> +	 * and a scancode is needed for the special 0x8036 doubletap 
>>>> hotkey-event.
>>>> +	 */
>>>> +	TP_ACPI_HOTKEYSCAN_DOUBLETAP,
>>>>  	TP_ACPI_HOTKEYSCAN_UNK2,
>>>>  	TP_ACPI_HOTKEYSCAN_UNK3,
>>>>  	TP_ACPI_HOTKEYSCAN_UNK4,
>>>>
>>>> or just hardcode KEY_PROG1 like your previous patch does, but I'm not
>>>> a fan of that because of loosing hwdb remapping functionality for this
>>>> "key" then.
>>>>
>>>> Note I'm open to other suggestions.
>>>>
>>> Oh...I hadn't thought of that impact. That's not great :(
>>>
>>> I have an idea, but want to prototype it to see if it works out or not. Will update once I've had a chance to play with it.
>>
>> Thinking more about this I just realized that the input subsystem
>> already has a mechanism for dealing with scancode ranges with
>> (big) holes in them in the form of linux/input/sparse-keymap.h .
>>
>> I think that what needs to be done is convert the existing code
>> to use sparse-keymap, keeping the mapping of the "MHKP"
>> returned hkey codes to internal TP_ACPI_HOTKEYSCAN_* values
>> for currently supported "MHKP" hkey codes for compatibility
>> and then for new codes just directly map them in the sparse map
>> aka the struct key_entry table. After converting the existing code
>> to use sparse-keymap, then for the new events we would simply add:
>>
>>
>> 	{ KE_KEY, 0x131d, { KEY_VENDOR} }, /* Fn + N, system debug info */
>> 	{ KE_KEY, 0x8036, { KEY_PROG1 } }, /* Trackpoint doubletap */
>>
>> entries to the table without needing to define intermediate
>> TP_ACPI_HOTKEYSCAN_* values for these.
>>
> 
> Ah! I didn't know about sparse-keymap but it looks similar to what I was thinking and played with a bit last night. Agreed using existing infrastructure is better.
> 
> Only things I'd flag is that:
>  - It did look like it would be useful to identify keys that the driver handles (there aren't many but a few). Maybe one of the other key types can help handle that?
>  - There are also some keys that use the tpacpi_input_send_key_masked that might need some special consideration.
> 
>> I already have somewhat of a design for this in my head and I really
>> believe this is the way forward as it uses existing kernel infra
>> and it will avoid hitting this problem again when some other new
>> "MHKP" hkey codes show up.
>>
>> I plan to start working on implementing conversion of the existing
>> code to use sparse-keymap, which should result in a nice cleanup
>> after lunch and I hope to have something for you to test no later
>> then next Tuesday.
>>
> 
> That would be amazing - do let me know if there is anything I can help with. Agreed this will help clean up a bunch of the keycode handling :)

I noticed a small problem while working on this. The hwdb shipped with
systemd has:

# thinkpad_acpi driver
evdev:name:ThinkPad Extra Buttons:dmi:bvn*:bvr*:bd*:svnIBM*:pn*:*
 KEYBOARD_KEY_01=battery                                # Fn+F2
 KEYBOARD_KEY_02=screenlock                             # Fn+F3
 KEYBOARD_KEY_03=sleep                                  # Fn+F4
 KEYBOARD_KEY_04=wlan                                   # Fn+F5
 KEYBOARD_KEY_06=switchvideomode                        # Fn+F7
 KEYBOARD_KEY_07=zoom                                   # Fn+F8 screen expand
 KEYBOARD_KEY_08=f24                                    # Fn+F9 undock
 KEYBOARD_KEY_0b=suspend                                # Fn+F12
 KEYBOARD_KEY_0f=brightnessup                           # Fn+Home
 KEYBOARD_KEY_10=brightnessdown                         # Fn+End
 KEYBOARD_KEY_11=kbdillumtoggle                         # Fn+PgUp - ThinkLight
 KEYBOARD_KEY_13=zoom                                   # Fn+Space
 KEYBOARD_KEY_14=volumeup
 KEYBOARD_KEY_15=volumedown
 KEYBOARD_KEY_16=mute
 KEYBOARD_KEY_17=prog1                                  # ThinkPad/ThinkVantage button (high k

Notice the last line, this last line maps the old thinkpad /
thinkvantage key: https://www.thinkwiki.org/wiki/ThinkPad_Button
which is define by the kernel as KEY_VENDOR to KEY_PROG1 to
use a keycode below 240 for X11 compatiblity which does not
handle higher keycodes.

This means that in practice at least on older models
KEY_PROG1 is already taken and the thinkpad / thinkvantage key
does the same (open lenovo help center / sysinfo) as
what the new Fn + N key combo does. So it does makes sense
to map Fn + N to KEY_VENDOR so those align but given the existing
remapping of the thinkpad / thinkvantage key to PROG1 I think
it would be better to not use PROG1 for the doubletap.

I guess we can just use PROG2 instead to avoid the overlap
with the remapped old ThinkPad / ThinkVantage buttons
(which are more like Fn + N then doubletap).

Regards,

Hans









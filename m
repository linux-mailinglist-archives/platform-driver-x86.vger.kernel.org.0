Return-Path: <platform-driver-x86+bounces-1038-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B98405E0
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jan 2024 14:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99026281E71
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jan 2024 13:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DFF61688;
	Mon, 29 Jan 2024 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpOOVyPH"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4C612F6
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706533258; cv=none; b=qq/4fQgfUxR+VVt9HWBWhDI/oyea70svjVSsZ0dulQZWqOSdp8cLYuQS+UHj60Yg354A97IvTJPiPZBElkyEGlPITsq/z9Xperg/VvZqIC73Bckxj4xjkWG7ELiyb+BSGGdICnb8vK0wWIi8M3tQdqx3VF+DNr2Exk/2CkHI/z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706533258; c=relaxed/simple;
	bh=ZUftvY8xSmdixBbMe+tMeh6dBZkFaxNGGUn2u28AxaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT6QJja8oZCklJfyFKriUOc6sm5ejMxxtxCDP7tKqcvYSlucZA1YUGTNQUaDPi0bszg2NUkBsnI1FKeeu36L+WV0b5ySzLGS6swnLiZ22lW4zwc38kUvmBE4E9m1keBNpAat1M/t+pTdP7s3vnpcZNnTc2aceIidxfdBVRmcNcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpOOVyPH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706533255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84oJDHzD1dXthM5sC8FulnqvfgG4LNPiKIgzEQs/jsg=;
	b=MpOOVyPHYmuTZZ8MqUxK1o9FD1DDmZM0vW2zENWk5aBP1+FLin1CL+nsI4rpZTfZb5/h4f
	9tdOB6jS8uH2QhlW9xjBQbH8H0kVJTSyNAKfDw/t70ti76JuXIlpJegTc829pU8L1aIwb4
	RQ53ePsmMErY0Fpe0Zf3tRJTjU0QDQk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-vkUlJeFdP5ybZTSdNxDDGQ-1; Mon, 29 Jan 2024 08:00:53 -0500
X-MC-Unique: vkUlJeFdP5ybZTSdNxDDGQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5101e12059aso2054287e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 05:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706533251; x=1707138051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84oJDHzD1dXthM5sC8FulnqvfgG4LNPiKIgzEQs/jsg=;
        b=QZpyyRGERmMel3I1Qu9345ReOQJfLKD8lHQ6lUMB45RZzw+ubCgCPL6EroppXaYE8n
         OdMslk7ZnvBk7DbWAJ2iEWVdvSY53V3QIpsCdo58M5IeQO8KCDFWHOyJM67u0FGM3wks
         RiDnHxw8Mn322WycV5Lw21EkZcyHvAPiLU3XQEM+I6VAjDxgG1k8/vpxtd2TWNxeKHt1
         JfQHg33vge/BXx/6vwD+8HauXAHdB6AhNzOOmFh0idZI6XKXYYv/iF7NNIm8m8ArQlcc
         qtSahsv5HvaFnWjCUxV6eOOdsnha0Ba+yrPY7i+HRTPmoZvd0Ssa/yltDm2XzP2TCWT+
         AOQg==
X-Gm-Message-State: AOJu0YwOeDU2ujUDKSIBVisyw8mQCr/qiuHQuMchIcTeh+UD74nPe8Tp
	/+JzruZPJ901nTSWM7BmqKpoHzy+FOZNCAyZnotsQP7yzSvZLi6Dl++2egeInfYH5mWZNQ+IPtN
	MbI6B49jiO6m6JA0OKZeKjeTvfx7nPngh15jc6lh13swRycAO8SNF1nozfmlVMgk+5jKE9vg=
X-Received: by 2002:a05:6512:3d0d:b0:510:1702:db30 with SMTP id d13-20020a0565123d0d00b005101702db30mr4552929lfv.39.1706533251632;
        Mon, 29 Jan 2024 05:00:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHS10VX2eDVy8e+lLDdrpQRAvg2P6Wt+/Y2zmfeLuCAbBC0wm4KmjZ//jfPp5AlPBr2x15KVw==
X-Received: by 2002:a05:6512:3d0d:b0:510:1702:db30 with SMTP id d13-20020a0565123d0d00b005101702db30mr4552914lfv.39.1706533251249;
        Mon, 29 Jan 2024 05:00:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d9-20020a193849000000b005100db532cesm1126839lfj.48.2024.01.29.05.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 05:00:50 -0800 (PST)
Message-ID: <848e9543-8923-4d0c-9f6b-559de64f1fb1@redhat.com>
Date: Mon, 29 Jan 2024 14:00:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de> <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de> <Za8xL39m1X22f2Bb@panther>
 <Za9DQdLg2d_CnrZG@panther> <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
 <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de> <Za_Xss52DlydJOOO@panther>
 <e53a660b-f766-479c-8507-ffe25ca0e26e@redhat.com>
 <57df06ee-3aa1-4501-9dc6-a7bc57d770be@gmx.de>
 <6775d202-6cdc-4de7-b562-39d659a4667d@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6775d202-6cdc-4de7-b562-39d659a4667d@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/25/24 21:53, Armin Wolf wrote:
> Am 23.01.24 um 20:58 schrieb Armin Wolf:
> 
>> Am 23.01.24 um 16:34 schrieb Hans de Goede:
>>
>>> Hi,
>>>
>>> On 1/23/24 16:13, Dennis Nezic wrote:
>>>> On 23 Jan 15:22, Armin Wolf wrote:
>>>>> Am 23.01.24 um 09:58 schrieb Armin Wolf:
>>>>>
>>>>>> Am 23.01.24 um 05:40 schrieb Dennis Nezic:
>>>>>>
>>>>>>> On 22 Jan 22:23, Dennis Nezic wrote:
>>>>>>>> On 22 Jan 11:44, Armin Wolf wrote:
>>>>>>>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
>>>>>>>>>
>>>>>>>>>> On 21 Jan 16:16, Armin Wolf wrote:
>>>>>>>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
>>>>>>>>>>>
>>>>>>>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
>>>>>>>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop
>>>>>>>>>>>>>> "doesn't
>>>>>>>>>>>>>> work", showkey doesn't report any keycode or scancode. I
>>>>>>>>>>>>>> don't
>>>>>>>>>>>>>> see any
>>>>>>>>>>>>>> wmi related error messages from dmesg. All the other
>>>>>>>>>>>>>> illuminated
>>>>>>>>>>>>>> "hotkeys" work fine, although confusingly evtest and
>>>>>>>>>>>>>> "libinput
>>>>>>>>>>>>>> debug-events" report that they're coming through the event
>>>>>>>>>>>>>> interface
>>>>>>>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of
>>>>>>>>>>>>>> "HP WMI
>>>>>>>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> hp-wmi.c does seem to reference it:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> How can I go about troubleshooting this? (I'm using kernel
>>>>>>>>>>>>>> 6.6.8)
>>>>>>>>>>>>> it can be possible that your machine does not use hp-wmi to
>>>>>>>>>>>>> deliver keycodes
>>>>>>>>>>>>> to the operating system, but instead emulates a standard
>>>>>>>>>>>>> keyboard controller.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14
>>>>>>>>>>>>> device are being
>>>>>>>>>>>>> received?
>>>>>>>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I
>>>>>>>>>>>> press that
>>>>>>>>>>>> touchkey, but it does when I press all the other touchkeys. (I
>>>>>>>>>>>> do get
>>>>>>>>>>>> lots of accelerometer noise.)
>>>>>>>>>>>>
>>>>>>>>>>> Interesting, can you please share the output of:
>>>>>>>>>>> - "kacpimon" while you where pressing the buttons
>>>>>>>>>>> - "acpidump"
>>>>>>>>>> ...
>>>>>>>>> Those events are touchscreen events, maybe your mouse is
>>>>>>>>> responsible for them.
>>>>>>>> Right, of course, woops, these must have been the touchpad press
>>>>>>>> events,
>>>>>>>> as I was moving the mouse around :P
>>>>>>>>
>>>>>>>>> Instead they look like this:
>>>>>>>>>
>>>>>>>> I'm definitely not seeing anything like that, just "^Input Layer:
>>>>>>>> Type"'s
>>>>>>>>
>>>>>>>>> Can you try to use kacpimon again but without root privileges?
>>>>>>>>> This
>>>>>>>>> way only netlink events show up.
>>>>>>>>> You might also stop acpid while you are using kacpimon.
>>>>>>>> 0 output from/with netlink, even though kacpimon said:
>>>>>>>>
>>>>>>>> Netlink ACPI Family ID: 24
>>>>>>>> Netlink ACPI Multicast Group ID: 5
>>>>>>>> netlink opened successfully
>>>>>>>>
>>>>>>>> Remember all my other fancy hotkeys "work", but they appear as
>>>>>>>> regular
>>>>>>>> keypress events from an "AT Translated Set 2 keyboard".
>>>>>>>>
>>>>>>>>> If you still cannot receive any netlink events, then i might need
>>>>>>>>> to take a look at your ACPI tables
>>>>>>>>> via acpidump.
>>>>>>>> https://dennisn.mooo.com/stuff/dump.txt
>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Armin Wolf
>>>>>>>> Thank you again sir!
>>>>>>> A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
>>>>>>> 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
>>>>>>> 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>>>>> 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>>>>>
>>>>>>> (Btw that "info" key does get illuminated when I touch/press it,
>>>>>>> even
>>>>>>> though no codes are seen.)
>>>>>> These warnings in dmesg are harmless, they are informing you that
>>>>>> some
>>>>>> WMI devices are unavailable.
>>>>>>
>>>>>> I took a look at your ACPI tables and it seems that the WMI device
>>>>>> used by hp-wmi is indeed unused.
>>>>>> What is the model name of your HP notebook?
>>>> HP Compaq 8710p
>>>>
>>>>> Also i just noted that your notebook might contain a PNP0C32
>>>>> quickstart button device.
>>>>> Can you tell me the output of "cat
>>>>> /sys/bus/acpi/devices/PNP0C32\:00/status"?
>>>> 15
>>> Interesting.
>>>
>>> There have been several attempts to add support for this
>>> in the past. The last one being:
>>>
>>> https://lore.kernel.org/platform-driver-x86/20220922182424.934340-1-lkml@vorpal.se/
>>>
>>>
>>> Note that in this case this also required some vender
>>> specific poking in toshiba_acpi to get things to work.
>>>
>>> I see that the HP Compaq 8710p is about the same vintage
>>> as the Toshiba Z830 on which the last attempt to do
>>> something about the quick start buttons was done.
>>>
>>> So this might very well explain the missing button issue.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>> I can try to upstream the necessary changes. But i cannot test the
>> changes concerning the toshiba_acpi driver.
>> Would it be ok if i omit those changes?
>>
>> Dennis, can you check that your device runs the latest BIOS? And if
>> this is not the case, could you do a BIOS
>> update and send me an updated acpidump?
>>
>> The reason for this is that currently, the button device receives only
>> system wake events, but no button press
>> events during runtime. Maybe this is a BIOS bug, although this could
>> also be intentional (fancy power button).
>>
>> Armin Wolf
>>
> Hi,
> 
> while modifying the quickstart button driver to use the standard pm wake infrastructure, i have run into a
> little problem: how to properly hook up the platform device with the ACPI device wakeup infrastructure?
> 
> Is this possible when using a platform driver, or do i need to use a ACPI driver?

I'm not sure what exactly you are looking for but I think the powerbutton
handling in: drivers/platform/x86/intel/hid.c (search for wakeup) may help ?

If that does not help can you point me to the lines of code in the old version
of the code which you are trying to adjust ?

Regards,

Hans






> 
> Thanks,
> Armin Wolf
> 



Return-Path: <platform-driver-x86+bounces-14783-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA3BE83E4
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Oct 2025 13:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE647740FDD
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Oct 2025 11:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288BF32D43E;
	Fri, 17 Oct 2025 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBsnvYSa"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E332D42F
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698836; cv=none; b=SuMjUEfjW2z2Qsl/oXo6OxpkpShhBXDDVZR1c5+WdSsqqi46mkOmH5N4tY3OwCoRX0n3gfXvtnHQfCSZT/mEBkuP7EfRsyI7j63mGFOuASIJaUsNMKyhLwrqEiIvKigspNKquq8POUDh7SBL8I3cXfYtPeWABztO36Qo/54UYlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698836; c=relaxed/simple;
	bh=X/k4PG+xdOF7xY0m2WEnKMOU7XNhSqn9esODmGEd+Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQXiqCFWEa4/CQodEUexz2DNT8h/lSklcf7H5rs3Rzha0w/sFOQYQUEFdiK9kLyC4BsUZGmA0tXyn1eTsZLLx+m27dQD1tQqhDS3SS2EfqAOCOYokTYlNqdJPU61FT2mLyn66oqIIU+IeiUbt+mcsW3qj4BFLOMRkGluizlhuac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBsnvYSa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710683a644so16743415e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 04:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760698832; x=1761303632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiNZLHITLuAH6/ziSaz74G/ai0mUusr2VRPnd1/r2mY=;
        b=bBsnvYSaYrP73Yk4WXwLpbcr7kFRRFrMtzp9NdgnOeSAYdMIVYhwLNugWs63GLN4aF
         sdTM6XNzH7ZInqZz9QMgNWxmtDPjOtao8MMW1p/DS96rmvXHhsv1oEVEoTjI8ItdDDMH
         Bq6Q6QEoCyJ/7zr2h1UZGwFOSLjfPeM/HqP68ZX8yIbWxwrmJSH75HNVFb+w3oekVNVE
         k6MX2PnEqYqT33JV+i0IwffFOd65X/75ydSATv0zLsGKsNHaKsLj+FBjHK5VYgi+U6jX
         1o924smT5DtndeAcwgExtIdxuKac10P5TL1J1SKSm4Ab9DkslRWMrRZ7nsyZb7eoR58z
         H1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698832; x=1761303632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiNZLHITLuAH6/ziSaz74G/ai0mUusr2VRPnd1/r2mY=;
        b=Iu2nd2qdtagqD7W52xk9OJQ5n485dMsujCPkj7ezUtuYjKzgO16guy1GmhRirBYJDY
         1Yk6pI1fBpEiufooCBiDY5OZ5aP1OtzHgbhBxfPfwYH8sodMByENiUbUk3AFJ08qFYcO
         5gGT11Fkcg15Bc82GrpUDe0lW6+VBwW/gZCqTXhIf0dCpK/MMH6OxU8aI5iDwzgWsquy
         cfDa0aBkBJL532c2m4e5LWSNCc7QzwrYlSkgEYfKLxY9KQR0KAdsYQucm5zXAf0Mmo7L
         iBzroBenOZHHS7WGMC/Wt+jZSwn186tKj3mqd8SUB/BCsgWDqv1MiS0NvW8bM72ENX2W
         JxUA==
X-Gm-Message-State: AOJu0YyeuwhcRH8QMXuJPxGBQhh+ifG6lYn4va1hnL7OzrnROrG9BtdM
	ffLBMTmNxrUC9IAg+nqyElAI3/EUMcwexjYbWukWFCtN3RPamunCYoK5
X-Gm-Gg: ASbGncvxmlgt4jrvZ38+i4oQb0jcjfVGXOqmjj+KQD89a50aMLlIFKGD6Wml3CvoKHF
	a5B64p/WY4z0N2bzp8PEdz7Iq7HyLPm5Y6WHLHEGsP33ZdXkeu6xZgmru+DZkA/pyC1yoVkpfUJ
	2CAlncoznIs+vp9+GLeDXkNUy9032EntHngC0ZKK1l5QzVGAoA0AmGpbWMnt503M94YV155htrh
	c24Ak8yp3uMsS9lnA92TeEIkz3BtqXw//NfZQDUN5Xmngdjcl8ynRognapUuXV7OeZMEJhWVd3P
	oIXsvjNlQXxtJO2IV1jxL55wL/cEOXScBpGfpqjUQhUJZqo8Czct9T7dn8LbxB9dEhkN3b21MyY
	dZo7xfy8DffimaI3k3PPQacm+VcaEd+5FATgQnnB1WvnjWZXOiwh11/ocKXP1qdnyvCND9DwD2X
	Jv8/grjRL9UlGrItMTUM0tkkQ2
X-Google-Smtp-Source: AGHT+IEbLdAwygHs9Di0ROLfRSImOiHWtvgFdOnvclzw3gPbykVSFvnbn0mAIaGAmpyOtvJgwh5ZDQ==
X-Received: by 2002:a05:600c:294b:b0:46f:b42e:e363 with SMTP id 5b1f17b1804b1-47109b5f8f4mr39597725e9.20.1760698831686;
        Fri, 17 Oct 2025 04:00:31 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144516fasm82792085e9.16.2025.10.17.04.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:00:31 -0700 (PDT)
Message-ID: <b74b6d4a-7c9a-47a9-bf65-73bcae525bc0@gmail.com>
Date: Fri, 17 Oct 2025 13:00:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Antheas Kapenekakis <lkml@antheas.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
References: <20251013201535.6737-1-lkml@antheas.dev>
 <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com>
 <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
 <c075a9f4-8103-dbcc-a1e7-4eaec5e90597@linux.intel.com>
 <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com>
 <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/17/25 09:54, Antheas Kapenekakis wrote:
> On Thu, 16 Oct 2025 at 18:16, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>> On Thu, 16 Oct 2025 at 17:09, Ilpo Järvinen
>> <ilpo.jarvinen@linux.intel.com> wrote:
>>> On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
>>>> On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.com> wrote:
>>>>> On 10/13/25 22:15, Antheas Kapenekakis wrote:
>>>>>> This is a two part series which does the following:
>>>>>>   - Clean-up init sequence
>>>>>>   - Unify backlight handling to happen under asus-wmi so that all Aura
>>>>>>     devices have synced brightness controls and the backlight button works
>>>>>>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>>>>>>
>>>>>> For more context, see cover letter of V1. Since V5, I removed some patches
>>>>>> to make this easier to merge.
>>>>>>
>>>>>> All comments with these patches had been addressed since V4.
>>>>> I have loaded this patchset for users of asus-linux project to try out.
>>>>>
>>>>> One of them opened a bug report about a kernel bug that happens
>>>>> consistently when closing the lid of his laptop [1].
>>>>>
>>>>> He also sent another piece of kernel log, but didn't specify anything more
>>>>> about this [2].
>>>>>
>>>>> [1] https://pastebin.com/akZx1w10
>>>>> [2] https://pastebin.com/sKdczPgf
>>>> Can you provide a link to the bug report? [2] seems unrelated.
>>>>
>>>> As for [1], it looks like a trace that stems from a sysfs write to
>>>> brightness stemming from userspace that follows the same chain it
>>>> would on a stock kernel and times out. Is it present on a stock
>>>> kernel?
>>>>
>>>> Ilpo should know more about this, could the spinlock be interfering?
>>> [1] certainly seems to do schedule() from do_kbd_led_set() so it's not
>>> possible to use spinlock there.
>>>
>>> So we're back to what requires the spinlock? And what the spinlock
>>> protects?
>> For that invocation, since it is coming from the cdev device owned by
>> asus_wmi, it protects asus_ref.listeners under do_kbd_led_set.
>> asus_wmi is protected by the fact it is owned by that device. Spinlock
>> is not required in this invocation due to not being an IRQ.
>>
>> Under asus_hid_event (second to last patch), which is called from an
>> IRQ, a spinlock is required for protecting both listeners and the
>> asus_ref.asus, and I suspect that scheduling from an IRQ is not
>> allowed either. Is that correct?
> So it is a bit tricky here. When the IRQ fires, it needs to know
> whether asus-wmi will handle the keyboard brightness event so that it
> falls back to emitting it.
>
> If we want it to know for sure, it needs to access asus_wmi, so it
> needs a spinlock or an IRQ friendly lock. This way, currently,
> asus_hid_event will return -EBUSY if there is no led device so the
> event propagates through hid.
>
> If we say that it is good enough to know that it was compiled with
> IS_REACHABLE(CONFIG_ASUS_WMI), ie the actual implementation of
> asus_hid_event in asus-wmi will never return an error, then,
> asus_hid_event can schedule a task to fire the event without a lock,
> and that task can use a normal locking primitive.
>
> If the task needs to be assigned to a device or have a handle,
> asus_hid_listener can be provided to asus_hid_event, so that it is
> owned by the calling device.
>
> What would the appropriate locking primitive be in this case?
The right place to look into appears to be Documentation/kernel-hacking/locking.rst

I see mutex being used in various irq handlers, even bmi323-imu but that page has
many alternatives for irq.

There is rwlock_t but it appears to be using spinlock on certain configurations.

Absolute worst-case scenario you might resort implementing an rwlock with mutexes only.

I would avoid taking decisions based solely on the configuration because ASUS
makes keyboards and reuses designs across various products, so it is very likely
at least one model of those keyboards can be confused with a laptop one.

Beside I am sure there must be at the very least one appropriate synchronization primitive,
so I would discard the configure option.

>> Antheas
>>> Not related to this particular email in this thread, if the users are
>>> testing something with different kernels, it's also important to make sure
>>> that the lockdep configs are enabled in both. As it could be that in one
>>> kernel lockdep is not enabled and thus it won't do the splat.
>>>
>>> --
>>>  i.
>>>
>>>
>>>> My testing on devices that have WMI led controls is a bit limited
>>>> unfortunately. However, most of our asus users have been happy with
>>>> this series for around half a year now.
>>>>
>>>>>> ---
>>>>>> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
>>>>>> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
>>>>>> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
>>>>>> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
>>>>>> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>>>>>>
>>>>>> Changes since V5:
>>>>>>   - It's been a long time
>>>>>>   - Remove addition of RGB as that had some comments I need to work on
>>>>>>   - Remove folio patch (already merged)
>>>>>>   - Remove legacy fix patch 11 from V4. There is a small chance that
>>>>>>     without this patch, some old NKEY keyboards might not respond to
>>>>>>     RGB commands according to Luke, but the kernel driver does not do
>>>>>>     RGB currently. The 0x5d init is done by Armoury crate software in
>>>>>>     Windows. If an issue is found, we can re-add it or just remove patches
>>>>>>     1/2 before merging. However, init could use the cleanup.
>>>>>>
>>>>>> Changes since V4:
>>>>>>   - Fix KConfig (reported by kernel robot)
>>>>>>   - Fix Ilpo's nits, if I missed anything lmk
>>>>>>
>>>>>> Changes since V3:
>>>>>>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
>>>>>>     that it is not needed for their media keys to function.
>>>>>>   - Cover init in asus-wmi with spinlock as per Hans
>>>>>>   - If asus-wmi registers WMI handler with brightness, init the brightness
>>>>>>     in USB Asus keyboards, per Hans.
>>>>>>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
>>>>>>   - Fix oops when unregistering asus-wmi by moving unregister outside of
>>>>>>     the spin lock (but after the asus reference is set to null)
>>>>>>
>>>>>> Changes since V2:
>>>>>>   - Check lazy init succeds in asus-wmi before setting register variable
>>>>>>   - make explicit check in asus_hid_register_listener for listener existing
>>>>>>     to avoid re-init
>>>>>>   - rename asus_brt to asus_hid in most places and harmonize everything
>>>>>>   - switch to a spinlock instead of a mutex to avoid kernel ooops
>>>>>>   - fixup hid device quirks to avoid multiple RGB devices while still exposing
>>>>>>     all input vendor devices. This includes moving rgb init to probe
>>>>>>     instead of the input_configured callbacks.
>>>>>>   - Remove fan key (during retest it appears to be 0xae that is already
>>>>>>     supported by hid-asus)
>>>>>>   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
>>>>>>   - removes fds from userspace and breaks backlight functionality. All
>>>>>>   - current mainline drivers do not support backlight hotplugging, so most
>>>>>>     userspace software (e.g., KDE, UPower) is built with that assumption.
>>>>>>     For the Ally, since it disconnects its controller during sleep, this
>>>>>>     caused the backlight slider to not work in KDE.
>>>>>>
>>>>>> Changes since V1:
>>>>>>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>>>>>>   - Fix ifdef else having an invalid signature (reported by kernel robot)
>>>>>>   - Restore input arguments to init and keyboard function so they can
>>>>>>     be re-used for RGB controls.
>>>>>>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>>>>>>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>>>>>>     keyboard rename into it.
>>>>>>   - Unregister brightness listener before removing work queue to avoid
>>>>>>     a race condition causing corruption
>>>>>>   - Remove spurious mutex unlock in asus_brt_event
>>>>>>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>>>>>>     relocking the mutex and causing a deadlock when unregistering leds
>>>>>>   - Add extra check during unregistering to avoid calling unregister when
>>>>>>     no led device is registered.
>>>>>>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>>>>>>     the driver to create 4 RGB handlers per device. I also suspect some
>>>>>>     extra events sneak through (KDE had the @@@@@@).
>>>>>>
>>>>>> Antheas Kapenekakis (7):
>>>>>>   HID: asus: refactor init sequence per spec
>>>>>>   HID: asus: prevent binding to all HID devices on ROG
>>>>>>   platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
>>>>>>   HID: asus: listen to the asus-wmi brightness device instead of
>>>>>>     creating one
>>>>>>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>>>>>>   platform/x86: asus-wmi: add keyboard brightness event handler
>>>>>>   HID: asus: add support for the asus-wmi brightness handler
>>>>>>
>>>>>>  drivers/hid/hid-asus.c                     | 235 +++++++++++----------
>>>>>>  drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
>>>>>>  include/linux/platform_data/x86/asus-wmi.h |  69 +++---
>>>>>>  3 files changed, 291 insertions(+), 170 deletions(-)
>>>>>>
>>>>>>
>>>>>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>>>


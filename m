Return-Path: <platform-driver-x86+bounces-10538-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011FA6DA33
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Mar 2025 13:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 045D57A304B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Mar 2025 12:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B87025E838;
	Mon, 24 Mar 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i2jGIz9r"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AEE25D54D
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742819882; cv=none; b=WBc+xbv4va3DxusVFmvOV5xP5DqN4U6FNdH2YTKMbD8BRKk4ziKS0qP7SEQ0xnWNmQiSVCwjox7OfoXkI7+M0SaaZs5UO5kQxvlGVr4m/0yJKvyEplVS+gHzGgdykMrGIaAKiFkMS2/HxDlsplWDK2f8DIU6PQrgZ3ie4DIwMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742819882; c=relaxed/simple;
	bh=4rO7bzIGxiU0iug49669O9eNL6Wd+3DSlg9KiLk34Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjXrgKtl3PnraZRIJJkhs6e91SNt0cOfQC+SB8lM6OMKmCRCUxvRb5YrEL9CFYOVeO7X6sAfnTfZAy+LpKyM8E7p8Gi5nxsOlLiI0bi7u/zmftpAnEP9+9rlyw3Fe4xDnz5UOION2f1yc4Tev5ES14iiC0go44fTlGhEZ1uoWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i2jGIz9r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742819879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7680Oy4FVDBbhajzkIzHghGyh3Minzlyf7QDnBr5ccs=;
	b=i2jGIz9r1famAjVcSpYbD4rfHl+TODffbsVBu7z4yf+c+aRSaIBqwkHkrnhW9nCUftYYQr
	V1Q3xGQl+CO19MG/7o/kknCHia9EBFwvW9mKcI7mxGTMKEIgCpYjKTG+C38r9NX3jyonQ8
	c1CHy3MX1aP10Ee0l5DJnboBM/nMpZc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-gQf1ud57OQ2CQcM34xPRPQ-1; Mon, 24 Mar 2025 08:37:58 -0400
X-MC-Unique: gQf1ud57OQ2CQcM34xPRPQ-1
X-Mimecast-MFC-AGG-ID: gQf1ud57OQ2CQcM34xPRPQ_1742819877
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so336084266b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 05:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742819877; x=1743424677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7680Oy4FVDBbhajzkIzHghGyh3Minzlyf7QDnBr5ccs=;
        b=HOSJBuk5o9XRUMHm9KXHCIqCXJlZqwvM2XQ23BdVaqgGDw2VvoG3g4xlJ7/v+bwr4s
         9/bO0XtRA83x82oJvT98qA4DcAf4xC7amddpR8HjjsOm+cbFrGCV7sKLs+X/y8g/mrBl
         To1onX4ksntGlGEPNJDHgc9VA5iUcvY5Kg4+YwywvDH0Ecbqo+3qbDzwGQ94PMt5DYnJ
         7EmwjpCpFbDb3A63IEt40Lj5iyo2qFF5mPOAvHF0aa0zZGEhqadmMxI/e57tnvMbVREL
         Bk+Lugz1SbzdPH9xs40Ua5FVC5abNv6TK1r8oAXtgfm2odkLrdRL6j489n6UZu/FqcDZ
         Xakg==
X-Gm-Message-State: AOJu0Ywvn2HAYEkjbBIyWPeFSfAYJmqRs9Gl8LJWgaF6spzXGP77P4XQ
	2DuuMVSAjuy/nu1swN3qJ0k3dcFowHLdVIZHDHUkUS2LbQkMCVKFsWTjxktNhyZfa9FD1SgGTQB
	KT6r9APPOtBz1TI7+g4JU1TDb8yfXzyzvB9DFPuzBXwVqso/FHW3NFQtrF/4sT2g3NDYfAuk=
X-Gm-Gg: ASbGncsU9+gNfJpypj4zf2rNqH8z7b1Le2Q8NlGSYOAUeVE7nCqD5MjNMGsGBcRQAMW
	zeoLn6UWrzw1iaPTX5GcwUyODu/knr79mm5909wfC1V6vTvKN1Zz+2+H4VqD7iTiYZSqUER5gvD
	DkKERC3G7yvAvWJr0gVZ3tRZi7wLJ5wDuo9jQQAnvNXH/TDqmwa/Zp1SSf6vK2DNc6HoYRNN+Ks
	nRNq0Cfh4s2Ykg1zwD0VKYm0laCgzo5dWFyxbcX5DZadbthPjn2ceKzZvx5XAeWcRgY6v7VUKk8
	TI+rM2bjQMqF3C/kTKM=
X-Received: by 2002:a17:907:d2dc:b0:ac3:a7bb:1c2f with SMTP id a640c23a62f3a-ac3f241b95emr1348898366b.7.1742819876618;
        Mon, 24 Mar 2025 05:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ2L5VtpZOKXSr0FRdxQRvzNQfy/2QU4NwzmTBpufhsDv2/MYJyTPheLWxJAYM53Hd0BTe1w==
X-Received: by 2002:a17:907:d2dc:b0:ac3:a7bb:1c2f with SMTP id a640c23a62f3a-ac3f241b95emr1348895166b.7.1742819876064;
        Mon, 24 Mar 2025 05:37:56 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm674965066b.68.2025.03.24.05.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:37:55 -0700 (PDT)
Message-ID: <48476ab4-117d-4897-a728-78b22164ff2c@redhat.com>
Date: Mon, 24 Mar 2025 13:37:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-5-lkml@antheas.dev>
 <8666efcb-37b5-4201-ac47-0afde8881068@redhat.com>
 <CAGwozwEG5S_5nE5Fitv7W161JEOjCAqaqrZq9cFVkbac8crqMA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGwozwEG5S_5nE5Fitv7W161JEOjCAqaqrZq9cFVkbac8crqMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Mar-25 13:29, Antheas Kapenekakis wrote:
> On Mon, 24 Mar 2025 at 12:31, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Antheas,
>>
>> Note not a full review, just taking a generic look at the new API
>> between asus-wmi and asus-hid.
>>
>> On 22-Mar-25 11:27, Antheas Kapenekakis wrote:
>>> Some devices, such as the Z13 have multiple AURA devices connected
>>> to them by USB. In addition, they might have a WMI interface for
>>> RGB. In Windows, Armoury Crate exposes a unified brightness slider
>>> for all of them, with 3 brightness levels.
>>>
>>> Therefore, to be synergistic in Linux, and support existing tooling
>>> such as UPower, allow adding listeners to the RGB device of the WMI
>>> interface. If WMI does not exist, lazy initialize the interface.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>  drivers/platform/x86/asus-wmi.c            | 113 ++++++++++++++++++---
>>>  include/linux/platform_data/x86/asus-wmi.h |  16 +++
>>>  2 files changed, 117 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>> index 38ef778e8c19b..95ef9b1d321bb 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -254,6 +254,8 @@ struct asus_wmi {
>>>       int tpd_led_wk;
>>>       struct led_classdev kbd_led;
>>>       int kbd_led_wk;
>>> +     bool kbd_led_avail;
>>> +     bool kbd_led_registered;
>>>       struct led_classdev lightbar_led;
>>>       int lightbar_led_wk;
>>>       struct led_classdev micmute_led;
>>> @@ -1487,6 +1489,53 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
>>>
>>>  /* LEDs ***********************************************************************/
>>>
>>> +struct asus_hid_ref {
>>> +     struct list_head listeners;
>>> +     struct asus_wmi *asus;
>>> +     spinlock_t lock;
>>> +};
>>> +
>>> +struct asus_hid_ref asus_ref = {
>>> +     .listeners = LIST_HEAD_INIT(asus_ref.listeners),
>>> +     .asus = NULL,
>>> +     .lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
>>> +};
>>> +
>>> +int asus_hid_register_listener(struct asus_hid_listener *bdev)
>>> +{
>>> +     unsigned long flags;
>>> +     int ret = 0;
>>> +
>>> +     spin_lock_irqsave(&asus_ref.lock, flags);
>>> +     list_add_tail(&bdev->list, &asus_ref.listeners);
>>> +     if (asus_ref.asus) {
>>> +             if (asus_ref.asus->kbd_led_registered && asus_ref.asus->kbd_led_wk >= 0)
>>> +                     bdev->brightness_set(bdev, asus_ref.asus->kbd_led_wk);
>>> +
>>> +             if (!asus_ref.asus->kbd_led_registered) {
>>> +                     ret = led_classdev_register(
>>> +                             &asus_ref.asus->platform_device->dev,
>>> +                             &asus_ref.asus->kbd_led);
>>> +                     if (!ret)
>>> +                             asus_ref.asus->kbd_led_registered = true;
>>> +             }
>>> +     }
>>> +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>>> +
>>> +     return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(asus_hid_register_listener);
>>> +
>>> +void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>>> +{
>>> +     unsigned long flags;
>>> +
>>> +     spin_lock_irqsave(&asus_ref.lock, flags);
>>> +     list_del(&bdev->list);
>>> +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>>> +}
>>> +EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
>>> +
>>>  /*
>>>   * These functions actually update the LED's, and are called from a
>>>   * workqueue. By doing this as separate work rather than when the LED
>>> @@ -1566,6 +1615,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>>>
>>>  static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>>>  {
>>> +     struct asus_hid_listener *listener;
>>>       struct asus_wmi *asus;
>>>       int max_level;
>>>
>>> @@ -1573,25 +1623,39 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>>>       max_level = asus->kbd_led.max_brightness;
>>>
>>>       asus->kbd_led_wk = clamp_val(value, 0, max_level);
>>> -     kbd_led_update(asus);
>>> +
>>> +     if (asus->kbd_led_avail)
>>> +             kbd_led_update(asus);
>>> +
>>> +     list_for_each_entry(listener, &asus_ref.listeners, list)
>>> +             listener->brightness_set(listener, asus->kbd_led_wk);
>>>  }
>>>
>>>  static void kbd_led_set(struct led_classdev *led_cdev,
>>>                       enum led_brightness value)
>>>  {
>>> +     unsigned long flags;
>>> +
>>>       /* Prevent disabling keyboard backlight on module unregister */
>>>       if (led_cdev->flags & LED_UNREGISTERING)
>>>               return;
>>>
>>> +     spin_lock_irqsave(&asus_ref.lock, flags);
>>>       do_kbd_led_set(led_cdev, value);
>>> +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>>>  }
>>>
>>>  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
>>>  {
>>> -     struct led_classdev *led_cdev = &asus->kbd_led;
>>> +     struct led_classdev *led_cdev;
>>> +     unsigned long flags;
>>> +
>>> +     spin_lock_irqsave(&asus_ref.lock, flags);
>>> +     led_cdev = &asus->kbd_led;
>>>
>>>       do_kbd_led_set(led_cdev, value);
>>>       led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
>>> +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>>>  }
>>>
>>>  static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>>> @@ -1601,6 +1665,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>>>
>>>       asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>>>
>>> +     if (!asus->kbd_led_avail)
>>> +             return asus->kbd_led_wk;
>>> +
>>>       retval = kbd_led_read(asus, &value, NULL);
>>>       if (retval < 0)
>>>               return retval;
>>> @@ -1716,7 +1783,14 @@ static int camera_led_set(struct led_classdev *led_cdev,
>>>
>>>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>>>  {
>>> -     led_classdev_unregister(&asus->kbd_led);
>>> +     unsigned long flags;
>>> +
>>> +     spin_lock_irqsave(&asus_ref.lock, flags);
>>> +     asus_ref.asus = NULL;
>>> +     if (asus->kbd_led_registered)
>>> +             led_classdev_unregister(&asus->kbd_led);
>>> +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>>> +
>>>       led_classdev_unregister(&asus->tpd_led);
>>>       led_classdev_unregister(&asus->wlan_led);
>>>       led_classdev_unregister(&asus->lightbar_led);
>>> @@ -1730,6 +1804,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
>>>  static int asus_wmi_led_init(struct asus_wmi *asus)
>>>  {
>>>       int rv = 0, num_rgb_groups = 0, led_val;
>>> +     unsigned long flags;
>>> +     bool has_listeners;
>>>
>>>       if (asus->kbd_rgb_dev)
>>>               kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
>>> @@ -1754,24 +1830,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>>>                       goto error;
>>>       }
>>>
>>> -     if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
>>> -             pr_info("using asus-wmi for asus::kbd_backlight\n");
>>> +     asus->kbd_led.name = "asus::kbd_backlight";
>>> +     asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>>> +     asus->kbd_led.brightness_set = kbd_led_set;
>>> +     asus->kbd_led.brightness_get = kbd_led_get;
>>> +     asus->kbd_led.max_brightness = 3;
>>> +     asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
>>> +
>>> +     if (asus->kbd_led_avail)
>>>               asus->kbd_led_wk = led_val;
>>> -             asus->kbd_led.name = "asus::kbd_backlight";
>>> -             asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>>> -             asus->kbd_led.brightness_set = kbd_led_set;
>>> -             asus->kbd_led.brightness_get = kbd_led_get;
>>> -             asus->kbd_led.max_brightness = 3;
>>> +     else
>>> +             asus->kbd_led_wk = -1;
>>> +
>>> +     if (asus->kbd_led_avail && num_rgb_groups != 0)
>>> +             asus->kbd_led.groups = kbd_rgb_mode_groups;
>>>
>>> -             if (num_rgb_groups != 0)
>>> -                     asus->kbd_led.groups = kbd_rgb_mode_groups;
>>> +     spin_lock_irqsave(&asus_ref.lock, flags);
>>> +     has_listeners = !list_empty(&asus_ref.listeners);
>>> +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>>
>> It seems to me that you should also call brightness_set()
>> on all the kbds already in the list so that their brightness
>> gets synced with the wmi kbd-backlight brightness when
>> the wmi driver loads later then the hid driver ?
> 
> You raise a good point here. Let me think about it.
> 
> But yes, if we do a notify when kbd_led_wk != -1 if the hid device
> connects after, we should do it for the before case too.
> 
>>>
>>> +     if (asus->kbd_led_avail || has_listeners) {
>>>               rv = led_classdev_register(&asus->platform_device->dev,
>>>                                          &asus->kbd_led);
>>>               if (rv)
>>>                       goto error;
>>> +             asus->kbd_led_registered = true;
>>>       }
>>>
>>> +     spin_lock_irqsave(&asus_ref.lock, flags);
>>> +     asus_ref.asus = asus;
>>
>> There is race here where a hid keyboard might show up between
>> the 2 places you take the lock, in that case if there is
>> no wmi kbd-backlight then you will not register the led_classdev
>> when asus_hid_register_listener() gets called between the unlock
>> and the lock...  I'm not sure what the best way is to fix this.
> 
> Thanks for catching that, probably a recheck:
> 
> has_listeners = !list_empty(&asus_ref.listeners);
> if (has_listeners) goto register;

I just noticed that in asus_hid_register_listener()
you keep the lock locked while calling led_classdev_register()
so that apparently is ok to do. In which case you can just
hold the lock over the led_classdev_register() call here too.

Regards,

Hans




>>> +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>>> +
>>>       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
>>>                       && (asus->driver->quirks->wapf > 0)) {
>>>               INIT_WORK(&asus->wlan_led_work, wlan_led_update);
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index 783e2a336861b..ec8b0c585a63f 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -157,14 +157,30 @@
>>>  #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK        0x0000FF00
>>>  #define ASUS_WMI_DSTS_LIGHTBAR_MASK  0x0000000F
>>>
>>> +struct asus_hid_listener {
>>> +     struct list_head list;
>>> +     void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
>>> +};
>>> +
>>>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>>>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>>> +
>>> +int asus_hid_register_listener(struct asus_hid_listener *cdev);
>>> +void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
>>>  #else
>>>  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>>>                                          u32 *retval)
>>>  {
>>>       return -ENODEV;
>>>  }
>>> +
>>> +static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
>>> +{
>>> +     return -ENODEV;
>>> +}
>>> +static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>>> +{
>>> +}
>>>  #endif
>>>
>>>  /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
>>
> 



Return-Path: <platform-driver-x86+bounces-2604-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 094CB89B2B8
	for <lists+platform-driver-x86@lfdr.de>; Sun,  7 Apr 2024 17:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5581F21EB3
	for <lists+platform-driver-x86@lfdr.de>; Sun,  7 Apr 2024 15:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2846B3A267;
	Sun,  7 Apr 2024 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PExbmaJQ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3553E39AFE
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Apr 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712503984; cv=none; b=OOIRD+vOsaJxQGHxT3KPmWHv67M0UN2FatgvcvjZxNex8DPJxWAqakQa0fzWlg0HN0ze/lKnMhYhaVC8DNX3N7jCsrfCrOufRJMN64oT6eiTIwTYqlX/PFHs0qGZJr7DWrhGRNSIZOfQmrjE2FQTULS/ArPSFo8iK2Wc46UFx7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712503984; c=relaxed/simple;
	bh=IdIszNAZdHUvkpcbu4SCWsXGKWy/qpq4SQEnarOFj2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6sL+rE+BzshvT/ZrjwBpEprA8Fsisc59zbMxLoBsZ/qrLXX4i16OElpEt3uYs05p8x969QEdbz6KnpMHgJf5/11KxWcH/18x6f3ClowotGQ2aJcrMkvDwSp/oX6JSkpimpg2rld1QsNs7WU75FmIKjDsJUjQIxzv1LZJzomW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PExbmaJQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712503981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+yTit1pd4N1JfLmD2IuXDJZJ+5rq1l/Jqlj1ws6D198=;
	b=PExbmaJQfrSujKRlI2YfN+zqq3SiBVioD6KcxX/q2WnCZtgRXyV0aakqWf/9MT9EyE/qNN
	NSphJ1ogRd7fYGrLgP+aorlSGFazLp6gLhc9ivhWDvuQtdyF3H1/RRHRYZKRokFEJbq213
	rmoMurg01Y2RBvwzngWd2E9Y9BJ6Lrw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-uMI7lP04PeummEuuF6S-cA-1; Sun, 07 Apr 2024 11:32:59 -0400
X-MC-Unique: uMI7lP04PeummEuuF6S-cA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d87f6e0fd7so6866321fa.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Apr 2024 08:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712503978; x=1713108778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yTit1pd4N1JfLmD2IuXDJZJ+5rq1l/Jqlj1ws6D198=;
        b=WthltfSYWjL8BJQRVAC25HFWTyYMc+HaBXlhdzhheJjfn5WozyyBaKUp2gs8hPGfRG
         UTmbKUo3pl6xmoL3xoKYs/GbYFVkQS/Gfqr7PO1haHW5ZDzWYjoRjNeyWd32nPZViE3z
         eyOZeLSOXqJRPjJjBlftPuWo7aW84melulq/eHYCZtW7n7Sa5o2TOMQGotXfThFhDlMs
         tFoX/i+/gyvi/I+Xj6QK7pBem8RUiShFVyh3WSBQdGZD1GAqN1hxBcJGbSraONuFNS6V
         LXz2qBm3Qj9PrWXSOKoprp6q7CRZMPH8r1nqQiDyQybSJKr59Ja0Oj3ch4DY0KSaule3
         PtwA==
X-Forwarded-Encrypted: i=1; AJvYcCVvLIN+wK9R+t6HliEhSqvZghmyrZ+lMeNrnZUDSd0ven/2gEfiaH4qRNHFZVXH7zgIuyHw157uBmVqY9V9drdObSDEkU/RNwAgodUKZ19iGgCJsA==
X-Gm-Message-State: AOJu0YzrTRZ0KpIjem2+4h94bWEanVQeirGRFoTwH+v0lJaIqMUoDFpg
	oeqDBKK1iO92/yK7GmYyQJtIB4dcugUagU31s+KURGy1x0++VafOVziaMKqwBIuIMSMWnM1Pl1e
	Sga/xHbWoJo5OV2j29UdKAj3WbOrF7Jv+w1YSImSdg73iorVroH0U8yOvZ1K+1jXR3aqE9I4=
X-Received: by 2002:a05:651c:1410:b0:2d8:64c9:8d39 with SMTP id u16-20020a05651c141000b002d864c98d39mr4993399lje.37.1712503977792;
        Sun, 07 Apr 2024 08:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMWHQhwJf/rIOtg4Hzqpz5zr/RJe6xJCgxm7fMsz0EC64H7nX6lYIpXDVkk9VPt3oLIcixCw==
X-Received: by 2002:a05:651c:1410:b0:2d8:64c9:8d39 with SMTP id u16-20020a05651c141000b002d864c98d39mr4993385lje.37.1712503977409;
        Sun, 07 Apr 2024 08:32:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j24-20020a17090643d800b00a51d46c684csm303350ejn.89.2024.04.07.08.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 08:32:56 -0700 (PDT)
Message-ID: <b5d808fd-f9c4-48d5-b888-c4ded4b0cad6@redhat.com>
Date: Sun, 7 Apr 2024 17:32:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: quickstart: Fix race condition when
 reporting input event
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: rafael@kernel.org, linux-acpi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240327214524.123935-1-W_Armin@gmx.de>
 <f662fab0-0f47-4b71-ab71-2b9492253483@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f662fab0-0f47-4b71-ab71-2b9492253483@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/6/24 8:57 PM, Armin Wolf wrote:
> Am 27.03.24 um 22:45 schrieb Armin Wolf:
> 
>> Since commit e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run
>> on all CPUs"), the ACPI core allows multiple notify calls to be active
>> at the same time. This means that two instances of quickstart_notify()
>> running at the same time can mess which each others input sequences.
>>
>> Fix this by protecting the input sequence with a mutex.
>>
>> Compile-tested only.
> 
> Any thoughts on this?

I wonder if we need this at all ?

The input_event() / input_report_key() / input_sync() functions
which underpin sparse_keymap_report_event() all are safe to be called
from multiple threads at the same time AFAIK.

The only thing which can then still go "wrong" if we have
2 sparse_keymap_report_event() functions racing for the same
quickstart button and thus for the same keycode is that we may
end up with:

input_report_key(dev, keycode, 1);
input_report_key(dev, keycode, 1); /* This is a no-op */
input_sync(); /* + another input_sync() somewhere which is a no-op */
input_report_key(dev, keycode, 0);
input_report_key(dev, keycode, 0); /* This is a no-op */
input_sync(); /* + another input_sync() somewhere which is a no-op */

IOW if 2 racing notifiers hit the perfect race conditions then
only 1 key press is reported, instead of 2 which seems like
it is not a problem since arguably if the same event gets
reported twice at the exact same time it probably really
is only a single button press.

Also I think it is highly unlikely we will actually see
2 notifiers for this racing in practice.

So I don't think we need this at all. But if others feel strongly
about adding this I can still merge it... ?

Regards,

Hans





>> Fixes: afd66f2a739e ("platform/x86: Add ACPI quickstart button (PNP0C32) driver")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> This applies on the branch "review-hans". Maybe we could somehow
>> document the concurrency rules for ACPI notify handlers?
>> ---
>>   drivers/platform/x86/quickstart.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/platform/x86/quickstart.c b/drivers/platform/x86/quickstart.c
>> index ba3a7a25dda7..e40f852d42c1 100644
>> --- a/drivers/platform/x86/quickstart.c
>> +++ b/drivers/platform/x86/quickstart.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/input/sparse-keymap.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>> +#include <linux/mutex.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/types.h>
>> @@ -35,6 +36,7 @@
>>
>>   struct quickstart_data {
>>       struct device *dev;
>> +    struct mutex input_lock;    /* Protects input sequence during notify */
>>       struct input_dev *input_device;
>>       char input_name[32];
>>       char phys[32];
>> @@ -73,7 +75,10 @@ static void quickstart_notify(acpi_handle handle, u32 event, void *context)
>>
>>       switch (event) {
>>       case QUICKSTART_EVENT_RUNTIME:
>> +        mutex_lock(&data->input_lock);
>>           sparse_keymap_report_event(data->input_device, 0x1, 1, true);
>> +        mutex_unlock(&data->input_lock);
>> +
>>           acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(data->dev), event, 0);
>>           break;
>>       default:
>> @@ -147,6 +152,13 @@ static void quickstart_notify_remove(void *context)
>>       acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, quickstart_notify);
>>   }
>>
>> +static void quickstart_mutex_destroy(void *data)
>> +{
>> +    struct mutex *lock = data;
>> +
>> +    mutex_destroy(lock);
>> +}
>> +
>>   static int quickstart_probe(struct platform_device *pdev)
>>   {
>>       struct quickstart_data *data;
>> @@ -165,6 +177,11 @@ static int quickstart_probe(struct platform_device *pdev)
>>       data->dev = &pdev->dev;
>>       dev_set_drvdata(&pdev->dev, data);
>>
>> +    mutex_init(&data->input_lock);
>> +    ret = devm_add_action_or_reset(&pdev->dev, quickstart_mutex_destroy, &data->input_lock);
>> +    if (ret < 0)
>> +        return ret;
>> +
>>       /* We have to initialize the device wakeup before evaluating GHID because
>>        * doing so will notify the device if the button was used to wake the machine
>>        * from S5.
>> -- 
>> 2.39.2
>>
>>
> 



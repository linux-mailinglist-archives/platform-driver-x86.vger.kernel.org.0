Return-Path: <platform-driver-x86+bounces-8889-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0545CA17A08
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jan 2025 10:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F4C51889C81
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jan 2025 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7D91BD519;
	Tue, 21 Jan 2025 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TKM/Zg26"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267A91C173F
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451163; cv=none; b=Iq8rCntyjLP9E8OnOSOdQ6n3xLuHef8iArIc2Ve+me2SGFbPId7ZtA0265QKGx3xm/QE0+3J3bPPS8DkFORBevtLq+dSY+vWKClItgT1e4N4lIz0e12tWCt4uWoZHTtpyr4jyNPKX6nKc8xQzFAOfI57wRFLqUXlnzq5VMh5ndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451163; c=relaxed/simple;
	bh=edxjRAk3M92dy8cJN7yesjZBgm7kq/CNM2wmK7N3Uds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXgh8fO6ORMjHSFP+juFeSaxVBlCeEbTeLOrPW9CZ7/snvwWvOSXIirKogUC/eIubebE+KQyMf6JicwGoq1BDgl9y9QhDuedMsHnUKVeZLvujq5h7sE6dtAWgjngbBP406berpb4AAOfZ6WgvL5aMc6UMkB8Z+WG3l6D2FWCfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TKM/Zg26; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737451159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQyIqLWCZrc9SK4qgS5xqKiBf4YVAHyPsAhRyVoSX0o=;
	b=TKM/Zg26YORvmEPbJ7fIEvCAxrX8KWQD9WPIPCIJZn836UcZnpVb85qTXx0nLqyqqE6dua
	U17ZTjD91Jz15a6twues3qLP998w9NyNefFLUm4JLZkVkYsfS1TsaGUAJ2gtIQSPwkHcso
	RdKAk1oVqvlbeP8wuYbww8RXEPWcEHY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-U2yw1f3SO5SrUkXe928JcA-1; Tue, 21 Jan 2025 04:19:18 -0500
X-MC-Unique: U2yw1f3SO5SrUkXe928JcA-1
X-Mimecast-MFC-AGG-ID: U2yw1f3SO5SrUkXe928JcA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6704ffcaeso543646666b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 01:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451157; x=1738055957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQyIqLWCZrc9SK4qgS5xqKiBf4YVAHyPsAhRyVoSX0o=;
        b=Js4LV7aLw4HLjOrteyHf4gCSBMmuAqB/N4nt3FEMg+VVZeEgnUVeqCJsn1dwZ2Iz8F
         aAbhRN4eid+Pr0o1uSKnMMkRIUQqDRzviFKEeuO9PN3EmOg8dqGAzb7h4wy5ZbCHX97Y
         tZyQqwzWBUW297V6HCJQgdZaK7V7blm4GW0t7T6Rdkn44XFqB9EPFvkh7IwBnD/Wyplw
         hu/GpVtZUlWRSi76X3e5Rmkup+Pr/Ab+VdX/dSa+ksbYGI+UsAPmbkJQX6kg8cCSdADy
         9Ispo1Jrvl9qX0+37TMk7D/VHz2mYoDISCzpauvg7H8e3A19cRFTbEpqzPWyP/XxCIc/
         SGAg==
X-Forwarded-Encrypted: i=1; AJvYcCWrxoN9uF0RLzJ8KPcLD5SsrUFWuNA8avEvzVFNvl1iZ6kFry5mzjOx0FdYYfpdlLP5Ku+yOCWknH8I5vm04ohFpWiF@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfAVSkH8E+kuMVgIlplWmwWnLICXe/oKSIKnuiM12oOIGumBP
	GSAgmnarFHr3qMNzblQzHR9rqAtP2kg/DvL/AdocvtaKEm5d5EiOUxXE0mKL8MQ/FPYKFxRQcbQ
	USQDcIXiqfqK12ab5Vhj+/I8pMYIoSyBrDmdisvFpbCd3BBCrVztfhjzWS5ShXs5zVh9Sdic=
X-Gm-Gg: ASbGncuz0nyYJjpxt4NefUOhVfYEbts5wSUuYYgbXqglkOYbr/zgY6L6cUnImv1BtTv
	nkYOfv6HUDTU1hywjgHqLinFL6LmtVcqO+84TNYRQDEoRGmJ7U5YbIkG/4oEwekffq/JmyG64nc
	TP++WzwvRuzIDo9mxZW2lIVRK/BkAIdTb/mc/C2izWSxqXtE/jOSEwR7cQzQjiXn2insvnL5QGq
	HEXH5GBYygFuILGcvFjMtocum+rTbmY+mSJzYOXyKfSzC8fmeMQlYvxJxFf1PAjUcH3EkhaL52b
	lcfgt2TUSS/xZq6az5hAlaG3+blZyHvTuGtVE+sVF3jpqmWGOm26uU2lbu8zvsLanw+4strARR+
	5lA1QD3Vk5dvTz7DLk3HurenpZdwgAITFmYO3XKfgGR1J
X-Received: by 2002:a05:6402:5108:b0:5db:69ee:9179 with SMTP id 4fb4d7f45d1cf-5db7db08402mr14068630a12.31.1737451156625;
        Tue, 21 Jan 2025 01:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKOWAJUa//KxHikj+d5bqLtTAX5UcJICMwesgB+Tn0Ia0zcTEC2E7d4VrDwp1TdWIMxKe1Cg==
X-Received: by 2002:a05:6402:5108:b0:5db:69ee:9179 with SMTP id 4fb4d7f45d1cf-5db7db08402mr14068608a12.31.1737451156224;
        Tue, 21 Jan 2025 01:19:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db8942cad4sm5677052a12.60.2025.01.21.01.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:19:15 -0800 (PST)
Message-ID: <3836db8d-86f5-4b77-898f-b8361b83afe4@redhat.com>
Date: Tue, 21 Jan 2025 10:19:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
 hverkuil@xs4all.nl
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
 <06b5f424-52a5-4397-9d37-cbb628b98bb8@redhat.com>
 <Z45b03w7EV37yBeS@kekkonen.localdomain>
 <20dddcb7-2a5f-4af9-8169-4934aa91f55e@redhat.com>
 <Z49V5CqEt6H96LvJ@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z49V5CqEt6H96LvJ@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Saikari,

On 21-Jan-25 9:08 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Jan 20, 2025 at 04:08:45PM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 20-Jan-25 3:21 PM, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Mon, Jan 20, 2025 at 02:39:39PM +0100, Hans de Goede wrote:
>>>> Hi Sakari,
>>>>
>>>> On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
>>>>> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
>>>>> documentation) but the int3472 indiscriminately provides this as a "reset"
>>>>> GPIO to sensor drivers. Take this into account by assigning it as "enable"
>>>>> with active high polarity for INT347E devices, i.e. ov7251.
>>>>>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>
>>>> Sorry but no this won't fly. If we go this route the amount of
>>>> quirk code in the int3472 driver is going to get out of control.
>>>>
>>>> Since you are matching this mapping on the sensor-type, this
>>>> should be handled in sensor specific code, IOW in the sensor driver.
>>>>
>>>> Also see my reply on the linux-media list here:
>>>>
>>>> https://lore.kernel.org/linux-media/0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com/
>>>>
>>>> Sorry but I have to hard nack this. There has to be some line
>>>> where the pdx86 glue code stops bending over backwards and
>>>> where some of the burden of supporting more then just devicetree
>>>> moves to the sensor drivers.
>>>>
>>>> *especially* since this mapping is going to be different per sensor-driver,
>>>> with there being *no consistency at all* in the GPIO/pin names used in
>>>> the sensor drivers just looking at drivers/media/i2c/ov*.c I see all of:
>>>
>>> I beg you to reconsider as I have to disagree with your assessment, for the
>>> following reasons:
>>>
>>> The "reset" naming used by the int3472 driver comes from the int3472 driver
>>> / Windows specific ACPI amendments, not from the ACPI standard nor sensor
>>> datasheets.
>>
>> Yet looking at the datasheet it is a more correct name then "enable".
> 
> Possibly in this instance, but whether it is or not is still besides the
> point: this may not be the name on the datasheet.
> 
>>
>>> Also in a proper ACPI implementation we wouldn't be dealing
>>> with such GPIOs at all, instead this would simply work through ACPI power
>>> resources.
>>
>> GPIOs being handles as ACPI power-resources is not something which is
>> typically done.
>>
>> This was actually done correct for the atomisp devices, clks and regulators
>> are power-resources there, but the GPIOs are listed as plain ACPI GPIO
>> resources under the sensor ACPI-fwnode. And ACPI GPIO resources do not
>> have a name/label only an index. So drivers which need GPIOs and want 
>> to work on ACPI platforms need an index -> label map, see for example:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix.c#n811
>>
>> note how this is handled in the driver, and is not expected to be
>> handled by some platform specific code.
> 
> The power resources do contain GPIO handling when it is required for
> implementing the device's power on / off sequences. FWIW, on Chromebooks
> this "just works" without the IPU bridge and without .
> 
>>
>>> There generally isn't a single datasheet name used for such signals across
>>> sensor vendors (or even sensors from a single vendor). Thus the assumption
>>> made in the int3472 driver isn't correct, even if DT bindings were using
>>> the vendor-provided GPIO signal name from datasheets as-is.
>>>
>>> We've done quite a bit of work to make the system firmware (including
>>> design differences or outright bugs) invisible to the drivers elsewhere, I
>>> don't see why we should make an exception here. To add to that, mapping the
>>> GPIO name / function to what the driver expects is trivially done in the
>>> int3472 driver, as this patch shows.
>>
>> IMHO it is not so trivial done, you are assuming a 1:1 mapping for all
>> laptop/tablet models this is not necessarily true. E.g. on atomisp tablets
>> there typically is a standard camera connector with both reset and powerdown
>> signals and the atomisp _DSM equivalent of the INT3472 GPIO map _DSM
>> typically contains both signals. But on sensors with only 1 reset pin
>> it is unclear which of the 2 is actually used. One model camera module
>> with sensor X may connect the sensor's single xshutdown pin to
>> the powerdown signal on the standard camera connector, while another
>> camera module may use the reset signal on the standard connector.
>>
>> There are 2 ways to handle this:
>>
>> 1. Make the driver deal with the fact that there may be 2 GPIOs,
>> treating both as optional and driving both low/high at the same time
>> since only 1 will actually be used. This is somewhat ugly on the driver
>> side, but then fixes things for all tablets/laptops out there using
>> this sensor model.
>>
>> 2. Make this the platform glue's problem and require the platform code
>> to have per laptop/tablet model quirks using DMI matching meaning that
>> instead of things just working OOTB for models not added to the quirk
>> table, we now need users to report an issue and then manually fix
>> that for every model under the sun. Which is very much sub optimal.
> 
> In our case here there's really no difference DMI-wise, is there? In both
> cases the GPIO handling is determined based on the device. Besides, my
> patch is technically better in the sense that it is explicitly using an
> existing firmware interface instead of adding driver support for a firmware
> interface that doesn't exist (neither as a firmware interface definition
> nor an implementation of one).
> 
>>
>> See e.g.:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commit/e43be8f19b5913a2e4bd715e7eef88fd909a2d1d
> 
> I guess we don't have DT bindings for a (virtual) device that would allow
> controlling one or more actual GPIOs using a single virtual one?
> 
>>
>> (which I have not posted upstream yet since I don't have the mt9m114
>> driver working on atomisp models yet)
>>
>> I foresee similar problems with the INT3472 stuff. On Andy's device
>> we need to map reset to enable, but maybe next time it is powerdown ?
>>
>> Multiply these kinda per laptop/tablet model issues by the amount
>> of different sensors which there are and this becomes a big 
>> mess of per-sensor + per-laptop-model quirks in the int3472 code,
>> where as these things can typically be handled reasonable well
>> inside the sensor driver.
> 
> Again, I don't want to add DMI checks in client drivers if that can
> be reasonably handled elsewhere.

Ok, good that was my main concern.

<snip>

As discussed on IRC lets move forward with doing the mapping in the INT3472
as the patch from this thread does.

But I do want to see the mapping code be a bit more generic, I'll reply
to the original patch with a suggestion on how to do that.

Regards,

Hans






Return-Path: <platform-driver-x86+bounces-5223-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985696BD09
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Sep 2024 14:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39FEC1C24994
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Sep 2024 12:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A941D9D8B;
	Wed,  4 Sep 2024 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHchxmr8"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2F1CF7DE
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454313; cv=none; b=daPQXDr+4xb/t6Hde434zR7WFwo5w8y16+sAhfGBpHBJPCeNI8RDRBqVvq81IG2BKTD66A5vVDhEjjemE70nej2CzsESaqmd+J16rmdCKvE7GIjzge4kDkDR4RLxC9/ED26kr1NDMN6KWoZe3Smv80ImThxz8FHTn2CcwdxztZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454313; c=relaxed/simple;
	bh=WNuX0n3FJiUoH/mTBHDbsUS0bfuSmnbhCnuk4qfe1AU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jm9JSrQlbhM64yGz3yw99XJQhZvvtF/h9MPAU4p0ZbLrHQ4BKJLhZ1Y24EtgBiNlU3M8CoXb6MbwX0Lof080yKVMRnJU1Kvz1A1H6ypxSxMMcdVUCu2KsYSJdohp9IqznymucbyEYFGUmXp+vaztJFVSvB82Ii4ANdpmIb6n7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AHchxmr8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725454311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3X8pOqUtJiv5zG4OPBsiZ8/Tpic2hqRLXEUVUhVgGRs=;
	b=AHchxmr8Ul1KT0wbS6MN6E6Z2gacxP/aAiEYGDAPxcAQ68owacbIyORZY4JYA6Z33RZfP1
	b6wFRNOEWJcGk8Lr08pv2yoUPomzczvWSOOA0ZFokfnoUAnPvufUQXxykL4s3ctD65gXcR
	0rptK2rLcRFKOEM9zLVY8FOvy30XXlk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-uKKlB-mVNIurqf7qQ6ZZaQ-1; Wed, 04 Sep 2024 08:51:50 -0400
X-MC-Unique: uKKlB-mVNIurqf7qQ6ZZaQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5344b7df784so7269027e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 05:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725454308; x=1726059108;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3X8pOqUtJiv5zG4OPBsiZ8/Tpic2hqRLXEUVUhVgGRs=;
        b=FT6yDVvDIiK/ONfI006IN9svMOIpvgvYmsJEh725F4+apUdUaWMz11bHltep3RRfsI
         HLT4paOHExNuO81Nyk+4a8rv5tOWvXnalJrGUC8jzSo5F1oIKM2WHZ/yJ14yFPfoXvZA
         1knB9UWGBQNZCwvtkdfGkyzTYvuWBtmf/Jekxu69mb8EBfL3+IDFShOC7btA5VD1Jx/Y
         M8ZBF29Qf0kGiXE8meRLJQX637E0E7/oUepx9SZRBbZ5QpajLBnvo4L5OsL2kS/XxM2s
         ZKWIKXaON8nby8CYsRMR37YeBVAh2lIoSCna8A+z0jGODyMYhWJR804igo2xV3foDvSx
         Vgjg==
X-Forwarded-Encrypted: i=1; AJvYcCXHNvYuanndV32Wuyzg0R8BQvWZpMtohMvPx8JugA+dDjFJ0gI31NlSj565f4B8kyU4FsUKf3Zp5ljSczRT/cVCHKLz@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXsRO2ouGt3YBF9OCHIk/FPWQdyQUHQXCIeXwbbjG7lWKa80S
	Xqn+VciKvIjnpZxNHFtPNp5tgsuKaFHp0qW2hemIsSrfwMb7mpytdKLwuBJj5OlG52D/KYTkkSe
	oMeXxJ4nyjTDQH1RM8RfHxJVFlKdcDm1K+iJrlY+KCDddAGKYIFxGlR6n56HagCPch77PT8c=
X-Received: by 2002:ac2:5693:0:b0:535:699b:b076 with SMTP id 2adb3069b0e04-535699bb121mr1038067e87.16.1725454308342;
        Wed, 04 Sep 2024 05:51:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1+YW1/FOYwtEW0lo8dkaM4Pay57BQtmtXs1fAjyWYUD7wF5jZ7AOBYxr5IMzIW/ZbxjXL5Q==
X-Received: by 2002:ac2:5693:0:b0:535:699b:b076 with SMTP id 2adb3069b0e04-535699bb121mr1038024e87.16.1725454307674;
        Wed, 04 Sep 2024 05:51:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb767sm812633966b.16.2024.09.04.05.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 05:51:47 -0700 (PDT)
Message-ID: <ea76c1a2-826a-42ea-87ec-40b5d0a8f364@redhat.com>
Date: Wed, 4 Sep 2024 14:51:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86:dell-laptop: Add knobs to change
 battery charge settings
From: Hans de Goede <hdegoede@redhat.com>
To: Andres Salomon <dilinger@queued.net>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>,
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pm@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20240820033005.09e03af1@5400>
 <04d48a7c-cad1-4490-bbcd-ceb332c740bd@redhat.com>
 <20240827142408.0748911f@5400>
 <a0bfd438-6d18-4334-aa79-b35aed43f3c7@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <a0bfd438-6d18-4334-aa79-b35aed43f3c7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/27/24 9:04 PM, Hans de Goede wrote:
> Hi,
> 
> On 8/27/24 8:24 PM, Andres Salomon wrote:
>> On Mon, 26 Aug 2024 16:44:35 +0200
>> Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> Hi Andres,
>>>
>>> On 8/20/24 9:30 AM, Andres Salomon wrote:
>> [...]
>>>> +
>>>> +static ssize_t charge_type_show(struct device *dev,
>>>> +		struct device_attribute *attr,
>>>> +		char *buf)
>>>> +{
>>>> +	ssize_t count = 0;
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
>>>> +		bool active;
>>>> +
>>>> +		if (!(battery_supported_modes & BIT(i)))
>>>> +			continue;
>>>> +
>>>> +		active = dell_battery_mode_is_active(battery_modes[i].token);
>>>> +		count += sysfs_emit_at(buf, count, active ? "[%s] " : "%s ",
>>>> +				battery_modes[i].label);
>>>> +	}  
>>>
>>> If you look at the way how charge_type is shown by the power_supply_sysfs.c
>>> file which is used for power-supply drivers which directly register
>>> a power-supply themselves rather then extending an existing driver, this
>>> is not the correct format.
>>>
>>> drivers/power/supply/power_supply_sysfs.c
>>>
>>> lists charge_type as:
>>>
>>>         POWER_SUPPLY_ENUM_ATTR(CHARGE_TYPE),
>>>
>>> and ENUM type properties use the following for show() :
>>>
>>> 	default:
>>> 		if (ps_attr->text_values_len > 0 &&
>>> 				value.intval < ps_attr->text_values_len && value.intval >= 0) {
>>> 			ret = sysfs_emit(buf, "%s\n", ps_attr->text_values[value.intval]);
>>> 		} else {
>>> 			ret = sysfs_emit(buf, "%d\n", value.intval);
>>> 		}
>>> 	}
>>>
>>> with in this case text_values pointing to:
>>>
>>> static const char * const POWER_SUPPLY_CHARGE_TYPE_TEXT[] = {
>>> 	[POWER_SUPPLY_CHARGE_TYPE_UNKNOWN]	= "Unknown",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_NONE]		= "N/A",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_TRICKLE]	= "Trickle",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_FAST]		= "Fast",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_STANDARD]	= "Standard",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_ADAPTIVE]	= "Adaptive",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_CUSTOM]	= "Custom",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_LONGLIFE]	= "Long Life",
>>> 	[POWER_SUPPLY_CHARGE_TYPE_BYPASS]	= "Bypass",
>>> };
>>>
>>> So value.intval will be within the expected range hitting:
>>>
>>> 			ret = sysfs_emit(buf, "%s\n", ps_attr->text_values[value.intval]);
>>>
>>> IOW instead of outputting something like this:
>>>
>>> Fast [Standard] Long Life
>>>
>>> which is what your show() function does it outputs only
>>> the active value as a string, e.g.:
>>>
>>> Standard
>>>
>>> Yes not being able to see the supported values is annoying I actually
>>> wrote an email about that earlier today:
>>>
>>> https://lore.kernel.org/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db@redhat.com/
>>>
>>> but we need to make sure that the output is consistent between drivers otherwise
>>> userspace can never know how to use the API, so for charge_type the dell
>>> driver should only output the active type, not all the options.
>>
>> So should I just wait to make any changes until you hear back in that
>> thread?
> 
> Yes that might be best.
> 
>> I'm not overly excited about changing it to use the current
>> charge_type API, given that the only way to get a list of modes that the
>> hardware supports is to try setting them all and seeing what fails.
>>
>> I suppose another option is to rename it to charge_types in the dell
>> driver under the assumption that your proposed charge_types API (or
>> something like it) will be added..
> 
> Right, if we get a favorable reaction to my charge_types suggestion
> then we can go ahead with the dell-laptop changes using charge_types
> instead of charge_type. I was already thinking along those lines
> myself too.
> 
> So if my RFC gets a favorable response lets do that.
> 
> In that case you don't even need to send a new version just
> renaming charge_type to charge_types is something which I can do
> while merging this.

Sebastian has acked the charge_types support. So I've done
s/charge_type/charge_types/ support and merged this.

Note that once charge_types get added to the power-supply
core (I hope to post patches for this soon-ish), then there
will be a power_supply_charge_types_show() helper which
will replace most of the body of charge_types_show() to make
sure that the output does not change when switching to this helper
I have changed the order of battery_modes:

--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -107,9 +107,9 @@ struct battery_mode_info {
 };
 
 static const struct battery_mode_info battery_modes[] = {
-	{ BAT_STANDARD_MODE_TOKEN, "Standard" },
-	{ BAT_EXPRESS_MODE_TOKEN,  "Fast" },
 	{ BAT_PRI_AC_MODE_TOKEN,   "Trickle" },
+	{ BAT_EXPRESS_MODE_TOKEN,  "Fast" },
+	{ BAT_STANDARD_MODE_TOKEN, "Standard" },
 	{ BAT_ADAPTIVE_MODE_TOKEN, "Adaptive" },
 	{ BAT_CUSTOM_MODE_TOKEN,   "Custom" },
 };

Now it matches the order of the POWER_SUPPLY_CHARGE_TYPE_* values
in include/linux/power_supply.h and the future
power_supply_charge_types_show() helper will show the (available)
strings in that order.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


Regards,

Hans




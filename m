Return-Path: <platform-driver-x86+bounces-5082-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81889617A6
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Aug 2024 21:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA81283F33
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Aug 2024 19:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92041D1F62;
	Tue, 27 Aug 2024 19:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rc7lDfwV"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D875132132
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724785469; cv=none; b=WA/pKvgjD57pMjQ5qLnWmsSPzFACWCYMVjlLrDbIsNXrvOq46igmtuVXzK/EdUGpaEkqPRb85g/r61UBgR5beDYUzHZUQEY/1xHUq4bz8wZleUfBKGC62Uk3RAJ0ShtQ2q959Efu1no/aQfbyTeN/8qqNrbM5hk8XdQs3zS/W7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724785469; c=relaxed/simple;
	bh=xB+tRyst4h/JkZ6zWo+HspsZwigVOpyOfVR2Meo+9zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2eb5FSvo2VhAs+dORS0t275Q7Mlxcs5oKwTzgLMyCyUauJnBi27tAGJQttRszHnTSXPXAu2q8j1I5DF2SfLwNAcuvumZ2RWmpw89t2a4EQfg/xhbsyafnsbOhdmPGlyAS+X9XklD6RpgEf9e9hGYX26/LnQ5sBrv1ubJJWPsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rc7lDfwV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724785467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkWCAaDqu2XZmQMkoLU93xiUV6PoV/L38xqUed5LNOs=;
	b=Rc7lDfwVzsorJE09Qk1cS7SyIaq1uj+9SRvPn9f87ktl4pCXM5WfB2tmIgp1p+HBMAtO6o
	swbQwfkIXbE8V1P6wjUwUA4hUpJzzdXFUzpk9t7SV2FjFLJhzyYOz5lB6V4qHi8jzmXxaG
	iCqnHNhQGM+x+7C+n5nmHbvqXuZvWxA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-nKLaJrMvM--lejc_5h4AOA-1; Tue, 27 Aug 2024 15:04:24 -0400
X-MC-Unique: nKLaJrMvM--lejc_5h4AOA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37493941575so226693f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 12:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724785463; x=1725390263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkWCAaDqu2XZmQMkoLU93xiUV6PoV/L38xqUed5LNOs=;
        b=Mn3HjgFdetJEJRp/MSpi5J3XDcSvpY5qEBolAexD7l0DD/3NKWii74myKKf+HFl1rS
         ANlqldBtD29ZzP2c6ErVLo2jWp2jgfIruGxXz37fDuxYS0sSvJm351KvqCv7ovAvL8lq
         4dIGDsx1RuBmY0fgjKsfO6/cwnBG4ot1gl7jaBLR2mLnS/KKp12g+BKzYm0fyA3IhLOA
         1fLCfczYJ2w+AGaRAs9yValOo6aC0FC9sjz6RDwGgMxmGNJSAiei/4atK0ltrtCwaTBb
         +L00GSBcUs6LLewKJ9RzCxmKWdntR3TplI2HqyvJHJrGVmmWY+uR1CIeStKjSIjpbXnq
         ja3A==
X-Forwarded-Encrypted: i=1; AJvYcCW0BzfeCmL0iQ2D12pR5p8LLnt0otolvr5eZYaaUaTJH4UC2lcwqIqvd/n6YhF9LoMHTGqP3wf7Fd6/BwvFaPZiYTSO@vger.kernel.org
X-Gm-Message-State: AOJu0YyBycGe7JCYpMuSRb8T/CWSQ8cPjj2cP++LwEW1gLFdYIkWZuwz
	mmrhnYPp7Czl8LbOD3KkS5jllca52vWjftDEsstQHhAAlWG4GkJwTqIpsGp3GypAhWj5TWrbOV6
	1ERXROabHO/yJ7tc+O/F/Za2PskSxK8rSkfFTukIMDRYnwB5V1EDrPsxpZSAG4U54p9B6EIA=
X-Received: by 2002:a05:6000:400f:b0:371:8f19:bff5 with SMTP id ffacd0b85a97d-37311857877mr11933155f8f.3.1724785463436;
        Tue, 27 Aug 2024 12:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1i/xHwfH62KeEf74CXSi1HrJpaaxieMRJplttOqZqnN5NHZ0E2WbImpYcSF+/j2WB6c89uQ==
X-Received: by 2002:a05:6000:400f:b0:371:8f19:bff5 with SMTP id ffacd0b85a97d-37311857877mr11933128f8f.3.1724785462851;
        Tue, 27 Aug 2024 12:04:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb20a5a4sm1305368a12.42.2024.08.27.12.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 12:04:22 -0700 (PDT)
Message-ID: <a0bfd438-6d18-4334-aa79-b35aed43f3c7@redhat.com>
Date: Tue, 27 Aug 2024 21:04:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86:dell-laptop: Add knobs to change
 battery charge settings
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240827142408.0748911f@5400>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/27/24 8:24 PM, Andres Salomon wrote:
> On Mon, 26 Aug 2024 16:44:35 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi Andres,
>>
>> On 8/20/24 9:30 AM, Andres Salomon wrote:
> [...]
>>> +
>>> +static ssize_t charge_type_show(struct device *dev,
>>> +		struct device_attribute *attr,
>>> +		char *buf)
>>> +{
>>> +	ssize_t count = 0;
>>> +	int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
>>> +		bool active;
>>> +
>>> +		if (!(battery_supported_modes & BIT(i)))
>>> +			continue;
>>> +
>>> +		active = dell_battery_mode_is_active(battery_modes[i].token);
>>> +		count += sysfs_emit_at(buf, count, active ? "[%s] " : "%s ",
>>> +				battery_modes[i].label);
>>> +	}  
>>
>> If you look at the way how charge_type is shown by the power_supply_sysfs.c
>> file which is used for power-supply drivers which directly register
>> a power-supply themselves rather then extending an existing driver, this
>> is not the correct format.
>>
>> drivers/power/supply/power_supply_sysfs.c
>>
>> lists charge_type as:
>>
>>         POWER_SUPPLY_ENUM_ATTR(CHARGE_TYPE),
>>
>> and ENUM type properties use the following for show() :
>>
>> 	default:
>> 		if (ps_attr->text_values_len > 0 &&
>> 				value.intval < ps_attr->text_values_len && value.intval >= 0) {
>> 			ret = sysfs_emit(buf, "%s\n", ps_attr->text_values[value.intval]);
>> 		} else {
>> 			ret = sysfs_emit(buf, "%d\n", value.intval);
>> 		}
>> 	}
>>
>> with in this case text_values pointing to:
>>
>> static const char * const POWER_SUPPLY_CHARGE_TYPE_TEXT[] = {
>> 	[POWER_SUPPLY_CHARGE_TYPE_UNKNOWN]	= "Unknown",
>> 	[POWER_SUPPLY_CHARGE_TYPE_NONE]		= "N/A",
>> 	[POWER_SUPPLY_CHARGE_TYPE_TRICKLE]	= "Trickle",
>> 	[POWER_SUPPLY_CHARGE_TYPE_FAST]		= "Fast",
>> 	[POWER_SUPPLY_CHARGE_TYPE_STANDARD]	= "Standard",
>> 	[POWER_SUPPLY_CHARGE_TYPE_ADAPTIVE]	= "Adaptive",
>> 	[POWER_SUPPLY_CHARGE_TYPE_CUSTOM]	= "Custom",
>> 	[POWER_SUPPLY_CHARGE_TYPE_LONGLIFE]	= "Long Life",
>> 	[POWER_SUPPLY_CHARGE_TYPE_BYPASS]	= "Bypass",
>> };
>>
>> So value.intval will be within the expected range hitting:
>>
>> 			ret = sysfs_emit(buf, "%s\n", ps_attr->text_values[value.intval]);
>>
>> IOW instead of outputting something like this:
>>
>> Fast [Standard] Long Life
>>
>> which is what your show() function does it outputs only
>> the active value as a string, e.g.:
>>
>> Standard
>>
>> Yes not being able to see the supported values is annoying I actually
>> wrote an email about that earlier today:
>>
>> https://lore.kernel.org/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db@redhat.com/
>>
>> but we need to make sure that the output is consistent between drivers otherwise
>> userspace can never know how to use the API, so for charge_type the dell
>> driver should only output the active type, not all the options.
> 
> So should I just wait to make any changes until you hear back in that
> thread?

Yes that might be best.

> I'm not overly excited about changing it to use the current
> charge_type API, given that the only way to get a list of modes that the
> hardware supports is to try setting them all and seeing what fails.
> 
> I suppose another option is to rename it to charge_types in the dell
> driver under the assumption that your proposed charge_types API (or
> something like it) will be added..

Right, if we get a favorable reaction to my charge_types suggestion
then we can go ahead with the dell-laptop changes using charge_types
instead of charge_type. I was already thinking along those lines
myself too.

So if my RFC gets a favorable response lets do that.

In that case you don't even need to send a new version just
renaming charge_type to charge_types is something which I can do
while merging this.

>> This reminds me that there was a patch-series to allow battery extension drivers
>> like this one to actually use the power-supply core code for show()/store()
>> Thomas IIRC that series was done by you ?  What is the status of that ?
>>
>> Also looking at the userspace API parts of this again I wonder
>> if mapping  BAT_PRI_AC_MODE_TOKEN -> "Trickle" is the right thing do
>> maybe "Long Life" would be a better match ?  That depends on what the option
>> actually does under the hood I guess. Is this known ?
>>
> 
> I originally thought to use Long Life rather than Trickle. We discussed
> it here:
> 
> https://lore.kernel.org/linux-pm/5cfe4c42-a003-4668-8c3a-f18fb6b7fba6@gmx.de/
> 
> Based on the existing documentation and the fact that the wilco driver
> already mapped it, it was decided to stick with the existing precedent
> of using Trickle.

Ok, I was just wondering if this was discussed already, since it was
lets stick with "Trickle".

> That said, Armin at first suggested creating a new "Primarily AC" entry.
> That's personally my favorite option, though I understand if we don't
> have to have 50 CHARGE_TYPE entries that just slightly different
> variations. :)

Right.

Regards,

Hans





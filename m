Return-Path: <platform-driver-x86+bounces-1582-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 015DB867389
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 12:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17E2AB3926C
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 11:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED0C219FD;
	Mon, 26 Feb 2024 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UyUmWxsZ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F71F608
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708945155; cv=none; b=gTBizuADZK6Eb3SuoVulDza+vijFruz0Ixzy6UJp3NkRZWVf4AFOPG3Ag6W9fl6iQqjPZemRgeSpoCATx35iCFU9GJn1hnYGqgBNHaAALfLo4zeEJ9YTLhbb4OMWFM+6o4ttTflBPTUp4bxhEEIK9bxLEPqm1m0gg8pfHdg3lA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708945155; c=relaxed/simple;
	bh=Hm4zAdQ4GDiOUyZuyai9dxp0y9ODMI0oisWl9PvStsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lntMXxi7luwpZGkPVUGbaJq/jReSUJK477u2Txzayyzzk5QKS+CGvxP+wqhS2IG/2bvKgfEzHib50d1E4I4MtTCNcUM1dKrF1642Fck0DbkVfAazP42YG9/aPK4yKpTr82UnaaQa4UDtaUr16Us+7EwfYnYRYhJC4HNobuolWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UyUmWxsZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708945151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLwmtbKMH5gchD1DVzVsDxkSCGg6eb5ZnmDAF0IJ7vw=;
	b=UyUmWxsZ1Lax64Fv55OsvJWuDeFyIxZ9Jvv8lxzMaTQPiuGqKY2MYPfDvUcvGQuLpsyqxC
	vEyenTIyQ0eoXIsp0MB81N3jD67qsKI05AdYWk7wXpVLoWdSu5iC82gGLVlX0n27PbtPvN
	Y9eMH/oeXUKrUeMnxxtjwkAL52ualXs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-CFychVWJNeqNtNpf26bKDQ-1; Mon, 26 Feb 2024 05:59:10 -0500
X-MC-Unique: CFychVWJNeqNtNpf26bKDQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a3fa99aa548so155137266b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 02:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945149; x=1709549949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLwmtbKMH5gchD1DVzVsDxkSCGg6eb5ZnmDAF0IJ7vw=;
        b=Ahc97AhGelKTx+Fho22I1KFNE9Lr2fDKJOSL4T5F+xtrRZS4FV2zOj3MY2dhHFfnZL
         cTq+xkLPxJ9QUrQ6tTpjIWqOFXwtrob29nfMo1BKiiEdkd1WpGWJAt3+fIhjc465hp8m
         bS4SBdk+mZAEZwFrxJe3ifiAZ77/2EhXaxR+1a+lotw01urVp7kfJLl/GxoJWEV2/QO9
         WNgzI2YjY2pAqEIOsZ+JBCbSvu7gW77gjaMWtIpkCtCaD62A5n/GuJFDG6bjpTuK+PJM
         aLUWKPy0jJZTr5g9n8zIw9LdbE5DbwISOP6iLi0abicfqASOS+MKpfXuLQ3UmxJRhTZS
         UzsA==
X-Forwarded-Encrypted: i=1; AJvYcCWGecTUiLgA6mrbeBIzZzKF8AEzBTJRPsk2Srw1pHPqaoDybcbSvYMK9qkxtrfdS4nvf9AM2dOX0elsFXrsOSEnlDrBYPdbuZHI2PmhWP2/TcsvZQ==
X-Gm-Message-State: AOJu0Yytz2RXf3kqOcDAKPQUuaUEtpAmzyUwSNkEPHD+Sgv+kHNsNOq9
	ucE5hEHOO2cw5RTr+8X1CDEXl6QD9+XzxJ7BSahySiOScLkiu74jeroTlWZEhpQYyzIpUa3RyHC
	4fjkJK2XFXVj8SKqKgbATZGect4xbWGhKiCEvCq0Y9eIqWWJXAetK/Bwxf3P29DHYamh6cyA=
X-Received: by 2002:a17:906:3397:b0:a3f:d797:e6e2 with SMTP id v23-20020a170906339700b00a3fd797e6e2mr4111291eja.28.1708945149014;
        Mon, 26 Feb 2024 02:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbVwLt4Av7nV0P9ftMnJykmqz01tHlbTHcunaAafulySeFvYABGEE8KC9dLJAXOuFSaKVfLQ==
X-Received: by 2002:a17:906:3397:b0:a3f:d797:e6e2 with SMTP id v23-20020a170906339700b00a3fd797e6e2mr4111285eja.28.1708945148658;
        Mon, 26 Feb 2024 02:59:08 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id wb5-20020a170907d50500b00a3e48782f08sm2322285ejc.27.2024.02.26.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 02:59:08 -0800 (PST)
Message-ID: <edec3bee-8604-49a9-8e2f-6c21e852ef6c@redhat.com>
Date: Mon, 26 Feb 2024 11:59:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] power: supply: Add Acer Aspire 1 embedded
 controller driver
Content-Language: en-US
To: Nikita Travkin <nikita@trvn.ru>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20240220-aspire1-ec-v3-0-02cb139a4931@trvn.ru>
 <20240220-aspire1-ec-v3-2-02cb139a4931@trvn.ru>
 <qoidm5wujjbeoc2hlraky26wuwmuaxi2atyl6ehovhvffdbfeh@g5gunqdei45m>
 <7c429d2110dbac68d0c82c8fb8bfb742@trvn.ru>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7c429d2110dbac68d0c82c8fb8bfb742@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

+Ilpo (fellow pdx86 maintainer)

On 2/23/24 15:32, Nikita Travkin wrote:
> Sebastian Reichel писал(а) 22.02.2024 04:41:
>> Hi,
>>
>> On Tue, Feb 20, 2024 at 04:57:13PM +0500, Nikita Travkin wrote:
>>> Acer Aspire 1 is a Snapdragon 7c based laptop. It uses an embedded
>>> controller to control the charging and battery management, as well as to
>>> perform a set of misc functions.
>>>
>>> Unfortunately, while all this functionality is implemented in ACPI, it's
>>> currently not possible to use ACPI to boot Linux on such Qualcomm
>>> devices. To allow Linux to still support the features provided by EC,
>>> this driver reimplments the relevant ACPI parts. This allows us to boot
>>> the laptop with Device Tree and retain all the features.
>>>
>>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>>> ---
>>>  drivers/power/supply/Kconfig           |  14 +
>>>  drivers/power/supply/Makefile          |   1 +
>>>  drivers/power/supply/acer-aspire1-ec.c | 453 +++++++++++++++++++++++++++++++++
>>
>> I think this belongs into drivers/platform, as it handles all bits of
>> the EC.
>>
> 
> Hm, I initially submitted it to power/supply following the c630 driver,
> but I think you're right... Though I'm not sure where in platform/ I'd
> put this driver... (+CC Hans)
> 
> Seems like most of the things live in platform/x86 but there is no i.e.
> platform/arm64...
> 
> Hans, (as a maintainer for most things in platform/) what do you think
> would be the best place to put this (and at least two more I'd expect)
> driver in inside platform/? And can we handle it through the
> platform-driver-x86 list?

I guess that adding a drivers/platform/aarch64 map for this makes
sense, with some comments in the Makefile and in the Kconfig
help explaining that this is for PC/laptop style EC drivers,
which combine multiple logical functions in one, only!

Assuming that we are only going to use this for such EC drivers,
using the platform-driver-x86 mailinglist for this makes sense
since that is where are the people are with knowledge of e.g.
userspace APIs for various typical EC functionalities.

It might even make sense to also use:

git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git

As git tree for this and send pull-reqs to Linus for this
together with the other pdx86 for the same reasons.

I would be open to that as long as this is strictly limited to
EC (like) drivers.

Ilpo, what do you think about this ?

Regards,

Hans








> 
>> [...]
>>
>>>  3 files changed, 468 insertions(+)
>>>
>>> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
>>> index 3e31375491d5..e91a3acecb41 100644
>>> --- a/drivers/power/supply/Kconfig
>>> +++ b/drivers/power/supply/Kconfig
>>> @@ -985,4 +985,18 @@ config FUEL_GAUGE_MM8013
>>>  	  the state of charge, temperature, cycle count, actual and design
>>>  	  capacity, etc.
>>>
>>> +config EC_ACER_ASPIRE1
>>> +	tristate "Acer Aspire 1 Emedded Controller driver"
>>> +	depends on I2C
>>> +	depends on DRM
>>> +	help
>>> +	  Say Y here to enable the EC driver for the (Snapdragon-based)
>>> +	  Acer Aspire 1 laptop. The EC handles battery and charging
>>> +	  monitoring as well as some misc functions like the lid sensor
>>> +	  and USB Type-C DP HPD events.
>>> +
>>> +	  This driver provides battery and AC status support for the mentioned
>>
>> I did not see any AC status bits?
>>
> 
> I was referring to whatever ACPI spec calls "AC Adapter" but I guess
> I should have used the word "charger" instead... Will reword this.
> 
>>> [...]
>>
>>> +	case POWER_SUPPLY_PROP_PRESENT:
>>> +		val->intval = 1;
>>
>> You have an unused ASPIRE_EC_FG_FLAG_PRESENT, that looks like it
>> should be used here?
>>
> 
> Oh, you're right! I think I initially didn't have this property and
> added it like this as a reaction to that upower change that made it
> consider everything not explicitly present as absent.
> 
> I've just checked what is reported after unplugging the battery and
> seems like the flag (as well as everything else) is gone. Will change
> the driver to read the flag.
> 
> Thanks for your review!
> Nikita
> 
>>> [...]
>>
>> Otherwise the power-supply bits LGTM.
>>
>> -- Sebastian
> 



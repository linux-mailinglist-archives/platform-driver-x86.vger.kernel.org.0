Return-Path: <platform-driver-x86+bounces-7044-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FA9CFE00
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Nov 2024 11:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D99DB25811
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Nov 2024 10:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7F2195985;
	Sat, 16 Nov 2024 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eETbitS/"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B265192B66
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731752388; cv=none; b=d2LYYYROHFiimJEGVtsHTMnjIM2Kybhi+FDkEs3cJ45z/Iafglme7W+8kYHpRRmPl1pMCd/qt/2n5OWz0Njr9Gf7ic/WxfBBRs56dzgnmdiGQOOp2aH8UvQRPkPjw13VcFM30VnLpwtBT+aRxs6zi4OMID0L1rGmIuoJVIZMQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731752388; c=relaxed/simple;
	bh=155rhqr7XLzve9/FskpD3WhgHhyLQKZPy/lTqrGp814=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZiqzFLfLlxqB7b53BWE8PfFYGypKw8/TGCVGRh3k1GCXDe9dsGSEDJJWT0OWkz5U/Q1FaibgHeCNbMJ/oeLo4MsNgNRpvsCM87kA5FsCoGApkbNLr7Ws9kbYZOufQqLANjnx9P6IRVwEjtN5DBtTbLyoDhSDiqv2CFnSgUwFezo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eETbitS/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731752385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L58QNmS9U1mSIRGldmNS3n20moz35zRigIliARK22xI=;
	b=eETbitS/ZoxNHgSD1A7XrUZ16VmEsiCGRIlvVO9dWQx2r4nSeRCHzDxt2tfNWVr/Qc9cA0
	kq0AFHkeGpXPFmd1YBWjbZ4JhxNSpCSodH8u/0zXLlkQgBvGLedr88dnr+dirJQCChmGPS
	i+bMUdxKPHhQ1vd4KwelSzXTeAWjpK0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-AYmgM1CNP_iudvEIMAJfqQ-1; Sat, 16 Nov 2024 05:19:43 -0500
X-MC-Unique: AYmgM1CNP_iudvEIMAJfqQ-1
X-Mimecast-MFC-AGG-ID: AYmgM1CNP_iudvEIMAJfqQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99ea3e1448so212057266b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 02:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731752382; x=1732357182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L58QNmS9U1mSIRGldmNS3n20moz35zRigIliARK22xI=;
        b=UUwCuehWxM14u2qDZ5iKxsgv1SMBQpsSLxa68BO5IDaHw0UArb2W20V1f2DTHmLtAG
         TWVshzafyhvAOF5ZZCRjVko+wv2Qt2s4zFzL1sHdbHijecqsslemPjRt0ajnviR1b5qS
         8iw3n5DMfKWuMtGL4lKjL4lMsQhnQHfkrf98RmXh+ryVWU7d7d04Sv0/pWN9sawOJD4A
         xS4k8qldgGC+MUWnw4jU/YNtDkZZR2ygP9mrK1HU/cluBct04ORMxYJps+3i0qlpSaUp
         xfl86Cpl9tgT6j4MlM8wyIDdjrQeRIvetGWsSVB4SsACi90d5YawcoU6oqJVA0rXpqeT
         dRdw==
X-Forwarded-Encrypted: i=1; AJvYcCVW6fVp4WRhVBD0Q2K+rhxyBBNLHlQ3hpHSpHywYTrOTU63sGI3ydfdViSylJugT1UB2cXYfs6FnRkWAwIS3+1fRgGn@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQFiP46jVkywcgt63soG+5XW3TDRcUZIuuCTB4q+UPGwHtwJw
	bHFfMmyvbPPGVspn85S6EOzKlzCSeygOSVjYS/1FWB/0L7hkYV7hTDgcZJb1vd8WXY4mqp/extY
	Fx1BBaE8vCDyZwEUDPAOUvvts+DHIt1kg9RstfhfPTN2e2jdS8HaMJGml2Qnaq07XIoltthw=
X-Received: by 2002:a17:906:c112:b0:a9a:9ab:6233 with SMTP id a640c23a62f3a-aa48348249bmr401644566b.34.1731752382592;
        Sat, 16 Nov 2024 02:19:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9CLCRMDQyjONkVf07Rjfh+dyEmr71Yz7nFXP57YCcZajrVB/agzxezlaBfM7I9pcVDLe57g==
X-Received: by 2002:a17:906:c112:b0:a9a:9ab:6233 with SMTP id a640c23a62f3a-aa48348249bmr401643366b.34.1731752382216;
        Sat, 16 Nov 2024 02:19:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df56b08sm286198366b.79.2024.11.16.02.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 02:19:40 -0800 (PST)
Message-ID: <63fb95b2-dab0-445f-a1cf-cf55a35be99e@redhat.com>
Date: Sat, 16 Nov 2024 11:19:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/intel: bytcrc_pwrsrc: Optionally
 register a power_supply dev
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
References: <20241104203555.61104-1-hdegoede@redhat.com>
 <CAHp75Vete6HoHRRef-n2VNTZOawwMeULqH_a-ZD-z-K1iJDiFw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vete6HoHRRef-n2VNTZOawwMeULqH_a-ZD-z-K1iJDiFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5-Nov-24 9:51 AM, Andy Shevchenko wrote:
> On Mon, Nov 4, 2024 at 10:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On some Android tablets with Crystal Cove PMIC the DSDT lacks an ACPI AC
>> device to indicate whether a charger is plugged in or not.
>>
>> Add support for registering a "crystal_cove_pwrsrc" power_supply class
>> device to indicate charger online status. This is made conditional on
>> a "linux,register-pwrsrc-power_supply" boolean device-property to avoid
>> registering a duplicate power_supply class device on devices where this
>> is already handled by an ACPI AC device.
>>
>> Note the "linux,register-pwrsrc-power_supply" property is only used on
>> x86/ACPI (non devicetree) devs and the devicetree-bindings maintainers
>> have requested properties like these to not be added to the devicetree
>> bindings, so the new property is deliberately not added to any bindings.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> ...
> 
> + array_size.h
> 
>> +#include <linux/bits.h>
>>  #include <linux/debugfs.h>
>> +#include <linux/interrupt.h>
>>  #include <linux/mfd/intel_soc_pmic.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/power_supply.h>
>> +#include <linux/property.h>
>>  #include <linux/regmap.h>
> 
> ...
> 
>> +       if (device_property_read_bool(pdev->dev.parent, "linux,register-pwrsrc-power_supply")) {
> 
> Btw, is that property type of boolean? If not,
> device_property_present() has to be used.

Yes this is a boolean property, as for your other remarks I agree
and I'll address them for the upcoming v2.

Regards,

Hans




Return-Path: <platform-driver-x86+bounces-10275-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB90A657A5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 17 Mar 2025 17:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D402189E6CD
	for <lists+platform-driver-x86@lfdr.de>; Mon, 17 Mar 2025 16:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D919048F;
	Mon, 17 Mar 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEhXOilo"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4C188006
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227875; cv=none; b=QJ4u5mK27Vkfh35u2QgNKh3X5dMXlszS+OoBvb/KKXGOTSgppzzMgPxf1bzHUu5KYU9MOs9UtjY52+kR3v2n47s7Ni3xqJ9cqFlDr10mI25EfhSHW6hlrZ7VJpsV6I5gXJ9auA5tdpkaA6L8K8EUvWG7CxSC6Z0hrv2ov69uYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227875; c=relaxed/simple;
	bh=Uoc1DrwhFhqKapvK2aZfs21XdFLHjo6sg1n08s0IZcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFkGAWe6R1eysE/aPAeOJbCXgtWndkGtku9sTwjU/u0RJ3ScKPGCoARJkQ8K8N9rFBUuRAr/K+jo6975ZpdeFfkQAVtv/hcGo81jovjk2HwR16ao70yxANTKsmkTouKROFdYFg8oj9yFPa9f+BCkQdlO3PXor3Wop4SKJFNuvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEhXOilo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742227872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMxOns8OLCANHT+gWoMrsh+8iH9de53W50uJK8mjjKs=;
	b=MEhXOiloO8IjTmd4nrxj3uvjB0In4oqAcr5MZqIO0BRCl/nl5OMyI62AGFJNQkjwI/nH/G
	k/StE3ABLkicKUVSU44tXzX5yvwVf3kjKkJzoGbgPo+dfx+HI2T/VrOMFnXN0oQFznDFhB
	b7Uk38Dt9vGCjb7usRS6GIGRiVUK9WA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-jr2QCUEhOYaWUtQuOb22_g-1; Mon, 17 Mar 2025 12:11:11 -0400
X-MC-Unique: jr2QCUEhOYaWUtQuOb22_g-1
X-Mimecast-MFC-AGG-ID: jr2QCUEhOYaWUtQuOb22_g_1742227870
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac286ad635bso534658966b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 09:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227870; x=1742832670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMxOns8OLCANHT+gWoMrsh+8iH9de53W50uJK8mjjKs=;
        b=c2KQSzY8g4DsaTzzYv2uUY3B7B+yXlh+FKcHxlkaMvIX1yu/C0bidxDzHaXbyCfv5X
         LwQh3919L7y5WOpR01vUaqY9XUygbvw43NrRE+32LwNTsbkGNHd/qWgctnfbK0WRDU2C
         5NBzYXgr5YZtMud1tmGdqEdQ46GNaa3piM8UjTCjkX9hvpeQWMMNhsIbvUy5hhoombKx
         tM6nYEvcrMAmp5/Tq2XvgnVQ8RXxM9IcmdTLmQHaJlNN5p3wOhRD5KscjR+ABYB/dBwu
         YVfMmARQr7rXT3FAZsBmU640q9wIOw6/RQdSjWdZYAqdd8EeOTpwSG979dOWCl6PlfsF
         aeLA==
X-Forwarded-Encrypted: i=1; AJvYcCXJtML9cr8FdyIr9RawbuSnBODUaM5238xvhZpwE2RpTk14sieIDw0uzOPct0MNtUIAscFcFTFxqX7qd/4fQm3JdyOm@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMzl03TNN+5vs+6fQvqwYZ/5CCWRYQSK9HJMTscSMUGuAywtq
	WV44CoeakGCJrvSUpX1UmJUkUA6e5TQHGkoLmUfj2BoyKCZ9KlUjwUDZtwEOZ6lIca+vKw2IbKQ
	7neWaP5mv7wz3ORNoHb6DceoQE//8ky3Vrdwrh6YC9v3V9xWKunwM/1x3mn/xBR+pA/664Do=
X-Gm-Gg: ASbGncvVkEOcA3kp0P2DZ8hNBCcUxnx1SN2mp8K773gBfd9PN0Buf5e9d5qfGWGVZdZ
	BkdmSCHgQvBD8EmHwjx/QEnHSbPneFhpSxY8dmQ/MSuEnxJSXhB/H8dp2AadZPpiBTDVwNm/r4S
	LOn5uyVybx0PqEdEWX77qw6dNooE3zBe8xtjKpFip00WN/qA2hZdFPt9SbTiZstmJjPcluO8XLR
	XPgkl6ZoAARwP09AJoi/FlbNbHnKODdNoQLozSU4UqAdQLs42asbbFC60haLlPRlGmgRv8OplYa
	25zQ3j80R7ElY00YGJvKGHNqx4KFeSHppCNAMYtdLYTbjVq/OCoNbebXMW40Uir5l8Dtf3S8TvG
	9dQc7iVJzTz5jF4hH0F1L8LyxheQCpmTY0xMXrFOHHnjGp0bxEvdQ0iCQrRdJsoYOoA==
X-Received: by 2002:a17:906:ee85:b0:ac2:d6d1:fe65 with SMTP id a640c23a62f3a-ac38d515007mr31490766b.41.1742227869881;
        Mon, 17 Mar 2025 09:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0sssDA3BQRaSOyamV/S0PXeQ9xKfhQPA6HZicsQtZlhud1G2Kdvgy67YBjeYvH5sJJ0eE7Q==
X-Received: by 2002:a17:906:ee85:b0:ac2:d6d1:fe65 with SMTP id a640c23a62f3a-ac38d515007mr31484766b.41.1742227869395;
        Mon, 17 Mar 2025 09:11:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314858a8fsm676871266b.80.2025.03.17.09.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:11:08 -0700 (PDT)
Message-ID: <d9da58be-7a83-4007-8ea7-8c6d6005094a@redhat.com>
Date: Mon, 17 Mar 2025 17:11:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] power: supply: add inhibit-charge-awake to
 charge_behaviour
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pm@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Joaquin Ignacio Aramendia <samsagax@gmail.com>,
 Derek J Clark <derekjohn.clark@gmail.com>,
 Kevin Greenberg <kdgreenberg234@protonmail.com>,
 Joshua Tam <csinaction@pm.me>, Parth Menon <parthasarathymenon@gmail.com>,
 Eileen <eileen@one-netbook.com>, linux-kernel@vger.kernel.org,
 sre@kernel.org, linux@weissschuh.net
References: <20250317155349.1236188-1-lkml@antheas.dev>
 <20250317155349.1236188-13-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250317155349.1236188-13-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 4:53 PM, Antheas Kapenekakis wrote:
> OneXPlayer devices have a charge inhibit feature
> that allows the user to select between it being
> active always or only when the device is on.
> 
> Therefore, add attribute inhibit-charge-awake to
> charge_behaviour to allow the user to select
> that charge should be paused only when the device
> is awake.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks, patch looks good to me, FWIW:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  Documentation/ABI/testing/sysfs-class-power | 11 ++++++-----
>  drivers/power/supply/power_supply_sysfs.c   |  1 +
>  drivers/power/supply/test_power.c           |  1 +
>  include/linux/power_supply.h                |  1 +
>  4 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> index 2a5c1a09a28f9..78afb2422fc5a 100644
> --- a/Documentation/ABI/testing/sysfs-class-power
> +++ b/Documentation/ABI/testing/sysfs-class-power
> @@ -508,11 +508,12 @@ Description:
>  		Access: Read, Write
>  
>  		Valid values:
> -			================ ====================================
> -			auto:            Charge normally, respect thresholds
> -			inhibit-charge:  Do not charge while AC is attached
> -			force-discharge: Force discharge while AC is attached
> -			================ ====================================
> +			===================== ========================================
> +			auto:                 Charge normally, respect thresholds
> +			inhibit-charge:       Do not charge while AC is attached
> +			inhibit-charge-awake: inhibit-charge only when device is awake
> +			force-discharge:      Force discharge while AC is attached
> +			===================== ========================================
>  
>  What:		/sys/class/power_supply/<supply_name>/technology
>  Date:		May 2007
> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
> index edb058c19c9c4..8d036faf220ec 100644
> --- a/drivers/power/supply/power_supply_sysfs.c
> +++ b/drivers/power/supply/power_supply_sysfs.c
> @@ -140,6 +140,7 @@ static const char * const POWER_SUPPLY_SCOPE_TEXT[] = {
>  static const char * const POWER_SUPPLY_CHARGE_BEHAVIOUR_TEXT[] = {
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO]		= "auto",
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE]	= "inhibit-charge",
> +	[POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE]	= "inhibit-charge-awake",
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE]	= "force-discharge",
>  };
>  
> diff --git a/drivers/power/supply/test_power.c b/drivers/power/supply/test_power.c
> index 2a975a110f485..958e0c0cf2876 100644
> --- a/drivers/power/supply/test_power.c
> +++ b/drivers/power/supply/test_power.c
> @@ -214,6 +214,7 @@ static const struct power_supply_desc test_power_desc[] = {
>  		.property_is_writeable = test_power_battery_property_is_writeable,
>  		.charge_behaviours = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
>  				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE)
> +				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE)
>  				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE),
>  	},
>  	[TEST_USB] = {
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index 6ed53b2921624..bb8e9e62ce834 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -212,6 +212,7 @@ enum power_supply_usb_type {
>  enum power_supply_charge_behaviour {
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO = 0,
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE,
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE,
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE,
>  };
>  



Return-Path: <platform-driver-x86+bounces-2338-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389F88E6D9
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 15:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E13FE1F2F589
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 14:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114AD13BC3A;
	Wed, 27 Mar 2024 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="df/7DgX4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2AA13CC4C
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711546335; cv=none; b=tYqXuXP67vbjGDKXzIcMSM4Vq1fHZ6qJ3r7QlK1uGaJZ7w4kgUSXr3GnNmYALF+dRFu1kIhirT+1Wk0DqdJ3kY6gQgewZawpNbB5DoquJrMf3kbw1syo5hIA1EIViBcGM9hyoHqTjJZzPrIMYqYejjJLHjrT5Q5Q0J5MamYSapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711546335; c=relaxed/simple;
	bh=K0UVZINUhSSLxdNU4wwBE/T+FEz46ODAQKkZL3ADYrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTC3M5QaeXMeQ+OtYLTrAgw4OWLHvZY0AM8tY/42oEl84rLvI9DVfUy9+9NbDUJQACKWLyXCzR7CQ3BJyB0am5AUr9vysQGr4RcHYZRzXpo/DwDcX8OvlsZxQ9rJsj/KXs1oalmjqDkocJxoQX7RRF2YxMsu9DehWIArOfQLyTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=df/7DgX4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711546331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jD3Utmle+bis7mmdPw9AquqAmC1o8mQyHmUQiw/WEzk=;
	b=df/7DgX4aTiAuA+JAj2tG6lVWAV68slnmgNzVKrmQG6jhUh5Mx53DO1djxuzUqoIoJpRdZ
	DVmQJYFXTw/OSV//gs0x/8prhF6ZiHRlt3C6ylvTQRvk+SEmlP8UhagE6HY5f5PDqyBj04
	DKQLnAFR3HLLDoNeoNE6D0kI3MuMWrk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-PMfP9OZyNXiadaeQ6jfW6g-1; Wed, 27 Mar 2024 09:32:10 -0400
X-MC-Unique: PMfP9OZyNXiadaeQ6jfW6g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a46852c2239so493857266b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 06:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546329; x=1712151129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jD3Utmle+bis7mmdPw9AquqAmC1o8mQyHmUQiw/WEzk=;
        b=nYrHmRHmEItOq7lUXc2j16gnUiyEAbRoPE1YyIPTa5qRkvy4fj5+JO3jax8QILxvOC
         rU5iJ+ipK7ah2dv2svvuIsPw6V8r0OuUZT4n2DJ+1aBi5oSWFuciGEBXA6aEnIu+xeLN
         rzaMHQiIbWhs6+pb4+yI8NDlon2P/HVftohVuDgpEIL3u1/KMkRg/powNOIzLU3lAtzS
         H5aaAQMWkzv8TOC+8U/GZ8mkiEWKmc2UdotQ0sdxnZ0qBQeI8YyrU4Nx3+j+xrR+El7u
         8UUxNdGEbtwXAeFGh2jkV+tcQVSpaVndPI9M5zaZ1eGGxH02YHOX3sYBAhOHawpf5CYg
         5iaw==
X-Forwarded-Encrypted: i=1; AJvYcCX7yDN00/fAgw4c2eb+SciomkavPKeb+t0cG8o+q8iGwDlShoco3Cuq8F5k+/vJP1iSFcupFp3vZB32WdCK+DEYkstuJRia/OvhAz7FehVUBwnH2g==
X-Gm-Message-State: AOJu0YwYHov+mY0fYbNUEgycTkH9anEir+ZPBK91aqZMTdlgwyfJw7Pz
	0jHEIBJRm48Gz6AOlOueWpszuhOOKL50ZqLpav1PZDA765/m6z8NO+U6y63osFRIESNqEZVsqmm
	dD5A6VyGlO34sBBkfKm5aDuEmJsjxjFYJmPIZs4mi09oHPtS1URBS4Imv6ssXH1pZvs10WTs=
X-Received: by 2002:a17:907:7206:b0:a4d:fe2f:a70b with SMTP id dr6-20020a170907720600b00a4dfe2fa70bmr2448996ejc.41.1711546329077;
        Wed, 27 Mar 2024 06:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGdhqFLAf1gKN0Y/NZQvk+kIH5rUrJ00j88K5l/PrX7PEX8pYP+EIH8Lg2tXiyjUb+BEqFQQ==
X-Received: by 2002:a17:907:7206:b0:a4d:fe2f:a70b with SMTP id dr6-20020a170907720600b00a4dfe2fa70bmr2448827ejc.41.1711546326567;
        Wed, 27 Mar 2024 06:32:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709060e4200b00a4674ad8ab9sm5383406eji.211.2024.03.27.06.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 06:32:06 -0700 (PDT)
Message-ID: <cbd6cf18-cdfe-409f-82f0-de46d2fe08ca@redhat.com>
Date: Wed, 27 Mar 2024 14:32:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] ACPI: store owner from modules with
 acpi_bus_register_driver()
Content-Language: en-US, nl
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
 Daniel Oliveira Nascimento <don@syst.com.br>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Matan Ziv-Av <matan@svgalib.org>,
 Mattia Dongili <malattia@linux.it>, Azael Avalos <coproscefalo@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>,
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev,
 platform-driver-x86@vger.kernel.org
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
 <CAJZ5v0hEiKJJWn-TVoyL6DEbCcMpL39_q+HLG_YZyjf9g29CXA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0hEiKJJWn-TVoyL6DEbCcMpL39_q+HLG_YZyjf9g29CXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

<sorry for the empty previous reply, my bad>

On 3/27/24 2:16 PM, Rafael J. Wysocki wrote:
> On Wed, Mar 27, 2024 at 8:44 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Merging
>> =======
>> All further patches depend on the first amba patch, therefore please ack
>> and this should go via one tree: ACPI?
>>
>> Description
>> ===========
>> Modules registering driver with acpi_bus_register_driver() often forget to
>> set .owner field.
>>
>> Solve the problem by moving this task away from the drivers to the core
>> amba bus code, just like we did for platform_driver in commit
>> 9447057eaff8 ("platform_device: use a macro instead of
>> platform_driver_register").
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (19):
>>       ACPI: store owner from modules with acpi_bus_register_driver()
>>       Input: atlas: - drop owner assignment
>>       net: fjes: drop owner assignment
>>       platform: chrome: drop owner assignment
>>       platform: asus-laptop: drop owner assignment
>>       platform: classmate-laptop: drop owner assignment
>>       platform/x86/dell: drop owner assignment
>>       platform/x86/eeepc: drop owner assignment
>>       platform/x86/intel/rst: drop owner assignment
>>       platform/x86/intel/smartconnect: drop owner assignment
>>       platform/x86/lg-laptop: drop owner assignment
>>       platform/x86/sony-laptop: drop owner assignment
>>       platform/x86/toshiba_acpi: drop owner assignment
>>       platform/x86/toshiba_bluetooth: drop owner assignment
>>       platform/x86/toshiba_haps: drop owner assignment
>>       platform/x86/wireless-hotkey: drop owner assignment
>>       ptp: vmw: drop owner assignment
>>       virt: vmgenid: drop owner assignment
>>       ACPI: drop redundant owner from acpi_driver
> 
> I definitely like this, so
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> for the series and I can pick it up if people agree.

Thanks all the drivers/platform/x86/* change look good
to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

And I'm fine with merging these through the linux-pm /
ACPI tree.

Regards,

Hans





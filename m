Return-Path: <platform-driver-x86+bounces-1827-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF14870385
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Mar 2024 15:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00E3C1F26D82
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Mar 2024 14:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C948A3F8C2;
	Mon,  4 Mar 2024 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gTqeIVUF"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D15224D5
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709560803; cv=none; b=DrzMSSrHTZq1vXcPKr/vrCY2F6rbrVlJA6PgM9cRMDfgqe9/4BDn7/RP6pzKhpZdIENQg7963ZnGswcpfNqoHkbOHAtrxO63Q+Tek2wT6V/BYbyFMlUfgxI8t2ClCrFHdT2Rdll4JDAIn0f5HjulHwo5v9TBzBVErNmldG0Nyhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709560803; c=relaxed/simple;
	bh=D1B9K4baL3Z3nIptDv0YiDgE7Yl4mSEpWihDvUxyfbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbR8NdntiENd20ZlSOFZxI+7xjG8moDVcqTSEIKOxF7bSBhU4RXsmWrcPYevgcHj1UNrf/67uQ6MDFnp64gljXeETn/upWW1d4SDXDppHl8DLDmKSO9w1903B2/3JyWRYbwCGGFvvsCa7YTWOaFicIfMn0ZTNUPVy4w4qaBN52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gTqeIVUF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709560801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZA9pD2ts9kSJAwQronp0JbzaWg2wTYP9YmYGFngBKjs=;
	b=gTqeIVUFHgkirwHhCXCKhoo9jCGOzH8lznETHZkU+sdMO3sKUGzN+30pY30Xopioqr7aKL
	b9O2jzKa+cavr1pV0Ja0QOmoHbsl4NyduPXEEtUADW96aBnCzZ21wavqTaNhZg2/ir3MhQ
	oCdChPTRzwBThVJjMgPds10eDl3Q1do=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-QVvFt0_aPnCVeJgGstZGGA-1; Mon, 04 Mar 2024 08:59:59 -0500
X-MC-Unique: QVvFt0_aPnCVeJgGstZGGA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56669623757so2358522a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Mar 2024 05:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709560798; x=1710165598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA9pD2ts9kSJAwQronp0JbzaWg2wTYP9YmYGFngBKjs=;
        b=Wv2TWGhJmZZLVd2lOJJZW5Il7NNiw7TaaYRQHeAjcqPt7bwGAS88JeROSdmXtI7C0K
         f6AyWBgvXMc05+6VAw88PxYUouaf3JECXGWtJKZ8ETADh9658ITGI+7DSgTwUdmpvSd0
         cweIWLMusJxjQldawX0QLSQfrPDiWoYfg1bMAlmol8sD2/q2xahFHCN2ylkp6+eArojW
         5mqKTwFZtTfct90SC9r8K4PJHPGZjbFeEVSUNzoLltPHRBE/cKNJOz4Gfw5uAuemTcW5
         tfMH9D1dmQ18guOMqKc/DtMRAalJpPiDsxS0do2t6aaXUVhuPWA4ua1iz/vtyBDxCmZx
         3EMA==
X-Gm-Message-State: AOJu0YzYvDpfsBr9rEcbeyl7QZRgVRy8GlEwuwkzOlu831BOZT8+4NKi
	ENJaduo6jwZRKXyRx0+t3Jc0hrWnmObhb5Hv4O44Zo8VaKmv270Q17p9+VTHVvuCldr1OmkJkfY
	gp7iARcI6+mHHY+6hVq69gs+OL2HtQvAXI4bZACEQTkz9PQPBg4sTsOJn43/rMpcFwx3VQCEvSZ
	8hzJA=
X-Received: by 2002:a17:906:f74e:b0:a45:4771:e0de with SMTP id jp14-20020a170906f74e00b00a454771e0demr1796435ejb.15.1709560798352;
        Mon, 04 Mar 2024 05:59:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ6MrdBFE8KE2OU0V81y8AHK24KI7VTl6lnoh4TN+KiuOWzfgxSw/+70+dSq4PNogDRRjlnQ==
X-Received: by 2002:a17:906:f74e:b0:a45:4771:e0de with SMTP id jp14-20020a170906f74e00b00a454771e0demr1796427ejb.15.1709560798065;
        Mon, 04 Mar 2024 05:59:58 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i23-20020a170906265700b00a44dca5f9c1sm2698619ejc.100.2024.03.04.05.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 05:59:57 -0800 (PST)
Message-ID: <8afa1f78-8b89-4bbc-95e5-35eea76356e4@redhat.com>
Date: Mon, 4 Mar 2024 14:59:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: p2sb: Defer P2SB device scan when P2SB
 device has func 0
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "danilrybakov249@gmail.com" <danilrybakov249@gmail.com>,
 Lukas Wunner <lukas@wunner.de>, Klara Modin <klarasmodin@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20240302012813.2011111-1-shinichiro.kawasaki@wdc.com>
 <gl7rsalwdwdo4rdes6akcnd7llrz75jjje2hchy5cdvzse6vei@367ddi3u6n2e>
 <a26554d3-bee9-4030-a06c-f886ba2fffb0@redhat.com>
 <r6ezdjqb5hz5jvvaj2beyulr2adwht2sonxw3bhcjdvwduyt66@2hlsmnppfsk2>
 <7935add6-a643-43dd-82a8-b7bcfb94d297@redhat.com>
 <6sbllfapnclmu5sjdtjcs4tyzkkr76ipg3i3rtqyyj7syhtkwd@d2l6zq2co7zt>
 <a5dac02b-c16a-45d1-8157-0dae1b034418@redhat.com>
 <d6a95bd9-dac2-4464-af84-9394a36b7090@redhat.com>
 <2c3gyhvwncqgfa6t3tb6fj3fk3nkbzpmlgfyzwjgwmmlnhxssu@d25ihdnpwado>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2c3gyhvwncqgfa6t3tb6fj3fk3nkbzpmlgfyzwjgwmmlnhxssu@d25ihdnpwado>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/4/24 1:13 PM, Shinichiro Kawasaki wrote:
> On Mar 04, 2024 / 12:04, Hans de Goede wrote:
> ...
>> So the p2sb_bar(devfn=0) call actually only happens on Goldmont from:
>>
>> 3) mfd/lpc_ich for pinctrl    devfn = 0
>>
>> and then only when the ACPI tables fail to properly describe the GPIO
>> controllers as ACPI devices, if the GPIO controllers are described
>> in ACPI, which they are on the ASUS VivoBook D540NV-GQ065T then that
>> call gets skipped.
>>
>> So on the ASUS VivoBook D540NV-GQ065T p2sb_bar(devfn=0) gets never
>> called. Which explains why not caching it fixes things. I assume that this
>> laptop just seems not likes the P2SB is touched at all and by not caching
>> the BAR for the P2SB it ends up not getting touched at all.
> 
> Thanks for sharing the insights.

Looking closer at the actual unhiding I don't think accessing func 0
is the problem. The unhiding is always done on function 0 even when
retreiving the bar for function 2 (the SPI function).

So taking that into account, as mentioned in the bugzilla, I think
the problem is probing the other functions (1, 3-7) by calling
pci_scan_single_device() on them.

I have prepared an alternative fix based on this and asked
Danilrybakov to test that in the bugzilla.

(and also posted it as a RFC to the list)

>> This also means that likely the P2SB devfn itself generally speaking is
>> often not touched on Goldmont platforms. So we can avoid the lockdep
>> issue on PCI bus rescan there by caching the SPI controller
>> PCI_DEVFN(13, 2) devfn from fs_initcall(), since that will be the only
>> devfn for which p2sb_bar() will get called (except on hw with the
>> GPIO controller missing from the ACPI tables which should be rare).
> 
> Oh, this sounds a great idea.
> 
>>
>> I have prepared a follow up patch to your v3 to cache the
>> SPI controller devfn instead of the P2SB devfn at fs_initcall()
>> time. I'll post this shortly and I'll also ask the bug reporter
>> to test the combination of our 2 patches.
> 
> Thanks a lot. Looking forward to the results.

Since I already had the follow-up patch to your v3 implementing
this ready I've also send this to the list as RFC.

I hope the patch to only cache 13,0 + 13,2 at fs_initcall()
time works. Then we still avoid all possible deadlock /
lockdep scenarios which would be nice.

Regards,

Hans



Return-Path: <platform-driver-x86+bounces-9394-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E4A30851
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Feb 2025 11:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3F4D7A0234
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Feb 2025 10:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4141F03D9;
	Tue, 11 Feb 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eO8f07vd"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0631F3FC2
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269135; cv=none; b=IGJUi8LyajkAggtqOtch5AwVx5ZSnFzdMwukBwITNY09OU1ekBOy8bL7leooSOKrzAp3Zcc9l+rymcv/wZ4VuhJrBnqbtrvigDPpY/fKsRUH2+19rot6QA4+OtC04P3QyRdBwT5HbRU72P7PZesmhx84dQz++eHLBt+GkVDhQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269135; c=relaxed/simple;
	bh=wlY7+9nHoSDAaLsQ7OULxoXI3IO7+T/3OP3/Wb0m6pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0zfDNyKcKE/Pj9zWHHz8ylGgIbhfZyNtgHk7MereJM6Hu0HEaXsmuNbuhv8dTojyh88M9PPyq7LJGnksPwix5C4o0NSCAl6EvcwFoDxi4o/rQfxQO//Jw4GlL6OpA6Gl8rXQJVMzIFmID0AZM1I4b3fFUgH/RC3isaCh5ZUyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eO8f07vd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739269132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQpR7rT7rAkm5W6TzNB7kQN+yLuaFOnSdmysNQlVUAU=;
	b=eO8f07vd0TqksKmUX4E1C1dLFJVCsePzwOSjAeh043m2dSV8ZXh+HNxjiBekuQQo20q3m1
	4BOCYma9koEf6TKZjLmzdQkCvU44LX43oxmJ9pamgjcv56v2+lQoBAZPUle8UYrYw3gBw5
	FMYOdE1hnQKGIRxWofVHGU3GOlT5sIk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-8Nzmj-JBPPu3I0IZg5yEyw-1; Tue, 11 Feb 2025 05:18:50 -0500
X-MC-Unique: 8Nzmj-JBPPu3I0IZg5yEyw-1
X-Mimecast-MFC-AGG-ID: 8Nzmj-JBPPu3I0IZg5yEyw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab76aa0e72bso455070566b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 02:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269129; x=1739873929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQpR7rT7rAkm5W6TzNB7kQN+yLuaFOnSdmysNQlVUAU=;
        b=vfw2nwEqLwZC3DaDykm3eayh/jv4NjwCT0O45pEEqZa/Pd3kLG8o9n8M1DtOqr5wYK
         sqOsUwYtwZDUI+lCi4SYQHF022lg+e99I0powoopDe/BK++JhCrH5wdUe/oeeIcKQ6xy
         gb+M5JYe9Rj8Z0X55PKHxX8zQqjYrseAKpvoMSK480vhYb6z+UBUwYTpcLCV/BEV7UiG
         m8cGzFwLGN/dfCgyPYC40CGMIXK6JTufdPtxQWsWkeVVRK5F3IHSaCNcZfNhzwAZ0WUY
         rIbjhnqP92GaV/hij8uC+11Qw/dXtefxSKlP2+Lb5Omhy7oZr+Um4UmXDiCIkZC6qBcm
         WLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ143Q+k6xhoUfkvuN/8N0EW04LyZCJVBm6tcTVqJrHucM2s/K60LMeSI5FSsJ6gUbdALPkqFrJJbOxn7aErLiKbuM@vger.kernel.org
X-Gm-Message-State: AOJu0YzqJSrQwrW7L5kZRgTeObNrK2NWJBBR/Z3ovKv7SCHUXPItex79
	ofG2HSVVPcdjlfFcQCFV5CM+tcMdwDhbvHkZI3Y99+mAwFQQU1rTp3iDrdFKuJOCOIoPUmj9NC2
	PABLHReGuDQlsJPI1l9NHQbbRuflZerDYYw8mn79WvWOSkcli69IQjd4T1gZf5IXYhmUSn9c=
X-Gm-Gg: ASbGncvT3O/yjitCark/UP7GNKO1oYtlXABqGxk2Ms/s2Wio+j8L3vXE9jerecoRPDJ
	hH5uEddltDeLojMln3T+eLPgkn40AowNdv7gf2LCDhB+3ykaifSAoCk9YVzFnfb66XX8yQdTjT3
	AmUGtN7kfYFOTn+DWwb+bIODH3QE+xvzfmCEFCqCstfooYl70pAEwI8G8MpvXXBGMqYK6qxThTb
	PEp2tACv6McpW9Gk172CPVO/+23KelYV6c60hyYLrL5W9ZoCdPzTE6NxB9w8x307NJvFOeBSHJW
	zpjnz29hC0MJ5pCnXmnlCtfbmjQEXyQ4mUxfDinDl7HOrqlsIq5Sy5EOPeAAK84z02mb2InjGRZ
	+T4uLOKc+ghaBsGWAMD9vxa/M0jycQn8Z1eOvZOQxQUhwxFOIqaLrHTI=
X-Received: by 2002:a05:6402:4497:b0:5de:3d2d:46ce with SMTP id 4fb4d7f45d1cf-5de45070ec5mr43392158a12.25.1739269129505;
        Tue, 11 Feb 2025 02:18:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH55/tdLE0AKfymdJNJYym9eTCX1Wieg2GKl3g0e5gSgrHyDqRXqPANH+3vDx3UeXK6ebyN7A==
X-Received: by 2002:a05:6402:4497:b0:5de:3d2d:46ce with SMTP id 4fb4d7f45d1cf-5de45070ec5mr43392119a12.25.1739269129090;
        Tue, 11 Feb 2025 02:18:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f8436dsm1034019966b.54.2025.02.11.02.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:18:48 -0800 (PST)
Message-ID: <64b617e1-bf52-442e-be56-71c76d973edd@redhat.com>
Date: Tue, 11 Feb 2025 11:18:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, linux-media@vger.kernel.org
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
 <Z6shGGy2FPVc5mEK@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z6shGGy2FPVc5mEK@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Feb-25 11:06 AM, Andy Shevchenko wrote:
> On Tue, Feb 11, 2025 at 09:28:38AM +0200, Sakari Ailus wrote:
>> One patch turned into a set, the second patch being the original one.
>>
>> since v6:
>>
>> - Reword the comment regarding GPIO map processing.
> 
> Hans, Ilpo, I think this is in good enough shape
> (the order of the checks I'm still not happy about
>  we can amend later on if required). Can it be taken?

Yes this looks good to me. Ilpo can you merge these 3 as fixes
for the 6.14 cycle ?

Regards,

Hans



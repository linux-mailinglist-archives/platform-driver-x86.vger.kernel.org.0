Return-Path: <platform-driver-x86+bounces-3391-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD38C6B76
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 May 2024 19:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C675B1C2323B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 May 2024 17:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6DC3EA7B;
	Wed, 15 May 2024 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1De4Bih"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD539FE4
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 May 2024 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715794168; cv=none; b=lgb4Ny6Y8lDFNm9P3MUP0scBKvGepaSRX6gJ2buz6fGBMgaXtppWArfmXyt8YqJ5wUUOA97w+5Dx9RCXQBThENKWyTF7TissG+KeqdAhq0XhvSri0NzJrljZGecFw4FYbPB8oU5LS9qnUMReIzwRC6tU9kfqXOM6z/nGResyJhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715794168; c=relaxed/simple;
	bh=f/iuzZMlmH508xLuK+c3POd1uCl01loh39/9JbXRo/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjVxC405hE+YcWt9yYbBG1L5gcqvMROb9NwzqbxYT5IOfJ3P10iKnho8y1NkOvEZkZuNx3AIxXIugzCimG5VSW7phgTxlE9utjFNvrIW7uBXPGPgPKJxvqRmfXP4tfXtgOXKT52gSO6x5lzjNNAYiruqchaT/UM4YHEv8ryjx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1De4Bih; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715794164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAfbkl7wDlhHLUu1WDwZPQgfI6VIwQuAvbx4geCCHEk=;
	b=g1De4BihTSbiDXNZPDKaZnEYkZNb/dq3CBolemNJCvtxzd8wBK4LNmztPNVExji5cPDRLM
	/Fyyvi4u5IGyA4mX95YemoHTwiQHFGj2WEGiOwfO++BCTG309QDRKd7T5fVBdQxP4SIOag
	n+pGC3mzldr2lzcMph7ZWF64p2/A+yg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-LmUoHccNMVuAdRQGYA4THg-1; Wed, 15 May 2024 13:29:19 -0400
X-MC-Unique: LmUoHccNMVuAdRQGYA4THg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-522362e8317so5027530e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 May 2024 10:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715794158; x=1716398958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAfbkl7wDlhHLUu1WDwZPQgfI6VIwQuAvbx4geCCHEk=;
        b=fqh6Q+0sOg/m4Jr39xO4om7jAmr8/7B0aRZ/9ndcAAy8PSACYB/gftHQXhz4ocaGn/
         vCqbwGPNPidcr1kKysLzYBxlBoEl/IkKMxkwep6XxX36iaJTXNhpCm/5au3zGTchWQQA
         +1TPq5oOv0dJ/ph9tJ+ux6413HMqkN9BXNV2R3yKsuxaQnap2NNYYSMZpll6f6BuNHXT
         jn5p3Bsj1VSlJXFlprT5lKuEeA9/W5bBsmMCtrHE8nKI9XMeVAQXcV9H4CfbCqSWg2vm
         pC+UxzipHFen/4vyrSFkbYY2ACvWTwI1QkTXwveW/02IJfohhQngowojni5Kn/2gMWFi
         +oTw==
X-Forwarded-Encrypted: i=1; AJvYcCXcTvOaEWH5EbnINbKlbCVZa8qoJEPi25REE8T6xPMGIQLGeXFkdCB1giNUDGv6fklDmuPx2M9AuZoclh4UMBVuV/ObKQD7UTyDVRivBz6SdiVMhw==
X-Gm-Message-State: AOJu0YxqxTp85GO3EeNRFzXausNlFILKJwZV7VCcLgohzbPsY5ibxEpt
	PvuQI3zYeHbzWy49Nh2y8XDTrJ46s9d+AGFurSG6cKJo7nkKvCxxi15OnQ1ElJRlFGDCJA+xbdu
	ukL/uzmXLpTyHB3OY7+H7D+SY6k99UgZ3MDV7qL/Lu5/WS/TlmdWmdGl3KuBLOatF78kQ/Eo=
X-Received: by 2002:ac2:4e11:0:b0:516:d232:2516 with SMTP id 2adb3069b0e04-5220fc7c59amr15507434e87.6.1715794158269;
        Wed, 15 May 2024 10:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDrCwDGj4XtoQfDTNZCsTDx1LFrxlRKr0DQD3VjW8RoHfkTcT7e3ifieXQ/Csi1JyJ3zpPXg==
X-Received: by 2002:ac2:4e11:0:b0:516:d232:2516 with SMTP id 2adb3069b0e04-5220fc7c59amr15507407e87.6.1715794157745;
        Wed, 15 May 2024 10:29:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17844sm879836966b.190.2024.05.15.10.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 10:29:17 -0700 (PDT)
Message-ID: <04271fb5-cca3-4bca-b98e-3fab8a78c724@redhat.com>
Date: Wed, 15 May 2024 19:29:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: video: Use vendor backlight on Lenovo X1 Carbon.
To: dengxiang <dengxiang@nfschina.com>
Cc: lenb@kernel.org, linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 prime.zeng@hisilicon.com, rafael@kernel.org, tony.luck@intel.com,
 wanghuiqiang@huawei.com
References: <20240515034501.12772-1-dengxiang@nfschina.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240515034501.12772-1-dengxiang@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi dengxian,

On 5/15/24 5:45 AM, dengxiang wrote:
> Hi Hans,
> 
>> A couple of remarks / questions:
> 
>> 1. Looking at the strings you match on this is not for a Lenovo X1 Carbon,
>> but rather for a Lenovo Kaitan model ?  So it seems that the commit message
>> and the comment for the quirk need some work.
> 
> ok, I will add DMI_PRODUCT_VERSION & DMI_BOARD_NAME to make a distinction between  X1 Carbon and other kaitian models.
> 
>> 2. I have never heard of a zx_backlight interface before and there certainly
>> is no upstream driver providing this. I believe you need to explain what
>> is going on in a bit more detail here and then we can see if this really is
>> the best way to fix this. It seems that these Lenovo Kaitan laptops are
>> using Zhaoxin Kaixian x86 processors with integrate graphics. I would expect
>> the zx_backlight interface to be provided by the driver for the Zhaoxin Kaixian
>> integrated graphics in this case. And if that is the case then the integrated
>> graphics driver should use BACKLIGHT_RAW (aka native) for the backlight type
>> and with that change this quirk should not be necessary .
> 
> Yes, zx_backlight interface has been provided by the driver for the Zhaoxin Kaixian integrated graphics. Also use backlight_device_register("zx_backlight",...).
> Strangely enough, X1 Carbon laptops will generate two native acpi_video as belows:
>  
> lrwxrwxrwx 1 root root 0  5月 14 16:20 acpi_video0 -> ../../devices/pci0000:00/0000:00:01.0/backlight/acpi_video0
> lrwxrwxrwx 1 root root 0  5月 14 16:20 acpi_video1 -> ../../devices/pci0000:00/0000:00:01.0/backlight/acpi_video1
> 
> As you see, it will conflict with the same pci bus, then zx_blacklight interface can't be shown on the path /sys/class/backlight/.
> That is to say, zhaoxin driver contain key code as belows:
> #if DRM_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
>     if(acpi_video_get_backlight_type() != acpi_backlight_vendor)
>     {
>         return ret;
>     }
> #endif
> 
> If i remove the key code, this laptops will generate two native acpi_video and zx_backlight on the sys backlight patch. Once add acpi_backlight=vendor parameter into kernel cmdline, 
> just zx_backlight interface has been left on the sys path, which mean that both acpi_video0 and acpi_video1 interface can not be found.

Ok, so the way this is supposed to work is as follows, there is a single
acpi_video_get_backlight_type() function which all backlight drivers are
supposed to use (and all in tree drivers do use).

This looks like this (simplified a bit, see drivers/acpi/video_detect.c):

enum acpi_backlight_type __acpi_video_get_backlight_type(bool native, bool *auto_detect)
{
	...

        /* Use ACPI video if available, except when native should be preferred. */
        if ((video_caps & ACPI_VIDEO_BACKLIGHT) &&
             !(native_available && prefer_native_over_acpi_video()))
                return acpi_backlight_video;

        /* Use native if available */
        if (native_available)
                return acpi_backlight_native;

	/* ... long comment explaining this ... */
        if (acpi_osi_is_win8())
                return acpi_backlight_none;

        /* No ACPI video/native (old hw), use vendor specific fw methods. */
        return acpi_backlight_vendor;
}

as you can see here acpi_backlight_video is only returned if available
(which it is in this case) *and* there is no native GPU backlight
driver or prefer_native_over_acpi_video() returns false.

Since there is no way for this function to know a native GPU driver
is supported it uses the native parameter passed to it for this,
so native backlight drivers, like the Zhaoxin Kaixian integrated graphics
driver must call a special helper, which internally calls the above
function with native=true. I think not calling that special helper
is why you see the acpi_video backlight devices, assuming you are
using a recent mainline kernel.

So that:

#if DRM_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
    if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
    {
        return ret;
    }
#endif

block you quoted should look like this when using recent upstream
kernels:

    if (!acpi_video_backlight_use_native())
    {
        return ret;
    }

Although that return ret looks weird, maybe hardcode 0 for success
(not registering is on purpose, so success ?)

Or to keep things compatible with multiple kernel versions use:

#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)
    if (!acpi_video_backlight_use_native())
    {
        return ret;
    }
#elif DRM_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
    if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
    {
        return ret;
    }
#endif

Please give this a try, I believe you will not need a quirk
when the Zhaoxin Kaixian integrated graphics driver does
the right thing.

Regards,

Hans




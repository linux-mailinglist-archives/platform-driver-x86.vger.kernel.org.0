Return-Path: <platform-driver-x86+bounces-953-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3509836206
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 12:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45E601F280E8
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 11:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F8D40C15;
	Mon, 22 Jan 2024 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ub6j+wMA"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D224122E
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922990; cv=none; b=UUuPySZcm+qlxjXkUuJhjIqF3mKI32PE1K3S/b3TwbI13hLebD1oYJTUQyQeLdGhNYdQy4QvCiflubfDiUIlFxnt3q9QH/yvGnHBITn6g8un5v1mbD9qBwPz87WLQPudhrdPJAw1/UpfbELusNGcFwcg6Z5KQy/GesJZnnFX8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922990; c=relaxed/simple;
	bh=JGWqZhVcL7ryCjn+vX9Caw5DAcSD07qOqTKDQaS6LWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sERBE4SQKFC65qFfpidGWZI6D8cwZUtq3FGRNoL4uf5w7oz+GFf1YJUtybG1B8Lv/bRJiyqhjtVV3b+kOB8KvuvEcBMbVJFSwQaCFOikv7pL9k1MD6fMJSli2v8Vz/FtxKrXjnxUNagtNyd6E3fR6lP2H/5inBkLxL8IvxTg/8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ub6j+wMA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705922987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6qQO7GK81UzZzgvu/sQyAjBJMfGdp56pL3agcv6YYc=;
	b=Ub6j+wMALkafByvzFrZVgY9kPqiZv8wXckNVLlLfB/3eXyHVO2tiZGnY9pb+6wo5/OaKsL
	w8YXqZiWmXmOSYHxiH0vXb6yqBuVeH4L6v7ZzvaYQz2I1wOArteXYEMMW8AEZPB23irUcm
	ECK838QnMfCtOrf3qbzqI2a3D1QfrBI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-SqZMe9imOMK6dDUe-xESfg-1; Mon, 22 Jan 2024 06:29:46 -0500
X-MC-Unique: SqZMe9imOMK6dDUe-xESfg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2c20945b80so427726566b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 03:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922985; x=1706527785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6qQO7GK81UzZzgvu/sQyAjBJMfGdp56pL3agcv6YYc=;
        b=sw2j2NpmcQJHi/9SzcaYir7qPOLef65Lxki32sTR7p+TLLTos2L/hbNJPyTkSdesb+
         Ip8OxQH8Z0gBcYoHiVqXKPNG5qApAQFgsPfsXT3KRAAPP/ECMhLYrGik5P7BiN5sEV0o
         biiKm0Ii/zURtb+1C0Y91bPNeRNnQgrwvnXDenM7/BxLsHgs4HHMTlMfM6WgD7gaskkP
         b0sSSFDYzijLlS8Gm/5z0vFwB5uxAEqabnejKbfBX2/gRB2cWHTuPTit3kb0/eviXMt+
         wFrKSbpfdN98RHiMUUJJB2S0AUdlZvMXYJCNBnBkS5vwxM+jyaF4auLNxTR9uBIfkIRT
         Pm7g==
X-Gm-Message-State: AOJu0YzkK+prIUY44tXTpVqy5JpXpd6ZUP5fyzx8ZB9MDgy41x87babx
	fzYCjND5Vssw1edRrzGwWqBpRMQvjhuuWK0MkdnMoYsJv56fEaATtNi7K1CH26lxv6Anp0qlGzH
	h/yEs1rnV5SoN+bifH7W3ojoNvBYFP0azNjf45oEcxOzSGG5/nHMnriALzmqyEF5xC+1XQDKEqJ
	HD/dI=
X-Received: by 2002:a17:906:cd13:b0:a1c:a542:2fcb with SMTP id oz19-20020a170906cd1300b00a1ca5422fcbmr3284223ejb.31.1705922984959;
        Mon, 22 Jan 2024 03:29:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyZmThrluJPviG+qJFxpPsN+NEG7+fr7H9zwYXkmv1j1v+6G9VQ+qQolE4vNhExUqTGn44gw==
X-Received: by 2002:a17:906:cd13:b0:a1c:a542:2fcb with SMTP id oz19-20020a170906cd1300b00a1ca5422fcbmr3284217ejb.31.1705922984675;
        Mon, 22 Jan 2024 03:29:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fj12-20020a1709069c8c00b00a3076eec436sm423813ejc.5.2024.01.22.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 03:29:44 -0800 (PST)
Message-ID: <1862d74a-7b15-48e3-896b-30dda835f28f@redhat.com>
Date: Mon, 22 Jan 2024 12:29:43 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: wmi: Use ACPI device name in netlink
 event
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240121200824.2778-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240121200824.2778-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 1/21/24 21:08, Armin Wolf wrote:
> The device name inside the ACPI netlink event is limited to
> 15 characters, so the WMI device name will get truncated.
> 
> This can be observed with kacpimon when receiving an event
> from WMI device "9DBB5994-A997-11DA-B012-B622A1EF5492":
> 
> 	netlink:  9DBB5994-A997- 000000d0 00000000
> 
> Fix this by using the shorter device name from the ACPI
> bus device instead. This still allows users to uniquely
> identify the WMI device by using the notify id (0xd0).
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Changes since v1:
> - use acpi_dev_name() helper function

I'm a bit divided on this patch. I agree the new way of doing
things is better, but technically this is a bit of a userspace API
break.

I guess we could hope that nothing depends on the old netlink API
format / name but I'm not sure we can rely on that ...

Ilpo, Andy do you have any opinion on this ?

Regards,

Hans




> ---
>  drivers/platform/x86/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index a7cfcbf92432..c61860db66ed 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1202,7 +1202,7 @@ static int wmi_notify_device(struct device *dev, void *data)
>  	}
> 
>  	acpi_bus_generate_netlink_event(wblock->acpi_device->pnp.device_class,
> -					dev_name(&wblock->dev.dev), *event, 0);
> +					acpi_dev_name(wblock->acpi_device), *event, 0);
> 
>  	return -EBUSY;
>  }
> --
> 2.39.2
> 



Return-Path: <platform-driver-x86+bounces-2617-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893EF89BF57
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 14:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 441BD2816CD
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 12:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4418C6EB72;
	Mon,  8 Apr 2024 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbTncOhE"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A8524AF
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580364; cv=none; b=k1fzjIjkIw0qGAowkxHcAydmyPa+yY1x0LVAQ58G7tKvdp/7f9UR0oAyHUygdwp7Y3c8T4X7BmIsLGL805hyd/qZOr51Q4sA39vlENOb4iMbXdtzVZS/m31Y7KjyYWDlwVvzROTrrRygyfr0DMcVD8NesXVz50/goN9XbvfYiZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580364; c=relaxed/simple;
	bh=4f3UaY0SQf8Ijcwk4KQ6V3GH86m2/eSeNdDdmV3Y56c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5t9tmbK8qZV9uquHN7LBdZ8oadsEjs2wuUYUpvdNyN3XRLZ/i5NzmRwwYCFRGnb0VHflLD95IDuvDqcaLCL/XqVPHjCSYNSuG/4Zwie4FDsO8xmUXzNQg9Ieep2iyASXVgGqpl1rfG4CNp7U5XNDspV0U5iZUVrEk1IsuzZTPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QbTncOhE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712580361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa0dQJ1NfzkDJ58Nm3G99Pr4wnpg2bxLGHQnIfyvxPo=;
	b=QbTncOhERZR3XjF8F1mLo3VNHfZZ4R10alIESLtO672mk9QP2pSkP/fK18Hr3bsztdyQql
	wRHx9wS71VnS/6sCqluCOHwu/ggwxgTXyoRpbWl25wX+kiVLTbB83SvD06eMi+PZqQ0Og8
	wP83X/zcVidbYYZQvA2oBzMqYvBTX3M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-RW0X9D7VMHak-n8jcaZykQ-1; Mon, 08 Apr 2024 08:46:00 -0400
X-MC-Unique: RW0X9D7VMHak-n8jcaZykQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a5190b1453fso246032366b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 05:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712580359; x=1713185159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa0dQJ1NfzkDJ58Nm3G99Pr4wnpg2bxLGHQnIfyvxPo=;
        b=bkm4a4wyZEN06ueperfkdVjf8cSAy8rXjGtwHilSsEjVNXEXyWIHNUtPElVrs/J415
         5LDwicnebFIw/VMZod5qxX//qLii6trMGxqlv1QlMFm0eqba0S88MJRcXITfClHrmvi/
         OfaDJQx59tmX4TaiJHiRu8aTbzn6k7Jg7VEXY3WH8Rhei43wR9kE0gy5OL677uJMhhes
         94eX9M7NdTMk9CraGNjT5hMn8cOq3eLDZhlZNqTMKEIPMPbq5xEiiYGP37clanCiF/z8
         jpMETJJkZgB2o6dgKNXO7gUlpm4qhutYIrcY7AJ9lA7gFYGUDNSlW0r30prwCEpXY+oi
         3jkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhuviH8t1zlBbXyI64A+cyutYLoLeTA7z/ojmsyxn2ww5IwXIWZmaCV92sksn/0qO5abOafK6dPNZrCJ9dkm81wADhYn9T35RcT6ijvxqnf0kCGg==
X-Gm-Message-State: AOJu0YzBLBfu10S10f21wHEAet37UF14aKyOUkj+hpnYfXZIxoEV/eIH
	RXp7jh1aPX5wrg2BsDurhjl7Ed1CjdJ5bKhrmsqyvOAuVifStbIQU5sE2Jf0nS3CCqJJj6MDICA
	7RgitB7KAMmiTFqSdkNp0bKFvB+Y+MeoYopZFvOPJA4tZsW+TMw1uWceMuhqE+ffSvIdPM9w=
X-Received: by 2002:a17:907:3da8:b0:a51:dc1f:a44b with SMTP id he40-20020a1709073da800b00a51dc1fa44bmr1478656ejc.29.1712580359453;
        Mon, 08 Apr 2024 05:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEkiynBLyuS7R8ea5n9gdwWhf7wBEZd2/uGpnUdhbhQ06ApoM00sS+9w3QyJnVOqX1gm8maA==
X-Received: by 2002:a17:907:3da8:b0:a51:dc1f:a44b with SMTP id he40-20020a1709073da800b00a51dc1fa44bmr1478641ejc.29.1712580359092;
        Mon, 08 Apr 2024 05:45:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ag13-20020a1709069a8d00b00a51ab065bf0sm3955072ejc.202.2024.04.08.05.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 05:45:58 -0700 (PDT)
Message-ID: <027b14ff-a6fe-456c-b3b5-187fd435ac3f@redhat.com>
Date: Mon, 8 Apr 2024 14:45:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br, dmitry.torokhov@gmail.com,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com, peter.hutterer@redhat.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/24/24 10:07 PM, Mark Pearson wrote:
> Add support for new input events on Lenovo laptops that need exporting to
> user space.
> 
> Lenovo trackpoints are adding the ability to generate a doubletap event.
> Add a new keycode to allow this to be used by userspace.
> 
> Lenovo support is using FN+N with Windows to collect needed details for
> support cases. Add a keycode so that we'll be able to provide similar
> support on Linux.
> 
> Suggested-by: Peter Hutterer <peter.hutterer@redhat.com>
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Dmitry, can I have your ack for merging this change through the pdx86
tree (since the first driver using these is a pdx86 driver) ?

Regards,

Hans




> ---
>  include/uapi/linux/input-event-codes.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 03edf2ccdf6c..bd3baca95749 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -686,6 +686,8 @@
>  #define KEY_SIDEVU_SONAR               0x287
>  #define KEY_NAV_INFO                   0x288
>  #define KEY_BRIGHTNESS_MENU            0x289
> +#define KEY_DOUBLECLICK                0x28a
> +#define KEY_SYS_DEBUG_INFO             0x28b
>  
>  /*
>   * Some keyboards have keys which do not have a defined meaning, these keys



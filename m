Return-Path: <platform-driver-x86+bounces-720-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64415821BB6
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Jan 2024 13:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B57A1C21E97
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Jan 2024 12:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D56AEED4;
	Tue,  2 Jan 2024 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hX+U5Prb"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A61F9FA
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704199066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTOeUCtDb5GVXFc7f9ZKRWPTysZoCC8la1hp9HQwt0I=;
	b=hX+U5PrbBxhB+SEmOUtn17B1qYpZgnhY9L/BkW2d6eOo2zlsY5YcIKKYCu1VpcpBe7WcLq
	N4s7yeG5MNzc57a7lqSYsLe8JQRElwYL4t1PRgWOw3qq26FFjhK2rp2c/snRKXI2V2UMS3
	P6d1R1eAKLDuWwmvj6WYkwPyE9MKW1E=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-AArM2RHsPl6UasV0S6Rx3A-1; Tue, 02 Jan 2024 07:37:40 -0500
X-MC-Unique: AArM2RHsPl6UasV0S6Rx3A-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50e7f7178a2so4249364e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704199058; x=1704803858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTOeUCtDb5GVXFc7f9ZKRWPTysZoCC8la1hp9HQwt0I=;
        b=eMThQzCVywxkjbeMGvz/BbtpHfMYr1Vl8FfhI5p6dO/C2Z8l/eAiYuHFOKYvmZKpNZ
         8hKrTCgHWnDmfhzP2iNvgn9f4NHb4oznhS2n4plDYase5b7wruHn7ggFskMg9KScrGdu
         8r/JZr4ameDsTOcEsrfV8Xpp5vkcxYqaTjLEI0irRqqEaKU+GJz+Wy7nFIVhiP2fH+Av
         Mfe8xWtD921fxhm2rckim9A3JmGM5LShC6kIsgdsVDHuDIN5zViswinQItwG3NsMa/85
         fft2N1TbTK8hXBA1IVjCDrZjqYte+8zo5xCWZrA3x6nePuKEM5qHTq4PSXaV1WibSNqn
         L1Tw==
X-Gm-Message-State: AOJu0Yyd7sIPp4IcsuepiSDTlv3ftPmmga0UN9ITlEC8iIFjf+vv+SZd
	BLVTH5h2jXRRxY8SZO+5fa/Y1Ta2wl/pO02YipEM4rn9ShMhLa7eUczJ8DY2VeHRNUDCP7tsg/v
	DgKO/hw4bEvfd9Q6eNGoGpHgJK13GKMa8rQ4hXaTfpucU6Xv0Kg==
X-Received: by 2002:a05:6512:158d:b0:50e:6b4f:9809 with SMTP id bp13-20020a056512158d00b0050e6b4f9809mr7894826lfb.20.1704199058779;
        Tue, 02 Jan 2024 04:37:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaOrzDnMM39k8oG/LEnKD1O5kbB1x6EzMJtPdL+gUeRD4kNmp1BOet/oWi4/JjhhlRJRftzg==
X-Received: by 2002:a05:6512:158d:b0:50e:6b4f:9809 with SMTP id bp13-20020a056512158d00b0050e6b4f9809mr7894823lfb.20.1704199058489;
        Tue, 02 Jan 2024 04:37:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fd23-20020a056402389700b00553a86b7821sm15857865edb.74.2024.01.02.04.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:37:38 -0800 (PST)
Message-ID: <14940411-0da9-45bf-ba88-d3bd3b3c643f@redhat.com>
Date: Tue, 2 Jan 2024 13:37:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: wmi: linux/wmi.h: fix Excess kernel-doc
 description warning
Content-Language: en-US, nl
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
References: <20231223194321.23084-1-rdunlap@infradead.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223194321.23084-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/23/23 20:43, Randy Dunlap wrote:
> Remove the "private:" comment to prevent the kernel-doc warning:
> 
> include/linux/wmi.h:27: warning: Excess struct member 'setable' description in 'wmi_device'
> 
> Either a struct member is documented (via kernel-doc) or it's private,
> but not both.
> 
> Fixes: b4cc979588ee ("platform/x86: wmi: Add kernel doc comments")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Armin Wolf <W_Armin@gmx.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> ---
> v2: add Fixes: tag and Rev-by: Armin


Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
>  include/linux/wmi.h |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff -- a/include/linux/wmi.h b/include/linux/wmi.h
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -21,8 +21,6 @@
>   */
>  struct wmi_device {
>  	struct device dev;
> -
> -	/* private: used by the WMI driver core */
>  	bool setable;
>  };
>  
> 



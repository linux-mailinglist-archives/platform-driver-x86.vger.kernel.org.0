Return-Path: <platform-driver-x86+bounces-721-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2803B821BB7
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Jan 2024 13:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC30C282F9B
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Jan 2024 12:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF79BF4FC;
	Tue,  2 Jan 2024 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/sl2av8"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C6F4EE
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704199074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7xPxzjrOoJD8UESraYiDXJmUmISp7no6VWqp6JayLU=;
	b=R/sl2av8S7Aj5BJ5evMeM2s/u4QMZY2r2CglIYrNW5ZTKxnSwWB4dCsL/qxVOl38zepAgS
	nS2FS7/g/xZspGPim7tLax3bkmjHb3sD4BcI3XF2xx2O4Xgw+gDItB3tS68ThqApKt2K8F
	3wv7tBqI0z9lVgTjnoaBsM24qPLldBY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-oi6zB2ecPOaBMLnMeZ2iGw-1; Tue, 02 Jan 2024 07:37:53 -0500
X-MC-Unique: oi6zB2ecPOaBMLnMeZ2iGw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ccdd4dc5b3so32513111fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704199071; x=1704803871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7xPxzjrOoJD8UESraYiDXJmUmISp7no6VWqp6JayLU=;
        b=q80JaIAM0kXsshdICbXSiyOvOpUwYsZpWmi2RBnSdINuwL07+HPZ52+ku3Bo1mWgF7
         Hx5GFwrfNoizIJ373eAcIIKv73V86QjioiWvioN4cJsc14LibFzHIl7npP2opV8Rg6VY
         /jwshI+87x55pLU8z7KKprilJ4jo1HeQ3r4dwuyH0FOaNAQmCX1e/qgWoZXOBSCMysIX
         CGuryCJetYEt+zZXxGvUTOvKfj0MSl3wM5pPC7e7g5xm7qhYOqZ3Podgcx/Etoc+x7ax
         XaW8ok5ZA7Dk5qDaAfqm12AjF3PcLSNB+kx2UG8COHrZv9zImctKU0Ji5RW5oEfBSNht
         ML0w==
X-Gm-Message-State: AOJu0Yx2b2MY4U78gYjhWYqV5D3ERGgXxpPRTS9P41F5LVvuY5Kf7gDq
	aDqucqy5SW0rcWdHr8hfqzgY6+WVqwjAeYXM5EhaOZ2NOpGh7ZwLLyxHLWcZuDTg17Ahhl+kMSj
	GyTyf8EsWwbonUss+5kYgcI+JhWV13bmH6gt0DWwvNQ==
X-Received: by 2002:a2e:808d:0:b0:2cc:f31b:56fd with SMTP id i13-20020a2e808d000000b002ccf31b56fdmr2610757ljg.58.1704199071656;
        Tue, 02 Jan 2024 04:37:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNr4N9l2l/GB+SNenOQnbmzLKTMOdrkbED31ko3r5q4Z8RlORZAlPVns3j2noxNMBrD9kcWQ==
X-Received: by 2002:a2e:808d:0:b0:2cc:f31b:56fd with SMTP id i13-20020a2e808d000000b002ccf31b56fdmr2610754ljg.58.1704199071427;
        Tue, 02 Jan 2024 04:37:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fd23-20020a056402389700b00553a86b7821sm15857865edb.74.2024.01.02.04.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:37:51 -0800 (PST)
Message-ID: <1179c828-d0c2-4e04-9a79-767754bb3425@redhat.com>
Date: Tue, 2 Jan 2024 13:37:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Return directly after a failed
 apmf_if_call() in apmf_sbios_heartbeat_notify()
Content-Language: en-US, nl
To: Markus Elfring <Markus.Elfring@web.de>,
 platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <362ee824-fc53-4e19-9529-8b621657635b@web.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <362ee824-fc53-4e19-9529-8b621657635b@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/28/23 09:42, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 28 Dec 2023 09:30:54 +0100
> 
> The kfree() function was called in one case by
> the apmf_sbios_heartbeat_notify() function during error handling
> even if the passed variable contained a null pointer.
> This issue was detected by using the Coccinelle software.
> 
> * Thus return directly after a call of the function “apmf_if_call” failed
>   at the beginning.
> 
> * Delete the label “out” which became unnecessary with this refactoring.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

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



> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 4ec7957eb707..eb367e38c5ab 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -135,11 +135,9 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
>  	dev_dbg(dev->dev, "Sending heartbeat to SBIOS\n");
>  	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT, NULL);
>  	if (!info)
> -		goto out;
> +		return;
> 
>  	schedule_delayed_work(&dev->heart_beat, msecs_to_jiffies(dev->hb_interval * 1000));
> -
> -out:
>  	kfree(info);
>  }
> 
> --
> 2.43.0
> 
> 



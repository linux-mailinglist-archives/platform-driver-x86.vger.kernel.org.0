Return-Path: <platform-driver-x86+bounces-4048-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 910E291486B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Jun 2024 13:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1AB41C222BE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Jun 2024 11:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E12413B294;
	Mon, 24 Jun 2024 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O9nIxpkH"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE32A13AA2D
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228050; cv=none; b=imFjThYjnn5pwAgm8SwedB6lWPN8tUk9qNMFCNkboHENg9pBoVCproDELmh+vdvXlbBbibvoHiIIw2YWzgKRmh3YGeb0wTiNLxbwgDkD2rS+VhmN660be6ZhK4VSre9V/RXhiLcd57W+3qQ/Vhfsac/vG7xOtTZNRZa1VywgVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228050; c=relaxed/simple;
	bh=LaJcfNfEkE5xFvXOrQDn6HmxI8zIWZaDy5jJkvJ8OtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIt3jraRBwpSAvQl70PHzdjfIQJr9EsAfUBatPaSZ9ZQzqXzFoMjcMLLg28wRKAgTwWU0klcPMhk+NJs9mk/hoYL7vyv7I9Yv5xfotO3H5ZnNUVTKqQvgpeXmGwydG5aYvJBcpz3A1OAinzhrcsIaU+nhoR8OqTroUaXTSFQo6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O9nIxpkH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SyS9UuWlSuhl3v5J/At0OYlc0sWMnApISqtSSU2EeV8=;
	b=O9nIxpkHajvtLAT/20aDPRzWymsfsV/oPSqFXCzRgDo1OI5zXBvyE1QisD00vv6QPNmcbY
	uhEdnWMsHa/TnqF0xf47MkEORULctTVYD/llBbZdlk9BDG0rsuLaFkjpwqhzqanemN9h/1
	wFqR5GqOnNf9dggJzVazBRuydu+VPfY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-Jel75QykMLOH_7gpi5kHFQ-1; Mon, 24 Jun 2024 07:20:45 -0400
X-MC-Unique: Jel75QykMLOH_7gpi5kHFQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57a524f1f7eso1231011a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 04:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228044; x=1719832844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyS9UuWlSuhl3v5J/At0OYlc0sWMnApISqtSSU2EeV8=;
        b=GVVEr97nZ4dHyc/twljU8tLKRMIV/0o18CUXfhlzpUIOVsUo2uDj/bnDibKx8fhZ7l
         6MONid0z/JgXxdOdxYk7B4XgIvlDtElZE4GgPGDMWpY2vQdezfqYDg5Lrw0oOPALGKiJ
         CFal9J1+zspksqVNOkLgZEeB7kiX0F8PXeIpbixsgc220kP6BWGpdHPL1vpZVDlx7snK
         2cLkjtbbgZI1ZFXuumIX5U2zGhNhqfHIVn4NKeUrS2rB9l/nCiZdygu4Um9tgwcpBk8Y
         DQD7wNidBZBsjJMNGgHve+80vq4uqiFc0rkZS1diu2fxRlK8z60WXyygzVCwbiJar+Q0
         zhzQ==
X-Gm-Message-State: AOJu0YxeyTP25bJvMjAnKhWALEY7vwjIPu4JQOkc7tnZqvkJ9szJ/Ktm
	gOLMO52U29sofvxNKmeV+VPqg6TZs9RR4lhYXSO2GrqSNoWe1iXZKrUpJZp+BuERyPbWWcQeG7+
	qNVOVD06kdd10gC2Jg0LLJ6m/xMcY/5ZR0T21TpXjNvnAg8fcmyN69KZG2MrpVTmW0OYgq6JsvK
	rWNUc=
X-Received: by 2002:a50:a6dd:0:b0:57d:2c9:6494 with SMTP id 4fb4d7f45d1cf-57d4bd67579mr2602887a12.10.1719228044387;
        Mon, 24 Jun 2024 04:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb+hCCh2C079aYaSOs5wClkvC6uFNqnHx93fwnd8yLsB1iy+iw2NHWkBjLsaFFhnIAlLPANw==
X-Received: by 2002:a50:a6dd:0:b0:57d:2c9:6494 with SMTP id 4fb4d7f45d1cf-57d4bd67579mr2602865a12.10.1719228043934;
        Mon, 24 Jun 2024 04:20:43 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30563031sm4584404a12.86.2024.06.24.04.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:20:43 -0700 (PDT)
Message-ID: <2b3e519e-10ab-4785-9a3a-6454b18c169d@redhat.com>
Date: Mon, 24 Jun 2024 13:20:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/mellanox: nvsw-sn2201: Add check for
 platform_device_add_resources
To: Chen Ni <nichen@iscas.ac.cn>, ilpo.jarvinen@linux.intel.com,
 vadimp@nvidia.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240605032745.2916183-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240605032745.2916183-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/5/24 5:27 AM, Chen Ni wrote:
> Add check for the return value of platform_device_add_resources() and
> return the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/mellanox/nvsw-sn2201.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
> index 3ef655591424..abe7be602f84 100644
> --- a/drivers/platform/mellanox/nvsw-sn2201.c
> +++ b/drivers/platform/mellanox/nvsw-sn2201.c
> @@ -1198,6 +1198,7 @@ static int nvsw_sn2201_config_pre_init(struct nvsw_sn2201 *nvsw_sn2201)
>  static int nvsw_sn2201_probe(struct platform_device *pdev)
>  {
>  	struct nvsw_sn2201 *nvsw_sn2201;
> +	int ret;
>  
>  	nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
>  	if (!nvsw_sn2201)
> @@ -1205,8 +1206,10 @@ static int nvsw_sn2201_probe(struct platform_device *pdev)
>  
>  	nvsw_sn2201->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, nvsw_sn2201);
> -	platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
> +	ret = platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
>  				      ARRAY_SIZE(nvsw_sn2201_lpc_io_resources));
> +	if (ret)
> +		return ret;
>  
>  	nvsw_sn2201->main_mux_deferred_nr = NVSW_SN2201_MAIN_MUX_DEFER_NR;
>  	nvsw_sn2201->main_mux_devs = nvsw_sn2201_main_mux_brdinfo;



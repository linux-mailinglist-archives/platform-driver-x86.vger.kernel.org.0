Return-Path: <platform-driver-x86+bounces-2561-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A2898E11
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Apr 2024 20:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82EF01F25B1C
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Apr 2024 18:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C65131BDB;
	Thu,  4 Apr 2024 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhNsoWfJ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBAF1327FD
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Apr 2024 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712255765; cv=none; b=uRqzB2GSj66UTWlRxWb3VYiFowU7Noh3TMd/6M56DMUgP66NJHEbyQPO4TphXBUz0oUegD/MThiXHWVv0xdkEBKhzDrht3cm8tV3+qmmxsiexvLJsZi7DCKdPV4g4FZ9s83LaRradvaqhnmaTOfbJdcmECHdXBnPC4B86q3g/xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712255765; c=relaxed/simple;
	bh=YVSg+A+c0G/QBzGTi+zsoSF49xeNhM8/ZpTf0D52olQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkQgb9IotoImiMgCtQ8lLBsvpgG7yqK50SLsPh8v2mz6NPabB8XO9oS1f1XoU3xH/EB6kveD/iiXKP8tjAc/FRNf3MTLJ6gRXSPW1gR3Hv6WmkVu6RbVbWCmkasLHxesnfrPPxvOMBOxqcoBEq3CfUpeIPZzzlFlE1wX3T1rkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhNsoWfJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712255761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPrsf2vDVW83MpKZ+078E5Z+3QsHXZHitSwEpFix1qI=;
	b=BhNsoWfJBCJZV0c2R5724B3whxQ1QXDErnRa319b9utirb0WZnGPmDmWwgGMKJabCuOlaL
	Q9g711bTc1VBxgi9JsBf+jnR5lcqATUc2IifqeLwWuvVt6TNvas4jkUNkSl9D9UmM/d1tz
	Lxgr03AYNGMBhA4HyWVb1SJ5BXU0N6Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-MCd_87XSMQG6aOURJuGjrA-1; Thu, 04 Apr 2024 14:36:00 -0400
X-MC-Unique: MCd_87XSMQG6aOURJuGjrA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4dfdbdaf06so75149766b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Apr 2024 11:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712255759; x=1712860559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPrsf2vDVW83MpKZ+078E5Z+3QsHXZHitSwEpFix1qI=;
        b=c7vpNVGUphA8VMso/zM/RDP7WLIMTvw9NE4eF+OkVMVOhG132WfjuNs0SNQ6zOWz5L
         PgNUDVuTHBmcY66Zx7mLQe0bI7yDyzpU2YVZPjWLYMaFH+o7AxpmGuN9fWCpPIw7I5OH
         KqoIlptCxyJtnq7ygUnQue9X/nCUGQqXPenV3kYT/KR1flezClf/1Na/nKUtYqGc6Oj6
         eCZ1LwzRk2RZ2c8ALeFSRXPBsiBA000V+Z4qlr1+X3awDWVEbZfafH0pQWdJ4W+4ainJ
         YDtmFDKlZ81gtDtoBTsBVfJExAVrybttgQe5BkGq6OdXEQv36bLrhHc959DpYt+TLKa4
         Va9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUG/kuxbgtoBLvJkF91iFiqtlBL6zbl/DnUZpqtAN4VNUFEO9j4la2NRgZYZcGzX8AYdBf1Wv2oNDWsWygUqkltO2qJ8j0rtqxY98juxUXH2sHww==
X-Gm-Message-State: AOJu0YyZIDJ/3vgmMBdgfWx5xkyHQwQrN0GWIe0krFvE7VyRVs29ErQ2
	1wUw+k4Z+ZsyK2V3hDa+1C0lJ+2U72VB/mCDSoYabnLKvnzuFFSPbLUH5Up1/AISWFOJISDu9wA
	ENSIkvbDXFs9Ny2JeRz5VsBSQSYG/4Grmjp0dTEtxFCV6NncihGBQ5NOSbjAQnFcWcTr9r2XNWO
	nfzUg=
X-Received: by 2002:a17:906:1949:b0:a46:74fe:904f with SMTP id b9-20020a170906194900b00a4674fe904fmr2067509eje.26.1712255758866;
        Thu, 04 Apr 2024 11:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa+ZuOvVws59lFzI3y5YPXmbug3i3lf8SJUvio1Ht/zAnke4XGNg1Tstmua6dOpJA/6Hr9SQ==
X-Received: by 2002:a17:906:1949:b0:a46:74fe:904f with SMTP id b9-20020a170906194900b00a4674fe904fmr2067500eje.26.1712255758511;
        Thu, 04 Apr 2024 11:35:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i25-20020a17090639d900b00a4df5e48d11sm9367831eje.72.2024.04.04.11.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 11:35:58 -0700 (PDT)
Message-ID: <919c6143-79be-4adf-8f51-53ebcc454773@redhat.com>
Date: Thu, 4 Apr 2024 20:35:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/intel/hid: Don't wake on 5-button
 releases
To: David McFarland <corngood@gmail.com>
Cc: linux-pm@vger.kernel.org, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Enrik Berkhan <Enrik.Berkhan@inka.de>
References: <20240318191153.6978-1-corngood@gmail.com>
 <20240318191153.6978-2-corngood@gmail.com>
 <ed891842-a86f-4ca8-af29-f7921a259146@redhat.com>
 <878r1tpd6u.fsf_-_@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <878r1tpd6u.fsf_-_@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/4/24 1:41 PM, David McFarland wrote:
> If, for example, the power button is configured to suspend, holding it
> and releasing it after the machine has suspended, will wake the machine.
> 
> Also on some machines, power button release events are sent during
> hibernation, even if the button wasn't used to hibernate the machine.
> This causes hibernation to be aborted.
> 
> Fixes: 0c4cae1bc00d ("PM: hibernate: Avoid missing wakeup events during hibernation")
> Signed-off-by: David McFarland <corngood@gmail.com>
> Tested-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thank you, this version looks good to me.

Ilpo, can you pick this up as a bug-fix for the 6.9 cycle please?

Regards,

Hans



> ---
> v2: Added tags and fixed whitespace, as requested by Hans.
> 
>  drivers/platform/x86/intel/hid.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 7457ca2b27a6..9ffbdc988fe5 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -504,6 +504,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	struct platform_device *device = context;
>  	struct intel_hid_priv *priv = dev_get_drvdata(&device->dev);
>  	unsigned long long ev_index;
> +	struct key_entry *ke;
>  	int err;
>  
>  	/*
> @@ -545,11 +546,15 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  		if (event == 0xc0 || !priv->array)
>  			return;
>  
> -		if (!sparse_keymap_entry_from_scancode(priv->array, event)) {
> +		ke = sparse_keymap_entry_from_scancode(priv->array, event);
> +		if (!ke) {
>  			dev_info(&device->dev, "unknown event 0x%x\n", event);
>  			return;
>  		}
>  
> +		if (ke->type == KE_IGNORE)
> +			return;
> +
>  wakeup:
>  		pm_wakeup_hard_event(&device->dev);
>  



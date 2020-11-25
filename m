Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8828B2C4663
	for <lists+platform-driver-x86@lfdr.de>; Wed, 25 Nov 2020 18:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730585AbgKYRFP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 25 Nov 2020 12:05:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36148 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730293AbgKYRFO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 12:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606323913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S2YiWAjtkV6W/819w3VvfpBkbVrqf/nUdJ8hJ0IQwHg=;
        b=FoEVPWETYHzxrxQvjx83fwrGHs+Gyennt7tTcPGCtvrObzdxzPJuk+mxyRfBRWDvCMaP6q
        aLUlL0Y3dulrLWHIWOYCBp2fN5OQhuVqSusfEDNnThVPw0RTiysv+nw4udH4xJs59/GrIs
        Lgp2MsO8suRnUZpY0Q/pD17R8q5HVtg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-8yf_O7ZaPmiazGw073RFJQ-1; Wed, 25 Nov 2020 12:05:11 -0500
X-MC-Unique: 8yf_O7ZaPmiazGw073RFJQ-1
Received: by mail-ej1-f71.google.com with SMTP id gx12so967307ejb.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 09:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S2YiWAjtkV6W/819w3VvfpBkbVrqf/nUdJ8hJ0IQwHg=;
        b=o9n9Sg2iijox4dHdrZJYrUUpoO+AYJc9jVWazyNRMgdx+t0w38gjlwJ4KISVPXCFMC
         4bqUAtmI+uYxFi3U8znqAMyE8D+daAQpoFPfU7TpBFGvxlbIMK8xz6DOHYYqSJve9yTP
         /gFy5bxjT9tF9TZTWDuOg5PgXXcv2U+zVwpPs8UWnmt78FmxPopKUxg/UsvGK4g0doDm
         DaloKGnC6mUsK/kZmIu7m2xrS+Dm1aJ4Fx9Ik/+s8RViyC9YiVQEy1k48dZeItXpzlr1
         GITp2jdSCTLUBx/h+QhZeH2JzFqnMcMlv8EnjKZKJ0b8RQWjQ0UYqBxgULICYSxNgD6X
         C15w==
X-Gm-Message-State: AOAM531A4yNciFgZnjparjFJvCPqzysU7QxDJcswbqXfR5+ld7+FLJoD
        xjQM50Cj+TyfQnWVK71+RUPGbmjWis1Dne9SpAvZJnZLLgjAqIg6DuAA/pRmz7URiq9l/RPD/zZ
        F3ibbNQ1dCFwfvgLJx4ekwmYmfTBNIjvxTw==
X-Received: by 2002:a05:6402:b35:: with SMTP id bo21mr4424000edb.52.1606323909966;
        Wed, 25 Nov 2020 09:05:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/TsKMgYWbhR/wlSWjoHAwLH+WNXGsilWP/PO44bdE4caZvjScUkuVuIRvjD9nSFt32NBaYw==
X-Received: by 2002:a05:6402:b35:: with SMTP id bo21mr4423974edb.52.1606323909766;
        Wed, 25 Nov 2020 09:05:09 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id gf6sm1602911ejb.80.2020.11.25.09.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 09:05:08 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-smbios-base: Fix error return code in
 dell_smbios_init
To:     Qinglang Miao <miaoqinglang@huawei.com>,
        Mark Gross <mgross@linux.intel.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201125065032.154125-1-miaoqinglang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9f86ac03-1c90-e6b6-4f7d-e9584a19e46d@redhat.com>
Date:   Wed, 25 Nov 2020 18:05:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125065032.154125-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

+Cc Mario

On 11/25/20 7:50 AM, Qinglang Miao wrote:
> Fix to return the error code -ENODEV when fails to init wmi and
> smm.
> 
> Fixes: 41e36f2f85af ("platform/x86: dell-smbios: Link all dell-smbios-* modules together")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Mario, this seems like a trivial fix to me, but I'm not 100% sure, any comments on this?

Regards,

Hans


> ---
>  drivers/platform/x86/dell-smbios-base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform/x86/dell-smbios-base.c
> index 2e2cd5659..3a1dbf199 100644
> --- a/drivers/platform/x86/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell-smbios-base.c
> @@ -594,6 +594,7 @@ static int __init dell_smbios_init(void)
>  	if (wmi && smm) {
>  		pr_err("No SMBIOS backends available (wmi: %d, smm: %d)\n",
>  			wmi, smm);
> +		ret = -ENODEV;
>  		goto fail_create_group;
>  	}
>  
> 


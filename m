Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EED84A8294
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Feb 2022 11:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241262AbiBCKpC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Feb 2022 05:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23908 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234388AbiBCKpB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 05:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643885101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6jbdwerPehMJZgP+utUUo4nFfSR4t23J67pZxvwQ5qI=;
        b=F9cNS0nonnU0YzTXQt6pyyld+UMD8ZVB/Bh9JH8NhPrgYk42k7U0LjBY1vZ1vUKEKNMS0o
        FgUJ/RYIWToaf/skQzIWFzf5iYlnapkJysAB+jlmItd1ezrAcflvP/b0Ak20a8BKQPhJSM
        JNS+lYqpIbetQ3RGsME6IVwAL8/wNjw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-nB5gU9y4OOusysiNNRdCHw-1; Thu, 03 Feb 2022 05:44:59 -0500
X-MC-Unique: nB5gU9y4OOusysiNNRdCHw-1
Received: by mail-ej1-f72.google.com with SMTP id rl11-20020a170907216b00b006b73a611c1aso972830ejb.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Feb 2022 02:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6jbdwerPehMJZgP+utUUo4nFfSR4t23J67pZxvwQ5qI=;
        b=2KIBMODbvoncoBq8vR3J4hAGWPGyca4DDX90Cf57PqVYMNJiovAzU6hVMshiKSWmEH
         OagN8qHq1k9Tunj25PTXQ3Fk1Fs0XS2JOIDTVj7Pr0M6/pXsQ0Xx0gaIYI+RIKH2LUfl
         tefWPwbpdipPE2qDAzH6HMJLTfvL6KmjYwi/mKmnjSwJayq1VQRAtAFb9YRi5Xn6GYjT
         IPd2p11jKB1WgxN3t3/gnqXzFrYhrlb3I8RMKQl3gkabhvolajgGXHrybf3DsByLkQnG
         yyuaQRajBUr5d2iGzPTB1OPGVHlF7nTfrWaHfLTW3enG8GZER+7zJqo6oseMxqblfMpc
         BLxw==
X-Gm-Message-State: AOAM5326LFl5jmnP56VljpjYNP5Vl21zcVH79lngVeB+mKXSCowuM4Ls
        kTEI+brpUavW/Y5DIGNXEvlgdxV6FwqafSZkzsHlU755gc5J44E4xj4FbrpifhGWr6AmUyrTgwE
        c1fUA4on0ixSo/CStSdOWH+25U8antBKG1Q==
X-Received: by 2002:a05:6402:348a:: with SMTP id v10mr34614491edc.249.1643885098352;
        Thu, 03 Feb 2022 02:44:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziGnZ4JGjZ6FxAD97378swmhF6EsF+lw6m58rqHfjOByG6S7DBP89wcwicAJQgVUaAaJkrQw==
X-Received: by 2002:a05:6402:348a:: with SMTP id v10mr34614476edc.249.1643885098152;
        Thu, 03 Feb 2022 02:44:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c14sm22295393edy.66.2022.02.03.02.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 02:44:57 -0800 (PST)
Message-ID: <155858a5-1736-caee-d44d-b56e54797664@redhat.com>
Date:   Thu, 3 Feb 2022 11:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] surface: surface3-wmi: Simplify resource management
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <8b1a6d05036d5d9527241b2345482b369331ce5c.1643531799.git.christophe.jaillet@wanadoo.fr>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8b1a6d05036d5d9527241b2345482b369331ce5c.1643531799.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/30/22 09:36, Christophe JAILLET wrote:
> 's3_wmi.input' is a managed resource, so there should be no need to free it
> explicitly.
> 
> Moreover, 's3_wmi' is a global variable. 's3_wmi.input' should be NULL
> when this error handling path is executed, because it has not been
> assigned yet.
> 
> All this is puzzling. So simplify it and remove a few lines of code to have
> it be more straightforward.
> 
> Fixes: 3dda3b3798f9 ("platform/x86: Add custom surface3 platform device for controlling LID")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

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
> Compile tested only
> ---
>  drivers/platform/surface/surface3-wmi.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/surface/surface3-wmi.c
> index 09ac9cfc40d8..b9a4b2d81f4b 100644
> --- a/drivers/platform/surface/surface3-wmi.c
> +++ b/drivers/platform/surface/surface3-wmi.c
> @@ -190,14 +190,11 @@ static int s3_wmi_create_and_register_input(struct platform_device *pdev)
>  
>  	error = input_register_device(input);
>  	if (error)
> -		goto out_err;
> +		return error;
>  
>  	s3_wmi.input = input;
>  
>  	return 0;
> - out_err:
> -	input_free_device(s3_wmi.input);
> -	return error;
>  }
>  
>  static int __init s3_wmi_probe(struct platform_device *pdev)
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203DF72BE27
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Jun 2023 12:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbjFLKBw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Jun 2023 06:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbjFLKAC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 06:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26506596
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686562969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y7baxgHaWU6fvq7DbxvEnGFwo36Yr6Dy2f1E8mkGpkM=;
        b=ZtxFpyBP1kcP55tAzwAiknkvEKvTTVvQEhAFppD3QFzdr5iN3ZZUzFwA9aV88OfoTctqcs
        dqCkMegRu28h169oeMJ4pUl7bdNTcOw9Ys8COxw6XVYVqLWeOH/uXR33X0Hk/OpCgwpOuC
        V5HBhxqwNn3BGDqdwopplqbaMNC30Es=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-6wXgvxMxMXyy1nkJd8HQTQ-1; Mon, 12 Jun 2023 05:42:47 -0400
X-MC-Unique: 6wXgvxMxMXyy1nkJd8HQTQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5142da822cbso4187586a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 02:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562966; x=1689154966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7baxgHaWU6fvq7DbxvEnGFwo36Yr6Dy2f1E8mkGpkM=;
        b=V3DIlQMjb/EO9DV+4BfRl211nxhBQaxKnFwP3PDCQRWtmK0uzIUHd9aaGno6YiKcZv
         Wu8/0+A0VwQ6/kOlrAIW9UNOXT/d1qCZ7K5w9AEydqALKLVuM+E19NTWuU6NAl6VWIH6
         RP/FU3j1ZVJd5hCs5pmsBiomI5YMrXss4OXWqc6NMgof2ksr6JMgjXp/WQjjx9pE5ifU
         tNG7CskUYf821QFfh01Kf8H0XySoFx/LREgSinGt3Aewuqz0quOzmE9p9VXz5YSQ5nnL
         nY5VE3uNuAa5VLrEs8/nxQydgBNW0F3lCAFTSVqiEp0qKFuQFUcJWFTiEcpfuBPkA/7v
         tiMw==
X-Gm-Message-State: AC+VfDwQd5QyQdZORoMmoE/hOG8PMu8uG4z6cyQoj3fGRvAPpGoIoKH2
        8uCm64gZeTI61YdDXnVwki8LuOSz0WLpcvq4dzsAJrYJp+FP0HsiDH9B/977AUBp+mKSINLMix4
        l2JQNzcTsA8DNbcHzIX/7jUAO0ZTOJfAwnw==
X-Received: by 2002:aa7:cfc8:0:b0:510:db93:f034 with SMTP id r8-20020aa7cfc8000000b00510db93f034mr4316208edy.36.1686562966630;
        Mon, 12 Jun 2023 02:42:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6OhFwdsi3s6xCANMkN1DJYh2u9wRP26oyq7R4vvOGiZl/mLNUVBZ6wIYtTO/JTSlIxjeAkZA==
X-Received: by 2002:aa7:cfc8:0:b0:510:db93:f034 with SMTP id r8-20020aa7cfc8000000b00510db93f034mr4316198edy.36.1686562966380;
        Mon, 12 Jun 2023 02:42:46 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id w16-20020aa7da50000000b00516b072e036sm4820621eds.27.2023.06.12.02.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 02:42:45 -0700 (PDT)
Message-ID: <e5fce103-fbb6-0eb6-f6ff-4bfeadd89c90@redhat.com>
Date:   Mon, 12 Jun 2023 11:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 2/2] platform/x86/intel/pmc/mtl: Put devices in D3
 during resume
Content-Language: en-US
To:     "David E. Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     markgross@kernel.org, irenic.rajneesh@gmail.com,
        ilpo.jarvinen@linux.intel.com, xi.pardee@intel.com,
        rajvi.jingar@linux.intel.com
References: <20230607233849.239047-1-david.e.box@linux.intel.com>
 <20230607233849.239047-2-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230607233849.239047-2-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 6/8/23 01:38, David E. Box wrote:
> An earlier commit placed some driverless devices in D3 during boot so that
> they don't block package cstate entry on Meteor Lake. Also place these
> devices in D3 after resume from suspend.
> 
> Fixes: 336ba968d3e3 ("platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in D3")
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thank you for your patch.

There is one thing which has me worried here:

What about when real proper drivers show up for these blocks?

I know that at least some people will likely be using the out of tree IPU6 driver with the IPU block.

And having 2 different drivers poke at the hw state seems like a bad idea to me.

Maybe we can add a check if no driver is bound and only set the state to D3 if no driver is bound?

Regards,

Hans



> ---
> 
> V2 - rename mtl_fixup to mtl_d3_fixup. Call it from new mtl_resume
>      function, followed by the common resume. Suggested by Ilpo.
> 
>  drivers/platform/x86/intel/pmc/mtl.c | 29 ++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
> index e8cc156412ce..2b00ad9da621 100644
> --- a/drivers/platform/x86/intel/pmc/mtl.c
> +++ b/drivers/platform/x86/intel/pmc/mtl.c
> @@ -68,16 +68,29 @@ static void mtl_set_device_d3(unsigned int device)
>  	}
>  }
>  
> -void mtl_core_init(struct pmc_dev *pmcdev)
> +/*
> + * Set power state of select devices that do not have drivers to D3
> + * so that they do not block Package C entry.
> + */
> +static void mtl_d3_fixup(void)
>  {
> -	pmcdev->map = &mtl_reg_map;
> -	pmcdev->core_configure = mtl_core_configure;
> -
> -	/*
> -	 * Set power state of select devices that do not have drivers to D3
> -	 * so that they do not block Package C entry.
> -	 */
>  	mtl_set_device_d3(MTL_GNA_PCI_DEV);
>  	mtl_set_device_d3(MTL_IPU_PCI_DEV);
>  	mtl_set_device_d3(MTL_VPU_PCI_DEV);
>  }
> +
> +static int mtl_resume(struct pmc_dev *pmcdev)
> +{
> +	mtl_d3_fixup();
> +	return pmc_core_resume_common(pmcdev);
> +}
> +
> +void mtl_core_init(struct pmc_dev *pmcdev)
> +{
> +	pmcdev->map = &mtl_reg_map;
> +	pmcdev->core_configure = mtl_core_configure;
> +
> +	mtl_d3_fixup();
> +
> +	pmcdev->resume = mtl_resume;
> +}


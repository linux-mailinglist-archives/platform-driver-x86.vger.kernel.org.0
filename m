Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C9B52FD06
	for <lists+platform-driver-x86@lfdr.de>; Sat, 21 May 2022 15:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbiEUN6C (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 21 May 2022 09:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbiEUN6B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 May 2022 09:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 792103ED0D
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2022 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653141479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VZK+YUYUwBENuYY5kXzlGLAvRCjsLtMoaYckk8rPROg=;
        b=LYOnQ50hotUq2Y2fzuMIKVvU2aa4O8/MZ51ITgOzSGpXdY63OFvj7o9Wa5CKEs0OFGi2Dl
        Eo4lbjaOCTVphKb700d7P/+lpqRLn07PGlDKj2EJtM6v+a4EOfcnBAUu56RWkvlj7an69s
        kFAkQBBx0/3ZqGu+mkk6vB+MPzysBjw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-3Diz-WxsPnyH_3AQH8Hbhw-1; Sat, 21 May 2022 09:57:58 -0400
X-MC-Unique: 3Diz-WxsPnyH_3AQH8Hbhw-1
Received: by mail-ed1-f69.google.com with SMTP id n9-20020aa7d049000000b0042aab725949so7453004edo.23
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2022 06:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VZK+YUYUwBENuYY5kXzlGLAvRCjsLtMoaYckk8rPROg=;
        b=QHE+XLO+llr3iPSU6CRhOqIsnyISud/yf36ZgWPD5QA3b3NaPCRkpZw108bHk2jaPk
         6hIcSz77Tpj+Ir90KYJbAXWTpX/LLgoRerHJ5JZmjagMEgKJBlv6RVBupwg01B7H1fKh
         zwsiRvreJftFOC7HP8zQ02Cn7Ff3QhzXgiSyoA2odOKe+j0IaNrCqyWU5JzTZXDI+0Hn
         5sjYKdi7BD8SVyNUVrmD9/IA+pH17Exib/ued0vzNAx8faVGemK/95ufpyGV95/1ReGO
         hqlMj3fQt3XLOC/zB2AqE3brgenVe9kqvj1IaSsYUIqzHnQMGAycao0VhjMcsEwZs7mo
         yPpQ==
X-Gm-Message-State: AOAM530h9dTYJsJ6SM6OfdsEAGvxfCgle3tbsZL2QPLGofe62a0R28Ja
        AIpWHj52AnQPhVpCLL7eJN06uXEs+0AfsvVeT0nqJ/sdxFejotumy5bHzBRbu4x4IqEZp2mrmeS
        r01jCixFViVdmoaVwgrlwE4UEA3Kk5U+YjQ==
X-Received: by 2002:a17:907:a40a:b0:6f4:d84e:3e49 with SMTP id sg10-20020a170907a40a00b006f4d84e3e49mr12288166ejc.361.1653141476971;
        Sat, 21 May 2022 06:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGrv9gBi1Gmw0JxiQ5zD7Eiu6/bv6SJavGzRY33Kcg0TDR2BBST93mlIN3D0o9CtDxi43qdw==
X-Received: by 2002:a17:907:a40a:b0:6f4:d84e:3e49 with SMTP id sg10-20020a170907a40a00b006f4d84e3e49mr12288161ejc.361.1653141476792;
        Sat, 21 May 2022 06:57:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ej23-20020a056402369700b0042a2d9af0f8sm5727557edb.79.2022.05.21.06.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 06:57:56 -0700 (PDT)
Message-ID: <ed048405-9b22-d0eb-907a-dc00433db507@redhat.com>
Date:   Sat, 21 May 2022 15:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] x86/platform/uv: Dont use smp_processor_id while
 preemptable
Content-Language: en-US
To:     Mike Travis <mike.travis@hpe.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steve Wahl <steve.wahl@hpe.com>, x86@kernel.org
Cc:     Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20220520203755.266337-1-mike.travis@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220520203755.266337-1-mike.travis@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mike,

On 5/20/22 22:37, Mike Travis wrote:
> To avoid a "BUG: using smp_processor_id() in preemptible" debug
> warning message, disable preemption around use of the processor id.
> 
> Signed-off-by: Mike Travis <mike.travis@hpe.com>
> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
> Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>

A git blame shows that this code has been around for quite
a while; so presumably this should be backported to some of
the stable kernel series ?

Maybe add an appropriate Cc: stable tag with the range of
kernels this should be added to and/or add a Fixes: tag?

Regards,

Hans


> ---
>  arch/x86/platform/uv/uv_time.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/platform/uv/uv_time.c b/arch/x86/platform/uv/uv_time.c
> index 54663f3e00cb..094190814a28 100644
> --- a/arch/x86/platform/uv/uv_time.c
> +++ b/arch/x86/platform/uv/uv_time.c
> @@ -275,14 +275,17 @@ static int uv_rtc_unset_timer(int cpu, int force)
>   */
>  static u64 uv_read_rtc(struct clocksource *cs)
>  {
> -	unsigned long offset;
> +	unsigned long offset, time;
> +	unsigned int cpu = get_cpu();
>  
>  	if (uv_get_min_hub_revision_id() == 1)
>  		offset = 0;
>  	else
> -		offset = (uv_blade_processor_id() * L1_CACHE_BYTES) % PAGE_SIZE;
> +		offset = (uv_cpu_blade_processor_id(cpu) * L1_CACHE_BYTES) % PAGE_SIZE;
>  
> -	return (u64)uv_read_local_mmr(UVH_RTC | offset);
> +	time = (u64)uv_read_local_mmr(UVH_RTC | offset);
> +	put_cpu();
> +	return time;
>  }
>  
>  /*


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696515EC3AA
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Sep 2022 15:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbiI0NH3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 27 Sep 2022 09:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbiI0NH1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 09:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10C6181CC6
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664284043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6koU6MbMrhzOb886xS9cG3Txp+PaObCJEAkkPCTsllU=;
        b=JS5zxaU11QfFfeLSXYcvtE9JMZZEND70jMJolrcLRkgvRdtLeJp6PfSORf4gydl2q6O/sA
        7jkRTQOXgAqJvCpe0MKBq73WQjGp+87QJ20WDl2daPDp/KYpORI+5Y0iQoWnO5XJFewYfr
        WsdALsDNW6aZzzKYnyiJGlkcs9JwtWM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-E5yPFrgMPDyZ7qi21qfWbg-1; Tue, 27 Sep 2022 09:07:22 -0400
X-MC-Unique: E5yPFrgMPDyZ7qi21qfWbg-1
Received: by mail-ej1-f70.google.com with SMTP id gv43-20020a1709072beb00b0077c3f58a03eso3784216ejc.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6koU6MbMrhzOb886xS9cG3Txp+PaObCJEAkkPCTsllU=;
        b=Cq0xQU/Jm5YiZaRUCJbkabS7hD8ueC3Qbhiozzm7gaXXrPb/LsL2P0t9wzMoJ1ORCC
         7VzTWY8Cejy6VryZOsE3X6A1+ADGDCHLWs8gpvKvbGI4wwDRGHCYzhgW7byTo0Wo4ErC
         Ik9NAFZqlTOAkBRmDVHht+fhgbM8D0TpL2OoPkk89s2TnTPzAiqsM5D863pD2CCwYbUQ
         vyPCim1NUNPZMmZa+2faatKen2lzozExDFH8MKI4KovJ+cRHMg9P6mVjaSggyyDk7QZA
         ilCEIyat5ld73zAw58yTuPDhtL4eJ3Wb6ICo9iEPqPYzexQh+ATh12LNMQcW/u3JaOx4
         WjqQ==
X-Gm-Message-State: ACrzQf2bVuD4pODIRnfxH9rPvXi1BC5dekknMfMrZtTmL4kWEVCpxsq2
        SJ2zV/nqc/W3D8Oi0yzYv1GElqJLCDWkj4NSo+D7twI+Wi7TaDmRPp3MP7wtA8WII/EoR8bZUFt
        CzW06ZePJgJBPeFxGeFHYmQnDm+9BJH99Mg==
X-Received: by 2002:a17:907:96a2:b0:782:4072:19da with SMTP id hd34-20020a17090796a200b00782407219damr22619089ejc.398.1664284040968;
        Tue, 27 Sep 2022 06:07:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FsKc4z5ZcClMxlXPlynSiGdtwW7NT4mw5wPQ2mVfrYYCgfb71dGXKGN+ADAY9JernFApX4g==
X-Received: by 2002:a17:907:96a2:b0:782:4072:19da with SMTP id hd34-20020a17090796a200b00782407219damr22619068ejc.398.1664284040697;
        Tue, 27 Sep 2022 06:07:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p5-20020a056402044500b00457b9c55b87sm1049536edw.45.2022.09.27.06.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:07:19 -0700 (PDT)
Message-ID: <1d4f826a-ef39-4d30-922d-880410b254f4@redhat.com>
Date:   Tue, 27 Sep 2022 15:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH linux-next] platform/x86: intel-uncore-freq: use
 sysfs_emit() to instead of scnprintf()
Content-Language: en-US
To:     cgel.zte@gmail.com
Cc:     srinivas.pandruvada@linux.intel.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        ye xingchen <ye.xingchen@zte.com.cn>
References: <20220923063314.239146-1-ye.xingchen@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220923063314.239146-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/22 08:33, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with sysfs_emit() to simplify the code.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

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
>  .../x86/intel/uncore-frequency/uncore-frequency-common.c        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index 84eabd6156bb..6cbbf9bbeefb 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -113,7 +113,7 @@ show_uncore_perf_status(current_freq_khz);
>  		struct uncore_data *data = container_of(attr, struct uncore_data,\
>  							  member_name##_dev_attr);\
>  									\
> -		return scnprintf(buf, PAGE_SIZE, "%u\n",		\
> +		return sysfs_emit(buf, "%u\n",		\
>  				 data->member_name);			\
>  	}								\
>  


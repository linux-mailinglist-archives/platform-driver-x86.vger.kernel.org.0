Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAC653FEB4
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Jun 2022 14:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243651AbiFGMZP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Jun 2022 08:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242662AbiFGMZP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 08:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 777AA63EB
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654604713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+BkMDQZuNbOmLtpQeNhEv9Hz5yKGluY7VE08oBIu2Ig=;
        b=S85/WgSAFfLdJbhkd2mcI2/tg+YZY6o0673cOHPw25PMRMwc7bfxxXWa33POSwlX1vVnxm
        8U/fbVImXwOUlW/4gBIrUGSGAjXZSflRztZcZHOStamgjEiDj0LqHsUEOaOjde6+8R9Mhp
        PY7XDBTsLoEmboF2A1EbJCMfk7nNw+Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-pxT8pdxbNpWBSb71oprBvg-1; Tue, 07 Jun 2022 08:25:12 -0400
X-MC-Unique: pxT8pdxbNpWBSb71oprBvg-1
Received: by mail-wr1-f69.google.com with SMTP id y2-20020adff142000000b0021581245fa1so2693503wro.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 05:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=+BkMDQZuNbOmLtpQeNhEv9Hz5yKGluY7VE08oBIu2Ig=;
        b=UI7sJ7FL4gRVTx2KTcaEDJCOnXwQFYCGzxSU3t8jTgA9QU5OgX7VwFiO9jBbEQtIRx
         0BfBqXUUr6le8gBJYuoY6Jta5XaEdi+0rg/FUho9ctuvOlD0VKSCGeJHvqamaWJ30Ios
         8GGavL9Kpw1C2NmREH6yZ1mlGzi/UejIZa/LM8IzN1VuU/pgK/mDkOj5yuAb6JXs0uX7
         FbSVhHnZZAwIjEMe4XzOha6IPG4yaUD8GHQHtv3Mf6kVtYTFj+u/HZfXV0aIzd+n0EBO
         UnMHUCluaZLBdJre5UPg9lgZ1tjNbUivXuc65MaYerKBknygjNQCxlj/F20T5wQ27f7+
         Zt+w==
X-Gm-Message-State: AOAM532FnWIqLi6rQDONO+cWo7z1BiDUYw9aUj+yWimN6uP97DvrUP49
        3leLoKlSXYLqlg0U974TGKBMsQVeLuYIMUxk6ST2meCtsYkKN4TueZyD9NLijKu/r7LYobykb+j
        YR1rgqnUoHrNfDeTiRhY/Jstc4mlDXu5e5w==
X-Received: by 2002:a1c:f208:0:b0:39c:1282:3d04 with SMTP id s8-20020a1cf208000000b0039c12823d04mr28841128wmc.26.1654604711160;
        Tue, 07 Jun 2022 05:25:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMUrgCzQBm+yVcNb8mYR2lLnuWwWS9cRpDp1JcqdwRxHeXNkz9aaogfYXuCC8mxqoLMwFOiA==
X-Received: by 2002:a1c:f208:0:b0:39c:1282:3d04 with SMTP id s8-20020a1cf208000000b0039c12823d04mr28841072wmc.26.1654604710883;
        Tue, 07 Jun 2022 05:25:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f? (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de. [2003:cb:c709:500:4c8d:4886:f874:7b6f])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb46000000b0020c5253d90asm18213212wrs.86.2022.06.07.05.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:25:09 -0700 (PDT)
Message-ID: <f17bbf85-66bc-619a-6a73-71c1cc719622@redhat.com>
Date:   Tue, 7 Jun 2022 14:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/6] mm: Ratelimited mirrored memory related warning
 messages
Content-Language: en-US
To:     Wupeng Ma <mawupeng1@huawei.com>, corbet@lwn.net, will@kernel.org,
        ardb@kernel.org, catalin.marinas@arm.com
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        dvhart@infradead.org, andy@infradead.org, rppt@kernel.org,
        akpm@linux-foundation.org, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
        keescook@chromium.org, songmuchun@bytedance.com,
        rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
        swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
        anshuman.khandual@arm.com, thunder.leizhen@huawei.com,
        wangkefeng.wang@huawei.com, gpiccoli@igalia.com,
        chenhuacai@kernel.org, geert@linux-m68k.org, chenzhou10@huawei.com,
        vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-4-mawupeng1@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220607093805.1354256-4-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 07.06.22 11:38, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> If system has mirrored memory, memblock will try to allocate mirrored
> memory firstly and fallback to non-mirrored memory when fails, but if with
> limited mirrored memory or some numa node without mirrored memory, lots of
> warning message about memblock allocation will occur.
> 
> This patch ratelimit the warning message to avoid a very long print during
> bootup.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/memblock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index e4f03a6e8e56..b1d2a0009733 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -327,7 +327,7 @@ static phys_addr_t __init_memblock memblock_find_in_range(phys_addr_t start,
>  					    NUMA_NO_NODE, flags);
>  
>  	if (!ret && (flags & MEMBLOCK_MIRROR)) {
> -		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
> +		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
>  			&size);
>  		flags &= ~MEMBLOCK_MIRROR;
>  		goto again;
> @@ -1384,7 +1384,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>  
>  	if (flags & MEMBLOCK_MIRROR) {
>  		flags &= ~MEMBLOCK_MIRROR;
> -		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
> +		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
>  			&size);
>  		goto again;
>  	}

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


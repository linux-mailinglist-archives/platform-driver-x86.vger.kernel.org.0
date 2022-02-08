Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B0E4ADB5F
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Feb 2022 15:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378149AbiBHOjx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Feb 2022 09:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351127AbiBHOjw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Feb 2022 09:39:52 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE861C03FED1
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Feb 2022 06:39:51 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id y203so9917527yby.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Feb 2022 06:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Y10yijKVCYf8QEAAaedBpWn2jA9AeIsehHwTb+17Y0k=;
        b=EkwsBw2shjc0kor8kv6zvognuh72Q+rCGOQ35cWZNXvnfHoVuJK9Ky92xWXKHNXZJ+
         uRntSQCS0CApb8ncu2TtNVZVUxNVCPOT2jY/IQJEuV0X+se8H0vfaC111dv3xzndndPo
         o4fGTXkxhiDWHKrpePleHQmvK+JCvSH9t2Xl16P4zMklrjP0k5zgmhbNlFD5IgLxooAT
         hCe4kcsJcdn/Up1JkyIxglzTNai42QRYxcaYYRO3KwqUUpyFXvWrtRPRJtRBzG55bEkt
         m97bHgp0kpXIDN1XnlFyGzRkGNdW/yNt3GM2cpAWxy/eo9VAOZcXOxnNG6YfVVVNitHU
         U6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Y10yijKVCYf8QEAAaedBpWn2jA9AeIsehHwTb+17Y0k=;
        b=YdorP1i2+GhznqmQf84YReIiHHVldwzBGnp7N/0afTfiGKXHFD1DV9t//ZSmHdwi4o
         mTqtwnzl/B/hS2tJTZt6DwWcHVdmCL3618upXygEmVNoQV46TX3k46YtTDx6ZQlsmFPY
         lRFBCi8eLEvLQKBtfxdfkx3VcctWWCNzBumZ+E2fy0sAFUGu2oVcSX4ubP5cwbwjYNMu
         2J/9XYMUpgQ4SjrZlWi+q1OCRlM4JUNSz5ub8osqNbMZRUr1BMVSFOGkMUXSmHLMepnO
         sZ3/m7rv5YD1CS83R3iION4mH19xkX0pMbWfDG/Y27VpPmoXzVA3hwNrnhS2K6LyuRH2
         B1TA==
X-Gm-Message-State: AOAM530gEkh4FzVOIof/nK4bqjoYK/SYT7v2YIouKp9hcOInp99yjIca
        TU166QKoDkcURPY4gY7C0s7QInp+u/mCKbKtXC7h7Q==
X-Google-Smtp-Source: ABdhPJz5AFxmIsOU2xTwKLGiiL2caloO6fvTxq5q71UI2JljgKT0YDbdSxVzkocMB8lAxijQAwAYICfaue8xYFuRwKE=
X-Received: by 2002:a81:8b48:: with SMTP id e8mr5046849ywk.9.1644331190998;
 Tue, 08 Feb 2022 06:39:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a81:174d:0:0:0:0:0 with HTTP; Tue, 8 Feb 2022 06:39:50 -0800 (PST)
In-Reply-To: <202202061945.DACC7BD04@keescook>
References: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
 <20220203164328.203629-2-martin.fernandez@eclypsium.com> <202202061945.DACC7BD04@keescook>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Tue, 8 Feb 2022 11:39:50 -0300
Message-ID: <CAKgze5aZTocPbn8SDYWJ+wLK7zJFP95=vHU-U+BBF1bc1gPOsg@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] mm/memblock: Tag memblocks with crypto capabilities
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/7/22, Kees Cook <keescook@chromium.org> wrote:
> On Thu, Feb 03, 2022 at 01:43:23PM -0300, Martin Fernandez wrote:
>> +/**
>> + * memblock_node_is_crypto_capable - get if whole node is capable
>> + * of encryption
>> + * @nid: number of node
>> + *
>> + * Iterate over all memory memblock_type and find if all regions under
>> + * node @nid are capable of hardware encryption.
>> + *
>> + * Return:
>> + * true if every region in memory memblock_type is capable of
>> + * encryption, false otherwise.
>> + */
>> +bool __init_memblock memblock_node_is_crypto_capable(int nid)
>> +{
>> +	struct memblock_region *region;
>> +	bool crypto_capable = false;
>> +	bool not_crypto_capable = false;
>> +
>> +	for_each_mem_region(region) {
>> +		if (memblock_get_region_node(region) == nid) {
>> +			crypto_capable =
>> +				crypto_capable ||
>> +				(region->flags & MEMBLOCK_CRYPTO_CAPABLE);
>
> This was already mentioned, but I just thought I'd add: this made me
> double-take, given the "||" (instead of "|") in an assignment. It looked
> like a typo, but yes it's correct. I was expecting something like:
>
> 			crypto_capable |=
> 				!!(region->flags & MEMBLOCK_CRYPTO_CAPABLE);
>
>> +			not_crypto_capable =
>> +				not_crypto_capable ||
>> +				!(region->flags & MEMBLOCK_CRYPTO_CAPABLE);
>
> 			not_crypto_capable |=
> 				!(region->flags & MEMBLOCK_CRYPTO_CAPABLE);
>

Yes, this also works. Thanks.

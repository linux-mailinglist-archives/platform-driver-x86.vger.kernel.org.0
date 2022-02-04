Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8204A99D9
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Feb 2022 14:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354600AbiBDNVw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 4 Feb 2022 08:21:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349762AbiBDNVw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Feb 2022 08:21:52 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B61C061714
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Feb 2022 05:21:51 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id v186so18725066ybg.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Feb 2022 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=+kHxAPwxyZEcImebt/hCxo31GYUl4Y9JyOP0KTd0RjQ=;
        b=Xk+XdovZ9A6qq+rxZKTZ2zFvnkt4TLtrm+p3BP7FGwRMLKm2/kzYFkkKSBaPHgehn0
         ZX/lCNP2k5uePIG4/RAMYbe2LE6DkvtaUo9MH7gbmNmx0WKi/+Ec3KT9z07csS2ASm4U
         rXyvUirAiPY/KhaQRx5/aIPjPZILen3VccmkM3sT5nKGu2W7e7ugtzkOS1AnkSWHxFg1
         Ma6qPtGcbSS/5HrMaVgXH8WctYtelboEsr6w9+88bFbmwXKLwoGcglwehyK+X5DnK+Ml
         4IbdbjalA4JIuAtfZ7INJ/RzlrLNM06YUg/LEgSKcTYh7sUd4H4EQsHgZOa8p7zcM6j4
         ij8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=+kHxAPwxyZEcImebt/hCxo31GYUl4Y9JyOP0KTd0RjQ=;
        b=sjLrhwDCIl9iOPIVmPE0JLrrMgTYz2GxptEQTkyfWdMeAY+2R5YDIKshgv/6lgwEyg
         WOwyR/YXKf4aJ/TEeuuWksSuHbJH5VbMN1o7fnVBWDyIzfJD+zvvW0hNwa1cEAkGKjII
         5CJbHcatlzOWGwTTiShLLgt08g3+t4f/5Pcbhv+KLWAMSmMpptO8u8fYTB5n/fMLk5KH
         +ELXsNZ5CWbcertIlZFqRswOmCDp3n2zslv6K3l3DsB6ouwvtxO/nP0w2ertiUBZift0
         T4Op5TbJKuCKaMJPn9rbsD9QBOm2+0fBaTcd0ZotJ/SAFIpPxjnEIBmScKczI3Kr/CcP
         s+dA==
X-Gm-Message-State: AOAM533n2kbRPU2AZ/9jiPTImWXP4sEcEZ++z216V1KOowNqolI2zBoh
        mfLvsW2SghaCMOup9CxgnuEJuwqxpeUM0LETOQvlxg==
X-Google-Smtp-Source: ABdhPJxtI9yIZAtwdVT04ufmqMOyAiqHsH0A4Hy4uwN6eFDfMocj5rHcvKETbFuiByKZy35TW0cJK+HFULlj9RIdImk=
X-Received: by 2002:a25:b805:: with SMTP id v5mr2552677ybj.266.1643980910826;
 Fri, 04 Feb 2022 05:21:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a81:1756:0:0:0:0:0 with HTTP; Fri, 4 Feb 2022 05:21:50 -0800 (PST)
In-Reply-To: <67d2711b-200c-0894-4ff7-beb3eb304399@amd.com>
References: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
 <20220203164328.203629-7-martin.fernandez@eclypsium.com> <67d2711b-200c-0894-4ff7-beb3eb304399@amd.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Fri, 4 Feb 2022 10:21:50 -0300
Message-ID: <CAKgze5YM2+BRjj2nvb+_dnuCg5WtWvQ6FQyNYJ1c8G6Orn=aQw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] drivers/node: Show in sysfs node's crypto capabilities
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/4/22, Limonciello, Mario <mario.limonciello@amd.com> wrote:
> On 2/3/2022 10:43, Martin Fernandez wrote:
>> +static ssize_t crypto_capable_show(struct device *dev,
>> +				   struct device_attribute *attr, char *buf)
>> +{
>> +	struct pglist_data *pgdat = NODE_DATA(dev->id);
>> +
>> +	return sysfs_emit(buf, "%d\n", pgdat->crypto_capable);
>
> As there is interest in seeing these capabilities from userspace, it
> seems like a logical time to also expose a `crypto_active` attribute.

I planned to do something similar to this, but to show (or actually
hide if inactive) tme in cpuinfo, just as Borislav Petkov suggested a
few versions back.

https://lore.kernel.org/linux-efi/YXrnkxgdjWbcPlJA@zn.tnic/

> Then userspace can make a judgement call if the system supports crypto
> memory (`crypto_capable`) and then also whether or not it's been turned
> on (`crypto_active`).
>
> `crypto_active` could be detected with some existing support in the
> kernel of `mem_encrypt_active()`.  This will then work for a variety of
> architectures too that offer `mem_encrypt_active()`.

I need a hand with this, I grepped for mem_encrypt_active and nothing
showed up...

> As it stands today the only reliable way to tell from userspace (at
> least for AMD's x86 implementation) is by grepping the system log for
> the line "AMD Memory Encryption Features active".

Isn't enough to grep for sme/sev in cpuinfo?

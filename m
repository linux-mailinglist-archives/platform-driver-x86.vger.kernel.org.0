Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA9B70DBE6
	for <lists+platform-driver-x86@lfdr.de>; Tue, 23 May 2023 14:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236533AbjEWMBP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 23 May 2023 08:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbjEWMBO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 08:01:14 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3D1119
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 05:01:13 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-510b6a249a8so1490050a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684843271; x=1687435271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwDgLKuZAoJyLnwNBTa9Plj4tI2jTn00PeEyIRBeY3M=;
        b=UlTc6dBhYhV5+FwOb+RSPI2rk8Q3qpFgLR3evPzNE3qoSA/1Tv938oYhaUah40zsTJ
         f5TXQMK2Cs079ySx+YpwdRWznI362VlsBkVu90B+Ov9nuERDJwdJYMfohfmTSI2+kDdI
         scPtnFlwU4iUXY9LM6WpBfRQbFpdHeGc4hMcAFqULPVX1fZW3lDlnnbfO1JqByHkrWWK
         3iO8KQPZs0CPPK/LLdsYu6zc5ox+KJMKgleV+yRLT7U3LAyno33h5A9o/0CfapwLHQDI
         veiFgFew6wafBYy17ZumPHmrNo9K9VFsHBpJb7AfKpU3Gm3sGMXUvay7WEwp5nxFryVv
         cQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684843271; x=1687435271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwDgLKuZAoJyLnwNBTa9Plj4tI2jTn00PeEyIRBeY3M=;
        b=O9FYTa5Pyl/jdXEUaAv7iECtDT1UKsvyZOD+PCyG6cYq3Ypdp+9VzJ9wAOfrvSLNTR
         kKIbv0W1hkzpx1oRrISZEhWX9RJo2yLPYp8lDD4OdNnMQU9OHQSlkHM9yXWooSAS/l50
         IXaSDRxz5t0DeDTA7iYt2MLPlhzl4N8n0Vx8tewF3UumvfGJm+PdaXRJQ3cMusAz8u3v
         6ZKATwLaxf1Xdlm9AgXLJl5J62PFf1+AlKh2dpSLR7TxibIbaUzNci9wvKpZBlijU2UL
         7AUIVrZnuizBvHe+LerZkimk84l4gsuqJ37ObW4f0aT7s4CG31YEacRo7tbXz+54p2/Y
         OOsQ==
X-Gm-Message-State: AC+VfDxrDfEl2D7V7BwxnP1uzudvxU2xDqFq+7daeSnVCbB3/e4oF9to
        B2LX76KZuEEyMKcnHcp/5R0YWg==
X-Google-Smtp-Source: ACHHUZ40CX09dMi0e735PDRKFRNtfgI4LS6imtI87HuWDsDYP/q8KqRU12dipkCjnKzQegYx3Zmfiw==
X-Received: by 2002:a17:906:d550:b0:966:4bb3:df63 with SMTP id cr16-20020a170906d55000b009664bb3df63mr15157840ejc.63.1684843271141;
        Tue, 23 May 2023 05:01:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t20-20020a17090616d400b009662c57b4ffsm4397666ejd.96.2023.05.23.05.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:01:10 -0700 (PDT)
Date:   Tue, 23 May 2023 14:01:09 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Sunil V L <sunilvl@ventanamicro.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev, Weili Qian <qianweili@huawei.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Len Brown <lenb@kernel.org>
Subject: Re: [PATCH V6 09/21] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <20230523-7263e5220667fd82a462afc7@orel>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
 <20230515054928.2079268-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515054928.2079268-10-sunilvl@ventanamicro.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 15, 2023 at 11:19:16AM +0530, Sunil V L wrote:
> RINTC structures in the MADT provide mapping between the hartid
> and the CPU. This is required many times even at run time like
> cpuinfo. So, instead of parsing the ACPI table every time, cache
> the RINTC structures and provide a function to get the correct
> RINTC structure for a given cpu.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h | 10 ++++++++
>  arch/riscv/kernel/acpi.c      | 45 +++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c     |  4 ++++
>  3 files changed, 59 insertions(+)


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

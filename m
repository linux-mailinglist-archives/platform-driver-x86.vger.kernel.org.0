Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED216EFA45
	for <lists+platform-driver-x86@lfdr.de>; Wed, 26 Apr 2023 20:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239148AbjDZSpb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 26 Apr 2023 14:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236978AbjDZSpZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 14:45:25 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7DE7EC6
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:45:05 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b57c49c4cso6168253b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682534704; x=1685126704;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXwqrHaYzKo2yrBADgB5WqZEnPYQ+1SHT4/YEIm6rfk=;
        b=yxmeIMM7AqMrYpjTPhdJvmtkQFPvan9NpmCeQGiyWsJ8rAwTZOYkEjw1ULTCzu/UY/
         p+JxxPb6kjDGYGiZE6rGIf6FxsOeVd1XHZhjjQ2Jt4srKtvhvz1BgV7n0RYa9HqX5Tcx
         pGupfUA0qbgmg2dhyuu0IoXpUgUMTMKispsGRNr4cTt3RXtSfFdnWYxRuJLLfAaqJWoC
         gcJZez6b6z+kNe50a27vXIEmYxCHZZVP7PtZAOjCK4mZPRQPvsgg+f+Nw5U9T8Kk4QnF
         iZ//DRkyY1yc2h8A7CQpRKuOXCl1fQrYYoUeWxtQK3nHGckqos7RLKXsKDV8iBrIiaXZ
         XfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682534704; x=1685126704;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXwqrHaYzKo2yrBADgB5WqZEnPYQ+1SHT4/YEIm6rfk=;
        b=bgfHTgNj+E+m8Dn6p9BemR7ep5nVPQ4oUbydtRZLz+iRTN/cwDec2k/TZLhV+WXV06
         E46HygrgI1Ycn2wDvEc/i1dX+DS8y+XzUomrIHYn4uh0JWPQ0lqW8rx/8HHvdqnNbQCV
         b+l6AwSx+1NY80YP2KxaxM9w2YLG8cM9F0800V3psO/G5SEhsDWnT1bEE/wlnto21NIL
         1W4Sovi7CSX3vY01x2y5qDibysV/85kHG4AO0+dPci+BT8ox2jEYZ9ImO4aL8qXN2Q8n
         6dsEJv5hwx5dNDXl9ksCVD7AvkKYR5ZUmj0B5m+yKdn/xGvyrYlDv6Y7WzraDbva0Ult
         3uUQ==
X-Gm-Message-State: AC+VfDx/M3DF7lyDkJJIBjTbAmcMfNZHDjXl325/O2+iaFCTdfrlUMFN
        +VuvwXf4qw3TpLRhH9AweQ3g9w==
X-Google-Smtp-Source: ACHHUZ6XGF1YFTCK+4TjiFTAQPFcameE2epgjBDRDaOfU6uZsFJI6CGSCG2MRBu5cCtfg/boc69nAQ==
X-Received: by 2002:a17:902:f682:b0:1a9:9929:face with SMTP id l2-20020a170902f68200b001a99929facemr5189336plg.34.1682534704484;
        Wed, 26 Apr 2023 11:45:04 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902ee5500b001a0763fa8d6sm10257455plo.98.2023.04.26.11.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:45:03 -0700 (PDT)
Date:   Wed, 26 Apr 2023 11:45:03 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Apr 2023 11:44:26 PDT (-0700)
Subject:     Re: [PATCH V4 10/23] RISC-V: smpboot: Create wrapper smp_setup()
In-Reply-To: <20230404182037.863533-11-sunilvl@ventanamicro.com>
CC:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, lenb@kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, qianweili@huawei.com, wangzhou1@hisilicon.com,
        herbert@gondor.apana.org.au, Marc Zyngier <maz@kernel.org>,
        luzmaximilian@gmail.com, hdegoede@redhat.com, markgross@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
        rafael@kernel.org, davem@davemloft.net, sunilvl@ventanamicro.com,
        rafael.j.wysocki@intel.com,
        Conor Dooley <conor.dooley@microchip.com>,
        ajones@ventanamicro.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     sunilvl@ventanamicro.com
Message-ID: <mhng-d7d9cb6c-3d07-4286-aa68-e99df654a92b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 04 Apr 2023 11:20:24 PDT (-0700), sunilvl@ventanamicro.com wrote:
> smp_setup() currently assumes DT-based platforms. To enable ACPI,
> first make this a wrapper function and move existing code to
> a separate DT-specific function.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/smpboot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 00b53913d4c6..26214ddefaa4 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  }
>
> -void __init setup_smp(void)
> +static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
>  	unsigned long hart;
> @@ -116,6 +116,11 @@ void __init setup_smp(void)
>  	}
>  }
>
> +void __init setup_smp(void)
> +{
> +	of_parse_and_init_cpus();
> +}
> +
>  static int start_secondary_cpu(int cpu, struct task_struct *tidle)
>  {
>  	if (cpu_ops[cpu]->cpu_start)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

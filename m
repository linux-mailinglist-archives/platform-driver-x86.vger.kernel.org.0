Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211696D7DCE
	for <lists+platform-driver-x86@lfdr.de>; Wed,  5 Apr 2023 15:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237259AbjDENf6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 5 Apr 2023 09:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbjDENf5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2023 09:35:57 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCF840C8
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Apr 2023 06:35:55 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso3781214pjc.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Apr 2023 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680701755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JIHDYxgUdzzSqTP2brP/Gv5M90CrOXKIjgMsPWUPa3E=;
        b=CKTKF4kpb7ZHTt5WzSMSNpO/YiANGdZvzrrD77G3R2AwcXrky8I6y4ejU+fBNRkbFN
         lryZ+EIvfsuH2rhE1cSkHr2YVlmsBsCIb8FDF1XSoF0GPIMefcCmWeKloUJDFICHi6eb
         7MRvsY+ChHOJQlUMZypaYAaLEZHVZ0W99yx9LtAckYSxsCvWLVnwy22p6QBxC6+q6Wm5
         UhgAmuMSveoY6oR2rnXWLS00Sqg1O+H6+VjZvXkfNBpXmNdo6GRt3ztEp6czta8goSwK
         oRSWcq7xRdYhdRHeqG+fJZwC0rkHEmiTgcIOzCeYaKuTbI1JTB78nUaYlT1a1CD4IDgf
         bc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680701755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIHDYxgUdzzSqTP2brP/Gv5M90CrOXKIjgMsPWUPa3E=;
        b=Mvi05vOO76BS11oX35j4BRfe6u9alGVeL1jSyahrI+IjuT3xBDfF8sTwq+TkFT/ZRS
         C1njRN1eTnud/kz6Cv2at+D0hRVp0ARGai8zFAa31sDuOfUc8/wAPBOySyAR6p3pCuu4
         h8+AwmKc97DLyEeG9GSb39d1f5MAN8iUUuPWr+76hCjXgbtIWOwkE1+C+l2Q7jPUl5qH
         tk3jta/Cd0bYiRYO8inDz401DYNN1O3IphJ7R998al1JGO8QyO0Vir8YqbLfwnUxO+82
         yJ5rOoMP2AB9WTo/e1ELyWhezZjrVmihxSzzkIytlYe4bn2oJ264u93c5rpe5nzhrH0P
         ugWg==
X-Gm-Message-State: AAQBX9cboC7VfH81tFPioLDVGhDTZ0Z1DlIQcrpn7QNhjxmrFNUw7AZW
        uQB3Fba7gFwRD6zBDJIVZ1/QUw==
X-Google-Smtp-Source: AKy350YakjU97DwbNOaHnJ7tP50TtKQnFHAXGnpEmklEn/OYjSLROKhCvPK2o+vvLvZ4pWgOW/ApXw==
X-Received: by 2002:a17:902:e891:b0:1a1:f413:70b1 with SMTP id w17-20020a170902e89100b001a1f41370b1mr7345803plg.18.1680701754753;
        Wed, 05 Apr 2023 06:35:54 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b0019cad2de86bsm10131129pli.156.2023.04.05.06.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 06:35:54 -0700 (PDT)
Date:   Wed, 5 Apr 2023 19:05:42 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Tom Rix <trix@redhat.com>, Weili Qian <qianweili@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Len Brown <lenb@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <ZC15LqYqLzmiVdcr@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-14-sunilvl@ventanamicro.com>
 <20230404-promotion-scarce-7c69ff7e5f99@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404-promotion-scarce-7c69ff7e5f99@spud>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 04, 2023 at 09:57:19PM +0100, Conor Dooley wrote:
> On Tue, Apr 04, 2023 at 11:50:27PM +0530, Sunil V L wrote:
> > On ACPI based systems, the information about the hart
> > like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
> > Enable filling up hwcap structure based on the information in RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 39 ++++++++++++++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 63e56ce04162..5d2065b937e5 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -6,6 +6,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/ctype.h>
> >  #include <linux/libfdt.h>
> > @@ -13,6 +14,8 @@
> >  #include <linux/memory.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <asm/acpi.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/errata_list.h>
> > @@ -91,6 +94,9 @@ void __init riscv_fill_hwcap(void)
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> >  	int i, j, rc;
> >  	unsigned long isa2hwcap[26] = {0};
> > +	struct acpi_table_header *rhct;
> > +	acpi_status status;
> > +	unsigned int cpu;
> >  
> >  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> >  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> > @@ -103,14 +109,36 @@ void __init riscv_fill_hwcap(void)
> >  
> >  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> >  
> > -	for_each_of_cpu_node(node) {
> > +	if (!acpi_disabled) {
> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > +		if (ACPI_FAILURE(status))
> > +			return;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> >  		unsigned long this_hwcap = 0;
> >  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> >  		const char *temp;
> >  
> > -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> > -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > -			continue;
> > +		if (acpi_disabled) {
> > +			node = of_cpu_device_node_get(cpu);
> > +			if (node) {
> > +				rc = of_property_read_string(node, "riscv,isa", &isa);
> 
> Hmm, after digging in the previous patch, I think this is actually not
> possible to fail? We already validated it when setting up the mask of
> possible cpus, but I think leaving the error handling here makes things
> a lot more obvious.
> 
Yeah, do you prefer to merge these patches again since only in this
patch, we change the loop to for_each_possible_cpu() from
for_each_of_cpu_node() which actually makes riscv_of_processor_hartid()
not useful?

> I'd swear I gave you a (conditional) R-b on v3 though, no?
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
Thanks,
Sunil

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEEB2C770
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 May 2019 15:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfE1NJx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 May 2019 09:09:53 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35265 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfE1NJv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 May 2019 09:09:51 -0400
Received: by mail-io1-f67.google.com with SMTP id p2so15678345iol.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2019 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3gMjgQF6nVEpAjnECu8ew++wo5leqfpmshMTC4gXxYo=;
        b=aQnbN08kY+fZnKaZkc6Jz47og1ZVNUJYTwBk+2rjH4tB794JCbcokx4ppHBUIfhYsh
         x//fmeBbsj76sAFoOntCBGhgDq0lg0eCxQjhB5H+wAklR3N252PW8ZUyDBrKeoaimS9t
         /Ox2+TFsUhYllJXGgVC6JyJ+DaEMHC0Kg+jPaUJYGudA3FULPTDB6fPZNZ8xDXa8ZzMU
         y7Z9PgOPmwhkHPsK9a48ubymnrRL4WFX1exKVXnTYk61mmswNcr85RK0bIFxXIuVGhKj
         VqVFNMYES/D/pvAA8wVV1XuSBNoC2B0rM3LB6koVQ9iBrfeFgHGsfWUHlTKRLDIftMEH
         hmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3gMjgQF6nVEpAjnECu8ew++wo5leqfpmshMTC4gXxYo=;
        b=KMYU0fWQ+D5gz1tusqXamvg+ewe1BGqzr4yYGVbCOD/hCx/ccT/ZrRf7k07Z1YIPn/
         aZ+PKy4atngh7KaD1eJycakHiS2k3lhdCU9xEMM5pGPCvINoQjj3Klfnwi1ni7b/pIyE
         MjDEcmK8H6/FmKGBcMbzmGqe1HLHs+p7wnk4Mdx1g2DdUdLgRnpXAA68xekKgEt7VNQy
         mYHjZb/1GrtgK+AY+nCJuFlz9ODroNe4rVxC+zFL/MnWtghixqYvaFHSKSikPXF1+Qbd
         dVeVSmU+yPydHRtPAU3krZBygvmxfHBwlvgQRBS9+vmOWUJ0rhdlbjomSGANVMSsyk9Z
         dt5Q==
X-Gm-Message-State: APjAAAVswdL2MLfk7vUTRu3JHBR3GYrzQrZy2U5Sb3DfIxpLxOcUV17R
        Ta2d+i9de2qKOVIGHYxsj40hHprQEinJoeErX8C8qw==
X-Google-Smtp-Source: APXvYqz2NSY8Eub8B3tcZ0h/NOiXNc3gT/E67sal88UPCko5gQx0ik+z614GKA+mx2KpIkYqi6sIXUQFqE9LG/ygZX0=
X-Received: by 2002:a5d:968e:: with SMTP id m14mr38913390ion.49.1559048990760;
 Tue, 28 May 2019 06:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190528125805.2166-1-mail@lennart-glauer.de>
In-Reply-To: <20190528125805.2166-1-mail@lennart-glauer.de>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 28 May 2019 15:09:38 +0200
Message-ID: <CAKv+Gu8hXOLHLrBMJLYnDyW8xYhSHTAsNk6i034KA7gThjSpJQ@mail.gmail.com>
Subject: Re: [PATCH] x86/efi: Free efi_pgd with free_pages()
To:     Lennart Glauer <mail@lennart-glauer.de>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Lennart,

Thanks for the patch.

On Tue, 28 May 2019 at 14:58, Lennart Glauer <mail@lennart-glauer.de> wrote:
>
> This patch fixes another occurrence of free_page() that was missed
> in 06ace26.

Please don't trim commit IDs like that. I think 12 digits is our
current minimum?

error: short SHA1 06ace26 is ambiguous
hint: The candidates are:
hint:   06ace26edc14 commit 2016-02-12 - staging: lustre: fix all NULL
comparisons in LNet layer
hint:   06ace26f4e6f commit 2018-03-22 - x86/efi: Free efi_pgd with free_pages()

> The efi_pgd is allocated as PGD_ALLOCATION_ORDER pages and therefore must
> also be freed as PGD_ALLOCATION_ORDER pages with free_pages().
>
> Signed-off-by: Lennart Glauer <mail@lennart-glauer.de>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Ingo, can you take this directly? I can't really test this anyway.


> ---
>  arch/x86/platform/efi/efi_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
> index 08ce8177c3af..acad22a44774 100644
> --- a/arch/x86/platform/efi/efi_64.c
> +++ b/arch/x86/platform/efi/efi_64.c
> @@ -222,7 +222,7 @@ int __init efi_alloc_page_tables(void)
>         pgd = efi_pgd + pgd_index(EFI_VA_END);
>         p4d = p4d_alloc(&init_mm, pgd, EFI_VA_END);
>         if (!p4d) {
> -               free_page((unsigned long)efi_pgd);
> +               free_pages((unsigned long)efi_pgd, PGD_ALLOCATION_ORDER);
>                 return -ENOMEM;
>         }
>
> --
> 2.17.1

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5028430FC6B
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Feb 2021 20:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239733AbhBDTRv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Feb 2021 14:17:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:52700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239763AbhBDTRN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 14:17:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18E0E64DF0;
        Thu,  4 Feb 2021 19:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612466192;
        bh=8S5BexxzoontSYmnpurHcAgfrHRcphSuCnzRExkPd30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KBQdU9OfAeDFvPjximv/0NbVnU0DxHB1PLhQ16or8xmdZTZ87nHnQXFXmN3z5Yl0A
         W4HupY6kmmKxzcSXR8mVbo555bJ8ob6P+YQadMaR2ZzBc1MJKU0B54bmnSONqw3OoZ
         iEUixgEKA22YQrEegQ/Z6gR0Pz+z5Off1quJyrHnLzPpGBsFXztckjECDJsLiVQgD+
         KImAtVJVC5UBzKmA3R4nACk2n+7PTeGH01KT4HjLQWZfNwFvKoR8FGZ8WEXTUqeIPe
         eMJbBbkj2Rd2I/ml7kl0MOMhJOabvlOigP1cXUjbVTdUf4ZJ18LJvlVKT/jKyqXBoT
         wWReByK6uWk8w==
Date:   Thu, 4 Feb 2021 12:16:28 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-efi <linux-efi@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH] x86: efi: avoid BUILD_BUG_ON() for non-constant p4d_index
Message-ID: <20210204191628.GC2991903@localhost>
References: <20210107223424.4135538-1-arnd@kernel.org>
 <YAHoB4ODvxSqNhsq@rani.riverdale.lan>
 <YAH6r3lak/F2wndp@rani.riverdale.lan>
 <CAMj1kXGZFZciN1_KruCr=g6GANNpRrCLR48b3q13+QfK481C7Q@mail.gmail.com>
 <20210118202409.GG30090@zn.tnic>
 <YAYAvBARSRSg8z8G@rani.riverdale.lan>
 <CAMj1kXHM98-iDYpAozaWEv-qxhZ0-CUMwSdG532x2d+55gXDhQ@mail.gmail.com>
 <20210203185148.GA1711888@localhost>
 <CAMj1kXFPOvkcw573wzKzMQOgT-nddFcAZo9M4Lk+idn_1UBbnA@mail.gmail.com>
 <20210204105155.GA32255@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204105155.GA32255@zn.tnic>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 04, 2021 at 11:51:55AM +0100, Borislav Petkov wrote:
> On Wed, Feb 03, 2021 at 09:29:18PM +0100, Ard Biesheuvel wrote:
> > I think we have agreement on the approach but it is unclear who is
> > going to write the patch.
> 
> How's that below?
> 
> And frankly, I'd even vote for removing those assertions altogether. If
> somehow the EFI pgd lands somewhere else, the kernel will crash'n'burn
> spectacularly and quickly so it's not like we won't catch it...
> 
> ---

This resolves the issue initially reported in this thread. Obviously
removing the assertions will do that as well. Feel free to carry
forward

Tested-by: Nathan Chancellor <nathan@kernel.org>

on a patch if you send it out.

> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> index 91ac10654570..b6be19c09841 100644
> --- a/arch/x86/include/asm/pgtable_64_types.h
> +++ b/arch/x86/include/asm/pgtable_64_types.h
> @@ -156,8 +156,8 @@ extern unsigned int ptrs_per_p4d;
>  #define CPU_ENTRY_AREA_PGD	_AC(-4, UL)
>  #define CPU_ENTRY_AREA_BASE	(CPU_ENTRY_AREA_PGD << P4D_SHIFT)
>  
> -#define EFI_VA_START		( -4 * (_AC(1, UL) << 30))
> -#define EFI_VA_END		(-68 * (_AC(1, UL) << 30))
> +#define EFI_VA_START		( -4UL * (_AC(1, UL) << 30))
> +#define EFI_VA_END		(-68UL * (_AC(1, UL) << 30))
>  
>  #define EARLY_DYNAMIC_PAGE_TABLES	64
>  
> diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
> index e1e8d4e3a213..56fdc0bbb554 100644
> --- a/arch/x86/platform/efi/efi_64.c
> +++ b/arch/x86/platform/efi/efi_64.c
> @@ -123,9 +123,7 @@ void efi_sync_low_kernel_mappings(void)
>  	 * only span a single PGD entry and that the entry also maps
>  	 * other important kernel regions.
>  	 */
> -	MAYBE_BUILD_BUG_ON(pgd_index(EFI_VA_END) != pgd_index(MODULES_END));
> -	MAYBE_BUILD_BUG_ON((EFI_VA_START & PGDIR_MASK) !=
> -			(EFI_VA_END & PGDIR_MASK));
> +	MAYBE_BUILD_BUG_ON((EFI_VA_START & PGDIR_MASK) != PGDIR_MASK);
>  
>  	pgd_efi = efi_pgd + pgd_index(PAGE_OFFSET);
>  	pgd_k = pgd_offset_k(PAGE_OFFSET);
> @@ -137,8 +135,7 @@ void efi_sync_low_kernel_mappings(void)
>  	 * As with PGDs, we share all P4D entries apart from the one entry
>  	 * that covers the EFI runtime mapping space.
>  	 */
> -	BUILD_BUG_ON(p4d_index(EFI_VA_END) != p4d_index(MODULES_END));
> -	BUILD_BUG_ON((EFI_VA_START & P4D_MASK) != (EFI_VA_END & P4D_MASK));
> +	BUILD_BUG_ON((EFI_VA_START & P4D_MASK) != P4D_MASK);
>  
>  	pgd_efi = efi_pgd + pgd_index(EFI_VA_END);
>  	pgd_k = pgd_offset_k(EFI_VA_END);
> 
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE872FCE9C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 20 Jan 2021 12:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbhATKtS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 20 Jan 2021 05:49:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:43144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731474AbhATJes (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jan 2021 04:34:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 226462333B;
        Wed, 20 Jan 2021 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611135235;
        bh=O0F6nt2qctM6JqozhShXeHZqpZiqCUOY7pO9GCVxo5o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CCjy0SVbpAtcByDd1IMtGHULHpLqtMb8gFB5aY1lDIayFYaFPEPbjuDW8JNWwnoeb
         L2UP27ytyXnviDUCM+Uldc00x60S7SqE/P7joTTZrbhK0v4RYmmwjdQRz7q+aw2vnD
         VIQI1Q+CKb+D9tgWzfBTkQHmBo0O0z+540uuxs2OoUfPxgjwH1BKEnd4RmMepa9mVO
         tE0SgtMQxTPPskS2ztxwsvHN/UhHFV3cRmhE16G1yfO23bDSUEkJzJQUZxPKOtcviX
         8C0zatABwh5r074MkfjRiR5HJb83QMqTUBvBSo9mqMItbdcjJGQ//nVWg7DQmXTuyq
         hX1jqMTcqnb8A==
Received: by mail-ot1-f46.google.com with SMTP id 63so323602oty.0;
        Wed, 20 Jan 2021 01:33:55 -0800 (PST)
X-Gm-Message-State: AOAM530l+kZtB+M8tXKhOwzPuCXLuncr1tciMmJ5rWCQqqF/wnCu9ZIu
        UXAynud88xoL01gAZ9yUwLvXE+T229EnibRCSm4=
X-Google-Smtp-Source: ABdhPJywCSz0cSQIAbQzZBztskNWdBoBCF7hq+5suaHcdUDckUTiZ8fWUBzFLZabRqU1JMMnKGOySz8xRqtDsx+2TYE=
X-Received: by 2002:a05:6830:1614:: with SMTP id g20mr656140otr.77.1611135234286;
 Wed, 20 Jan 2021 01:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20210107223424.4135538-1-arnd@kernel.org> <YAHoB4ODvxSqNhsq@rani.riverdale.lan>
 <YAH6r3lak/F2wndp@rani.riverdale.lan> <CAMj1kXGZFZciN1_KruCr=g6GANNpRrCLR48b3q13+QfK481C7Q@mail.gmail.com>
 <20210118202409.GG30090@zn.tnic> <YAYAvBARSRSg8z8G@rani.riverdale.lan>
In-Reply-To: <YAYAvBARSRSg8z8G@rani.riverdale.lan>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 20 Jan 2021 10:33:43 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHM98-iDYpAozaWEv-qxhZ0-CUMwSdG532x2d+55gXDhQ@mail.gmail.com>
Message-ID: <CAMj1kXHM98-iDYpAozaWEv-qxhZ0-CUMwSdG532x2d+55gXDhQ@mail.gmail.com>
Subject: Re: [PATCH] x86: efi: avoid BUILD_BUG_ON() for non-constant p4d_index
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 18 Jan 2021 at 22:42, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Mon, Jan 18, 2021 at 09:24:09PM +0100, Borislav Petkov wrote:
> > > > > As a matter of fact, it seems like the four assertions could be combined
> > > > > into:
> > > > >       BUILD_BUG_ON((EFI_VA_END & P4D_MASK) != (MODULES_END & P4D_MASK));
> > > > >       BUILD_BUG_ON((EFI_VA_START & P4D_MASK) != (EFI_VA_END & P4D_MASK));
> > > > > instead of separately asserting they're the same PGD entry and the same
> > > > > P4D entry.
> > > > >
> > > > > Thanks.
> > > >
> > > > I actually don't quite get the MODULES_END check -- Ard, do you know
> > > > what that's for?
> > > >
> > >
> > > Maybe Boris remembers? He wrote the original code for the 'new' EFI
> > > page table layout.
> >
> > That was added by Kirill for 5-level pgtables:
> >
> >   e981316f5604 ("x86/efi: Add 5-level paging support")
>
> That just duplicates the existing pgd_index() check for the p4d_index()
> as well. It looks like the original commit adding
> efi_sync_low_kernel_mappings() used to copy upto the PGD entry including
> MODULES_END:
>   d2f7cbe7b26a7 ("x86/efi: Runtime services virtual mapping")
> and then Matt changed that when creating efi_mm:
>   67a9108ed4313 ("x86/efi: Build our own page table structures")
> to use EFI_VA_END instead but have a check that EFI_VA_END is in the
> same entry as MODULES_END.
>
> AFAICT, MODULES_END is only relevant as being something that happens to
> be in the top 512GiB, and -1ul would be clearer.
>
> >
> >  Documentation/x86/x86_64/mm.rst should explain the pagetable layout:
> >
> >    ffffff8000000000 | -512    GB | ffffffeeffffffff |  444 GB | ... unused hole
> >    ffffffef00000000 |  -68    GB | fffffffeffffffff |   64 GB | EFI region mapping space
> >    ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | ... unused hole
> >    ffffffff80000000 |   -2    GB | ffffffff9fffffff |  512 MB | kernel text mapping, mapped to physical address 0
> >    ffffffff80000000 |-2048    MB |                  |         |
> >    ffffffffa0000000 |-1536    MB | fffffffffeffffff | 1520 MB | module mapping space
> >    ffffffffff000000 |  -16    MB |                  |         |
> >       FIXADDR_START | ~-11    MB | ffffffffff5fffff | ~0.5 MB | kernel-internal fixmap range, variable size and offset
> >
> > That thing which starts at -512 GB above is the last PGD on the
> > pagetable. In it, between -4G and -68G there are 64G which are the EFI
> > region mapping space for runtime services.
> >
> > Frankly I'm not sure what this thing is testing because the EFI VA range
> > is hardcoded and I can't imagine it being somewhere else *except* in the
> > last PGD.
>
> It's just so that someone doesn't just change the #define's for
> EFI_VA_END/START and think that it will work, I guess.
>
> Another reasonable option, for example, would be to reserve an entire
> PGD entry, allowing everything but the PGD level to be shared, and
> adding the EFI PGD to the pgd_list and getting rid of
> efi_sync_low_kernel_mappings() altogether. There aren't that many PGD
> entries still unused though, so this is probably not worth it.
>

The churn doesn't seem to be worth it, tbh.

So could we get rid of the complexity here, and only build_bug() on
the start address of the EFI region being outside the topmost p4d?
That should make the PGD test redundant as well.

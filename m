Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D10395897
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 May 2021 11:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhEaKBP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 May 2021 06:01:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231514AbhEaKAb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 06:00:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32D1F610A0;
        Mon, 31 May 2021 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622455129;
        bh=6kbI97vGAbBkOyOvwkIed49Ymrsa0Ja/+U28stuH/58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q5hje2ScELjyPNJ9u60mQwPa2LHxOC3LyIK9JffWZkotM/9/SREj3ZWBKtvou+TJi
         jtR412+hth7vV/h8rY0gvBdRu22jLKPx2YVzCD/AtOUPBgs99ORhHq9ARMnF1RMpin
         zoHAsBY+Sqez8qRxuCXI6r16XKvK4yMomUa7ijizLn2cjp1ryfaAMN0VqBOFBOAMfa
         78Pw5b3r1pSOLd/ID1mgYtntD4Wm+i3W2k4+k0sNVuVE17Hh+oS0cpwDeyz3gEfs8/
         rW5i69hqE/ldzZkRlFqsKw0C8zNm+AOioSnezo6ps7a6mOmI+IG5zCwKGbofAlPADE
         yZGRcbHssdxYw==
Date:   Mon, 31 May 2021 12:58:40 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Lianbo Jiang <lijiang@redhat.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, kexec@lists.infradead.org,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com,
        luto@amacapital.net, bhe@redhat.com, dyoung@redhat.com
Subject: Re: [PATCH v2] x86/efi: unconditionally hold the whole low-1MB
 memory regions
Message-ID: <YLSzUBQ/7CyINu87@kernel.org>
References: <20210531090023.16471-1-lijiang@redhat.com>
 <YLSnkKeoQnokXVsK@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLSnkKeoQnokXVsK@zn.tnic>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 31, 2021 at 11:08:32AM +0200, Borislav Petkov wrote:
> + Mike.
> 
> On Mon, May 31, 2021 at 05:00:23PM +0800, Lianbo Jiang wrote:
> > Some sub-1MB memory regions may be reserved by EFI boot services, and the
> > memory regions will be released later in the efi_free_boot_services().
> > 
> > Currently, always reserve all sub-1MB memory regions when the crashkernel
> > option is specified, but unfortunately EFI boot services may have already
> > reserved some sub-1MB memory regions before the crash_reserve_low_1M() is
> > called, which makes that the crash_reserve_low_1M() only own the
> > remaining sub-1MB memory regions, not all sub-1MB memory regions, because,
> > subsequently EFI boot services will free its own sub-1MB memory regions.
> > Eventually, DMA will be able to allocate memory from the sub-1MB area and
> > cause the following error:
> > 
> > crash> kmem -s |grep invalid
> > kmem: dma-kmalloc-512: slab: ffffd52c40001900 invalid freepointer: ffff9403c0067300
> > kmem: dma-kmalloc-512: slab: ffffd52c40001900 invalid freepointer: ffff9403c0067300
> > crash> vtop ffff9403c0067300
> > VIRTUAL           PHYSICAL
> > ffff9403c0067300  67300   --->The physical address falls into this range [0x0000000000063000-0x000000000008efff]
> > 
> > kernel debugging log:
> > ...
> > [    0.008927] memblock_reserve: [0x0000000000010000-0x0000000000013fff] efi_reserve_boot_services+0x85/0xd0
> > [    0.008930] memblock_reserve: [0x0000000000063000-0x000000000008efff] efi_reserve_boot_services+0x85/0xd0
> > ...
> > [    0.009425] memblock_reserve: [0x0000000000000000-0x00000000000fffff] crash_reserve_low_1M+0x2c/0x49
> > ...
> > [    0.010586] Zone ranges:
> > [    0.010587]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> > [    0.010589]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> > [    0.010591]   Normal   [mem 0x0000000100000000-0x0000000c7fffffff]
> > [    0.010593]   Device   empty
> > ...
> > [    8.814894] __memblock_free_late: [0x0000000000063000-0x000000000008efff] efi_free_boot_services+0x14b/0x23b
> > [    8.815793] __memblock_free_late: [0x0000000000010000-0x0000000000013fff] efi_free_boot_services+0x14b/0x23b
> > 
> > To fix the above issues, let's hold the whole low-1M memory regions
> > unconditionally in the efi_free_boot_services().
> > 
> > Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
> > ---
> > Background(copy from bhe's comment in the patch v1):
> > 
> > Kdump kernel also need go through real mode code path during bootup. It
> > is not different than normal kernel except that it skips the firmware
> > resetting. So kdump kernel needs low 1M as system RAM just as normal
> > kernel does. Here we reserve the whole low 1M with memblock_reserve()
> > to avoid any later kernel or driver data reside in this area. Otherwise,
> > we need dump the content of this area to vmcore. As we know, when crash
> > happened, the old memory of 1st kernel should be untouched until vmcore
> > dumping read out its content. Meanwhile, kdump kernel need reuse low 1M.
> > In the past, we used a back up region to copy out the low 1M area, and
> > map the back up region into the low 1M area in vmcore elf file. In
> > 6f599d84231fd27 ("x86/kdump: Always reserve the low 1M when the crashkernel
> > option is specified"), we changed to lock the whole low 1M to avoid
> > writting any kernel data into, like this we can skip this area when
> > dumping vmcore.
> > 
> > Above is why we try to memblock reserve the whole low 1M. We don't want
> > to use it, just don't want anyone to use it in 1st kernel.
> > 
> > 
> >  arch/x86/platform/efi/quirks.c | 32 +++++++++++++++-----------------
> >  1 file changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
> > index 7850111008a8..840b7e3b3d48 100644
> > --- a/arch/x86/platform/efi/quirks.c
> > +++ b/arch/x86/platform/efi/quirks.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/memblock.h>
> >  #include <linux/acpi.h>
> >  #include <linux/dmi.h>
> > +#include <linux/sizes.h>
> >  
> >  #include <asm/e820/api.h>
> >  #include <asm/efi.h>
> > @@ -409,7 +410,7 @@ void __init efi_free_boot_services(void)
> >  	for_each_efi_memory_desc(md) {
> >  		unsigned long long start = md->phys_addr;
> >  		unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
> > -		size_t rm_size;
> > +		unsigned long long end = start + size;
> >  
> >  		if (md->type != EFI_BOOT_SERVICES_CODE &&
> >  		    md->type != EFI_BOOT_SERVICES_DATA) {
> > @@ -431,23 +432,20 @@ void __init efi_free_boot_services(void)
> >  		efi_unmap_pages(md);
> >  
> >  		/*
> > -		 * Nasty quirk: if all sub-1MB memory is used for boot
> > -		 * services, we can get here without having allocated the
> > -		 * real mode trampoline.  It's too late to hand boot services
> > -		 * memory back to the memblock allocator, so instead
> > -		 * try to manually allocate the trampoline if needed.
> > -		 *
> > -		 * I've seen this on a Dell XPS 13 9350 with firmware
> > -		 * 1.4.4 with SGX enabled booting Linux via Fedora 24's
> > -		 * grub2-efi on a hard disk.  (And no, I don't know why
> > -		 * this happened, but Linux should still try to boot rather
> > -		 * panicking early.)
> > +		 * The sub-1MB memory may be within the range[0, SZ_1M]
> > +		 * or across the low-1M memory boundary. Let's handle
> > +		 * these two cases and hold the whole low-1M memory
> > +		 * unconditionally.
> >  		 */
> > -		rm_size = real_mode_size_needed();
> > -		if (rm_size && (start + rm_size) < (1<<20) && size >= rm_size) {
> > -			set_real_mode_mem(start);

This will restore the issue with Dell XPS described above (presuming it's
still relevant with recent kernels).

> > -			start += rm_size;
> > -			size -= rm_size;
> > +		if (start < SZ_1M) {
> > +			/* Within the range[0, SZ_1M] */
> > +			if (end <= SZ_1M)
> > +				continue;
> > +			else {
> > +				/* Across the low-1M memory boundary */
> > +				size -= (SZ_1M - start);
> > +				start = SZ_1M;
> > +			}
> >  		}
> >  
> >  		memblock_free_late(start, size);
> > -- 
> 
> I don't think this will be needed when this here happens:
> 
> https://lkml.kernel.org/r/YK%2Bgv0vDfLVD7Sqp@kernel.org

Right, but TBH, I didn't update efi_free_boot_services() in my initial
version. I've added similar change there now and I'm waiting now to see if
kbuild is happy with this:

https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=x86/reservelow

-- 
Sincerely yours,
Mike.

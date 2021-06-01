Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B633957BC
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 May 2021 11:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhEaJCo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 May 2021 05:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58121 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231187AbhEaJCV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 05:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622451641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=LE1iF4c4IiL/+CW/yCPElYWM7vlN4P0lRRKPTAcXwNU=;
        b=IpMy0uZnmfMBM8Z10jTSUZMz4J7Lv91eQcqRZoWCBk3C+1lyVHOb2iJytboXgCfnZhfnwc
        XJsLGCZ99itJC4ifpTPuK4FwPhAc/usmU60Jv5/3hCNbJxMnV3pfidmodcPSPxp5BScQMq
        j8kdnwhl2C96lTOyOCJlCMVOvbgBNEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-907jp1zIOO6MlKYNx_2hhw-1; Mon, 31 May 2021 05:00:37 -0400
X-MC-Unique: 907jp1zIOO6MlKYNx_2hhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CD3A8042AE;
        Mon, 31 May 2021 09:00:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-120.pek2.redhat.com [10.72.12.120])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 48BF65D9D0;
        Mon, 31 May 2021 09:00:25 +0000 (UTC)
From:   Lianbo Jiang <lijiang@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     x86@kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, kexec@lists.infradead.org,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        luto@amacapital.net, bhe@redhat.com, dyoung@redhat.com
Subject: [PATCH v2] x86/efi: unconditionally hold the whole low-1MB memory regions
Date:   Mon, 31 May 2021 17:00:23 +0800
Message-Id: <20210531090023.16471-1-lijiang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some sub-1MB memory regions may be reserved by EFI boot services, and the
memory regions will be released later in the efi_free_boot_services().

Currently, always reserve all sub-1MB memory regions when the crashkernel
option is specified, but unfortunately EFI boot services may have already
reserved some sub-1MB memory regions before the crash_reserve_low_1M() is
called, which makes that the crash_reserve_low_1M() only own the
remaining sub-1MB memory regions, not all sub-1MB memory regions, because,
subsequently EFI boot services will free its own sub-1MB memory regions.
Eventually, DMA will be able to allocate memory from the sub-1MB area and
cause the following error:

crash> kmem -s |grep invalid
kmem: dma-kmalloc-512: slab: ffffd52c40001900 invalid freepointer: ffff9403c0067300
kmem: dma-kmalloc-512: slab: ffffd52c40001900 invalid freepointer: ffff9403c0067300
crash> vtop ffff9403c0067300
VIRTUAL           PHYSICAL
ffff9403c0067300  67300   --->The physical address falls into this range [0x0000000000063000-0x000000000008efff]

kernel debugging log:
...
[    0.008927] memblock_reserve: [0x0000000000010000-0x0000000000013fff] efi_reserve_boot_services+0x85/0xd0
[    0.008930] memblock_reserve: [0x0000000000063000-0x000000000008efff] efi_reserve_boot_services+0x85/0xd0
...
[    0.009425] memblock_reserve: [0x0000000000000000-0x00000000000fffff] crash_reserve_low_1M+0x2c/0x49
...
[    0.010586] Zone ranges:
[    0.010587]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.010589]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.010591]   Normal   [mem 0x0000000100000000-0x0000000c7fffffff]
[    0.010593]   Device   empty
...
[    8.814894] __memblock_free_late: [0x0000000000063000-0x000000000008efff] efi_free_boot_services+0x14b/0x23b
[    8.815793] __memblock_free_late: [0x0000000000010000-0x0000000000013fff] efi_free_boot_services+0x14b/0x23b

To fix the above issues, let's hold the whole low-1M memory regions
unconditionally in the efi_free_boot_services().

Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
---
Background(copy from bhe's comment in the patch v1):

Kdump kernel also need go through real mode code path during bootup. It
is not different than normal kernel except that it skips the firmware
resetting. So kdump kernel needs low 1M as system RAM just as normal
kernel does. Here we reserve the whole low 1M with memblock_reserve()
to avoid any later kernel or driver data reside in this area. Otherwise,
we need dump the content of this area to vmcore. As we know, when crash
happened, the old memory of 1st kernel should be untouched until vmcore
dumping read out its content. Meanwhile, kdump kernel need reuse low 1M.
In the past, we used a back up region to copy out the low 1M area, and
map the back up region into the low 1M area in vmcore elf file. In
6f599d84231fd27 ("x86/kdump: Always reserve the low 1M when the crashkernel
option is specified"), we changed to lock the whole low 1M to avoid
writting any kernel data into, like this we can skip this area when
dumping vmcore.

Above is why we try to memblock reserve the whole low 1M. We don't want
to use it, just don't want anyone to use it in 1st kernel.


 arch/x86/platform/efi/quirks.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
index 7850111008a8..840b7e3b3d48 100644
--- a/arch/x86/platform/efi/quirks.c
+++ b/arch/x86/platform/efi/quirks.c
@@ -11,6 +11,7 @@
 #include <linux/memblock.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/sizes.h>
 
 #include <asm/e820/api.h>
 #include <asm/efi.h>
@@ -409,7 +410,7 @@ void __init efi_free_boot_services(void)
 	for_each_efi_memory_desc(md) {
 		unsigned long long start = md->phys_addr;
 		unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
-		size_t rm_size;
+		unsigned long long end = start + size;
 
 		if (md->type != EFI_BOOT_SERVICES_CODE &&
 		    md->type != EFI_BOOT_SERVICES_DATA) {
@@ -431,23 +432,20 @@ void __init efi_free_boot_services(void)
 		efi_unmap_pages(md);
 
 		/*
-		 * Nasty quirk: if all sub-1MB memory is used for boot
-		 * services, we can get here without having allocated the
-		 * real mode trampoline.  It's too late to hand boot services
-		 * memory back to the memblock allocator, so instead
-		 * try to manually allocate the trampoline if needed.
-		 *
-		 * I've seen this on a Dell XPS 13 9350 with firmware
-		 * 1.4.4 with SGX enabled booting Linux via Fedora 24's
-		 * grub2-efi on a hard disk.  (And no, I don't know why
-		 * this happened, but Linux should still try to boot rather
-		 * panicking early.)
+		 * The sub-1MB memory may be within the range[0, SZ_1M]
+		 * or across the low-1M memory boundary. Let's handle
+		 * these two cases and hold the whole low-1M memory
+		 * unconditionally.
 		 */
-		rm_size = real_mode_size_needed();
-		if (rm_size && (start + rm_size) < (1<<20) && size >= rm_size) {
-			set_real_mode_mem(start);
-			start += rm_size;
-			size -= rm_size;
+		if (start < SZ_1M) {
+			/* Within the range[0, SZ_1M] */
+			if (end <= SZ_1M)
+				continue;
+			else {
+				/* Across the low-1M memory boundary */
+				size -= (SZ_1M - start);
+				start = SZ_1M;
+			}
 		}
 
 		memblock_free_late(start, size);
-- 
2.17.1


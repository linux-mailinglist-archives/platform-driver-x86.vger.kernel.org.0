Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7442915F171
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Feb 2020 19:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgBNPzw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 14 Feb 2020 10:55:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:37162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730653AbgBNPzw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Feb 2020 10:55:52 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D4ED24673;
        Fri, 14 Feb 2020 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581695750;
        bh=iVW8kYUZhNEhv4a1bYT2fR3fYrBKZHxbNJJMtyi5k9w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x486BSbgUxy4GWKRrAg0/5s/yyG7mO/Bmj/zztqjtX7NWZNANvs0xiAPeRseOSbv2
         6k68PayBT94lT8VwT3vv7vrAVXJSzqK3KMiTWD6yTv1hXORYML3DS2X2tWFbqUTuEo
         tLm8sxx7LfvIkpgTkP327CZ2Wu6t2LD9BdV8PRFM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Matthew Garrett <mjg59@google.com>, linux-efi@vger.kernel.org,
        Ingo Molnar <mingo@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org, x86@kernel.org
Subject: [PATCH AUTOSEL 5.5 320/542] efi/x86: Don't panic or BUG() on non-critical error conditions
Date:   Fri, 14 Feb 2020 10:45:12 -0500
Message-Id: <20200214154854.6746-320-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Ard Biesheuvel <ardb@kernel.org>

[ Upstream commit e2d68a955e49d61fd0384f23e92058dc9b79be5e ]

The logic in __efi_enter_virtual_mode() does a number of steps in
sequence, all of which may fail in one way or the other. In most
cases, we simply print an error and disable EFI runtime services
support, but in some cases, we BUG() or panic() and bring down the
system when encountering conditions that we could easily handle in
the same way.

While at it, replace a pointless page-to-virt-phys conversion with
one that goes straight from struct page to physical.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Matthew Garrett <mjg59@google.com>
Cc: linux-efi@vger.kernel.org
Link: https://lkml.kernel.org/r/20200103113953.9571-14-ardb@kernel.org
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/platform/efi/efi.c    | 28 ++++++++++++++--------------
 arch/x86/platform/efi/efi_64.c |  9 +++++----
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 06f69bcd233fe..ad4dd3a977533 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -1000,16 +1000,14 @@ static void __init __efi_enter_virtual_mode(void)
 
 	if (efi_alloc_page_tables()) {
 		pr_err("Failed to allocate EFI page tables\n");
-		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
-		return;
+		goto err;
 	}
 
 	efi_merge_regions();
 	new_memmap = efi_map_regions(&count, &pg_shift);
 	if (!new_memmap) {
 		pr_err("Error reallocating memory, EFI runtime non-functional!\n");
-		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
-		return;
+		goto err;
 	}
 
 	pa = __pa(new_memmap);
@@ -1023,8 +1021,7 @@ static void __init __efi_enter_virtual_mode(void)
 
 	if (efi_memmap_init_late(pa, efi.memmap.desc_size * count)) {
 		pr_err("Failed to remap late EFI memory map\n");
-		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
-		return;
+		goto err;
 	}
 
 	if (efi_enabled(EFI_DBG)) {
@@ -1032,12 +1029,11 @@ static void __init __efi_enter_virtual_mode(void)
 		efi_print_memmap();
 	}
 
-	BUG_ON(!efi.systab);
+	if (WARN_ON(!efi.systab))
+		goto err;
 
-	if (efi_setup_page_tables(pa, 1 << pg_shift)) {
-		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
-		return;
-	}
+	if (efi_setup_page_tables(pa, 1 << pg_shift))
+		goto err;
 
 	efi_sync_low_kernel_mappings();
 
@@ -1057,9 +1053,9 @@ static void __init __efi_enter_virtual_mode(void)
 	}
 
 	if (status != EFI_SUCCESS) {
-		pr_alert("Unable to switch EFI into virtual mode (status=%lx)!\n",
-			 status);
-		panic("EFI call to SetVirtualAddressMap() failed!");
+		pr_err("Unable to switch EFI into virtual mode (status=%lx)!\n",
+		       status);
+		goto err;
 	}
 
 	efi_free_boot_services();
@@ -1088,6 +1084,10 @@ static void __init __efi_enter_virtual_mode(void)
 
 	/* clean DUMMY object */
 	efi_delete_dummy_variable();
+	return;
+
+err:
+	clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
 }
 
 void __init efi_enter_virtual_mode(void)
diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index 08ce8177c3af1..52a1e5192fa80 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -392,11 +392,12 @@ int __init efi_setup_page_tables(unsigned long pa_memmap, unsigned num_pages)
 		return 0;
 
 	page = alloc_page(GFP_KERNEL|__GFP_DMA32);
-	if (!page)
-		panic("Unable to allocate EFI runtime stack < 4GB\n");
+	if (!page) {
+		pr_err("Unable to allocate EFI runtime stack < 4GB\n");
+		return 1;
+	}
 
-	efi_scratch.phys_stack = virt_to_phys(page_address(page));
-	efi_scratch.phys_stack += PAGE_SIZE; /* stack grows down */
+	efi_scratch.phys_stack = page_to_phys(page + 1); /* stack grows down */
 
 	npages = (_etext - _text) >> PAGE_SHIFT;
 	text = __pa(_text);
-- 
2.20.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42B1660977
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Jan 2023 23:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbjAFW1A (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 6 Jan 2023 17:27:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjAFW07 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Jan 2023 17:26:59 -0500
X-Greylist: delayed 251 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 06 Jan 2023 14:26:56 PST
Received: from a27-189.smtp-out.us-west-2.amazonses.com (a27-189.smtp-out.us-west-2.amazonses.com [54.240.27.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C4484BC9;
        Fri,  6 Jan 2023 14:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ude52klaz7ukvnrchdbsicqdl2lnui6h; d=aaront.org; t=1673043764;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=IAkFUGfi9w2afJOCyL3pooFYYZISSP9VHYGQ+Y9eV2o=;
        b=OYQCLSIch6DOwmPX2K8Ll7OHaE8uo0iDC49rm1Yz5s67bjhmmLXll+DnrBIPUbQF
        yF6MFuIP7nRN58Hj4oHw2yg8uGnKs2pETEnoRfv9mrfj7+tO9mQTTvu0nt4Uv3ENJOc
        wVohCO1FxB/IYTPURz8yt+ObzVM9XF2ofJ+437uA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673043764;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=IAkFUGfi9w2afJOCyL3pooFYYZISSP9VHYGQ+Y9eV2o=;
        b=ASqI4DHBxjBX+v7OS/nDhaunCTOVvrcIal3o7kqmS2TofWDDH2qGUpW5nv4C6rmv
        XjjbRxOlJG5rMtAAehcz5SVXpQeV4X9qHHQiBEyLVq89Pq4fI2z0JP1ofB92pgrN1w0
        lK7AbBwXoQb+X/FlaDBhg0HRZq7FYYRyff50IwN4=
From:   Aaron Thompson <dev@aaront.org>
To:     Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andy@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Darren Hart <dvhart@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@redhat.com>, Marco Elver <elver@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        x86@kernel.org, Aaron Thompson <dev@aaront.org>
Subject: [PATCH v3 1/1] mm: Always release pages to the buddy allocator in memblock_free_late().
Date:   Fri, 6 Jan 2023 22:22:44 +0000
Message-ID: <01010185892de53e-e379acfb-7044-4b24-b30a-e2657c1ba989-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106222222.1024-1-dev@aaront.org>
References: <20230106222222.1024-1-dev@aaront.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.OwdjDcIoZWY+bZWuVZYzryiuW455iyNkDEZFeL97Dng=:AmazonSES
X-SES-Outgoing: 2023.01.06-54.240.27.189
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, memblock_free_pages()
only releases pages to the buddy allocator if they are not in the
deferred range. This is correct for free pages (as defined by
for_each_free_mem_pfn_range_in_zone()) because free pages in the
deferred range will be initialized and released as part of the deferred
init process. memblock_free_pages() is called by memblock_free_late(),
which is used to free reserved ranges after memblock_free_all() has
run. All pages in reserved ranges have been initialized at that point,
and accordingly, those pages are not touched by the deferred init
process. This means that currently, if the pages that
memblock_free_late() intends to release are in the deferred range, they
will never be released to the buddy allocator. They will forever be
reserved.

In addition, memblock_free_pages() calls kmsan_memblock_free_pages(),
which is also correct for free pages but is not correct for reserved
pages. KMSAN metadata for reserved pages is initialized by
kmsan_init_shadow(), which runs shortly before memblock_free_all().

For both of these reasons, memblock_free_pages() should only be called
for free pages, and memblock_free_late() should call __free_pages_core()
directly instead.

One case where this issue can occur in the wild is EFI boot on
x86_64. The x86 EFI code reserves all EFI boot services memory ranges
via memblock_reserve() and frees them later via memblock_free_late()
(efi_reserve_boot_services() and efi_free_boot_services(),
respectively). If any of those ranges happens to fall within the
deferred init range, the pages will not be released and that memory will
be unavailable.

For example, on an Amazon EC2 t3.micro VM (1 GB) booting via EFI:

v6.2-rc2:
  # grep -E 'Node|spanned|present|managed' /proc/zoneinfo
  Node 0, zone      DMA
          spanned  4095
          present  3999
          managed  3840
  Node 0, zone    DMA32
          spanned  246652
          present  245868
          managed  178867

v6.2-rc2 + patch:
  # grep -E 'Node|spanned|present|managed' /proc/zoneinfo
  Node 0, zone      DMA
          spanned  4095
          present  3999
          managed  3840
  Node 0, zone    DMA32
          spanned  246652
          present  245868
          managed  222816   # +43,949 pages

Fixes: 3a80a7fa7989 ("mm: meminit: initialise a subset of struct pages if CONFIG_DEFERRED_STRUCT_PAGE_INIT is set")
Signed-off-by: Aaron Thompson <dev@aaront.org>
---
 mm/memblock.c                     | 8 +++++++-
 tools/testing/memblock/internal.h | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 511d4783dcf1..fc3d8fbd2060 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1640,7 +1640,13 @@ void __init memblock_free_late(phys_addr_t base, phys_addr_t size)
 	end = PFN_DOWN(base + size);
 
 	for (; cursor < end; cursor++) {
-		memblock_free_pages(pfn_to_page(cursor), cursor, 0);
+		/*
+		 * Reserved pages are always initialized by the end of
+		 * memblock_free_all() (by memmap_init() and, if deferred
+		 * initialization is enabled, memmap_init_reserved_pages()), so
+		 * these pages can be released directly to the buddy allocator.
+		 */
+		__free_pages_core(pfn_to_page(cursor), 0);
 		totalram_pages_inc();
 	}
 }
diff --git a/tools/testing/memblock/internal.h b/tools/testing/memblock/internal.h
index fdb7f5db7308..85973e55489e 100644
--- a/tools/testing/memblock/internal.h
+++ b/tools/testing/memblock/internal.h
@@ -15,6 +15,10 @@ bool mirrored_kernelcore = false;
 
 struct page {};
 
+void __free_pages_core(struct page *page, unsigned int order)
+{
+}
+
 void memblock_free_pages(struct page *page, unsigned long pfn,
 			 unsigned int order)
 {
-- 
2.30.2


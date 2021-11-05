Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAA2446A94
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Nov 2021 22:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbhKEVbG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Nov 2021 17:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233814AbhKEVbC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 17:31:02 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90693C061570
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:28:22 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id az8so9984602qkb.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Nov 2021 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jks3I8fcjhzIOYMy1pj9d8V57adFhYQFjVhjoHgCtkY=;
        b=cInTTVncQphHdaitMdAqnk4fNtCW7xX8BVA84/RmyGu6fcqcX4f8hT2RVZYJ6RAje7
         R53V4X95vPboYhNItwIfFeMgMU9BifeyS53ZnabmNw0Waq7KsQEYQH4Tp3qDELcDHqua
         uUsUifiMYs6a2Mfqei6Ej75KnS5Bq5twIZ4cW7YQF4MvIPugbIiujuc1d5St97ElqgQJ
         3UwtPtGG6Y5yrjVSNkqxXJri+tAuI6NaNKIlImz9PdKgztwv6QOQdOXYCK3RauVgTMT/
         pikEDgHQEm90lbka5gKUgL0srLbpc4HIGhZQgnznc1C0MW00NqzLcDq0EX6YQJIj7L1e
         GVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jks3I8fcjhzIOYMy1pj9d8V57adFhYQFjVhjoHgCtkY=;
        b=2ori6fAaj2Gfp2Wp1mGDm1CLGcUKwPyYs2vQGNDP6yZqycq7BAHDN08q3UbZipdlrJ
         hXrGjHm8b8DSTE3Bb4+vdeSnkqyh1aMS8/NfjBEwpVeVDJ/MHyctlgsGRWRYsmkCD2s9
         0vzXma7zZS9xGhEQhM9ajuekxQYCijRcSkrB4gvycfZo2EUKotoKUvo7yxYut5kjLvnJ
         EEqWciYEmVL6uQMrvwqayr24T7DQt5BjrmZuqIz4fe3mcB705VXb+2sN911QFgcka+ck
         SZOF8DB5TD4IvZM1PMWKLrKF3xX0rBzeeoo78Q6MQ/ouU27jVnEAm8jn8mtb4Qzk1taI
         Kcrg==
X-Gm-Message-State: AOAM533Mk3tuqpg4y9aT+8FUEHCtKD13LYwXjXhlgFCUZ4LbKyghybk3
        w/oX28zcJpMemJ+3qYT5Q1/a6A==
X-Google-Smtp-Source: ABdhPJy1mrXB8ozWkZoiHZCXchb/119XB3jx6ByNJLH0wcO7IS4+ptdSHFs1c7o8G7IrLvWwZnUVgg==
X-Received: by 2002:a05:620a:430a:: with SMTP id u10mr50286414qko.53.1636147701753;
        Fri, 05 Nov 2021 14:28:21 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id g8sm6636765qko.27.2021.11.05.14.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 14:28:20 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com, alex@eclypsium.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH 4/5] Mark e820_entries as crypto capable from EFI memmap
Date:   Fri,  5 Nov 2021 18:27:23 -0300
Message-Id: <20211105212724.2640-5-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
References: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Iterate over the EFI memmap finding the contiguous regions that are
able to do hardware encryption (ie, those who have the
EFI_MEMORY_CPU_CRYPTO enabled) and mark those in the e820_table.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 arch/x86/platform/efi/efi.c | 109 ++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 147c30a81f15..6cd1c11dbdad 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -441,6 +441,113 @@ static int __init efi_config_init(const efi_config_table_type_t *arch_tables)
 	return ret;
 }
 
+/*
+ * The contiguous_region type is used to help
+ * efi_mark_e820_regions_as_crypto_capable to pick all the contiguous
+ * regions that have the EFI_MEMORY_CPU_CRYPTO attribute, and call a
+ * function of the e820 module to mark those regions as being able to
+ * do hardware encryption.
+ *
+ * To use this properly the memory map must not have any overlapped
+ * regions and the regions should be sorted.
+ *
+ * cr in the function names stands for contiguous_region
+ */
+struct contiguous_region {
+	u64 start;
+	u64 end;
+};
+
+static void __init cr_init(struct contiguous_region *region)
+{
+	region->start = 0;
+	region->end = 0;
+}
+
+static void __init efi_md_to_cr(const efi_memory_desc_t *md,
+				struct contiguous_region *region)
+{
+	region->start = md->phys_addr;
+	region->end = md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT) - 1;
+}
+
+static u64 __init cr_size(const struct contiguous_region *r)
+{
+	return r->end - r->start + 1;
+}
+
+static bool __init cr_is_empty(const struct contiguous_region *r)
+{
+	/*
+	 * Since contiguous regions are built upon efi_memory_desc_t
+	 * it is safe to say that a region is empty if its size is
+	 * lower than the size of one EFI page.
+	 */
+	return cr_size(r) < (1 << EFI_PAGE_SHIFT);
+}
+
+static bool __init cr_merge_regions(struct contiguous_region *region1,
+				    const struct contiguous_region *region2)
+{
+	bool merged_result;
+
+	if (cr_is_empty(region1)) {
+		*region1 = *region2;
+		merged_result = true;
+	} else if (region1->end + 1 == region2->start) {
+		/* Extend region1 */
+		region1->end = region2->end;
+		merged_result = true;
+	} else {
+		merged_result = false;
+	}
+
+	return merged_result;
+}
+
+static void __init cr_mark_e820_as_crypto_capable(const struct contiguous_region *r)
+{
+	e820__mark_regions_as_crypto_capable(r->start, cr_size(r));
+}
+
+/*
+ * This assumes that there'll be no overlaps in the memory map
+ * (otherwise we'd have a deeper problem going on). It also assumes
+ * that the system DRAM regions are already sorted; in EDK2 based UEFI
+ * firmware the entries covering system DRAM are usually sorted, with
+ * additional MMIO entries appearing unordered. This is because the
+ * UEFI memory map is constructed from the GCD memory map, which is
+ * seeded with the DRAM regions at boot, and allocations are created
+ * by splitting them up.
+ */
+static void __init efi_mark_e820_regions_as_crypto_capable(void)
+{
+	efi_memory_desc_t *md;
+	struct contiguous_region prev_region;
+
+	cr_init(&prev_region);
+
+	for_each_efi_memory_desc(md) {
+		if (md->attribute & EFI_MEMORY_CPU_CRYPTO) {
+			struct contiguous_region cur_region;
+
+			efi_md_to_cr(md, &cur_region);
+
+			if (!cr_merge_regions(&prev_region, &cur_region)) {
+				cr_mark_e820_as_crypto_capable(&prev_region);
+				prev_region = cur_region;
+			} /* else: Merge succeeded, don't mark yet */
+		} else if (!cr_is_empty(&prev_region)) {
+			cr_mark_e820_as_crypto_capable(&prev_region);
+			cr_init(&prev_region);
+		} /* else: All previous regions are already marked */
+	}
+
+	/* Mark last region (if any) */
+	if (!cr_is_empty(&prev_region))
+		cr_mark_e820_as_crypto_capable(&prev_region);
+}
+
 void __init efi_init(void)
 {
 	if (IS_ENABLED(CONFIG_X86_32) &&
@@ -494,6 +601,8 @@ void __init efi_init(void)
 	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
 	efi_clean_memmap();
 
+	efi_mark_e820_regions_as_crypto_capable();
+
 	if (efi_enabled(EFI_DBG))
 		efi_print_memmap();
 }
-- 
2.30.2


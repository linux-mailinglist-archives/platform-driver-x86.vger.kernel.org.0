Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9E843D1F5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Oct 2021 21:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243755AbhJ0T7C (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 27 Oct 2021 15:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243745AbhJ0T7B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 15:59:01 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDB3C061570
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 12:56:35 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id x123so3614076qke.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 12:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jks3I8fcjhzIOYMy1pj9d8V57adFhYQFjVhjoHgCtkY=;
        b=ZDsqUMH7hPR62fzdZZG7HHgmrWGJCPEUAqjiMovgx8KqQeVmbfmUChboc290SHYeYw
         UxeqqK82xcG8FVmwnuJ9xW26T1P7cIpo4unAdfa1JxIfmSMQRWvUvD6BRxnP6/RmzHxy
         1lMNxk7kNmVesMyDI49UjBtwn/Z9dOrryNuuSE7r2BCjDd8+eGwOd/cmtn4ie0iBY32o
         4PXFozVDIW3eVWGV8W4h0cKV0NwXU8qZx00EzZPfE6a7hLS8UpY40HKgdFdBK/gtwKVy
         BOd4MJCD8tN68z8itKRd7NFkJ31++VJIMGywBktFDq2mwsvawjTk1cIKZH91CcEBjAHn
         K4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jks3I8fcjhzIOYMy1pj9d8V57adFhYQFjVhjoHgCtkY=;
        b=g2Tl2D/R12IxFJtx0cH+FBMYZAnI26/uX4cgKl8DTOxqDZI/gvnToboBAA9Sir3IUY
         9dVmqO6jwrrXMyNhdcOdaHBhI1BFNAWZIfmASzzrYQ3m9RHaL341AT3imcenC9dpmxyT
         s+2IouV1YkQiVKhL4AUqILmWXwVGo8D4GqQYfrAdAFqyMWrTdkKuWnygHey93OOaWm4a
         itUsxhVng+voXAKAXYrrsoUfZMffARss+Z5lxWgXjkI3Xz45Dk6NMsPdR5FS4/YvUvWA
         3KxpuwO+zT+WF4qOcW0T/rl6bQ9NKRMcDrsvC/c9sTPEwY9MyOTJiSYBka932PNYqjAw
         xLsw==
X-Gm-Message-State: AOAM530DvyMRNwd7RgjiMedoL60FlFy3xOyLt0hdesw6+gKvs2Fi4C6/
        FQD/ETN2MVw3DS0VhQIUonriWw==
X-Google-Smtp-Source: ABdhPJzSpBUn70G1+apYY+h/uxkwWrgVrnszHSdNcxk7Va1awQotQ9ia056Dqc0JotuTf08DwrWFIA==
X-Received: by 2002:a05:620a:2848:: with SMTP id h8mr19036839qkp.87.1635364595069;
        Wed, 27 Oct 2021 12:56:35 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id s11sm648649qki.95.2021.10.27.12.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 12:56:34 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        martin.fernandez@eclypsium.com, daniel.gutson@eclypsium.com,
        hughsient@gmail.com
Subject: [PATCH v2 4/5] Mark e820_entries as crypto capable from EFI memmap
Date:   Wed, 27 Oct 2021 16:55:10 -0300
Message-Id: <20211027195511.207552-5-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027195511.207552-1-martin.fernandez@eclypsium.com>
References: <20211027195511.207552-1-martin.fernandez@eclypsium.com>
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


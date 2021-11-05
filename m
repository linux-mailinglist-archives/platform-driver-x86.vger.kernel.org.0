Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9553446A91
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Nov 2021 22:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbhKEVaz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Nov 2021 17:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbhKEVay (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 17:30:54 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9562EC061570
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:28:14 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id 8so8390873qty.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Nov 2021 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xby3AcWuwiF2/YpLjxmhcrgchEGEkaLlTH6SE3Th+bE=;
        b=IifkAxBTls4cynemVSogKR3H6dUOsI1mhwiuEghC9Klx5EDzWhM7Z783hSMqRNoyus
         w63u8JbB/bnJ3nOdHXofGHJRSSagRqUUOoF4spSHXmVEpWZwJSS7jOjnqaw/Bi9cyhR9
         Wd9bSg5qAp4rI8zeB1SvXTi/mhXcT7gj90JA4LJMYPbPqQGfJKLm1jb1M6UozGER6Tf+
         F+7SnltJQ7kUP4WjRZ3fWYI7aBkOcLBxjOCXODQQcDZDmt7djy3k+ykNfH3uezs3XcmR
         3FcXbEWi+Bds7A+T8FA8/slBq7Ies2eUSdV442EQ/g3t9Va0kFujOyCNsn1MXgTiXuME
         hB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xby3AcWuwiF2/YpLjxmhcrgchEGEkaLlTH6SE3Th+bE=;
        b=V0uSU0+J/kuhc8dBMnGyebmL0jFoMWL6dkD2vv9ukAEnkA50EDGYK1LjjxKLyn89h3
         uCVjBpLzA9vFCgIId1RXAtxQ23MQZI9DSqgU4kFUSMiQDVWjb+l68HxIpb+YVduOy3ZM
         lYpuuQTrwTihJxyH3qfqHvJxyRKtKhZiW5Pa7shGWMoqTNK9zmM4gIE+OcmIKyTagSWM
         4ha1XXxq4PiqFTXqBQktCOT4BgcvjbGE/rhDxtSj4gzStJK1cdvyUAXFSt/NqgeHL5TZ
         7xbPavAom9JenenU+x6kp8aRGUp0yw9ccdBnC+xaz5b4VQ8c/2KqyHIR4hsB3Qwed6IJ
         MF8A==
X-Gm-Message-State: AOAM5328rWYA30g95WBvAENmWoHYzJ56vGUTni1MvzPoRCw6cSgqOaGB
        1eWDeJcMg9NzQU7bgxcUqZl9DQ==
X-Google-Smtp-Source: ABdhPJzIMFBMLfukUYnQ/uNALkNOeS11QAXEMcs9PgoejAXWTTnob38rcQL8CVRrBdHapmLhSMZjMQ==
X-Received: by 2002:a05:622a:1041:: with SMTP id f1mr38418377qte.2.1636147693846;
        Fri, 05 Nov 2021 14:28:13 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id t4sm6332429qkp.42.2021.11.05.14.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 14:28:13 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com, alex@eclypsium.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH 3/5] Extend e820_table to hold information about memory encryption
Date:   Fri,  5 Nov 2021 18:27:22 -0300
Message-Id: <20211105212724.2640-4-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
References: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new member in e820_entry to hold whether an entry is able to do
hardware memory encryption or not.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 arch/x86/include/asm/e820/api.h   |  2 ++
 arch/x86/include/asm/e820/types.h |  1 +
 arch/x86/kernel/e820.c            | 32 +++++++++++++++++++++++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/e820/api.h b/arch/x86/include/asm/e820/api.h
index e8f58ddd06d9..f3a09b6afca1 100644
--- a/arch/x86/include/asm/e820/api.h
+++ b/arch/x86/include/asm/e820/api.h
@@ -18,6 +18,8 @@ extern void e820__range_add   (u64 start, u64 size, enum e820_type type);
 extern u64  e820__range_update(u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
 extern u64  e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
 
+extern void e820__mark_regions_as_crypto_capable(u64 start, u64 size);
+
 extern void e820__print_table(char *who);
 extern int  e820__update_table(struct e820_table *table);
 extern void e820__update_table_print(void);
diff --git a/arch/x86/include/asm/e820/types.h b/arch/x86/include/asm/e820/types.h
index 314f75d886d0..231c9ad9a9c3 100644
--- a/arch/x86/include/asm/e820/types.h
+++ b/arch/x86/include/asm/e820/types.h
@@ -56,6 +56,7 @@ struct e820_entry {
 	u64			addr;
 	u64			size;
 	enum e820_type		type;
+	bool			crypto_capable;
 } __attribute__((packed));
 
 /*
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index bc0657f0deed..3e0aaa5525e0 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -176,6 +176,7 @@ static void __init __e820__range_add(struct e820_table *table, u64 start, u64 si
 	table->entries[x].addr = start;
 	table->entries[x].size = size;
 	table->entries[x].type = type;
+	table->entries[x].crypto_capable = false;
 	table->nr_entries++;
 }
 
@@ -184,6 +185,19 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
 	__e820__range_add(e820_table, start, size, type);
 }
 
+void __init e820__mark_regions_as_crypto_capable(u64 start, u64 size)
+{
+	int i;
+	u64 end = start + size;
+
+	for (i = 0; i < e820_table->nr_entries; i++) {
+		struct e820_entry *const entry = &e820_table->entries[i];
+
+		if (entry->addr >= start && entry->addr + entry->size <= end)
+			entry->crypto_capable = true;
+	}
+}
+
 static void __init e820_print_type(enum e820_type type)
 {
 	switch (type) {
@@ -211,6 +225,8 @@ void __init e820__print_table(char *who)
 			e820_table->entries[i].addr + e820_table->entries[i].size - 1);
 
 		e820_print_type(e820_table->entries[i].type);
+		pr_cont("%s",
+			e820_table->entries[i].crypto_capable ? "; crypto-capable" : "");
 		pr_cont("\n");
 	}
 }
@@ -327,6 +343,8 @@ int __init e820__update_table(struct e820_table *table)
 	unsigned long long last_addr;
 	u32 new_nr_entries, overlap_entries;
 	u32 i, chg_idx, chg_nr;
+	bool current_crypto;
+	bool last_crypto = false;
 
 	/* If there's only one memory region, don't bother: */
 	if (table->nr_entries < 2)
@@ -388,13 +406,17 @@ int __init e820__update_table(struct e820_table *table)
 		 * 1=usable, 2,3,4,4+=unusable)
 		 */
 		current_type = 0;
+		current_crypto = false;
 		for (i = 0; i < overlap_entries; i++) {
+			current_crypto = current_crypto || overlap_list[i]->crypto_capable;
 			if (overlap_list[i]->type > current_type)
 				current_type = overlap_list[i]->type;
 		}
 
 		/* Continue building up new map based on this information: */
-		if (current_type != last_type || e820_nomerge(current_type)) {
+		if (current_type != last_type ||
+		    current_crypto != last_crypto ||
+		    e820_nomerge(current_type)) {
 			if (last_type != 0)	 {
 				new_entries[new_nr_entries].size = change_point[chg_idx]->addr - last_addr;
 				/* Move forward only if the new size was non-zero: */
@@ -406,6 +428,9 @@ int __init e820__update_table(struct e820_table *table)
 			if (current_type != 0)	{
 				new_entries[new_nr_entries].addr = change_point[chg_idx]->addr;
 				new_entries[new_nr_entries].type = current_type;
+				new_entries[new_nr_entries].crypto_capable = current_crypto;
+
+				last_crypto = current_crypto;
 				last_addr = change_point[chg_idx]->addr;
 			}
 			last_type = current_type;
@@ -1321,7 +1346,10 @@ void __init e820__memblock_setup(void)
 		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
 			continue;
 
-		memblock_add(entry->addr, entry->size);
+		if (entry->crypto_capable)
+			memblock_add_crypto_capable(entry->addr, entry->size);
+		else
+			memblock_add(entry->addr, entry->size);
 	}
 
 	/* Throw away partial pages: */
-- 
2.30.2


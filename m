Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B1A45CE1A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Nov 2021 21:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbhKXUit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Nov 2021 15:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbhKXUit (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 15:38:49 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEB6C061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:35:39 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id j14so7690095uan.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A1xzUXa5x5Bog8pkez/HAfQHT5aX9xfLkxwoJiQMbWc=;
        b=R/VkjXX7MeaPnAJhsMccTmDjScX+FGCDi/gWTGbEyxNzjTrosEp2TMkxq4Q8QqnWX3
         EiR05kKzaCua2T5uLpS4x+98C9oM8i3LlhzcnBDeRGC24fGAoyeFvA1KVSV9AgEjeOVJ
         vH7np4lUkKx+qQHlPlhpJygvWwD869+WYK43+cFJ/C7Kd8v7ndmK5JMhk/uy9VzFsPCQ
         wXZsTrxo7Zt8TLdrpr5Nd9gnOKty6EwrQFR9x1l78oU9y4enfAPISe4cwYbaeioZHn+f
         mM5vGVQEMpumW+1F5JNtvk+ktfsQXcogAWs82IlNpm/nQEFmqB/in2eVlF72g+x7Orjp
         vNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A1xzUXa5x5Bog8pkez/HAfQHT5aX9xfLkxwoJiQMbWc=;
        b=pPcKongDseQW4a6w9XzP2iW5KI7I5LvNLODF8euT2JL3bdZP79hKnigOkW2q8vxfsP
         Ctqv7Zp8rq5+SfZdj2vQchwoZjfqhkRGOzFlMC5fU6qjwZF/S65MqW4n6YUn9UTL0J3a
         wCUv8aXsodsbz1jnOJtz2C5dMXr+9GPh2rCbQe23XsEpQ2G/yBwR2XfxiWg3Z/xihcxx
         wWuFmkRYowshODkLZMhnIesoA6GnLIF4d3DKkoHuxYpRNGXfj+KwWrbyjv3WV6v3XdQe
         VGRpWbinPaGzjh+cH8LsfEYGC85fY8DBNdRLim4UwRqWAWcELBfi4KkkqHy/GMFZ0O40
         uwhQ==
X-Gm-Message-State: AOAM5308IMzfAcqEujV5s0+sQ/ePIOrE+DNRSTB6fEg0APWbtMVk5Zpq
        U4FU0MZ5eodfePqxI1/wHBnstA==
X-Google-Smtp-Source: ABdhPJxrY7iEnE3QEj+1+FKnOjeDBmxUb2vIP8O2gzcsmt6jFXU8jIdP3ReeX+H4CHRVT1yoUpuYTQ==
X-Received: by 2002:a67:bc16:: with SMTP id t22mr27805377vsn.10.1637786138632;
        Wed, 24 Nov 2021 12:35:38 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id t11sm479278vkt.34.2021.11.24.12.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 12:35:38 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v2 1/5] mm/memblock: Tag memblocks with crypto capabilities
Date:   Wed, 24 Nov 2021 17:34:55 -0300
Message-Id: <20211124203459.4578-2-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211124203459.4578-1-martin.fernandez@eclypsium.com>
References: <20211124203459.4578-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the capability to mark regions of the memory memory_type able of
hardware memory encryption.

Also add the capability to query if all regions of a memory node are
able to do hardware memory encryption to call it when initializing the
nodes.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 include/linux/memblock.h |  5 ++++
 mm/memblock.c            | 49 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 34de69b3b8ba..a54665863f80 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -31,6 +31,7 @@ extern unsigned long long max_possible_pfn;
  * @MEMBLOCK_HOTPLUG: hotpluggable region
  * @MEMBLOCK_MIRROR: mirrored region
  * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
+ * @MEMBLOCK_CRYPTO_CAPABLE: capable of hardware encryption
  * reserved in the memory map; refer to memblock_mark_nomap() description
  * for further details
  */
@@ -39,6 +40,7 @@ enum memblock_flags {
 	MEMBLOCK_HOTPLUG	= 0x1,	/* hotpluggable region */
 	MEMBLOCK_MIRROR		= 0x2,	/* mirrored region */
 	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
+	MEMBLOCK_CRYPTO_CAPABLE = 0x8,  /* capable of hardware encryption */
 };
 
 /**
@@ -111,6 +113,9 @@ int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
 void memblock_trim_memory(phys_addr_t align);
 bool memblock_overlaps_region(struct memblock_type *type,
 			      phys_addr_t base, phys_addr_t size);
+bool memblock_node_is_crypto_capable(int nid);
+int memblock_mark_crypto_capable(phys_addr_t base, phys_addr_t size);
+int memblock_clear_crypto_capable(phys_addr_t base, phys_addr_t size);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index 5096500b2647..cd5553c3df5a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -191,6 +191,27 @@ bool __init_memblock memblock_overlaps_region(struct memblock_type *type,
 	return i < type->cnt;
 }
 
+/**
+ * memblock_node_is_crypto_capable - get if whole node is capable
+ * of encryption
+ * @nid: number of node
+ *
+ * Iterate over all memory memblock_type and find if all regions under
+ * node @nid are capable of hardware encryption.
+ */
+bool __init_memblock memblock_node_is_crypto_capable(int nid)
+{
+	struct memblock_region *region;
+
+	for_each_mem_region(region) {
+		if ((memblock_get_region_node(region) == nid) &&
+		    !(region->flags & MEMBLOCK_CRYPTO_CAPABLE))
+			return false;
+	}
+
+	return true;
+}
+
 /**
  * __memblock_find_range_bottom_up - find free area utility in bottom-up
  * @start: start of candidate range
@@ -884,6 +905,34 @@ static int __init_memblock memblock_setclr_flag(phys_addr_t base,
 	return 0;
 }
 
+/**
+ * memblock_mark_crypto_capable - Mark memory regions capable of hardware
+ * encryption with flag MEMBLOCK_CRYPTO_CAPABLE.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_crypto_capable(phys_addr_t base,
+						 phys_addr_t size)
+{
+	return memblock_setclr_flag(base, size, 1, MEMBLOCK_CRYPTO_CAPABLE);
+}
+
+/**
+ * memblock_clear_crypto_capable - Clear flag MEMBLOCK_CRYPTO for a
+ * specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_crypto_capable(phys_addr_t base,
+						  phys_addr_t size)
+{
+	return memblock_setclr_flag(base, size, 0, MEMBLOCK_CRYPTO_CAPABLE);
+}
+
 /**
  * memblock_mark_hotplug - Mark hotpluggable memory with flag MEMBLOCK_HOTPLUG.
  * @base: the base phys addr of the region
-- 
2.30.2


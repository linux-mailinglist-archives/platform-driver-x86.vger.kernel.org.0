Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6060F467E1D
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Dec 2021 20:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382833AbhLCT0U (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Dec 2021 14:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382828AbhLCT0U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Dec 2021 14:26:20 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ED0C061751
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Dec 2021 11:22:55 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id q14so4364264qtx.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Dec 2021 11:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YZB6hNG7HmOAiIB6oy3KuM5EzuvMU42E5iksCY/2vUM=;
        b=EGbtPZpC5K1SXrEhrNeKSNSQjgPJV1dIbuV86xslhBd0+FKexmSBkE5xturKYZmlb1
         n+YzgwQhvT0cBhMSc0ACcF4V93BTdb+SLhYyC7IlYm5HSSt8DrV4Lfjlm3KlRL7nIsq6
         gizk8XMhGIxyCoLk1Th66Xve8gYxMovynr1swAjG/pMq2T04beCXld5P3WVF6cBUfoV1
         kkRxuyUqnlhX0TXal/8tObJYE3JAWR0se6Ebdch4svodpUhemHQEZePGpBziGVQHrahh
         p5UvHBml+qnlrQNCl+XlCTdHjFRvHq3JoUEMK4qWPs8+164fBcd0N3AB1CIMfDmVUUqj
         Ea+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZB6hNG7HmOAiIB6oy3KuM5EzuvMU42E5iksCY/2vUM=;
        b=WhT3DRp7mbB6waN+yj4h9JDxi9SWpGdV1ijnuZ4SBMrWqPJ5wM0GXpFLqSV7ej+JDd
         4F1X/yCnQi75RPnIe/5lx+TvHBhNub9ZNtwrhTK0+lNNE0uvSieOLZTZH5PrzdBqyqWk
         kW21nMVVtvNqEzFDOE4y1pVQFzMIzuDtJXUSwADmo0O6kW0H2A4Sh0bX0TSDUS45cPWO
         RRF7HuV+Ssfpcq07KCn1BN7anMRMGaqJON0ZpYZ2n6kr6ohV0Ja35Ubrhbn/51ZVwTZf
         Djo9TqF+LFJmL0v30QHw3GIQ0vbId/vdKe31t2RfttgTreATCtJlnSncJEM2KuseJ/Aq
         xCbw==
X-Gm-Message-State: AOAM531eSjaGjLy8VsqWsV1QYdYZAUydsfXHQEj5DDGCX5SBKpxxBy/4
        I9MMz3XTkVxuAiZqLsUHdh0a1Q==
X-Google-Smtp-Source: ABdhPJyQcm3Npl/r6og4NZsfDZwcGWJnZCGjZtLTaKgvqAc3p1DuLiNuFU1R2A4+y9qiQTX7E1aNSw==
X-Received: by 2002:ac8:7f8c:: with SMTP id z12mr22734828qtj.564.1638559375108;
        Fri, 03 Dec 2021 11:22:55 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id c22sm2915239qtd.76.2021.12.03.11.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 11:22:54 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v3 1/5] mm/memblock: Tag memblocks with crypto capabilities
Date:   Fri,  3 Dec 2021 16:21:44 -0300
Message-Id: <20211203192148.585399-2-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
References: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
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
index 8adcf1fa8096..ec808ad93693 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -41,6 +41,7 @@ extern unsigned long long max_possible_pfn;
  * via a driver, and never indicated in the firmware-provided memory map as
  * system RAM. This corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED in the
  * kernel resource tree.
+ * @MEMBLOCK_CRYPTO_CAPABLE: capable of hardware encryption
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -48,6 +49,7 @@ enum memblock_flags {
 	MEMBLOCK_MIRROR		= 0x2,	/* mirrored region */
 	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
 	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
+	MEMBLOCK_CRYPTO_CAPABLE = 0x10,  /* capable of hardware encryption */
 };
 
 /**
@@ -121,6 +123,9 @@ int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
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
index 1018e50566f3..61ec50647469 100644
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
@@ -885,6 +906,34 @@ static int __init_memblock memblock_setclr_flag(phys_addr_t base,
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


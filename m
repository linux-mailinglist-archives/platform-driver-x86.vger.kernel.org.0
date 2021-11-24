Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9849845CE1C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Nov 2021 21:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbhKXUjC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Nov 2021 15:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235474AbhKXUjC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 15:39:02 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEDDC061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:35:52 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id t13so7727785uad.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKeQO5HIM6y0ycfWZfjEXt5cWodQspmVc0qLUoNycjw=;
        b=Cfr3vRCO2qArtB2zY1WwM4EzEzL0sTk9uNXAVtwdYprZbC1fHLFE1949XZ5h3knzR1
         3gV1+bojf02rCANR3bR81MWu48gca6FIIuY/geCf9sTHgQpoK1i+JzmA/vQQcYGExkjC
         1mCYw2rIQTUAmhtzD6NPGmIq2ij6ApLZUjcLPO/f8pK21guuKLwunwJ3bJLuVWJXUM2/
         7UN4tVR3zfc5npfEMmqKo040g+a2XChbbAGs8NA7MubO8qY+30I4K1bWbzV3PY1EAYEN
         mtNRlyvLk1Sq9p277fBJwfJYbw5CX2WUXHtlHT7vRvSJrMFL+r3Sy/smrxbV/ZXAv16A
         VNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKeQO5HIM6y0ycfWZfjEXt5cWodQspmVc0qLUoNycjw=;
        b=Fr4AEaxRIP03b8WaN8K5BStZfoJhW0vPUPgsHmPNfsom4G4SPq8VxCkQkU+l6w1zcO
         fAnU3Z7zmcVbiCZQyLyI8SESwh15aoTeCtxVdasDy+Pd2mVmqvevP0CL4YlF4stffu15
         pZDIziwF6CCFV+C+ZpR2k+8KoX4YhzQSdOZwxGDfN6wtV7VLrunXuBXq1a7224sus6/P
         LxTdBjGFFwHnECYCSXSgERvFlhCt92UauUWttZkANoWcnZ4k6PrqhQUP72cMpTdcWZ8L
         CYQ2kHxw3pMUZlyIgI+TtiIJGJEONYIxkNqFhkpFGt4mbX62713x4uSRB/CsDGHt+sH/
         mFOw==
X-Gm-Message-State: AOAM532SuqgeRXBJScJ8hTI8WW0jfAGw9QOiK87aCIpNxUw+SZJTYy+l
        JgDxleReBnz0LwzQaO8aLiigVA==
X-Google-Smtp-Source: ABdhPJy27G14bvEgPOr12Bgpg6q24+2aiosznoukbinhwt9NvM1t/b3YMAF/NwheI6DeiRVcv9hO4A==
X-Received: by 2002:a67:d31c:: with SMTP id a28mr29229200vsj.20.1637786151401;
        Wed, 24 Nov 2021 12:35:51 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id g187sm668093vsc.10.2021.11.24.12.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 12:35:51 -0800 (PST)
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
Subject: [PATCH v2 2/5] mm/mmzone: Tag pg_data_t with crypto capabilities
Date:   Wed, 24 Nov 2021 17:34:56 -0300
Message-Id: <20211124203459.4578-3-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211124203459.4578-1-martin.fernandez@eclypsium.com>
References: <20211124203459.4578-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new member in the pg_data_t struct tell whether the node
corresponding to that pg_data_t is able to do hardware memory encryption.

This will be read from sysfs.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 include/linux/mmzone.h | 3 +++
 mm/page_alloc.c        | 1 +
 2 files changed, 4 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6a1d79d84675..e437d7ebd8cc 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -855,6 +855,9 @@ typedef struct pglist_data {
 	struct task_struct *kcompactd;
 	bool proactive_compact_trigger;
 #endif
+
+	bool crypto_capable;
+
 	/*
 	 * This is a per-node reserve of pages that are not available
 	 * to userspace allocations.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b37435c274cf..a19d95bb5c0f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7575,6 +7575,7 @@ static void __init free_area_init_node(int nid)
 	pgdat->node_id = nid;
 	pgdat->node_start_pfn = start_pfn;
 	pgdat->per_cpu_nodestats = NULL;
+	pgdat->crypto_capable = memblock_node_is_crypto_capable(nid);
 
 	pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
 		(u64)start_pfn << PAGE_SHIFT,
-- 
2.30.2


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE71446A8F
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Nov 2021 22:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhKEVas (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Nov 2021 17:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbhKEVar (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 17:30:47 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF9BC061570
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:28:07 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id c12so3783947qtd.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Nov 2021 14:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mf7MHrsfS1iznKNhSHLhi/OpB4abwQRglzu/1XEi4uw=;
        b=V0MpLc5bxq9jyycWaapncy8o78khSMcJkNqaJP4YUDCUip6H1wln3UZpGJS8K2Y1NK
         LIcD+DVhZKKBflP4Kx3GrCWIbbh8HvTntvLFC+wtuw1/r9sUn0rRGUXatl8pNjtUzUqg
         9SG9IA96WDI3Mu4E5imNL8Cx07DXFaFIkgHd/SZsuwcL8PPzPk+uBYHkS4e319E4p9uF
         NbBiVvgAoo1t/C02lWAayBYoMslW+epimWkBJ+O4gfCpqZWVKMdxpYwhGDLXDlqh3Nlu
         7NoFsf6xGuSy8Or1Z+dSxW1Yi786wKJqD2O94MOX235631exm52YHVjHOa++tjlakU2l
         v74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mf7MHrsfS1iznKNhSHLhi/OpB4abwQRglzu/1XEi4uw=;
        b=eorhzhw+lWo6wjGwByk5+9ujR6iYuQBcpYE7giXlhkEfKUKMcf+vjqlS7Y+D/hohCM
         63lmg7npoczJda2iH7nAqXIYTAVlorJPWcOzlWhm30gN56h2W9VkfszIdzjaVhivMt8V
         YRRgPpOaYTB/aJAbzw/mBAMofxbyl3Xler+uTLDabRAHvZ2Aco9qYHZkWFEJFW/izq+q
         FB2qD8uZjQ++XloWAWJZy1E+ZDEqJRhWsAV804ApP5djINutZIlFOw3VmePsw7x62yig
         2ytlxmMgqYmAyf3rcEtl0yy/SVkfnWpWzZYIWqlDIKKJ/QhNRQkeP8NF3L0ddN2y80NC
         Pi4Q==
X-Gm-Message-State: AOAM531zaT58vTM7b/6vT+D1PWBmmy7fDctFN0wwwCzXU1fXp00463zi
        ps71w1LBDiB1iy1jNiCuGDipvQ==
X-Google-Smtp-Source: ABdhPJxlcHhAWto6prVmhWvyfsnasrRCaK9FwrVQq2OOh+uD88o9xTgbkMg4DnSo9gDYedjt6jYmuw==
X-Received: by 2002:a05:622a:1392:: with SMTP id o18mr65981668qtk.107.1636147687070;
        Fri, 05 Nov 2021 14:28:07 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id o5sm5793503qkl.50.2021.11.05.14.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 14:28:06 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com, alex@eclypsium.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH 2/5] Extend pg_data_t to hold information about memory encryption
Date:   Fri,  5 Nov 2021 18:27:21 -0300
Message-Id: <20211105212724.2640-3-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
References: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new member in the pg_data_t struct to tell whether the node
corresponding to that pg_data_t is able to do hardware memory encryption.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 include/linux/mmzone.h | 2 ++
 mm/page_alloc.c        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6a1d79d84675..998fbe371a81 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -869,6 +869,8 @@ typedef struct pglist_data {
 	unsigned long		min_slab_pages;
 #endif /* CONFIG_NUMA */

+	bool crypto_capable;
+
 	/* Write-intensive fields used by page reclaim */
 	ZONE_PADDING(_pad1_)

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


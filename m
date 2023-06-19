Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E80C73603A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Jun 2023 01:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjFSXnv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 19 Jun 2023 19:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjFSXnj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2023 19:43:39 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0E01A4;
        Mon, 19 Jun 2023 16:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687218219; x=1718754219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93F5iXdL1aFe8xiqIFZhy89J/IUrk/GxSpjv1QQ9jI0=;
  b=DTkuV9hSKSVd+wYCSoMEpj6y+gTl+n2bl6SwRvDqN5XgyPeGK7u/dQpV
   QN2epjFjSSvSrTEb2cR/+RqUo1yZ2BLJlgMgk36irYSRAs6ylEe23Ynie
   dcijUwfU4tf2hpsRLjOWJ7ltkif/7JSXxnG7Bf9eZOVnY0aAJ4M/PrCqf
   WbvuEon0uFWeQGzlDh92te5hYgloYHpmBrF+mpcQA4Fnma3Xw7RDPW0II
   //XRmKtnVxTo26it36Gh5C0V3yy9xmxapiVlNJKPiSrZwgA//3fwG7FvG
   NmmmOFNmDrGqzBg7m7DipOPV6KWhzpkL4Zt2MLrO80UyGn6a97W3SY2Aj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="340071499"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="340071499"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 16:43:38 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="747789703"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="747789703"
Received: from unknown (HELO fred..) ([172.25.112.68])
  by orsmga001.jf.intel.com with ESMTP; 19 Jun 2023 16:43:36 -0700
From:   Xin Li <xin3.li@intel.com>
To:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        iommu@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-perf-users@vger.kernel.org, x86@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, steve.wahl@hpe.com,
        mike.travis@hpe.com, dimitri.sivanich@hpe.com,
        russ.anderson@hpe.com, dvhart@infradead.org, andy@infradead.org,
        joro@8bytes.org, suravee.suthikulpanit@amd.com, will@kernel.org,
        robin.murphy@arm.com, kys@microsoft.com, haiyangz@microsoft.com,
        wei.liu@kernel.org, decui@microsoft.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, peterz@infradead.org, acme@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
        adrian.hunter@intel.com, xin3.li@intel.com, seanjc@google.com,
        jiangshanlai@gmail.com, jgg@ziepe.ca, yangtiezhu@loongson.cn
Subject: [PATCH 3/3] tools: Get rid of IRQ_MOVE_CLEANUP_VECTOR from tools
Date:   Mon, 19 Jun 2023 16:16:11 -0700
Message-Id: <20230619231611.2230-4-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619231611.2230-1-xin3.li@intel.com>
References: <20230619231611.2230-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Get rid of IRQ_MOVE_CLEANUP_VECTOR from tools.

Signed-off-by: Xin Li <xin3.li@intel.com>
---
 tools/arch/x86/include/asm/irq_vectors.h               | 7 -------
 tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/tools/arch/x86/include/asm/irq_vectors.h b/tools/arch/x86/include/asm/irq_vectors.h
index 43dcb9284208..3a19904c2db6 100644
--- a/tools/arch/x86/include/asm/irq_vectors.h
+++ b/tools/arch/x86/include/asm/irq_vectors.h
@@ -35,13 +35,6 @@
  */
 #define FIRST_EXTERNAL_VECTOR		0x20
 
-/*
- * Reserve the lowest usable vector (and hence lowest priority)  0x20 for
- * triggering cleanup after irq migration. 0x21-0x2f will still be used
- * for device interrupts.
- */
-#define IRQ_MOVE_CLEANUP_VECTOR		FIRST_EXTERNAL_VECTOR
-
 #define IA32_SYSCALL_VECTOR		0x80
 
 /*
diff --git a/tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh b/tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh
index eed9ce0fcbe6..87dc68c7de0c 100755
--- a/tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh
+++ b/tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh
@@ -12,7 +12,7 @@ x86_irq_vectors=${arch_x86_header_dir}/irq_vectors.h
 
 # FIRST_EXTERNAL_VECTOR is not that useful, find what is its number
 # and then replace whatever is using it and that is useful, which at
-# the time of writing of this script was: IRQ_MOVE_CLEANUP_VECTOR.
+# the time of writing of this script was: 0x20.
 
 first_external_regex='^#define[[:space:]]+FIRST_EXTERNAL_VECTOR[[:space:]]+(0x[[:xdigit:]]+)$'
 first_external_vector=$(grep -E ${first_external_regex} ${x86_irq_vectors} | sed -r "s/${first_external_regex}/\1/g")
-- 
2.34.1


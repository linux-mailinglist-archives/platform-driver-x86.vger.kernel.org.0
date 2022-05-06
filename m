Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F8351CEE8
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 May 2022 04:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387994AbiEFBo3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 May 2022 21:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387987AbiEFBo1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 May 2022 21:44:27 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB42C554AD;
        Thu,  5 May 2022 18:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651801245; x=1683337245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yCK4aLHgFlFQcVpSsYEmFAE5+5JXPoVAXOFiNzF+7xU=;
  b=FaoASQ9rSV/IMsXZMe44C2ro3Zo/AyAs7bHPpp1hivPX1Q3OzebQH8mN
   82A4h+ya4LLPwfmEgiNHPjYuiGOW/uAyJRwtoXzcJVhoDYUZG4IGZpumD
   I2hnJpOjBzLkID60mWrGrBtXZlYedKuGAQiQ7nd1AI+G7QMgwD2PPr//r
   OdMd7aPYBy7fQwSTDnV2eTWXxrDfzX6ZlGAAZrcn7lTyCaEymZFTCPTw/
   dLfb7Ao+9e32feReq7jVkKb6r4GNzehddukU77mjmsbUWkUBnzd3Dfxvo
   qMXHnpszgBHI6hfIEJa4q9VFBB/XfvvFBl/3n7DbFYXI1FgyaqIponsgc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293519423"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="293519423"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 18:40:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="537645013"
Received: from agluck-desk3.sc.intel.com ([172.25.222.78])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 18:40:43 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, jithu.joseph@intel.com,
        ashok.raj@intel.com, tony.luck@intel.com, rostedt@goodmis.org,
        dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        Borislav Petkov <bp@suse.de>
Subject: [PATCH v6 01/11] x86/microcode/intel: Expose collect_cpu_info_early() for IFS
Date:   Thu,  5 May 2022 18:40:25 -0700
Message-Id: <20220506014035.1173578-2-tony.luck@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506014035.1173578-1-tony.luck@intel.com>
References: <20220428153849.295779-1-tony.luck@intel.com>
 <20220506014035.1173578-1-tony.luck@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Jithu Joseph <jithu.joseph@intel.com>

IFS is a CPU feature that allows a binary blob, similar to microcode,
to be loaded and consumed to perform low level validation of CPU
circuitry. In fact, it carries the same Processor Signature
(family/model/stepping) details that are contained in Intel microcode
blobs.

In support of an IFS driver to trigger loading, validation, and running
of these tests blobs, make the functionality of cpu_signatures_match()
and collect_cpu_info_early() available outside of the microcode driver.

Add an "intel_" prefix and drop the "_early" suffix from
collect_cpu_info_early() and EXPORT_SYMBOL_GPL() it. Add
declaration to x86 <asm/cpu.h>

Make cpu_signatures_match() an inline function in x86 <asm/cpu.h>,
and also give it an "intel_" prefix.

No functional change intended.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
Co-developed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Borislav Petkov <bp@suse.de>
Reviewed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/include/asm/cpu.h            | 18 ++++++++
 arch/x86/kernel/cpu/intel.c           | 32 +++++++++++++++
 arch/x86/kernel/cpu/microcode/intel.c | 59 ++++-----------------------
 3 files changed, 57 insertions(+), 52 deletions(-)

diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index 86e5e4e26fcb..990167357c34 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -76,4 +76,22 @@ static inline void init_ia32_feat_ctl(struct cpuinfo_x86 *c) {}
 
 extern __noendbr void cet_disable(void);
 
+struct ucode_cpu_info;
+
+int intel_cpu_collect_info(struct ucode_cpu_info *uci);
+
+static inline bool intel_cpu_signatures_match(unsigned int s1, unsigned int p1,
+					      unsigned int s2, unsigned int p2)
+{
+	if (s1 != s2)
+		return false;
+
+	/* Processor flags are either both 0 ... */
+	if (!p1 && !p2)
+		return true;
+
+	/* ... or they intersect. */
+	return p1 & p2;
+}
+
 #endif /* _ASM_X86_CPU_H */
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index f7a5370a9b3b..94779146275d 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -181,6 +181,38 @@ static bool bad_spectre_microcode(struct cpuinfo_x86 *c)
 	return false;
 }
 
+int intel_cpu_collect_info(struct ucode_cpu_info *uci)
+{
+	unsigned int val[2];
+	unsigned int family, model;
+	struct cpu_signature csig = { 0 };
+	unsigned int eax, ebx, ecx, edx;
+
+	memset(uci, 0, sizeof(*uci));
+
+	eax = 0x00000001;
+	ecx = 0;
+	native_cpuid(&eax, &ebx, &ecx, &edx);
+	csig.sig = eax;
+
+	family = x86_family(eax);
+	model  = x86_model(eax);
+
+	if (model >= 5 || family > 6) {
+		/* get processor flags from MSR 0x17 */
+		native_rdmsr(MSR_IA32_PLATFORM_ID, val[0], val[1]);
+		csig.pf = 1 << ((val[1] >> 18) & 7);
+	}
+
+	csig.rev = intel_get_microcode_revision();
+
+	uci->cpu_sig = csig;
+	uci->valid = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(intel_cpu_collect_info);
+
 static void early_init_intel(struct cpuinfo_x86 *c)
 {
 	u64 misc_enable;
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index d28a9f8f3fec..025c8f0cd948 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -45,20 +45,6 @@ static struct microcode_intel *intel_ucode_patch;
 /* last level cache size per core */
 static int llc_size_per_core;
 
-static inline bool cpu_signatures_match(unsigned int s1, unsigned int p1,
-					unsigned int s2, unsigned int p2)
-{
-	if (s1 != s2)
-		return false;
-
-	/* Processor flags are either both 0 ... */
-	if (!p1 && !p2)
-		return true;
-
-	/* ... or they intersect. */
-	return p1 & p2;
-}
-
 /*
  * Returns 1 if update has been found, 0 otherwise.
  */
@@ -69,7 +55,7 @@ static int find_matching_signature(void *mc, unsigned int csig, int cpf)
 	struct extended_signature *ext_sig;
 	int i;
 
-	if (cpu_signatures_match(csig, cpf, mc_hdr->sig, mc_hdr->pf))
+	if (intel_cpu_signatures_match(csig, cpf, mc_hdr->sig, mc_hdr->pf))
 		return 1;
 
 	/* Look for ext. headers: */
@@ -80,7 +66,7 @@ static int find_matching_signature(void *mc, unsigned int csig, int cpf)
 	ext_sig = (void *)ext_hdr + EXT_HEADER_SIZE;
 
 	for (i = 0; i < ext_hdr->count; i++) {
-		if (cpu_signatures_match(csig, cpf, ext_sig->sig, ext_sig->pf))
+		if (intel_cpu_signatures_match(csig, cpf, ext_sig->sig, ext_sig->pf))
 			return 1;
 		ext_sig++;
 	}
@@ -342,37 +328,6 @@ scan_microcode(void *data, size_t size, struct ucode_cpu_info *uci, bool save)
 	return patch;
 }
 
-static int collect_cpu_info_early(struct ucode_cpu_info *uci)
-{
-	unsigned int val[2];
-	unsigned int family, model;
-	struct cpu_signature csig = { 0 };
-	unsigned int eax, ebx, ecx, edx;
-
-	memset(uci, 0, sizeof(*uci));
-
-	eax = 0x00000001;
-	ecx = 0;
-	native_cpuid(&eax, &ebx, &ecx, &edx);
-	csig.sig = eax;
-
-	family = x86_family(eax);
-	model  = x86_model(eax);
-
-	if ((model >= 5) || (family > 6)) {
-		/* get processor flags from MSR 0x17 */
-		native_rdmsr(MSR_IA32_PLATFORM_ID, val[0], val[1]);
-		csig.pf = 1 << ((val[1] >> 18) & 7);
-	}
-
-	csig.rev = intel_get_microcode_revision();
-
-	uci->cpu_sig = csig;
-	uci->valid = 1;
-
-	return 0;
-}
-
 static void show_saved_mc(void)
 {
 #ifdef DEBUG
@@ -386,7 +341,7 @@ static void show_saved_mc(void)
 		return;
 	}
 
-	collect_cpu_info_early(&uci);
+	intel_cpu_collect_info(&uci);
 
 	sig	= uci.cpu_sig.sig;
 	pf	= uci.cpu_sig.pf;
@@ -502,7 +457,7 @@ void show_ucode_info_early(void)
 	struct ucode_cpu_info uci;
 
 	if (delay_ucode_info) {
-		collect_cpu_info_early(&uci);
+		intel_cpu_collect_info(&uci);
 		print_ucode_info(&uci, current_mc_date);
 		delay_ucode_info = 0;
 	}
@@ -604,7 +559,7 @@ int __init save_microcode_in_initrd_intel(void)
 	if (!(cp.data && cp.size))
 		return 0;
 
-	collect_cpu_info_early(&uci);
+	intel_cpu_collect_info(&uci);
 
 	scan_microcode(cp.data, cp.size, &uci, true);
 
@@ -637,7 +592,7 @@ static struct microcode_intel *__load_ucode_intel(struct ucode_cpu_info *uci)
 	if (!(cp.data && cp.size))
 		return NULL;
 
-	collect_cpu_info_early(uci);
+	intel_cpu_collect_info(uci);
 
 	return scan_microcode(cp.data, cp.size, uci, false);
 }
@@ -712,7 +667,7 @@ void reload_ucode_intel(void)
 	struct microcode_intel *p;
 	struct ucode_cpu_info uci;
 
-	collect_cpu_info_early(&uci);
+	intel_cpu_collect_info(&uci);
 
 	p = find_patch(&uci);
 	if (!p)
-- 
2.35.1


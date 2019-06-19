Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92C54B696
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 Jun 2019 13:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfFSLA2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 19 Jun 2019 07:00:28 -0400
Received: from 36-225-108-158.dynamic-ip.hinet.net ([36.225.108.158]:36978
        "EHLO E6440.gar.corp.intel.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726751AbfFSLA2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Jun 2019 07:00:28 -0400
X-Greylist: delayed 2018 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jun 2019 07:00:28 EDT
Received: from E6440.gar.corp.intel.com (localhost [127.0.0.1])
        by E6440.gar.corp.intel.com (Postfix) with ESMTP id 414CDC1165;
        Wed, 19 Jun 2019 16:28:14 +0800 (CST)
From:   Harry Pan <harry.pan@intel.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     gs0622@gmail.com, Harry Pan <harry.pan@intel.com>,
        Vishwanath Somayaji <vishwanath.somayaji@intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Darren Hart <dvhart@infradead.org>
Subject: [PATCH v3] platform/x86: intel_pmc_core: transform Pkg C-state residency from TSC ticks into microseconds
Date:   Wed, 19 Jun 2019 16:28:01 +0800
Message-Id: <20190619082801.21699-1-harry.pan@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528025727.6014-1-harry.pan@intel.com>
References: <20190528025727.6014-1-harry.pan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Refer to the Intel SDM Vol.4, the package C-state residency counters
of modern IA micro-architecture are all ticking in TSC frequency,
hence we can apply simple math to transform the ticks into microseconds.
i.e.,
residency (ms) = count / tsc_khz
residency (us) = count / tsc_khz * 1000

This also aligns to other sysfs debug entries of residency counter in
the same metric in microseconds, benefits reading and scripting.

v2: restore the accidentally deleted newline, no function change.
v3: apply kernel do_div() macro to calculate division

Signed-off-by: Harry Pan <harry.pan@intel.com>

---

 drivers/platform/x86/intel_pmc_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f2c621b55f49..ab798efacc85 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -24,6 +24,7 @@
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/msr.h>
+#include <asm/tsc.h>
 
 #include "intel_pmc_core.h"
 
@@ -738,7 +739,9 @@ static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
 		if (rdmsrl_safe(map[index].bit_mask, &pcstate_count))
 			continue;
 
-		seq_printf(s, "%-8s : 0x%llx\n", map[index].name,
+		pcstate_count *= 1000;
+		do_div(pcstate_count, tsc_khz);
+		seq_printf(s, "%-8s : %llu\n", map[index].name,
 			   pcstate_count);
 	}
 
-- 
2.20.1


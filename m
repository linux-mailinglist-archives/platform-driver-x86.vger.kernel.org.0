Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E49B99AC8
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 Aug 2019 19:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390430AbfHVRIk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 22 Aug 2019 13:08:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390422AbfHVRIi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Aug 2019 13:08:38 -0400
Received: from sasha-vm.mshome.net (wsip-184-188-36-2.sd.sd.cox.net [184.188.36.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A58B2342A;
        Thu, 22 Aug 2019 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566493717;
        bh=v6CLPFTPD9bw6DudDkxxB588VZFuwJvTzq5aEVjbx3k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l2xr8I9aJZmL3RiVmd0mfaFU11Q1BsUI3U82hv3kXoraV7Ynijbe1pQUtQEa0M+fy
         sOZd/SMgXph00gBOziYezCBhCH+3JZzj19+OhM5r9ePSaQSp0a5KRstRsAqJ0OcG+n
         X9ImhLcJqGV9X2hELbTB0y+DiPKXQLDA20TXxtU4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.2 044/135] platform/x86: intel_pmc_core: Add ICL-NNPI support to PMC Core
Date:   Thu, 22 Aug 2019 13:06:40 -0400
Message-Id: <20190822170811.13303-45-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822170811.13303-1-sashal@kernel.org>
References: <20190822170811.13303-1-sashal@kernel.org>
MIME-Version: 1.0
X-KernelTest-Patch: http://kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.2.10-rc1.gz
X-KernelTest-Tree: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
X-KernelTest-Branch: linux-5.2.y
X-KernelTest-Patches: git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
X-KernelTest-Version: 5.2.10-rc1
X-KernelTest-Deadline: 2019-08-24T17:07+00:00
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>

[ Upstream commit 66013e8ec6850f9c62df6aea555fe7668e84dc3c ]

Ice Lake Neural Network Processor for deep learning inference a.k.a.
ICL-NNPI can re-use Ice Lake Mobile regmap to enable Intel PMC Core
driver on it.

Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Link: https://lkml.org/lkml/2019/6/5/1034
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel_pmc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 1d902230ba611..be6cda89dcf5b 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -815,6 +815,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	INTEL_CPU_FAM6(KABYLAKE_DESKTOP, spt_reg_map),
 	INTEL_CPU_FAM6(CANNONLAKE_MOBILE, cnp_reg_map),
 	INTEL_CPU_FAM6(ICELAKE_MOBILE, icl_reg_map),
+	INTEL_CPU_FAM6(ICELAKE_NNPI, icl_reg_map),
 	{}
 };
 
-- 
2.20.1


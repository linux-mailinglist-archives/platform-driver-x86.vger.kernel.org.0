Return-Path: <platform-driver-x86+bounces-10923-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC63A83017
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Apr 2025 21:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E56441D05
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Apr 2025 19:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DA027BF8B;
	Wed,  9 Apr 2025 19:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQIaXS51"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E25278178;
	Wed,  9 Apr 2025 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225866; cv=none; b=PjkQ3b6VvvgqmbD82SJXEgJjb5+V4TnqurJo9RJsdPYfTvAT9WWM/ByCBi23do/jUhsxkt0dpTZAykvgXclsyJut7itXNMqxvgN/32Arb0L4kLZ4jH7dZCrVYpbYGvZr9/Uk9C2qecVIcq+1mNYX5vtm6QpDzsghg2OnepGMdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225866; c=relaxed/simple;
	bh=lpJsU9iy11FDUJMjbmjkElc6nW3jvhD3qSFafGs65Yg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=in3L8styTxiYoCIxcGdHS4lss/H+lLqin9WnAUd/mq4XAB8WUKrm9GmrBrwVZoXOva9kL/wALShgcOWelwvcXBCiRpQAM8+NmyI3WU7nAwCbenK2USee7bfqg+dJa5nVJLAAbooSowmaahH1XC4ECiiprqFhgHSQCUUb5l+6Mpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQIaXS51; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744225865; x=1775761865;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lpJsU9iy11FDUJMjbmjkElc6nW3jvhD3qSFafGs65Yg=;
  b=LQIaXS51cTSazexhYVU4I+hDPe+NhxRGTz0S+1PdxJC5BcNKiWvS0092
   r5rogcMCK9mGwxKjLzTkuxFaj9bp7iN0JUAAJTQzF7nJ2TJ6Uya87DgdU
   utfMjHaU2ChQsYe6rqil7IvHGf+Okkg4qXKMB5Fk1FysSfFtDw0AXMP8D
   A+quwKssZjbpGLlEyauocjoBVE039Cxo0O/NW9Z6+6j+dDyQA9Q2DTPI8
   JiCCMwDjS0CCAfuIkBUl9FNoPXZSdfqoeSMPp7KzTMzjSx72Kx/Gitip6
   TJqBrRWom9rLBtTgPlvq2jywK2kOJnAi+TyCEPC6xbT0mhswcdXv+1BdI
   g==;
X-CSE-ConnectionGUID: Ft5HcSwMRKGlCAp4z4S05Q==
X-CSE-MsgGUID: J0ja2BmBQlWjPUVRgOGydg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56386774"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="56386774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 12:11:02 -0700
X-CSE-ConnectionGUID: 905ZdpwdSEekT4QXJntgag==
X-CSE-MsgGUID: Kbn3VqLEQRSDP89SMgep7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133401252"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO xpardee-desk.intel.com) ([10.124.220.250])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 12:11:02 -0700
From: Xi Pardee <xi.pardee@linux.intel.com>
To: xi.pardee@linux.intel.com,
	irenic.rajneesh@gmail.com,
	david.e.box@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 4/8] platform/x86:intel/pmc: Convert index variables to be unsigned
Date: Wed,  9 Apr 2025 12:10:46 -0700
Message-ID: <20250409191056.15434-5-xi.pardee@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409191056.15434-1-xi.pardee@linux.intel.com>
References: <20250409191056.15434-1-xi.pardee@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the index variables type to be unsigned to avoid confusion
and error.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/core.c            | 5 +++--
 drivers/platform/x86/intel/pmc/core.h            | 2 +-
 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index a42dc62d70da..a53a7677122c 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1457,7 +1457,8 @@ static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc)
 
 static int pmc_core_ssram_get_lpm_reqs(struct pmc_dev *pmcdev)
 {
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	if (!pmcdev->ssram_pcidev)
 		return -ENODEV;
@@ -1484,7 +1485,7 @@ const struct pmc_reg_map *pmc_core_find_regmap(struct pmc_info *list, u16 devid)
 }
 
 int pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
-		     const struct pmc_reg_map *reg_map, int pmc_index)
+		     const struct pmc_reg_map *reg_map, unsigned int pmc_index)
 {
 	struct pmc *pmc = pmcdev->pmcs[pmc_index];
 
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index ce1b949b1004..c3b07075d017 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -515,7 +515,7 @@ int pmc_core_ssram_init(struct pmc_dev *pmcdev, int func);
 int generic_core_init(struct pmc_dev *pmcdev, struct pmc_dev_info *pmc_dev_info);
 const struct pmc_reg_map *pmc_core_find_regmap(struct pmc_info *list, u16 devid);
 int pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
-		     const struct pmc_reg_map *reg_map, int pmc_index);
+		     const struct pmc_reg_map *reg_map, unsigned int pmc_index);
 
 extern struct pmc_dev_info spt_pmc_dev;
 extern struct pmc_dev_info cnp_pmc_dev;
diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
index e1a83425d802..10ead4398a68 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -74,7 +74,7 @@ static inline u64 get_base(void __iomem *addr, u32 offset)
 }
 
 static int
-pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
+pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, unsigned int pmc_idx, u32 offset)
 {
 	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
 	void __iomem __free(pmc_core_iounmap) *tmp_ssram = NULL;
-- 
2.43.0



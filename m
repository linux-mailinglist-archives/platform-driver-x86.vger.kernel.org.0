Return-Path: <platform-driver-x86+bounces-11593-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4433A9F6D2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Apr 2025 19:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E975317645C
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Apr 2025 17:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C456D28F534;
	Mon, 28 Apr 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C39sEHsJ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8B28DF1C;
	Mon, 28 Apr 2025 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859817; cv=none; b=geIWd9J6KPK/MmLLbfXXlXj4KoPxeXp3hbjnQMINdn9ZceVMaPskOuUxu9H32guXyxnLQCOvQOLTEOEn7O2CEpH+jH4LhRoodxapGhMX2BTptCt8OMtt8FiTOTGA3ZpR4GwIOkM7Qv1eWXvCXr1GlXBtmiq2C+KDDRAe4Hoeme8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859817; c=relaxed/simple;
	bh=8Iryt7zaOrSbqJFhN3TgDkNfGjzpF5HT4tdy/mCduls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebmFoMiRGHva5+cnXe+d3SaVPYu1dsyKI3pSjPyKfIjvYVXmwE4apgYE4pPgJaYBUyM67pXniAiuWsUWNxy5qqxu+S04zZVUBUOyqMnL/x7ZxQJtLr02OvS4kVspctgxbCAezg8fZgxOsq6nVaRnezSp3yUlCZaWCtbKQc28FUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C39sEHsJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745859816; x=1777395816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Iryt7zaOrSbqJFhN3TgDkNfGjzpF5HT4tdy/mCduls=;
  b=C39sEHsJ4e6Szeskq1O128mahoIJezDzoGT7GFKx1a3Kg5hvOPVbrhC6
   4Ch2w738lsTvTy06jFAdhgFq1VMe5glLU2klj/lzWwyFcAmAEiDeST9QQ
   ldu+daLTBQDmit3LDE+BM27VZ5BhJXM3XdC+lVZ0STSGvh7vJjufpJ8fZ
   uyLzDIvbjCw3vu7PXqhRPlByEFIvgQxwy/IvP47mqz+gHD7aeenXtHWIa
   ciW3/iNihWsDEjT8sEzI+IMISEyuaLvV8xJ3Dv6/JJuDEIybzgoBUZQ1V
   1nZfX9cwX48F5PIyrf7jsbt/nXpwpM1kgw6k6ZQVnxnCunG852BhwAi0M
   A==;
X-CSE-ConnectionGUID: 5jNG9oLmRkexp4GEYOfqjg==
X-CSE-MsgGUID: DC0RVIxWRdenp3qznc/Nog==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58111443"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="58111443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 10:03:26 -0700
X-CSE-ConnectionGUID: 90cWmxQ6RNam+Aewor4BQA==
X-CSE-MsgGUID: z99PMgj4S4+CPdinCjQZaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133309600"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2025 10:03:25 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 3/5] platform/x86/intel: power-domains: Add interface to get Linux die ID
Date: Mon, 28 Apr 2025 10:03:14 -0700
Message-ID: <20250428170316.231353-4-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The die ID in the Linux topology sysfs is a logical identifier that
differs from the one presented in CPUID leaf 0x1F or via MSR 0x54.

Introduce an interface that returns the Linux CPU die ID based on a
given package ID and power domain ID. This mapping is stored during the
CPU online callback in an array.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2:
No change

 .../platform/x86/intel/tpmi_power_domains.c   | 34 ++++++++++++++++---
 .../platform/x86/intel/tpmi_power_domains.h   |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 2f01cd22a6ee..9aaebd74a2af 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -74,6 +74,8 @@ static enum cpuhp_state tpmi_hp_state __read_mostly;
 
 static cpumask_t *tpmi_power_domain_mask;
 
+static u16 *domain_die_map;
+
 /* Lock to protect tpmi_power_domain_mask and tpmi_cpu_hash */
 static DEFINE_MUTEX(tpmi_lock);
 
@@ -152,6 +154,15 @@ cpumask_t *tpmi_get_power_domain_mask(int cpu_no)
 }
 EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_mask, "INTEL_TPMI_POWER_DOMAIN");
 
+int tpmi_get_linux_die_id(int pkg_id, int domain_id)
+{
+	if (pkg_id >= topology_max_packages() || domain_id >= MAX_POWER_DOMAINS)
+		return -EINVAL;
+
+	return domain_die_map[pkg_id * MAX_POWER_DOMAINS + domain_id];
+}
+EXPORT_SYMBOL_NS_GPL(tpmi_get_linux_die_id, "INTEL_TPMI_POWER_DOMAIN");
+
 static int tpmi_get_logical_id(unsigned int cpu, struct tpmi_cpu_info *info)
 {
 	u64 data;
@@ -189,6 +200,9 @@ static int tpmi_cpu_online(unsigned int cpu)
 	cpumask_set_cpu(cpu, &tpmi_power_domain_mask[index]);
 	hash_add(tpmi_cpu_hash, &info->hnode, info->punit_core_id);
 
+	domain_die_map[info->pkg_id * MAX_POWER_DOMAINS + info->punit_domain_id] =
+			topology_die_id(cpu);
+
 	return 0;
 }
 
@@ -212,17 +226,28 @@ static int __init tpmi_init(void)
 	if (!tpmi_power_domain_mask)
 		return -ENOMEM;
 
+	domain_die_map = kcalloc(size_mul(topology_max_packages(), MAX_POWER_DOMAINS),
+				 sizeof(*domain_die_map), GFP_KERNEL);
+	if (!domain_die_map)
+		goto free_domain_mask;
+
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/tpmi_power_domains:online",
 				tpmi_cpu_online, NULL);
-	if (ret < 0) {
-		kfree(tpmi_power_domain_mask);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_domain_map;
 
 	tpmi_hp_state = ret;
 
 	return 0;
+
+free_domain_map:
+	kfree(domain_die_map);
+
+free_domain_mask:
+	kfree(tpmi_power_domain_mask);
+
+	return ret;
 }
 module_init(tpmi_init)
 
@@ -230,6 +255,7 @@ static void __exit tpmi_exit(void)
 {
 	cpuhp_remove_state(tpmi_hp_state);
 	kfree(tpmi_power_domain_mask);
+	kfree(domain_die_map);
 }
 module_exit(tpmi_exit)
 
diff --git a/drivers/platform/x86/intel/tpmi_power_domains.h b/drivers/platform/x86/intel/tpmi_power_domains.h
index e35750dd9273..2fd0dd7afbd2 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.h
+++ b/drivers/platform/x86/intel/tpmi_power_domains.h
@@ -14,5 +14,6 @@ int tpmi_get_linux_cpu_number(int package_id, int die_id, int punit_core_id);
 int tpmi_get_punit_core_number(int cpu_no);
 int tpmi_get_power_domain_id(int cpu_no);
 cpumask_t *tpmi_get_power_domain_mask(int cpu_no);
+int tpmi_get_linux_die_id(int pkg_id, int domain_id);
 
 #endif
-- 
2.48.1



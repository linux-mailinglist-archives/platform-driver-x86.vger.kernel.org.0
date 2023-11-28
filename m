Return-Path: <platform-driver-x86+bounces-114-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 541057FC3C6
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 19:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB133B2126B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 18:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2643D0D6;
	Tue, 28 Nov 2023 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3lCvlbR"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6BC131;
	Tue, 28 Nov 2023 10:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701197795; x=1732733795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bdi2sZDxRkvTBazv5rHTQmA65z9oE6nNf4G+LkhInvo=;
  b=e3lCvlbR+QoEwqtaHJBl50gKwMhyLFuLa2xjlBNEhwONpzywLgOsTF8/
   NcWSl1RUVTEtU04HBHdlfFkEe5Kq6aZ5YKvO9hZqmu88FMTHfes48Dzst
   EF8WAXMEnfaWPnRshu6o1Ysp5bkbgHFFDcbpGMtwe5dk0+C6knyrDFeae
   FRYM0Mzfg37SClIZgp3F+abMs4xdpdHshTCw/i9eGVcgPV9a7mLyZsyQS
   VsvIgizxzdu1FZeC//R0ya8agld8al9n8LhM0WhZ4IJOBjDZyNKHHp8c8
   V9N5VJ1j+WSlcOBi2zVC2FJZ3pamyihO3j63aqBwosVGYTsfu299EBNZg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372366950"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="372366950"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 10:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892165780"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="892165780"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by orsmga004.jf.intel.com with ESMTP; 28 Nov 2023 10:56:10 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/6] platform/x86/intel/tpmi: Add additional TPMI header fields
Date: Tue, 28 Nov 2023 10:56:00 -0800
Message-Id: <20231128185605.3027653-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231128185605.3027653-1-srinivas.pandruvada@linux.intel.com>
References: <20231128185605.3027653-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TPMI information header added additional fields in version 2. Some of the
reserved fields in version 1 are used to define new fields.
Parse new fields and export as part of platform data. These fields include:
- PCI segment ID
- Partition ID of the package, useful when more than one Intel VSEC PCI
device per package
- cdie_mask: Mask of all compute dies in this partition

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi.c | 11 ++++++++++-
 include/linux/intel_tpmi.h        |  6 ++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 311abcac894a..c89aa4d14bea 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -128,6 +128,9 @@ struct intel_tpmi_info {
  * @dev:	PCI device number
  * @bus:	PCI bus number
  * @pkg:	CPU Package id
+ * @segment: PCI segment id
+ * @partition: Package Partition id
+ * @cdie_mask: Bitmap of compute dies in the current partition
  * @reserved:	Reserved for future use
  * @lock:	When set to 1 the register is locked and becomes read-only
  *		until next reset. Not for use by the OS driver.
@@ -139,7 +142,10 @@ struct tpmi_info_header {
 	u64 dev:5;
 	u64 bus:8;
 	u64 pkg:8;
-	u64 reserved:39;
+	u64 segment:8;
+	u64 partition:2;
+	u64 cdie_mask:16;
+	u64 reserved:13;
 	u64 lock:1;
 } __packed;
 
@@ -684,6 +690,9 @@ static int tpmi_process_info(struct intel_tpmi_info *tpmi_info,
 	tpmi_info->plat_info.bus_number = header.bus;
 	tpmi_info->plat_info.device_number = header.dev;
 	tpmi_info->plat_info.function_number = header.fn;
+	tpmi_info->plat_info.cdie_mask = header.cdie_mask;
+	tpmi_info->plat_info.partition = header.partition;
+	tpmi_info->plat_info.segment = header.segment;
 
 	iounmap(info_mem);
 
diff --git a/include/linux/intel_tpmi.h b/include/linux/intel_tpmi.h
index ee07393445f9..939663bb095f 100644
--- a/include/linux/intel_tpmi.h
+++ b/include/linux/intel_tpmi.h
@@ -14,7 +14,10 @@
 
 /**
  * struct intel_tpmi_plat_info - Platform information for a TPMI device instance
+ * @cdie_mask:	Mask of all compute dies in the partition
  * @package_id:	CPU Package id
+ * @partition:  Package partition id when multiple VSEC PCI devices per package
+ * @segment: PCI segment ID
  * @bus_number:	PCI bus number
  * @device_number: PCI device number
  * @function_number: PCI function number
@@ -23,7 +26,10 @@
  * struct is used to return data via tpmi_get_platform_data().
  */
 struct intel_tpmi_plat_info {
+	u16 cdie_mask;
 	u8 package_id;
+	u8 partition;
+	u8 segment;
 	u8 bus_number;
 	u8 device_number;
 	u8 function_number;
-- 
2.41.0



Return-Path: <platform-driver-x86+bounces-159-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D67B7FE2EC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 23:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9331F20F21
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 22:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08703B1B4;
	Wed, 29 Nov 2023 22:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiM14tSx"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5D2B2;
	Wed, 29 Nov 2023 14:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296501; x=1732832501;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2MI25wU4ULmrwW6oRa0ViaqII4h2lvJfng37DWryzFY=;
  b=XiM14tSxIKuKD9spzl3nEcU9x386y2HmdO7XfdNXnWgt5MGcagL5Njo+
   nqAJF3ZdLyKW03iJ45gLIcqE8ax84qGB8EpmvbDXnVN29H3r0eyMV/LJo
   BLJqhFhbwp+tUvynDlnNwQGSNWoA1LMIM6kvxj2AbldRgJnyEFSp0R1h1
   G6/tlE88nJDXcX2D4WBWqxqFo6GbxdtkUOdBHE3sfH7Sa+cshb5gqOai9
   YrAFtOpQb8x8utN2rJKFeq1qIszsHNNe4NLXT0JyHYdVSQHN6Smh1hqTI
   PfLxaldbMSioyROj16CiQvNRBjx9vcZGxid1RjwixyV7vFx97UDcLZ8uJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937005"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070412"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070412"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:33 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id 1313A580BF8;
	Wed, 29 Nov 2023 14:21:33 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 03/20] platform/x86/intel/vsec: Move structures to header
Date: Wed, 29 Nov 2023 14:21:15 -0800
Message-Id: <20231129222132.2331261-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129222132.2331261-1-david.e.box@linux.intel.com>
References: <20231129222132.2331261-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for exporting an API to register Intel Vendor Specific
Extended Capabilities (VSEC) from other drivers, move needed structures to
the header file.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No change

V5 - No change

V4 - No change

V3 - No change

V2 - New patch splitting previous PATCH 1

 drivers/platform/x86/intel/vsec.c | 35 ------------------------------
 drivers/platform/x86/intel/vsec.h | 36 +++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 340562ae2041..c83e2c549fc7 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -24,13 +24,6 @@
 
 #include "vsec.h"
 
-/* Intel DVSEC offsets */
-#define INTEL_DVSEC_ENTRIES		0xA
-#define INTEL_DVSEC_SIZE		0xB
-#define INTEL_DVSEC_TABLE		0xC
-#define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
-#define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
-#define TABLE_OFFSET_SHIFT		3
 #define PMT_XA_START			0
 #define PMT_XA_MAX			INT_MAX
 #define PMT_XA_LIMIT			XA_LIMIT(PMT_XA_START, PMT_XA_MAX)
@@ -39,34 +32,6 @@ static DEFINE_IDA(intel_vsec_ida);
 static DEFINE_IDA(intel_vsec_sdsi_ida);
 static DEFINE_XARRAY_ALLOC(auxdev_array);
 
-/**
- * struct intel_vsec_header - Common fields of Intel VSEC and DVSEC registers.
- * @rev:         Revision ID of the VSEC/DVSEC register space
- * @length:      Length of the VSEC/DVSEC register space
- * @id:          ID of the feature
- * @num_entries: Number of instances of the feature
- * @entry_size:  Size of the discovery table for each feature
- * @tbir:        BAR containing the discovery tables
- * @offset:      BAR offset of start of the first discovery table
- */
-struct intel_vsec_header {
-	u8	rev;
-	u16	length;
-	u16	id;
-	u8	num_entries;
-	u8	entry_size;
-	u8	tbir;
-	u32	offset;
-};
-
-enum intel_vsec_id {
-	VSEC_ID_TELEMETRY	= 2,
-	VSEC_ID_WATCHER		= 3,
-	VSEC_ID_CRASHLOG	= 4,
-	VSEC_ID_SDSI		= 65,
-	VSEC_ID_TPMI		= 66,
-};
-
 static const char *intel_vsec_name(enum intel_vsec_id id)
 {
 	switch (id) {
diff --git a/drivers/platform/x86/intel/vsec.h b/drivers/platform/x86/intel/vsec.h
index 0a6201b4a0e9..c242c07ea69c 100644
--- a/drivers/platform/x86/intel/vsec.h
+++ b/drivers/platform/x86/intel/vsec.h
@@ -11,9 +11,45 @@
 #define VSEC_CAP_SDSI		BIT(3)
 #define VSEC_CAP_TPMI		BIT(4)
 
+/* Intel DVSEC offsets */
+#define INTEL_DVSEC_ENTRIES		0xA
+#define INTEL_DVSEC_SIZE		0xB
+#define INTEL_DVSEC_TABLE		0xC
+#define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
+#define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
+#define TABLE_OFFSET_SHIFT		3
+
 struct pci_dev;
 struct resource;
 
+enum intel_vsec_id {
+	VSEC_ID_TELEMETRY	= 2,
+	VSEC_ID_WATCHER		= 3,
+	VSEC_ID_CRASHLOG	= 4,
+	VSEC_ID_SDSI		= 65,
+	VSEC_ID_TPMI		= 66,
+};
+
+/**
+ * struct intel_vsec_header - Common fields of Intel VSEC and DVSEC registers.
+ * @rev:         Revision ID of the VSEC/DVSEC register space
+ * @length:      Length of the VSEC/DVSEC register space
+ * @id:          ID of the feature
+ * @num_entries: Number of instances of the feature
+ * @entry_size:  Size of the discovery table for each feature
+ * @tbir:        BAR containing the discovery tables
+ * @offset:      BAR offset of start of the first discovery table
+ */
+struct intel_vsec_header {
+	u8	rev;
+	u16	length;
+	u16	id;
+	u8	num_entries;
+	u8	entry_size;
+	u8	tbir;
+	u32	offset;
+};
+
 enum intel_vsec_quirks {
 	/* Watcher feature not supported */
 	VSEC_QUIRK_NO_WATCHER	= BIT(0),
-- 
2.34.1



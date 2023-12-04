Return-Path: <platform-driver-x86+bounces-285-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC7804181
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Dec 2023 23:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B14F71C20B52
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Dec 2023 22:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403383AC0F;
	Mon,  4 Dec 2023 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJVIoCq0"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA594FF;
	Mon,  4 Dec 2023 14:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701728268; x=1733264268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nr7Y5ooHJEhF/Z3v3ZirSsXNI8DuNYILGxW63r5E+vQ=;
  b=kJVIoCq0OEYkHru/9ZJcqFL84Upg/a8l+YQHwXHALAXegttBlnfmeE7d
   NSpfAY2uJ9HHXSKHvVSsEboxnVitd5MkXzMx+Nfr/zdjKAZ9hlQdO1OQX
   Eh/t0vkp3EbRRfoToPNem7O/UOYLb1f15i80Tl4SRDwK9m9Tr0iqkxGrT
   aNVqo5J//V8qUx/HLSTOLw1bHxhnRqrcZVQmJaS61k9PBzO2mp31VmNFS
   1t8fwgRK62nGO1tV4qbLla4TimvrTkD2XvMHh+ksbqoHdgXc4Ulc780pp
   EkUZA9j/grQOk/Y9FHCmPcaNifq+Kv+1tAT6fZ981rJwrBo7EOmfYeEAe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480000879"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="480000879"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 14:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764111954"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764111954"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 14:17:46 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 3/5] platform/x86/intel/tpmi: Move TPMI ID definition
Date: Mon,  4 Dec 2023 14:17:38 -0800
Message-Id: <20231204221740.3645130-4-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231204221740.3645130-1-srinivas.pandruvada@linux.intel.com>
References: <20231204221740.3645130-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move TPMI ID definitions to common include file. In this way other
feature drivers don't have to redefine.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v3
- Rebased on top of /pdx86/platform-drivers-x86 review-hans
v2
- Aligned comments for TPMI IDs

 drivers/platform/x86/intel/tpmi.c | 13 -------------
 include/linux/intel_tpmi.h        | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 92c5c3a90d53..e73cdea67fff 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -170,19 +170,6 @@ struct tpmi_feature_state {
 	u32 locked:1;
 } __packed;
 
-/*
- * List of supported TMPI IDs.
- * Some TMPI IDs are not used by Linux, so the numbers are not consecutive.
- */
-enum intel_tpmi_id {
-	TPMI_ID_RAPL = 0, /* Running Average Power Limit */
-	TPMI_ID_PEM = 1, /* Power and Perf excursion Monitor */
-	TPMI_ID_UNCORE = 2, /* Uncore Frequency Scaling */
-	TPMI_ID_SST = 5, /* Speed Select Technology */
-	TPMI_CONTROL_ID = 0x80, /* Special ID for getting feature status */
-	TPMI_INFO_ID = 0x81, /* Special ID for PCI BDF and Package ID information */
-};
-
 /*
  * The size from hardware is in u32 units. This size is from a trusted hardware,
  * but better to verify for pre silicon platforms. Set size to 0, when invalid.
diff --git a/include/linux/intel_tpmi.h b/include/linux/intel_tpmi.h
index 4f89c5bd8663..a3529b962be6 100644
--- a/include/linux/intel_tpmi.h
+++ b/include/linux/intel_tpmi.h
@@ -12,6 +12,19 @@
 #define TPMI_MINOR_VERSION(val)	FIELD_GET(GENMASK(4, 0), val)
 #define TPMI_MAJOR_VERSION(val)	FIELD_GET(GENMASK(7, 5), val)
 
+/*
+ * List of supported TMPI IDs.
+ * Some TMPI IDs are not used by Linux, so the numbers are not consecutive.
+ */
+enum intel_tpmi_id {
+	TPMI_ID_RAPL = 0,	/* Running Average Power Limit */
+	TPMI_ID_PEM = 1,	/* Power and Perf excursion Monitor */
+	TPMI_ID_UNCORE = 2,	/* Uncore Frequency Scaling */
+	TPMI_ID_SST = 5,	/* Speed Select Technology */
+	TPMI_CONTROL_ID = 0x80,	/* Special ID for getting feature status */
+	TPMI_INFO_ID = 0x81,	/* Special ID for PCI BDF and Package ID information */
+};
+
 /**
  * struct intel_tpmi_plat_info - Platform information for a TPMI device instance
  * @package_id:	CPU Package id
-- 
2.40.1



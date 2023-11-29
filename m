Return-Path: <platform-driver-x86+bounces-163-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB757FE2F3
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 23:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3600B2112B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 22:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5973B1B1;
	Wed, 29 Nov 2023 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVBoKhq5"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956E7F4;
	Wed, 29 Nov 2023 14:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296502; x=1732832502;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kJYw8Sg4jWhmxTchdwmX18j6/kfRum1qXopwd4av18s=;
  b=dVBoKhq5WH1YiaRdicUQUOeA1BOmQj3y6gD1ExDzrEFfOzV3S7q+AEP8
   doDSmoenV9voHULVA3lM8DXzDpu2ADRCpvqTjcZegIYoIZU5x+RuTa8fc
   9FIMzJ7E3keoe8ATGVANyMpaTVn4XtWddySFVfa0kcXw2d0jP0IZqw15m
   C5edSZOQVbOfGY005sZVVi+/eWX5cjCeWF71nb2XYBJxrfuIeX8X1fjy8
   8TxtanRU5AVvVUGVaf5H4BpxxVhr5pOHU/fy8Tg3iMySjTbgKyLfUIM+U
   7h/u7Dbjy6/7T4L7MZWZYqdF1UT8apdYwIzYqSVaqZMZsStTPN2sIbxwp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937007"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937007"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070424"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070424"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:33 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id BCE1D580BF8;
	Wed, 29 Nov 2023 14:21:33 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 09/20] platform/x86/intel/pmt: Add header to struct intel_pmt_entry
Date: Wed, 29 Nov 2023 14:21:21 -0800
Message-Id: <20231129222132.2331261-10-david.e.box@linux.intel.com>
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

The PMT header is passed to several functions. Instead, store the header in
struct intel_pmt_entry which is also passed to these functions and shorten
the argument list. This simplifies the calls in preparation for later
changes. While here also perform a newline cleanup.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No change

V5 - Mention newline cleanup in changelog

V4 - No change

V3 - No change

V2 - No change

 drivers/platform/x86/intel/pmt/class.c     |  8 +++-----
 drivers/platform/x86/intel/pmt/class.h     | 16 ++++++++--------
 drivers/platform/x86/intel/pmt/crashlog.c  |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |  2 +-
 4 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 32608baaa56c..142a24e3727d 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -159,12 +159,12 @@ static struct class intel_pmt_class = {
 };
 
 static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
-				    struct intel_pmt_header *header,
 				    struct intel_vsec_device *ivdev,
 				    struct resource *disc_res)
 {
 	struct pci_dev *pci_dev = ivdev->pcidev;
 	struct device *dev = &ivdev->auxdev.dev;
+	struct intel_pmt_header *header = &entry->header;
 	u8 bir;
 
 	/*
@@ -313,7 +313,6 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespa
 			 struct intel_vsec_device *intel_vsec_dev, int idx)
 {
 	struct device *dev = &intel_vsec_dev->auxdev.dev;
-	struct intel_pmt_header header;
 	struct resource	*disc_res;
 	int ret;
 
@@ -323,16 +322,15 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespa
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
 
-	ret = ns->pmt_header_decode(entry, &header, dev);
+	ret = ns->pmt_header_decode(entry, dev);
 	if (ret)
 		return ret;
 
-	ret = intel_pmt_populate_entry(entry, &header, intel_vsec_dev, disc_res);
+	ret = intel_pmt_populate_entry(entry, intel_vsec_dev, disc_res);
 	if (ret)
 		return ret;
 
 	return intel_pmt_dev_register(entry, ns, dev);
-
 }
 EXPORT_SYMBOL_NS_GPL(intel_pmt_dev_create, INTEL_PMT);
 
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index db11d58867ce..e477a19f6700 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -18,7 +18,15 @@
 #define GET_BIR(v)		((v) & GENMASK(2, 0))
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
 
+struct intel_pmt_header {
+	u32	base_offset;
+	u32	size;
+	u32	guid;
+	u8	access_type;
+};
+
 struct intel_pmt_entry {
+	struct intel_pmt_header	header;
 	struct bin_attribute	pmt_bin_attr;
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
@@ -29,19 +37,11 @@ struct intel_pmt_entry {
 	int			devid;
 };
 
-struct intel_pmt_header {
-	u32	base_offset;
-	u32	size;
-	u32	guid;
-	u8	access_type;
-};
-
 struct intel_pmt_namespace {
 	const char *name;
 	struct xarray *xa;
 	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
-				 struct intel_pmt_header *header,
 				 struct device *dev);
 };
 
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index bbb3d61d09f4..4014c02cafdb 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -223,10 +223,10 @@ static const struct attribute_group pmt_crashlog_group = {
 };
 
 static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
-				      struct intel_pmt_header *header,
 				      struct device *dev)
 {
 	void __iomem *disc_table = entry->disc_table;
+	struct intel_pmt_header *header = &entry->header;
 	struct crashlog_entry *crashlog;
 
 	if (!pmt_crashlog_supported(entry))
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 39cbc87cc28a..f86080e8bebd 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -58,10 +58,10 @@ static bool pmt_telem_region_overlaps(struct intel_pmt_entry *entry,
 }
 
 static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
-				   struct intel_pmt_header *header,
 				   struct device *dev)
 {
 	void __iomem *disc_table = entry->disc_table;
+	struct intel_pmt_header *header = &entry->header;
 
 	if (pmt_telem_region_overlaps(entry, dev))
 		return 1;
-- 
2.34.1



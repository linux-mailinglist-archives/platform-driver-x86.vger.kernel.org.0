Return-Path: <platform-driver-x86+bounces-4380-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFE9319DC
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2024 19:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFC7E1C21A76
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2024 17:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446BA535A3;
	Mon, 15 Jul 2024 17:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrgSGdVE"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5650284
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066120; cv=none; b=IUzBtp2NZSIi01w2v6aeVabx7qHHjFXPsZxB2HbSEq8hgJKT8jqbd6BcUbHX8V+4df++fdfgN2mRj3x4x+SchAv2WPPXm8I/yZAXM1U98Q4GvizAjjnMhFqvt7dTNUBc5qYogbnDMXyMD9U2zQ75giv7iWKTEimFv8wUHaZk6SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066120; c=relaxed/simple;
	bh=bvZU0GZfj30idFhw0yiuWaZx+bnHKhPRqJ00/WDbRNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5Um5Q1jvVp9FSTEX95w0VwuFqN6XoCbGH/6puYceRgdsCs3o3j6Qne/FbXFkI0kvFEmdto4/L4n/kkdGSJCKXD/0v9pMya/tVXGIHmRErY1J2e6F0B8XJVlCgEUa8Lq0tSQEePHuwiyjkcZ6C1eyxDZvQt8n3dYBi1uzo2wzlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrgSGdVE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721066119; x=1752602119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bvZU0GZfj30idFhw0yiuWaZx+bnHKhPRqJ00/WDbRNc=;
  b=GrgSGdVESX/OTpAy4YYY8uP5q77qb1PDWTCKKTu4otyj83GsL97mvY5x
   wZINgwXIHWcCUZ16ZlXru8qp2Ac+oIq2pgqvxJ0sGT99cP83CL42cKfgi
   ovTtCcVsWxOOvUTZlukacE53/zCDtywht/gFRFY5kjeIFTgC8Jiw/vo/D
   Sqyml9+E8yFk6ONgCL0Fr4TiL6w4UkyPsYFP35diToua6Ue+/U2eglUfn
   jgQL11e4S/KrXMJK8Uh/UCZm3AtIXPSSVLMEAePoGWtYzz8NL2e0rScav
   JicPk4TZeY5JBQVWNX6BYixf/wcIm8XjkfU8uNfh6xMzdFm0PTlvTeVX9
   g==;
X-CSE-ConnectionGUID: 174jK9/NQF+CQB2TOq3kVQ==
X-CSE-MsgGUID: cczQdgbaQLKCIJT/sNtzeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18077448"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="18077448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 10:55:19 -0700
X-CSE-ConnectionGUID: aOoj0ObTTk2VS5739P/aFw==
X-CSE-MsgGUID: vx3jJ6fkQbWCfSWprGoUEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="49654341"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 10:55:17 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v7 5/6] platform/x86/intel/pmt: Add support for PMT base adjust
Date: Mon, 15 Jul 2024 13:54:49 -0400
Message-ID: <20240715175452.4010751-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
References: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DVSEC offsets are based on the endpoint BAR.  If an endpoint is
not available allow the offset information to be adjusted by the
parent driver.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.h     | 1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
 drivers/platform/x86/intel/vsec.c          | 1 +
 include/linux/intel_vsec.h                 | 2 ++
 4 files changed, 13 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index a267ac964423..984cd40ee814 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -46,6 +46,7 @@ struct intel_pmt_entry {
 	void __iomem		*base;
 	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
+	s32			base_adjust;
 	size_t			size;
 	u32			guid;
 	int			devid;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index c9feac859e57..88e4f1315097 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	header->access_type = TELEM_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
 	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
+	if (entry->base_adjust) {
+		u32 new_base = header->base_offset + entry->base_adjust;
+
+		dev_dbg(dev, "Adjusting base offset from 0x%x to 0x%x\n",
+			header->base_offset, new_base);
+		header->base_offset = new_base;
+	}
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = TELEM_SIZE(readl(disc_table));
@@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxilia
 	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[priv->num_entries];
 
+		entry->base_adjust = intel_vsec_dev->base_adjust;
+
 		mutex_lock(&ep_lock);
 		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
 		mutex_unlock(&ep_lock);
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 7b5cc9993974..be079d62a7bc 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
+	intel_vsec_dev->base_adjust = info->base_adjust;
 	intel_vsec_dev->priv_data = info->priv_data;
 
 	if (header->id == VSEC_ID_SDSI)
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index b1c1131213f6..47f0b96c6040 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -95,6 +95,7 @@ struct intel_vsec_platform_info {
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 /**
@@ -120,6 +121,7 @@ struct intel_vsec_device {
 	size_t priv_data_size;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
-- 
2.44.0



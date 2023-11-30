Return-Path: <platform-driver-x86+bounces-204-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 372DF7FFDD6
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 22:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 598691C20EF2
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 21:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9E05B213;
	Thu, 30 Nov 2023 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq2MRbcn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC56010FD;
	Thu, 30 Nov 2023 13:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701380893; x=1732916893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iPenITkAPbJk/twSPTXeCodsEQgm0vYgv3Cv5U1mHjI=;
  b=Oq2MRbcntB9RsP3b+GtfHxZrI/8fTmq8kRjDjIzkUGMOoMelQ2vnlkGY
   ZRvH8qDBffePFRMiiFbRR4Oq1tEThemhI0/acAQvYHgR0QouotzGOYoqy
   +aaRj6zvNn4JotOaKTNWjfpdKr7+jN7n9wKo2xCOlvx8o8E8nHDO02I7e
   jJ7BOWhdK6T/Dn3c2vERH4UcSpPD7md+kd3X5il1U2CsGbjdOX46KGuIW
   fiAeDdolaYfDQ2mboCr6TU3esHTdFLkZAt+IW6XH7kopAdojudvO1XiFe
   5gBSr9tg4xWpb1KgJM4ptK+4BXrXbYbdDRC59I5F56EKuxJFjD2zfIODN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="399956"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="399956"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860334608"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="860334608"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2023 13:48:10 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 4/5] platform/x86: ISST: Process read/write blocked feature status
Date: Thu, 30 Nov 2023 13:47:50 -0800
Message-Id: <20231130214751.3100418-5-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a feature is read blocked, don't continue to read SST information
and register with SST core.

When the feature is write blocked, continue to offer read interface for
SST parameters, but don't allow any operation to change state. A state
change results from SST level change, feature change or class of service
change.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2
- Change read_blocked, write_blocked to bool
- Move the check for power_domain_info->write_blocked for SST-CP
to only write operations

 .../intel/speed_select_if/isst_tpmi_core.c    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 0b6d2c864437..2662fbbddf0c 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -234,6 +234,7 @@ struct perf_level {
  * @saved_clos_configs:	Save SST-CP CLOS configuration to store restore for suspend/resume
  * @saved_clos_assocs:	Save SST-CP CLOS association to store restore for suspend/resume
  * @saved_pp_control:	Save SST-PP control information to store restore for suspend/resume
+ * @write_blocked:	Write operation is blocked, so can't change SST state
  *
  * This structure is used store complete SST information for a power_domain. This information
  * is used to read/write request for any SST IOCTL. Each physical CPU package can have multiple
@@ -259,6 +260,7 @@ struct tpmi_per_power_domain_info {
 	u64 saved_clos_configs[4];
 	u64 saved_clos_assocs[4];
 	u64 saved_pp_control;
+	bool write_blocked;
 };
 
 /**
@@ -515,6 +517,9 @@ static long isst_if_clos_param(void __user *argp)
 		return -EINVAL;
 
 	if (clos_param.get_set) {
+		if (power_domain_info->write_blocked)
+			return -EPERM;
+
 		_write_cp_info("clos.min_freq", clos_param.min_freq_mhz,
 			       (SST_CLOS_CONFIG_0_OFFSET + clos_param.clos * SST_REG_SIZE),
 			       SST_CLOS_CONFIG_MIN_START, SST_CLOS_CONFIG_MIN_WIDTH,
@@ -602,6 +607,9 @@ static long isst_if_clos_assoc(void __user *argp)
 
 		power_domain_info = &sst_inst->power_domain_info[punit_id];
 
+		if (assoc_cmds.get_set && power_domain_info->write_blocked)
+			return -EPERM;
+
 		offset = SST_CLOS_ASSOC_0_OFFSET +
 				(punit_cpu_no / SST_CLOS_ASSOC_CPUS_PER_REG) * SST_REG_SIZE;
 		shift = punit_cpu_no % SST_CLOS_ASSOC_CPUS_PER_REG;
@@ -752,6 +760,9 @@ static int isst_if_set_perf_level(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
+	if (power_domain_info->write_blocked)
+		return -EPERM;
+
 	if (!(power_domain_info->pp_header.allowed_level_mask & BIT(perf_level.level)))
 		return -EINVAL;
 
@@ -809,6 +820,9 @@ static int isst_if_set_perf_feature(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
+	if (power_domain_info->write_blocked)
+		return -EPERM;
+
 	_write_pp_info("perf_feature", perf_feature.feature, SST_PP_CONTROL_OFFSET,
 		       SST_PP_FEATURE_STATE_START, SST_PP_FEATURE_STATE_WIDTH,
 		       SST_MUL_FACTOR_NONE)
@@ -1257,11 +1271,21 @@ static long isst_if_def_ioctl(struct file *file, unsigned int cmd,
 
 int tpmi_sst_dev_add(struct auxiliary_device *auxdev)
 {
+	bool read_blocked = 0, write_blocked = 0;
 	struct intel_tpmi_plat_info *plat_info;
 	struct tpmi_sst_struct *tpmi_sst;
 	int i, ret, pkg = 0, inst = 0;
 	int num_resources;
 
+	ret = tpmi_get_feature_status(auxdev, TPMI_ID_SST, &read_blocked, &write_blocked);
+	if (ret)
+		dev_info(&auxdev->dev, "Can't read feature status: ignoring read/write blocked status\n");
+
+	if (read_blocked) {
+		dev_info(&auxdev->dev, "Firmware has blocked reads, exiting\n");
+		return -ENODEV;
+	}
+
 	plat_info = tpmi_get_platform_data(auxdev);
 	if (!plat_info) {
 		dev_err(&auxdev->dev, "No platform info\n");
@@ -1306,6 +1330,7 @@ int tpmi_sst_dev_add(struct auxiliary_device *auxdev)
 		tpmi_sst->power_domain_info[i].package_id = pkg;
 		tpmi_sst->power_domain_info[i].power_domain_id = i;
 		tpmi_sst->power_domain_info[i].auxdev = auxdev;
+		tpmi_sst->power_domain_info[i].write_blocked = write_blocked;
 		tpmi_sst->power_domain_info[i].sst_base = devm_ioremap_resource(&auxdev->dev, res);
 		if (IS_ERR(tpmi_sst->power_domain_info[i].sst_base))
 			return PTR_ERR(tpmi_sst->power_domain_info[i].sst_base);
-- 
2.41.0



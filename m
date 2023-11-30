Return-Path: <platform-driver-x86+bounces-202-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE87FFDD2
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 22:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F019F1C20D16
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 21:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DEF5B209;
	Thu, 30 Nov 2023 21:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnhkoHC4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9193A10FA;
	Thu, 30 Nov 2023 13:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701380892; x=1732916892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VEDbcl6LTDH7xUZ430vI60xVleNhbYt5lhgrwjtmUY0=;
  b=gnhkoHC4Rf1QcaVl1g3VJe5J9824g+yR+4ZP7BHbdQDnhi/fA7NYuJF+
   jAIkjeixEzzpERs9z8+74SnXXUnMjSyqpYBpv4wNTxY9jM0Y1HWBkNKW7
   VylHytpwnciduF5Pz/DNI/418BnN13siiiqf3qOImITcncHHuCDGCoiWL
   mTNz1GRCTU13EGU2oyftc+m4weTfhhI1SjnBqzJs2UIC25iu90X85J5/Q
   XT3bIH2vxvOzuDGhHNpy8ejDkFH8NIu92zEdLBrZO1Siv/kVgYoIg/ro/
   kKUipN2icczONJ4zY+rF4bY1cm4e6Y7P7fioZH8BeSoj9/WcV7GJoIFOq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="399946"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="399946"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860334605"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="860334605"
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
Subject: [PATCH v2 2/5] platform/x86/intel/tpmi: Modify external interface to get read/write state
Date: Thu, 30 Nov 2023 13:47:48 -0800
Message-Id: <20231130214751.3100418-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Modify the external interface tpmi_get_feature_status() to get read
and write blocked instead of locked and disabled. Since auxiliary device
is not created when disabled, no use of returning disabled state. Also
locked state is not useful as feature driver can't use locked state
in a meaningful way.

Using read and write state, feature driver can decide which operations
to restrict for that feature.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v2:
- Change read_blocked/write_blocked to bool *

 drivers/platform/x86/intel/tpmi.c | 8 ++++----
 include/linux/intel_tpmi.h        | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 868067ff966e..ec64565baddc 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -351,8 +351,8 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 	return ret;
 }
 
-int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id,
-			    int *locked, int *disabled)
+int tpmi_get_feature_status(struct auxiliary_device *auxdev,
+			    int feature_id, bool *read_blocked, bool *write_blocked)
 {
 	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(auxdev->dev.parent);
 	struct intel_tpmi_info *tpmi_info = auxiliary_get_drvdata(&intel_vsec_dev->auxdev);
@@ -363,8 +363,8 @@ int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id,
 	if (ret)
 		return ret;
 
-	*locked = feature_state.locked;
-	*disabled = !feature_state.enabled;
+	*read_blocked = feature_state.read_blocked;
+	*write_blocked = feature_state.write_blocked;
 
 	return 0;
 }
diff --git a/include/linux/intel_tpmi.h b/include/linux/intel_tpmi.h
index 939663bb095f..7dff3d96a200 100644
--- a/include/linux/intel_tpmi.h
+++ b/include/linux/intel_tpmi.h
@@ -38,7 +38,6 @@ struct intel_tpmi_plat_info {
 struct intel_tpmi_plat_info *tpmi_get_platform_data(struct auxiliary_device *auxdev);
 struct resource *tpmi_get_resource_at_index(struct auxiliary_device *auxdev, int index);
 int tpmi_get_resource_count(struct auxiliary_device *auxdev);
-
-int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id, int *locked,
-			    int *disabled);
+int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id, bool *read_blocked,
+			    bool *write_blocked);
 #endif
-- 
2.41.0



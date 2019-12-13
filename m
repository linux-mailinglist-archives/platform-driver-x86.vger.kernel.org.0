Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7566611EA0B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 13 Dec 2019 19:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbfLMSQd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 13 Dec 2019 13:16:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:52404 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728693AbfLMSQc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Dec 2019 13:16:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Dec 2019 10:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; 
   d="scan'208";a="208536417"
Received: from gayuk-dev-mach.sc.intel.com ([10.3.79.172])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2019 10:16:31 -0800
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     linux-pm@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org, alex.hung@canonical.com,
        linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net,
        linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org,
        amit.kucheria@verdurent.com, charles.d.prestopine@intel.com,
        dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Zhang rui <rui.zhang@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Subject: [PATCH v2 4/4] thermal: int340x_thermal: Add new Tiger Lake hardware IDs to support thermal driver
Date:   Fri, 13 Dec 2019 10:14:23 -0800
Message-Id: <8964445c268f61beb8fbaa3f54b469ddd7f8cafa.1576260216.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Tiger Lake has a new unique hardware IDs to support thermal driver.
Hence, add them.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhang rui <rui.zhang@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 1 +
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
index 3517883b5cdb..efae0c02d898 100644
--- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -369,6 +369,7 @@ static int int3400_thermal_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3400_thermal_match[] = {
+	{"INT1040", 0},
 	{"INT3400", 0},
 	{}
 };
diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
index a7bbd8584ae2..aeece1e136a5 100644
--- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
@@ -282,6 +282,7 @@ static int int3403_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3403_device_ids[] = {
+	{"INT1043", 0},
 	{"INT3403", 0},
 	{"", 0},
 };
-- 
2.17.1


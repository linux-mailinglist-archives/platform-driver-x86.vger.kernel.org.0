Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818681BB930
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Apr 2020 10:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgD1IvS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Apr 2020 04:51:18 -0400
Received: from mga09.intel.com ([134.134.136.24]:65482 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726689AbgD1IvS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Apr 2020 04:51:18 -0400
IronPort-SDR: AmiE/VddaiC9kwbOBsP+AJDVFEp5oFCIEZ1C5vt21GGYzTZ7BU83nO5aPsjkPZGKkzXFx0besI
 /KgVRRukWi7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 01:51:16 -0700
IronPort-SDR: TsLFUZ5l9Fp3rbpkvF8YkZNt4/EkzHggXIwJdYma5H/WAvvgNDehlY+KwlCSYRfzKiaHQ7GBNX
 2R7vtX0M5/Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="404626488"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2020 01:51:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 25BF511E; Tue, 28 Apr 2020 11:51:14 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Cc:     Divya Sasidharan <divya.s.sasidharan@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: Add Elkhart Lake SCU/PMC support
Date:   Tue, 28 Apr 2020 11:51:12 +0300
Message-Id: <20200428085113.47420-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428085113.47420-1-mika.westerberg@linux.intel.com>
References: <20200428085113.47420-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Intel Elkhart Lake exposes SCU/PMC as an ACPI device that only supports
IPC functionality so add a platform driver supporting it. Interrupt is
optional so we let intel_scu_ipc_probe() to decide based on the passed
platform data whether it uses interrupt or polling.

Co-developed-by: Divya Sasidharan <divya.s.sasidharan@intel.com>
Signed-off-by: Divya Sasidharan <divya.s.sasidharan@intel.com>
Co-developed-by: Rajmohan Mani <rajmohan.mani@intel.com>
Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/Kconfig            |  9 ++++
 drivers/platform/x86/Makefile           |  1 +
 drivers/platform/x86/intel_scu_pltdrv.c | 58 +++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 drivers/platform/x86/intel_scu_pltdrv.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 642316761443..4a888b5270e3 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1356,6 +1356,15 @@ config INTEL_SCU_PCI
 	    Broxton
 	    Apollo Lake
 
+config INTEL_SCU_PLATFORM
+	tristate "Intel SCU platform driver"
+	depends on ACPI
+	select INTEL_SCU
+	help
+	  This driver is used to bridge the communications between kernel
+	  and SCU (sometimes called PMC as well). The driver currently
+	  supports Intel Elkhart Lake and compatible platforms.
+
 config INTEL_SCU_IPC_UTIL
 	tristate "Intel SCU IPC utility driver"
 	depends on INTEL_SCU
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 04db27a25946..70284a52f24f 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -141,6 +141,7 @@ obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o
 obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
 obj-$(CONFIG_INTEL_SCU_IPC)		+= intel_scu_ipc.o
 obj-$(CONFIG_INTEL_SCU_PCI)		+= intel_scu_pcidrv.o
+obj-$(CONFIG_INTEL_SCU_PLATFORM)	+= intel_scu_pltdrv.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
 obj-$(CONFIG_INTEL_TELEMETRY)		+= intel_telemetry_core.o \
 					   intel_telemetry_pltdrv.o \
diff --git a/drivers/platform/x86/intel_scu_pltdrv.c b/drivers/platform/x86/intel_scu_pltdrv.c
new file mode 100644
index 000000000000..e9d857b44fe6
--- /dev/null
+++ b/drivers/platform/x86/intel_scu_pltdrv.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Platform driver for the Intel SCU.
+ *
+ * Copyright (C) 2019, Intel Corporation
+ * Authors : Divya Sasidharan <divya.s.sasidharan@intel.com>
+ *	     Mika Westerberg <mika.westerberg@linux.intel.com>
+ *	     Rajmohan Mani <rajmohan.mani@intel.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <asm/intel_scu_ipc.h>
+
+static int intel_scu_platform_probe(struct platform_device *pdev)
+{
+	struct intel_scu_ipc_data scu_data = {};
+	struct intel_scu_ipc_dev *scu;
+	const struct resource *res;
+
+	scu_data.irq = platform_get_irq_optional(pdev, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENOMEM;
+
+	scu_data.mem = *res;
+
+	scu = devm_intel_scu_ipc_register(&pdev->dev, &scu_data);
+	if (IS_ERR(scu))
+		return PTR_ERR(scu);
+
+	platform_set_drvdata(pdev, scu);
+	return 0;
+}
+
+static const struct acpi_device_id intel_scu_acpi_ids[] = {
+	{ "INTC1026" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, intel_scu_acpi_ids);
+
+static struct platform_driver intel_scu_platform_driver = {
+	.probe = intel_scu_platform_probe,
+	.driver = {
+		.name = "intel_scu",
+		.acpi_match_table = intel_scu_acpi_ids,
+	},
+};
+
+module_platform_driver(intel_scu_platform_driver);
+
+MODULE_AUTHOR("Divya Sasidharan <divya.s.sasidharan@intel.com>");
+MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com");
+MODULE_AUTHOR("Rajmohan Mani <rajmohan.mani@intel.com>");
+MODULE_DESCRIPTION("Intel SCU platform driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2


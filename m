Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB903BF3D7
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Jul 2021 04:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhGHCNE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Jul 2021 22:13:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:51876 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230110AbhGHCND (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jul 2021 22:13:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270542027"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="270542027"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 19:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="449770459"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by orsmga007.jf.intel.com with ESMTP; 07 Jul 2021 19:10:22 -0700
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com, andriy.shevchenko@linux.intel.com,
        vicamo.yang@canonical.com, srinivas.pandruvada@intel.com,
        david.e.box@intel.com, linux-kernel@vger.kernel.org,
        tamar.mashiah@intel.com, gregkh@linuxfoundation.org,
        rajatja@google.com, Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 1/5] platform/x86/intel: intel_pmc_core: Move intel_pmc_core* files to pmc subfolder
Date:   Wed,  7 Jul 2021 19:07:21 -0700
Message-Id: <ffbbbc22605014d0de6eabaf7f1441a761456cb2.1625709047.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625709047.git.gayatri.kammela@intel.com>
References: <cover.1625709047.git.gayatri.kammela@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

As part of collecting Intel x86 specific drivers in their own
folder, move intel_pmc_core* files to its own subfolder there.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: David Box <david.e.box@intel.com>
Cc: You-Sheng Yang <vicamo.yang@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/Kconfig                  | 21 ------------------
 drivers/platform/x86/Makefile                 |  1 -
 drivers/platform/x86/intel/Kconfig            |  1 +
 drivers/platform/x86/intel/Makefile           |  1 +
 drivers/platform/x86/intel/pmc/Kconfig        | 22 +++++++++++++++++++
 drivers/platform/x86/intel/pmc/Makefile       |  5 +++++
 .../x86/{ => intel/pmc}/intel_pmc_core.c      |  0
 .../x86/{ => intel/pmc}/intel_pmc_core.h      |  0
 .../{ => intel/pmc}/intel_pmc_core_pltdrv.c   |  0
 9 files changed, 29 insertions(+), 22 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/Kconfig
 create mode 100644 drivers/platform/x86/intel/pmc/Makefile
 rename drivers/platform/x86/{ => intel/pmc}/intel_pmc_core.c (100%)
 rename drivers/platform/x86/{ => intel/pmc}/intel_pmc_core.h (100%)
 rename drivers/platform/x86/{ => intel/pmc}/intel_pmc_core_pltdrv.c (100%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7d385c3b2239..cae72922f448 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1184,27 +1184,6 @@ config INTEL_MRFLD_PWRBTN
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel_mrfld_pwrbtn.
 
-config INTEL_PMC_CORE
-	tristate "Intel PMC Core driver"
-	depends on PCI
-	depends on ACPI
-	help
-	  The Intel Platform Controller Hub for Intel Core SoCs provides access
-	  to Power Management Controller registers via various interfaces. This
-	  driver can utilize debugging capabilities and supported features as
-	  exposed by the Power Management Controller. It also may perform some
-	  tasks in the PMC in order to enable transition into the SLPS0 state.
-	  It should be selected on all Intel platforms supported by the driver.
-
-	  Supported features:
-		- SLP_S0_RESIDENCY counter
-		- PCH IP Power Gating status
-		- LTR Ignore / LTR Show
-		- MPHY/PLL gating status (Sunrisepoint PCH only)
-		- SLPS0 Debug registers (Cannonlake/Icelake PCH)
-		- Low Power Mode registers (Tigerlake and beyond)
-		- PMC quirks as needed to enable SLPS0/S0ix
-
 config INTEL_PMT_CLASS
 	tristate
 	help
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 7ee369aab10d..43d36f8c36f1 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -128,7 +128,6 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
 obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
 obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
 obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
-obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o
 obj-$(CONFIG_INTEL_PMT_CLASS)		+= intel_pmt_class.o
 obj-$(CONFIG_INTEL_PMT_TELEMETRY)	+= intel_pmt_telemetry.o
 obj-$(CONFIG_INTEL_PMT_CRASHLOG)	+= intel_pmt_crashlog.o
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index f2eef337eb98..8ca021785f67 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -18,5 +18,6 @@ if X86_PLATFORM_DRIVERS_INTEL
 
 source "drivers/platform/x86/intel/int33fe/Kconfig"
 source "drivers/platform/x86/intel/int3472/Kconfig"
+source "drivers/platform/x86/intel/pmc/Kconfig"
 
 endif # X86_PLATFORM_DRIVERS_INTEL
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 0653055942d5..49962f4dfdec 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -6,3 +6,4 @@
 
 obj-$(CONFIG_INTEL_CHT_INT33FE)		+= int33fe/
 obj-$(CONFIG_INTEL_SKL_INT3472)		+= int3472/
+obj-$(CONFIG_INTEL_PMC_CORE)		+= pmc/
diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/intel/pmc/Kconfig
new file mode 100644
index 000000000000..b4c955a35674
--- /dev/null
+++ b/drivers/platform/x86/intel/pmc/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config INTEL_PMC_CORE
+	tristate "Intel PMC Core driver"
+	depends on PCI
+	depends on ACPI
+	help
+	  The Intel Platform Controller Hub for Intel Core SoCs provides access
+	  to Power Management Controller registers via various interfaces. This
+	  driver can utilize debugging capabilities and supported features as
+	  exposed by the Power Management Controller. It also may perform some
+	  tasks in the PMC in order to enable transition into the SLPS0 state.
+	  It should be selected on all Intel platforms supported by the driver.
+
+	  Supported features:
+		- SLP_S0_RESIDENCY counter
+		- PCH IP Power Gating status
+		- LTR Ignore / LTR Show
+		- MPHY/PLL gating status (Sunrisepoint PCH only)
+		- SLPS0 Debug registers (Cannonlake/Icelake PCH)
+		- Low Power Mode registers (Tigerlake and beyond)
+		- PMC quirks as needed to enable SLPS0/S0ix
diff --git a/drivers/platform/x86/intel/pmc/Makefile b/drivers/platform/x86/intel/pmc/Makefile
new file mode 100644
index 000000000000..633a7598d6d6
--- /dev/null
+++ b/drivers/platform/x86/intel/pmc/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+
+obj-$(CONFIG_INTEL_PMC_CORE)	+= intel_pmc_core.o
+obj-$(CONFIG_INTEL_PMC_CORE)	+= intel_pmc_core_pltdrv.o
diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel/pmc/intel_pmc_core.c
similarity index 100%
rename from drivers/platform/x86/intel_pmc_core.c
rename to drivers/platform/x86/intel/pmc/intel_pmc_core.c
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel/pmc/intel_pmc_core.h
similarity index 100%
rename from drivers/platform/x86/intel_pmc_core.h
rename to drivers/platform/x86/intel/pmc/intel_pmc_core.h
diff --git a/drivers/platform/x86/intel_pmc_core_pltdrv.c b/drivers/platform/x86/intel/pmc/intel_pmc_core_pltdrv.c
similarity index 100%
rename from drivers/platform/x86/intel_pmc_core_pltdrv.c
rename to drivers/platform/x86/intel/pmc/intel_pmc_core_pltdrv.c
-- 
2.25.1


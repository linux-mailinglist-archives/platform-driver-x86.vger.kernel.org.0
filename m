Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15304303F8B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Jan 2021 15:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404105AbhAZOBm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 26 Jan 2021 09:01:42 -0500
Received: from mga06.intel.com ([134.134.136.31]:50703 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405642AbhAZOBi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 09:01:38 -0500
IronPort-SDR: tGcN33QxRll8ch/PUIP8z2UoHVQN+g5lxfcyeL0mRpi1bpc2ZNrb1TNc/0m0s68Gy3o4DfRxqb
 s0OvMJH4mjpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="241432296"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="241432296"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 05:59:51 -0800
IronPort-SDR: r+GapODgkcERzzIoNx7bLZtt2Rd05TUsLYythLoukuWa9+igYbqru94kcVEhNyFq9m7Btgyy2F
 pCU/biVO4/cA==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="429718552"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 05:59:49 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l4Oto-00ETzC-Qu; Tue, 26 Jan 2021 16:00:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if ACPI_WMI'
Date:   Tue, 26 Jan 2021 16:00:52 +0200
Message-Id: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Surround WMI drivers by 'if ACPI_WMI' instead of depending
each of them separately.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/Kconfig | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4a5798a0ce0c..288f8f82d796 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -37,9 +37,10 @@ config ACPI_WMI
 	  It is safe to enable this driver even if your DSDT doesn't define
 	  any ACPI-WMI devices.
 
+if ACPI_WMI
+
 config WMI_BMOF
 	tristate "WMI embedded Binary MOF driver"
-	depends on ACPI_WMI
 	default ACPI_WMI
 	help
 	  Say Y here if you want to be able to read a firmware-embedded
@@ -54,7 +55,6 @@ config ALIENWARE_WMI
 	depends on ACPI
 	depends on LEDS_CLASS
 	depends on NEW_LEDS
-	depends on ACPI_WMI
 	help
 	 This is a driver for controlling Alienware BIOS driven
 	 features.  It exposes an interface for controlling the AlienFX
@@ -64,7 +64,6 @@ config ALIENWARE_WMI
 config HUAWEI_WMI
 	tristate "Huawei WMI laptop extras driver"
 	depends on ACPI_BATTERY
-	depends on ACPI_WMI
 	depends on INPUT
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
@@ -91,7 +90,6 @@ config UV_SYSFS
 
 config INTEL_WMI_SBL_FW_UPDATE
 	tristate "Intel WMI Slim Bootloader firmware update signaling driver"
-	depends on ACPI_WMI
 	help
 	  Say Y here if you want to be able to use the WMI interface to signal
 	  Slim Bootloader to trigger update on next reboot.
@@ -101,7 +99,6 @@ config INTEL_WMI_SBL_FW_UPDATE
 
 config INTEL_WMI_THUNDERBOLT
 	tristate "Intel WMI thunderbolt force power driver"
-	depends on ACPI_WMI
 	help
 	  Say Y here if you want to be able to use the WMI interface on select
 	  systems to force the power control of Intel Thunderbolt controllers.
@@ -112,22 +109,19 @@ config INTEL_WMI_THUNDERBOLT
 	  be called intel-wmi-thunderbolt.
 
 config MXM_WMI
-       tristate "WMI support for MXM Laptop Graphics"
-       depends on ACPI_WMI
+	tristate "WMI support for MXM Laptop Graphics"
 	help
           MXM is a standard for laptop graphics cards, the WMI interface
 	  is required for switchable nvidia graphics machines
 
 config PEAQ_WMI
 	tristate "PEAQ 2-in-1 WMI hotkey driver"
-	depends on ACPI_WMI
 	depends on INPUT
 	help
 	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
 
 config XIAOMI_WMI
 	tristate "Xiaomi WMI key driver"
-	depends on ACPI_WMI
 	depends on INPUT
 	help
 	  Say Y here if you want to support WMI-based keys on Xiaomi notebooks.
@@ -135,6 +129,8 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
+endif # ACPI_WMI
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI && THERMAL
-- 
2.30.0


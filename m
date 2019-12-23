Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40ADA1296FA
	for <lists+platform-driver-x86@lfdr.de>; Mon, 23 Dec 2019 15:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbfLWOSA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 23 Dec 2019 09:18:00 -0500
Received: from mga03.intel.com ([134.134.136.65]:47094 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbfLWORa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Dec 2019 09:17:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Dec 2019 06:17:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; 
   d="scan'208";a="417276272"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 23 Dec 2019 06:17:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8A0851666; Mon, 23 Dec 2019 16:17:18 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc:     Zha Qipeng <qipeng.zha@intel.com>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 32/37] platform/x86: intel_pmc_ipc: Move PCI IDs to intel_scu_pcidrv.c
Date:   Mon, 23 Dec 2019 17:17:11 +0300
Message-Id: <20191223141716.13727-33-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The PCI probe driver in intel_pmc_ipc.c is a duplicate of what we
already have in intel_scu_pcidrv.c with the exception that the later also
creates SCU specific devices. Move the PCI IDs from the intel_pmc_ipc.c
to intel_scu.c and use driver_data to detect whether SCU devices need to
be created or not.

Also update Kconfig entry to mention all platforms supported by the
Intel SCU PCI driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/Kconfig            | 13 +++--
 drivers/platform/x86/intel_pmc_ipc.c    | 73 +------------------------
 drivers/platform/x86/intel_scu_pcidrv.c | 21 +++++--
 3 files changed, 27 insertions(+), 80 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 797683c5d005..1c5afb9e4965 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -994,13 +994,18 @@ config INTEL_SCU
 
 config INTEL_SCU_PCI
 	bool "Intel SCU PCI driver"
-	depends on X86_INTEL_MID
+	depends on X86_INTEL_MID || PCI
 	select INTEL_SCU
 	help
 	  SCU is used to bridge the communications between kernel and
 	  SCU on some embedded Intel x86 platforms. It also creates
-	  devices that are connected to the SoC through the SCU. This is
-	  not needed for PC-type machines.
+	  devices that are connected to the SoC through the SCU.
+	  Platforms supported:
+	    Medfield
+	    Clovertrail
+	    Merrifield
+	    Broxton
+	    Apollo Lake
 
 config INTEL_SCU_IPC_UTIL
 	tristate "Intel SCU IPC utility driver"
@@ -1192,7 +1197,7 @@ config INTEL_SMARTCONNECT
 
 config INTEL_PMC_IPC
 	tristate "Intel PMC IPC Driver"
-	depends on ACPI && PCI
+	depends on ACPI
 	select INTEL_SCU_IPC
 	---help---
 	This driver provides support for PMC control on some Intel platforms.
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 241bce603183..acec1c6d2069 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -17,7 +17,6 @@
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
 
 #include <asm/intel_pmc_ipc.h>
@@ -194,62 +193,6 @@ static int update_no_reboot_bit(void *priv, bool set)
 				    PMC_CFG_NO_REBOOT_MASK, value);
 }
 
-static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-{
-	struct intel_pmc_ipc_dev *pmc = &ipcdev;
-	struct intel_scu_ipc_pdata pdata;
-	struct intel_scu_ipc_dev *scu;
-	int ret;
-
-	/* Only one PMC is supported */
-	if (pmc->dev)
-		return -EBUSY;
-
-	memset(&pdata, 0, sizeof(pdata));
-	spin_lock_init(&ipcdev.gcr_lock);
-
-	ret = pcim_enable_device(pdev);
-	if (ret)
-		return ret;
-
-	ret = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
-	if (ret)
-		return ret;
-
-	pdata.ipc_regs = pcim_iomap_table(pdev)[0];
-
-	scu = intel_scu_ipc_probe(&pdev->dev, &pdata);
-	if (IS_ERR(scu))
-		return PTR_ERR(scu);
-
-	pmc->dev = &pdev->dev;
-
-	pci_set_drvdata(pdev, scu);
-
-	return 0;
-}
-
-static void ipc_pci_remove(struct pci_dev *pdev)
-{
-	intel_scu_ipc_remove(pci_get_drvdata(pdev));
-	ipcdev.dev = NULL;
-}
-
-static const struct pci_device_id ipc_pci_ids[] = {
-	{PCI_VDEVICE(INTEL, 0x0a94), 0},
-	{PCI_VDEVICE(INTEL, 0x1a94), 0},
-	{PCI_VDEVICE(INTEL, 0x5a94), 0},
-	{ 0,}
-};
-MODULE_DEVICE_TABLE(pci, ipc_pci_ids);
-
-static struct pci_driver ipc_pci_driver = {
-	.name = "intel_pmc_ipc",
-	.id_table = ipc_pci_ids,
-	.probe = ipc_pci_probe,
-	.remove = ipc_pci_remove,
-};
-
 static ssize_t intel_pmc_ipc_simple_cmd_store(struct device *dev,
 					      struct device_attribute *attr,
 					      const char *buf, size_t count)
@@ -697,25 +640,11 @@ static struct platform_driver ipc_plat_driver = {
 
 static int __init intel_pmc_ipc_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&ipc_plat_driver);
-	if (ret) {
-		pr_err("Failed to register PMC ipc platform driver\n");
-		return ret;
-	}
-	ret = pci_register_driver(&ipc_pci_driver);
-	if (ret) {
-		pr_err("Failed to register PMC ipc pci driver\n");
-		platform_driver_unregister(&ipc_plat_driver);
-		return ret;
-	}
-	return ret;
+	return platform_driver_register(&ipc_plat_driver);
 }
 
 static void __exit intel_pmc_ipc_exit(void)
 {
-	pci_unregister_driver(&ipc_pci_driver);
 	platform_driver_unregister(&ipc_plat_driver);
 }
 
diff --git a/drivers/platform/x86/intel_scu_pcidrv.c b/drivers/platform/x86/intel_scu_pcidrv.c
index 43bcebf01374..dedf1ef311d2 100644
--- a/drivers/platform/x86/intel_scu_pcidrv.c
+++ b/drivers/platform/x86/intel_scu_pcidrv.c
@@ -17,6 +17,7 @@
 static int intel_scu_pci_probe(struct pci_dev *pdev,
 			       const struct pci_device_id *id)
 {
+	void (*setup_fn)(void) = (void (*)(void))id->driver_data;
 	struct intel_scu_ipc_pdata *pdata;
 	struct intel_scu_ipc_dev *scu;
 	int ret;
@@ -40,14 +41,26 @@ static int intel_scu_pci_probe(struct pci_dev *pdev,
 	if (IS_ERR(scu))
 		return PTR_ERR(scu);
 
-	intel_scu_devices_create();
+	if (setup_fn)
+		setup_fn();
 	return 0;
 }
 
+static void intel_mid_scu_setup(void)
+{
+	intel_scu_devices_create();
+}
+
 static const struct pci_device_id pci_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x080e) },
-	{ PCI_VDEVICE(INTEL, 0x08ea) },
-	{ PCI_VDEVICE(INTEL, 0x11a0) },
+	{ PCI_VDEVICE(INTEL, 0x080e),
+	  .driver_data = (kernel_ulong_t)intel_mid_scu_setup },
+	{ PCI_VDEVICE(INTEL, 0x08ea),
+	  .driver_data = (kernel_ulong_t)intel_mid_scu_setup },
+	{ PCI_VDEVICE(INTEL, 0x0a94) },
+	{ PCI_VDEVICE(INTEL, 0x11a0),
+	  .driver_data = (kernel_ulong_t)intel_mid_scu_setup },
+	{ PCI_VDEVICE(INTEL, 0x1a94) },
+	{ PCI_VDEVICE(INTEL, 0x5a94) },
 	{}
 };
 
-- 
2.24.0


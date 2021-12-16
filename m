Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1F4476802
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Dec 2021 03:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhLPCbv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 15 Dec 2021 21:31:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:41134 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232974AbhLPCbt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Dec 2021 21:31:49 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239198031"
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; 
   d="scan'208";a="239198031"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 18:31:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; 
   d="scan'208";a="465861925"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 15 Dec 2021 18:31:48 -0800
Received: from debox1-desk4.intel.com (unknown [10.209.86.221])
        by linux.intel.com (Postfix) with ESMTP id F0923580D42;
        Wed, 15 Dec 2021 18:31:47 -0800 (PST)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     lee.jones@linaro.org, hdegoede@redhat.com,
        david.e.box@linux.intel.com, bhelgaas@google.com,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        srinivas.pandruvada@intel.com, mgross@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org, Mark Gross <markgross@kernel.org>
Subject: [PATCH V4 3/6] platform/x86/intel: Move intel_pmt from MFD to Auxiliary Bus
Date:   Wed, 15 Dec 2021 18:31:43 -0800
Message-Id: <20211216023146.2361174-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216023146.2361174-1-david.e.box@linux.intel.com>
References: <20211216023146.2361174-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Intel Platform Monitoring Technology (PMT) support is indicated by presence
of an Intel defined PCIe Designated Vendor Specific Extended Capabilities
(DVSEC) structure with a PMT specific ID. The current MFD implementation
creates child devices for each PMT feature, currently telemetry, watcher,
and crashlog. However DVSEC structures may also be used by Intel to
indicate support for other features. The Out Of Band Management Services
Module (OOBMSM) uses DVSEC to enumerate several features, including PMT.
In order to support them it is necessary to modify the intel_pmt driver to
handle the creation of the child devices more generically. To that end,
modify the driver to create child devices for any VSEC/DVSEC features on
supported devices (indicated by PCI ID).  Additionally, move the
implementation from MFD to the Auxiliary bus.  VSEC/DVSEC features are
really multifunctional PCI devices, not platform devices as MFD was
designed for. Auxiliary bus gives more flexibility by allowing the
definition of custom structures that can be shared between associated
auxiliary devices and the parent device. Also, rename the driver from
intel_pmt to intel_vsec to better reflect the purpose.

This series also removes the current runtime pm support which was not
complete to begin with. None of the current devices require runtime pm.
However the support will be replaced when a device is added that requires
it.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Mark Gross <markgross@kernel.org>
---
V4
  - Add intel_vsec_extract_vsec() to combine common code and simplify
    the extended capability loops. Suggested by Andy.
V3
  - Add comment clarifying how driver cleanup is handled without remove().

V2
  - Clarify status of missing pm support in commit message.
  - Clarify why auxiliary bus is preferred in commit message.

 MAINTAINERS                                |  12 +-
 drivers/mfd/Kconfig                        |  10 -
 drivers/mfd/Makefile                       |   1 -
 drivers/mfd/intel_pmt.c                    | 261 -------------
 drivers/platform/x86/intel/Kconfig         |  11 +
 drivers/platform/x86/intel/Makefile        |   2 +
 drivers/platform/x86/intel/pmt/Kconfig     |   4 +-
 drivers/platform/x86/intel/pmt/class.c     |  21 +-
 drivers/platform/x86/intel/pmt/class.h     |   5 +-
 drivers/platform/x86/intel/pmt/crashlog.c  |  47 +--
 drivers/platform/x86/intel/pmt/telemetry.c |  46 +--
 drivers/platform/x86/intel/vsec.c          | 405 +++++++++++++++++++++
 drivers/platform/x86/intel/vsec.h          |  43 +++
 13 files changed, 533 insertions(+), 335 deletions(-)
 delete mode 100644 drivers/mfd/intel_pmt.c
 create mode 100644 drivers/platform/x86/intel/vsec.c
 create mode 100644 drivers/platform/x86/intel/vsec.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 43007f2d29e0..cd2b10a86f09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9752,10 +9752,9 @@ S:	Maintained
 F:	drivers/mfd/intel_soc_pmic*
 F:	include/linux/mfd/intel_soc_pmic*
 
-INTEL PMT DRIVER
-M:	"David E. Box" <david.e.box@linux.intel.com>
-S:	Maintained
-F:	drivers/mfd/intel_pmt.c
+INTEL PMT DRIVERS
+M:	David E. Box <david.e.box@linux.intel.com>
+S:	Supported
 F:	drivers/platform/x86/intel/pmt/
 
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
@@ -9822,6 +9821,11 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/intel/uncore-frequency.c
 
+INTEL VENDOR SPECIFIC EXTENDED CAPABILITIES DRIVER
+M:	David E. Box <david.e.box@linux.intel.com>
+S:	Supported
+F:	drivers/platform/x86/intel/vsec.*
+
 INTEL VIRTUAL BUTTON DRIVER
 M:	AceLan Kao <acelan.kao@canonical.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3fb480818599..ac7b23eb62c2 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -692,16 +692,6 @@ config MFD_INTEL_PMC_BXT
 	  Register and P-unit access. In addition this creates devices
 	  for iTCO watchdog and telemetry that are part of the PMC.
 
-config MFD_INTEL_PMT
-	tristate "Intel Platform Monitoring Technology (PMT) support"
-	depends on X86 && PCI
-	select MFD_CORE
-	help
-	  The Intel Platform Monitoring Technology (PMT) is an interface that
-	  provides access to hardware monitor registers. This driver supports
-	  Telemetry, Watcher, and Crashlog PMT capabilities/devices for
-	  platforms starting from Tiger Lake.
-
 config MFD_IPAQ_MICRO
 	bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
 	depends on SA1100_H3100 || SA1100_H3600
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 0b1b629aef3e..31734d9318e2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -211,7 +211,6 @@ obj-$(CONFIG_MFD_INTEL_LPSS)	+= intel-lpss.o
 obj-$(CONFIG_MFD_INTEL_LPSS_PCI)	+= intel-lpss-pci.o
 obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)	+= intel-lpss-acpi.o
 obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
-obj-$(CONFIG_MFD_INTEL_PMT)	+= intel_pmt.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
deleted file mode 100644
index dd7eb614c28e..000000000000
--- a/drivers/mfd/intel_pmt.c
+++ /dev/null
@@ -1,261 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Intel Platform Monitoring Technology PMT driver
- *
- * Copyright (c) 2020, Intel Corporation.
- * All Rights Reserved.
- *
- * Author: David E. Box <david.e.box@linux.intel.com>
- */
-
-#include <linux/bits.h>
-#include <linux/kernel.h>
-#include <linux/mfd/core.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h>
-#include <linux/pm.h>
-#include <linux/pm_runtime.h>
-#include <linux/types.h>
-
-/* Intel DVSEC capability vendor space offsets */
-#define INTEL_DVSEC_ENTRIES		0xA
-#define INTEL_DVSEC_SIZE		0xB
-#define INTEL_DVSEC_TABLE		0xC
-#define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
-#define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
-#define INTEL_DVSEC_ENTRY_SIZE		4
-
-/* PMT capabilities */
-#define DVSEC_INTEL_ID_TELEMETRY	2
-#define DVSEC_INTEL_ID_WATCHER		3
-#define DVSEC_INTEL_ID_CRASHLOG		4
-
-struct intel_dvsec_header {
-	u16	length;
-	u16	id;
-	u8	num_entries;
-	u8	entry_size;
-	u8	tbir;
-	u32	offset;
-};
-
-enum pmt_quirks {
-	/* Watcher capability not supported */
-	PMT_QUIRK_NO_WATCHER	= BIT(0),
-
-	/* Crashlog capability not supported */
-	PMT_QUIRK_NO_CRASHLOG	= BIT(1),
-
-	/* Use shift instead of mask to read discovery table offset */
-	PMT_QUIRK_TABLE_SHIFT	= BIT(2),
-
-	/* DVSEC not present (provided in driver data) */
-	PMT_QUIRK_NO_DVSEC	= BIT(3),
-};
-
-struct pmt_platform_info {
-	unsigned long quirks;
-	struct intel_dvsec_header **capabilities;
-};
-
-static const struct pmt_platform_info tgl_info = {
-	.quirks = PMT_QUIRK_NO_WATCHER | PMT_QUIRK_NO_CRASHLOG |
-		  PMT_QUIRK_TABLE_SHIFT,
-};
-
-/* DG1 Platform with DVSEC quirk*/
-static struct intel_dvsec_header dg1_telemetry = {
-	.length = 0x10,
-	.id = 2,
-	.num_entries = 1,
-	.entry_size = 3,
-	.tbir = 0,
-	.offset = 0x466000,
-};
-
-static struct intel_dvsec_header *dg1_capabilities[] = {
-	&dg1_telemetry,
-	NULL
-};
-
-static const struct pmt_platform_info dg1_info = {
-	.quirks = PMT_QUIRK_NO_DVSEC,
-	.capabilities = dg1_capabilities,
-};
-
-static int pmt_add_dev(struct pci_dev *pdev, struct intel_dvsec_header *header,
-		       unsigned long quirks)
-{
-	struct device *dev = &pdev->dev;
-	struct resource *res, *tmp;
-	struct mfd_cell *cell;
-	const char *name;
-	int count = header->num_entries;
-	int size = header->entry_size;
-	int id = header->id;
-	int i;
-
-	switch (id) {
-	case DVSEC_INTEL_ID_TELEMETRY:
-		name = "pmt_telemetry";
-		break;
-	case DVSEC_INTEL_ID_WATCHER:
-		if (quirks & PMT_QUIRK_NO_WATCHER) {
-			dev_info(dev, "Watcher not supported\n");
-			return -EINVAL;
-		}
-		name = "pmt_watcher";
-		break;
-	case DVSEC_INTEL_ID_CRASHLOG:
-		if (quirks & PMT_QUIRK_NO_CRASHLOG) {
-			dev_info(dev, "Crashlog not supported\n");
-			return -EINVAL;
-		}
-		name = "pmt_crashlog";
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (!header->num_entries || !header->entry_size) {
-		dev_err(dev, "Invalid count or size for %s header\n", name);
-		return -EINVAL;
-	}
-
-	cell = devm_kzalloc(dev, sizeof(*cell), GFP_KERNEL);
-	if (!cell)
-		return -ENOMEM;
-
-	res = devm_kcalloc(dev, count, sizeof(*res), GFP_KERNEL);
-	if (!res)
-		return -ENOMEM;
-
-	if (quirks & PMT_QUIRK_TABLE_SHIFT)
-		header->offset >>= 3;
-
-	/*
-	 * The PMT DVSEC contains the starting offset and count for a block of
-	 * discovery tables, each providing access to monitoring facilities for
-	 * a section of the device. Create a resource list of these tables to
-	 * provide to the driver.
-	 */
-	for (i = 0, tmp = res; i < count; i++, tmp++) {
-		tmp->start = pdev->resource[header->tbir].start +
-			     header->offset + i * (size << 2);
-		tmp->end = tmp->start + (size << 2) - 1;
-		tmp->flags = IORESOURCE_MEM;
-	}
-
-	cell->resources = res;
-	cell->num_resources = count;
-	cell->name = name;
-
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cell, 1, NULL, 0,
-				    NULL);
-}
-
-static int pmt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-{
-	struct pmt_platform_info *info;
-	unsigned long quirks = 0;
-	bool found_devices = false;
-	int ret, pos = 0;
-
-	ret = pcim_enable_device(pdev);
-	if (ret)
-		return ret;
-
-	info = (struct pmt_platform_info *)id->driver_data;
-
-	if (info)
-		quirks = info->quirks;
-
-	if (info && (info->quirks & PMT_QUIRK_NO_DVSEC)) {
-		struct intel_dvsec_header **header;
-
-		header = info->capabilities;
-		while (*header) {
-			ret = pmt_add_dev(pdev, *header, quirks);
-			if (ret)
-				dev_warn(&pdev->dev,
-					 "Failed to add device for DVSEC id %d\n",
-					 (*header)->id);
-			else
-				found_devices = true;
-
-			++header;
-		}
-	} else {
-		do {
-			struct intel_dvsec_header header;
-			u32 table;
-			u16 vid;
-
-			pos = pci_find_next_ext_capability(pdev, pos, PCI_EXT_CAP_ID_DVSEC);
-			if (!pos)
-				break;
-
-			pci_read_config_word(pdev, pos + PCI_DVSEC_HEADER1, &vid);
-			if (vid != PCI_VENDOR_ID_INTEL)
-				continue;
-
-			pci_read_config_word(pdev, pos + PCI_DVSEC_HEADER2,
-					     &header.id);
-			pci_read_config_byte(pdev, pos + INTEL_DVSEC_ENTRIES,
-					     &header.num_entries);
-			pci_read_config_byte(pdev, pos + INTEL_DVSEC_SIZE,
-					     &header.entry_size);
-			pci_read_config_dword(pdev, pos + INTEL_DVSEC_TABLE,
-					      &table);
-
-			header.tbir = INTEL_DVSEC_TABLE_BAR(table);
-			header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
-
-			ret = pmt_add_dev(pdev, &header, quirks);
-			if (ret)
-				continue;
-
-			found_devices = true;
-		} while (true);
-	}
-
-	if (!found_devices)
-		return -ENODEV;
-
-	pm_runtime_put(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
-
-	return 0;
-}
-
-static void pmt_pci_remove(struct pci_dev *pdev)
-{
-	pm_runtime_forbid(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
-}
-
-#define PCI_DEVICE_ID_INTEL_PMT_ADL	0x467d
-#define PCI_DEVICE_ID_INTEL_PMT_DG1	0x490e
-#define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
-#define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
-static const struct pci_device_id pmt_pci_ids[] = {
-	{ PCI_DEVICE_DATA(INTEL, PMT_ADL, &tgl_info) },
-	{ PCI_DEVICE_DATA(INTEL, PMT_DG1, &dg1_info) },
-	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, NULL) },
-	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
-	{ }
-};
-MODULE_DEVICE_TABLE(pci, pmt_pci_ids);
-
-static struct pci_driver pmt_pci_driver = {
-	.name = "intel-pmt",
-	.id_table = pmt_pci_ids,
-	.probe = pmt_pci_probe,
-	.remove = pmt_pci_remove,
-};
-module_pci_driver(pmt_pci_driver);
-
-MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
-MODULE_DESCRIPTION("Intel Platform Monitoring Technology PMT driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 38ce3e344589..35a5d1a5eba8 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -184,4 +184,15 @@ config INTEL_UNCORE_FREQ_CONTROL
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel-uncore-frequency.
 
+config INTEL_VSEC
+	tristate "Intel Vendor Specific Extended Capabilities Driver"
+	depends on PCI
+	select AUXILIARY_BUS
+	help
+	  Adds support for feature drivers exposed using Intel PCIe VSEC and
+	  DVSEC.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called intel_vsec.
+
 endif # X86_PLATFORM_DRIVERS_INTEL
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 7c24be2423d8..8ecdf709fb17 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -26,6 +26,8 @@ intel_int0002_vgpio-y			:= int0002_vgpio.o
 obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
 intel_oaktrail-y			:= oaktrail.o
 obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
+intel_vsec-y				:= vsec.o
+obj-$(CONFIG_INTEL_VSEC)		+= intel_vsec.o
 
 # Intel PMIC / PMC / P-Unit drivers
 intel_bxtwc_tmu-y			:= bxtwc_tmu.o
diff --git a/drivers/platform/x86/intel/pmt/Kconfig b/drivers/platform/x86/intel/pmt/Kconfig
index d630f883a717..e916fc966221 100644
--- a/drivers/platform/x86/intel/pmt/Kconfig
+++ b/drivers/platform/x86/intel/pmt/Kconfig
@@ -17,7 +17,7 @@ config INTEL_PMT_CLASS
 
 config INTEL_PMT_TELEMETRY
 	tristate "Intel Platform Monitoring Technology (PMT) Telemetry driver"
-	depends on MFD_INTEL_PMT
+	depends on INTEL_VSEC
 	select INTEL_PMT_CLASS
 	help
 	  The Intel Platform Monitory Technology (PMT) Telemetry driver provides
@@ -29,7 +29,7 @@ config INTEL_PMT_TELEMETRY
 
 config INTEL_PMT_CRASHLOG
 	tristate "Intel Platform Monitoring Technology (PMT) Crashlog driver"
-	depends on MFD_INTEL_PMT
+	depends on INTEL_VSEC
 	select INTEL_PMT_CLASS
 	help
 	  The Intel Platform Monitoring Technology (PMT) crashlog driver provides
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 659b1073033c..1c9e3f3ea41c 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/pci.h>
 
+#include "../vsec.h"
 #include "class.h"
 
 #define PMT_XA_START		0
@@ -281,31 +282,29 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	return ret;
 }
 
-int intel_pmt_dev_create(struct intel_pmt_entry *entry,
-			 struct intel_pmt_namespace *ns,
-			 struct platform_device *pdev, int idx)
+int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespace *ns,
+			 struct intel_vsec_device *intel_vsec_dev, int idx)
 {
+	struct device *dev = &intel_vsec_dev->auxdev.dev;
 	struct intel_pmt_header header;
 	struct resource	*disc_res;
-	int ret = -ENODEV;
+	int ret;
 
-	disc_res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
-	if (!disc_res)
-		return ret;
+	disc_res = &intel_vsec_dev->resource[idx];
 
-	entry->disc_table = devm_platform_ioremap_resource(pdev, idx);
+	entry->disc_table = devm_ioremap_resource(dev, disc_res);
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
 
-	ret = ns->pmt_header_decode(entry, &header, &pdev->dev);
+	ret = ns->pmt_header_decode(entry, &header, dev);
 	if (ret)
 		return ret;
 
-	ret = intel_pmt_populate_entry(entry, &header, &pdev->dev, disc_res);
+	ret = intel_pmt_populate_entry(entry, &header, dev, disc_res);
 	if (ret)
 		return ret;
 
-	return intel_pmt_dev_register(entry, ns, &pdev->dev);
+	return intel_pmt_dev_register(entry, ns, dev);
 
 }
 EXPORT_SYMBOL_GPL(intel_pmt_dev_create);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index 1337019c2873..db11d58867ce 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -2,13 +2,14 @@
 #ifndef _INTEL_PMT_CLASS_H
 #define _INTEL_PMT_CLASS_H
 
-#include <linux/platform_device.h>
 #include <linux/xarray.h>
 #include <linux/types.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/io.h>
 
+#include "../vsec.h"
+
 /* PMT access types */
 #define ACCESS_BARID		2
 #define ACCESS_LOCAL		3
@@ -47,7 +48,7 @@ struct intel_pmt_namespace {
 bool intel_pmt_is_early_client_hw(struct device *dev);
 int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_pmt_namespace *ns,
-			 struct platform_device *pdev, int idx);
+			 struct intel_vsec_device *dev, int idx);
 void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 			   struct intel_pmt_namespace *ns);
 #endif
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 1c1021f04d3c..34daf9df168b 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -8,6 +8,7 @@
  * Author: "Alexander Duyck" <alexander.h.duyck@linux.intel.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -15,10 +16,9 @@
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
 
+#include "../vsec.h"
 #include "class.h"
 
-#define DRV_NAME		"pmt_crashlog"
-
 /* Crashlog discovery header types */
 #define CRASH_TYPE_OOBMSM	1
 
@@ -257,34 +257,34 @@ static struct intel_pmt_namespace pmt_crashlog_ns = {
 /*
  * initialization
  */
-static int pmt_crashlog_remove(struct platform_device *pdev)
+static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 {
-	struct pmt_crashlog_priv *priv = platform_get_drvdata(pdev);
+	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
 	for (i = 0; i < priv->num_entries; i++)
 		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
-
-	return 0;
 }
 
-static int pmt_crashlog_probe(struct platform_device *pdev)
+static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
+			      const struct auxiliary_device_id *id)
 {
+	struct intel_vsec_device *intel_vsec_dev = auxdev_to_ivdev(auxdev);
 	struct pmt_crashlog_priv *priv;
 	size_t size;
 	int i, ret;
 
-	size = struct_size(priv, entry, pdev->num_resources);
-	priv = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
+	size = struct_size(priv, entry, intel_vsec_dev->num_resources);
+	priv = devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, priv);
+	auxiliary_set_drvdata(auxdev, priv);
 
-	for (i = 0; i < pdev->num_resources; i++) {
+	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[i].entry;
 
-		ret = intel_pmt_dev_create(entry, &pmt_crashlog_ns, pdev, i);
+		ret = intel_pmt_dev_create(entry, &pmt_crashlog_ns, intel_vsec_dev, i);
 		if (ret < 0)
 			goto abort_probe;
 		if (ret)
@@ -295,26 +295,30 @@ static int pmt_crashlog_probe(struct platform_device *pdev)
 
 	return 0;
 abort_probe:
-	pmt_crashlog_remove(pdev);
+	pmt_crashlog_remove(auxdev);
 	return ret;
 }
 
-static struct platform_driver pmt_crashlog_driver = {
-	.driver = {
-		.name   = DRV_NAME,
-	},
-	.remove = pmt_crashlog_remove,
-	.probe  = pmt_crashlog_probe,
+static const struct auxiliary_device_id pmt_crashlog_id_table[] = {
+	{ .name = "intel_vsec.crashlog" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, pmt_crashlog_id_table);
+
+static struct auxiliary_driver pmt_crashlog_aux_driver = {
+	.id_table	= pmt_crashlog_id_table,
+	.remove		= pmt_crashlog_remove,
+	.probe		= pmt_crashlog_probe,
 };
 
 static int __init pmt_crashlog_init(void)
 {
-	return platform_driver_register(&pmt_crashlog_driver);
+	return auxiliary_driver_register(&pmt_crashlog_aux_driver);
 }
 
 static void __exit pmt_crashlog_exit(void)
 {
-	platform_driver_unregister(&pmt_crashlog_driver);
+	auxiliary_driver_unregister(&pmt_crashlog_aux_driver);
 	xa_destroy(&crashlog_array);
 }
 
@@ -323,5 +327,4 @@ module_exit(pmt_crashlog_exit);
 
 MODULE_AUTHOR("Alexander Duyck <alexander.h.duyck@linux.intel.com>");
 MODULE_DESCRIPTION("Intel PMT Crashlog driver");
-MODULE_ALIAS("platform:" DRV_NAME);
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 38d52651c572..6b6f3e2a617a 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -8,6 +8,7 @@
  * Author: "David E. Box" <david.e.box@linux.intel.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -15,10 +16,9 @@
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
 
+#include "../vsec.h"
 #include "class.h"
 
-#define TELEM_DEV_NAME		"pmt_telemetry"
-
 #define TELEM_SIZE_OFFSET	0x0
 #define TELEM_GUID_OFFSET	0x4
 #define TELEM_BASE_OFFSET	0x8
@@ -79,34 +79,33 @@ static struct intel_pmt_namespace pmt_telem_ns = {
 	.pmt_header_decode = pmt_telem_header_decode,
 };
 
-static int pmt_telem_remove(struct platform_device *pdev)
+static void pmt_telem_remove(struct auxiliary_device *auxdev)
 {
-	struct pmt_telem_priv *priv = platform_get_drvdata(pdev);
+	struct pmt_telem_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
 	for (i = 0; i < priv->num_entries; i++)
 		intel_pmt_dev_destroy(&priv->entry[i], &pmt_telem_ns);
-
-	return 0;
 }
 
-static int pmt_telem_probe(struct platform_device *pdev)
+static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
 {
+	struct intel_vsec_device *intel_vsec_dev = auxdev_to_ivdev(auxdev);
 	struct pmt_telem_priv *priv;
 	size_t size;
 	int i, ret;
 
-	size = struct_size(priv, entry, pdev->num_resources);
-	priv = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
+	size = struct_size(priv, entry, intel_vsec_dev->num_resources);
+	priv = devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, priv);
+	auxiliary_set_drvdata(auxdev, priv);
 
-	for (i = 0; i < pdev->num_resources; i++) {
+	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[i];
 
-		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, pdev, i);
+		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
 		if (ret < 0)
 			goto abort_probe;
 		if (ret)
@@ -117,32 +116,35 @@ static int pmt_telem_probe(struct platform_device *pdev)
 
 	return 0;
 abort_probe:
-	pmt_telem_remove(pdev);
+	pmt_telem_remove(auxdev);
 	return ret;
 }
 
-static struct platform_driver pmt_telem_driver = {
-	.driver = {
-		.name   = TELEM_DEV_NAME,
-	},
-	.remove = pmt_telem_remove,
-	.probe  = pmt_telem_probe,
+static const struct auxiliary_device_id pmt_telem_id_table[] = {
+	{ .name = "intel_vsec.telemetry" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, pmt_telem_id_table);
+
+static struct auxiliary_driver pmt_telem_aux_driver = {
+	.id_table	= pmt_telem_id_table,
+	.remove		= pmt_telem_remove,
+	.probe		= pmt_telem_probe,
 };
 
 static int __init pmt_telem_init(void)
 {
-	return platform_driver_register(&pmt_telem_driver);
+	return auxiliary_driver_register(&pmt_telem_aux_driver);
 }
 module_init(pmt_telem_init);
 
 static void __exit pmt_telem_exit(void)
 {
-	platform_driver_unregister(&pmt_telem_driver);
+	auxiliary_driver_unregister(&pmt_telem_aux_driver);
 	xa_destroy(&telem_array);
 }
 module_exit(pmt_telem_exit);
 
 MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
 MODULE_DESCRIPTION("Intel PMT Telemetry driver");
-MODULE_ALIAS("platform:" TELEM_DEV_NAME);
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
new file mode 100644
index 000000000000..354f4d42e3c9
--- /dev/null
+++ b/drivers/platform/x86/intel/vsec.c
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Vendor Specific Extended Capabilities auxiliary bus driver
+ *
+ * Copyright (c) 2021, Intel Corporation.
+ * All Rights Reserved.
+ *
+ * Author: David E. Box <david.e.box@linux.intel.com>
+ *
+ * This driver discovers and creates auxiliary devices for Intel defined PCIe
+ * "Vendor Specific" and "Designated Vendor Specific" Extended Capabilities,
+ * VSEC and DVSEC respectively. The driver supports features on specific PCIe
+ * endpoints that exist primarily to expose them.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
+#include <linux/kernel.h>
+#include <linux/idr.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include "vsec.h"
+
+/* Intel DVSEC offsets */
+#define INTEL_DVSEC_ENTRIES		0xA
+#define INTEL_DVSEC_SIZE		0xB
+#define INTEL_DVSEC_TABLE		0xC
+#define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
+#define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
+#define TABLE_OFFSET_SHIFT		3
+
+static DEFINE_IDA(intel_vsec_ida);
+
+/**
+ * struct intel_vsec_header - Common fields of Intel VSEC and DVSEC registers.
+ * @rev:         Revision ID of the VSEC/DVSEC register space
+ * @length:      Length of the VSEC/DVSEC register space
+ * @id:          ID of the feature
+ * @num_entries: Number of instances of the feature
+ * @entry_size:  Size of the discovery table for each feature
+ * @tbir:        BAR containing the discovery tables
+ * @offset:      BAR offset of start of the first discovery table
+ */
+struct intel_vsec_header {
+	u8	rev;
+	u16	length;
+	u16	id;
+	u8	num_entries;
+	u8	entry_size;
+	u8	tbir;
+	u32	offset;
+};
+
+/* Platform specific data */
+struct intel_vsec_platform_info {
+	struct intel_vsec_header **capabilities;
+	unsigned long quirks;
+};
+
+enum intel_vsec_id {
+	VSEC_ID_TELEMETRY	= 2,
+	VSEC_ID_WATCHER		= 3,
+	VSEC_ID_CRASHLOG	= 4,
+};
+
+static enum intel_vsec_id intel_vsec_allow_list[] = {
+	VSEC_ID_TELEMETRY,
+	VSEC_ID_WATCHER,
+	VSEC_ID_CRASHLOG,
+};
+
+static const char *intel_vsec_name(enum intel_vsec_id id)
+{
+	switch (id) {
+	case VSEC_ID_TELEMETRY:
+		return "telemetry";
+
+	case VSEC_ID_WATCHER:
+		return "watcher";
+
+	case VSEC_ID_CRASHLOG:
+		return "crashlog";
+
+	default:
+		return NULL;
+	}
+}
+
+static bool intel_vsec_allowed(u16 id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(intel_vsec_allow_list); i++)
+		if (intel_vsec_allow_list[i] == id)
+			return true;
+
+	return false;
+}
+
+static bool intel_vsec_disabled(u16 id, unsigned long quirks)
+{
+	switch (id) {
+	case VSEC_ID_WATCHER:
+		return !!(quirks & VSEC_QUIRK_NO_WATCHER);
+
+	case VSEC_ID_CRASHLOG:
+		return !!(quirks & VSEC_QUIRK_NO_CRASHLOG);
+
+	default:
+		return false;
+	}
+}
+
+static void intel_vsec_remove_aux(void *data)
+{
+	auxiliary_device_delete(data);
+	auxiliary_device_uninit(data);
+}
+
+static void intel_vsec_dev_release(struct device *dev)
+{
+	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(dev);
+
+	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
+	kfree(intel_vsec_dev->resource);
+	kfree(intel_vsec_dev);
+}
+
+static int intel_vsec_add_aux(struct pci_dev *pdev, struct intel_vsec_device *intel_vsec_dev,
+			      const char *name)
+{
+	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
+	int ret;
+
+	ret = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
+	if (ret < 0) {
+		kfree(intel_vsec_dev);
+		return ret;
+	}
+
+	auxdev->id = ret;
+	auxdev->name = name;
+	auxdev->dev.parent = &pdev->dev;
+	auxdev->dev.release = intel_vsec_dev_release;
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0) {
+		ida_free(intel_vsec_dev->ida, auxdev->id);
+		kfree(intel_vsec_dev->resource);
+		kfree(intel_vsec_dev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret < 0) {
+		auxiliary_device_uninit(auxdev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(&pdev->dev, intel_vsec_remove_aux, auxdev);
+}
+
+static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
+			   unsigned long quirks)
+{
+	struct intel_vsec_device *intel_vsec_dev;
+	struct resource *res, *tmp;
+	int i;
+
+	if (!intel_vsec_allowed(header->id) || intel_vsec_disabled(header->id, quirks))
+		return -EINVAL;
+
+	if (!header->num_entries) {
+		dev_dbg(&pdev->dev, "Invalid 0 entry count for header id %d\n", header->id);
+		return -EINVAL;
+	}
+
+	if (!header->entry_size) {
+		dev_dbg(&pdev->dev, "Invalid 0 entry size for header id %d\n", header->id);
+		return -EINVAL;
+	}
+
+	intel_vsec_dev = kzalloc(sizeof(*intel_vsec_dev), GFP_KERNEL);
+	if (!intel_vsec_dev)
+		return -ENOMEM;
+
+	res = kcalloc(header->num_entries, sizeof(*res), GFP_KERNEL);
+	if (!res) {
+		kfree(intel_vsec_dev);
+		return -ENOMEM;
+	}
+
+	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
+		header->offset >>= TABLE_OFFSET_SHIFT;
+
+	/*
+	 * The DVSEC/VSEC contains the starting offset and count for a block of
+	 * discovery tables. Create a resource array of these tables to the
+	 * auxiliary device driver.
+	 */
+	for (i = 0, tmp = res; i < header->num_entries; i++, tmp++) {
+		tmp->start = pdev->resource[header->tbir].start +
+			     header->offset + i * (header->entry_size * sizeof(u32));
+		tmp->end = tmp->start + (header->entry_size * sizeof(u32)) - 1;
+		tmp->flags = IORESOURCE_MEM;
+	}
+
+	intel_vsec_dev->pcidev = pdev;
+	intel_vsec_dev->resource = res;
+	intel_vsec_dev->num_resources = header->num_entries;
+	intel_vsec_dev->quirks = quirks;
+	intel_vsec_dev->ida = &intel_vsec_ida;
+
+	return intel_vsec_add_aux(pdev, intel_vsec_dev, intel_vsec_name(header->id));
+}
+
+static bool intel_vsec_walk_header(struct pci_dev *pdev, unsigned long quirks,
+				struct intel_vsec_header **header)
+{
+	bool have_devices = false;
+	int ret;
+
+	for ( ; *header; header++) {
+		ret = intel_vsec_add_dev(pdev, *header, quirks);
+		if (ret)
+			dev_info(&pdev->dev, "Could not add device for DVSEC id %d\n",
+				 (*header)->id);
+		else
+			have_devices = true;
+	}
+
+	return have_devices;
+}
+
+static bool intel_vsec_extract_vsec(struct pci_dev *pdev, int pos, unsigned long quirks, int cap)
+{
+	struct intel_vsec_header header;
+	u32 table, hdr;
+	u16 vid;
+
+	if (cap == PCI_EXT_CAP_ID_DVSEC) {
+		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER1, &hdr);
+
+		/* Check vendor ID */
+		vid = PCI_DVSEC_HEADER1_VID(hdr);
+		if (vid != PCI_VENDOR_ID_INTEL)
+			return false;
+
+		/* Support only revision 1 */
+		header.rev = PCI_DVSEC_HEADER1_REV(hdr);
+		if (header.rev != 1) {
+			dev_info(&pdev->dev, "Unsupported DVSEC revision %d\n", header.rev);
+			return false;
+		}
+
+		header.length = PCI_DVSEC_HEADER1_LEN(hdr);
+
+		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
+		header.id = PCI_DVSEC_HEADER2_ID(hdr);
+
+	} else {
+		pci_read_config_dword(pdev, pos + PCI_VNDR_HEADER, &hdr);
+
+		/* Support only revision 1 */
+		header.rev = PCI_VNDR_HEADER_REV(hdr);
+		if (header.rev != 1) {
+			dev_info(&pdev->dev, "Unsupported VSEC revision %d\n", header.rev);
+			return false;
+		}
+
+		header.length = PCI_VNDR_HEADER_LEN(hdr);
+		header.id = PCI_VNDR_HEADER_ID(hdr);
+	}
+
+	/* entry, size, and table offsets are the same for VSEC & DVSEC */
+	pci_read_config_byte(pdev, pos + INTEL_DVSEC_ENTRIES, &header.num_entries);
+	pci_read_config_byte(pdev, pos + INTEL_DVSEC_SIZE, &header.entry_size);
+	pci_read_config_dword(pdev, pos + INTEL_DVSEC_TABLE, &table);
+
+	header.tbir = INTEL_DVSEC_TABLE_BAR(table);
+	header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
+
+	if (intel_vsec_add_dev(pdev, &header, quirks))
+		return false;
+
+	return true;
+}
+
+static bool intel_vsec_walk_dvsec(struct pci_dev *pdev, unsigned long quirks)
+{
+	int cap = PCI_EXT_CAP_ID_DVSEC;
+	bool have_devices = false;
+	int pos = 0;
+
+	while ((pos = pci_find_next_ext_capability(pdev, pos, cap))) {
+		if (!intel_vsec_extract_vsec(pdev, pos, quirks, cap))
+			continue;
+
+		have_devices = true;
+	};
+
+	return have_devices;
+}
+
+static bool intel_vsec_walk_vsec(struct pci_dev *pdev, unsigned long quirks)
+{
+	int cap = PCI_EXT_CAP_ID_VNDR;
+	bool have_devices = false;
+	int pos = 0;
+
+	while ((pos = pci_find_next_ext_capability(pdev, pos, cap))) {
+		if (!intel_vsec_extract_vsec(pdev, pos, quirks, cap))
+			continue;
+
+		have_devices = true;
+	};
+
+	return have_devices;
+}
+
+static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct intel_vsec_platform_info *info;
+	bool have_devices = false;
+	unsigned long quirks = 0;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	info = (struct intel_vsec_platform_info *)id->driver_data;
+	if (info)
+		quirks = info->quirks;
+
+	if (intel_vsec_walk_dvsec(pdev, quirks))
+		have_devices = true;
+
+	if (intel_vsec_walk_vsec(pdev, quirks))
+		have_devices = true;
+
+	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
+	    intel_vsec_walk_header(pdev, quirks, info->capabilities))
+		have_devices = true;
+
+	if (!have_devices)
+		return -ENODEV;
+
+	return 0;
+}
+
+/* TGL info */
+static const struct intel_vsec_platform_info tgl_info = {
+	.quirks = VSEC_QUIRK_NO_WATCHER | VSEC_QUIRK_NO_CRASHLOG | VSEC_QUIRK_TABLE_SHIFT,
+};
+
+/* DG1 info */
+static struct intel_vsec_header dg1_telemetry = {
+	.length = 0x10,
+	.id = 2,
+	.num_entries = 1,
+	.entry_size = 3,
+	.tbir = 0,
+	.offset = 0x466000,
+};
+
+static struct intel_vsec_header *dg1_capabilities[] = {
+	&dg1_telemetry,
+	NULL
+};
+
+static const struct intel_vsec_platform_info dg1_info = {
+	.capabilities = dg1_capabilities,
+	.quirks = VSEC_QUIRK_NO_DVSEC,
+};
+
+#define PCI_DEVICE_ID_INTEL_VSEC_ADL		0x467d
+#define PCI_DEVICE_ID_INTEL_VSEC_DG1		0x490e
+#define PCI_DEVICE_ID_INTEL_VSEC_OOBMSM		0x09a7
+#define PCI_DEVICE_ID_INTEL_VSEC_TGL		0x9a0d
+static const struct pci_device_id intel_vsec_pci_ids[] = {
+	{ PCI_DEVICE_DATA(INTEL, VSEC_ADL, &tgl_info) },
+	{ PCI_DEVICE_DATA(INTEL, VSEC_DG1, &dg1_info) },
+	{ PCI_DEVICE_DATA(INTEL, VSEC_OOBMSM, NULL) },
+	{ PCI_DEVICE_DATA(INTEL, VSEC_TGL, &tgl_info) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, intel_vsec_pci_ids);
+
+static struct pci_driver intel_vsec_pci_driver = {
+	.name = "intel_vsec",
+	.id_table = intel_vsec_pci_ids,
+	.probe = intel_vsec_pci_probe,
+	/*
+	 * Driver cleanup handled by intel_vsec_remove_aux() which is added
+	 * to the PCI device as a devm action.
+	 */
+};
+module_pci_driver(intel_vsec_pci_driver);
+
+MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Extended Capabilities auxiliary bus driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/vsec.h b/drivers/platform/x86/intel/vsec.h
new file mode 100644
index 000000000000..4cc36678e8c5
--- /dev/null
+++ b/drivers/platform/x86/intel/vsec.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _VSEC_H
+#define _VSEC_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
+
+struct pci_dev;
+struct resource;
+
+enum intel_vsec_quirks {
+	/* Watcher feature not supported */
+	VSEC_QUIRK_NO_WATCHER	= BIT(0),
+
+	/* Crashlog feature not supported */
+	VSEC_QUIRK_NO_CRASHLOG	= BIT(1),
+
+	/* Use shift instead of mask to read discovery table offset */
+	VSEC_QUIRK_TABLE_SHIFT	= BIT(2),
+
+	/* DVSEC not present (provided in driver data) */
+	VSEC_QUIRK_NO_DVSEC	= BIT(3),
+};
+
+struct intel_vsec_device {
+	struct auxiliary_device auxdev;
+	struct pci_dev *pcidev;
+	struct resource *resource;
+	struct ida *ida;
+	unsigned long quirks;
+	int num_resources;
+};
+
+static inline struct intel_vsec_device *dev_to_ivdev(struct device *dev)
+{
+	return container_of(dev, struct intel_vsec_device, auxdev.dev);
+}
+
+static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device *auxdev)
+{
+	return container_of(auxdev, struct intel_vsec_device, auxdev);
+}
+#endif
-- 
2.25.1


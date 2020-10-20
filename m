Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA93282023
	for <lists+platform-driver-x86@lfdr.de>; Sat,  3 Oct 2020 03:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgJCBbj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 2 Oct 2020 21:31:39 -0400
Received: from mga05.intel.com ([192.55.52.43]:2330 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbgJCBbb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Oct 2020 21:31:31 -0400
IronPort-SDR: dpo9yH3KTcojoR6GrMRVJO6OpAaY6CLAIA3+3GHr1RmHFd/My7xJ7bqAq0TLK0DiH0hVqJu5oc
 loI8AQ1dO1BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="247866964"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="247866964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 18:31:27 -0700
IronPort-SDR: W5J2E5vlJ3tWbo9bVzEmI6aTe34G5ZrjUjnIUnNny2OdPYCpYTrATJ9jc6BIYC8LOKQwcVdN7p
 IXL6OTxuDyRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="352530718"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga007.jf.intel.com with ESMTP; 02 Oct 2020 18:31:27 -0700
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id 1760358082E;
        Fri,  2 Oct 2020 18:31:27 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     lee.jones@linaro.org, david.e.box@linux.intel.com,
        dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com,
        hdegoede@redhat.com, alexey.budankov@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH V8 2/5] mfd: Intel Platform Monitoring Technology support
Date:   Fri,  2 Oct 2020 18:31:20 -0700
Message-Id: <20201003013123.20269-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201003013123.20269-1-david.e.box@linux.intel.com>
References: <20201003013123.20269-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Intel Platform Monitoring Technology (PMT) is an architecture for
enumerating and accessing hardware monitoring facilities. PMT supports
multiple types of monitoring capabilities. This driver creates platform
devices for each type so that they may be managed by capability specific
drivers (to be introduced). Capabilities are discovered using PCIe DVSEC
ids. Support is included for the 3 current capability types, Telemetry,
Watcher, and Crashlog. The features are available on new Intel platforms
starting from Tiger Lake for which support is added. This patch adds
support for Tiger Lake (TGL), Alder Lake (ADL), and Out-of-Band Management
Services Module (OOBMSM).

Also add a quirk mechanism for several early hardware differences and bugs.
For Tiger Lake and Alder Lake, do not support Watcher and Crashlog
capabilities since they will not be compatible with future product. Also,
fix use a quirk to fix the discovery table offset.

Co-developed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 MAINTAINERS             |   5 +
 drivers/mfd/Kconfig     |  10 ++
 drivers/mfd/Makefile    |   1 +
 drivers/mfd/intel_pmt.c | 226 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 242 insertions(+)
 create mode 100644 drivers/mfd/intel_pmt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 190c7fa2ea01..0f2663b1d376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8946,6 +8946,11 @@ F:	drivers/mfd/intel_soc_pmic*
 F:	include/linux/mfd/intel_msic.h
 F:	include/linux/mfd/intel_soc_pmic*
 
+INTEL PMT DRIVER
+M:	"David E. Box" <david.e.box@linux.intel.com>
+S:	Maintained
+F:	drivers/mfd/intel_pmt.c
+
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
 M:	Stanislav Yakovlev <stas.yakovlev@gmail.com>
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df0837ab41..f092db50e518 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -670,6 +670,16 @@ config MFD_INTEL_PMC_BXT
 	  Register and P-unit access. In addition this creates devices
 	  for iTCO watchdog and telemetry that are part of the PMC.
 
+config MFD_INTEL_PMT
+	tristate "Intel Platform Monitoring Technology (PMT) support"
+	depends on PCI
+	select MFD_CORE
+	help
+	  The Intel Platform Monitoring Technology (PMT) is an interface that
+	  provides access to hardware monitor registers. This driver supports
+	  Telemetry, Watcher, and Crashlog PMT capabilities/devices for
+	  platforms starting from Tiger Lake.
+
 config MFD_IPAQ_MICRO
 	bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
 	depends on SA1100_H3100 || SA1100_H3600
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a60e5f835283..b9565d98ab09 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -215,6 +215,7 @@ obj-$(CONFIG_MFD_INTEL_LPSS_PCI)	+= intel-lpss-pci.o
 obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)	+= intel-lpss-acpi.o
 obj-$(CONFIG_MFD_INTEL_MSIC)	+= intel_msic.o
 obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
+obj-$(CONFIG_MFD_INTEL_PMT)	+= intel_pmt.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
new file mode 100644
index 000000000000..1b57a970a9d7
--- /dev/null
+++ b/drivers/mfd/intel_pmt.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Platform Monitoring Technology PMT driver
+ *
+ * Copyright (c) 2020, Intel Corporation.
+ * All Rights Reserved.
+ *
+ * Author: David E. Box <david.e.box@linux.intel.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+
+/* Intel DVSEC capability vendor space offsets */
+#define INTEL_DVSEC_ENTRIES		0xA
+#define INTEL_DVSEC_SIZE		0xB
+#define INTEL_DVSEC_TABLE		0xC
+#define INTEL_DVSEC_TABLE_BAR(x)	((x) & GENMASK(2, 0))
+#define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
+#define INTEL_DVSEC_ENTRY_SIZE		4
+
+/* PMT capabilities */
+#define DVSEC_INTEL_ID_TELEMETRY	2
+#define DVSEC_INTEL_ID_WATCHER		3
+#define DVSEC_INTEL_ID_CRASHLOG		4
+
+struct intel_dvsec_header {
+	u16	length;
+	u16	id;
+	u8	num_entries;
+	u8	entry_size;
+	u8	tbir;
+	u32	offset;
+};
+
+enum pmt_quirks {
+	/* Watcher capability not supported */
+	PMT_QUIRK_NO_WATCHER	= BIT(0),
+
+	/* Crashlog capability not supported */
+	PMT_QUIRK_NO_CRASHLOG	= BIT(1),
+
+	/* Use shift instead of mask to read discovery table offset */
+	PMT_QUIRK_TABLE_SHIFT	= BIT(2),
+};
+
+struct pmt_platform_info {
+	unsigned long quirks;
+};
+
+static const struct pmt_platform_info pmt_info;
+
+static const struct pmt_platform_info tgl_info = {
+	.quirks = PMT_QUIRK_NO_WATCHER | PMT_QUIRK_NO_CRASHLOG |
+		  PMT_QUIRK_TABLE_SHIFT,
+};
+
+static int pmt_add_dev(struct pci_dev *pdev, struct intel_dvsec_header *header,
+		       struct pmt_platform_info *info)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res, *tmp;
+	struct mfd_cell *cell;
+	const char *name;
+	int count = header->num_entries;
+	int size = header->entry_size;
+	int id = header->id;
+	int i;
+
+	switch (id) {
+	case DVSEC_INTEL_ID_TELEMETRY:
+		name = "pmt_telemetry";
+		break;
+	case DVSEC_INTEL_ID_WATCHER:
+		if (info->quirks & PMT_QUIRK_NO_WATCHER) {
+			dev_info(dev, "Watcher not supported\n");
+			return 0;
+		}
+		name = "pmt_watcher";
+		break;
+	case DVSEC_INTEL_ID_CRASHLOG:
+		if (info->quirks & PMT_QUIRK_NO_CRASHLOG) {
+			dev_info(dev, "Crashlog not supported\n");
+			return 0;
+		}
+		name = "pmt_crashlog";
+		break;
+	default:
+		dev_err(dev, "Unrecognized PMT capability: %d\n", id);
+		return -EINVAL;
+	}
+
+	if (!header->num_entries || !header->entry_size) {
+		dev_err(dev, "Invalid count or size for %s header\n", name);
+		return -EINVAL;
+	}
+
+	cell = devm_kzalloc(dev, sizeof(*cell), GFP_KERNEL);
+	if (!cell)
+		return -ENOMEM;
+
+	res = devm_kcalloc(dev, count, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return -ENOMEM;
+
+	if (info->quirks & PMT_QUIRK_TABLE_SHIFT)
+		header->offset >>= 3;
+
+	/*
+	 * The PMT DVSEC contains the starting offset and count for a block of
+	 * discovery tables, each providing access to monitoring facilities for
+	 * a section of the device. Create a resource list of these tables to
+	 * provide to the driver.
+	 */
+	for (i = 0, tmp = res; i < count; i++, tmp++) {
+		tmp->start = pdev->resource[header->tbir].start +
+			     header->offset + i * (size << 2);
+		tmp->end = tmp->start + (size << 2) - 1;
+		tmp->flags = IORESOURCE_MEM;
+	}
+
+	cell->resources = res;
+	cell->num_resources = count;
+	cell->name = name;
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cell, 1, NULL, 0,
+				    NULL);
+}
+
+static int pmt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct pmt_platform_info *info;
+	bool found_devices = false;
+	int ret, pos = 0;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	info = devm_kmemdup(&pdev->dev, (void *)id->driver_data, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	do {
+		struct intel_dvsec_header header;
+		u32 table;
+		u16 vid;
+
+		pos = pci_find_next_ext_capability(pdev, pos, PCI_EXT_CAP_ID_DVSEC);
+		if (!pos)
+			break;
+
+		pci_read_config_word(pdev, pos + PCI_DVSEC_HEADER1, &vid);
+		if (vid != PCI_VENDOR_ID_INTEL)
+			continue;
+
+		pci_read_config_word(pdev, pos + PCI_DVSEC_HEADER2,
+				     &header.id);
+		pci_read_config_byte(pdev, pos + INTEL_DVSEC_ENTRIES,
+				     &header.num_entries);
+		pci_read_config_byte(pdev, pos + INTEL_DVSEC_SIZE,
+				     &header.entry_size);
+		pci_read_config_dword(pdev, pos + INTEL_DVSEC_TABLE,
+				      &table);
+
+		header.tbir = INTEL_DVSEC_TABLE_BAR(table);
+		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
+
+		ret = pmt_add_dev(pdev, &header, info);
+		if (ret) {
+			dev_warn(&pdev->dev,
+				 "Failed to add device for DVSEC id %d\n",
+				 header.id);
+			continue;
+		}
+
+		found_devices = true;
+	} while (true);
+
+	if (!found_devices) {
+		dev_err(&pdev->dev, "No supported PMT capabilities found.\n");
+		return -ENODEV;
+	}
+
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
+	return 0;
+}
+
+static void pmt_pci_remove(struct pci_dev *pdev)
+{
+	pm_runtime_forbid(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+}
+
+#define PCI_DEVICE_ID_INTEL_PMT_ADL	0x467d
+#define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
+#define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
+static const struct pci_device_id pmt_pci_ids[] = {
+	{ PCI_DEVICE_DATA(INTEL, PMT_ADL, &tgl_info) },
+	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
+	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, pmt_pci_ids);
+
+static struct pci_driver pmt_pci_driver = {
+	.name = "intel-pmt",
+	.id_table = pmt_pci_ids,
+	.probe = pmt_pci_probe,
+	.remove = pmt_pci_remove,
+};
+module_pci_driver(pmt_pci_driver);
+
+MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Platform Monitoring Technology PMT driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C39A21E804
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Jul 2020 08:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgGNGWi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 Jul 2020 02:22:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:57644 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbgGNGWa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Jul 2020 02:22:30 -0400
IronPort-SDR: wDVQKJy+f9SrTyeV8fLQ+WGvP5JIlmB3w2AVpEBOErX9IqsjeTs4bAPYWvJpklZaBvAN4vo6DP
 ss4IGeREYsfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="150254112"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="150254112"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2020 23:22:28 -0700
IronPort-SDR: GT/D5VPz86vzLH87F4+pDapcCT4quX6dhhG4k3Sy+xvOvUflIGpZSG1YArpiEO7tLas9sPXcfy
 W2lZxrMgoiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="485257363"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2020 23:22:28 -0700
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id C99EF580814;
        Mon, 13 Jul 2020 23:22:27 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     lee.jones@linaro.org, david.e.box@linux.intel.com,
        dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com,
        alexander.h.duyck@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH V3 3/3] platform/x86: Intel PMT Telemetry capability driver
Date:   Mon, 13 Jul 2020 23:23:23 -0700
Message-Id: <20200714062323.19990-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508021844.6911-1-david.e.box@linux.intel.com>
References: <20200508021844.6911-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMT Telemetry is a capability of the Intel Platform Monitoring Technology.
The Telemetry capability provides access to device telemetry metrics that
provide hardware performance data to users from continuous, memory mapped,
read-only register spaces.

Register mappings are not provided by the driver. Instead, a GUID is read
from a header for each endpoint. The GUID identifies the device and is to
be used with an XML, provided by the vendor, to discover the available set
of metrics and their register mapping.  This allows firmware updates to
modify the register space without needing to update the driver every time
with new mappings. Firmware writes a new GUID in this case to specify the
new mapping.  Software tools with access to the associated XML file can
then interpret the changes.

This module manages access to all PMT Telemetry endpoints on a system,
independent of the device exporting them. It creates a pmt_telemetry class
to manage the devices. For each telemetry endpoint, sysfs files provide
GUID and size information as well as a pointer to the parent device the
telemetry came from. Software may discover the association between
endpoints and devices by iterating through the list in sysfs, or by looking
for the existence of the class folder under the device of interest.  A
device node of the same name allows software to then map the telemetry
space for direct access.

This patch also creates an pci device id list for early telemetry hardware
that requires workarounds for known issues.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 .../ABI/testing/sysfs-class-pmt_telemetry     |  46 ++
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/Kconfig                  |  10 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel_pmt_telemetry.c    | 454 ++++++++++++++++++
 5 files changed, 512 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_telemetry
 create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c

diff --git a/Documentation/ABI/testing/sysfs-class-pmt_telemetry b/Documentation/ABI/testing/sysfs-class-pmt_telemetry
new file mode 100644
index 000000000000..381924549ecb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-pmt_telemetry
@@ -0,0 +1,46 @@
+What:		/sys/class/pmt_telemetry/
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	David Box <david.e.box@linux.intel.com>
+Description:
+		The pmt_telemetry/ class directory contains information for
+		devices that expose hardware telemetry using Intel Platform
+		Monitoring Technology (PMT)
+
+What:		/sys/class/pmt_telemetry/telem<x>
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	David Box <david.e.box@linux.intel.com>
+Description:
+		The telem<x> directory contains files describing an instance of
+		a PMT telemetry device that exposes hardware telemetry. Each
+		telem<x> directory has an associated /dev/telem<x> node. This
+		node may be opened and mapped to access the telemetry space of
+		the device. The register layout of the telemetry space is
+		determined from an XML file that matches the pci device id and
+		guid for the device.
+
+What:		/sys/class/pmt_telemetry/telem<x>/guid
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	David Box <david.e.box@linux.intel.com>
+Description:
+		(RO) The guid for this telemetry device. The guid identifies
+		the version of the XML file for the parent device that is to
+		be used to get the register layout.
+
+What:		/sys/class/pmt_telemetry/telem<x>/size
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	David Box <david.e.box@linux.intel.com>
+Description:
+		(RO) The size of telemetry region in bytes that corresponds to
+		the mapping size for the /dev/telem<x> device node.
+
+What:		/sys/class/pmt_telemetry/telem<x>/offset
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	David Box <david.e.box@linux.intel.com>
+Description:
+		(RO) The offset of telemetry region in bytes that corresponds to
+		the mapping for the /dev/telem<x> device node.
diff --git a/MAINTAINERS b/MAINTAINERS
index 2e42bf0c41ab..ebc145894abd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8849,6 +8849,7 @@ INTEL PMT DRIVER
 M:	"David E. Box" <david.e.box@linux.intel.com>
 S:	Maintained
 F:	drivers/mfd/intel_pmt.c
+F:	drivers/platform/x86/intel_pmt_*
 
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
 M:	Stanislav Yakovlev <stas.yakovlev@gmail.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0581a54cf562..5e1f7ce6e69f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1396,6 +1396,16 @@ config INTEL_TELEMETRY
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
 
+config INTEL_PMT_TELEMETRY
+	tristate "Intel Platform Monitoring Technology (PMT) Telemetry driver"
+	help
+	 The Intel Platform Monitory Technology (PMT) Telemetry driver provides
+	 access to hardware telemetry metrics on devices that support the
+	 feature.
+
+	 For more information, see
+	 <file:Documentation/ABI/testing/sysfs-class-intel_pmt_telem>
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 2b85852a1a87..95cd3d0be17f 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_INTEL_MFLD_THERMAL)	+= intel_mid_thermal.o
 obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
 obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
 obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o
+obj-$(CONFIG_INTEL_PMT_TELEMETRY)	+= intel_pmt_telemetry.o
 obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
 obj-$(CONFIG_INTEL_SCU_IPC)		+= intel_scu_ipc.o
 obj-$(CONFIG_INTEL_SCU_PCI)		+= intel_scu_pcidrv.o
diff --git a/drivers/platform/x86/intel_pmt_telemetry.c b/drivers/platform/x86/intel_pmt_telemetry.c
new file mode 100644
index 000000000000..e1856fc8c209
--- /dev/null
+++ b/drivers/platform/x86/intel_pmt_telemetry.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Platform Monitory Technology Telemetry driver
+ *
+ * Copyright (c) 2020, Intel Corporation.
+ * All Rights Reserved.
+ *
+ * Author: "David E. Box" <david.e.box@linux.intel.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/cdev.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/xarray.h>
+
+#define TELEM_DEV_NAME		"pmt_telemetry"
+
+/* Telemetry access types */
+#define TELEM_ACCESS_FUTURE	1
+#define TELEM_ACCESS_BARID	2
+#define TELEM_ACCESS_LOCAL	3
+
+#define TELEM_GUID_OFFSET	0x4
+#define TELEM_BASE_OFFSET	0x8
+#define TELEM_TBIR_MASK		GENMASK(2, 0)
+#define TELEM_ACCESS(v)		((v) & GENMASK(3, 0))
+#define TELEM_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
+/* size is in bytes */
+#define TELEM_SIZE(v)		(((v) & GENMASK(27, 12)) >> 10)
+
+#define TELEM_XA_START		0
+#define TELEM_XA_MAX		INT_MAX
+#define TELEM_XA_LIMIT		XA_LIMIT(TELEM_XA_START, TELEM_XA_MAX)
+
+/* Used by client hardware to identify a fixed telemetry entry*/
+#define TELEM_CLIENT_FIXED_BLOCK_GUID	0x10000000
+
+static DEFINE_XARRAY_ALLOC(telem_array);
+
+struct pmt_telem_priv;
+
+struct telem_header {
+	u8	access_type;
+	u8	telem_type;
+	u16	size;
+	u32	guid;
+	u32	base_offset;
+	u8	tbir;
+};
+
+struct pmt_telem_entry {
+	struct pmt_telem_priv		*priv;
+	struct telem_header		header;
+	struct resource			*header_res;
+	unsigned long			base_addr;
+	void __iomem			*disc_table;
+	struct cdev			cdev;
+	dev_t				devt;
+	int				devid;
+};
+
+struct pmt_telem_priv {
+	struct pmt_telem_entry		*entry;
+	int				num_entries;
+	struct device			*dev;
+};
+
+/*
+ * devfs
+ */
+static int pmt_telem_open(struct inode *inode, struct file *filp)
+{
+	struct pmt_telem_priv *priv;
+	struct pmt_telem_entry *entry;
+	struct pci_driver *pci_drv;
+	struct pci_dev *pci_dev;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	entry = container_of(inode->i_cdev, struct pmt_telem_entry, cdev);
+	priv = entry->priv;
+	pci_dev = to_pci_dev(priv->dev->parent);
+
+	pci_drv = pci_dev_driver(pci_dev);
+	if (!pci_drv)
+		return -ENODEV;
+
+	filp->private_data = entry;
+	get_device(&pci_dev->dev);
+
+	if (!try_module_get(pci_drv->driver.owner)) {
+		put_device(&pci_dev->dev);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int pmt_telem_release(struct inode *inode, struct file *filp)
+{
+	struct pmt_telem_entry *entry = filp->private_data;
+	struct pci_dev *pci_dev = to_pci_dev(entry->priv->dev->parent);
+	struct pci_driver *pci_drv = pci_dev_driver(pci_dev);
+
+	put_device(&pci_dev->dev);
+	module_put(pci_drv->driver.owner);
+
+	return 0;
+}
+
+static int pmt_telem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct pmt_telem_entry *entry = filp->private_data;
+	struct pmt_telem_priv *priv;
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+	unsigned long phys = entry->base_addr;
+	unsigned long pfn = PFN_DOWN(phys);
+	unsigned long psize;
+
+	priv = entry->priv;
+	psize = (PFN_UP(entry->base_addr + entry->header.size) - pfn) *
+		PAGE_SIZE;
+	if (vsize > psize) {
+		dev_err(priv->dev, "Requested mmap size is too large\n");
+		return -EINVAL;
+	}
+
+	if ((vma->vm_flags & VM_WRITE) || (vma->vm_flags & VM_MAYWRITE))
+		return -EPERM;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+
+	if (io_remap_pfn_range(vma, vma->vm_start, pfn, vsize,
+			       vma->vm_page_prot))
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct file_operations pmt_telem_fops = {
+	.owner =	THIS_MODULE,
+	.open =		pmt_telem_open,
+	.mmap =		pmt_telem_mmap,
+	.release =	pmt_telem_release,
+};
+
+/*
+ * sysfs
+ */
+static ssize_t guid_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct pmt_telem_entry *entry = dev_get_drvdata(dev);
+
+	return sprintf(buf, "0x%x\n", entry->header.guid);
+}
+static DEVICE_ATTR_RO(guid);
+
+static ssize_t size_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct pmt_telem_entry *entry = dev_get_drvdata(dev);
+
+	/* Display buffer size in bytes */
+	return sprintf(buf, "%u\n", entry->header.size);
+}
+static DEVICE_ATTR_RO(size);
+
+static ssize_t offset_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct pmt_telem_entry *entry = dev_get_drvdata(dev);
+
+	/* Display buffer offset in bytes */
+	return sprintf(buf, "%lu\n", offset_in_page(entry->base_addr));
+}
+static DEVICE_ATTR_RO(offset);
+
+static struct attribute *pmt_telem_attrs[] = {
+	&dev_attr_guid.attr,
+	&dev_attr_size.attr,
+	&dev_attr_offset.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(pmt_telem);
+
+struct class pmt_telem_class = {
+	.owner	= THIS_MODULE,
+	.name	= "pmt_telemetry",
+	.dev_groups = pmt_telem_groups,
+};
+
+/*
+ * driver initialization
+ */
+static const struct pci_device_id pmt_telem_early_client_pci_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x9a0d) }, /* TGL */
+	{ }
+};
+
+static bool pmt_telem_is_early_client_hw(struct device *dev)
+{
+	struct pci_dev *parent;
+
+	parent = to_pci_dev(dev->parent);
+
+	return !!pci_match_id(pmt_telem_early_client_pci_ids, parent);
+}
+
+static int pmt_telem_create_dev(struct pmt_telem_priv *priv,
+				struct pmt_telem_entry *entry)
+{
+	struct pci_dev *pci_dev;
+	struct device *dev;
+	int ret;
+
+	cdev_init(&entry->cdev, &pmt_telem_fops);
+	ret = cdev_add(&entry->cdev, entry->devt, 1);
+	if (ret) {
+		dev_err(priv->dev, "Could not add char dev\n");
+		return ret;
+	}
+
+	pci_dev = to_pci_dev(priv->dev->parent);
+	dev = device_create(&pmt_telem_class, &pci_dev->dev, entry->devt,
+			    entry, "telem%d", entry->devid);
+	if (IS_ERR(dev)) {
+		dev_err(priv->dev, "Could not create device node\n");
+		cdev_del(&entry->cdev);
+	}
+
+	return PTR_ERR_OR_ZERO(dev);
+}
+
+static void pmt_telem_populate_header(void __iomem *disc_offset,
+				      struct telem_header *header)
+{
+	header->access_type = TELEM_ACCESS(readb(disc_offset));
+	header->telem_type = TELEM_TYPE(readb(disc_offset));
+	header->size = TELEM_SIZE(readl(disc_offset));
+	header->guid = readl(disc_offset + TELEM_GUID_OFFSET);
+	header->base_offset = readl(disc_offset + TELEM_BASE_OFFSET);
+
+	/*
+	 * For non-local access types the lower 3 bits of base offset
+	 * contains the index of the base address register where the
+	 * telemetry can be found.
+	 */
+	header->tbir = header->base_offset & TELEM_TBIR_MASK;
+	header->base_offset ^= header->tbir;
+}
+
+static int pmt_telem_add_entry(struct pmt_telem_priv *priv,
+			       struct pmt_telem_entry *entry)
+{
+	struct resource *res = entry->header_res;
+	struct pci_dev *pci_dev = to_pci_dev(priv->dev->parent);
+	int ret;
+
+	pmt_telem_populate_header(entry->disc_table, &entry->header);
+
+	/* Local access and BARID only for now */
+	switch (entry->header.access_type) {
+	case TELEM_ACCESS_LOCAL:
+		if (entry->header.tbir) {
+			dev_err(priv->dev,
+				"Unsupported BAR index %d for access type %d\n",
+				entry->header.tbir, entry->header.access_type);
+			return -EINVAL;
+		}
+
+		/*
+		 * For access_type LOCAL, the base address is as follows:
+		 * base address = header address + header length + base offset
+		 */
+		entry->base_addr = res->start + resource_size(res) +
+				   entry->header.base_offset;
+		break;
+
+	case TELEM_ACCESS_BARID:
+		entry->base_addr = pci_dev->resource[entry->header.tbir].start +
+				   entry->header.base_offset;
+		break;
+
+	default:
+		dev_err(priv->dev, "Unsupported access type %d\n",
+			entry->header.access_type);
+		return -EINVAL;
+	}
+
+	ret = alloc_chrdev_region(&entry->devt, 0, 1, TELEM_DEV_NAME);
+	if (ret) {
+		dev_err(priv->dev,
+			"PMT telemetry chrdev_region error: %d\n", ret);
+		return ret;
+	}
+
+	ret = xa_alloc(&telem_array, &entry->devid, entry, TELEM_XA_LIMIT,
+		       GFP_KERNEL);
+	if (ret)
+		goto fail_xa_alloc;
+
+	ret = pmt_telem_create_dev(priv, entry);
+	if (ret)
+		goto fail_create_dev;
+
+	entry->priv = priv;
+	priv->num_entries++;
+	return 0;
+
+fail_create_dev:
+	xa_erase(&telem_array, entry->devid);
+fail_xa_alloc:
+	unregister_chrdev_region(entry->devt, 1);
+
+	return ret;
+}
+
+static bool pmt_telem_region_overlaps(struct platform_device *pdev,
+				      void __iomem *disc_table)
+{
+	u32 guid;
+
+	guid = readl(disc_table + TELEM_GUID_OFFSET);
+
+	return guid == TELEM_CLIENT_FIXED_BLOCK_GUID;
+}
+
+static void pmt_telem_remove_entries(struct pmt_telem_priv *priv)
+{
+	int i;
+
+	for (i = 0; i < priv->num_entries; i++) {
+		device_destroy(&pmt_telem_class, priv->entry[i].devt);
+		cdev_del(&priv->entry[i].cdev);
+		xa_erase(&telem_array, priv->entry[i].devid);
+		unregister_chrdev_region(priv->entry[i].devt, 1);
+	}
+}
+
+static int pmt_telem_probe(struct platform_device *pdev)
+{
+	struct pmt_telem_priv *priv;
+	struct pmt_telem_entry *entry;
+	bool early_hw;
+	int i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->dev = &pdev->dev;
+
+	priv->entry = devm_kcalloc(&pdev->dev, pdev->num_resources,
+				   sizeof(struct pmt_telem_entry), GFP_KERNEL);
+	if (!priv->entry)
+		return -ENOMEM;
+
+	if (pmt_telem_is_early_client_hw(&pdev->dev))
+		early_hw = true;
+
+	for (i = 0, entry = priv->entry; i < pdev->num_resources;
+	     i++, entry++) {
+		int ret;
+
+		entry->header_res = platform_get_resource(pdev, IORESOURCE_MEM,
+							  i);
+		if (!entry->header_res) {
+			pmt_telem_remove_entries(priv);
+			return -ENODEV;
+		}
+
+		entry->disc_table = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(entry->disc_table)) {
+			pmt_telem_remove_entries(priv);
+			return PTR_ERR(entry->disc_table);
+		}
+
+		if (pmt_telem_region_overlaps(pdev, entry->disc_table) &&
+		    early_hw)
+			continue;
+
+		ret = pmt_telem_add_entry(priv, entry);
+		if (ret) {
+			pmt_telem_remove_entries(priv);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int pmt_telem_remove(struct platform_device *pdev)
+{
+	struct pmt_telem_priv *priv = platform_get_drvdata(pdev);
+
+	pmt_telem_remove_entries(priv);
+
+	return 0;
+}
+
+static const struct platform_device_id pmt_telem_table[] = {
+	{
+		.name = "pmt_telemetry",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(platform, pmt_telem_table);
+
+static struct platform_driver pmt_telem_driver = {
+	.driver = {
+		.name   = TELEM_DEV_NAME,
+	},
+	.probe  = pmt_telem_probe,
+	.remove = pmt_telem_remove,
+	.id_table = pmt_telem_table,
+};
+
+static int __init pmt_telem_init(void)
+{
+	int ret = class_register(&pmt_telem_class);
+
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&pmt_telem_driver);
+	if (ret)
+		class_unregister(&pmt_telem_class);
+
+	return ret;
+}
+module_init(pmt_telem_init);
+
+static void __exit pmt_telem_exit(void)
+{
+	platform_driver_unregister(&pmt_telem_driver);
+	class_unregister(&pmt_telem_class);
+	xa_destroy(&telem_array);
+}
+module_exit(pmt_telem_exit);
+
+MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
+MODULE_DESCRIPTION("Intel PMT Telemetry driver");
+MODULE_ALIAS("platform:" TELEM_DEV_NAME);
+MODULE_LICENSE("GPL v2");
-- 
2.20.1


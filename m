Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A2CB6F78
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Sep 2019 00:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbfIRWxn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 Sep 2019 18:53:43 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40640 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbfIRWxm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Sep 2019 18:53:42 -0400
Received: by mail-lj1-f195.google.com with SMTP id 7so1564320ljw.7;
        Wed, 18 Sep 2019 15:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fj9E3xdk20mfBmQkKIyxlFTT6iliG1h7LRlmtKZPSgI=;
        b=szrFfRRrz+EHPSvTfJS1RZFGLLmdKb5jj56ugq1JOAMZVuE7UnFvtimFzZarS+AHod
         RZhTU+lT0nSi2/UjoIjt0L/dkvagEftCcjPZH8YmBDBZ7SR6B2bfwxM6neOiH+Ce4H71
         r5aGsKFWpLcNVhr+CLqK1sH0Yy84aSihX4R1bS0lmbTDtH1vPGF2caAC2gZ9y+W8U6AG
         nzzfZAKvhfaToIC4hCsqHNCeQcEKEY/rFSYT3XpLKBXIDrtJvBZQ7xDY5NdqOHc3AM3j
         rWseKDGf720jkNdo06DWXa2sxB+Qt971wahIEbTQWey0zVJFt7R+onhhx8mI73nyhHVp
         SN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fj9E3xdk20mfBmQkKIyxlFTT6iliG1h7LRlmtKZPSgI=;
        b=uexVcCe73GK/+Ml7jDL1uFL4ucgmYxYM7PmnsQLPd+IgYknPOPSmGUB0RJ1QUppWZ8
         ASvMKep9yUnmW4ss1fWaUrJJYvWLUu2+UMDi30s19I4TN6VoBM06cu6OACzWS2lKlRZu
         stlV7Be64Dh0XdMaP+b2Rk/mgvniLnGchSTouE7S5JU6UY7AN9SgGs8ABwTxMk1FLMmv
         JCmn8i24tHzJMW1MzqbzfIPTgzVF6039TLaUQHFox2x8HQflKiAXhE6QWEWjXuqHn3iQ
         KR5R2OYisfZDkfir43XEd0t8DXvH/cyNq2937zYccmPf7EdMf7iwCZzoY1xEGrQsMxKX
         uXZQ==
X-Gm-Message-State: APjAAAXyV67r32pDmxSAalWLb1FMB4Bk5SVpcc985zBfj+UvkNMmo6o7
        mcHJO8X3lbxgEggWwkpMW3c=
X-Google-Smtp-Source: APXvYqzFFhvmH5E8p/MEYr1JTOcogljq7eQfKqzCSP45U023cwj9zDIR3kLRH1sYKTelx+OH4IImxQ==
X-Received: by 2002:a2e:b0f4:: with SMTP id h20mr3617721ljl.10.1568847219209;
        Wed, 18 Sep 2019 15:53:39 -0700 (PDT)
Received: from localhost.localdomain ([46.216.138.44])
        by smtp.gmail.com with ESMTPSA id z1sm726985ljh.88.2019.09.18.15.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 15:53:38 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1iAipP-0002Zo-B8; Thu, 19 Sep 2019 01:53:39 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v4 1/1] platform/x86/intel_cht_int33fe: Split code to USB Micro-B and Type-C variants
Date:   Thu, 19 Sep 2019 01:53:37 +0300
Message-Id: <20190918225337.9860-2-jekhor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190918225337.9860-1-jekhor@gmail.com>
References: <20190918225337.9860-1-jekhor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
hardware has Type-C connector and register related devices described as
I2C connections in the _CRS resource.

There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with Micro-B
USB connector exists. It has INT33FE device in the DSDT table but
there are only two I2C connection described: PMIC and BQ27452 battery
fuel gauge.

Splitting existing INT33FE driver allow to maintain code for USB Micro-B
(AB) connector variant separately and make it simpler.

Split driver to intel_cht_int33fe_common.c and
intel_cht_int33fe_{typeb,typec}.c. Compile all this sources to one .ko
module to make user experience easier.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/platform/x86/Kconfig                  |  12 +-
 drivers/platform/x86/Makefile                 |   4 +
 .../platform/x86/intel_cht_int33fe_common.c   | 147 ++++++++++++++++++
 .../platform/x86/intel_cht_int33fe_common.h   |  41 +++++
 .../platform/x86/intel_cht_int33fe_microb.c   |  67 ++++++++
 ...ht_int33fe.c => intel_cht_int33fe_typec.c} |  78 +---------
 6 files changed, 276 insertions(+), 73 deletions(-)
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.c
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.h
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_microb.c
 rename drivers/platform/x86/{intel_cht_int33fe.c => intel_cht_int33fe_typec.c} (82%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1b67bb578f9f..2537885c933f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -926,18 +926,24 @@ config INTEL_CHT_INT33FE
 	depends on CHARGER_BQ24190=y || (CHARGER_BQ24190=m && m)
 	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
 	depends on TYPEC_MUX_PI3USB30532=y || (TYPEC_MUX_PI3USB30532=m && m)
-	---help---
+	help
 	  This driver add support for the INT33FE ACPI device found on
 	  some Intel Cherry Trail devices.
 
+	  There are two kinds of INT33FE ACPI device possible: for hardware
+	  with USB Type-C and Micro-B connectors. This driver supports both.
+
 	  The INT33FE ACPI device has a CRS table with I2cSerialBusV2
-	  resources for 3 devices: Maxim MAX17047 Fuel Gauge Controller,
+	  resources for Fuel Gauge Controller and (in the Type-C variant)
 	  FUSB302 USB Type-C Controller and PI3USB30532 USB switch.
 	  This driver instantiates i2c-clients for these, so that standard
 	  i2c drivers for these chips can bind to the them.
 
 	  If you enable this driver it is advised to also select
-	  CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m.
+	  CONFIG_BATTERY_BQ27XXX=m and CONFIG_BATTERY_BQ27XXX_I2C=m for Micro-B
+	  device and CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m
+	  for Type-C device.
+
 
 config INTEL_INT0002_VGPIO
 	tristate "Intel ACPI INT0002 Virtual GPIO driver"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 415104033060..216d3b6fd6a7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -61,6 +61,10 @@ obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
 obj-$(CONFIG_TOSHIBA_HAPS)	+= toshiba_haps.o
 obj-$(CONFIG_TOSHIBA_WMI)	+= toshiba-wmi.o
 obj-$(CONFIG_INTEL_CHT_INT33FE)	+= intel_cht_int33fe.o
+intel_cht_int33fe-objs		:= intel_cht_int33fe_common.o \
+				   intel_cht_int33fe_typec.o \
+				   intel_cht_int33fe_microb.o
+
 obj-$(CONFIG_INTEL_INT0002_VGPIO) += intel_int0002_vgpio.o
 obj-$(CONFIG_INTEL_HID_EVENT)	+= intel-hid.o
 obj-$(CONFIG_INTEL_VBTN)	+= intel-vbtn.o
diff --git a/drivers/platform/x86/intel_cht_int33fe_common.c b/drivers/platform/x86/intel_cht_int33fe_common.c
new file mode 100644
index 000000000000..42dd11623f56
--- /dev/null
+++ b/drivers/platform/x86/intel_cht_int33fe_common.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common code for Intel Cherry Trail ACPI INT33FE pseudo device drivers
+ * (USB Micro-B and Type-C connector variants).
+ *
+ * Copyright (c) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "intel_cht_int33fe_common.h"
+
+#define EXPECTED_PTYPE		4
+
+static int cht_int33fe_i2c_res_filter(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_i2c_serialbus *sb;
+	int *count = data;
+
+	if (i2c_acpi_get_i2c_resource(ares, &sb))
+		(*count)++;
+
+	return 1;
+}
+
+static int cht_int33fe_count_i2c_clients(struct device *dev)
+{
+	struct acpi_device *adev;
+	LIST_HEAD(resource_list);
+	int count = 0;
+
+	adev = ACPI_COMPANION(dev);
+	if (!adev)
+		return -EINVAL;
+
+	acpi_dev_get_resources(adev, &resource_list,
+			       cht_int33fe_i2c_res_filter, &count);
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	return count;
+}
+
+static int cht_int33fe_check_hw_type(struct device *dev)
+{
+	unsigned long long ptyp;
+	acpi_status status;
+	int ret;
+
+	status = acpi_evaluate_integer(ACPI_HANDLE(dev), "PTYP", NULL, &ptyp);
+	if (ACPI_FAILURE(status)) {
+		dev_err(dev, "Error getting PTYPE\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * The same ACPI HID is used for different configurations check PTYP
+	 * to ensure that we are dealing with the expected config.
+	 */
+	if (ptyp != EXPECTED_PTYPE)
+		return -ENODEV;
+
+	/* Check presence of INT34D3 (hardware-rev 3) expected for ptype == 4 */
+	if (!acpi_dev_present("INT34D3", "1", 3)) {
+		dev_err(dev, "Error PTYPE == %d, but no INT34D3 device\n",
+			EXPECTED_PTYPE);
+		return -ENODEV;
+	}
+
+	ret = cht_int33fe_count_i2c_clients(dev);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case 2:
+		return INT33FE_HW_MICROB;
+	case 4:
+		return INT33FE_HW_TYPEC;
+	default:
+		return -ENODEV;
+	}
+}
+
+static int cht_int33fe_probe(struct platform_device *pdev)
+{
+	struct cht_int33fe_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = cht_int33fe_check_hw_type(dev);
+	if (ret < 0)
+		return ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+
+	switch (ret) {
+	case INT33FE_HW_MICROB:
+		data->probe = cht_int33fe_microb_probe;
+		data->remove = cht_int33fe_microb_remove;
+		break;
+
+	case INT33FE_HW_TYPEC:
+		data->probe = cht_int33fe_typec_probe;
+		data->remove = cht_int33fe_typec_remove;
+		break;
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	return data->probe(data);
+}
+
+static int cht_int33fe_remove(struct platform_device *pdev)
+{
+	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
+
+	return data->remove(data);
+}
+
+static const struct acpi_device_id cht_int33fe_acpi_ids[] = {
+	{ "INT33FE", },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cht_int33fe_acpi_ids);
+
+static struct platform_driver cht_int33fe_driver = {
+	.driver	= {
+		.name = "Intel Cherry Trail ACPI INT33FE driver",
+		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
+	},
+	.probe = cht_int33fe_probe,
+	.remove = cht_int33fe_remove,
+};
+
+module_platform_driver(cht_int33fe_driver);
+
+MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver");
+MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel_cht_int33fe_common.h b/drivers/platform/x86/intel_cht_int33fe_common.h
new file mode 100644
index 000000000000..03cd45f4e8cb
--- /dev/null
+++ b/drivers/platform/x86/intel_cht_int33fe_common.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Common code for Intel Cherry Trail ACPI INT33FE pseudo device drivers
+ * (USB Micro-B and Type-C connector variants), header file
+ *
+ * Copyright (c) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
+ */
+
+#ifndef _INTEL_CHT_INT33FE_COMMON_H
+#define _INTEL_CHT_INT33FE_COMMON_H
+
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/i2c.h>
+
+enum int33fe_hw_type {
+	INT33FE_HW_MICROB,
+	INT33FE_HW_TYPEC,
+};
+
+struct cht_int33fe_data {
+	struct device *dev;
+
+	int (*probe)(struct cht_int33fe_data *data);
+	int (*remove)(struct cht_int33fe_data *data);
+
+	struct i2c_client *battery_fg;
+
+	/* Type-C only */
+	struct i2c_client *fusb302;
+	struct i2c_client *pi3usb30532;
+
+	struct fwnode_handle *dp;
+};
+
+int cht_int33fe_microb_probe(struct cht_int33fe_data *data);
+int cht_int33fe_microb_remove(struct cht_int33fe_data *data);
+int cht_int33fe_typec_probe(struct cht_int33fe_data *data);
+int cht_int33fe_typec_remove(struct cht_int33fe_data *data);
+
+#endif /* _INTEL_CHT_INT33FE_COMMON_H */
diff --git a/drivers/platform/x86/intel_cht_int33fe_microb.c b/drivers/platform/x86/intel_cht_int33fe_microb.c
new file mode 100644
index 000000000000..127ee0f59dfc
--- /dev/null
+++ b/drivers/platform/x86/intel_cht_int33fe_microb.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Cherry Trail ACPI INT33FE pseudo device driver for devices with
+ * USB Micro-B connector (e.g. without of FUSB302 USB Type-C controller)
+ *
+ * Copyright (C) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
+ *
+ * At least one Intel Cherry Trail based device which ship with Windows 10
+ * (Lenovo YogaBook YB1-X91L/F tablet), have this weird INT33FE ACPI device
+ * with a CRS table with 2 I2cSerialBusV2 resources, for 2 different chips
+ * attached to various i2c busses:
+ * 1. The Whiskey Cove pmic, which is also described by the INT34D3 ACPI device
+ * 2. TI BQ27542 Fuel Gauge Controller
+ *
+ * So this driver is a stub / pseudo driver whose only purpose is to
+ * instantiate i2c-client for battery fuel gauge, so that standard i2c driver
+ * for these chip can bind to the it.
+ */
+
+#include <linux/acpi.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/usb/pd.h>
+
+#include "intel_cht_int33fe_common.h"
+
+static const char * const bq27xxx_suppliers[] = { "bq25890-charger" };
+
+static const struct property_entry bq27xxx_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27xxx_suppliers),
+	{ }
+};
+
+int cht_int33fe_microb_probe(struct cht_int33fe_data *data)
+{
+	struct device *dev = data->dev;
+	struct i2c_board_info board_info;
+
+	memset(&board_info, 0, sizeof(board_info));
+	strscpy(board_info.type, "bq27542", ARRAY_SIZE(board_info.type));
+	board_info.dev_name = "bq27542";
+	board_info.properties = bq27xxx_props;
+	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
+
+	if (IS_ERR(data->battery_fg)) {
+		int err = PTR_ERR(data->battery_fg);
+
+		if (err != -EPROBE_DEFER)
+			dev_err(dev,
+				"Failed to register battery fuel gauge: %d\n",
+				err);
+		return err;
+	}
+
+	return 0;
+}
+
+int cht_int33fe_microb_remove(struct cht_int33fe_data *data)
+{
+	i2c_unregister_device(data->battery_fg);
+
+	return 0;
+}
diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
similarity index 82%
rename from drivers/platform/x86/intel_cht_int33fe.c
rename to drivers/platform/x86/intel_cht_int33fe_typec.c
index 1d5d877b9582..2d097fc2dd46 100644
--- a/drivers/platform/x86/intel_cht_int33fe.c
+++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
@@ -17,17 +17,15 @@
  * for these chips can bind to the them.
  */
 
-#include <linux/acpi.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
-#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/usb/pd.h>
 
-#define EXPECTED_PTYPE		4
+#include "intel_cht_int33fe_common.h"
 
 enum {
 	INT33FE_NODE_FUSB302,
@@ -38,14 +36,6 @@ enum {
 	INT33FE_NODE_MAX,
 };
 
-struct cht_int33fe_data {
-	struct i2c_client *max17047;
-	struct i2c_client *fusb302;
-	struct i2c_client *pi3usb30532;
-
-	struct fwnode_handle *dp;
-};
-
 static const struct software_node nodes[];
 
 static const struct software_node_ref_args pi3usb30532_ref = {
@@ -251,43 +241,20 @@ cht_int33fe_register_max17047(struct device *dev, struct cht_int33fe_data *data)
 	strlcpy(board_info.type, "max17047", I2C_NAME_SIZE);
 	board_info.dev_name = "max17047";
 	board_info.fwnode = fwnode;
-	data->max17047 = i2c_acpi_new_device(dev, 1, &board_info);
+	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
 
-	return PTR_ERR_OR_ZERO(data->max17047);
+	return PTR_ERR_OR_ZERO(data->battery_fg);
 }
 
-static int cht_int33fe_probe(struct platform_device *pdev)
+int cht_int33fe_typec_probe(struct cht_int33fe_data *data)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = data->dev;
 	struct i2c_board_info board_info;
-	struct cht_int33fe_data *data;
 	struct fwnode_handle *fwnode;
 	struct regulator *regulator;
-	unsigned long long ptyp;
-	acpi_status status;
 	int fusb302_irq;
 	int ret;
 
-	status = acpi_evaluate_integer(ACPI_HANDLE(dev), "PTYP", NULL, &ptyp);
-	if (ACPI_FAILURE(status)) {
-		dev_err(dev, "Error getting PTYPE\n");
-		return -ENODEV;
-	}
-
-	/*
-	 * The same ACPI HID is used for different configurations check PTYP
-	 * to ensure that we are dealing with the expected config.
-	 */
-	if (ptyp != EXPECTED_PTYPE)
-		return -ENODEV;
-
-	/* Check presence of INT34D3 (hardware-rev 3) expected for ptype == 4 */
-	if (!acpi_dev_present("INT34D3", "1", 3)) {
-		dev_err(dev, "Error PTYPE == %d, but no INT34D3 device\n",
-			EXPECTED_PTYPE);
-		return -ENODEV;
-	}
-
 	/*
 	 * We expect the WC PMIC to be paired with a TI bq24292i charger-IC.
 	 * We check for the bq24292i vbus regulator here, this has 2 purposes:
@@ -317,10 +284,6 @@ static int cht_int33fe_probe(struct platform_device *pdev)
 		return fusb302_irq;
 	}
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
 	ret = cht_int33fe_add_nodes(data);
 	if (ret)
 		return ret;
@@ -365,15 +328,13 @@ static int cht_int33fe_probe(struct platform_device *pdev)
 		goto out_unregister_fusb302;
 	}
 
-	platform_set_drvdata(pdev, data);
-
 	return 0;
 
 out_unregister_fusb302:
 	i2c_unregister_device(data->fusb302);
 
 out_unregister_max17047:
-	i2c_unregister_device(data->max17047);
+	i2c_unregister_device(data->battery_fg);
 
 out_remove_nodes:
 	cht_int33fe_remove_nodes(data);
@@ -381,36 +342,13 @@ static int cht_int33fe_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cht_int33fe_remove(struct platform_device *pdev)
+int cht_int33fe_typec_remove(struct cht_int33fe_data *data)
 {
-	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
-
 	i2c_unregister_device(data->pi3usb30532);
 	i2c_unregister_device(data->fusb302);
-	i2c_unregister_device(data->max17047);
+	i2c_unregister_device(data->battery_fg);
 
 	cht_int33fe_remove_nodes(data);
 
 	return 0;
 }
-
-static const struct acpi_device_id cht_int33fe_acpi_ids[] = {
-	{ "INT33FE", },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, cht_int33fe_acpi_ids);
-
-static struct platform_driver cht_int33fe_driver = {
-	.driver	= {
-		.name = "Intel Cherry Trail ACPI INT33FE driver",
-		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
-	},
-	.probe = cht_int33fe_probe,
-	.remove = cht_int33fe_remove,
-};
-
-module_platform_driver(cht_int33fe_driver);
-
-MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver");
-MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
-MODULE_LICENSE("GPL v2");
-- 
2.23.0.rc1


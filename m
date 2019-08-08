Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83B486CC0
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Aug 2019 23:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732601AbfHHVy5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Aug 2019 17:54:57 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46439 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbfHHVy5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Aug 2019 17:54:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so90448225ljg.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Aug 2019 14:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKaIK7Xxhoiv1s/YcG6aqVSbT6GkdO6yOqTlwiOXx+o=;
        b=A4Y3EMTuTWl5d017WK6w8mgheCplBR1RYYttVugbNCarw+fDhwXKMBaanbudW5ODFb
         wGkmayL10bAKatKbr3ACo30qIvjELYubpbBTdEg5nHlsXnWPoLNSwLnAolxva61NGI6z
         j84Z/Cf2fuLVT4gshX35CnZWy6f3n9UFti5k+U9+crVavmmUwT7SQ/s4hEaQjiCM9I/6
         1j1y/aa8Hi/zRIM3VBdYtdIFgSZV8wbkg1XGwRM9vn3UHtlzOohMCfQ2U/BWKcl2G9S/
         yyt/tbGCeBBabsqjWUeIusqLA4VpacVR1FeBdAXTbn6bK3SiwXKeQ0VWwAjMQHr/A6dd
         hbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKaIK7Xxhoiv1s/YcG6aqVSbT6GkdO6yOqTlwiOXx+o=;
        b=aQeCIaGrQ47j/BoF1/e8XhLgHEkm0rVQkOWYi+DypgfbElNjVWOEsPQF7gmDcFEoea
         WMlQr1CZU6k9Yfmp9Y2elwf0WtyPHH2225pBALD5yymSasxO8NVbuZKgaPUZYLoQkkHC
         yMyOkqMywk3ZIItpc7MAlLsjZ0H/F1UG5DUgzhVsSbzvFSrnyj4pIJTcPPSSkRfCUyjS
         p0mSj8k+Em6D2e8LnQdUROaY8fiRpeFfq5Q83e9le2XhLqqSipnSnU1QJjVydLCFVNMJ
         e8WXL8ZAVwNFMlBM7XjbxPw0QCc+YPcbW3pKEekVzJW+0cwHrTKeCGx/BKv3eHa8b3a6
         jSfg==
X-Gm-Message-State: APjAAAU0zjbvC0WALcK4PW+mSYZg1NWRT6h9A6BbTzdDdSz+KxfBNm7U
        /FYWDUIG756C6YQsprpvrUUt0N9c
X-Google-Smtp-Source: APXvYqxDoozX58ARSt36dQDLLrI/vtUVCiO9MkxFQwZevYO4NUMuHcqQvC4dRym7gnKxlKwyX4a9Lg==
X-Received: by 2002:a2e:8181:: with SMTP id e1mr1005477ljg.124.1565301294337;
        Thu, 08 Aug 2019 14:54:54 -0700 (PDT)
Received: from localhost.localdomain ([46.216.207.166])
        by smtp.gmail.com with ESMTPSA id i23sm19084419ljb.7.2019.08.08.14.54.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 14:54:53 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.92)
        (envelope-from <jekhor@gmail.com>)
        id 1hvqOF-0000YQ-Ai; Fri, 09 Aug 2019 00:56:07 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to microUSB and TypeC variants
Date:   Fri,  9 Aug 2019 00:55:59 +0300
Message-Id: <20190808215559.2029-2-jekhor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc0
In-Reply-To: <20190808215559.2029-1-jekhor@gmail.com>
References: <20190808215559.2029-1-jekhor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
hardware has TypeC connector and register related devices described as
I2C connections in the _CRS resource.

There at least one hardware (Lenovo Yoga Book YB1-91L/F) with microUSB
connector exists. It has INT33FE device in the DSDT table but there are
only two I2C connection described: PMIC and BQ27452 battery fuel gauge.

Splitting existing INT33FE driver allow to maintain code for microUSB
variant separately and make it simpler.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/platform/x86/Kconfig                  |  24 +++-
 drivers/platform/x86/Makefile                 |   5 +-
 .../platform/x86/intel_cht_int33fe_common.c   |  93 ++++++++++++++++
 .../platform/x86/intel_cht_int33fe_common.h   |  23 ++++
 drivers/platform/x86/intel_cht_int33fe_musb.c | 105 ++++++++++++++++++
 ...ht_int33fe.c => intel_cht_int33fe_typec.c} |  26 +----
 6 files changed, 249 insertions(+), 27 deletions(-)
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.c
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.h
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_musb.c
 rename drivers/platform/x86/{intel_cht_int33fe.c => intel_cht_int33fe_typec.c} (94%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1b67bb578f9f..a34c5615d6ef 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -920,15 +920,15 @@ config ACPI_CMPC
 	  keys as input device, backlight device, tablet and accelerometer
 	  devices.
 
-config INTEL_CHT_INT33FE
-	tristate "Intel Cherry Trail ACPI INT33FE Driver"
+config INTEL_CHT_INT33FE_TYPEC
+	tristate "Intel Cherry Trail ACPI INT33FE Driver (typeC connector)"
 	depends on X86 && ACPI && I2C && REGULATOR
 	depends on CHARGER_BQ24190=y || (CHARGER_BQ24190=m && m)
 	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
 	depends on TYPEC_MUX_PI3USB30532=y || (TYPEC_MUX_PI3USB30532=m && m)
-	---help---
+	help
 	  This driver add support for the INT33FE ACPI device found on
-	  some Intel Cherry Trail devices.
+	  some Intel Cherry Trail devices with USB TypeC connector.
 
 	  The INT33FE ACPI device has a CRS table with I2cSerialBusV2
 	  resources for 3 devices: Maxim MAX17047 Fuel Gauge Controller,
@@ -939,6 +939,22 @@ config INTEL_CHT_INT33FE
 	  If you enable this driver it is advised to also select
 	  CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m.
 
+config INTEL_CHT_INT33FE_MUSB
+	tristate "Intel Cherry Trail ACPI INT33FE Driver (mUSB connector)"
+	depends on X86 && ACPI && I2C
+	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
+	help
+	  This driver add support for the INT33FE ACPI device found on
+	  some Intel Cherry Trail devices with microUSB connector.
+
+	  The INT33FE ACPI device has a CRS table with I2cSerialBusV2
+	  resources for TI BQ27452 Fuel Gauge Controller.
+	  This driver instantiates i2c-client for it, so that standard
+	  i2c driver for these chip can bind to the it.
+
+	  If you enable this driver it is advised to also select
+	  CONFIG_BATTERY_BQ27XXX=m and CONFIG_BATTERY_BQ27XXX_I2C=m.
+
 config INTEL_INT0002_VGPIO
 	tristate "Intel ACPI INT0002 Virtual GPIO driver"
 	depends on GPIOLIB && ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 415104033060..d21532bba125 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -60,7 +60,10 @@ obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
 obj-$(CONFIG_TOSHIBA_HAPS)	+= toshiba_haps.o
 obj-$(CONFIG_TOSHIBA_WMI)	+= toshiba-wmi.o
-obj-$(CONFIG_INTEL_CHT_INT33FE)	+= intel_cht_int33fe.o
+obj-$(CONFIG_INTEL_CHT_INT33FE_TYPEC)	+= intel_cht_int33fe_typec.o \
+					   intel_cht_int33fe_common.o
+obj-$(CONFIG_INTEL_CHT_INT33FE_MUSB) += intel_cht_int33fe_musb.o \
+					intel_cht_int33fe_common.o
 obj-$(CONFIG_INTEL_INT0002_VGPIO) += intel_int0002_vgpio.o
 obj-$(CONFIG_INTEL_HID_EVENT)	+= intel-hid.o
 obj-$(CONFIG_INTEL_VBTN)	+= intel-vbtn.o
diff --git a/drivers/platform/x86/intel_cht_int33fe_common.c b/drivers/platform/x86/intel_cht_int33fe_common.c
new file mode 100644
index 000000000000..91c1b599dda8
--- /dev/null
+++ b/drivers/platform/x86/intel_cht_int33fe_common.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common code for Intel Cherry Trail ACPI INT33FE pseudo device drivers
+ * (microUSB and TypeC connector variants)
+ *
+ * Copyright (c) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
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
+int cht_int33fe_check_hw_compatible(struct device *dev,
+				    enum int33fe_hw_type hw_type)
+{
+	unsigned long long ptyp;
+	acpi_status status;
+	int i2c_expected;
+	int ret;
+
+	i2c_expected = (hw_type == INT33FE_HW_TYPEC) ? 4 : 2;
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
+	if (ret != i2c_expected) {
+		dev_info(dev, "I2C clients count (%d) is not %d, ignore (probably %s hardware)",
+			 ret, i2c_expected,
+			 (hw_type == INT33FE_HW_TYPEC) ? "microUSB" : "Type C");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cht_int33fe_check_hw_compatible);
+
+MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver (common part)");
+MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel_cht_int33fe_common.h b/drivers/platform/x86/intel_cht_int33fe_common.h
new file mode 100644
index 000000000000..6bdae4a23f9b
--- /dev/null
+++ b/drivers/platform/x86/intel_cht_int33fe_common.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Common code for Intel Cherry Trail ACPI INT33FE pseudo device drivers
+ * (microUSB and TypeC connector variants), header file
+ *
+ * Copyright (c) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
+ */
+
+#ifndef _INTEL_CHT_INT33FE_COMMON_H
+#define _INTEL_CHT_INT33FE_COMMON_H
+
+#include <linux/device.h>
+
+enum int33fe_hw_type {
+	INT33FE_HW_TYPEC,
+	INT33FE_HW_MUSB,
+};
+
+int cht_int33fe_check_hw_compatible(struct device *dev,
+				    enum int33fe_hw_type hw_type);
+
+#endif /* _INTEL_CHT_INT33FE_COMMON_H */
+
diff --git a/drivers/platform/x86/intel_cht_int33fe_musb.c b/drivers/platform/x86/intel_cht_int33fe_musb.c
new file mode 100644
index 000000000000..49a8d34ac666
--- /dev/null
+++ b/drivers/platform/x86/intel_cht_int33fe_musb.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Cherry Trail ACPI INT33FE pseudo device driver for devices with
+ * microUSB connector (e.g. without of FUSB302 USB Type-C controller)
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
+#define DEBUG
+
+#include <linux/acpi.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/usb/pd.h>
+
+#include "intel_cht_int33fe_common.h"
+
+struct cht_int33fe_data {
+	struct i2c_client *battery_fg;
+};
+
+static const char * const bq27xxx_suppliers[] = { "bq25890-charger" };
+
+static const struct property_entry bq27xxx_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27xxx_suppliers),
+	{ }
+};
+
+static int cht_int33fe_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2c_board_info board_info;
+	struct cht_int33fe_data *data;
+	int ret;
+
+	ret = cht_int33fe_check_hw_compatible(dev, INT33FE_HW_MUSB);
+	if (ret < 0)
+		return ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memset(&board_info, 0, sizeof(board_info));
+	stracpy(board_info.type, "bq27542");
+	board_info.dev_name = "bq27542";
+	board_info.properties = bq27xxx_props;
+	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
+
+	if (IS_ERR(data->battery_fg)) {
+		dev_err(dev, "Failed to register battery fuel gauge: %ld\n",
+			PTR_ERR(data->battery_fg));
+		return PTR_ERR(data->battery_fg);
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+}
+
+static int cht_int33fe_remove(struct platform_device *pdev)
+{
+	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
+
+	i2c_unregister_device(data->battery_fg);
+
+	return 0;
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
+		.name = "Intel Cherry Trail ACPI INT33FE mUSB driver",
+		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
+	},
+	.probe = cht_int33fe_probe,
+	.remove = cht_int33fe_remove,
+};
+
+module_platform_driver(cht_int33fe_driver);
+
+MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver (microUSB conn)");
+MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
similarity index 94%
rename from drivers/platform/x86/intel_cht_int33fe.c
rename to drivers/platform/x86/intel_cht_int33fe_typec.c
index 4fbdff48a4b5..6444d0673bef 100644
--- a/drivers/platform/x86/intel_cht_int33fe.c
+++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
@@ -27,7 +27,7 @@
 #include <linux/slab.h>
 #include <linux/usb/pd.h>
 
-#define EXPECTED_PTYPE		4
+#include "intel_cht_int33fe_common.h"
 
 enum {
 	INT33FE_NODE_FUSB302,
@@ -300,30 +300,12 @@ static int cht_int33fe_probe(struct platform_device *pdev)
 	struct cht_int33fe_data *data;
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
+	ret = cht_int33fe_check_hw_compatible(dev, INT33FE_HW_TYPEC);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * We expect the WC PMIC to be paired with a TI bq24292i charger-IC.
-- 
2.23.0.rc0


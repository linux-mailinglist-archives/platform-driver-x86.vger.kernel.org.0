Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF22449A24
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Nov 2021 17:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241373AbhKHQrt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Nov 2021 11:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241339AbhKHQro (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 11:47:44 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E27DC061714;
        Mon,  8 Nov 2021 08:45:00 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id n23so15633954pgh.8;
        Mon, 08 Nov 2021 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QM4S2T6r38Mrxaq1IRCFOa5aNkrynkpZkTv5ZlaZsQQ=;
        b=UYsgazXgh+UTFrDcKU2k0/B/l32NmT792IIQ/iPaEjqgBkNhLQFRytRNsws3HU6eOo
         QZDGw00zYv4Rax6YS4fdal5Gmbf6gz2r8NhbxtTZ+QLf7/hjzqBJtjEXThZGiAfpPfI2
         xumgGBI+mgyjRZLbNlJhCxkOQ2OSmiqAoOzOninw5yZnFIDjE+2fDVvzWb9cuTyY/XXU
         JfkNK8L1MtjBbYoU4WHgYuwMM9vZOsxnTaXrpBZ/Ox2Sb66bSBDxMnZ+JErQQmEErNyU
         ui2QtBq3s+FuqrtQGBx+zKqUSDDVnlbfgAhu6/VbOaONgi2Uv2lojm2CYqtZYg/9vm8P
         ZUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QM4S2T6r38Mrxaq1IRCFOa5aNkrynkpZkTv5ZlaZsQQ=;
        b=UNB5QmCQSTaDwqeacjBfChkh8JSeAM56bH6PFGhqjBQJgJpk8OdBZe9+YYu6+cRIut
         TgmR6gUnB5M79d44XYWV8IXOPzT4tMgq45wkB1BCZQK4P2oa/9Ddg37PWmRxtXOBsGMb
         5JsFMd6aoeHLGyQPLkUwp3B12SfNl0sxYjJ2e3vLHdyqg1cRLthB7QYzZF6JliDN6IJd
         PoTslfq50pU3bzEufmhREjzn5le27lMHHdYEL10aNbXF1/7eB7q731pGUxsI9EvGR9hA
         /5YyHpmNu5rBivRuqkoXQJE6DeSvwIe3rpQb+reJIMQILpr1prf4DR6MJWs9ejpT0xQb
         bm1Q==
X-Gm-Message-State: AOAM533l1OToJnA6pVXZQ+7KDzTiY/oZQbm8ZaIqIKVDHm9vlOBOdLzV
        8rsVlgOfJLn1xv8vnDdSFfg=
X-Google-Smtp-Source: ABdhPJzgTNXKLWlCuf4To/7aslejOrVwmxO3tJ2oNpG3nbtwbQGU9FosljoJCz+38ZZJlPFUxYwCrQ==
X-Received: by 2002:a05:6a00:248c:b0:49f:abac:a266 with SMTP id c12-20020a056a00248c00b0049fabaca266mr244908pfv.42.1636389899620;
        Mon, 08 Nov 2021 08:44:59 -0800 (PST)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:36:87e1:381d:5b89:8aef])
        by smtp.gmail.com with ESMTPSA id 145sm15980974pfx.87.2021.11.08.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:44:59 -0800 (PST)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultz@microsoft.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH v2 3/5] platform: surface: Add surface xbl
Date:   Mon,  8 Nov 2021 08:44:47 -0800
Message-Id: <20211108164449.3036210-4-jaschultz@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108164449.3036210-1-jaschultz@microsoft.com>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce support for the Extensible Boot Loader driver found on the
Surface Duo. Makes device information available to users via sysfs.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

---

Changes in v2:
 - Added types.h inclusion and removed unused inclusions
 - Minor updates to code and acronym style
 - Remove __packed attribute on driver struct
 - Use .dev_groups for sysfs
 - Added more in-depth description of driver in Kconfig
 - Changed target KernelVersion in sysfs documentation

---

 .../ABI/testing/sysfs-platform-surface-xbl    |  78 +++++++
 MAINTAINERS                                   |   2 +
 drivers/platform/surface/Kconfig              |  12 +
 drivers/platform/surface/Makefile             |   1 +
 drivers/platform/surface/surface-xbl.c        | 215 ++++++++++++++++++
 5 files changed, 308 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-surface-xbl
 create mode 100644 drivers/platform/surface/surface-xbl.c

diff --git a/Documentation/ABI/testing/sysfs-platform-surface-xbl b/Documentation/ABI/testing/sysfs-platform-surface-xbl
new file mode 100644
index 000000000000..2ae047b884d3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-surface-xbl
@@ -0,0 +1,78 @@
+What:		/sys/devices/platform/146bfa94.xbl/battery_present
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns whether the battery is present. Valid
+		values are:
+			0 - battery absent
+			1 - battery present
+
+What:		/sys/devices/platform/146bfa94.xbl/board_id
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns the board id.
+
+What:		/sys/devices/platform/146bfa94.xbl/hw_init_retries
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns retries attempted to initialize the
+		discrete hardware circuit.
+
+What:		/sys/devices/platform/146bfa94.xbl/is_act_mode
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns whether ACT mode is enabled. Valid values
+		are:
+			0 - ACT disabled
+			1 - ACT enabled
+
+		ACT mode is used to run checks and put the device to shipmode
+		at factory.
+
+What:		/sys/devices/platform/146bfa94.xbl/is_customer_mode
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns whether the device is in manufacturing
+		mode. Valid values are:
+			0 - Not in manufacturing mode
+			1 - In manufacturing mode
+
+What:		/sys/devices/platform/146bfa94.xbl/ocp_error_location
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns 0 or which power rail has the OCP error.
+		Valid values are:
+			Bit(s)		Meaning
+			15		More than one OCP error occurred
+			14-12		PMIC
+			11-7		SMPS
+			6-2		LDO
+			1-0		BOB
+
+What:		/sys/devices/platform/146bfa94.xbl/pmic_reset_reason
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns the reason for the reset. Valid values
+		are:
+			0 - no reason lol
+			9 - Battery driver triggered
+
+What:		/sys/devices/platform/146bfa94.xbl/touch_fw_version
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns the version of the firmware.
diff --git a/MAINTAINERS b/MAINTAINERS
index 8643546f8fab..d08b68d626f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12428,7 +12428,9 @@ M:	Jarrett Schultz <jaschultz@microsoft.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-platform-surface-xbl
 F:	Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
+F:	drivers/platform/surface/surface-xbl.c
 
 MICROSOFT SURFACE GPE LID SUPPORT DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index 0d3970e1d144..3a1ced269d96 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -190,6 +190,18 @@ config SURFACE_PRO3_BUTTON
 	help
 	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
 
+config SURFACE_XBL
+        tristate "Surface XBL Driver"
+        depends on ARM64 || COMPILE_TEST
+        depends on OF
+        help
+          If you say 'Y' to this option, support will be included for the
+          Surface Extensible Boot Loader (XBL) Driver. This driver exposes
+          information about the device through sysfs.
+
+          This driver can also be built as a module.  If so, the module
+          will be called surface-xbl.
+
 source "drivers/platform/surface/aggregator/Kconfig"
 
 endif # SURFACE_PLATFORMS
diff --git a/drivers/platform/surface/Makefile b/drivers/platform/surface/Makefile
index 32889482de55..0946266a8a73 100644
--- a/drivers/platform/surface/Makefile
+++ b/drivers/platform/surface/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_SURFACE_GPE)		+= surface_gpe.o
 obj-$(CONFIG_SURFACE_HOTPLUG)		+= surface_hotplug.o
 obj-$(CONFIG_SURFACE_PLATFORM_PROFILE)	+= surface_platform_profile.o
 obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
+obj-$(CONFIG_SURFACE_XBL)               += surface-xbl.o
diff --git a/drivers/platform/surface/surface-xbl.c b/drivers/platform/surface/surface-xbl.c
new file mode 100644
index 000000000000..9ecec4e55a4d
--- /dev/null
+++ b/drivers/platform/surface/surface-xbl.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Surface eXtensible Boot Loader (XBL)
+ *
+ * Copyright (C) 2021 Microsoft Corporation
+ * Author: Jarrett Schultz <jaschultz@microsoft.com>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#define SURFACE_XBL_MAX_VERSION_LEN	16
+#define SURFACE_XBL_BOARD_ID		0
+#define SURFACE_XBL_BATTERY_PRESENT	1
+#define SURFACE_XBL_HW_INIT_RETRIES	2
+#define SURFACE_XBL_IS_CUSTOMER_MODE	3
+#define SURFACE_XBL_IS_ACT_MODE		4
+#define SURFACE_XBL_PMIC_RESET_REASON	5
+#define SURFACE_XBL_TOUCH_FW_VERSION	6
+#define SURFACE_XBL_OCP_ERROR_LOCATION		\
+		(SURFACE_XBL_TOUCH_FW_VERSION +	\
+		SURFACE_XBL_MAX_VERSION_LEN)
+
+struct surface_xbl {
+	struct device	*dev;
+	void __iomem	*regs;
+
+	u8		board_id;
+	u8		battery_present;
+	u8		hw_init_retries;
+	u8		is_customer_mode;
+	u8		is_act_mode;
+	u8		pmic_reset_reason;
+	char		touch_fw_version[SURFACE_XBL_MAX_VERSION_LEN];
+	u16		ocp_error_location;
+};
+
+static ssize_t
+board_id_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->board_id);
+}
+static DEVICE_ATTR_RO(board_id);
+
+static ssize_t
+battery_present_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->battery_present);
+}
+static DEVICE_ATTR_RO(battery_present);
+
+static ssize_t
+hw_init_retries_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->hw_init_retries);
+}
+static DEVICE_ATTR_RO(hw_init_retries);
+
+static ssize_t
+is_customer_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->is_customer_mode);
+}
+static DEVICE_ATTR_RO(is_customer_mode);
+
+static ssize_t
+is_act_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->is_act_mode);
+}
+static DEVICE_ATTR_RO(is_act_mode);
+
+static ssize_t
+pmic_reset_reason_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->pmic_reset_reason);
+}
+static DEVICE_ATTR_RO(pmic_reset_reason);
+
+static ssize_t
+touch_fw_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "0x%s\n", sxbl->touch_fw_version);
+}
+static DEVICE_ATTR_RO(touch_fw_version);
+
+static ssize_t
+ocp_error_location_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->ocp_error_location);
+}
+static DEVICE_ATTR_RO(ocp_error_location);
+
+static struct attribute *xbl_attrs[] = {
+	&dev_attr_board_id.attr,
+	&dev_attr_battery_present.attr,
+	&dev_attr_hw_init_retries.attr,
+	&dev_attr_is_customer_mode.attr,
+	&dev_attr_is_act_mode.attr,
+	&dev_attr_pmic_reset_reason.attr,
+	&dev_attr_touch_fw_version.attr,
+	&dev_attr_ocp_error_location.attr,
+	NULL
+};
+
+static const struct attribute_group xbl_attr_group = {
+	.attrs = xbl_attrs,
+};
+
+const struct attribute_group *xbl_sysfs_groups[] = {
+	&xbl_attr_group,
+	NULL
+};
+
+static u8 surface_xbl_readb(void __iomem *base, u32 offset)
+{
+	return readb(base + offset);
+}
+
+static u16 surface_xbl_readw(void __iomem *base, u32 offset)
+{
+	return readw(base + offset);
+}
+
+static int surface_xbl_probe(struct platform_device *pdev)
+{
+	struct surface_xbl	*sxbl;
+	struct device		*dev;
+	void __iomem		*regs;
+	int			index;
+
+	dev = &pdev->dev;
+	sxbl = devm_kzalloc(dev, sizeof(*sxbl), GFP_KERNEL);
+	if (!sxbl)
+		return -ENOMEM;
+
+	sxbl->dev = dev;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	sxbl->regs = regs;
+
+	platform_set_drvdata(pdev, sxbl);
+
+	sxbl->board_id = surface_xbl_readb(sxbl->regs,
+					   SURFACE_XBL_BOARD_ID);
+	sxbl->battery_present = surface_xbl_readb(sxbl->regs,
+						  SURFACE_XBL_BATTERY_PRESENT);
+	sxbl->hw_init_retries = surface_xbl_readb(sxbl->regs,
+						  SURFACE_XBL_HW_INIT_RETRIES);
+	sxbl->is_customer_mode = surface_xbl_readb(sxbl->regs,
+						   SURFACE_XBL_IS_CUSTOMER_MODE);
+	sxbl->is_act_mode = surface_xbl_readb(sxbl->regs,
+					      SURFACE_XBL_IS_ACT_MODE);
+	sxbl->pmic_reset_reason = surface_xbl_readb(sxbl->regs,
+						    SURFACE_XBL_PMIC_RESET_REASON);
+
+	for (index = 0; index < SURFACE_XBL_MAX_VERSION_LEN; index++)
+		sxbl->touch_fw_version[index] = surface_xbl_readb(sxbl->regs,
+							SURFACE_XBL_TOUCH_FW_VERSION + index);
+
+	sxbl->ocp_error_location = surface_xbl_readw(sxbl->regs,
+						     SURFACE_XBL_OCP_ERROR_LOCATION);
+
+	return 0;
+}
+
+static int surface_xbl_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id surface_xbl_of_match[] = {
+	{
+		.compatible = "microsoft,sm8150-surface-duo-xbl"
+	},
+	{  }
+};
+MODULE_DEVICE_TABLE(of, surface_xbl_of_match);
+
+static struct platform_driver surface_xbl_driver = {
+	.driver	= {
+		.name		= "surface-xbl",
+		.of_match_table = surface_xbl_of_match,
+		.dev_groups	= xbl_sysfs_groups
+	},
+	.probe		= surface_xbl_probe,
+	.remove		= surface_xbl_remove
+};
+module_platform_driver(surface_xbl_driver);
+
+MODULE_AUTHOR("Jarrett Schultz <jaschultz@microsoft.com>");
+MODULE_DESCRIPTION("Surface Extensible Bootloader");
+MODULE_LICENSE("GPL");
-- 
2.25.1


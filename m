Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0942616D2
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Sep 2020 19:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgIHRUW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Sep 2020 13:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731777AbgIHRUA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Sep 2020 13:20:00 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8362C061573;
        Tue,  8 Sep 2020 10:19:59 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so23670788ejb.8;
        Tue, 08 Sep 2020 10:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/G8U6qRbpYdxoFwEoIuRY1gkZwK1gUugIR3g5iQ6d2M=;
        b=iyHE6Gq7oHcnkWzN6yPIAhIE5ulj0HkkFrm6ne5jzMsmLT1ET5uTQHZgkKM4Hz0W0S
         BFyMLSiL1rZTBB1TUjlfvMIp01R9QwfSlHzP9tbSsE68sOtmX6un4SUnOf/R4tWOgujr
         G+xjYVUENMuViHMI5X4VO/dN61wqI7DTCaj2Lcz76jEOHhWngiK42a9kj+qQAiLBIcHG
         UT07c+03pIbl65TGeduuQOwfXCYsEIz8HnuqF1Lq6DNw91B7tr0agV5JOAF8/yq6zbF1
         qdNqzqer0seVjbX4vq7+3cU3wh6OGJHCNXIfDQYWpVnD2O1pRsfZD98485S3BUTQkzbk
         20Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/G8U6qRbpYdxoFwEoIuRY1gkZwK1gUugIR3g5iQ6d2M=;
        b=Xo/iV9G0MlE+aOvuRzC07SjIEDnw1+/o30eJSPWBOlLlOpsSdF/dCwequc5sVpluBD
         C73AKsNXqIQe/3kD5uf3IpsIEMxEoraQJy75pm67Hz3Im5BPii1793TLZVogn6NfQxp9
         o/PIdUKyv5IsoxudmC0xEeZe48UIXz1bPwPBHj0Ewuc3kWtJA2ybaWws+mjJfgazq20/
         i88f26qdtMYFk8+FvWiIVgkmoVVLnF991vGx39Bjm++co4al1AXa+6So0rMbrlS2aWQ3
         EDa2b33gJCM1Kul1KTqjtBQCyp9t7IieU6kkby6Ex59LthZFGb/bD/a8DRemh/EpnQS2
         jdrg==
X-Gm-Message-State: AOAM531PtpSGH8r4DMSeyK6WA/vU23Ljc4Umf1g9VtBFpxH7/YEZEuHo
        p4ft4I8rVN3LeSh319m2FSk=
X-Google-Smtp-Source: ABdhPJyR1+YvlBMoQk+EucGm0hQhfGfXAXxe34Wt3bdPaiGIMjU13o5dvG+AD3HrqAh098QYi9nkWg==
X-Received: by 2002:a17:906:a251:: with SMTP id bi17mr26655796ejb.526.1599585598219;
        Tue, 08 Sep 2020 10:19:58 -0700 (PDT)
Received: from xws.fritz.box (p5487bef6.dip0.t-ipconnect.de. [84.135.190.246])
        by smtp.gmail.com with ESMTPSA id os15sm18751673ejb.61.2020.09.08.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 10:19:57 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH] platform/x86: Add Driver to set up lid GPEs on MS Surface device
Date:   Tue,  8 Sep 2020 19:19:34 +0200
Message-Id: <20200908171934.1661509-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Conventionally, wake-up events for a specific device, in our case the
lid device, are managed via the ACPI _PRW field. While this does not
seem strictly necessary based on ACPI spec, the kernel disables GPE
wakeups to avoid non-wakeup interrupts preventing suspend by default and
only enables GPEs associated via the _PRW field with a wake-up capable
device. This behavior has been introduced in commit f941d3e41da7 ("ACPI:
EC / PM: Disable non-wakeup GPEs for suspend-to-idle") and is described
in more detail in its commit message.

Unfortunately, on MS Surface devices, there is no _PRW field present on
the lid device, thus no GPE is associated with it, and therefore the GPE
responsible for sending the status-change notification to the lid gets
disabled during suspend, making it impossible to wake the device via the
lid.

This patch introduces a pseudo-device and respective driver which, based
on some DMI matching, marks the corresponding GPE of the lid device for
wake and enables it during suspend. The behavior of this driver models
the behavior of the ACPI/PM core for normal wakeup GPEs, properly
declared via the _PRW field.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---

This driver has been tested (and is currently in use) on various Surface
models via the linux-surface project [1].

[1]: https://github.com/linux-surface/linux-surface

---
 MAINTAINERS                        |   6 +
 drivers/platform/x86/Kconfig       |  10 +
 drivers/platform/x86/Makefile      |   1 +
 drivers/platform/x86/surface_gpe.c | 298 +++++++++++++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/platform/x86/surface_gpe.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b5cfab015bd61..a9f8400096e16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11549,6 +11549,12 @@ F:	drivers/scsi/smartpqi/smartpqi*.[ch]
 F:	include/linux/cciss*.h
 F:	include/uapi/linux/cciss*.h
 
+MICROSOFT SURFACE GPE LID SUPPORT DRIVER
+M:	Maximilian Luz <luzmaximilian@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/surface_gpe.c
+
 MICROSOFT SURFACE PRO 3 BUTTON DRIVER
 M:	Chen Yu <yu.c.chen@intel.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 40219bba68011..cd29ab65f8b15 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -894,6 +894,16 @@ config SURFACE_3_POWER_OPREGION
 	  This driver provides support for ACPI operation
 	  region of the Surface 3 battery platform driver.
 
+config SURFACE_GPE
+	tristate "Surface GPE/Lid Support Driver"
+	depends on ACPI
+	depends on DMI
+	help
+	  This driver marks the GPEs related to the ACPI lid device found on
+	  Microsoft Surface devices as wakeup sources and prepares them
+	  accordingly. It is required on those devices to allow wake-ups from
+	  suspend by opening the lid.
+
 config SURFACE_PRO3_BUTTON
 	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3/4 tablet"
 	depends on ACPI && INPUT
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5f823f7eff452..58c2a6f52e394 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
 obj-$(CONFIG_SURFACE3_WMI)		+= surface3-wmi.o
 obj-$(CONFIG_SURFACE_3_BUTTON)		+= surface3_button.o
 obj-$(CONFIG_SURFACE_3_POWER_OPREGION)	+= surface3_power.o
+obj-$(CONFIG_SURFACE_GPE)		+= surface_gpe.o
 obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
 
 # MSI
diff --git a/drivers/platform/x86/surface_gpe.c b/drivers/platform/x86/surface_gpe.c
new file mode 100644
index 0000000000000..b08fa66b948cb
--- /dev/null
+++ b/drivers/platform/x86/surface_gpe.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Surface GPE/Lid driver to enable wakeup from suspend via the lid by
+ * properly configuring the respective GPEs.
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+
+struct surface_lid_device {
+	u32 gpe_number;
+};
+
+static const struct surface_lid_device lid_device_l17 = {
+	.gpe_number = 0x17,
+};
+
+static const struct surface_lid_device lid_device_l4D = {
+	.gpe_number = 0x4D,
+};
+
+static const struct surface_lid_device lid_device_l4F = {
+	.gpe_number = 0x4F,
+};
+
+static const struct surface_lid_device lid_device_l57 = {
+	.gpe_number = 0x57,
+};
+
+// Note: When changing this don't forget to change the MODULE_ALIAS below.
+static const struct dmi_system_id dmi_lid_device_table[] = {
+	{
+		.ident = "Surface Pro 4",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 4"),
+		},
+		.driver_data = (void *)&lid_device_l17,
+	},
+	{
+		.ident = "Surface Pro 5",
+		.matches = {
+			/*
+			 * We match for SKU here due to generic product name
+			 * "Surface Pro".
+			 */
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Pro_1796"),
+		},
+		.driver_data = (void *)&lid_device_l4F,
+	},
+	{
+		.ident = "Surface Pro 5 (LTE)",
+		.matches = {
+			/*
+			 * We match for SKU here due to generic product name
+			 * "Surface Pro"
+			 */
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Pro_1807"),
+		},
+		.driver_data = (void *)&lid_device_l4F,
+	},
+	{
+		.ident = "Surface Pro 6",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 6"),
+		},
+		.driver_data = (void *)&lid_device_l4F,
+	},
+	{
+		.ident = "Surface Pro 7",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 7"),
+		},
+		.driver_data = (void *)&lid_device_l4D,
+	},
+	{
+		.ident = "Surface Book 1",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Book"),
+		},
+		.driver_data = (void *)&lid_device_l17,
+	},
+	{
+		.ident = "Surface Book 2",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Book 2"),
+		},
+		.driver_data = (void *)&lid_device_l17,
+	},
+	{
+		.ident = "Surface Book 3",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Book 3"),
+		},
+		.driver_data = (void *)&lid_device_l4D,
+	},
+	{
+		.ident = "Surface Laptop 1",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Laptop"),
+		},
+		.driver_data = (void *)&lid_device_l57,
+	},
+	{
+		.ident = "Surface Laptop 2",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Laptop 2"),
+		},
+		.driver_data = (void *)&lid_device_l57,
+	},
+	{
+		.ident = "Surface Laptop 3 (Intel 13\")",
+		.matches = {
+			/*
+			 * We match for SKU here due to different vairants: The
+			 * AMD (15") version does not rely on GPEs.
+			 */
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Laptop_3_1867:1868"),
+		},
+		.driver_data = (void *)&lid_device_l4D,
+	},
+	{ }
+};
+
+
+static int surface_lid_enable_wakeup(struct device *dev,
+				     const struct surface_lid_device *lid,
+				     bool enable)
+{
+	int action = enable ? ACPI_GPE_ENABLE : ACPI_GPE_DISABLE;
+	acpi_status status;
+
+	status = acpi_set_gpe_wake_mask(NULL, lid->gpe_number, action);
+	if (status) {
+		dev_err(dev, "failed to set GPE wake mask: %d\n", status);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+
+static int surface_gpe_suspend(struct device *dev)
+{
+	const struct surface_lid_device *lid;
+
+	lid = dev_get_platdata(dev);
+	return surface_lid_enable_wakeup(dev, lid, true);
+}
+
+static int surface_gpe_resume(struct device *dev)
+{
+	const struct surface_lid_device *lid;
+
+	lid = dev_get_platdata(dev);
+	return surface_lid_enable_wakeup(dev, lid, false);
+}
+
+static SIMPLE_DEV_PM_OPS(surface_gpe_pm, surface_gpe_suspend, surface_gpe_resume);
+
+
+static int surface_gpe_probe(struct platform_device *pdev)
+{
+	const struct surface_lid_device *lid;
+	int status;
+
+	lid = dev_get_platdata(&pdev->dev);
+	if (!lid)
+		return -ENODEV;
+
+	status = acpi_mark_gpe_for_wake(NULL, lid->gpe_number);
+	if (status) {
+		dev_err(&pdev->dev, "failed to mark GPE for wake: %d\n", status);
+		return -EINVAL;
+	}
+
+	status = acpi_enable_gpe(NULL, lid->gpe_number);
+	if (status) {
+		dev_err(&pdev->dev, "failed to enable GPE: %d\n", status);
+		return -EINVAL;
+	}
+
+	status = surface_lid_enable_wakeup(&pdev->dev, lid, false);
+	if (status) {
+		acpi_disable_gpe(NULL, lid->gpe_number);
+		return status;
+	}
+
+	return 0;
+}
+
+static int surface_gpe_remove(struct platform_device *pdev)
+{
+	struct surface_lid_device *lid = dev_get_platdata(&pdev->dev);
+
+	/* restore default behavior without this module */
+	surface_lid_enable_wakeup(&pdev->dev, lid, false);
+	acpi_disable_gpe(NULL, lid->gpe_number);
+
+	return 0;
+}
+
+static struct platform_driver surface_gpe_driver = {
+	.probe = surface_gpe_probe,
+	.remove = surface_gpe_remove,
+	.driver = {
+		.name = "surface_gpe",
+		.pm = &surface_gpe_pm,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+
+
+static struct platform_device *surface_gpe_device;
+
+static int __init surface_gpe_init(void)
+{
+	const struct dmi_system_id *match;
+	const struct surface_lid_device *lid;
+	struct platform_device *pdev;
+	int status;
+
+	match = dmi_first_match(dmi_lid_device_table);
+	if (!match) {
+		pr_info(KBUILD_MODNAME": no device detected, exiting\n");
+		return 0;
+	}
+
+	lid = match->driver_data;
+
+	status = platform_driver_register(&surface_gpe_driver);
+	if (status)
+		return status;
+
+	pdev = platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
+	if (!pdev) {
+		platform_driver_unregister(&surface_gpe_driver);
+		return -ENOMEM;
+	}
+
+	status = platform_device_add_data(pdev, lid, sizeof(*lid));
+	if (status) {
+		platform_device_put(pdev);
+		platform_driver_unregister(&surface_gpe_driver);
+		return status;
+	}
+
+	status = platform_device_add(pdev);
+	if (status) {
+		platform_device_put(pdev);
+		platform_driver_unregister(&surface_gpe_driver);
+		return status;
+	}
+
+	surface_gpe_device = pdev;
+	return 0;
+}
+
+static void __exit surface_gpe_exit(void)
+{
+	if (!surface_gpe_device)
+		return;
+
+	platform_device_unregister(surface_gpe_device);
+	platform_driver_unregister(&surface_gpe_driver);
+}
+
+module_init(surface_gpe_init);
+module_exit(surface_gpe_exit);
+
+MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
+MODULE_DESCRIPTION("Surface GPE/Lid Driver");
+MODULE_LICENSE("GPL");
+
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro4:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro6:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro7:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfaceBook:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfaceBook2:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfaceBook3:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfaceLaptop:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfaceLaptop2:*");
+MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfaceLaptop3:*");
-- 
2.28.0


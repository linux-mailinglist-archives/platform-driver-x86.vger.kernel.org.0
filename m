Return-Path: <platform-driver-x86+bounces-3384-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FDD8C5ACA
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 May 2024 20:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB4A3281902
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 May 2024 18:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F235A0F9;
	Tue, 14 May 2024 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VLyowHKA"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E841E487
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2024 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715709835; cv=none; b=Lirg37wYZKxa02a2znk9A3SEVTO4bWLC+ws3DFdcGdj+I5m/PIIklziqWAaJ7OmzIwEL9EXZ36YMszcBqgoKrpqGUguyBOd9k9guLrd0roDl/TIC4k8b02mIBxJUMCT96HRUm0NRe1ItpbZEY1ZTRHiie6GAfNpG75TD5QPBgrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715709835; c=relaxed/simple;
	bh=MiJHje1le3t6tOJuJ5ZPnHiXYKgl5d7CiYdH1FRHdWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TSCaXwmM4UVXXJ9oAg/ShHyzcc+j3Hl6lfCO4//H8KEpiU14AaVErVHL0XqzaaChdGzftZwOJkwePCCS/9pPj4qfkALc1iSzzI4zCeZXZqp2eFGqgz0JdYr14ZRpzI0LBB5Um63Cgc3fsPGmOrF0oewTsjeCIDacvg8zdZNIH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VLyowHKA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715709832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s9zqsUqe4RK+s23+dQkFVxUflCPodfOSRJFlVpGkZcI=;
	b=VLyowHKAZMFwtw/xH+9GN70rUexjh14u0V71J3yLI6T5rN6RRmgbxFDzPCx+HvqMhuUEKl
	2uy8TXBKa21uPmnlbyRFW53yaAZAuHJFzDaw7LUrEUIkQC9TPmUzAYBChgtzfNzcOk7yfa
	drts74n0iJKS810TcZ3EvlSJh9LfmhU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-Pz0vyU93Mz2bZDGzBVDcYQ-1; Tue,
 14 May 2024 14:03:49 -0400
X-MC-Unique: Pz0vyU93Mz2bZDGzBVDcYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 657DA3C025AC;
	Tue, 14 May 2024 18:03:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B82EA3C27;
	Tue, 14 May 2024 18:03:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross Switch driver
Date: Tue, 14 May 2024 20:03:43 +0200
Message-ID: <20240514180343.70795-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for USB3.1 Gen 1
and DisplayPort over Type-C alternate mode support.

The ANX7428 has a microcontroller which takes care of the PD negotiation
and automatically sets the builtin Crosspoint Switch to send the right
signal to the 4 highspeed pairs of the Type-C connector. It also takes
care of HPD and AUX channel routing for DP alternate mode.

IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
things look like there simple is a USB-3 Type-A connector and a
separate DisplayPort connector. Except that the BIOS does not
power on the ANX7428 at boot (meh).

Add a driver to power on the ANX7428. This driver is added under
drivers/platform/x86 rather than under drivers/usb/typec for 2 reasons:

1. This driver is specifically written to work with how the ANX7428 is
described in the ACPI tables of the MeeGoPad x86 (Cherry Trail) devices.

2. This driver only powers on the ANX7428 and does not do anything wrt
its Type-C functionality. It should be possible to tell the controller
which data- and/or power-role to negotiate and to swap the role(s) after
negotiation but the MeeGoPad top-set boxes always draw their power from
a separate power-connector and they only support USB host-mode. So this
functionality is unnecessary and due to lack of documentation this is
tricky to support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Switch to read_poll_timeout() for waiting for the microcontroller to boot
- Address a few other small review remarks from Andy
---
 drivers/platform/x86/Kconfig            |  11 ++
 drivers/platform/x86/Makefile           |   3 +
 drivers/platform/x86/meegopad_anx7428.c | 148 ++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/platform/x86/meegopad_anx7428.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e5601d8fba68..0ec952b5d03e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -666,6 +666,17 @@ config ACPI_QUICKSTART
 	  To compile this driver as a module, choose M here: the module will be
 	  called quickstart.
 
+config MEEGOPAD_ANX7428
+	tristate "MeeGoPad ANX7428 Type-C Switch"
+	depends on ACPI && GPIOLIB && I2C
+	help
+	  Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for
+	  USB3.1 Gen 1 and DisplayPort over Type-C alternate mode support.
+
+	  This driver takes care of powering on the ANX7428 on supported
+	  MeeGoPad top-set boxes. After this the ANX7428 takes care of Type-C
+	  connector orientation and PD alternate mode switching autonomously.
+
 config MSI_EC
 	tristate "MSI EC Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index cf3032e4e27f..e1b142947067 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -75,6 +75,9 @@ obj-y				+= intel/
 # Microsoft
 obj-$(CONFIG_ACPI_QUICKSTART)  += quickstart.o
 
+# MeeGoPad
+obj-$(CONFIG_MEEGOPAD_ANX7428)	+= meegopad_anx7428.o
+
 # MSI
 obj-$(CONFIG_MSI_EC)		+= msi-ec.o
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
diff --git a/drivers/platform/x86/meegopad_anx7428.c b/drivers/platform/x86/meegopad_anx7428.c
new file mode 100644
index 000000000000..8c025e39f3f1
--- /dev/null
+++ b/drivers/platform/x86/meegopad_anx7428.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver to power on the Analogix ANX7428 USB Type-C crosspoint switch
+ * on MeeGoPad top-set boxes.
+ *
+ * The MeeGoPad T8 and T9 are Cherry Trail top-set boxes which
+ * use an ANX7428 to provide a Type-C port with USB3.1 Gen 1 and
+ * DisplayPort over Type-C alternate mode support.
+ *
+ * The ANX7428 has a microcontroller which takes care of the PD
+ * negotiation and automatically sets the builtin Crosspoint Switch
+ * to send the right signal to the 4 highspeed pairs of the Type-C
+ * connector. It also takes care of HPD and AUX channel routing for
+ * DP alternate mode.
+ *
+ * IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
+ * things look like there simple is a USB-3 Type-A connector and a
+ * separate DisplayPort connector. Except that the BIOS does not
+ * power on the ANX7428 at boot. This driver takes care of powering
+ * on the ANX7428.
+ *
+ * It should be possible to tell the micro-controller which data- and/or
+ * power-role to negotiate and to swap the role(s) after negotiation
+ * but the MeeGoPad top-set boxes always draw their power from a separate
+ * power-connector and they only support USB host-mode. So this functionality
+ * is unnecessary and due to lack of documentation this is tricky to support.
+ *
+ * For a more complete ANX7428 driver see drivers/usb/misc/anx7418/ of
+ * the LineageOS kernel for the LG G5 (International) aka the LG H850:
+ * https://github.com/LineageOS/android_kernel_lge_msm8996/
+ *
+ * (C) Copyright 2024 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+
+/* Register addresses and fields */
+#define VENDOR_ID			0x00
+#define DEVICE_ID			0x02
+
+#define TX_STATUS			0x16
+#define STATUS_SUCCESS			BIT(0)
+#define STATUS_ERROR			BIT(1)
+#define OCM_STARTUP			BIT(7)
+
+static bool force;
+module_param(force, bool, 0444);
+MODULE_PARM_DESC(force, "Force the driver to probe on unknown boards");
+
+static const struct acpi_gpio_params enable_gpio = { 0, 0, false };
+static const struct acpi_gpio_params reset_gpio = { 1, 0, true };
+
+static const struct acpi_gpio_mapping meegopad_anx7428_gpios[] = {
+	{ "enable-gpios", &enable_gpio, 1 },
+	{ "reset-gpios", &reset_gpio, 1 },
+	{ }
+};
+
+static const struct dmi_system_id meegopad_anx7428_ids[] = {
+	{
+		/* Meegopad T08 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Default string"),
+			DMI_MATCH(DMI_BOARD_NAME, "T3 MRD"),
+			DMI_MATCH(DMI_BOARD_VERSION, "V1.1"),
+		},
+	},
+	{ }
+};
+
+static int anx7428_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct gpio_desc *gpio;
+	int ret, val;
+
+	if (!dmi_check_system(meegopad_anx7428_ids) && !force) {
+		dev_warn(dev, "Not probing unknown board, pass meegopad_anx7428.force=1 to probe");
+		return -ENODEV;
+	}
+
+	ret = devm_acpi_dev_add_driver_gpios(dev, meegopad_anx7428_gpios);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set GPIOs to desired values while getting them, they are not needed
+	 * afterwards. Ordering and delays come from android_kernel_lge_msm8996.
+	 */
+	gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting enable GPIO\n");
+
+	fsleep(10000);
+
+	gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting reset GPIO\n");
+
+	/* Wait for the OCM (On Chip Microcontroller) to start */
+	ret = read_poll_timeout(i2c_smbus_read_byte_data, val,
+				val >= 0 && (val & OCM_STARTUP),
+				5000, 50000, true, client, TX_STATUS);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "On Chip Microcontroller did not start, status: 0x%02x\n",
+				     val);
+
+	ret = i2c_smbus_read_word_data(client, VENDOR_ID);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "reading vendor-id register\n");
+	val = ret;
+
+	ret = i2c_smbus_read_word_data(client, DEVICE_ID);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "reading device-id register\n");
+
+	dev_dbg(dev, "Powered on ANX7428 id %04x:%04x\n", val, ret);
+	return 0;
+}
+
+static const struct acpi_device_id anx7428_acpi_match[] = {
+	{ "ANXO7418" }, /* ACPI says 7418 (max 2 DP lanes version) but HW is 7428 */
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, anx7428_acpi_match);
+
+static struct i2c_driver anx7428_driver = {
+	.driver = {
+		.name = "meegopad_anx7428",
+		.acpi_match_table = anx7428_acpi_match,
+	},
+	.probe = anx7428_probe,
+};
+
+module_i2c_driver(anx7428_driver);
+
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_DESCRIPTION("MeeGoPad ANX7428 driver");
+MODULE_LICENSE("GPL");
-- 
2.44.0



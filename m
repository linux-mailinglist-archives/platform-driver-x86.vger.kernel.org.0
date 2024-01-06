Return-Path: <platform-driver-x86+bounces-818-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF564826087
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 Jan 2024 17:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CB28281F2E
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 Jan 2024 16:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256C68475;
	Sat,  6 Jan 2024 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ETo+EZ+h"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453ED882A
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSuzkqSbfa7IxQh1wOQFjchBTam0XYG42pnx8byXh6M=;
	b=ETo+EZ+hm5181dSqbeQPh13OTymM2RKToku6mFyKwbUJRnOFCK7FTI7S1fO/gdvk4LYYxb
	A+g4dZ1qoa+LsFB1xC0ahom4H729ZhjSP+uTvX1aNZQEWpDMWW8CcHIaNmLhcil1+R4HmF
	vdiGRhoAIrkx1AJaNozvJAmaLAsXN+I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-0bHlWIgFNZedEo8sVr3bdA-1; Sat, 06 Jan 2024 11:09:48 -0500
X-MC-Unique: 0bHlWIgFNZedEo8sVr3bdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5866F101A555;
	Sat,  6 Jan 2024 16:09:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A00613C27;
	Sat,  6 Jan 2024 16:09:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Date: Sat,  6 Jan 2024 17:09:29 +0100
Message-ID: <20240106160935.45487-3-hdegoede@redhat.com>
In-Reply-To: <20240106160935.45487-1-hdegoede@redhat.com>
References: <20240106160935.45487-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

It is not necessary to handle the Dell specific instantiation of
i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
inside the generic i801 I2C adapter driver.

The kernel already instantiates platform_device-s for these ACPI devices
and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
platform drivers.

Move the i2c_client instantiation from the generic i2c-i801 driver to
the Dell specific dell-smo8800 driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
- Add a comment documenting the IDF PCI device ids
---
 drivers/i2c/busses/i2c-i801.c            | 126 +----------------------
 drivers/platform/x86/dell/dell-smo8800.c | 121 +++++++++++++++++++++-
 2 files changed, 123 insertions(+), 124 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 070999139c6d..595e263ba623 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -975,6 +975,10 @@ static const struct i2c_algorithm smbus_algorithm = {
 #define FEATURES_ICH4	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | \
 			 FEATURE_HOST_NOTIFY)
 
+/*
+ * NOTE: If new models with FEATURE_IDF are added please also update
+ * i801_idf_ids[] in drivers/platform/x86/dell-smo8800.c
+ */
 static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, 82801AA_3,			0)				 },
 	{ PCI_DEVICE_DATA(INTEL, 82801AB_3,			0)				 },
@@ -1141,125 +1145,6 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
 	}
 }
 
-/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800.c */
-static const char *const acpi_smo8800_ids[] = {
-	"SMO8800",
-	"SMO8801",
-	"SMO8810",
-	"SMO8811",
-	"SMO8820",
-	"SMO8821",
-	"SMO8830",
-	"SMO8831",
-};
-
-static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
-					     u32 nesting_level,
-					     void *context,
-					     void **return_value)
-{
-	struct acpi_device_info *info;
-	acpi_status status;
-	char *hid;
-	int i;
-
-	status = acpi_get_object_info(obj_handle, &info);
-	if (ACPI_FAILURE(status))
-		return AE_OK;
-
-	if (!(info->valid & ACPI_VALID_HID))
-		goto smo88xx_not_found;
-
-	hid = info->hardware_id.string;
-	if (!hid)
-		goto smo88xx_not_found;
-
-	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
-	if (i < 0)
-		goto smo88xx_not_found;
-
-	kfree(info);
-
-	*return_value = NULL;
-	return AE_CTRL_TERMINATE;
-
-smo88xx_not_found:
-	kfree(info);
-	return AE_OK;
-}
-
-static bool is_dell_system_with_lis3lv02d(void)
-{
-	void *err = ERR_PTR(-ENOENT);
-
-	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
-		return false;
-
-	/*
-	 * Check that ACPI device SMO88xx is present and is functioning.
-	 * Function acpi_get_devices() already filters all ACPI devices
-	 * which are not present or are not functioning.
-	 * ACPI device SMO88xx represents our ST microelectronics lis3lv02d
-	 * accelerometer but unfortunately ACPI does not provide any other
-	 * information (like I2C address).
-	 */
-	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
-
-	return !IS_ERR(err);
-}
-
-/*
- * Accelerometer's I2C address is not specified in DMI nor ACPI,
- * so it is needed to define mapping table based on DMI product names.
- */
-static const struct {
-	const char *dmi_product_name;
-	unsigned short i2c_addr;
-} dell_lis3lv02d_devices[] = {
-	/*
-	 * Dell platform team told us that these Latitude devices have
-	 * ST microelectronics accelerometer at I2C address 0x29.
-	 */
-	{ "Latitude E5250",     0x29 },
-	{ "Latitude E5450",     0x29 },
-	{ "Latitude E5550",     0x29 },
-	{ "Latitude E6440",     0x29 },
-	{ "Latitude E6440 ATG", 0x29 },
-	{ "Latitude E6540",     0x29 },
-	/*
-	 * Additional individual entries were added after verification.
-	 */
-	{ "Latitude 5480",      0x29 },
-	{ "Vostro V131",        0x1d },
-	{ "Vostro 5568",        0x29 },
-};
-
-static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
-{
-	struct i2c_board_info info;
-	const char *dmi_product_name;
-	int i;
-
-	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
-	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
-		if (strcmp(dmi_product_name,
-			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
-		dev_warn(&priv->pci_dev->dev,
-			 "Accelerometer lis3lv02d is present on SMBus but its"
-			 " address is unknown, skipping registration\n");
-		return;
-	}
-
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
-	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
-	i2c_new_client_device(&priv->adapter, &info);
-}
-
 /* Register optional slaves */
 static void i801_probe_optional_slaves(struct i801_priv *priv)
 {
@@ -1279,9 +1164,6 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
 	if (dmi_name_in_vendors("FUJITSU"))
 		dmi_walk(dmi_check_onboard_devices, &priv->adapter);
 
-	if (is_dell_system_with_lis3lv02d())
-		register_dell_lis3lv02d_i2c_device(priv);
-
 	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO)
 	if (!priv->mux_pdev)
diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 87339cc78880..c674e3392270 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -4,18 +4,23 @@
  *
  *  Copyright (C) 2012 Sonal Santan <sonal.santan@gmail.com>
  *  Copyright (C) 2014 Pali Rohár <pali@kernel.org>
+ *  Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
  *
  *  This is loosely based on lis3lv02d driver.
  */
 
 #define DRIVER_NAME "smo8800"
 
+#include <linux/device/bus.h>
+#include <linux/dmi.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/miscdevice.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
@@ -26,6 +31,7 @@ struct smo8800_device {
 	unsigned long misc_opened;   /* whether the device is open */
 	wait_queue_head_t misc_wait; /* Wait queue for the misc dev */
 	struct device *dev;          /* acpi device */
+	struct i2c_client *i2c_dev;  /* i2c_client for lis3lv02d */
 };
 
 static irqreturn_t smo8800_interrupt_quick(int irq, void *data)
@@ -103,6 +109,111 @@ static const struct file_operations smo8800_misc_fops = {
 	.release = smo8800_misc_release,
 };
 
+/*
+ * On 2 older PCH generations, Patsburg (for Sandy Bridge and Ivybridge) and
+ * Wellsburg (for Haswell and Broadwell), the PCH has 3 extra i2c-i801
+ * compatible SMBusses called 'Integrated Device Function' busses. These have
+ * FEATURE_IDF set in the i801_ids[] table in i2c-i801.c.
+ * The ST microelectronics accelerometer is connected to the main SMBus
+ * so the IDF controllers should be skipped.
+ */
+static const struct pci_device_id i801_idf_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x1d70) }, /* Patsburg IFD0 */
+	{ PCI_VDEVICE(INTEL, 0x1d71) }, /* Patsburg IFD1 */
+	{ PCI_VDEVICE(INTEL, 0x1d72) }, /* Patsburg IFD2 */
+	{ PCI_VDEVICE(INTEL, 0x8d7d) }, /* Wellsburg MS0 */
+	{ PCI_VDEVICE(INTEL, 0x8d7e) }, /* Wellsburg MS1 */
+	{ PCI_VDEVICE(INTEL, 0x8d7f) }, /* Wellsburg MS2 */
+	{}
+};
+
+static int smo8800_find_i801(struct device *dev, void *data)
+{
+	struct i2c_adapter *adap, **adap_ret = data;
+
+	adap = i2c_verify_adapter(dev);
+	if (!adap)
+		return 0;
+
+	if (!strstarts(adap->name, "SMBus I801 adapter"))
+		return 0;
+
+	if (pci_match_id(i801_idf_ids, to_pci_dev(adap->dev.parent)))
+		return 0; /* Only register client on main SMBus channel */
+
+	*adap_ret = i2c_get_adapter(adap->nr);
+	return 1;
+}
+
+/*
+ * Accelerometer's I2C address is not specified in DMI nor ACPI,
+ * so it is needed to define mapping table based on DMI product names.
+ */
+static const struct {
+	const char *dmi_product_name;
+	unsigned short i2c_addr;
+} dell_lis3lv02d_devices[] = {
+	/*
+	 * Dell platform team told us that these Latitude devices have
+	 * ST microelectronics accelerometer at I2C address 0x29.
+	 */
+	{ "Latitude E5250",     0x29 },
+	{ "Latitude E5450",     0x29 },
+	{ "Latitude E5550",     0x29 },
+	{ "Latitude E6440",     0x29 },
+	{ "Latitude E6440 ATG", 0x29 },
+	{ "Latitude E6540",     0x29 },
+	/*
+	 * Additional individual entries were added after verification.
+	 */
+	{ "Latitude 5480",      0x29 },
+	{ "Vostro V131",        0x1d },
+	{ "Vostro 5568",        0x29 },
+};
+
+static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
+{
+	struct i2c_board_info info = { };
+	struct i2c_adapter *adap = NULL;
+	const char *dmi_product_name;
+	u8 addr = 0;
+	int i;
+
+	bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
+	if (!adap)
+		return;
+
+	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
+		if (strcmp(dmi_product_name,
+			   dell_lis3lv02d_devices[i].dmi_product_name) == 0) {
+			addr = dell_lis3lv02d_devices[i].i2c_addr;
+			break;
+		}
+	}
+
+	if (!addr) {
+		dev_warn(smo8800->dev,
+			 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
+		goto put_adapter;
+	}
+
+	info.addr = addr;
+	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
+
+	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
+	if (IS_ERR(smo8800->i2c_dev)) {
+		dev_err_probe(smo8800->dev, PTR_ERR(smo8800->i2c_dev),
+			      "registering accel i2c_client\n");
+		smo8800->i2c_dev = NULL;
+	} else {
+		dev_info(smo8800->dev, "Registered %s accelerometer on address 0x%02x\n",
+			 info.type, info.addr);
+	}
+put_adapter:
+	i2c_put_adapter(adap);
+}
+
 static int smo8800_probe(struct platform_device *device)
 {
 	int err;
@@ -126,10 +237,12 @@ static int smo8800_probe(struct platform_device *device)
 		return err;
 	smo8800->irq = err;
 
+	smo8800_instantiate_i2c_client(smo8800);
+
 	err = misc_register(&smo8800->miscdev);
 	if (err) {
 		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
-		return err;
+		goto error_unregister_i2c_client;
 	}
 
 	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
@@ -150,6 +263,8 @@ static int smo8800_probe(struct platform_device *device)
 
 error:
 	misc_deregister(&smo8800->miscdev);
+error_unregister_i2c_client:
+	i2c_unregister_device(smo8800->i2c_dev);
 	return err;
 }
 
@@ -160,9 +275,9 @@ static void smo8800_remove(struct platform_device *device)
 	free_irq(smo8800->irq, smo8800);
 	misc_deregister(&smo8800->miscdev);
 	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
+	i2c_unregister_device(smo8800->i2c_dev);
 }
 
-/* NOTE: Keep this list in sync with drivers/i2c/busses/i2c-i801.c */
 static const struct acpi_device_id smo8800_ids[] = {
 	{ "SMO8800", 0 },
 	{ "SMO8801", 0 },
@@ -189,3 +304,5 @@ module_platform_driver(smo8800_driver);
 MODULE_DESCRIPTION("Dell Latitude freefall driver (ACPI SMO88XX)");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sonal Santan, Pali Rohár");
+/* Ensure the i2c-801 driver is loaded for i2c_client instantiation */
+MODULE_SOFTDEP("pre: i2c-i801");
-- 
2.43.0



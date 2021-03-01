Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEC632830F
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 Mar 2021 17:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237575AbhCAQHA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 1 Mar 2021 11:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237518AbhCAQFO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Mar 2021 11:05:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2993C061788
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Mar 2021 08:04:33 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lGl1r-00023S-Qp; Mon, 01 Mar 2021 17:04:15 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lGl1l-00065g-Po; Mon, 01 Mar 2021 17:04:09 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] platform/x86: wmi: Make remove callback return void
Date:   Mon,  1 Mar 2021 17:04:04 +0100
Message-Id: <20210301160404.1677064-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver core ignores the return value of struct bus_type::remove()
(and so wmi_dev_remove()) because there is only little that can be done.

To simplify the quest to make this function return void, let struct
wmi_driver::remove() return void, too. All implementers of this callback
return 0 already and this way it should be obvious to driver authors
that returning an error code is a bad idea.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c                  | 3 +--
 drivers/platform/x86/dell/dell-wmi-descriptor.c              | 3 +--
 .../platform/x86/dell/dell-wmi-sysman/biosattr-interface.c   | 3 +--
 .../x86/dell/dell-wmi-sysman/passwordattr-interface.c        | 3 +--
 drivers/platform/x86/dell/dell-wmi.c                         | 3 +--
 drivers/platform/x86/intel-wmi-sbl-fw-update.c               | 3 +--
 drivers/platform/x86/intel-wmi-thunderbolt.c                 | 3 +--
 drivers/platform/x86/wmi-bmof.c                              | 3 +--
 drivers/platform/x86/wmi.c                                   | 5 ++---
 include/linux/wmi.h                                          | 2 +-
 10 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index 27a298b7c541..a1753485159c 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -205,7 +205,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
 	return ret;
 }
 
-static int dell_smbios_wmi_remove(struct wmi_device *wdev)
+static void dell_smbios_wmi_remove(struct wmi_device *wdev)
 {
 	struct wmi_smbios_priv *priv = dev_get_drvdata(&wdev->dev);
 	int count;
@@ -218,7 +218,6 @@ static int dell_smbios_wmi_remove(struct wmi_device *wdev)
 	count = get_order(priv->req_buf_size);
 	free_pages((unsigned long)priv->buf, count);
 	mutex_unlock(&call_mutex);
-	return 0;
 }
 
 static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
index a068900ae8a1..3c4af7c08bb1 100644
--- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
@@ -174,14 +174,13 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
 	return ret;
 }
 
-static int dell_wmi_descriptor_remove(struct wmi_device *wdev)
+static void dell_wmi_descriptor_remove(struct wmi_device *wdev)
 {
 	struct descriptor_priv *priv = dev_get_drvdata(&wdev->dev);
 
 	mutex_lock(&list_mutex);
 	list_del(&priv->list);
 	mutex_unlock(&list_mutex);
-	return 0;
 }
 
 static const struct wmi_device_id dell_wmi_descriptor_id_table[] = {
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
index f95d8ddace5a..c2dd2de6bc20 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
@@ -152,12 +152,11 @@ static int bios_attr_set_interface_probe(struct wmi_device *wdev, const void *co
 	return 0;
 }
 
-static int bios_attr_set_interface_remove(struct wmi_device *wdev)
+static void bios_attr_set_interface_remove(struct wmi_device *wdev)
 {
 	mutex_lock(&wmi_priv.mutex);
 	wmi_priv.bios_attr_wdev = NULL;
 	mutex_unlock(&wmi_priv.mutex);
-	return 0;
 }
 
 static const struct wmi_device_id bios_attr_set_interface_id_table[] = {
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
index 5780b4d94759..339a082d6c18 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
@@ -119,12 +119,11 @@ static int bios_attr_pass_interface_probe(struct wmi_device *wdev, const void *c
 	return 0;
 }
 
-static int bios_attr_pass_interface_remove(struct wmi_device *wdev)
+static void bios_attr_pass_interface_remove(struct wmi_device *wdev)
 {
 	mutex_lock(&wmi_priv.mutex);
 	wmi_priv.password_attr_wdev = NULL;
 	mutex_unlock(&wmi_priv.mutex);
-	return 0;
 }
 
 static const struct wmi_device_id bios_attr_pass_interface_id_table[] = {
diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
index bbdb3e860892..5e1b7f897df5 100644
--- a/drivers/platform/x86/dell/dell-wmi.c
+++ b/drivers/platform/x86/dell/dell-wmi.c
@@ -714,10 +714,9 @@ static int dell_wmi_probe(struct wmi_device *wdev, const void *context)
 	return dell_wmi_input_setup(wdev);
 }
 
-static int dell_wmi_remove(struct wmi_device *wdev)
+static void dell_wmi_remove(struct wmi_device *wdev)
 {
 	dell_wmi_input_destroy(wdev);
-	return 0;
 }
 static const struct wmi_device_id dell_wmi_id_table[] = {
 	{ .guid_string = DELL_EVENT_GUID },
diff --git a/drivers/platform/x86/intel-wmi-sbl-fw-update.c b/drivers/platform/x86/intel-wmi-sbl-fw-update.c
index ea87fa0786e8..3c86e0108a24 100644
--- a/drivers/platform/x86/intel-wmi-sbl-fw-update.c
+++ b/drivers/platform/x86/intel-wmi-sbl-fw-update.c
@@ -117,10 +117,9 @@ static int intel_wmi_sbl_fw_update_probe(struct wmi_device *wdev,
 	return 0;
 }
 
-static int intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
+static void intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
 {
 	dev_info(&wdev->dev, "Slim Bootloader signaling driver removed\n");
-	return 0;
 }
 
 static const struct wmi_device_id intel_wmi_sbl_id_table[] = {
diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel-wmi-thunderbolt.c
index 974c22a7ff61..4ae87060d18b 100644
--- a/drivers/platform/x86/intel-wmi-thunderbolt.c
+++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
@@ -66,11 +66,10 @@ static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev,
 	return ret;
 }
 
-static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
+static void intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
 {
 	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
 	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
-	return 0;
 }
 
 static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
index 66b434d6307f..80137afb9753 100644
--- a/drivers/platform/x86/wmi-bmof.c
+++ b/drivers/platform/x86/wmi-bmof.c
@@ -86,13 +86,12 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
 	return ret;
 }
 
-static int wmi_bmof_remove(struct wmi_device *wdev)
+static void wmi_bmof_remove(struct wmi_device *wdev)
 {
 	struct bmof_priv *priv = dev_get_drvdata(&wdev->dev);
 
 	sysfs_remove_bin_file(&wdev->dev.kobj, &priv->bmof_bin_attr);
 	kfree(priv->bmofdata);
-	return 0;
 }
 
 static const struct wmi_device_id wmi_bmof_id_table[] = {
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index c669676ea8e8..aa9bd2ee7390 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -986,7 +986,6 @@ static int wmi_dev_remove(struct device *dev)
 	struct wmi_block *wblock = dev_to_wblock(dev);
 	struct wmi_driver *wdriver =
 		container_of(dev->driver, struct wmi_driver, driver);
-	int ret = 0;
 
 	if (wdriver->filter_callback) {
 		misc_deregister(&wblock->char_dev);
@@ -995,12 +994,12 @@ static int wmi_dev_remove(struct device *dev)
 	}
 
 	if (wdriver->remove)
-		ret = wdriver->remove(dev_to_wdev(dev));
+		wdriver->remove(dev_to_wdev(dev));
 
 	if (ACPI_FAILURE(wmi_method_enable(wblock, 0)))
 		dev_warn(dev, "failed to disable device\n");
 
-	return ret;
+	return 0;
 }
 
 static struct class wmi_bus_class = {
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 8ef7e7faea1e..2cb3913c1f50 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -37,7 +37,7 @@ struct wmi_driver {
 	const struct wmi_device_id *id_table;
 
 	int (*probe)(struct wmi_device *wdev, const void *context);
-	int (*remove)(struct wmi_device *wdev);
+	void (*remove)(struct wmi_device *wdev);
 	void (*notify)(struct wmi_device *device, union acpi_object *data);
 	long (*filter_callback)(struct wmi_device *wdev, unsigned int cmd,
 				struct wmi_ioctl_buffer *arg);
-- 
2.30.0


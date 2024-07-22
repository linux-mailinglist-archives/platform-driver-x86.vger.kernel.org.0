Return-Path: <platform-driver-x86+bounces-4464-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBC938D7B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jul 2024 12:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCF1CB223FE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jul 2024 10:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF8F16CD01;
	Mon, 22 Jul 2024 10:28:55 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE71684A3;
	Mon, 22 Jul 2024 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644135; cv=none; b=FBbKEjS6IJLoMTaE08YpYF5RuteBbeHOBdn7jyxWQYWusnfdPBOryQOJi5gCoHZDqmS6ZjZk6uaqOEJJ9+WQzuNjPN9bmBmuqKL0gpHzDzbqxcDBmAMj/+OT63zGfym4whu2mD8l8cvL0kGNHVTITh6+53uWn8jP+t/xRYKFuO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644135; c=relaxed/simple;
	bh=uwNBYA/5LD9YYAk/fX4nj5fkGCofqYbasXl3rYv/GrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=is/MNYp2f4TAGEh7N3POYCDo0RK1LfAcdB8BEz5+ddb9RcWoXT0ykGk7ypjYkX+hZmN/wNMMrpBdWWh+YwFeEE6ddWbf06GfnN7yaJh4+Peri38iO3T4lOEOX13sMQRty/d4LY2UZtnQGwAwpZ4xw/YD7ocGfbsMoquJQj50PwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68624.dsl.pool.telekom.hu [::ffff:81.182.134.36])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000738C6.00000000669E345D.001898BD; Mon, 22 Jul 2024 12:28:45 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Hans de Goede <hdegoede@redhat.com>,
  =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
  Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v3 2/4] platform/x86: ideapad-laptop: move ymc_trigger_ec from lenovo-ymc
Date: Mon, 22 Jul 2024 12:27:22 +0200
Message-ID: <d980ab3ac32b5e554f456b0ff17279bfdbe2a203.1721294787.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721294787.git.soyer@irl.hu>
References: <cover.1721294787.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some models need to trigger the EC after each YMC event for the yoga
mode control to work properly. EC triggering consist of a VPC call from
the lenovo-ymc module. Except for this, all VPC calls are in the
ideapad-laptop module.

Since ideapad-laptop has a notification chain, a new YMC_EVENT action
can be added and triggered from the lenovo-ymc module. Then the
ideapad-laptop can trigger the EC.

If the triggering is in the ideapad-laptop module, then the ec_trigger
module parameter should be there as well.

Move the ymc_trigger_ec functionality and the ec_trigger module
parameter to the ideapad-laptop module.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/Kconfig          |  1 +
 drivers/platform/x86/ideapad-laptop.c | 49 ++++++++++++++++++++++
 drivers/platform/x86/ideapad-laptop.h |  4 ++
 drivers/platform/x86/lenovo-ymc.c     | 60 +--------------------------
 4 files changed, 56 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0ec952b5d03e..e5e61b8f8adc 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -476,6 +476,7 @@ config LENOVO_YMC
 	tristate "Lenovo Yoga Tablet Mode Control"
 	depends on ACPI_WMI
 	depends on INPUT
+	depends on IDEAPAD_LAPTOP
 	select INPUT_SPARSEKMAP
 	help
 	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 866b32bfe2c9..9fc1bb990e47 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -146,6 +146,7 @@ struct ideapad_private {
 		bool touchpad_ctrl_via_ec : 1;
 		bool ctrl_ps2_aux_port    : 1;
 		bool usb_charging         : 1;
+		bool ymc_ec_trigger       : 1;
 	} features;
 	struct {
 		bool initialized;
@@ -194,6 +195,12 @@ MODULE_PARM_DESC(touchpad_ctrl_via_ec,
 	"Enable registering a 'touchpad' sysfs-attribute which can be used to manually "
 	"tell the EC to enable/disable the touchpad. This may not work on all models.");
 
+static bool ymc_ec_trigger __read_mostly;
+module_param(ymc_ec_trigger, bool, 0444);
+MODULE_PARM_DESC(ymc_ec_trigger,
+	"Enable EC triggering work-around to force emitting tablet mode events. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
 /*
  * shared data
  */
@@ -1592,10 +1599,50 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	priv->r_touchpad_val = value;
 }
 
+static const struct dmi_system_id ymc_ec_trigger_quirk_dmi_table[] = {
+	{
+		/* Lenovo Yoga 7 14ARB7 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
+		},
+	},
+	{
+		/* Lenovo Yoga 7 14ACN6 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
+		},
+	},
+	{ }
+};
+
+static void ideapad_laptop_trigger_ec(void)
+{
+	struct ideapad_private *priv;
+	int ret;
+
+	guard(mutex)(&ideapad_shared_mutex);
+
+	priv = ideapad_shared;
+	if (!priv)
+		return;
+
+	if (!priv->features.ymc_ec_trigger)
+		return;
+
+	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
+	if (ret)
+		dev_warn(&priv->platform_device->dev, "Could not write YMC: %d\n", ret);
+}
+
 static int ideapad_laptop_nb_notify(struct notifier_block *nb,
 				    unsigned long action, void *data)
 {
 	switch (action) {
+	case IDEAPAD_LAPTOP_YMC_EVENT:
+		ideapad_laptop_trigger_ec();
+		break;
 	}
 
 	return 0;
@@ -1761,6 +1808,8 @@ static void ideapad_check_features(struct ideapad_private *priv)
 	priv->features.ctrl_ps2_aux_port =
 		ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
 	priv->features.touchpad_ctrl_via_ec = touchpad_ctrl_via_ec;
+	priv->features.ymc_ec_trigger =
+		ymc_ec_trigger || dmi_check_system(ymc_ec_trigger_quirk_dmi_table);
 
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode = true;
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
index 3eb0dcd6bf7b..948cc61800a9 100644
--- a/drivers/platform/x86/ideapad-laptop.h
+++ b/drivers/platform/x86/ideapad-laptop.h
@@ -14,6 +14,10 @@
 #include <linux/errno.h>
 #include <linux/notifier.h>
 
+enum ideapad_laptop_notifier_actions {
+	IDEAPAD_LAPTOP_YMC_EVENT,
+};
+
 int ideapad_laptop_register_notifier(struct notifier_block *nb);
 int ideapad_laptop_unregister_notifier(struct notifier_block *nb);
 void ideapad_laptop_call_notifier(unsigned long action, void *data);
diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
index e1fbc35504d4..e0bbd6a14a89 100644
--- a/drivers/platform/x86/lenovo-ymc.c
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -20,32 +20,10 @@
 #define LENOVO_YMC_QUERY_INSTANCE 0
 #define LENOVO_YMC_QUERY_METHOD 0x01
 
-static bool ec_trigger __read_mostly;
-module_param(ec_trigger, bool, 0444);
-MODULE_PARM_DESC(ec_trigger, "Enable EC triggering work-around to force emitting tablet mode events");
-
 static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");
 
-static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
-	{
-		/* Lenovo Yoga 7 14ARB7 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
-		},
-	},
-	{
-		/* Lenovo Yoga 7 14ACN6 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
-		},
-	},
-	{ }
-};
-
 static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
 	{
 		.matches = {
@@ -62,21 +40,8 @@ static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
 
 struct lenovo_ymc_private {
 	struct input_dev *input_dev;
-	struct acpi_device *ec_acpi_dev;
 };
 
-static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenovo_ymc_private *priv)
-{
-	int err;
-
-	if (!priv->ec_acpi_dev)
-		return;
-
-	err = write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
-	if (err)
-		dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
-}
-
 static const struct key_entry lenovo_ymc_keymap[] = {
 	/* Laptop */
 	{ KE_SW, 0x01, { .sw = { SW_TABLET_MODE, 0 } } },
@@ -125,11 +90,9 @@ static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
 
 free_obj:
 	kfree(obj);
-	lenovo_ymc_trigger_ec(wdev, priv);
+	ideapad_laptop_call_notifier(IDEAPAD_LAPTOP_YMC_EVENT, &code);
 }
 
-static void acpi_dev_put_helper(void *p) { acpi_dev_put(p); }
-
 static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 {
 	struct lenovo_ymc_private *priv;
@@ -143,29 +106,10 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 			return -ENODEV;
 	}
 
-	ec_trigger |= dmi_check_system(ec_trigger_quirk_dmi_table);
-
 	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	if (ec_trigger) {
-		pr_debug("Lenovo YMC enable EC triggering.\n");
-		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VPC2004", NULL, -1);
-
-		if (!priv->ec_acpi_dev) {
-			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
-			return -ENODEV;
-		}
-		err = devm_add_action_or_reset(&wdev->dev,
-				acpi_dev_put_helper, priv->ec_acpi_dev);
-		if (err) {
-			dev_err(&wdev->dev,
-				"Could not clean up EC ACPI device: %d\n", err);
-			return err;
-		}
-	}
-
 	input_dev = devm_input_allocate_device(&wdev->dev);
 	if (!input_dev)
 		return -ENOMEM;
@@ -192,7 +136,6 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 	dev_set_drvdata(&wdev->dev, priv);
 
 	/* Report the state for the first time on probe */
-	lenovo_ymc_trigger_ec(wdev, priv);
 	lenovo_ymc_notify(wdev, NULL);
 	return 0;
 }
@@ -217,3 +160,4 @@ module_wmi_driver(lenovo_ymc_driver);
 MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
 MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(IDEAPAD_LAPTOP);
-- 
2.45.2



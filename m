Return-Path: <platform-driver-x86+bounces-4834-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C94679518BF
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Aug 2024 12:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1751F23A80
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Aug 2024 10:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5D81AE868;
	Wed, 14 Aug 2024 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdVb/aoZ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA71AC43A;
	Wed, 14 Aug 2024 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631274; cv=none; b=SQ6rJCKV7LRVpph1Pw08SZLEW/qfML23ZpWbyw2nYMggFiEvuyS0PNTHZOfDSsV+eqtrTfpKkg/KujReE3STPbZSQ3JsE/+WZRSfA/F1CnktzzGyRhhBXXjEeVevXwc81c5VQKvHnB4QSGBW3wFDlVFl9F60r3Cf47juhlQ3vKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631274; c=relaxed/simple;
	bh=Y8Q3PxLrP/EAxjgAi29xD7J3WFdmFoRdWlUA/qY7OXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5joMbweCVV8q5Lfu9y9A3peI35mAd5ZWWgYcLpIOzV5Bo1oSGlYdLRtQ2l9siFT6ePz435YKJdSCW60xab3CbZm3JJK4m4E003yr0SJ/KmVM9FQat6I6g2472Bxu2YUrnzHs6Hvnv5mtZrfA1ZW/lbiAKLoEg3hkfnnEe/LsjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdVb/aoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80766C4AF0F;
	Wed, 14 Aug 2024 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723631273;
	bh=Y8Q3PxLrP/EAxjgAi29xD7J3WFdmFoRdWlUA/qY7OXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XdVb/aoZ8vVCGOhNE2lxf7lkbhoCmKPvdyt0PO3FMv3AuoGUFB6CYZifM0+kRpaZ5
	 3ZoAVHB43uwmNCIcIHRW/gNZteVDHga6CzCpGoqop2lT47LBzW46wcQhXiYEQ2d+xc
	 I6xplhWCuf0G8zO6o2BJAgt0H354Hee80c0RdQbRHZEKlQEJgGLp5KKy5k0ExXfEHX
	 p52knKhLZ87dISffAnuPFqVM9St6enpVb4WSjtemeunO1vb2sywivw8tLtvIn25NUx
	 szPT/WN3Qapm5YnaVe5dtfxY+cQlTGoK6r32CrjMba7YzRM9bb+6TWpMTQYDnMLaMa
	 XjyH9zHLOM/oQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 Aug 2024 12:27:27 +0200
Subject: [PATCH v3 3/3] platform/surface: Add OF support
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-topic-sam-v3-3-a84588aad233@quicinc.com>
References: <20240814-topic-sam-v3-0-a84588aad233@quicinc.com>
In-Reply-To: <20240814-topic-sam-v3-0-a84588aad233@quicinc.com>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723631251; l=14638;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=fc7ntOoXUCRwQ6Cr1DJH1saEGJt3ClSgbReZck+29uI=;
 b=zmb3KBiCOhAExX5rbxyQzTU2PK/CTQR2p19LtyJ9/DVy0A94Zjtf9rnSG7P2dhZB/hL+jVz8E
 +QccsbWe6YaA8451dN9NATtiE0x9tWeUtUPptWx/4yXMJpTtMGEhdAQ
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Add basic support for registering the aggregator module on Device Tree-
based platforms. These include at least three generations of Qualcomm
Snapdragon-based Surface devices:

- SC8180X / SQ1 / SQ2: Pro X,
- SC8280XP / SQ3: Devkit 2023, Pro 9
- X Elite: Laptop 7 / Pro11

Thankfully, the aggregators on these seem to be configured in an
identical way, which allows for using these settings as defaults and
no DT properties need to be introduced (until that changes, anyway).

Based on the work done by Maximilian Luz, largely rewritten.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 drivers/platform/surface/aggregator/bus.c          |  2 +
 drivers/platform/surface/aggregator/controller.c   | 67 ++++++++++++++----
 drivers/platform/surface/aggregator/core.c         | 82 +++++++++++++++++-----
 drivers/platform/surface/surface3_power.c          |  1 +
 drivers/platform/surface/surface_acpi_notify.c     |  1 +
 .../platform/surface/surface_aggregator_registry.c | 47 +++++++++++--
 6 files changed, 162 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
index af8d573aae93..d68d231e716e 100644
--- a/drivers/platform/surface/aggregator/bus.c
+++ b/drivers/platform/surface/aggregator/bus.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 
@@ -441,6 +442,7 @@ static int ssam_add_client_device(struct device *parent, struct ssam_controller
 
 	sdev->dev.parent = parent;
 	sdev->dev.fwnode = fwnode_handle_get(node);
+	sdev->dev.of_node = to_of_node(node);
 
 	status = ssam_device_add(sdev);
 	if (status)
diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
index 7fc602e01487..27eadf22b292 100644
--- a/drivers/platform/surface/aggregator/controller.c
+++ b/drivers/platform/surface/aggregator/controller.c
@@ -1104,13 +1104,6 @@ int ssam_controller_caps_load_from_acpi(acpi_handle handle,
 	u64 funcs;
 	int status;
 
-	/* Set defaults. */
-	caps->ssh_power_profile = U32_MAX;
-	caps->screen_on_sleep_idle_timeout = U32_MAX;
-	caps->screen_off_sleep_idle_timeout = U32_MAX;
-	caps->d3_closes_handle = false;
-	caps->ssh_buffer_size = U32_MAX;
-
 	/* Pre-load supported DSM functions. */
 	status = ssam_dsm_get_functions(handle, &funcs);
 	if (status)
@@ -1149,6 +1142,52 @@ int ssam_controller_caps_load_from_acpi(acpi_handle handle,
 	return 0;
 }
 
+/**
+ * ssam_controller_caps_load_from_of() - Load controller capabilities from OF/DT.
+ * @dev:  A pointer to the controller device
+ * @caps: Where to store the capabilities in.
+ *
+ * Return: Returns zero on success, a negative error code on failure.
+ */
+static int ssam_controller_caps_load_from_of(struct device *dev, struct ssam_controller_caps *caps)
+{
+	/*
+	 * Every device starting with Surface Pro X through Laptop 7 uses these
+	 * identical values, which makes them good defaults.
+	 */
+	caps->d3_closes_handle = true;
+	caps->screen_on_sleep_idle_timeout = 5000;
+	caps->screen_off_sleep_idle_timeout = 30;
+	caps->ssh_buffer_size = 48;
+	/* TODO: figure out power profile */
+
+	return 0;
+}
+
+/**
+ * ssam_controller_caps_load() - Load controller capabilities
+ * @dev:  A pointer to the controller device
+ * @caps: Where to store the capabilities in.
+ *
+ * Return: Returns zero on success, a negative error code on failure.
+ */
+static int ssam_controller_caps_load(struct device *dev, struct ssam_controller_caps *caps)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+
+	/* Set defaults. */
+	caps->ssh_power_profile = U32_MAX;
+	caps->screen_on_sleep_idle_timeout = U32_MAX;
+	caps->screen_off_sleep_idle_timeout = U32_MAX;
+	caps->d3_closes_handle = false;
+	caps->ssh_buffer_size = U32_MAX;
+
+	if (handle)
+		return ssam_controller_caps_load_from_acpi(handle, caps);
+	else
+		return ssam_controller_caps_load_from_of(dev, caps);
+}
+
 /**
  * ssam_controller_init() - Initialize SSAM controller.
  * @ctrl:   The controller to initialize.
@@ -1165,13 +1204,12 @@ int ssam_controller_caps_load_from_acpi(acpi_handle handle,
 int ssam_controller_init(struct ssam_controller *ctrl,
 			 struct serdev_device *serdev)
 {
-	acpi_handle handle = ACPI_HANDLE(&serdev->dev);
 	int status;
 
 	init_rwsem(&ctrl->lock);
 	kref_init(&ctrl->kref);
 
-	status = ssam_controller_caps_load_from_acpi(handle, &ctrl->caps);
+	status = ssam_controller_caps_load(&serdev->dev, &ctrl->caps);
 	if (status)
 		return status;
 
@@ -2715,11 +2753,12 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
 	const int irqf = IRQF_ONESHOT | IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
 
 	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
-	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
-
-	irq = gpiod_to_irq(gpiod);
-	gpiod_put(gpiod);
+	if (IS_ERR(gpiod)) {
+		irq = fwnode_irq_get(dev_fwnode(dev), 0);
+	} else {
+		irq = gpiod_to_irq(gpiod);
+		gpiod_put(gpiod);
+	}
 
 	if (irq < 0)
 		return irq;
diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
index 797d0645bd77..c58e1fdd1a5f 100644
--- a/drivers/platform/surface/aggregator/core.c
+++ b/drivers/platform/surface/aggregator/core.c
@@ -17,9 +17,12 @@
 #include <linux/kernel.h>
 #include <linux/kref.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/serdev.h>
 #include <linux/sysfs.h>
+#include <linux/units.h>
 
 #include <linux/surface_aggregator/controller.h>
 #include <linux/surface_aggregator/device.h>
@@ -299,7 +302,7 @@ static const struct attribute_group ssam_sam_group = {
 };
 
 
-/* -- ACPI based device setup. ---------------------------------------------- */
+/* -- Serial device setup. -------------------------------------------------- */
 
 static acpi_status ssam_serdev_setup_via_acpi_crs(struct acpi_resource *rsc,
 						  void *ctx)
@@ -352,13 +355,28 @@ static acpi_status ssam_serdev_setup_via_acpi_crs(struct acpi_resource *rsc,
 	return AE_CTRL_TERMINATE;
 }
 
-static acpi_status ssam_serdev_setup_via_acpi(acpi_handle handle,
-					      struct serdev_device *serdev)
+static int ssam_serdev_setup_via_acpi(struct serdev_device *serdev, acpi_handle handle)
 {
-	return acpi_walk_resources(handle, METHOD_NAME__CRS,
-				   ssam_serdev_setup_via_acpi_crs, serdev);
+	acpi_status status;
+
+	status = acpi_walk_resources(handle, METHOD_NAME__CRS,
+				     ssam_serdev_setup_via_acpi_crs, serdev);
+
+	return status ? -ENXIO : 0;
 }
 
+static int ssam_serdev_setup(struct acpi_device *ssh, struct serdev_device *serdev)
+{
+	if (ssh)
+		return ssam_serdev_setup_via_acpi(serdev, ssh->handle);
+
+	/* TODO: these values may differ per board/implementation */
+	serdev_device_set_baudrate(serdev, 4 * HZ_PER_MHZ);
+	serdev_device_set_flow_control(serdev, true);
+	serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+
+	return 0;
+}
 
 /* -- Power management. ----------------------------------------------------- */
 
@@ -621,16 +639,17 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
 	struct device *dev = &serdev->dev;
 	struct acpi_device *ssh = ACPI_COMPANION(dev);
 	struct ssam_controller *ctrl;
-	acpi_status astatus;
 	int status;
 
-	status = gpiod_count(dev, NULL);
-	if (status < 0)
-		return dev_err_probe(dev, status, "no GPIO found\n");
+	if (ssh) {
+		status = gpiod_count(dev, NULL);
+		if (status < 0)
+			return dev_err_probe(dev, status, "no GPIO found\n");
 
-	status = devm_acpi_dev_add_driver_gpios(dev, ssam_acpi_gpios);
-	if (status)
-		return status;
+		status = devm_acpi_dev_add_driver_gpios(dev, ssam_acpi_gpios);
+		if (status)
+			return status;
+	}
 
 	/* Allocate controller. */
 	ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
@@ -655,9 +674,9 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
 		goto err_devopen;
 	}
 
-	astatus = ssam_serdev_setup_via_acpi(ssh->handle, serdev);
-	if (ACPI_FAILURE(astatus)) {
-		status = dev_err_probe(dev, -ENXIO, "failed to setup serdev\n");
+	status = ssam_serdev_setup(ssh, serdev);
+	if (status) {
+		status = dev_err_probe(dev, status, "failed to setup serdev\n");
 		goto err_devinit;
 	}
 
@@ -717,7 +736,23 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
 	 *       For now let's thus default power/wakeup to false.
 	 */
 	device_set_wakeup_capable(dev, true);
-	acpi_dev_clear_dependencies(ssh);
+
+	/*
+	 * When using DT, we have to register the platform hub driver manually,
+	 * as it can't be matched based on top-level board compatible (like it
+	 * does the ACPI case).
+	 */
+	if (!ssh) {
+		struct platform_device *ph_pdev =
+			platform_device_register_simple("surface_aggregator_platform_hub",
+							0, NULL, 0);
+		if (IS_ERR(ph_pdev))
+			return dev_err_probe(dev, PTR_ERR(ph_pdev),
+					     "Failed to register the platform hub driver\n");
+	}
+
+	if (ssh)
+		acpi_dev_clear_dependencies(ssh);
 
 	return 0;
 
@@ -782,18 +817,27 @@ static void ssam_serial_hub_remove(struct serdev_device *serdev)
 	device_set_wakeup_capable(&serdev->dev, false);
 }
 
-static const struct acpi_device_id ssam_serial_hub_match[] = {
+static const struct acpi_device_id ssam_serial_hub_acpi_match[] = {
 	{ "MSHW0084", 0 },
 	{ },
 };
-MODULE_DEVICE_TABLE(acpi, ssam_serial_hub_match);
+MODULE_DEVICE_TABLE(acpi, ssam_serial_hub_acpi_match);
+
+#ifdef CONFIG_OF
+static const struct of_device_id ssam_serial_hub_of_match[] = {
+	{ .compatible = "microsoft,surface-sam", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ssam_serial_hub_of_match);
+#endif
 
 static struct serdev_device_driver ssam_serial_hub = {
 	.probe = ssam_serial_hub_probe,
 	.remove = ssam_serial_hub_remove,
 	.driver = {
 		.name = "surface_serial_hub",
-		.acpi_match_table = ssam_serial_hub_match,
+		.acpi_match_table = ACPI_PTR(ssam_serial_hub_acpi_match),
+		.of_match_table = of_match_ptr(ssam_serial_hub_of_match),
 		.pm = &ssam_serial_hub_pm_ops,
 		.shutdown = ssam_serial_hub_shutdown,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
index 4c0f92562a79..31835f793a10 100644
--- a/drivers/platform/surface/surface3_power.c
+++ b/drivers/platform/surface/surface3_power.c
@@ -479,6 +479,7 @@ static int mshw0011_install_space_handler(struct i2c_client *client)
 	}
 
 	acpi_dev_clear_dependencies(adev);
+
 	return 0;
 }
 
diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 20f3870915d2..3be1f1730046 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -816,6 +816,7 @@ static int san_probe(struct platform_device *pdev)
 		goto err_install_dev;
 
 	acpi_dev_clear_dependencies(san);
+
 	return 0;
 
 err_install_dev:
diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 1c4d74db08c9..495cb4300617 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/types.h>
@@ -273,6 +274,18 @@ static const struct software_node *ssam_node_group_sl5[] = {
 	NULL,
 };
 
+/* Devices for Surface Laptop 7. */
+static const struct software_node *ssam_node_group_sl7[] = {
+	&ssam_node_root,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_perf_profile_with_fan,
+	&ssam_node_fan_speed,
+	&ssam_node_hid_sam_keyboard,
+	/* TODO: evaluate thermal sensors devices when we get a driver for that */
+	NULL,
+};
+
 /* Devices for Surface Laptop Studio. */
 static const struct software_node *ssam_node_group_sls[] = {
 	&ssam_node_root,
@@ -346,7 +359,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
 
 /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
 
-static const struct acpi_device_id ssam_platform_hub_match[] = {
+static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
 	/* Surface Pro 4, 5, and 6 (OMBR < 0x10) */
 	{ "MSHW0081", (unsigned long)ssam_node_group_gen5 },
 
@@ -400,18 +413,41 @@ static const struct acpi_device_id ssam_platform_hub_match[] = {
 
 	{ },
 };
-MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_match);
+MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
+
+#ifdef CONFIG_OF
+static const struct of_device_id ssam_platform_hub_of_match[] = {
+	/* Surface Laptop 7 */
+	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
+	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
+	{ },
+};
+#endif
 
 static int ssam_platform_hub_probe(struct platform_device *pdev)
 {
 	const struct software_node **nodes;
+	const struct of_device_id *match;
+	struct device_node *fdt_root;
 	struct ssam_controller *ctrl;
 	struct fwnode_handle *root;
 	int status;
 
 	nodes = (const struct software_node **)acpi_device_get_match_data(&pdev->dev);
-	if (!nodes)
-		return -ENODEV;
+	if (!nodes) {
+		fdt_root = of_find_node_by_path("/");
+		if (!fdt_root)
+			return -ENODEV;
+
+		match = of_match_node(ssam_platform_hub_of_match, fdt_root);
+		of_node_put(fdt_root);
+		if (!match)
+			return -ENODEV;
+
+		nodes = (const struct software_node **)match->data;
+		if (!nodes)
+			return -ENODEV;
+	}
 
 	/*
 	 * As we're adding the SSAM client devices as children under this device
@@ -460,12 +496,13 @@ static struct platform_driver ssam_platform_hub_driver = {
 	.remove_new = ssam_platform_hub_remove,
 	.driver = {
 		.name = "surface_aggregator_platform_hub",
-		.acpi_match_table = ssam_platform_hub_match,
+		.acpi_match_table = ssam_platform_hub_acpi_match,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(ssam_platform_hub_driver);
 
+MODULE_ALIAS("platform:surface_aggregator_platform_hub");
 MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
 MODULE_DESCRIPTION("Device-registry for Surface System Aggregator Module");
 MODULE_LICENSE("GPL");

-- 
2.46.0



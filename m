Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B12A4FB85
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfFWMQj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60385 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726414AbfFWMQj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:33 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1E001431;
        Sun, 23 Jun 2019 15:16:33 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 1/7] platform/x86: mlx-platform: Move regmap initialization before all drivers activation
Date:   Sun, 23 Jun 2019 12:16:24 +0000
Message-Id: <20190623121630.17945-2-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190623121630.17945-1-vadimp@mellanox.com>
References: <20190623121630.17945-1-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Initialize regmap prior drivers starting to allow passing regmap handle
to 'i2c_mlxcpld' driver.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 58 +++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 983f02b5b106..a611443a8ac7 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -159,6 +159,7 @@
  * @pdev_io_regs - register access platform devices
  * @pdev_fan - FAN platform devices
  * @pdev_wd - array of watchdog platform devices
+ * @regmap: device register map
  */
 struct mlxplat_priv {
 	struct platform_device *pdev_i2c;
@@ -168,6 +169,7 @@ struct mlxplat_priv {
 	struct platform_device *pdev_io_regs;
 	struct platform_device *pdev_fan;
 	struct platform_device *pdev_wd[MLXPLAT_CPLD_WD_MAX_DEVS];
+	void *regmap;
 };
 
 /* Regions for LPC I2C controller and LPC base register space */
@@ -1740,6 +1742,7 @@ static struct mlxreg_core_platform_data *mlxplat_regs_io;
 static struct mlxreg_core_platform_data *mlxplat_fan;
 static struct mlxreg_core_platform_data
 	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
+static const struct regmap_config *mlxplat_regmap_config;
 
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 {
@@ -2018,6 +2021,24 @@ static int __init mlxplat_init(void)
 	}
 	platform_set_drvdata(mlxplat_dev, priv);
 
+	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
+			       mlxplat_lpc_resources[1].start, 1);
+	if (!mlxplat_mlxcpld_regmap_ctx.base) {
+		err = -ENOMEM;
+		goto fail_platform_mux_register;
+	}
+
+	if (!mlxplat_regmap_config)
+		mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config;
+
+	priv->regmap = devm_regmap_init(&mlxplat_dev->dev, NULL,
+					&mlxplat_mlxcpld_regmap_ctx,
+					mlxplat_regmap_config);
+	if (IS_ERR(priv->regmap)) {
+		err = PTR_ERR(priv->regmap);
+		return err;
+	}
+
 	err = mlxplat_mlxcpld_verify_bus_topology(&nr);
 	if (nr < 0)
 		goto fail_alloc;
@@ -2042,21 +2063,8 @@ static int __init mlxplat_init(void)
 		}
 	}
 
-	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
-			       mlxplat_lpc_resources[1].start, 1);
-	if (!mlxplat_mlxcpld_regmap_ctx.base) {
-		err = -ENOMEM;
-		goto fail_platform_mux_register;
-	}
-
-	mlxplat_hotplug->regmap = devm_regmap_init(&mlxplat_dev->dev, NULL,
-					&mlxplat_mlxcpld_regmap_ctx,
-					&mlxplat_mlxcpld_regmap_config);
-	if (IS_ERR(mlxplat_hotplug->regmap)) {
-		err = PTR_ERR(mlxplat_hotplug->regmap);
-		goto fail_platform_mux_register;
-	}
-
+	/* Add hotplug driver */
+	mlxplat_hotplug->regmap = priv->regmap;
 	priv->pdev_hotplug = platform_device_register_resndata(
 				&mlxplat_dev->dev, "mlxreg-hotplug",
 				PLATFORM_DEVID_NONE,
@@ -2069,16 +2077,16 @@ static int __init mlxplat_init(void)
 	}
 
 	/* Set default registers. */
-	for (j = 0; j <  mlxplat_mlxcpld_regmap_config.num_reg_defaults; j++) {
-		err = regmap_write(mlxplat_hotplug->regmap,
-				   mlxplat_mlxcpld_regmap_default[j].reg,
-				   mlxplat_mlxcpld_regmap_default[j].def);
+	for (j = 0; j <  mlxplat_regmap_config->num_reg_defaults; j++) {
+		err = regmap_write(priv->regmap,
+				   mlxplat_regmap_config->reg_defaults[j].reg,
+				   mlxplat_regmap_config->reg_defaults[j].def);
 		if (err)
 			goto fail_platform_mux_register;
 	}
 
 	/* Add LED driver. */
-	mlxplat_led->regmap = mlxplat_hotplug->regmap;
+	mlxplat_led->regmap = priv->regmap;
 	priv->pdev_led = platform_device_register_resndata(
 				&mlxplat_dev->dev, "leds-mlxreg",
 				PLATFORM_DEVID_NONE, NULL, 0,
@@ -2090,7 +2098,7 @@ static int __init mlxplat_init(void)
 
 	/* Add registers io access driver. */
 	if (mlxplat_regs_io) {
-		mlxplat_regs_io->regmap = mlxplat_hotplug->regmap;
+		mlxplat_regs_io->regmap = priv->regmap;
 		priv->pdev_io_regs = platform_device_register_resndata(
 					&mlxplat_dev->dev, "mlxreg-io",
 					PLATFORM_DEVID_NONE, NULL, 0,
@@ -2104,7 +2112,7 @@ static int __init mlxplat_init(void)
 
 	/* Add FAN driver. */
 	if (mlxplat_fan) {
-		mlxplat_fan->regmap = mlxplat_hotplug->regmap;
+		mlxplat_fan->regmap = priv->regmap;
 		priv->pdev_fan = platform_device_register_resndata(
 					&mlxplat_dev->dev, "mlxreg-fan",
 					PLATFORM_DEVID_NONE, NULL, 0,
@@ -2119,7 +2127,7 @@ static int __init mlxplat_init(void)
 	/* Add WD drivers. */
 	for (j = 0; j < MLXPLAT_CPLD_WD_MAX_DEVS; j++) {
 		if (mlxplat_wd_data[j]) {
-			mlxplat_wd_data[j]->regmap = mlxplat_hotplug->regmap;
+			mlxplat_wd_data[j]->regmap = priv->regmap;
 			priv->pdev_wd[j] = platform_device_register_resndata(
 						&mlxplat_dev->dev, "mlx-wdt",
 						j, NULL, 0,
@@ -2133,8 +2141,8 @@ static int __init mlxplat_init(void)
 	}
 
 	/* Sync registers with hardware. */
-	regcache_mark_dirty(mlxplat_hotplug->regmap);
-	err = regcache_sync(mlxplat_hotplug->regmap);
+	regcache_mark_dirty(priv->regmap);
+	err = regcache_sync(priv->regmap);
 	if (err)
 		goto fail_platform_wd_register;
 
-- 
2.11.0


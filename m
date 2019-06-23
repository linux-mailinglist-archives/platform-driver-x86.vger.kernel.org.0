Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3684FB84
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfFWMQj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60386 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726086AbfFWMQj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:35 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1F001431;
        Sun, 23 Jun 2019 15:16:34 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 2/7] platform/x86: mlx-platform: Change API for i2c-mlxcpld driver activation
Date:   Sun, 23 Jun 2019 12:16:25 +0000
Message-Id: <20190623121630.17945-3-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190623121630.17945-1-vadimp@mellanox.com>
References: <20190623121630.17945-1-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Activate 'i2c-mlxcpld' driver with 'platform_device_register_resndata'
instead off 'platform_device_register_simple' in order to pass platform
specific info.
Add platform i2c data for the next generation systems.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index a611443a8ac7..79afc7a9eaf9 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -44,6 +44,8 @@
 #define MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET	0x3b
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET	0x40
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET	0x41
+#define MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET	0x42
+#define MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET	0x43
 #define MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET 0x50
 #define MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET	0x51
 #define MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET	0x52
@@ -105,7 +107,9 @@
 					 MLXPLAT_CPLD_AGGR_FAN_MASK_DEF)
 #define MLXPLAT_CPLD_AGGR_ASIC_MASK_NG	0x01
 #define MLXPLAT_CPLD_AGGR_MASK_NG_DEF	0x04
+#define MLXPLAT_CPLD_AGGR_MASK_COMEX	BIT(0)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_LOW	0xc1
+#define MLXPLAT_CPLD_LOW_AGGR_MASK_I2C	BIT(6)
 #define MLXPLAT_CPLD_PSU_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_FAN_MASK		GENMASK(3, 0)
@@ -183,6 +187,14 @@ static const struct resource mlxplat_lpc_resources[] = {
 			       IORESOURCE_IO),
 };
 
+/* Platform next generation systems i2c data */
+static struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_i2c_ng_data = {
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_I2C,
+};
+
 /* Platform default channels */
 static const int mlxplat_default_channels[][MLXPLAT_CPLD_GRP_CHNL_NUM] = {
 	{
@@ -706,7 +718,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_ng_data = {
 	.items = mlxplat_mlxcpld_default_ng_items,
 	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
-	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
@@ -1533,6 +1545,7 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WP2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
@@ -1580,6 +1593,8 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
@@ -1647,6 +1662,8 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
@@ -1736,6 +1753,7 @@ static struct resource mlxplat_mlxcpld_resources[] = {
 };
 
 static struct platform_device *mlxplat_dev;
+static struct mlxreg_core_hotplug_platform_data *mlxplat_i2c;
 static struct mlxreg_core_hotplug_platform_data *mlxplat_hotplug;
 static struct mlxreg_core_platform_data *mlxplat_led;
 static struct mlxreg_core_platform_data *mlxplat_regs_io;
@@ -1837,6 +1855,7 @@ static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
 	mlxplat_fan = &mlxplat_default_fan_data;
 	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
 		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 
 	return 1;
 };
@@ -2044,8 +2063,13 @@ static int __init mlxplat_init(void)
 		goto fail_alloc;
 
 	nr = (nr == MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM) ? -1 : nr;
-	priv->pdev_i2c = platform_device_register_simple("i2c_mlxcpld", nr,
-							 NULL, 0);
+	if (mlxplat_i2c)
+		mlxplat_i2c->regmap = priv->regmap;
+	priv->pdev_i2c = platform_device_register_resndata(
+					&mlxplat_dev->dev, "i2c_mlxcpld",
+					nr, mlxplat_mlxcpld_resources,
+					ARRAY_SIZE(mlxplat_mlxcpld_resources),
+					mlxplat_i2c, sizeof(*mlxplat_i2c));
 	if (IS_ERR(priv->pdev_i2c)) {
 		err = PTR_ERR(priv->pdev_i2c);
 		goto fail_alloc;
-- 
2.11.0


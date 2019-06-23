Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C794FB86
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfFWMQj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60393 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726417AbfFWMQj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:36 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1G001431;
        Sun, 23 Jun 2019 15:16:36 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 3/7] platform/x86: mlx-platform: Add regmap structure for the next generation systems
Date:   Sun, 23 Jun 2019 12:16:26 +0000
Message-Id: <20190623121630.17945-4-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190623121630.17945-1-vadimp@mellanox.com>
References: <20190623121630.17945-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use separated regamp structures for old and next generation systems.
Next generation systems don’t require write protection removing.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 79afc7a9eaf9..85f98db5a236 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1710,6 +1710,11 @@ static const struct reg_default mlxplat_mlxcpld_regmap_default[] = {
 	{ MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET, 0x00 },
 };
 
+static const struct reg_default mlxplat_mlxcpld_regmap_ng[] = {
+	{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET, 0x00 },
+};
+
 struct mlxplat_mlxcpld_regmap_context {
 	void __iomem *base;
 };
@@ -1748,6 +1753,20 @@ static const struct regmap_config mlxplat_mlxcpld_regmap_config = {
 	.reg_write = mlxplat_mlxcpld_reg_write,
 };
 
+static const struct regmap_config mlxplat_mlxcpld_regmap_config_ng = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 255,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = mlxplat_mlxcpld_writeable_reg,
+	.readable_reg = mlxplat_mlxcpld_readable_reg,
+	.volatile_reg = mlxplat_mlxcpld_volatile_reg,
+	.reg_defaults = mlxplat_mlxcpld_regmap_ng,
+	.num_reg_defaults = ARRAY_SIZE(mlxplat_mlxcpld_regmap_ng),
+	.reg_read = mlxplat_mlxcpld_reg_read,
+	.reg_write = mlxplat_mlxcpld_reg_write,
+};
+
 static struct resource mlxplat_mlxcpld_resources[] = {
 	[0] = DEFINE_RES_IRQ_NAMED(17, "mlxreg-hotplug"),
 };
@@ -1856,6 +1875,7 @@ static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
 	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
 		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng;
 
 	return 1;
 };
-- 
2.11.0


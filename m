Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5F6275E9E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Sep 2020 19:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgIWR1r (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Sep 2020 13:27:47 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:35538 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726762AbgIWR1p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 13:27:45 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 23 Sep 2020 20:20:58 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08NHKtgm020358;
        Wed, 23 Sep 2020 20:20:58 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 2/5] platform/x86: mlx-platform: Fix extended topology configuration for power supply units
Date:   Wed, 23 Sep 2020 20:20:50 +0300
Message-Id: <20200923172053.26296-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923172053.26296-1-vadimp@nvidia.com>
References: <20200923172053.26296-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix topology configuration for power supply units in structure
'mlxplat_mlxcpld_ext_pwr_items_data', due to hardware change.

Note: no need to backport the fix, since there is no such hardware yet
(equipped with four power) at the filed.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index e57d2471dfcb..04a745095c37 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -171,7 +171,6 @@
 #define MLXPLAT_CPLD_NR_NONE			-1
 #define MLXPLAT_CPLD_PSU_DEFAULT_NR		10
 #define MLXPLAT_CPLD_PSU_MSNXXXX_NR		4
-#define MLXPLAT_CPLD_PSU_MSNXXXX_NR2		3
 #define MLXPLAT_CPLD_FAN1_DEFAULT_NR		11
 #define MLXPLAT_CPLD_FAN2_DEFAULT_NR		12
 #define MLXPLAT_CPLD_FAN3_DEFAULT_NR		13
@@ -338,6 +337,15 @@ static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
 	},
 };
 
+static struct i2c_board_info mlxplat_mlxcpld_ext_pwr[] = {
+	{
+		I2C_BOARD_INFO("dps460", 0x5b),
+	},
+	{
+		I2C_BOARD_INFO("dps460", 0x5a),
+	},
+};
+
 static struct i2c_board_info mlxplat_mlxcpld_fan[] = {
 	{
 		I2C_BOARD_INFO("24c32", 0x50),
@@ -910,15 +918,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_ext_pwr_items_data[] = {
 		.label = "pwr3",
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = BIT(2),
-		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[0],
-		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR2,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[0],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
 	},
 	{
 		.label = "pwr4",
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = BIT(3),
-		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[1],
-		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR2,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[1],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
 	},
 };
 
-- 
2.11.0


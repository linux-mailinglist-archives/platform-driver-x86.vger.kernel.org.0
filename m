Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689944FB87
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfFWMQn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:43 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60408 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726439AbfFWMQn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:43 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:38 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1I001431;
        Sun, 23 Jun 2019 15:16:38 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 5/7] platform/x86: mlx-platform: Add more reset cause attributes
Date:   Sun, 23 Jun 2019 12:16:28 +0000
Message-Id: <20190623121630.17945-6-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190623121630.17945-1-vadimp@mellanox.com>
References: <20190623121630.17945-1-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add more attributes for reset cause indication for the cases when
system reset has been caused by watchdog, BIOS reload and COMEX
thermal shutdown.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 8ed84cf4b668..262fa6b1282b 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1127,6 +1127,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
+		.label = "reset_sff_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
 		.label = "psu1_on",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(0),
@@ -1215,6 +1221,18 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
+		.label = "reset_from_asic",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
 		.label = "reset_asic_thermal",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(7),
@@ -1227,6 +1245,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
+		.label = "reset_comex_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
 		.label = "reset_voltmon_upgrade_fail",
 		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(0),
@@ -1239,6 +1263,18 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
+		.label = "reset_comex_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_reload_bios",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
 		.label = "psu1_on",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(0),
-- 
2.11.0


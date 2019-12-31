Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C3012D7E8
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Dec 2019 11:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfLaK3c (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Dec 2019 05:29:32 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60240 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727132AbfLaK3b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Dec 2019 05:29:31 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 31 Dec 2019 12:29:27 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id xBVATJ7e008518;
        Tue, 31 Dec 2019 12:29:27 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy@infradead.org, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 7/9] platform/x86: mlx-platform: Add support for new capability register
Date:   Tue, 31 Dec 2019 10:29:15 +0000
Message-Id: <20191231102917.24181-8-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191231102917.24181-1-vadimp@mellanox.com>
References: <20191231102917.24181-1-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for capability register, which contains information about
the number of PS units equipped on the system and about minimum I2C
frequency supported by the all system's I2C devices.
Utilization of this register allows to avoid necessity of providing new
system description, in case it differs in number of PS units or in
minimal I2C frequency.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 31c04ee53989..ac789f98c8b8 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -90,6 +90,7 @@
 #define MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET	0xf6
 #define MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET	0xf7
 #define MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET	0xf8
+#define MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET 0xf9
 #define MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET	0xfb
 #define MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET	0xfc
 #define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
@@ -123,12 +124,16 @@
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_I2C	BIT(6)
 #define MLXPLAT_CPLD_PSU_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_MASK		GENMASK(1, 0)
+#define MLXPLAT_CPLD_PSU_EXT_MASK	GENMASK(3, 0)
+#define MLXPLAT_CPLD_PWR_EXT_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_FAN_MASK		GENMASK(3, 0)
 #define MLXPLAT_CPLD_ASIC_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_FAN_NG_MASK	GENMASK(5, 0)
 #define MLXPLAT_CPLD_LED_LO_NIBBLE_MASK	GENMASK(7, 4)
 #define MLXPLAT_CPLD_LED_HI_NIBBLE_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_VOLTREG_UPD_MASK	GENMASK(5, 4)
+#define MLXPLAT_CPLD_I2C_CAP_BIT	0x04
+#define MLXPLAT_CPLD_I2C_CAP_MASK	GENMASK(5, MLXPLAT_CPLD_I2C_CAP_BIT)
 
 /* Masks for aggregation for comex carriers */
 #define MLXPLAT_CPLD_AGGR_MASK_CARRIER	BIT(1)
@@ -1937,6 +1942,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET:
@@ -2007,6 +2013,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET:
-- 
2.11.0


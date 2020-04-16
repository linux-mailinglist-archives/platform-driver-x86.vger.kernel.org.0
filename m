Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6D51ACDCC
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Apr 2020 18:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgDPQfb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Apr 2020 12:35:31 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58138 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732572AbgDPQf3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Apr 2020 12:35:29 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from michaelsh@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 16 Apr 2020 19:35:24 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 03GGZIjG013255;
        Thu, 16 Apr 2020 19:35:24 +0300
From:   michaelsh@mellanox.com
To:     linux@roeck-us.net, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com,
        Michael Shych <michaelsh@mellanox.com>
Subject: [PATCH v1 3/4] watchdog: mlx-wdt: support new watchdog type with longer timeout period
Date:   Thu, 16 Apr 2020 19:35:13 +0300
Message-Id: <20200416163514.7334-4-michaelsh@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200416163514.7334-1-michaelsh@mellanox.com>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@mellanox.com>

New programmable logic device can have watchdog type 3 implementation.
It's same as Type 2 with extended maximum timeout period.
Maximum timeout is up-to 65535 sec.
Type 3 HW watchdog implementation can exist on all Mellanox systems.
It is differentiated by WD capability bit.

Signed-off-by: Michael Shych <michaelsh@mellanox.com>

Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/watchdog/mlx_wdt.c | 75 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
index 03b9ac4b99af..c6d81a3d4587 100644
--- a/drivers/watchdog/mlx_wdt.c
+++ b/drivers/watchdog/mlx_wdt.c
@@ -21,6 +21,7 @@
 #define MLXREG_WDT_CLOCK_SCALE		1000
 #define MLXREG_WDT_MAX_TIMEOUT_TYPE1	32
 #define MLXREG_WDT_MAX_TIMEOUT_TYPE2	255
+#define MLXREG_WDT_MAX_TIMEOUT_TYPE3	65535
 #define MLXREG_WDT_MIN_TIMEOUT		1
 #define MLXREG_WDT_OPTIONS_BASE (WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | \
 				 WDIOF_SETTIMEOUT)
@@ -49,6 +50,7 @@ struct mlxreg_wdt {
 	int tleft_idx;
 	int ping_idx;
 	int reset_idx;
+	int regmap_val_sz;
 	enum mlxreg_wdt_type wdt_type;
 };
 
@@ -111,7 +113,8 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
 	u32 regval, set_time, hw_timeout;
 	int rc;
 
-	if (wdt->wdt_type == MLX_WDT_TYPE1) {
+	switch (wdt->wdt_type) {
+	case MLX_WDT_TYPE1:
 		rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
 		if (rc)
 			return rc;
@@ -120,14 +123,33 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
 		regval = (regval & reg_data->mask) | hw_timeout;
 		/* Rowndown to actual closest number of sec. */
 		set_time = BIT(hw_timeout) / MLXREG_WDT_CLOCK_SCALE;
-	} else {
+		rc = regmap_write(wdt->regmap, reg_data->reg, regval);
+		break;
+	case MLX_WDT_TYPE2:
+		set_time = timeout;
+		rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
+		break;
+	case MLX_WDT_TYPE3:
+		/* WD_TYPE3 has 2B set time register */
 		set_time = timeout;
-		regval = timeout;
+		if (wdt->regmap_val_sz == 1) {
+			timeout = cpu_to_le16(timeout);
+			regval = timeout & GENMASK(7, 0);
+			rc = regmap_write(wdt->regmap, reg_data->reg, regval);
+			if (!rc) {
+				regval = ror32((timeout & GENMASK(15, 8)), 8);
+				rc = regmap_write(wdt->regmap,
+						reg_data->reg + 1, regval);
+			}
+		} else {
+			rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
+		}
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	wdd->timeout = set_time;
-	rc = regmap_write(wdt->regmap, reg_data->reg, regval);
-
 	if (!rc) {
 		/*
 		 * Restart watchdog with new timeout period
@@ -147,10 +169,26 @@ static unsigned int mlxreg_wdt_get_timeleft(struct watchdog_device *wdd)
 {
 	struct mlxreg_wdt *wdt = watchdog_get_drvdata(wdd);
 	struct mlxreg_core_data *reg_data = &wdt->pdata->data[wdt->tleft_idx];
-	u32 regval;
+	u32 regval, msb, lsb, reg = reg_data->reg;
 	int rc;
 
-	rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
+	if (wdt->wdt_type == MLX_WDT_TYPE2) {
+		rc = regmap_read(wdt->regmap, reg, &regval);
+	} else {
+		/* WD_TYPE3 has 2 byte timeleft register */
+		if (wdt->regmap_val_sz == 1) {
+			rc = regmap_read(wdt->regmap, reg, &lsb);
+			if (!rc) {
+				rc = regmap_read(wdt->regmap, ++reg, &msb);
+				regval = rol32((msb & GENMASK(7, 0)), 8) |
+						(lsb & GENMASK(7, 0));
+				regval = le16_to_cpu(regval);
+			}
+		} else {
+			rc = regmap_read(wdt->regmap, reg, &regval);
+		}
+	}
+
 	/* Return 0 timeleft in case of failure register read. */
 	return rc == 0 ? regval : 0;
 }
@@ -212,13 +250,23 @@ static void mlxreg_wdt_config(struct mlxreg_wdt *wdt,
 		wdt->wdd.info = &mlxreg_wdt_aux_info;
 
 	wdt->wdt_type = pdata->version;
-	if (wdt->wdt_type == MLX_WDT_TYPE2) {
-		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
-		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
-	} else {
+	switch (wdt->wdt_type) {
+	case MLX_WDT_TYPE1:
 		wdt->wdd.ops = &mlxreg_wdt_ops_type1;
 		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE1;
+		break;
+	case MLX_WDT_TYPE2:
+		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
+		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
+		break;
+	case MLX_WDT_TYPE3:
+		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
+		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE3;
+		break;
+	default:
+		break;
 	}
+
 	wdt->wdd.min_timeout = MLXREG_WDT_MIN_TIMEOUT;
 }
 
@@ -249,6 +297,11 @@ static int mlxreg_wdt_probe(struct platform_device *pdev)
 
 	wdt->wdd.parent = dev;
 	wdt->regmap = pdata->regmap;
+	rc = regmap_get_val_bytes(wdt->regmap);
+	if (rc <= 0)
+		return -EINVAL;
+
+	wdt->regmap_val_sz = rc;
 	mlxreg_wdt_config(wdt, pdata);
 
 	if ((pdata->features & MLXREG_CORE_WD_FEATURE_NOWAYOUT))
-- 
2.11.0


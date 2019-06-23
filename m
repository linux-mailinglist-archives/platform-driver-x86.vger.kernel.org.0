Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88934FB83
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfFWMQj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60394 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726429AbfFWMQj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:39 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:37 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1H001431;
        Sun, 23 Jun 2019 15:16:37 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 4/7] platform/x86: mlx-platform: Modify DMI matching order
Date:   Sun, 23 Jun 2019 12:16:27 +0000
Message-Id: <20190623121630.17945-5-vadimp@mellanox.com>
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

Modify DMI matching order: perform matching based on  DMI_BOARD_NAME
before matching based on DMI_BOARD_VENDOR and DMI_PRODUCT_NAME in order
to reduce the number of ‘dmi_table’ entries necessary for new systems
support and keep matching order in logical way.

For example, the existing check for DMI_PRODUCT_NAME with prefixes
“MSN27", “MSN24”, "MSB” matches systems MSN2700-BXXXX, MSN2700-XXXX,
MSN2410-BXXXX, MSB7800-XXXX, where ‘XXXX’ specifies some systems
hardware flavors.
At the same time these systems also matched by DMI_BOARD_NAME
“VMOD0001”, because they all have the same platform configuration (LED,
interrupt control, mux etcetera).
New systems with different platform configuration, but with similar
DMI_PRODUCT_NAME  MSN2700-2XXXX, MSN2700-2XXXX, MSB7800-2XXXX are about
to be added. These system have similar DMI_PRODUCT_NAME, since they
have same ports configuration as their predecessors. All new systems
will be matched by DMI_BOARD_NAME “VMOD0008”.
With the change provided in the patch it is enough just to add
“VMOD0008” match following natural after “VMOD0007”, otherwise
“VMOD0008” or all “MSN2700-2XXXX”, “MSN2700-2XXXX”, “MSB7800-2XXXX”
should be added on top of ‘mlxplat_dmi_table” in order to be matched
before “MSN27", “MSN24”, "MSB”.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 72 ++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 85f98db5a236..8ed84cf4b668 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1882,6 +1882,42 @@ static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
 
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
+		.callback = mlxplat_dmi_default_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0001"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_msn21xx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0002"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_msn274x_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0003"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_msn201x_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0004"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_qmb7xx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0005"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_qmb7xx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0007"),
+		},
+	},
+	{
 		.callback = mlxplat_dmi_msn274x_matched,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
@@ -1958,42 +1994,6 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "MSN38"),
 		},
 	},
-	{
-		.callback = mlxplat_dmi_default_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "VMOD0001"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_msn21xx_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "VMOD0002"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_msn274x_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "VMOD0003"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_msn201x_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "VMOD0004"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_qmb7xx_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "VMOD0005"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_qmb7xx_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "VMOD0007"),
-		},
-	},
 	{ }
 };
 
-- 
2.11.0


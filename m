Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02D65F52E
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Jul 2019 11:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbfGDJKP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Jul 2019 05:10:15 -0400
Received: from host-88-217-225-28.customer.m-online.net ([88.217.225.28]:20032
        "EHLO mail.dev.tdt.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727128AbfGDJKP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Jul 2019 05:10:15 -0400
X-Greylist: delayed 479 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Jul 2019 05:10:14 EDT
Received: from feckert01.dev.tdt.de (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id A92B02158E;
        Thu,  4 Jul 2019 09:02:27 +0000 (UTC)
From:   Florian Eckert <fe@dev.tdt.de>
To:     Eckert.Florian@googlemail.com, info@metux.net,
        dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH 1/3] platform/x86/pcengines-apuv2: add mpcie reset gpio export
Date:   Thu,  4 Jul 2019 11:02:03 +0200
Message-Id: <20190704090205.19400-2-fe@dev.tdt.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190704090205.19400-1-fe@dev.tdt.de>
References: <20190704090205.19400-1-fe@dev.tdt.de>
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On APUx we have also mpcie2/mpcie3 reset pins. To make it possible to reset
the ports from the userspace, add the definition to this platform
device. The gpio can then be exported by the legancy gpio subsystem to
toggle the mpcie reset pin.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/platform/x86/pcengines-apuv2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index c1ca931e1fab..f6d8ed100cab 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -32,6 +32,8 @@
 #define APU2_GPIO_REG_LED3		AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
 #define APU2_GPIO_REG_MODESW		AMD_FCH_GPIO_REG_GPIO32_GE1
 #define APU2_GPIO_REG_SIMSWAP		AMD_FCH_GPIO_REG_GPIO33_GE2
+#define APU2_GPIO_REG_MPCIE2		AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
+#define APU2_GPIO_REG_MPCIE3		AMD_FCH_GPIO_REG_GPIO51
 
 /* order in which the gpio lines are defined in the register list */
 #define APU2_GPIO_LINE_LED1		0
@@ -39,6 +41,8 @@
 #define APU2_GPIO_LINE_LED3		2
 #define APU2_GPIO_LINE_MODESW		3
 #define APU2_GPIO_LINE_SIMSWAP		4
+#define APU2_GPIO_LINE_MPCIE2		5
+#define APU2_GPIO_LINE_MPCIE3		6
 
 /* gpio device */
 
@@ -48,6 +52,8 @@ static int apu2_gpio_regs[] = {
 	[APU2_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
 	[APU2_GPIO_LINE_MODESW]		= APU2_GPIO_REG_MODESW,
 	[APU2_GPIO_LINE_SIMSWAP]	= APU2_GPIO_REG_SIMSWAP,
+	[APU2_GPIO_LINE_MPCIE2]		= APU2_GPIO_REG_MPCIE2,
+	[APU2_GPIO_LINE_MPCIE3]		= APU2_GPIO_REG_MPCIE3,
 };
 
 static const char * const apu2_gpio_names[] = {
@@ -56,6 +62,8 @@ static const char * const apu2_gpio_names[] = {
 	[APU2_GPIO_LINE_LED3]		= "front-led3",
 	[APU2_GPIO_LINE_MODESW]		= "front-button",
 	[APU2_GPIO_LINE_SIMSWAP]	= "simswap",
+	[APU2_GPIO_LINE_MPCIE2]		= "mpcie2_reset",
+	[APU2_GPIO_LINE_MPCIE3]		= "mpcie3_reset",
 };
 
 static const struct amd_fch_gpio_pdata board_apu2 = {
-- 
2.11.0


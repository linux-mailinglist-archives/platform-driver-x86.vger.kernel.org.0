Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74D765AD8B
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Jan 2023 07:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjABGzf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 2 Jan 2023 01:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjABGzc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Jan 2023 01:55:32 -0500
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [24.116.100.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49ECDBF4;
        Sun,  1 Jan 2023 22:55:31 -0800 (PST)
Received: from ubuntu22.redfish-solutions.com (ubuntu22.redfish-solutions.com [192.168.8.33])
        (authenticated bits=0)
        by mail.redfish-solutions.com (8.17.1/8.16.1) with ESMTPSA id 3026sme9589465
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Sun, 1 Jan 2023 23:54:48 -0700
From:   "Philip Prindeville" <philipp@redfish-solutions.com>
To:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>,
        Philip Prindeville <philipp@redfish-solutions.com>
Subject: [PATCH v3 1/1] x86: Support APU5 in PCEngines platform driver
Date:   Sun,  1 Jan 2023 23:54:47 -0700
Message-Id: <20230102065447.3447284-1-philipp@redfish-solutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.2 on 192.168.8.3
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Philip Prindeville <philipp@redfish-solutions.com>

PCEngines make a number of SBC. APU5 has 5 mpcie slots + MSATA.
It also has support for 3x LTE modems with 6x SIM slots (pairs with a
SIM switch device). Each mpcie slot for modems has a reset GPIO

To ensure that the naming is sane between APU2-6 the GPIOS are
renamed to be modem1-reset, modem2-reset, etc. This is significant
because the slots that can be reset change between APU2 and APU3/4

GPIO for simswap is moved to the end of the list as it could be dropped
for APU2 boards (but causes no harm to leave it in, hardware could be
added to a future rev of the board).

Structure of the GPIOs for APU5 is extremely similar to APU2-4, but
many lines are moved around and there are simply more
modems/resets/sim-swap lines to breakout.

Also added APU6, which is essentially APU4 with a different ethernet
interface and SFP cage on eth0.

Revision history:

v1: originally titled, "apu6: add apu6 variation to apu2 driver family"
this dealt only with detecting the APUv6, which is otherwise identical
to the v4 excepting the SFP cage on eth0.

v2: at Ed's request, merged with his previous pull-request titled
"x86: Support APU5 in PCEngines platform driver", and some cleanup
to that changeset (including dropping the table "apu5_driver_data"
which did not have a defined type "struct apu_driver_data"), but got
mistitled when the Subject of that commit got accidentally dropped.

v3: retitled to match Ed's previous pull-request.

Cc: platform-driver-x86@vger.kernel.org
Cc: linux-x86_64@vger.kernel.org
Reviewed-by: Andreas Eberlein <foodeas@aeberlein.de>
Reviewed-by: Paul Spooren <paul@spooren.de>
Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
Sighed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
---
 drivers/leds/leds-apu.c                |   2 +-
 drivers/platform/x86/Kconfig           |   4 +-
 drivers/platform/x86/pcengines-apuv2.c | 118 ++++++++++++++++++++++---
 3 files changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index c409b80c236d7182c79944225dd4b9e5d32f0a9f..fb3332863c36241e4b7f75f89213171ec0c0dd04 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -183,7 +183,7 @@ static int __init apu_led_init(void)
 
 	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
 	      (dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "apu1")))) {
-		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2\n");
+		pr_err("No PC Engines APUv1 board detected. For APUv2,3,4,5,6 support, enable CONFIG_PCENGINES_APU2\n");
 		return -ENODEV;
 	}
 
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2d26fed92785488ce1c6e88449c54c78..f930d5dd3efee11fbad4ad9508eb288bb4181bab 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -698,7 +698,7 @@ config XO1_RFKILL
 	  laptop.
 
 config PCENGINES_APU2
-	tristate "PC Engines APUv2/3 front button and LEDs driver"
+	tristate "PC Engines APUv2/3/4/5/6 front button and LEDs driver"
 	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
 	depends on LEDS_CLASS
 	select GPIO_AMD_FCH
@@ -706,7 +706,7 @@ config PCENGINES_APU2
 	select LEDS_GPIO
 	help
 	  This driver provides support for the front button and LEDs on
-	  PC Engines APUv2/APUv3 board.
+	  PC Engines APUv2/APUv3/APUv4/APUv5/APUv6 board.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called pcengines-apuv2.
diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index d063d91db9bcbe5ceb2ac641d3105df37651ac4d..bd58d5294f0146088d435f1c9df83eb218b67b0c 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 /*
- * PC-Engines APUv2/APUv3 board platform driver
+ * PC-Engines APUv2-6 board platform driver
  * for GPIO buttons and LEDs
  *
  * Copyright (C) 2018 metux IT consult
+ * Copyright (C) 2022 Ed Wildgoose <lists@wildgooses.com>
+ * Copyright (C) 2022 Philip Prindeville <philipp@redfish-solutions.com>
  * Author: Enrico Weigelt <info@metux.net>
  */
 
@@ -22,38 +24,70 @@
 #include <linux/platform_data/gpio/gpio-amd-fch.h>
 
 /*
- * NOTE: this driver only supports APUv2/3 - not APUv1, as this one
+ * NOTE: this driver only supports APUv2-6 - not APUv1, as this one
  * has completely different register layouts.
  */
 
+/*
+ * There are a number of APU variants, with differing features
+ * APU2 has SIM slots 1/2 mapping to mPCIe sockets 1/2
+ * APU3/4 moved SIM slot 1 to mPCIe socket 3, ie logically reversed
+ * However, most APU3/4 have a SIM switch which we default on to reverse
+ * the order and keep physical SIM order matching physical modem order
+ * APU6 is approximately the same as APU4 with different ethernet layout
+ *
+ * APU5 has 3x SIM sockets, all with a SIM switch
+ * several GPIOs are shuffled (see schematic), including MODESW
+ */
+
 /* Register mappings */
 #define APU2_GPIO_REG_LED1		AMD_FCH_GPIO_REG_GPIO57
 #define APU2_GPIO_REG_LED2		AMD_FCH_GPIO_REG_GPIO58
 #define APU2_GPIO_REG_LED3		AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
 #define APU2_GPIO_REG_MODESW		AMD_FCH_GPIO_REG_GPIO32_GE1
 #define APU2_GPIO_REG_SIMSWAP		AMD_FCH_GPIO_REG_GPIO33_GE2
-#define APU2_GPIO_REG_MPCIE2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
-#define APU2_GPIO_REG_MPCIE3		AMD_FCH_GPIO_REG_GPIO51
+#define APU2_GPIO_REG_RESETM1		AMD_FCH_GPIO_REG_GPIO51
+#define APU2_GPIO_REG_RESETM2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
+
+#define APU5_GPIO_REG_MODESW		AMT_FCH_GPIO_REG_GEVT22
+#define APU5_GPIO_REG_SIMSWAP1		AMD_FCH_GPIO_REG_GPIO68
+#define APU5_GPIO_REG_SIMSWAP2		AMD_FCH_GPIO_REG_GPIO32_GE1
+#define APU5_GPIO_REG_SIMSWAP3		AMD_FCH_GPIO_REG_GPIO33_GE2
+#define APU5_GPIO_REG_RESETM1		AMD_FCH_GPIO_REG_GPIO51
+#define APU5_GPIO_REG_RESETM2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
+#define APU5_GPIO_REG_RESETM3		AMD_FCH_GPIO_REG_GPIO64
 
 /* Order in which the GPIO lines are defined in the register list */
 #define APU2_GPIO_LINE_LED1		0
 #define APU2_GPIO_LINE_LED2		1
 #define APU2_GPIO_LINE_LED3		2
 #define APU2_GPIO_LINE_MODESW		3
-#define APU2_GPIO_LINE_SIMSWAP		4
-#define APU2_GPIO_LINE_MPCIE2		5
-#define APU2_GPIO_LINE_MPCIE3		6
+#define APU2_GPIO_LINE_RESETM1		4
+#define APU2_GPIO_LINE_RESETM2		5
+#define APU2_GPIO_LINE_SIMSWAP		6
+
+#define APU5_GPIO_LINE_LED1		0
+#define APU5_GPIO_LINE_LED2		1
+#define APU5_GPIO_LINE_LED3		2
+#define APU5_GPIO_LINE_MODESW		3
+#define APU5_GPIO_LINE_RESETM1		4
+#define APU5_GPIO_LINE_RESETM2		5
+#define APU5_GPIO_LINE_RESETM3		6
+#define APU5_GPIO_LINE_SIMSWAP1		7
+#define APU5_GPIO_LINE_SIMSWAP2		8
+#define APU5_GPIO_LINE_SIMSWAP3		9
 
-/* GPIO device */
+
+/* GPIO device - APU2/3/4/6 */
 
 static int apu2_gpio_regs[] = {
 	[APU2_GPIO_LINE_LED1]		= APU2_GPIO_REG_LED1,
 	[APU2_GPIO_LINE_LED2]		= APU2_GPIO_REG_LED2,
 	[APU2_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
 	[APU2_GPIO_LINE_MODESW]		= APU2_GPIO_REG_MODESW,
+	[APU2_GPIO_LINE_RESETM1]	= APU2_GPIO_REG_RESETM1,
+	[APU2_GPIO_LINE_RESETM2]	= APU2_GPIO_REG_RESETM2,
 	[APU2_GPIO_LINE_SIMSWAP]	= APU2_GPIO_REG_SIMSWAP,
-	[APU2_GPIO_LINE_MPCIE2]		= APU2_GPIO_REG_MPCIE2,
-	[APU2_GPIO_LINE_MPCIE3]		= APU2_GPIO_REG_MPCIE3,
 };
 
 static const char * const apu2_gpio_names[] = {
@@ -61,9 +95,9 @@ static const char * const apu2_gpio_names[] = {
 	[APU2_GPIO_LINE_LED2]		= "front-led2",
 	[APU2_GPIO_LINE_LED3]		= "front-led3",
 	[APU2_GPIO_LINE_MODESW]		= "front-button",
+	[APU2_GPIO_LINE_RESETM1]	= "modem1-reset",
+	[APU2_GPIO_LINE_RESETM2]	= "modem2-reset",
 	[APU2_GPIO_LINE_SIMSWAP]	= "simswap",
-	[APU2_GPIO_LINE_MPCIE2]		= "mpcie2_reset",
-	[APU2_GPIO_LINE_MPCIE3]		= "mpcie3_reset",
 };
 
 static const struct amd_fch_gpio_pdata board_apu2 = {
@@ -72,6 +106,40 @@ static const struct amd_fch_gpio_pdata board_apu2 = {
 	.gpio_names	= apu2_gpio_names,
 };
 
+/* GPIO device - APU5 */
+
+static int apu5_gpio_regs[] = {
+	[APU5_GPIO_LINE_LED1]		= APU2_GPIO_REG_LED1,
+	[APU5_GPIO_LINE_LED2]		= APU2_GPIO_REG_LED2,
+	[APU5_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
+	[APU5_GPIO_LINE_MODESW]		= APU5_GPIO_REG_MODESW,
+	[APU5_GPIO_LINE_RESETM1]	= APU5_GPIO_REG_RESETM1,
+	[APU5_GPIO_LINE_RESETM2]	= APU5_GPIO_REG_RESETM2,
+	[APU5_GPIO_LINE_RESETM3]	= APU5_GPIO_REG_RESETM3,
+	[APU5_GPIO_LINE_SIMSWAP1]	= APU5_GPIO_REG_SIMSWAP1,
+	[APU5_GPIO_LINE_SIMSWAP2]	= APU5_GPIO_REG_SIMSWAP2,
+	[APU5_GPIO_LINE_SIMSWAP3]	= APU5_GPIO_REG_SIMSWAP3,
+};
+
+static const char * const apu5_gpio_names[] = {
+	[APU5_GPIO_LINE_LED1]		= "front-led1",
+	[APU5_GPIO_LINE_LED2]		= "front-led2",
+	[APU5_GPIO_LINE_LED3]		= "front-led3",
+	[APU5_GPIO_LINE_MODESW]		= "front-button",
+	[APU5_GPIO_LINE_RESETM1]	= "modem1-reset",
+	[APU5_GPIO_LINE_RESETM2]	= "modem2-reset",
+	[APU5_GPIO_LINE_RESETM3]	= "modem3-reset",
+	[APU5_GPIO_LINE_SIMSWAP1]	= "simswap1",
+	[APU5_GPIO_LINE_SIMSWAP2]	= "simswap2",
+	[APU5_GPIO_LINE_SIMSWAP3]	= "simswap3",
+};
+
+static const struct amd_fch_gpio_pdata board_apu5 = {
+	.gpio_num	= ARRAY_SIZE(apu5_gpio_regs),
+	.gpio_reg	= apu5_gpio_regs,
+	.gpio_names	= apu5_gpio_names,
+};
+
 /* GPIO LEDs device */
 
 static const struct gpio_led apu2_leds[] = {
@@ -215,6 +283,24 @@ static const struct dmi_system_id apu_gpio_dmi_table[] __initconst = {
 		},
 		.driver_data = (void *)&board_apu2,
 	},
+	/* APU5 w/ mainline BIOS */
+	{
+		.ident		= "apu5",
+		.matches	= {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "apu5")
+		},
+		.driver_data	= (void *)&board_apu5,
+	},
+	/* APU6 w/ mainline BIOS */
+	{
+		.ident		= "apu6",
+		.matches	= {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "apu6")
+		},
+		.driver_data	= (void *)&board_apu2,
+	},
 	{}
 };
 
@@ -249,7 +335,7 @@ static int __init apu_board_init(void)
 
 	id = dmi_first_match(apu_gpio_dmi_table);
 	if (!id) {
-		pr_err("failed to detect APU board via DMI\n");
+		pr_err("No APU board detected via DMI\n");
 		return -ENODEV;
 	}
 
@@ -288,8 +374,12 @@ module_init(apu_board_init);
 module_exit(apu_board_exit);
 
 MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
-MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
+MODULE_DESCRIPTION("PC Engines APUv2-6 board GPIO/LEDs/keys driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
 MODULE_ALIAS("platform:pcengines-apuv2");
+MODULE_ALIAS("platform:pcengines-apuv3");
+MODULE_ALIAS("platform:pcengines-apuv4");
+MODULE_ALIAS("platform:pcengines-apuv5");
+MODULE_ALIAS("platform:pcengines-apuv6");
 MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");
-- 
2.34.1


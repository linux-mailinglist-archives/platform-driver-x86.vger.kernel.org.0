Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF236F2D40
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 May 2023 05:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjEADKS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 Apr 2023 23:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbjEADIn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Apr 2023 23:08:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2712040E3;
        Sun, 30 Apr 2023 20:03:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E56AA616FF;
        Mon,  1 May 2023 03:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996AEC4339C;
        Mon,  1 May 2023 03:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682910165;
        bh=L9RiWcJlA2GFiGc23JrxFy8v50OAKLtoaf8vKF7eeJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DQ/fIYxH1ix2KQEkRDmYPY5yM0SyzulrjkiN8UOhomEUwR9tWAwCFS/o58Gze0T1s
         6N2OSMNfgSL4keqjix0gUhM4RJJnSMBvRrQ4qIZ28x5hvOp+w4xMcdwmUzQ/CIyEJf
         dJ6Pl5dpGvSQXNIczRdyHaH00/ynmBrxto3X/Rem+fWz3oXJc26J9OOj3ln4YI1a4l
         lqr5OmMCUlRCPQCnt0yh/ZYeMzxew5IqwS+Ug7aJjxYNu6oWP7z52wRlUMmO29WhLI
         qnMEqadftqMRhhMXIDgM7Vo8hY7CAibEWTRfISEZBOV23LnUBei1e4luQAwccac7ox
         wDa/DnOq0xw3Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sasha Levin <sashal@kernel.org>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 04/33] platform/x86: x86-android-tablets: Add Acer Iconia One 7 B1-750 data
Date:   Sun, 30 Apr 2023 23:01:58 -0400
Message-Id: <20230501030227.3254266-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501030227.3254266-1-sashal@kernel.org>
References: <20230501030227.3254266-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 2f0cf1e85ddb5ae17284050dc1adafb89e4f1d8f ]

The Acer Iconia One 7 B1-750 is a x86 ACPI tablet which ships with Android
x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not
actually there, causing various resource conflicts. Enumeration of these
is skipped through the acpi_quirk_skip_i2c_client_enumeration().

Add support for manually instantiating the I2C + other devices which are
actually present on this tablet by adding the necessary device info to
the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Link: https://lore.kernel.org/r/20230301092331.7038-2-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/x86-android-tablets.c | 101 +++++++++++++++++++--
 1 file changed, 91 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 123a4618db55f..9178076d9d7da 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -265,6 +265,88 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
+static struct gpiod_lookup_table int3496_reference_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 15, "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+/* Acer Iconia One 7 B1-750 has an Android factory img with everything hardcoded */
+static const char * const acer_b1_750_mount_matrix[] = {
+	"-1", "0", "0",
+	"0", "1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry acer_b1_750_bma250e_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", acer_b1_750_mount_matrix),
+	{ }
+};
+
+static const struct software_node acer_b1_750_bma250e_node = {
+	.properties = acer_b1_750_bma250e_props,
+};
+
+static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst = {
+	{
+		/* Novatek NVT-ts touchscreen */
+		.board_info = {
+			.type = "NVT-ts",
+			.addr = 0x34,
+			.dev_name = "NVT-ts",
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 3,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	}, {
+		/* BMA250E accelerometer */
+		.board_info = {
+			.type = "bma250e",
+			.addr = 0x18,
+			.swnode = &acer_b1_750_bma250e_node,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 25,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	},
+};
+
+static struct gpiod_lookup_table acer_b1_750_goodix_gpios = {
+	.dev_id = "i2c-NVT-ts",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
+	&acer_b1_750_goodix_gpios,
+	&int3496_reference_gpios,
+	NULL
+};
+
+static const struct x86_dev_info acer_b1_750_info __initconst = {
+	.i2c_client_info = acer_b1_750_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.gpiod_lookup_tables = acer_b1_750_gpios,
+};
+
 /*
  * Advantech MICA-071
  * This is a standard Windows tablet, but it has an extra "quick launch" button
@@ -1298,17 +1380,8 @@ static const struct x86_i2c_client_info nextbook_ares8_i2c_clients[] __initconst
 	},
 };
 
-static struct gpiod_lookup_table nextbook_ares8_int3496_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table * const nextbook_ares8_gpios[] = {
-	&nextbook_ares8_int3496_gpios,
+	&int3496_reference_gpios,
 	NULL
 };
 
@@ -1435,6 +1508,14 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 };
 
 static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Acer Iconia One 7 B1-750 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
+		},
+		.driver_data = (void *)&acer_b1_750_info,
+	},
 	{
 		/* Advantech MICA-071 */
 		.matches = {
-- 
2.39.2


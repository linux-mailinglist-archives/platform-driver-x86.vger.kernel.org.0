Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1158C69D636
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Feb 2023 23:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbjBTWNO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Feb 2023 17:13:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbjBTWNN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 17:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5480F1E280
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 14:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676931148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6Usd3s6Lao8WuFKMO+XOf44ZFSAu8HX6pOWf1ftPx8=;
        b=hWig0mIIVw+wJ/jMJj3JZJLfSu3C017a4Wa8x5l6b82JAQECLc/y9XQmAd6+hrsMNcFhCK
        ypMXex+dZDrOp4NnF77TQoYgoM/YvpUjfulDjH0mg38tApbG5/QsCIGu7kBQ6yDFRHZKpK
        CDu0owwtgxBdpWla1IXJfgPT1ofd8dM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-FtXai-nYOGqwKbtulAdyxg-1; Mon, 20 Feb 2023 17:12:24 -0500
X-MC-Unique: FtXai-nYOGqwKbtulAdyxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D06285A5A3;
        Mon, 20 Feb 2023 22:12:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6831A140EBF6;
        Mon, 20 Feb 2023 22:12:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/9] platform/x86: x86-android-tablets: Move DMI match table into its own dmi.c file
Date:   Mon, 20 Feb 2023 23:12:06 +0100
Message-Id: <20230220221212.196009-4-hdegoede@redhat.com>
In-Reply-To: <20230220221212.196009-1-hdegoede@redhat.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In order to have a single MODULE_DEVICE_TABLE(dmi, ...), while allowing
splitting the board descriptions into multiple files, add a new separate
file for the DMI match table.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../platform/x86/x86-android-tablets/dmi.c    | 166 ++++++++++++++++++
 .../x86-android-tablets-main.c                | 160 ++---------------
 3 files changed, 180 insertions(+), 148 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/dmi.c

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 49c6bda1f817..ba16dc014e03 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
-x86-android-tablets-y := core.o x86-android-tablets-main.o
+x86-android-tablets-y := core.o dmi.o x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
new file mode 100644
index 000000000000..ec7c0af8d73d
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DMI based code to deal with broken DSDTs on X86 tablets which ship with
+ * Android as (part of) the factory image. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/dmi.h>
+#include <linux/mod_devicetable.h>
+
+#include "x86-android-tablets.h"
+
+/*
+ * In order to have a single MODULE_DEVICE_TABLE(dmi, ...), while allowing
+ * splitting the board descriptions into multiple files, add extern declarations
+ * of the x86_dev_info structs here.
+ */
+extern const struct x86_dev_info acer_b1_750_info;
+extern const struct x86_dev_info advantech_mica_071_info;
+extern const struct x86_dev_info asus_me176c_info;
+extern const struct x86_dev_info asus_tf103c_info;
+extern const struct x86_dev_info chuwi_hi8_info;
+extern const struct x86_dev_info czc_p10t;
+extern const struct x86_dev_info lenovo_yogabook_x9x_info;
+/* Not const as this gets modified by its init callback */
+extern struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
+extern const struct x86_dev_info lenovo_yt3_info;
+extern const struct x86_dev_info medion_lifetab_s10346_info;
+extern const struct x86_dev_info nextbook_ares8_info;
+extern const struct x86_dev_info whitelabel_tm800a550l_info;
+extern const struct x86_dev_info xiaomi_mipad2_info;
+
+const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Acer Iconia One 7 B1-750 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
+		},
+		.driver_data = (void *)&acer_b1_750_info,
+	},
+	{
+		/* Advantech MICA-071 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
+		},
+		.driver_data = (void *)&advantech_mica_071_info,
+	},
+	{
+		/* Asus MeMO Pad 7 ME176C */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ME176C"),
+		},
+		.driver_data = (void *)&asus_me176c_info,
+	},
+	{
+		/* Asus TF103C */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
+		},
+		.driver_data = (void *)&asus_tf103c_info,
+	},
+	{
+		/* Chuwi Hi8 (CWI509) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-PA03C"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ilife"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S806"),
+		},
+		.driver_data = (void *)&chuwi_hi8_info,
+	},
+	{
+		/* CZC P10T */
+		.ident = "CZC ODEON TPC-10 (\"P10T\")",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "CZC"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ODEON*TPC-10"),
+		},
+		.driver_data = (void *)&czc_p10t,
+	},
+	{
+		/* CZC P10T variant */
+		.ident = "ViewSonic ViewPad 10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ViewSonic"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VPAD10"),
+		},
+		.driver_data = (void *)&czc_p10t,
+	},
+	{
+		/* Lenovo Yoga Book X90F / X91F / X91L */
+		.matches = {
+			/* Non exact match to match all versions */
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
+		},
+		.driver_data = (void *)&lenovo_yogabook_x9x_info,
+	},
+	{
+		/*
+		 * Lenovo Yoga Tablet 2 830F/L or 1050F/L (The 8" and 10"
+		 * Lenovo Yoga Tablet 2 use the same mainboard)
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
+			/* Partial match on beginning of BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
+		},
+		.driver_data = (void *)&lenovo_yoga_tab2_830_1050_info,
+	},
+	{
+		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+		.driver_data = (void *)&lenovo_yt3_info,
+	},
+	{
+		/* Medion Lifetab S10346 */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are much too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "10/22/2015"),
+		},
+		.driver_data = (void *)&medion_lifetab_s10346_info,
+	},
+	{
+		/* Nextbook Ares 8 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M890BAP"),
+		},
+		.driver_data = (void *)&nextbook_ares8_info,
+	},
+	{
+		/* Whitelabel (sold as various brands) TM800A550L */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
+		},
+		.driver_data = (void *)&whitelabel_tm800a550l_info,
+	},
+	{
+		/* Xiaomi Mi Pad 2 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
+		},
+		.driver_data = (void *)&xiaomi_mipad2_info,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
index 05e862756953..4914b43eb4cd 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -11,11 +11,9 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/dmi.h>
 #include <linux/efi.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
-#include <linux/mod_devicetable.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/platform_data/lp855x.h>
@@ -181,7 +179,7 @@ static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info acer_b1_750_info __initconst = {
+const struct x86_dev_info acer_b1_750_info __initconst = {
 	.i2c_client_info = acer_b1_750_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
 	.pdev_info = int3496_pdevs,
@@ -233,7 +231,7 @@ static int __init advantech_mica_071_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info advantech_mica_071_info __initconst = {
+const struct x86_dev_info advantech_mica_071_info __initconst = {
 	.pdev_info = advantech_mica_071_pdevs,
 	.pdev_count = ARRAY_SIZE(advantech_mica_071_pdevs),
 	.init = advantech_mica_071_init,
@@ -414,7 +412,7 @@ static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info asus_me176c_info __initconst = {
+const struct x86_dev_info asus_me176c_info __initconst = {
 	.i2c_client_info = asus_me176c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
 	.pdev_info = asus_me176c_tf103c_pdevs,
@@ -559,7 +557,7 @@ static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info asus_tf103c_info __initconst = {
+const struct x86_dev_info asus_tf103c_info __initconst = {
 	.i2c_client_info = asus_tf103c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
 	.pdev_info = asus_me176c_tf103c_pdevs,
@@ -650,7 +648,7 @@ static int __init chuwi_hi8_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info chuwi_hi8_info __initconst = {
+const struct x86_dev_info chuwi_hi8_info __initconst = {
 	.i2c_client_info = chuwi_hi8_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(chuwi_hi8_i2c_clients),
 	.init = chuwi_hi8_init,
@@ -685,7 +683,7 @@ static int __init czc_p10t_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info czc_p10t __initconst = {
+const struct x86_dev_info czc_p10t __initconst = {
 	.init = czc_p10t_init,
 };
 
@@ -703,7 +701,7 @@ static const struct x86_i2c_client_info lenovo_yogabook_x9x_i2c_clients[] __init
 	},
 };
 
-static const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
+const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x9x_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x9x_i2c_clients),
 };
@@ -814,7 +812,7 @@ static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
 static int __init lenovo_yoga_tab2_830_1050_init(void);
 static void lenovo_yoga_tab2_830_1050_exit(void);
 
-static struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
+struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
 	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
 	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
 	.pdev_info = int3496_pdevs,
@@ -1079,7 +1077,7 @@ static int __init lenovo_yt3_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info lenovo_yt3_info __initconst = {
+const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_info = lenovo_yt3_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
 	.init = lenovo_yt3_init,
@@ -1161,7 +1159,7 @@ static struct gpiod_lookup_table * const medion_lifetab_s10346_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info medion_lifetab_s10346_info __initconst = {
+const struct x86_dev_info medion_lifetab_s10346_info __initconst = {
 	.i2c_client_info = medion_lifetab_s10346_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(medion_lifetab_s10346_i2c_clients),
 	.gpiod_lookup_tables = medion_lifetab_s10346_gpios,
@@ -1227,7 +1225,7 @@ static struct gpiod_lookup_table * const nextbook_ares8_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info nextbook_ares8_info __initconst = {
+const struct x86_dev_info nextbook_ares8_info __initconst = {
 	.i2c_client_info = nextbook_ares8_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(nextbook_ares8_i2c_clients),
 	.pdev_info = int3496_pdevs,
@@ -1310,7 +1308,7 @@ static struct gpiod_lookup_table * const whitelabel_tm800a550l_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
+const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 	.i2c_client_info = whitelabel_tm800a550l_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(whitelabel_tm800a550l_i2c_clients),
 	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
@@ -1344,139 +1342,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
 	},
 };
 
-static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
+const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 	.i2c_client_info = xiaomi_mipad2_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
 };
-
-const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
-	{
-		/* Acer Iconia One 7 B1-750 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
-		},
-		.driver_data = (void *)&acer_b1_750_info,
-	},
-	{
-		/* Advantech MICA-071 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
-		},
-		.driver_data = (void *)&advantech_mica_071_info,
-	},
-	{
-		/* Asus MeMO Pad 7 ME176C */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ME176C"),
-		},
-		.driver_data = (void *)&asus_me176c_info,
-	},
-	{
-		/* Asus TF103C */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
-		},
-		.driver_data = (void *)&asus_tf103c_info,
-	},
-	{
-		/* Chuwi Hi8 (CWI509) */
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-			DMI_MATCH(DMI_BOARD_NAME, "BYT-PA03C"),
-			DMI_MATCH(DMI_SYS_VENDOR, "ilife"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "S806"),
-		},
-		.driver_data = (void *)&chuwi_hi8_info,
-	},
-	{
-		/* CZC P10T */
-		.ident = "CZC ODEON TPC-10 (\"P10T\")",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "CZC"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ODEON*TPC-10"),
-		},
-		.driver_data = (void *)&czc_p10t,
-	},
-	{
-		/* CZC P10T variant */
-		.ident = "ViewSonic ViewPad 10",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ViewSonic"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VPAD10"),
-		},
-		.driver_data = (void *)&czc_p10t,
-	},
-	{
-		/* Lenovo Yoga Book X90F / X91F / X91L */
-		.matches = {
-			/* Non exact match to match all versions */
-			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
-		},
-		.driver_data = (void *)&lenovo_yogabook_x9x_info,
-	},
-	{
-		/*
-		 * Lenovo Yoga Tablet 2 830F/L or 1050F/L (The 8" and 10"
-		 * Lenovo Yoga Tablet 2 use the same mainboard)
-		 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
-			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
-			/* Partial match on beginning of BIOS version */
-			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
-		},
-		.driver_data = (void *)&lenovo_yoga_tab2_830_1050_info,
-	},
-	{
-		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
-		},
-		.driver_data = (void *)&lenovo_yt3_info,
-	},
-	{
-		/* Medion Lifetab S10346 */
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
-			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
-			/* Above strings are much too generic, also match on BIOS date */
-			DMI_MATCH(DMI_BIOS_DATE, "10/22/2015"),
-		},
-		.driver_data = (void *)&medion_lifetab_s10346_info,
-	},
-	{
-		/* Nextbook Ares 8 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "M890BAP"),
-		},
-		.driver_data = (void *)&nextbook_ares8_info,
-	},
-	{
-		/* Whitelabel (sold as various brands) TM800A550L */
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
-			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
-			/* Above strings are too generic, also match on BIOS version */
-			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
-		},
-		.driver_data = (void *)&whitelabel_tm800a550l_info,
-	},
-	{
-		/* Xiaomi Mi Pad 2 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
-		},
-		.driver_data = (void *)&xiaomi_mipad2_info,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
-- 
2.39.1


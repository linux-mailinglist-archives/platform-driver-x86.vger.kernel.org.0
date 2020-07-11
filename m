Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA0721C363
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Jul 2020 11:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgGKJn1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Jul 2020 05:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgGKJn1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Jul 2020 05:43:27 -0400
Received: from mail.bin-co.de (mail.bin-co.de [IPv6:2a02:c207:3002:169::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE25C08C5DD
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 02:43:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id DE8414443DAB;
        Sat, 11 Jul 2020 11:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594460604;
        bh=u/a9pwHk3qMAQCByWezfb6S7UYK1h2I9KJQiBLOzVUU=;
        h=From:To:Cc:Subject:Date:From;
        b=cwNrclHBXhSDCYsjZGStyMyJb9TJmGxtKs3Ybh7+iBJV+KZP0TPHBS+IVo1ff3RC0
         VKVBFE11QmbsFeya7w+YOEo4xZufM+TcNe+igLZejcaiP1FZ8c+q0EoLtzNoAsq/cr
         wsPk0UpRHxA/zHtUtmP2GCYaz/gksRNSfokBXjZHjKL285KdaUOw6afPRkG7YLHpFY
         J3zLaAvKrDqIcqOPOIBR/MVMOss4ypMF3EMF0RZ9tq/NYHmTNC49MJIY64tkqh6mUn
         c+00zJ51qr0w+CVlghiWi6/DP6dhYhsTP5gI+EwvcW5nzLxrmxVp3q6MmpTJhqWvW1
         WNbIAXNbXUWqg==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j9R0P57QKhOw; Sat, 11 Jul 2020 11:43:24 +0200 (CEST)
Received: from DeepBlue.zlan.intra (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id 2D7294442DBA;
        Sat, 11 Jul 2020 11:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594460604;
        bh=u/a9pwHk3qMAQCByWezfb6S7UYK1h2I9KJQiBLOzVUU=;
        h=From:To:Cc:Subject:Date:From;
        b=cwNrclHBXhSDCYsjZGStyMyJb9TJmGxtKs3Ybh7+iBJV+KZP0TPHBS+IVo1ff3RC0
         VKVBFE11QmbsFeya7w+YOEo4xZufM+TcNe+igLZejcaiP1FZ8c+q0EoLtzNoAsq/cr
         wsPk0UpRHxA/zHtUtmP2GCYaz/gksRNSfokBXjZHjKL285KdaUOw6afPRkG7YLHpFY
         J3zLaAvKrDqIcqOPOIBR/MVMOss4ypMF3EMF0RZ9tq/NYHmTNC49MJIY64tkqh6mUn
         c+00zJ51qr0w+CVlghiWi6/DP6dhYhsTP5gI+EwvcW5nzLxrmxVp3q6MmpTJhqWvW1
         WNbIAXNbXUWqg==
From:   Armas Spann <zappel@retarded.farm>
To:     platform-driver-x86@vger.kernel.org
Cc:     andy.shevchenko@gmail.com, corentin.chary@gmail.com,
        Armas Spann <zappel@retarded.farm>
Subject: [PATCH v3] Added device support for the new ASUS ROG Zephyrus G14 (GA401I) and G15 (GA502I) series.
Date:   Sat, 11 Jul 2020 11:43:21 +0200
Message-Id: <20200711094321.6615-1-zappel@retarded.farm>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is accomplished by two new quirk_entry structs (one for each series),
as well as all current available G401I/G502I DMI_PRODUCT_NAMES to match
the corresponding devices.

Signed-off-by: Armas Spann <zappel@retarded.farm>
---
 asus-nb-wmi: add support for ASUS ROG Zephyrus G14 (GA401I) and G15 (GA502I)

 drivers/platform/x86/asus-nb-wmi.c | 82 ++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 8c4d00482ef0..2794b840fc29 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -110,6 +110,16 @@ static struct quirk_entry quirk_asus_forceals = {
 	.wmi_force_als_set = true,
 };
 
+static struct quirk_entry quirk_asus_ga401i = {
+	.wmi_backlight_power = true,
+	.wmi_backlight_set_devstate = true,
+};
+
+static struct quirk_entry quirk_asus_ga502i = {
+	.wmi_backlight_power = true,
+	.wmi_backlight_set_devstate = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -411,6 +421,78 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_forceals,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401IH",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
+		},
+		.driver_data = &quirk_asus_ga401i,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401II",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
+		},
+	   .driver_data = &quirk_asus_ga401i,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401IU",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
+		},
+		.driver_data = &quirk_asus_ga401i,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401IV",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
+		},
+		.driver_data = &quirk_asus_ga401i,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401IVC",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
+		},
+		.driver_data = &quirk_asus_ga401i,
+	},
+		{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA502II",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
+		},
+	   .driver_data = &quirk_asus_ga502i,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA502IU",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
+		},
+		.driver_data = &quirk_asus_ga502i,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA502IV",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
+		},
+		.driver_data = &quirk_asus_ga502i,
+	},
 	{},
 };
 
-- 
2.27.0


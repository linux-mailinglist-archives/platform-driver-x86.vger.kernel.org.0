Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E13323550C
	for <lists+platform-driver-x86@lfdr.de>; Sun,  2 Aug 2020 06:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgHBERd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 2 Aug 2020 00:17:33 -0400
Received: from mail.bin-co.de ([173.212.200.19]:33208 "EHLO mail.bin-co.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbgHBERd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Aug 2020 00:17:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id 26BFB4444648;
        Sun,  2 Aug 2020 06:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596341850;
        bh=pkV2J+bkWiEGxXTX9Hjgk3ZFAKvfhp8wNg6N7/mrOwU=;
        h=From:To:Cc:Subject:Date:From;
        b=p2pEg2Zj6RMtS93cNBap5zBROIIWgVQVP/htLtk+I7BTFtuimRzGB8lDmQP2MH0Wq
         X+9QTZspcednJwTfdnOtG84+AlnDEmgFa/DZxpJsvyfH1R/WW9Vpjz695nWUmY3QF9
         NRRUuAIe2SaEfVfw8lz1FVn5Cd9WZ049Qzckw8zh1wZ1maZZ63GVj0xhMRfqarrWVL
         FWYUzoziVcVjClazdh3j8l2liEngOMCUmlpPs+8khiWoP6XDI9iQw2axImh9PgkBT7
         nie/gkHyeYY20PbY9fVZo1o0D6F/sYedmBxiMZnDuHHb4x0eTCts+lALM4aNeKx116
         5byErnew1MIUA==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nr9Z52oB2_d7; Sun,  2 Aug 2020 06:17:29 +0200 (CEST)
Received: from DeepBlue.zlan.intra (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id E6DBC4444647;
        Sun,  2 Aug 2020 06:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596341849;
        bh=pkV2J+bkWiEGxXTX9Hjgk3ZFAKvfhp8wNg6N7/mrOwU=;
        h=From:To:Cc:Subject:Date:From;
        b=N8X84rM1S+WNpoMeQZCnB47ILTFRdOyGJMhizH858eg9qJk8UIGTLOwj9zXw85r+0
         iZTy9qiJJYL5Kf+B53RbKMaPTB6wvnHiaB5YRB5x8zSoEeoOecNmpuvHrSxi0Un8Co
         gt+iA6N3qW1l1rD8Ho7vB7RLcAIcCQ4lujbEKkaDZQNfeHZXwUyIauVBttHrcTfZYx
         ViMIL+m4N7bGTBgekrXvhP/q00qCaJZA5FTwnStB9YAsSk6Bniufr7M+gH4GpaxfEH
         25cILYBCp27L2zI5aefJjm6WXIaTIAIFNOfKDCB1o3meXSh0ytXVcmka2snLJ5wVGK
         ilFoO8p80nmMw==
From:   Armas Spann <zappel@retarded.farm>
To:     platform-driver-x86@vger.kernel.org
Cc:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org,
        Armas Spann <zappel@retarded.farm>
Subject: [PATCH v5] asus-nb-wmi: add support for ASUS ROG Zephyrus G14 (GA401) and G15 (GA502)
Date:   Sun,  2 Aug 2020 06:17:05 +0200
Message-Id: <20200802041705.79870-1-zappel@retarded.farm>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


This patch adds the ASUS ROG Zephyrus G14/15 notebook series detection to
asus-nb-wmi. The detection itself is accomplished by adding two new quirk_entry
structs (one for each series), as well as all current available G401/G502
DMI_PRODUCT_NAMES to match the corresponding devices.

patch-changelog:
v1: initial G401 patches
v2: --
v3: re-initial GA401 and GA502 and setting description
v4: corrected typo(s) added GA502DU series
v5: corrected signed-off position in patch - sorry

Signed-off-by: Armas Spann <zappel@retarded.farm>
---
 drivers/platform/x86/asus-nb-wmi.c | 91 ++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 8c4d00482ef0..1b85cd8433aa 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -110,6 +110,16 @@ static struct quirk_entry quirk_asus_forceals = {
 	.wmi_force_als_set = true,
 };
 
+static struct quirk_entry quirk_asus_ga401 = {
+	.wmi_backlight_power = true,
+	.wmi_backlight_set_devstate = true,
+};
+
+static struct quirk_entry quirk_asus_ga502 = {
+	.wmi_backlight_power = true,
+	.wmi_backlight_set_devstate = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -411,6 +421,87 @@ static const struct dmi_system_id asus_quirks[] = {
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
+		.driver_data = &quirk_asus_ga401,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401II",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
+		},
+		.driver_data = &quirk_asus_ga401,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401IU",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
+		},
+		.driver_data = &quirk_asus_ga401,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401IV",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
+		},
+		.driver_data = &quirk_asus_ga401,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA401IVC",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
+		},
+		.driver_data = &quirk_asus_ga401,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA502II",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
+		},
+		.driver_data = &quirk_asus_ga502,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA502IU",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
+		},
+		.driver_data = &quirk_asus_ga502,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA502IV",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
+		},
+		.driver_data = &quirk_asus_ga502,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. GA502DU",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502DU"),
+		},
+		.driver_data = &quirk_asus_ga502,
+	},
 	{},
 };
 
-- 
2.28.0


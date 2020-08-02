Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4B5235504
	for <lists+platform-driver-x86@lfdr.de>; Sun,  2 Aug 2020 06:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725772AbgHBEOj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 2 Aug 2020 00:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgHBEOi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Aug 2020 00:14:38 -0400
Received: from mail.bin-co.de (mail.bin-co.de [IPv6:2a02:c207:3002:169::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E45C06174A
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2020 21:14:37 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id 7DC7C4444647;
        Sun,  2 Aug 2020 06:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596341672;
        bh=hLs3Fbuuh0cpu+gM2k3QF51JPUFrgjFo6ZJ0kFw3qsk=;
        h=From:To:Cc:Subject:Date:From;
        b=J5aj6eaRQM+hlZFSUaKvqF0aTnW5xueGWTcAoUDirhHDY79Qpa2RtVnvUl2jbUpyT
         Sg558xDmRbql6SwZ7GndwdmKhn+C3EqFaD30Bxj/gAku0ieWUYe6p0/K5sZ/2qM/DH
         XdZXIE0z3ZMMOsUpjeCpppAPbnqT2rUAs8GcBOUrwcQXF2lXU3myP2f3xoP5bXKVln
         Or/jGh2+WzCLy7r9pFCyvheMQom/u8L/Iov4umtQ39mHXg39Kcps7bDVIJTbIAUvTX
         97qT0l6bwenGLTF/XY6pGmUlG2O3bJp8lmcN5fc3bLUOdRtNUzEyiQ0tq558lOk8bp
         tKGpmFsB9LKYA==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Z6wpsqEdZdKU; Sun,  2 Aug 2020 06:14:31 +0200 (CEST)
Received: from DeepBlue.zlan.intra (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id E11A84444641;
        Sun,  2 Aug 2020 06:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596341671;
        bh=hLs3Fbuuh0cpu+gM2k3QF51JPUFrgjFo6ZJ0kFw3qsk=;
        h=From:To:Cc:Subject:Date:From;
        b=Q21bmeqyby9VXsMVEjY0J85RCOBn7RPkoktjFPPH49TTUawORDRwJKjVvfXNh4mak
         W7qfajtAhtKmQ338x/2SRhiZBT9qvPaGnCEpl1MEpzYSRzJsQ0IbqIYLysq1Xxvr40
         YpcRinz9cIprjUj/bCe1xQNlDpyWIXHlfp7WTrmGyo1IC0t59OLjwZX5JNpgMesA1q
         DXi3TZhOQXqRcOuA0iGWYXtymcQz7AZO4FsgYhUBmlraGLDwOlQdbbXa2BVkxWMlBW
         6o3vId17H2/fJbQOkwi0oNMy3nmZNGIB09hnF9pnzYgQrQMSS1QW0kqkU5WY7hO7LR
         u/ag+jU+t1VJA==
From:   Armas Spann <zappel@retarded.farm>
To:     platform-driver-x86@vger.kernel.org
Cc:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org,
        Armas Spann <zappel@retarded.farm>
Subject: [PATCH v4] asus-nb-wmi: add support for ASUS ROG Zephyrus G14 (GA401) and G15 (GA502)
Date:   Sun,  2 Aug 2020 06:14:18 +0200
Message-Id: <20200802041418.79418-1-zappel@retarded.farm>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Signed-off-by: Armas Spann <zappel@retarded.farm>

This patch adds the ASUS ROG Zephyrus G14/15 notebook series detection to
asus-nb-wmi. The detection itself is accomplished by adding two new quirk_entry
structs (one for each series), as well as all current available G401/G502
DMI_PRODUCT_NAMES to match the corresponding devices.

patch-changelog:
v1: initial G401 patches
v2: --
v3: re-initial GA401 and GA502 and setting description
v4: corrected typo(s) added GA502DU series

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


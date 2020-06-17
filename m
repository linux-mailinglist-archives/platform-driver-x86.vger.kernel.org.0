Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436D61FCCEE
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Jun 2020 14:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgFQMAA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 17 Jun 2020 08:00:00 -0400
Received: from mail.bin-co.de ([173.212.200.19]:34310 "EHLO mail.bin-co.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgFQL77 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Jun 2020 07:59:59 -0400
X-Greylist: delayed 446 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Jun 2020 07:59:59 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id 923424443B21;
        Wed, 17 Jun 2020 13:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1592394750;
        bh=ZJz7NcnDVG7bfp8SDfnt7ucCeYO9DOPs3VCrmr6/O/E=;
        h=Subject:From:To:Cc:Date:From;
        b=hH55qfb4FMfd6y9BgzfnERdtSz68NtIutR5hatD4I0ZUR37n3E/3VVIN68DLLXdf+
         opmWt+wmUeIhnmG/pMGY6LSUErKE4kgSvRB77F/bOYUj54nlkhbTG3d7f5y+BtM8oi
         7kQj8BBYmPZUOFh8OdgXMM1OCq38omKq3tMWI3ppJMOzN2WBo09D1+B/4rkqXUAT9e
         X/o418V0ncKYjLnCfBmLz31j49fMx1d64C1JEXW/RsW9qOIT+Bhbdad7v0y7VtfjN3
         tB1eDOCyCQVFu14PkmPvfeIwKFUnT6v/uJVxwHHO3Ls39V8WrGn+Cz4Cwmv5QKO27D
         mOyg6Slx/aMiA==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JgXcsaVxJrXN; Wed, 17 Jun 2020 13:52:30 +0200 (CEST)
Received: from [192.168.0.23] (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id E9B134443B1E;
        Wed, 17 Jun 2020 13:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1592394750;
        bh=ZJz7NcnDVG7bfp8SDfnt7ucCeYO9DOPs3VCrmr6/O/E=;
        h=Subject:From:To:Cc:Date:From;
        b=hH55qfb4FMfd6y9BgzfnERdtSz68NtIutR5hatD4I0ZUR37n3E/3VVIN68DLLXdf+
         opmWt+wmUeIhnmG/pMGY6LSUErKE4kgSvRB77F/bOYUj54nlkhbTG3d7f5y+BtM8oi
         7kQj8BBYmPZUOFh8OdgXMM1OCq38omKq3tMWI3ppJMOzN2WBo09D1+B/4rkqXUAT9e
         X/o418V0ncKYjLnCfBmLz31j49fMx1d64C1JEXW/RsW9qOIT+Bhbdad7v0y7VtfjN3
         tB1eDOCyCQVFu14PkmPvfeIwKFUnT6v/uJVxwHHO3Ls39V8WrGn+Cz4Cwmv5QKO27D
         mOyg6Slx/aMiA==
Message-ID: <4033154a9e166a37acb5c0491fa0b85f8b0fc032.camel@retarded.farm>
Subject: [PATCH] support for ASUS ROG G14 (G401I) series
 asus-wmi.c/asus-nb-wmi.c
From:   Armas Spann <zappel@retarded.farm>
To:     platform-driver-x86@vger.kernel.org
Cc:     corentin.chary@gmail.com
Date:   Wed, 17 Jun 2020 13:52:28 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Support for the currently unsupported ASUS G14 Notebooks (GA401I series) to the asus(-nb)-wmi.c sources.
First change is the on the input buffer, the new devices are sending 5 DWORD instead of 3 as it was definded before. (might be already submitted upstream)

The second part of the patch adds the correct device dmi identificator.



--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -116,6 +116,8 @@
 	u32 arg0;
 	u32 arg1;
 	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
+        u32 arg3; /* At least ROG Zephyrus G14 series uses 5 dword input buffer */
+        u32 arg4;
 } __packed;
 
 /*
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -110,6 +110,12 @@
 	.wmi_force_als_set = true,
 };
 
+static struct quirk_entry quirk_asus_ga401i = {
+       .wapf = 4, // not sure if that is correct
+       .wmi_backlight_power = true,
+       .wmi_backlight_set_devstate = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -411,7 +417,25 @@
 		},
 		.driver_data = &quirk_asus_forceals,
 	},
-	{},
+	{
+               .callback = dmi_matched,
+               .ident = "ASUSTeK COMPUTER INC. GA401IV",
+               .matches = {
+                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+                       DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
+               },
+               .driver_data = &quirk_asus_ga401i,
+       },
+       {
+               .callback = dmi_matched,
+               .ident = "ASUSTeK COMPUTER INC. GA401IU",
+               .matches = {
+                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+                       DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
+               },
+               .driver_data = &quirk_asus_ga401i,
+       },
+       {},
 };
 
 static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443C621BCE5
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jul 2020 20:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgGJSZD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jul 2020 14:25:03 -0400
Received: from mail.bin-co.de ([173.212.200.19]:41490 "EHLO mail.bin-co.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726872AbgGJSZD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jul 2020 14:25:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id BC5ED4443E8E;
        Fri, 10 Jul 2020 20:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594405493;
        bh=zserpQ5MQsm3Jdgof8i7A99wiUir17IBLfify15/82k=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Hi2CAclP/zSGCvWagtnTCPM35j4iV7W0yEJKm1IV5jMzzokCmZALj1gM0tayw+knu
         HrG9ospbuw+RH/nrQerpE3FTucJ5XJzge/Hp0JCKzVSDQ0v4xSKKEapJ65K6PJUnb2
         i47AdMDGC0O3DbKngFuzA8N+exfUx1L7gmTLOcSUOAW919mmK6aPy3Mk/EuI/QvR6p
         AgBJD1kP/PoV+DZXFgZdXfiKY0cl7KY8pC+XgAWk+hvNB7zI8jDtz39h5MMoZekAYx
         1m6SY3B9BMddDMWbiBkiuPlwvsAyt1WyXvRSq2ZQZzt+4k03X4keJtyU94QkxbeU2a
         MzljojuwAvYzw==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4vVkwLA38DhU; Fri, 10 Jul 2020 20:24:53 +0200 (CEST)
Received: from deepblue.zlan.intra (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id 742764443DAB;
        Fri, 10 Jul 2020 20:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594405493;
        bh=zserpQ5MQsm3Jdgof8i7A99wiUir17IBLfify15/82k=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Hi2CAclP/zSGCvWagtnTCPM35j4iV7W0yEJKm1IV5jMzzokCmZALj1gM0tayw+knu
         HrG9ospbuw+RH/nrQerpE3FTucJ5XJzge/Hp0JCKzVSDQ0v4xSKKEapJ65K6PJUnb2
         i47AdMDGC0O3DbKngFuzA8N+exfUx1L7gmTLOcSUOAW919mmK6aPy3Mk/EuI/QvR6p
         AgBJD1kP/PoV+DZXFgZdXfiKY0cl7KY8pC+XgAWk+hvNB7zI8jDtz39h5MMoZekAYx
         1m6SY3B9BMddDMWbiBkiuPlwvsAyt1WyXvRSq2ZQZzt+4k03X4keJtyU94QkxbeU2a
         MzljojuwAvYzw==
Message-ID: <6b72df991cb25743906188aa054d3fe69c57248e.camel@retarded.farm>
Subject: Re: [PATCH] support for ASUS ROG G14/G15 (G401I/G502I) series
 asus-nb-wmi.c
From:   Armas Spann <zappel@retarded.farm>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Date:   Fri, 10 Jul 2020 20:24:50 +0200
In-Reply-To: <CAHp75Vd6PO3zfMH60BJETJCfQzAVbHvD=zAfHgjnu2NbAeukfw@mail.gmail.com>
References: <4033154a9e166a37acb5c0491fa0b85f8b0fc032.camel@retarded.farm>
         <CAHp75VeubEjv_2WPeHK5twWYhK58xJ2L6Pcu3ibVEO-C24AsWQ@mail.gmail.com>
         <CAHp75Vd6PO3zfMH60BJETJCfQzAVbHvD=zAfHgjnu2NbAeukfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am Donnerstag, den 09.07.2020, 22:19 +0300 schrieb Andy Shevchenko:
> On Thu, Jul 9, 2020 at 10:18 PM Andy Shevchenko
> <
> andy.shevchenko@gmail.com
> > wrote:
> > On Wed, Jun 17, 2020 at 3:02 PM Armas Spann <
> > zappel@retarded.farm
> > > wrote:
> > > Support for the currently unsupported ASUS G14 Notebooks (GA401I series)
> > > to the asus(-nb)-wmi.c sources.
> > > First change is the on the input buffer, the new devices are sending 5
> > > DWORD instead of 3 as it was definded before. (might be already submitted
> > > upstream)
> > > 
> > > The second part of the patch adds the correct device dmi identificator.
> > 
> > I can't take patch w/o Signed-off-by. See [1] for the details.
> > 
> > On top of that it doesn't apply. And it clashes with already applied
> > 7b91f1565fbf ("platform/x86: asus_wmi: Reserve more space for struct
> > bias_args")
> 
> [1]: 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> 
> 
> 
Many thanks for your feedback. 
I must excuse myself for not beeing guideline conform.

Now, I removed the already fixed input_buffer and added the ASUS Zephyrus ROG
G502I Series as well.

Corrected patch:


--- linux/drivers/platform/x86/asus-nb-wmi.c.orig	2020-07-10
19:31:02.288784987 +0200
+++ linux/drivers/platform/x86/asus-nb-wmi.c	2020-07-10 19:59:04.515645657
+0200
@@ -110,6 +110,16 @@ static struct quirk_entry quirk_asus_for
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
@@ -411,6 +421,78 @@ static const struct dmi_system_id asus_q
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
Signed-off-by: Armas Spann <zappel@retarded.farm>


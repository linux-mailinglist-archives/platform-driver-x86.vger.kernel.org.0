Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536F480B76
	for <lists+platform-driver-x86@lfdr.de>; Sun,  4 Aug 2019 17:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfHDPap (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 4 Aug 2019 11:30:45 -0400
Received: from mail.klausen.dk ([174.138.9.187]:60062 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbfHDPao (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Aug 2019 11:30:44 -0400
X-Greylist: delayed 511 seconds by postgrey-1.27 at vger.kernel.org; Sun, 04 Aug 2019 11:30:44 EDT
From:   Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1564932131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=kzZtMPyFQj29WLbsIskMKcZWhwGgSFxYvwpEJXX+VYE=;
        b=WUJJRZh4Pb3Onox7kQeCAKSizr8aP5VnJaxSmAUxzmqzwNRKz0zz69NQNixWz7A0xrZs8X
        I5lBI3M15kjrblIF6BCwHcq+jNH5Jhpb9tyQsaTdTO2MZv1lFTKXt9ZOZvyZlyDvmTVnPD
        RNoaw/+xN4NhGKsUOU1j9OH4q1d5X2k=
To:     platform-driver-x86@vger.kernel.org
Cc:     Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] platform/x86: asus-nb-wmi: Support ALS on the Zenbook UX430UNR
Date:   Sun,  4 Aug 2019 17:21:43 +0200
Message-Id: <20190804152142.7956-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch adds support for ALS on the Zenbook UX430UNR to the asus_nb_wmi
driver.

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
There is a few other laptops in the UX430 series (UX430UA, UX430UN,
UX430UAR), which probably need the same fix.
Would it be better to match against UX430?

 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 2ebde0174937..b361c73636a4 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -402,6 +402,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_forceals,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. UX430UNR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UX430UNR"),
+		},
+		.driver_data = &quirk_asus_forceals,
+	},
 	{},
 };
 
-- 
2.22.0


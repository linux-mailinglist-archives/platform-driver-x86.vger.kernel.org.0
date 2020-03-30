Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C33A1985CE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Mar 2020 22:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgC3UrG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 30 Mar 2020 16:47:06 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35396 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgC3UrG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Mar 2020 16:47:06 -0400
Received: by mail-lf1-f68.google.com with SMTP id t16so14581079lfl.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2020 13:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=VBX5/AwpenmAtRfYc0gA0p0Kuc9U6Tg9/8rBcFXDR5g=;
        b=oTb8MzuMYQSuLJ14kKORctvZc42AOq5iwR9omifw5PfjXVWBM7utrgk498HIr4CVmt
         QPzThWR9E2XnbA4MJ/+NHi4PFbrxInWKUL7RXrT1u89KIBec4hvtmX/nbq91ZenvAR6p
         t9ktfDMKzMHD2PIWIomZq2YrYg2QmLbH49TJ2DTfe2szQnILs79mh1+tnePzcWQ0Plm9
         po4t4pBq1vbrIrFrjQyoAjj9TbkInRSc6+qZ/i4ipOJ69iXX4hAnZKL+iJklx31tuidJ
         aOnJanJwAgxW6Zy+mVZW2ZOizDBDUiKPbW3A9KZ44YQzL8r5AH6GFu1bF3+qgOB2Y1Gh
         JR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=VBX5/AwpenmAtRfYc0gA0p0Kuc9U6Tg9/8rBcFXDR5g=;
        b=Cur+IfXrJaGwMLzwhejxXxp5bz56GILanqpem0EQNv59V5v271RjbyeDKWsmDEKcUb
         serqhcIQ0ohrnQ1ONr+7FGh+8yBv8NmYTZS2nntY7iaCiw5o2bWjRxQmf/W8773YgLgO
         4IWZnTZjpVNBfe1TiDJfjPdQqO7ZDHcj3pn/yNybd0zk2uFEeHDyjQccqTSZW4exxg49
         xdU+dQCmgKZ7C3K489KL4sZqZGSe0mlxsxioXfOMzulpOvIlFXbFBBL4aWRGVL1jucpH
         aPoLJyqlx2GnoZU+/Ye+apaWR0YtpWAlLUWYfBEkHDVj6u2ez6hqgT+h8zl9qO6S6pfE
         L61w==
X-Gm-Message-State: AGi0PuYt+dW3gjcuH/DKX6ZSM+/PEafC3CGAvlXuGtBSoveaIMkAyudE
        8mbPWdh6rOyNZoOQct4yGGbuQydUZl0=
X-Google-Smtp-Source: APiQypKlONMDlwLSY5Q4J216peN/drpfVr6eoqNFQwTIik1X8wmaAeuGGpBcSkbXxhlsolccwjscLg==
X-Received: by 2002:a19:4cc3:: with SMTP id z186mr8842254lfa.69.1585601222387;
        Mon, 30 Mar 2020 13:47:02 -0700 (PDT)
Received: from zyklotron (host-89-228-178-201.dynamic.mm.pl. [89.228.178.201])
        by smtp.gmail.com with ESMTPSA id f7sm7304288ljj.4.2020.03.30.13.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 13:47:02 -0700 (PDT)
Date:   Mon, 30 Mar 2020 22:47:01 +0200
From:   Wiktor Ciurej <wiktor.ciurej@gmail.com>
To:     hdegoede@redhat.com
Cc:     dvhart@infradead.org, andy@infradead.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Add touchscreen info for
 techBite Arc 11.6.
Message-ID: <20200330204701.GA11408@zyklotron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for techBite Arc 11.6.

Signed-off-by: Wiktor Ciurej <wiktor.ciurej@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 93177e6e5ecd..ba43a29f68a9 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -537,6 +537,17 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
 	.properties	= schneider_sct101ctm_props,
 };
 
+static const struct property_entry techbite_arc_11_6_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 7),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1981),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-techbite-arc-11-6.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
 static const struct property_entry teclast_x3_plus_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
@@ -969,6 +980,15 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
 		},
 	},
+	{
+		/* Techbite Arc 11.6 */
+		.driver_data = (void *)&techbite_arc_11_6_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "techBite Arc 11.6"),
+			DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
+		},
+	},
 	{
 		/* Teclast X3 Plus */
 		.driver_data = (void *)&teclast_x3_plus_data,
-- 
2.20.1


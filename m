Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 868BE19C6CE
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Apr 2020 18:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389392AbgDBQNU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Apr 2020 12:13:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45598 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389510AbgDBQNU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Apr 2020 12:13:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id t17so3809130ljc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2020 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Khnhv2PQLSZw1ETRO0ApSkXg8lDEm65YdOuQdUOJGsM=;
        b=LbvsnXCFNQ5uISr64xdXu4052GMKj2+FjPKYSz8sQ1xzoeWOVV0Fy9r/ohoYqs+rm3
         ZW6x1W3wQpPKNs+s2WT9B94Wv2tWW++Il5AAGz2Vga2flOrdT/1cE4blKfCMlSm7Kxn5
         aL9qxxQsA9lx2RXF8OxmlnN/IdHllydZcOpO8qKsGpGeCviNJHbb7NXo7V1Kpdvbhda7
         3WFYrIeLjx5U9yr7LH/BH0dyMGxsB4KNAz1xyOjVhVOgyrLdmfYR0GJERAo0owH3wBHO
         K94t5J3hralH2/uI5StQYEGMOVn3UiTU1tDRWVf2LRxeYT5tfn/DSlwwWkdki2QAgB11
         BEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Khnhv2PQLSZw1ETRO0ApSkXg8lDEm65YdOuQdUOJGsM=;
        b=PipoEy15mE1JBVag0IirahGDfY5geFnxD0DvKuvaN25P8lBxotwtlcU9pDdn8Lteva
         wegTlJi3Q0ZKTuHbgPcCbnL0vxpYbT2FpqWUrdojM+zJEiE3N7Msd4QkXbFlAwGpgBbC
         Jl1lr8UrPWvE3dzAnSj6gsjGrEOjmWyBNVrDJsDMQOsvpu1mxoSyXZYJ/u98EVYeqZ7L
         Wur+2XzJKoFkCjLyyrXvM4mvBGzGbGYzShBYX3Hv+rz0vcIXXuU8RHSXZK+Bxv3IYdZt
         h/oawwGmCZRETAggRQwnN+YVQWVWAjiSJlXWaexHPqo3SVHGuf217kznJruLBy/Wy6fB
         JtNw==
X-Gm-Message-State: AGi0PuYvCLIhDRZOBH6ML0LoUWInMyLIDvK0hqasBq0efZFbI4EY0ZfU
        kCJgA3BkCFiiOdkCDj++vJ1o2Boornw=
X-Google-Smtp-Source: APiQypKqgWx/r5c6VI7sZEmmZoKR5BidlKC8wm/aY/Svr1vCC2omeioP5JTiA0ND5d2uU/wKQqmF9g==
X-Received: by 2002:a2e:9c9:: with SMTP id 192mr2222614ljj.77.1585843994656;
        Thu, 02 Apr 2020 09:13:14 -0700 (PDT)
Received: from zyklotron (host-89-228-176-218.dynamic.mm.pl. [89.228.176.218])
        by smtp.gmail.com with ESMTPSA id l7sm4469433lfg.79.2020.04.02.09.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 09:13:14 -0700 (PDT)
Date:   Thu, 2 Apr 2020 18:13:13 +0200
From:   Wiktor Ciurej <wiktor.ciurej@gmail.com>
To:     hdegoede@redhat.com
Cc:     dvhart@infradead.org, andy.shevchenko@gmail.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: touchscreen_dmi: Add touchscreen info for
 techBite Arc 11.6.
Message-ID: <20200402161313.GA27168@zyklotron>
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
Changes in v2:
  - Add missing ts_dmi_data struct.

 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 93177e6e5ecd..7c9e9a3e1d84 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -537,6 +537,22 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
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
+static const struct ts_dmi_data techbite_arc_11_6_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= techbite_arc_11_6_props,
+};
+
 static const struct property_entry teclast_x3_plus_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
@@ -969,6 +985,15 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
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


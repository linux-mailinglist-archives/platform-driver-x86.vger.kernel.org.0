Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD9F38EAD1
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 May 2021 16:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbhEXO6M (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 May 2021 10:58:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234315AbhEXO4M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 May 2021 10:56:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A5FF613DF;
        Mon, 24 May 2021 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621867738;
        bh=26WxNwO+8uDhnOWKEyMtx1cDFa5fjm15bHmqxO787rI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Okc+BhJd/gz99KYFfQRMXS9DbXz0Ssp2/l3K3eOChdlYfMj8PrWEs+BsfiaBBetpX
         gBOhZkL9nOP9cWTVTP79dvZaLQdkvwbrgO1BV484va0AK2zEoRSQmmTYoc9iqQ8i3+
         TpJBPINVz4uVjVzNd1PVnqERKXAocuxcMMRukd4wIqEgn3NhwAvFcBZiUvtzMmB1qy
         c1lWV55Lg3X9eLPx0640/p6NlQLLr3KCEAP8bfjkD0OD84QBNXEjSigT27ULKSFyFq
         IQ0p9ookGVV2zIVx62TGmACn06Xggx9nxDeUvQGYfVUiZb76DM4dKwNGQZPzxPIVzw
         z0GwnNj+v27lQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 60/62] platform/x86: touchscreen_dmi: Add info for the Chuwi Hi10 Pro (CWI529) tablet
Date:   Mon, 24 May 2021 10:47:41 -0400
Message-Id: <20210524144744.2497894-60-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit e68671e9e1275dfdda333c3e83b6d28963af16b6 ]

Add touchscreen info for the Chuwi Hi10 Pro (CWI529) tablet. This includes
info for getting the firmware directly from the UEFI, so that the user does
not need to manually install the firmware in /lib/firmware/silead.

This change will make the touchscreen on these devices work OOTB,
without requiring any manual setup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20210520093228.7439-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/touchscreen_dmi.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index e1455f1d2472..3743d895399e 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -115,6 +115,32 @@ static const struct ts_dmi_data chuwi_hi10_plus_data = {
 	.properties     = chuwi_hi10_plus_props,
 };
 
+static const struct property_entry chuwi_hi10_pro_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1912),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1272),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data chuwi_hi10_pro_data = {
+	.embedded_fw = {
+		.name	= "silead/gsl1680-chuwi-hi10-pro.fw",
+		.prefix = { 0xf0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00 },
+		.length	= 42504,
+		.sha256	= { 0xdb, 0x92, 0x68, 0xa8, 0xdb, 0x81, 0x31, 0x00,
+			    0x1f, 0x58, 0x89, 0xdb, 0x19, 0x1b, 0x15, 0x8c,
+			    0x05, 0x14, 0xf4, 0x95, 0xba, 0x15, 0x45, 0x98,
+			    0x42, 0xa3, 0xbb, 0x65, 0xe3, 0x30, 0xa5, 0x93 },
+	},
+	.acpi_name      = "MSSL1680:00",
+	.properties     = chuwi_hi10_pro_props,
+};
+
 static const struct property_entry chuwi_vi8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
@@ -872,6 +898,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 		},
 	},
+	{
+		/* Chuwi Hi10 Prus (CWI597) */
+		.driver_data = (void *)&chuwi_hi10_pro_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+		},
+	},
 	{
 		/* Chuwi Vi8 (CWI506) */
 		.driver_data = (void *)&chuwi_vi8_data,
-- 
2.30.2


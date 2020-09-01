Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE69258A12
	for <lists+platform-driver-x86@lfdr.de>; Tue,  1 Sep 2020 10:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgIAIIB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 1 Sep 2020 04:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54039 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726020AbgIAIIA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Sep 2020 04:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598947679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3V8skO2t937+jYhTflFUOs2XOQdP3IG37qarxqjKUWs=;
        b=JXkShZBgZNBmkjRzQnXCTHkxWolKMYa6jTD5UY1tEMyw+QD8WqieHUmei/b2FcCuvtzbFU
        yaKUvmkFILUJuyYKhf0vxWfgD7STkUowe8ECwXmIeNy2NvHeB4Hp6+E0Jyw3+OPoLz1to/
        scio7yP0gqqnoMjlFqcBdiF20GqcByI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-xQdtD_OfOSupnkpu0aqbig-1; Tue, 01 Sep 2020 04:07:55 -0400
X-MC-Unique: xQdtD_OfOSupnkpu0aqbig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5631964080;
        Tue,  1 Sep 2020 08:07:54 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-149.ams2.redhat.com [10.36.114.149])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6112C7DA24;
        Tue,  1 Sep 2020 08:07:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the MPMAN Converter9 2-in-1
Date:   Tue,  1 Sep 2020 10:07:52 +0200
Message-Id: <20200901080752.5146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for the MPMAN Converter9 2-in-1. This device uses the
same case as the ITworks TW891, but it uses a different digitizer, so it
needs its own firmware.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 5c223015ee71..dda60f89c951 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -373,6 +373,23 @@ static const struct ts_dmi_data jumper_ezpad_mini3_data = {
 	.properties	= jumper_ezpad_mini3_props,
 };
 
+static const struct property_entry mpman_converter9_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1664),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 880),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-mpman-converter9.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct ts_dmi_data mpman_converter9_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= mpman_converter9_props,
+};
+
 static const struct property_entry mpman_mpwin895cl_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 3),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
@@ -976,6 +993,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "FlexBook edge11 - M-FBE11"),
 		},
 	},
+	{
+		/* MP Man Converter 9 */
+		.driver_data = (void *)&mpman_converter9_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MPMAN"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Converter9"),
+		},
+	},
 	{
 		/* MP Man MPWIN895CL */
 		.driver_data = (void *)&mpman_mpwin895cl_data,
-- 
2.28.0


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D101C5542
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 14:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgEEMQS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 08:16:18 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21342 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgEEMQR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 08:16:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588680967; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=by7EqNwa0jvS8n0RA6cx158bvfuD01cIHTAJrIqKyTPCPsa3IapJMy1rW6MTzE3Ux7Fw3i2WpucNeepdOLiZcx2f4+vJmoPK9TmPFa9Tdau2If47JO3erNpP1FPMr6SSriJu0ypOWEHTW0AD6iOWB+n1cTSpTktdYlt5M93CnCM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1588680967; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=okn8hxQ00N9vtJ7XNo2REkErUMYkBnOZ2K4HoWLpfhU=; 
        b=J+Y+s91jAl96l3cz6Tcrh37+1IGTmMxx0xisjMeveM4QBDIGUlWEuDGs62U1zjH/B5YFv+BRqDLcYTlwitJGuJo11+SzKo0vB5MM9l7sCbMm/+DkaJmWe3oUlAcW0VwP6O2YOXiBLz1+5tQ71WUzdxETdryuBjGpuqPsbD6Gy3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=a@dun.ai;
        dmarc=pass header.from=<a@dun.ai> header.from=<a@dun.ai>
Received: from localhost.localdomain (92.253.251.250 [92.253.251.250]) by mx.zohomail.com
        with SMTPS id 1588680963708587.0635429791535; Tue, 5 May 2020 05:16:03 -0700 (PDT)
From:   Andrew Dunai <a@dun.ai>
To:     dvhart@infradead.org
Cc:     andy@infradead.org, platform-driver-x86@vger.kernel.org,
        hdegoede@redhat.com, Andrew Dunai <a@dun.ai>
Message-ID: <20200505121518.271854-1-a@dun.ai>
Subject: [PATCH v3] platform/x86: touchscreen_dmi: add Vinga J116 touchscreen
Date:   Tue,  5 May 2020 15:15:18 +0300
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for Vinga Twizzle J116 Silead touchscreen which uses GSL1680 chip.

Signed-off-by: Andrew Dunai <a@dun.ai>
---
 drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 93177e6e5..a3ab19ab0 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -640,6 +640,20 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
 	.properties	= trekstor_surftab_wintron70_props,
 };
 
+static const struct property_entry vinga_twizzle_j116_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data vinga_twizzle_j116_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= vinga_twizzle_j116_props,
+};
+
 /* NOTE: Please keep this table sorted alphabetically */
 static const struct dmi_system_id touchscreen_dmi_table[] = {
 	{
@@ -1054,6 +1068,13 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
 		},
 	},
+	{
+		/* Vinga Twizzle J116 */
+		.driver_data = (void *)&vinga_twizzle_j116_data,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
+		},
+	},
 	{ },
 };
 
-- 
2.26.2



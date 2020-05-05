Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEC41C51EB
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 11:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgEEJ2p convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 05:28:45 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21383 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgEEJ2p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 05:28:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588670914; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=KX5q032EnIV40xQN7k3oJszQl29TcKUpU+ISh0i4/CbO/69kBC5cpaOCBzBC6/dXUXIZQIxbsO5epV93YjphqZoog0HFeYaextk9RddAycSExqyUbRR6Lo8WoILnK76DLSdAYvjtRY/eiBRdALPWFxXYPwDSqnSOwwJ7oi0/BJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1588670914; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=fs9Z4f3SkFBQ+8dXXBTs20ZshNlpF9tfbnk8ltSJv8k=; 
        b=mMkQR41LMSz9sUaUKpKeWFLR1Wdpd4Ng5APTjWPvSXYW5Ot2d0qcPfjHa4KuE+kA9rAamB2KyfRdrJHjxd7HApLyQAokJBlUuPoWOG4OKxb+Cpe60b75oQf/gdchJb2fNzRNsw+N7xhYijzm6EtZ6SwpN7DE6AQKhwlPtXFihyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=a@dun.ai;
        dmarc=pass header.from=<a@dun.ai> header.from=<a@dun.ai>
Received: from vinga.itotolink.net (46.118.154.112 [46.118.154.112]) by mx.zohomail.com
        with SMTPS id 1588670912873280.3651527117594; Tue, 5 May 2020 02:28:32 -0700 (PDT)
From:   Andrew Dunai <a@dun.ai>
To:     hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
        Andrew Dunai <a@dun.ai>
Message-ID: <20200505092825.145092-1-a@dun.ai>
Subject: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
Date:   Tue,  5 May 2020 12:28:25 +0300
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

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



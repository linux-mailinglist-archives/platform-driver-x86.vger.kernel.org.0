Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE61A14764F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Jan 2020 02:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729504AbgAXBTO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Jan 2020 20:19:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:32824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgAXBRt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jan 2020 20:17:49 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54A0221D7D;
        Fri, 24 Jan 2020 01:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579828669;
        bh=HAP1qeT1fMGgx/Oo/Gp+yGVNtUk2NbKLKvDDB7a2iFY=;
        h=From:To:Cc:Subject:Date:From;
        b=bbPlniBzVnAuF19hyrf2iEAh/ikwoj3PFbl/wzF5qQRpEt3Te/8Jf3QpkJu71NBuP
         ORw8phyPnhQGHnMuf+FjT0poAtmBn5Zu1kypNNvH2IrUHMkgK0gq4XOvhWf5aJTGDi
         BcGdoXVYCalLqPhrxVrNAW3S/r6ZRCeSYAoAefhw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>,
        Mario Limonciello <mario.limonciello@dell.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 01/11] platform/x86: dell-laptop: disable kbd backlight on Inspiron 10xx
Date:   Thu, 23 Jan 2020 20:17:37 -0500
Message-Id: <20200124011747.18575-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>

[ Upstream commit 10b65e2915b2fcc606d173e98a972850101fb4c4 ]

This patch adds a quirk disabling keyboard backlight support for the
Dell Inspiron 1012 and 1018.

Those models wrongly report supporting keyboard backlight control
features (through SMBIOS tokens) even though they're not equipped with
a backlit keyboard. This led to broken controls being exposed
through sysfs by this driver which froze the system when used.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=107651
Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/dell-laptop.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 3433986d52200..949dbc8aab413 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -37,6 +37,7 @@
 
 struct quirk_entry {
 	bool touchpad_led;
+	bool kbd_led_not_present;
 	bool kbd_led_levels_off_1;
 	bool kbd_missing_ac_tag;
 
@@ -77,6 +78,10 @@ static struct quirk_entry quirk_dell_latitude_e6410 = {
 	.kbd_led_levels_off_1 = true,
 };
 
+static struct quirk_entry quirk_dell_inspiron_1012 = {
+	.kbd_led_not_present = true,
+};
+
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "dell-laptop",
@@ -314,6 +319,24 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_dell_latitude_e6410,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 1012",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
+		},
+		.driver_data = &quirk_dell_inspiron_1012,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 1018",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1018"),
+		},
+		.driver_data = &quirk_dell_inspiron_1012,
+	},
 	{ }
 };
 
@@ -1497,6 +1520,9 @@ static void kbd_init(void)
 {
 	int ret;
 
+	if (quirks && quirks->kbd_led_not_present)
+		return;
+
 	ret = kbd_init_info();
 	kbd_init_tokens();
 
-- 
2.20.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCD326CCD8
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 22:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgIPUuN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 16:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33035 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726651AbgIPQ43 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 12:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600275365;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=yptn7Knfy+pyZ5BVZ+kV0vuhRXCQsrE7SMAA6n+ZrNg=;
        b=eT0abNVA5Ehgf1FBAQSNr4+MbaEgYxdmiLEHkv4gTVrgoY0SBdhuOE7onmXqGOvOrDCrUT
        IVO4UriXWBhNsqbtQ0tvvzJtIjHwqKVCmWNcA1msPBu6Mb/BmmUmQHoa2mlnrBzgUpY7tr
        GUoMepBsoda318yPfkSVkZdNxElB4e0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-VsVUcjoENyuZ2V4NiNWJ4g-1; Wed, 16 Sep 2020 11:47:07 -0400
X-MC-Unique: VsVUcjoENyuZ2V4NiNWJ4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C09B1084D6E;
        Wed, 16 Sep 2020 15:47:06 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E644619D7C;
        Wed, 16 Sep 2020 15:47:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>
Subject: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always reporting 1 on many different models
Date:   Wed, 16 Sep 2020 17:47:03 +0200
Message-Id: <20200916154703.76643-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit b0dbd97de1f1 ("platform/x86: asus-wmi: Add support for
SW_TABLET_MODE") added support for reporting SW_TABLET_MODE using the
Asus 0x00120063 WMI-device-id to see if various transformer models were
docked into their keyboard-dock (SW_TABLET_MODE=0) or if they were
being used as a tablet.

The new SW_TABLET_MODE support (naively?) assumed that non Transformer
devices would either not support the 0x00120063 WMI-device-id at all,
or would NOT set ASUS_WMI_DSTS_PRESENCE_BIT in their reply when querying
the device-id.

Unfortunately this is not true and we have received many bug reports about
this change causing the asus-wmi driver to always report SW_TABLET_MODE=1
on non Transformer devices. This causes libinput to think that these are
360 degree hinges style 2-in-1s folded into tablet-mode. Making libinput
suppress keyboard and touchpad events from the builtin keyboard and
touchpad. So effectively this causes the keyboard and touchpad to not work
on many non Transformer Asus models.

This commit fixes this by using the existing DMI based quirk mechanism in
asus-nb-wmi.c to allow using the 0x00120063 device-id for reporting
SW_TABLET_MODE on Transformer models and ignoring it on all other models.

Fixes: b0dbd97de1f1 ("platform/x86: asus-wmi: Add support for SW_TABLET_MODE")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209011
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1875339
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1875828
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1876997
Reported-by: Samuel Čavoj <samuel@cavoj.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 32 ++++++++++++++++++++++++++++++
 drivers/platform/x86/asus-wmi.c    | 16 ++++++++-------
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 680c3640e013..1d9fbabd02fb 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -115,6 +115,10 @@ static struct quirk_entry quirk_asus_vendor_backlight = {
 	.wmi_backlight_set_devstate = true,
 };
 
+static struct quirk_entry quirk_asus_use_kbd_dock_devid = {
+	.use_kbd_dock_devid = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -488,6 +492,34 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_vendor_backlight,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Asus Transformer T100TA / T100HA / T100CHI",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			/* Match *T100* */
+			DMI_MATCH(DMI_PRODUCT_NAME, "T100"),
+		},
+		.driver_data = &quirk_asus_use_kbd_dock_devid,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Asus Transformer T101HA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T101HA"),
+		},
+		.driver_data = &quirk_asus_use_kbd_dock_devid,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Asus Transformer T200TA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T200TA"),
+		},
+		.driver_data = &quirk_asus_use_kbd_dock_devid,
+	},
 	{},
 };
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8f4acdc06b13..ae6289d37faf 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -365,12 +365,14 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	if (err)
 		goto err_free_dev;
 
-	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
-	if (result >= 0) {
-		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
-		input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
-	} else if (result != -ENODEV) {
-		pr_err("Error checking for keyboard-dock: %d\n", result);
+	if (asus->driver->quirks->use_kbd_dock_devid) {
+		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
+		if (result >= 0) {
+			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
+			input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
+		} else if (result != -ENODEV) {
+			pr_err("Error checking for keyboard-dock: %d\n", result);
+		}
 	}
 
 	err = input_register_device(asus->inputdev);
@@ -2114,7 +2116,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (code == NOTIFY_KBD_DOCK_CHANGE) {
+	if (asus->driver->quirks->use_kbd_dock_devid && code == NOTIFY_KBD_DOCK_CHANGE) {
 		result = asus_wmi_get_devstate_simple(asus,
 						      ASUS_WMI_DEVID_KBD_DOCK);
 		if (result >= 0) {
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 4f31b68642a0..1a95c172f94b 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -33,6 +33,7 @@ struct quirk_entry {
 	bool wmi_backlight_native;
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
+	bool use_kbd_dock_devid;
 	int wapf;
 	/*
 	 * For machines with AMD graphic chips, it will send out WMI event
-- 
2.28.0


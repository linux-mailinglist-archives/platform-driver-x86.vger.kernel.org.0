Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0605B26DDEA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Sep 2020 16:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgIQOMx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 17 Sep 2020 10:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727239AbgIQN6l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:58:41 -0400
Received: from mail.sammserver.com (sammserver.com [IPv6:2001:470:5a5b:1::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B70C061756;
        Thu, 17 Sep 2020 06:35:53 -0700 (PDT)
Received: by mail.sammserver.com (Postfix, from userid 5011)
        id DF253105EE08; Thu, 17 Sep 2020 15:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1600349751; bh=4tH4rZyjDgnv1dbbHfTOgqSTEzpb/RRtA/u8wp8LmAc=;
        h=From:To:Cc:Subject:Date:From;
        b=sR5GSYeARD9RaIElWXn4CkiihXXAfVdNjolUx1AYigCZeHkihEO3/71u5fEYC/0aE
         RCxcTNC1RRpQgKv07TUARXZ2KtAM2hv/M5oukt13nq2YJ3cA5JzCFbeqpg0BJ/nC8h
         X2J79SiaErnUzpj3u9xqE+9b1crPt+FxlaQm0GBw=
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 92DF5105EE05;
        Thu, 17 Sep 2020 15:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1600349751; bh=4tH4rZyjDgnv1dbbHfTOgqSTEzpb/RRtA/u8wp8LmAc=;
        h=From:To:Cc:Subject:Date:From;
        b=sR5GSYeARD9RaIElWXn4CkiihXXAfVdNjolUx1AYigCZeHkihEO3/71u5fEYC/0aE
         RCxcTNC1RRpQgKv07TUARXZ2KtAM2hv/M5oukt13nq2YJ3cA5JzCFbeqpg0BJ/nC8h
         X2J79SiaErnUzpj3u9xqE+9b1crPt+FxlaQm0GBw=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id 6428914209C4; Thu, 17 Sep 2020 15:35:51 +0200 (CEST)
From:   =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] platform/x86: asus-wmi: Add support for SW_TABLET_MODE on UX360
Date:   Thu, 17 Sep 2020 15:34:26 +0200
Message-Id: <20200917133425.168310-1-samuel@cavoj.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS autolearn=no autolearn_force=no
        version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on sammserver.tu
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The UX360CA has a WMI device id 0x00060062, which reports whether the
lid is flipped in tablet mode (1) or in normal laptop mode (0).

This commit adds a quirk (quirk_asus_use_lid_flip_devid) for devices on
which this WMI device should be used to figure out the SW_TABLET_MODE
state, as opposed to the quirk_asus_use_kbd_dock_devid.

It is assumed other UX360* models have the same WMI device. As such, the
quirk is applied to devices with DMI_MATCH(DMI_PRODUCT_NAME, "UX360").
More devices with this feature need to be tested and added accordingly.

The reason for using a whitelist via the quirk mechanism is that the new
WMI device (0x00060062) is also present on some models which do not have
a 360 degree hinge (at least FX503VD and GL503VD from Hans' DSTS
collection) and therefore its presence cannot be relied on.

This patch is a followup to "platform/x86: asus-wmi: Fix SW_TABLET_MODE
always reporting 1 on many different models" by Hans de Goede.

Signed-off-by: Samuel Čavoj <samuel@cavoj.net>
Cc: Hans de Goede <hdegoede@redhat.com>
---

v1 -> v2:
  - inherit wmi_backlight_set_devstate from default quirk

---
 drivers/platform/x86/asus-nb-wmi.c         | 15 +++++++++++++++
 drivers/platform/x86/asus-wmi.c            | 22 ++++++++++++++++++++++
 drivers/platform/x86/asus-wmi.h            |  1 +
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 4 files changed, 39 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 345bd224494b..5019b03b2c95 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -119,6 +119,11 @@ static struct quirk_entry quirk_asus_use_kbd_dock_devid = {
 	.use_kbd_dock_devid = true,
 };
 
+static struct quirk_entry quirk_asus_use_lid_flip_devid = {
+	.wmi_backlight_set_devstate = true,
+	.use_lid_flip_devid = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -520,6 +525,16 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_use_kbd_dock_devid,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ZenBook Flip UX360",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			/* Match UX360* */
+			DMI_MATCH(DMI_PRODUCT_NAME, "UX360"),
+		},
+		.driver_data = &quirk_asus_use_lid_flip_devid,
+	},
 	{},
 };
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ae6289d37faf..e5066248e83a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_KBD_BRTTOGGLE		0xc7
 #define NOTIFY_KBD_FBM			0x99
 #define NOTIFY_KBD_TTP			0xae
+#define NOTIFY_LID_FLIP			0xfa
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -375,6 +376,18 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 		}
 	}
 
+	if (asus->driver->quirks->use_lid_flip_devid) {
+		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
+		if (result >= 0) {
+			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
+			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+		} else if (result == -ENODEV) {
+			pr_err("This device has lid_flip quirk but got ENODEV checking it. This is a bug.");
+		} else {
+			pr_err("Error checking for lid-flip: %d\n", result);
+		}
+	}
+
 	err = input_register_device(asus->inputdev);
 	if (err)
 		goto err_free_dev;
@@ -2127,6 +2140,15 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
+	if (asus->driver->quirks->use_lid_flip_devid && code == NOTIFY_LID_FLIP) {
+		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
+		if (result >= 0) {
+			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+			input_sync(asus->inputdev);
+		}
+		return;
+	}
+
 	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
 		fan_boost_mode_switch_next(asus);
 		return;
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 1a95c172f94b..b302415bf1d9 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -34,6 +34,7 @@ struct quirk_entry {
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
 	bool use_kbd_dock_devid;
+	bool use_lid_flip_devid;
 	int wapf;
 	/*
 	 * For machines with AMD graphic chips, it will send out WMI event
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 897b8332a39f..2f274cf52805 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -62,6 +62,7 @@
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
+#define ASUS_WMI_DEVID_LID_FLIP		0x00060062
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
-- 
2.28.0


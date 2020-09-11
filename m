Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42D226631A
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Sep 2020 18:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgIKQKu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Sep 2020 12:10:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38482 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgIKPjc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Sep 2020 11:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599838764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=L1vWB17r6vdZWYdprKPAib7fc4O9RA1s0HHbQNnq/nc=;
        b=U8ld14j5FESivJCuWwFz70Y6YA+AiJP9Bsz4Fvs/J9bXh/H8vqit4wNyl02M5T8dLIb+2J
        gX6zeism9qm5gYGoycyzIRJGgI6cwFLzmD2egUjzk0b1Bu1reBYb6xdBhT13392yBsVwCA
        lPM7XCJkQTzC2BiE/EZ6RVb5M4scc9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-qJFxp0DGOG6Wg23Tw_xU0A-1; Fri, 11 Sep 2020 09:26:22 -0400
X-MC-Unique: qJFxp0DGOG6Wg23Tw_xU0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEFDC8D030C;
        Fri, 11 Sep 2020 13:26:20 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-31.ams2.redhat.com [10.36.113.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7CEC919C66;
        Fri, 11 Sep 2020 13:26:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>
Subject: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always reporting 1 on the Asus UX360CA
Date:   Fri, 11 Sep 2020 15:26:18 +0200
Message-Id: <20200911132618.187297-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On the Asus UX360CA the ASUS_WMI_DEVID_KBD_DOCK devstate always reports 0,
which we translate to SW_TABLET_MODE=1. Which causes libinput to disable
the keyboard and touchpad even if the 360 degree hinges style 2-in-1 is
in laptop mode.

Samuel found out that this model has another WMI "object" with an devid of
0x00060062 which correctly reports laptop vs tablet-mode on the
Asus UX360CA.

All the models on which the SW_TABLET_MODE code was previously tested do
not have this new devid 0x00060062 object.

This commit adds support for the new devid 0x00060062 object and prefers it
over the older 0x00120063 object when present, fixing SW_TABLET_MODE always
being reported as 1 on these models.

Reported-and-tested-by: Samuel Čavoj <samuel@cavoj.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c            | 32 ++++++++++++++++++----
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8f4acdc06b13..c8689da0323b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_KBD_BRTTOGGLE		0xc7
 #define NOTIFY_KBD_FBM			0x99
 #define NOTIFY_KBD_TTP			0xae
+#define NOTIFY_FLIP_TABLET_MODE_CHANGE	0xfa
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -173,6 +174,7 @@ struct asus_wmi {
 	int spec;
 	int sfun;
 	bool wmi_event_queue;
+	bool use_flip_tablet_mode;
 
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
@@ -365,12 +367,22 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	if (err)
 		goto err_free_dev;
 
-	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
+	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_FLIP_TABLET_MODE);
 	if (result >= 0) {
+		asus->use_flip_tablet_mode = true;
 		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
-		input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
-	} else if (result != -ENODEV) {
-		pr_err("Error checking for keyboard-dock: %d\n", result);
+		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+	} else {
+		if (result != -ENODEV)
+			pr_err("Error checking for flip-tablet-mode: %d\n", result);
+
+		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
+		if (result >= 0) {
+			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
+			input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
+		} else if (result != -ENODEV) {
+			pr_err("Error checking for keyboard-dock: %d\n", result);
+		}
 	}
 
 	err = input_register_device(asus->inputdev);
@@ -2114,7 +2126,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (code == NOTIFY_KBD_DOCK_CHANGE) {
+	if (!asus->use_flip_tablet_mode && code == NOTIFY_KBD_DOCK_CHANGE) {
 		result = asus_wmi_get_devstate_simple(asus,
 						      ASUS_WMI_DEVID_KBD_DOCK);
 		if (result >= 0) {
@@ -2125,6 +2137,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
+	if (asus->use_flip_tablet_mode && code == NOTIFY_FLIP_TABLET_MODE_CHANGE) {
+		result = asus_wmi_get_devstate_simple(asus,
+						      ASUS_WMI_DEVID_FLIP_TABLET_MODE);
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
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 897b8332a39f..1897b4683562 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -62,6 +62,7 @@
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
+#define ASUS_WMI_DEVID_FLIP_TABLET_MODE	0x00060062
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
-- 
2.28.0


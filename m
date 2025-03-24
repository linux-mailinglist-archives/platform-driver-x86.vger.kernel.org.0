Return-Path: <platform-driver-x86+bounces-10550-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A69A6E518
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Mar 2025 22:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259F618994EC
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Mar 2025 21:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684F11EF09A;
	Mon, 24 Mar 2025 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="dYfZjPSs"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E11A18B464;
	Mon, 24 Mar 2025 21:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742850134; cv=none; b=tbKtmCsq7fiU3CyOmy7OV12cc/JHroMNj9AzbXwb8NS8k39Tfyx7dq5FEoPZcVjzPBi0Shu0r/zi+zMHd91rZDsjY6ceW+SlyRA+gXx1TXSG3rIFrJqGg91KurDpxIYMGIm/0CZBytA4BaTOqGTO7fEIGnwSvtAkNOcosMqq3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742850134; c=relaxed/simple;
	bh=McfPLinrI0UIGMPTJCpquK06WbMzxn0Fz1pp5+lKrN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4/kdhkcb0LH3L+j7fkorBKY0C51N8dIZeB7anhWDuWHCPSw4jmTSJChwhqqXWmvZZs6gDtv3LojcQkFMueGNwx3/GtFf2/PKl04efCaK44+WC1tSSpbR9Y0qIFvBbzeI3J7YM/A48DHulKfoAyZpjk4c/gROEXmMXQG7WRfZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=dYfZjPSs; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id AA95F2E09D97;
	Mon, 24 Mar 2025 23:02:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742850130;
	bh=3e4rHQpsDEsDnd8v9T2vzddRYWY1i6Z2uoxlKsEJHsM=; h=From:To:Subject;
	b=dYfZjPSsYX3ohgR6GlEgOb/+kC8ewjUDMNDszYpcN0n+3d5gsRXMwzrIDc0mVCidC
	 WxSYxoWHUZPM5oN4hyBa2UIcdBNJ+xkdmsCe1NW3r2bS6ZR2PiFhvQbqF+KUbgIIso
	 V8rIRDFzIdPC0OL9ZgDE6EIJZtMgg8E0/H0aMgdw=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v4 04/11] platform/x86: asus-wmi: Add support for multiple kbd
 RGB handlers
Date: Mon, 24 Mar 2025 22:01:44 +0100
Message-ID: <20250324210151.6042-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324210151.6042-1-lkml@antheas.dev>
References: <20250324210151.6042-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174285012978.23088.6500408720132805208@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Some devices, such as the Z13 have multiple AURA devices connected
to them by USB. In addition, they might have a WMI interface for
RGB. In Windows, Armoury Crate exposes a unified brightness slider
for all of them, with 3 brightness levels.

Therefore, to be synergistic in Linux, and support existing tooling
such as UPower, allow adding listeners to the RGB device of the WMI
interface. If WMI does not exist, lazy initialize the interface.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c            | 118 ++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h |  16 +++
 2 files changed, 121 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19b..ff1d7ccb3982f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -254,6 +254,8 @@ struct asus_wmi {
 	int tpd_led_wk;
 	struct led_classdev kbd_led;
 	int kbd_led_wk;
+	bool kbd_led_avail;
+	bool kbd_led_registered;
 	struct led_classdev lightbar_led;
 	int lightbar_led_wk;
 	struct led_classdev micmute_led;
@@ -1487,6 +1489,53 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
 
 /* LEDs ***********************************************************************/
 
+struct asus_hid_ref {
+	struct list_head listeners;
+	struct asus_wmi *asus;
+	spinlock_t lock;
+};
+
+struct asus_hid_ref asus_ref = {
+	.listeners = LIST_HEAD_INIT(asus_ref.listeners),
+	.asus = NULL,
+	.lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
+};
+
+int asus_hid_register_listener(struct asus_hid_listener *bdev)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	list_add_tail(&bdev->list, &asus_ref.listeners);
+	if (asus_ref.asus) {
+		if (asus_ref.asus->kbd_led_registered && asus_ref.asus->kbd_led_wk >= 0)
+			bdev->brightness_set(bdev, asus_ref.asus->kbd_led_wk);
+
+		if (!asus_ref.asus->kbd_led_registered) {
+			ret = led_classdev_register(
+				&asus_ref.asus->platform_device->dev,
+				&asus_ref.asus->kbd_led);
+			if (!ret)
+				asus_ref.asus->kbd_led_registered = true;
+		}
+	}
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(asus_hid_register_listener);
+
+void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	list_del(&bdev->list);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+}
+EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
@@ -1566,6 +1615,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 
 static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 {
+	struct asus_hid_listener *listener;
 	struct asus_wmi *asus;
 	int max_level;
 
@@ -1573,25 +1623,39 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	max_level = asus->kbd_led.max_brightness;
 
 	asus->kbd_led_wk = clamp_val(value, 0, max_level);
-	kbd_led_update(asus);
+
+	if (asus->kbd_led_avail)
+		kbd_led_update(asus);
+
+	list_for_each_entry(listener, &asus_ref.listeners, list)
+		listener->brightness_set(listener, asus->kbd_led_wk);
 }
 
 static void kbd_led_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
+	unsigned long flags;
+
 	/* Prevent disabling keyboard backlight on module unregister */
 	if (led_cdev->flags & LED_UNREGISTERING)
 		return;
 
+	spin_lock_irqsave(&asus_ref.lock, flags);
 	do_kbd_led_set(led_cdev, value);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
 }
 
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
 {
-	struct led_classdev *led_cdev = &asus->kbd_led;
+	struct led_classdev *led_cdev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	led_cdev = &asus->kbd_led;
 
 	do_kbd_led_set(led_cdev, value);
 	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
 }
 
 static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
@@ -1601,6 +1665,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
+	if (!asus->kbd_led_avail)
+		return asus->kbd_led_wk;
+
 	retval = kbd_led_read(asus, &value, NULL);
 	if (retval < 0)
 		return retval;
@@ -1716,7 +1783,15 @@ static int camera_led_set(struct led_classdev *led_cdev,
 
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
-	led_classdev_unregister(&asus->kbd_led);
+	unsigned long flags;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	asus_ref.asus = NULL;
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+
+	if (asus->kbd_led_registered)
+		led_classdev_unregister(&asus->kbd_led);
+
 	led_classdev_unregister(&asus->tpd_led);
 	led_classdev_unregister(&asus->wlan_led);
 	led_classdev_unregister(&asus->lightbar_led);
@@ -1730,6 +1805,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 static int asus_wmi_led_init(struct asus_wmi *asus)
 {
 	int rv = 0, num_rgb_groups = 0, led_val;
+	struct asus_hid_listener *listener;
+	unsigned long flags;
 
 	if (asus->kbd_rgb_dev)
 		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
@@ -1754,23 +1831,38 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
-		pr_info("using asus-wmi for asus::kbd_backlight\n");
+	asus->kbd_led.name = "asus::kbd_backlight";
+	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
+	asus->kbd_led.brightness_set = kbd_led_set;
+	asus->kbd_led.brightness_get = kbd_led_get;
+	asus->kbd_led.max_brightness = 3;
+	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
+
+	if (asus->kbd_led_avail)
 		asus->kbd_led_wk = led_val;
-		asus->kbd_led.name = "asus::kbd_backlight";
-		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
-		asus->kbd_led.brightness_set = kbd_led_set;
-		asus->kbd_led.brightness_get = kbd_led_get;
-		asus->kbd_led.max_brightness = 3;
+	else
+		asus->kbd_led_wk = -1;
 
-		if (num_rgb_groups != 0)
-			asus->kbd_led.groups = kbd_rgb_mode_groups;
+	if (asus->kbd_led_avail && num_rgb_groups != 0)
+		asus->kbd_led.groups = kbd_rgb_mode_groups;
 
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	if (asus->kbd_led_avail || !list_empty(&asus_ref.listeners)) {
 		rv = led_classdev_register(&asus->platform_device->dev,
 					   &asus->kbd_led);
-		if (rv)
+		if (rv) {
+			spin_unlock_irqrestore(&asus_ref.lock, flags);
 			goto error;
+		}
+		asus->kbd_led_registered = true;
+
+		if (asus->kbd_led_wk >= 0) {
+			list_for_each_entry(listener, &asus_ref.listeners, list)
+				listener->brightness_set(listener, asus->kbd_led_wk);
+		}
 	}
+	asus_ref.asus = asus;
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
 			&& (asus->driver->quirks->wapf > 0)) {
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 783e2a336861b..ec8b0c585a63f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -157,14 +157,30 @@
 #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
+struct asus_hid_listener {
+	struct list_head list;
+	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
+};
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
+
+int asus_hid_register_listener(struct asus_hid_listener *cdev);
+void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
 #else
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
 	return -ENODEV;
 }
+
+static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
+{
+	return -ENODEV;
+}
+static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
+{
+}
 #endif
 
 /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
-- 
2.49.0



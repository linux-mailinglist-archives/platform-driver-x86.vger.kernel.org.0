Return-Path: <platform-driver-x86+bounces-4465-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C6938D7D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jul 2024 12:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E6561F218BD
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jul 2024 10:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065C116D305;
	Mon, 22 Jul 2024 10:28:57 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269AD16C6B2;
	Mon, 22 Jul 2024 10:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644136; cv=none; b=Z8Snz1Fedgre5lXYbQ2PH3QYq8MQE8/8XIhr0bCAvkMziIC7crQmXFFChwsYDeuWLvda5n5md0ZZ3qNwCgHbMgdB49b5cDqEbjjAwb0UmnX7u4ADROKtRJxipTBKqUJBUuBS0Bd6Gj/2hE9/Z2SJbJ/TUR8eJEFs485kmYBx75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644136; c=relaxed/simple;
	bh=56WMsPbsSY0RbVDvdpXj8wG0akN+nZigMF9lgwhHcA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tCunR3EDjmkIfICpc208EiIVwLlfaEqTFEmDeK64Euadb/tbHvy0GGU4HnLd0qEDyRrIIP80UGJsNCiYZZNl5O8iXhDuXB+gsyjV2lF/0ayXoXbONxpprz/hErzFJLzPafBGAKn0TnxrRO5sPMjj/X15WiiaHKPUaoUjydEyMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68624.dsl.pool.telekom.hu [::ffff:81.182.134.36])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000738CF.00000000669E345E.001898D0; Mon, 22 Jul 2024 12:28:46 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Hans de Goede <hdegoede@redhat.com>,
  =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
  Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v3 4/4] platform/x86: ideapad-laptop: add a mutex to synchronize VPC commands
Date: Mon, 22 Jul 2024 12:27:24 +0200
Message-ID: <9d7f421575863d9f27d3ef61ef645b99bd1db5fe.1721294787.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721294787.git.soyer@irl.hu>
References: <cover.1721294787.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Calling VPC commands consists of several VPCW and VPCR ACPI calls.
These calls and their results can get mixed up if they are called
simultaneously from different threads, like acpi notify handler,
sysfs, debugfs, notification chain.

Add a mutex to synchronize VPC commands.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/platform/x86/ideapad-laptop.c | 62 +++++++++++++++++++--------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 8398774cdfe2..3bd519a28a46 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -155,6 +155,7 @@ struct ideapad_rfk_priv {
 
 struct ideapad_private {
 	struct acpi_device *adev;
+	struct mutex vpc_mutex; /* protects the VPC calls */
 	struct rfkill *rfk[IDEAPAD_RFKILL_DEV_NUM];
 	struct ideapad_rfk_priv rfk_priv[IDEAPAD_RFKILL_DEV_NUM];
 	struct platform_device *platform_device;
@@ -437,6 +438,8 @@ static int debugfs_status_show(struct seq_file *s, void *data)
 	struct ideapad_private *priv = s->private;
 	unsigned long value;
 
+	guard(mutex)(&priv->vpc_mutex);
+
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
 		seq_printf(s, "Backlight max:  %lu\n", value);
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
@@ -555,7 +558,8 @@ static ssize_t camera_power_show(struct device *dev,
 	unsigned long result;
 	int err;
 
-	err = read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		err = read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
 	if (err)
 		return err;
 
@@ -574,7 +578,8 @@ static ssize_t camera_power_store(struct device *dev,
 	if (err)
 		return err;
 
-	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		err = write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
 	if (err)
 		return err;
 
@@ -627,7 +632,8 @@ static ssize_t fan_mode_show(struct device *dev,
 	unsigned long result;
 	int err;
 
-	err = read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		err = read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
 	if (err)
 		return err;
 
@@ -649,7 +655,8 @@ static ssize_t fan_mode_store(struct device *dev,
 	if (state > 4 || state == 3)
 		return -EINVAL;
 
-	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		err = write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
 	if (err)
 		return err;
 
@@ -734,7 +741,8 @@ static ssize_t touchpad_show(struct device *dev,
 	unsigned long result;
 	int err;
 
-	err = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		err = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
 	if (err)
 		return err;
 
@@ -755,7 +763,8 @@ static ssize_t touchpad_store(struct device *dev,
 	if (err)
 		return err;
 
-	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		err = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
 	if (err)
 		return err;
 
@@ -1148,6 +1157,8 @@ static int ideapad_rfk_set(void *data, bool blocked)
 	struct ideapad_rfk_priv *priv = data;
 	int opcode = ideapad_rfk_data[priv->dev].opcode;
 
+	guard(mutex)(&priv->priv->vpc_mutex);
+
 	return write_ec_cmd(priv->priv->adev->handle, opcode, !blocked);
 }
 
@@ -1161,6 +1172,8 @@ static void ideapad_sync_rfk_state(struct ideapad_private *priv)
 	int i;
 
 	if (priv->features.hw_rfkill_switch) {
+		guard(mutex)(&priv->vpc_mutex);
+
 		if (read_ec_data(priv->adev->handle, VPCCMD_R_RF, &hw_blocked))
 			return;
 		hw_blocked = !hw_blocked;
@@ -1334,8 +1347,9 @@ static void ideapad_input_novokey(struct ideapad_private *priv)
 {
 	unsigned long long_pressed;
 
-	if (read_ec_data(priv->adev->handle, VPCCMD_R_NOVO, &long_pressed))
-		return;
+	scoped_guard(mutex, &priv->vpc_mutex)
+		if (read_ec_data(priv->adev->handle, VPCCMD_R_NOVO, &long_pressed))
+			return;
 
 	if (long_pressed)
 		ideapad_input_report(priv, 17);
@@ -1347,8 +1361,9 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
 {
 	unsigned long bit, value;
 
-	if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value))
-		return;
+	scoped_guard(mutex, &priv->vpc_mutex)
+		if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value))
+			return;
 
 	for_each_set_bit (bit, &value, 16) {
 		switch (bit) {
@@ -1381,6 +1396,8 @@ static int ideapad_backlight_get_brightness(struct backlight_device *blightdev)
 	unsigned long now;
 	int err;
 
+	guard(mutex)(&priv->vpc_mutex);
+
 	err = read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
 	if (err)
 		return err;
@@ -1393,6 +1410,8 @@ static int ideapad_backlight_update_status(struct backlight_device *blightdev)
 	struct ideapad_private *priv = bl_get_data(blightdev);
 	int err;
 
+	guard(mutex)(&priv->vpc_mutex);
+
 	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_BL,
 			   blightdev->props.brightness);
 	if (err)
@@ -1470,6 +1489,8 @@ static void ideapad_backlight_notify_power(struct ideapad_private *priv)
 	if (!blightdev)
 		return;
 
+	guard(mutex)(&priv->vpc_mutex);
+
 	if (read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power))
 		return;
 
@@ -1482,7 +1503,8 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
 
 	/* if we control brightness via acpi video driver */
 	if (!priv->blightdev)
-		read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
+		scoped_guard(mutex, &priv->vpc_mutex)
+			read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
 	else
 		backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
 }
@@ -1707,7 +1729,8 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	int ret;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
-	ret = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		ret = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value);
 	if (ret)
 		return;
 
@@ -1767,7 +1790,8 @@ static void ideapad_laptop_trigger_ec(void)
 	if (!priv->features.ymc_ec_trigger)
 		return;
 
-	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
+	scoped_guard(mutex, &priv->vpc_mutex)
+		ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
 	if (ret)
 		dev_warn(&priv->platform_device->dev, "Could not write YMC: %d\n", ret);
 }
@@ -1813,11 +1837,13 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 	struct ideapad_private *priv = data;
 	unsigned long vpc1, vpc2, bit;
 
-	if (read_ec_data(handle, VPCCMD_R_VPC1, &vpc1))
-		return;
+	scoped_guard(mutex, &priv->vpc_mutex) {
+		if (read_ec_data(handle, VPCCMD_R_VPC1, &vpc1))
+			return;
 
-	if (read_ec_data(handle, VPCCMD_R_VPC2, &vpc2))
-		return;
+		if (read_ec_data(handle, VPCCMD_R_VPC2, &vpc2))
+			return;
+	}
 
 	vpc1 = (vpc2 << 8) | vpc1;
 
@@ -2124,6 +2150,8 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	priv->adev = adev;
 	priv->platform_device = pdev;
 
+	devm_mutex_init(&pdev->dev, &priv->vpc_mutex);
+
 	ideapad_check_features(priv);
 
 	err = ideapad_sysfs_init(priv);
-- 
2.45.2



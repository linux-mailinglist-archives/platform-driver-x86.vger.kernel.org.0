Return-Path: <platform-driver-x86+bounces-7217-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4672C9D51A6
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Nov 2024 18:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F296D1F222E4
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Nov 2024 17:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4551A072C;
	Thu, 21 Nov 2024 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VO3CrKUA"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FFE1A01DD;
	Thu, 21 Nov 2024 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209810; cv=none; b=n4W9F/gYO7qiHX79Df0RIWHvtvzIlx5TKzAwzMsyqqzfNUnAfYGS0RdcdfaMMs6Xr8afZaXGBsWLJp06YhIoA4NAg61g9tVNV38x558guZ6koUlF5zG6M6EjMDa4ibsRn5r5w14y0otw25GJ+53KKH2FoMoroFpZHmg/LuiuJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209810; c=relaxed/simple;
	bh=mngo8D1rxnCSIwbaswcY0bQMhoFC17fuYtokYD09BMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTVmnAazaQkt9IrBCyvQQPIdlh4aPbz9tmt4+JTVOktjoXYLhryXVM0poEULmjaB3NznnUO5lkEWm2CxINm80x0Z8I6fKeF6fuAjfyit5RE1IYjKyraz8MijbIFmCTo3ha50XfuiuQPPgOa4eCKm8GYs4euPi440fj9lK0M462k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VO3CrKUA; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id C2D8E2E096AA;
	Thu, 21 Nov 2024 19:23:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1732209806;
	bh=ArI/jn7jjAjrFDZ6mHlYYhyyOVKap9QHSt5gxWhpUFA=; h=From:To:Subject;
	b=VO3CrKUAqMscIodeyPF5b7IKRSTjmVZsyenBsWxvzrZCQZjY8NSC8APGFhBH5/spl
	 7/VnQhkpp2UsXKjzqrfi8bxAxNAgwBK2RwnN72QrGwHPKmPBWdIisB562TKGrpyDsc
	 /lQMDrAzkIP8+usfB/y/bAh2WUdAK/LifjyxPi6U=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Kyle Gospodnetich <me@kylegospodneti.ch>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC 12/13] platform/x86: asus-wmi: remove Ally (1st gen) and Ally X
 suspend quirk
Date: Thu, 21 Nov 2024 18:22:37 +0100
Message-ID: <20241121172239.119590-13-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <173220980010.10092.9561175062432005585@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

By moving the Display On/Off calls outside of the suspend sequence and
introducing a slight delay after Display Off, the ROG Ally controller
functions exactly as it does in Windows.

Therefore, remove the quirk that fixed the controller only when the
mcu_powersave attribute was disabled, while adding a large amount of
delay to the suspend and wake process.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c | 54 ---------------------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index abdca3f05c5c..73a2ab214f56 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -142,29 +142,10 @@ module_param(fnlock_default, bool, 0444);
 #define ASUS_MINI_LED_2024_STRONG	0x01
 #define ASUS_MINI_LED_2024_OFF		0x02
 
-/* Controls the power state of the USB0 hub on ROG Ally which input is on */
-#define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
-/* 300ms so far seems to produce a reliable result on AC and battery */
-#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
-
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
 static int throttle_thermal_policy_write(struct asus_wmi *);
 
-static const struct dmi_system_id asus_ally_mcu_quirk[] = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "RC72L"),
-		},
-	},
-	{ },
-};
-
 static bool ashs_present(void)
 {
 	int i = 0;
@@ -274,9 +255,6 @@ struct asus_wmi {
 	u32 tablet_switch_dev_id;
 	bool tablet_switch_inverted;
 
-	/* The ROG Ally device requires the MCU USB device be disconnected before suspend */
-	bool ally_mcu_usb_switch;
-
 	enum fan_type fan_type;
 	enum fan_type gpu_fan_type;
 	enum fan_type mid_fan_type;
@@ -4770,8 +4748,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
 	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
-	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
-						&& dmi_check_system(asus_ally_mcu_quirk);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -4962,34 +4938,6 @@ static int asus_hotk_resume(struct device *device)
 	return 0;
 }
 
-static int asus_hotk_resume_early(struct device *device)
-{
-	struct asus_wmi *asus = dev_get_drvdata(device);
-
-	if (asus->ally_mcu_usb_switch) {
-		/* sleep required to prevent USB0 being yanked then reappearing rapidly */
-		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
-			dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
-		else
-			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
-	}
-	return 0;
-}
-
-static int asus_hotk_prepare(struct device *device)
-{
-	struct asus_wmi *asus = dev_get_drvdata(device);
-
-	if (asus->ally_mcu_usb_switch) {
-		/* sleep required to ensure USB0 is disabled before sleep continues */
-		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
-			dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
-		else
-			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
-	}
-	return 0;
-}
-
 static int asus_hotk_restore(struct device *device)
 {
 	struct asus_wmi *asus = dev_get_drvdata(device);
@@ -5034,8 +4982,6 @@ static const struct dev_pm_ops asus_pm_ops = {
 	.thaw = asus_hotk_thaw,
 	.restore = asus_hotk_restore,
 	.resume = asus_hotk_resume,
-	.resume_early = asus_hotk_resume_early,
-	.prepare = asus_hotk_prepare,
 };
 
 /* Registration ***************************************************************/
-- 
2.47.0



Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E241E21F4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Oct 2019 19:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731217AbfJWRmN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Oct 2019 13:42:13 -0400
Received: from smtp-out.abv.bg ([194.153.145.99]:42911 "EHLO smtp-out.abv.bg"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729283AbfJWRmM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Oct 2019 13:42:12 -0400
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Oct 2019 13:42:11 EDT
Received: from nm83.abv.bg (nm83.ni.bg [192.168.151.146])
        by smtp-out.abv.bg (Postfix) with UTF8SMTP id DE65C3E30
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2019 20:34:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
        t=1571852088; bh=mKm5HfGtO1I4wK51VlhDXTetqi78gMZd+P5boJCxlPs=;
        h=Date:From:To:Subject:From;
        b=i/wZLMrDZRowoA0mbrkaYjRmDqrsB3QwoOpjCyeaSf7pJSpQZObBTnXboN+ms5uiC
         Bzne+MNUjxr/Ol609NZKpCzs58t6EPOoNofK93nzGspNpcCqpkY9vCovlHfdEl4lDW
         veBCv3hNc78iep+tx4BRP6zcae1isb0Pi5mjB63c=
Received: from nm83.abv.bg (localhost [127.0.0.1])
        by nm83.abv.bg (Postfix) with UTF8SMTP id B062E9D7FA
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2019 20:34:48 +0300 (EEST)
Date:   Wed, 23 Oct 2019 20:34:47 +0300 (EEST)
From:   Kristian Angelov <kristiana2000@abv.bg>
To:     platform-driver-x86@vger.kernel.org
Message-ID: <214485435.80619.1571852088722@nm83.abv.bg>
Subject: ASUS FX505DT wmi backlight/amdgpu backlight conflict
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Mailer: AbvMail 3.0
X-Originating-IP: 217.105.38.84
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,


I own an ASUS FX505DT (integrated vega amdgpu), and the backlight control seems
to be conflicting with the asus-nb-wmi driver.


Upon booting normally with a standard kernel 5.3.7 on Arch, the asus-nb-wmi
driver gets loaded properly. It does not create any backlight devices in
/sys/class/backlight. However, ACPI-video seems to fail to get created and I get
This in my systemd log:


systemd-backlight[771]: Failed to get backlight or LED device 'backlight:acpi_vi
deo0': No such device


This implies that acpi_video0 gets registered by systemd but fails early on
during the boot process. Regardless, backlight seems to work fine using the
hotkeys as the only device present in /sys/class/backlight is amdgpu_bl0.


As any sane person, I want to remove those nasty fail messages from my log. with
the solution being to set acpi_backlight=vendor in my boot flags, which stops
acpi_video0 from being registered and removes the log, however asus-nb-wmi kicks
in and registers it's own backlight device. There are two backlight devices
currently active amdgpu_bl0 and asus-nb-wmi and the latter does not control the
backlight but seems to take priority in the keybinds.


I looked throught the driver and implemented the following:


index b361c73..e0ca145 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -105,6 +105,11 @@ static struct quirk_entry quirk_asus_x550lb = {
 	.xusb2pr = 0x01D9,
 };
 
+static struct quirk_entry quirk_asus_fx505dt = {
+	.wmi_backlight_power = true,
+	.wmi_backlight_set_devstate = true,
+};
+
 static struct quirk_entry quirk_asus_forceals = {
 	.wmi_backlight_set_devstate = true,
 	.wmi_force_als_set = true,
@@ -411,6 +416,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_forceals,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. FX505DT TESTING",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FX505DT"),
+		},
+		.driver_data = &quirk_asus_fx505dt,
+	},
 	{},
 };


where wmi_backlight_power is supposed to prevent the creation (or use) of this
new backlight device. However this does not seem to be the case. So far the only
way the backlight works is with acpi_backlight not defined at all. If I set it
to anything, even video, it creates another worthless backlight device. I do
believe this is either a bug in asus-wmi and wmi_backlight_power doing not what
it's supposed to. Either that or I am mistaken as to how any of this works, and
would like help with implementing my device.

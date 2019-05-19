Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF6FC227A8
	for <lists+platform-driver-x86@lfdr.de>; Sun, 19 May 2019 19:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfESRXj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 19 May 2019 13:23:39 -0400
Received: from ampleforth.srv.alexanderweb.de ([37.187.38.226]:58294 "EHLO
        ampleforth.srv.alexanderweb.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726079AbfESRXi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 May 2019 13:23:38 -0400
X-Greylist: delayed 1200 seconds by postgrey-1.27 at vger.kernel.org; Sun, 19 May 2019 13:23:37 EDT
Received: from aftr-37-201-227-26.unity-media.net ([37.201.227.26] helo=tuxpaddy.alexanderweb.homeip.net)
        by ampleforth.srv.alexanderweb.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <alex@alexanderweb.de>)
        id 1hSOxT-0003T2-Mp; Sun, 19 May 2019 18:46:47 +0200
Received: from alexander by tuxpaddy.alexanderweb.homeip.net with local (Exim 4.92)
        (envelope-from <alex@alexanderweb.de>)
        id 1hSOxT-00005q-An; Sun, 19 May 2019 18:46:47 +0200
From:   Alexander Schremmer <alex@alexanderweb.de>
To:     alex@alexanderweb.de, Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] Add Lenovo PrivacyGuard feature found in T480s, T490, T490s
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-Id: <E1hSOxT-00005q-An@tuxpaddy.alexanderweb.homeip.net>
Date:   Sun, 19 May 2019 18:46:47 +0200
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From 6bfe30cae2be3f4fbe9f9990a4e83302569ff7e9 Mon Sep 17 00:00:00 2001
From: Alexander Schremmer <alex@alexanderweb.de>
Date: Sun, 19 May 2019 18:13:05 +0200
Subject: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.

This feature is found optionally in T480s, T490, T490s.

The feature is called lcdshadow and visible via
/proc/acpi/ibm/lcdshadow.

The ACPI methods \_SB.PCI0.LPCB.EC.HKEY.{GSSS,SSSS,TSSS,CSSS} are
available in these machines. They get, set, toggle or change the state
apparently.

The patch was tested on a 5.0 series kernel on a T480s.

Signed-off-by: Alexander Schremmer <alex@alexanderweb.de>
---
 drivers/platform/x86/thinkpad_acpi.c | 108 +++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 71cfaf26efd1..f2603643b067 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9729,6 +9729,110 @@ static struct ibm_struct battery_driver_data = {
 	.exit = tpacpi_battery_exit,
 };
 
+/*************************************************************************
+ * LCD Shadow subdriver, for the Lenovo PrivacyGuard feature
+ */
+
+
+static int lcdshadow_state;
+
+static int lcdshadow_on_off(bool state)
+{
+	acpi_handle set_shadow_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(
+					hkey_handle,
+					"SSSS",
+					&set_shadow_handle))) {
+		pr_warn("Thinkpad ACPI has no %s interface.\n", "SSSS");
+		return -EIO;
+	}
+
+	if (!acpi_evalf(set_shadow_handle, &output, NULL, "dd", (int)state))
+		return -EIO;
+
+	lcdshadow_state = state;
+	return 0;
+}
+
+static int lcdshadow_set(bool on)
+{
+	if (lcdshadow_state < 0 || lcdshadow_state == on)
+		return lcdshadow_state;
+	return lcdshadow_on_off(on);
+}
+
+static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
+{
+	acpi_handle get_shadow_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(
+					hkey_handle,
+					"GSSS",
+					&get_shadow_handle))) {
+		lcdshadow_state = -ENODEV;
+		return 0;
+	}
+
+	if (!acpi_evalf(get_shadow_handle, &output, NULL, "dd", 0))
+		return -EIO;
+	if (!(output & 0x10000)) {
+		lcdshadow_state = -ENODEV;
+		return 0;
+	}
+	lcdshadow_state = output & 0x1;
+
+	return 0;
+}
+
+static void lcdshadow_resume(void)
+{
+	if (lcdshadow_state >= 0)
+		lcdshadow_on_off(lcdshadow_state);
+}
+
+static int lcdshadow_read(struct seq_file *m)
+{
+	if (lcdshadow_state < 0) {
+		seq_puts(m, "status:\t\tnot supported\n");
+	} else {
+		seq_printf(m, "status:\t\t%d\n", lcdshadow_state);
+		seq_puts(m, "commands:\t0, 1\n");
+	}
+
+	return 0;
+}
+
+static int lcdshadow_write(char *buf)
+{
+	char *cmd;
+	int state = -1;
+
+	if (lcdshadow_state < 0)
+		return -ENODEV;
+
+	while ((cmd = next_cmd(&buf))) {
+		if (strlencmp(cmd, "0") == 0)
+			state = 0;
+		else if (strlencmp(cmd, "1") == 0)
+			state = 1;
+	}
+
+	if (state == -1)
+		return -EINVAL;
+
+	return lcdshadow_set(state);
+}
+
+static struct ibm_struct lcdshadow_driver_data = {
+	.name = "lcdshadow",
+	.resume = lcdshadow_resume,
+	.read = lcdshadow_read,
+	.write = lcdshadow_write,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -10210,6 +10314,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_battery_init,
 		.data = &battery_driver_data,
 	},
+	{
+		.init = tpacpi_lcdshadow_init,
+		.data = &lcdshadow_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.20.1


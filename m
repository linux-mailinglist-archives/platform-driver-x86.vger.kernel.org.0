Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B42992DA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 Aug 2019 14:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730531AbfHVMHf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 22 Aug 2019 08:07:35 -0400
Received: from ampleforth.srv.alexanderweb.de ([37.187.38.226]:37518 "EHLO
        ampleforth.srv.alexanderweb.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728451AbfHVMHf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Aug 2019 08:07:35 -0400
X-Greylist: delayed 1124 seconds by postgrey-1.27 at vger.kernel.org; Thu, 22 Aug 2019 08:07:33 EDT
Received: from aftr-37-201-227-212.unity-media.net ([37.201.227.212] helo=tuxpaddy.alexanderweb.homeip.net)
        by ampleforth.srv.alexanderweb.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <alex@alexanderweb.de>)
        id 1i0la7-00070V-Fn; Thu, 22 Aug 2019 13:48:43 +0200
Received: from alexander by tuxpaddy.alexanderweb.homeip.net with local (Exim 4.92)
        (envelope-from <alexander@tuxpaddy.alexanderweb.homeip.net>)
        id 1i0la7-0007n9-4x; Thu, 22 Aug 2019 13:48:43 +0200
From:   Alexander Schremmer <alex@alexanderweb.de>
To:     andy.shevchenko@gmail.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Alexander Schremmer <alex@alexanderweb.de>
Subject: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.
Date:   Thu, 22 Aug 2019 13:48:33 +0200
Message-Id: <20190822114833.29885-1-alex@alexanderweb.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAHp75VdMZMxGJpmi6wQMa8FJdzpkPq7nA=kFf4pUSrskrTtFeA@mail.gmail.com>
References: <CAHp75VdMZMxGJpmi6wQMa8FJdzpkPq7nA=kFf4pUSrskrTtFeA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This feature is found optionally in T480s, T490, T490s.

The feature is called lcdshadow and visible via
/proc/acpi/ibm/lcdshadow.

The ACPI methods \_SB.PCI0.LPCB.EC.HKEY.{GSSS,SSSS,TSSS,CSSS} are
available in these machines. They get, set, toggle or change the state
apparently.

The patch was tested on a 5.0 series kernel on a T480s.

Signed-off-by: Alexander Schremmer <alex@alexanderweb.de>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  23 ++++
 drivers/platform/x86/thinkpad_acpi.c          | 112 ++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index adea0bf2acc5..822907dcc845 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -49,6 +49,7 @@ detailed description):
 	- Fan control and monitoring: fan speed, fan enable/disable
 	- WAN enable and disable
 	- UWB enable and disable
+	- LCD Shadow (PrivacyGuard) enable and disable
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1409,6 +1410,28 @@ Sysfs notes
 	Documentation/driver-api/rfkill.rst for details.
 
 
+LCD Shadow control
+------------------
+
+procfs: /proc/acpi/ibm/lcdshadow
+
+Some newer T480s and T490s ThinkPads provide a feature called
+PrivacyGuard. By turning this feature on, the usable vertical and
+horizontal viewing angles of the LCD can be limited (as if some privacy
+screen was applied manually in front of the display).
+
+procfs notes
+^^^^^^^^^^^^
+
+The available commands are::
+
+	echo '0' >/proc/acpi/ibm/lcdshadow
+	echo '1' >/proc/acpi/ibm/lcdshadow
+
+The first command ensures the best viewing angle and the latter one turns
+on the feature, restricting the viewing angles.
+
+
 EXPERIMENTAL: UWB
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7bde4640ef34..12bf573c6568 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9714,6 +9714,114 @@ static struct ibm_struct battery_driver_data = {
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
+	if (lcdshadow_state < 0)
+		return lcdshadow_state;
+	if (lcdshadow_state == on)
+		return 0;
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
+	if (!acpi_evalf(get_shadow_handle, &output, NULL, "dd", 0)) {
+		lcdshadow_state = -EIO;
+		return -EIO;
+	}
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
@@ -10195,6 +10303,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1680F248E82
	for <lists+platform-driver-x86@lfdr.de>; Tue, 18 Aug 2020 21:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHRTQQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 18 Aug 2020 15:16:16 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.112]:33362 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726585AbgHRTQP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Aug 2020 15:16:15 -0400
Received: from [100.112.135.196] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-west-2.aws.symcld.net id 44/CE-29381-BF82C3F5; Tue, 18 Aug 2020 19:16:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsWS8eIhr+5vDZt
  4g9crxSwmzfjPbDH7sI3FnGdrGS1W73nB7MDi8fsAo8fmFVoeuxd8ZvL4vEkugCWKNTMvKb8i
  gTWjr8GzoFm/4uvOj2wNjN/Uuxi5OIQE/jNKnLp2kQnCec0ocaS9g7WLkZODTUBbYsuWX2xdj
  BwcIgIyEh/WeoKEmQUWMUo83KMNYgsLOEm8WNrDDFLCIqAq0X4+ByTMK2AjsXrXFyYQW0JAXq
  J9+XY2EJsTqORM12MWEFtIQEXi/oMlbBD1ghInZz5hgRgvL9G8dTYzhC0hcfDFC2aYOXMXrmS
  HsBMklr28wzyBUWAWkvZZSNpnIWlfwMi8itEiqSgzPaMkNzEzR9fQwEDX0NBI19DYRNfQxFgv
  sUo3Sa+0WLc8tbhE10gvsbxYr7gyNzknRS8vtWQTIzDcUwra+ncwrn/zQe8QoyQHk5Io714em
  3ghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxawAgSEixKTU+tSMvMAcYeTFqCg0dJhHeRClCat7
  ggMbc4Mx0idYpRl+PkqiWLmIVY8vLzUqXEedeCzBAAKcoozYMbAUsDlxhlpYR5GRkYGIR4ClK
  LcjNLUOVfMYpzMCoJ80qoAk3hycwrgdv0CugIJqAjJCotQY4oSURISTUwGT2suHw/r1hp2q81
  0pfVomu7GpxvMalZnO4SWF6rdPXaxGlrvc+75hWUiPnON2v9tlF254wIBsb34edni7CdauEXX
  nZWPeqT0GUNxew1Kq9YHxmx6JTr5LUWT3uxKLCIhXvSs1Nbk+dYr1j0bMnfmQapF3pUXAyKty
  f75LEnlP/arPdheZalomb0iR0rNSafYsxodV33I+V8/n3ehRflls5vkl+3dcWb5Tx/aoscdx1
  exibF6XXvzJso/fiFR3ZMe+vnrz/bMC2LJ9HemvF2dPb+xyxTee/EXAg/sP31uY6F71mTN39c
  MlmyInL2vANvUrnrhOR28bEZ+q50NmpsPx84ZeX5+7FG4TbfCsWclFiKMxINtZiLihMBftPlv
  n4DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-346.messagelabs.com!1597778170!9188!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26614 invoked from network); 18 Aug 2020 19:16:11 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-15.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Aug 2020 19:16:11 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id C643AE5FB16B65716A39;
        Tue, 18 Aug 2020 15:16:09 -0400 (EDT)
Received: from localhost.localdomain.com (10.38.58.36) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Tue, 18 Aug 2020 12:16:02 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <andy@infradead.org>, <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>, <ibm-acpi@hmh.eng.br>,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: [PATCH v3] platform/x86: thinkpad_acpi: psensor interface
Date:   Tue, 18 Aug 2020 15:15:58 -0400
Message-ID: <20200818191558.280009-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.38.58.36]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some Lenovo Thinkpad platforms are equipped with a 'palm sensor' so as
to be able to determine if a user is physically proximate to the device.

This patch provides the ability to retrieve the psensor state via sysfs
entrypoints and will be used by userspace for WWAN functionality to
control the transmission level safely

Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - addressed formatting and coding style errors identified during review
Changes in v3:
 - I had missed updating thinkpad-acpi.rst in the v2 update so adding
   that back so it is correct. 

 .../admin-guide/laptops/thinkpad-acpi.rst     |  18 +++
 drivers/platform/x86/thinkpad_acpi.c          | 107 +++++++++++++++++-
 2 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 5e477869df18..6b57c52d8f13 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -51,6 +51,7 @@ detailed description):
 	- UWB enable and disable
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
+        - Palm sensor (aka psensor)
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1447,6 +1448,23 @@ they differ between desk and lap mode.
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+Palm sensor
+------------------
+
+sysfs: psensor_state
+
+Certain thinkpads and mobile workstations are equipped with a palm sensor to
+detect when a user is physically near the device. This device, when present,
+is used in conjunction with the lapmode sensor to decide if WWAN transmission
+can be increased to maximum power.
+
+The property is read-only. If the platform doesn't have support the sysfs
+class is not created.
+
+Note - some platforms have a limitation whereby the EC firmware cannot
+determine if the sensor is installed or not. On these platforms the psensor
+state will always be reported as true to avoid high power being used incorrectly.
+
 EXPERIMENTAL: UWB
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 4864a5c189d4..41b75dd4755c 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4079,10 +4079,9 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	case TP_HKEY_EV_PALM_DETECTED:
 	case TP_HKEY_EV_PALM_UNDETECTED:
-		/* palm detected hovering the keyboard, forward to user-space
-		 * via netlink for consumption */
+		/* palm detected - pass on to event handler */
+		tpacpi_driver_event(hkey);
 		return true;
-
 	default:
 		/* report simply as unknown, no sensor dump */
 		return false;
@@ -9916,6 +9915,99 @@ static struct ibm_struct dytc_driver_data = {
 	.exit = dytc_exit,
 };
 
+/**********************************************************************
+ * Palm sensor subdriver
+ */
+
+#define PSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
+#define PSENSOR_ON_BIT      1 /* psensor status */
+
+static bool psensor_state;
+
+static void psensor_notify_change(void)
+{
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "psensor_state");
+}
+
+static int psensor_get(bool *state)
+{
+	acpi_handle psensor_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
+		return -ENODEV;
+
+	if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
+		return -EIO;
+
+	/* Check if sensor has a Psensor */
+	if (!(output & BIT(PSENSOR_PRESENT_BIT)))
+		return -ENODEV;
+
+	/* Return if psensor is set or not */
+	*state = output & BIT(PSENSOR_ON_BIT) ? true : false;
+	return 0;
+}
+
+static void psensor_state_refresh(void)
+{
+	bool new_state;
+	int err;
+
+	err = psensor_get(&new_state);
+	if (err || (new_state == psensor_state))
+		return;
+
+	psensor_state = new_state;
+	psensor_notify_change();
+}
+
+/* sysfs psensor entry */
+static ssize_t psensor_state_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	return sprintf(buf, "%d\n", psensor_state);
+}
+static DEVICE_ATTR_RO(psensor_state);
+
+static struct attribute *psensor_attributes[] = {
+	&dev_attr_psensor_state.attr,
+	NULL
+};
+
+static const struct attribute_group psensor_attr_group = {
+	.attrs = psensor_attributes,
+};
+
+static int tpacpi_psensor_init(struct ibm_init_struct *iibm)
+{
+	int err;
+
+	err = psensor_get(&psensor_state);
+	/*
+	 * If support isn't available (ENODEV) then don't return an error,
+	 * just don't create the sysfs group.
+	 */
+	if (err == -ENODEV)
+		return 0;
+	/* For all other errors we can flag the failure */
+	if (err)
+		return err;
+
+	return sysfs_create_group(&tpacpi_pdev->dev.kobj, &psensor_attr_group);
+}
+
+static void psensor_exit(void)
+{
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &psensor_attr_group);
+}
+
+static struct ibm_struct psensor_driver_data = {
+	.name = "psensor",
+	.exit = psensor_exit,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -9967,6 +10059,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
 		dytc_lapmode_refresh();
 
+	if ((hkey_event == TP_HKEY_EV_PALM_DETECTED) ||
+		(hkey_event == TP_HKEY_EV_PALM_UNDETECTED))
+		psensor_state_refresh();
+
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
@@ -10409,6 +10505,11 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_dytc_init,
 		.data = &dytc_driver_data,
 	},
+	{
+		.init = tpacpi_psensor_init,
+		.data = &psensor_driver_data,
+	},
+
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.26.2


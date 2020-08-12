Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1D6242EBF
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Aug 2020 20:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHLSxz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Aug 2020 14:53:55 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:17183 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726447AbgHLSxx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Aug 2020 14:53:53 -0400
Received: from [100.112.1.169] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 50/C7-60747-FBA343F5; Wed, 12 Aug 2020 18:53:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsWS8eIhj+5+K5N
  4g7fnJS0mzfjPbDH7sI3FnGdrGS1W73nB7MDi8fsAo8fmFVoeuxd8ZvL4vEkugCWKNTMvKb8i
  gTVjwyPzgiVKFb9fn2JqYFws28XIxSEk8J9R4nFHAxOE84ZRYlPHF9YuRk4ONgFtiS1bfrF1M
  XJwiAjISHxY6wlSwyywiFHi/pyH7CBxYQEnib9HeUDKWQRUJfp+72ECsXkFbCTuLHjBBmJLCM
  hLtC/fDmZzAtWc6XrMAmILCahI3H+whA2iXlDi5MwnYHFmoPrmrbOZIWwJiYMvXjBDzFGQmHJ
  +N5SdILHs5R3mCYwCs5C0z0LSPgtJ+wJG5lWMpklFmekZJbmJmTm6hgYGuoaGRrpGumaWeolV
  ukl6pcW6qYnFJbqGeonlxXrFlbnJOSl6eaklmxiBoZ5SwOS6g/H36w96hxglOZiURHl79Ezih
  fiS8lMqMxKLM+KLSnNSiw8xynBwKEnwfrUEygkWpaanVqRl5gDjDiYtwcGjJMLrDYw9Id7igs
  Tc4sx0iNQpRkUpcV57kIQASCKjNA+uDRbrlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8xa
  CbOfJzCuBm/4KaDET0OKGfkOQxSWJCCmpBqZYpqiKvd36jP8Mvyu9fXg37uDBDdL5tfeeXk97
  kn063vnu/hcqu2tuCP5KFTeTPLTq7hZ1viPL9Dq3Fr3Rf98+Oe/2/D8PKxfbb77qNfHRV6MiI
  cO3fYnqKhE8/X1vxVbE/Hbcsir1m13JP3+tjm4XXslrfhr1E23fHPD3Kl8fVJ3xctuiTXFT3g
  WU3d8oHf/u5ZPD1e2LSyseWDW0iXD/im1kP/gtYE/DbOFjuy6si1U6yJR2NPj218AA3qMB31J
  kpFP2Ol9V7qmITnrqcOqXbaffgYnORgdYfyeu+ajyb6MN+7LDs2e8DI3R2fQo17G+eq+k554r
  9h2rBNc8/CrbvfKiwZ8b7Gt+MMuEzD2ixFKckWioxVxUnAgAD9D6hnADAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-20.tower-396.messagelabs.com!1597258431!772075!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29509 invoked from network); 12 Aug 2020 18:53:51 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-20.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Aug 2020 18:53:51 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 3757C5ED8A854529CC94;
        Wed, 12 Aug 2020 14:53:51 -0400 (EDT)
Received: from localhost.localdomain.com (10.64.92.252) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Wed, 12 Aug 2020 11:53:48 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>, <andy@infradead.org>,
        <ibm-acpi@hmh.eng.br>, Nitin Joshi <njoshi1@lenovo.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: psensor interface
Date:   Wed, 12 Aug 2020 14:53:32 -0400
Message-ID: <20200812185332.277167-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.92.252]
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

 drivers/platform/x86/thinkpad_acpi.c | 107 ++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 3 deletions(-)

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


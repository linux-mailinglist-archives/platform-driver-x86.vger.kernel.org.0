Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3854A1EC559
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Jun 2020 00:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728980AbgFBW4z (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Jun 2020 18:56:55 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.113]:8439 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728344AbgFBW4y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Jun 2020 18:56:54 -0400
Received: from [100.112.132.93] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-west-2.aws.symcld.net id C2/19-18598-439D6DE5; Tue, 02 Jun 2020 22:56:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsWSLveKTdfk5rU
  4g8NbeC1mH7axmPNsLaPF6j0vmB2YPX4fYPTYveAzk8fnTXIBzFGsmXlJ+RUJrBkXT5gX7FWu
  mP9wIUsD43q5LkYuDiGB/4wSHVdmsEE4zxkl9nXOZ+9i5ORgE9CW2LLlF1CCg0NEQEbiw1pPk
  BpmgY2MEnv/fmIFqREW8JZYsH8TG4jNIqAicbX1DVgvr4CVxIlX78HiEgLyEu3Lt4PZnAKqEm
  e6HrOA2EJA9fcfLGGDqBeUODnzCVicGai+eetsZghbQuLgixfMEHMUJFad7maFsBMklr28wzy
  BUWAWkvZZSNpnIWlfwMi8itEiqSgzPaMkNzEzR9fQwEDX0NBI19DYRNfQxFgvsUo3Sa+0WLc8
  tbhE10gvsbxYr7gyNzknRS8vtWQTIzDAUwra+ncwrn/zQe8QoyQHk5Ior/vea3FCfEn5KZUZi
  cUZ8UWlOanFhxhlODiUJHj9rgPlBItS01Mr0jJzgNEGk5bg4FES4d0FkuYtLkjMLc5Mh0idYl
  SUEufdApIQAElklObBtcEi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5+kCk8mXklcNN
  fAS1mAlps3we2uCQRISXVwNStnGD16ULhrmKt+OW7Z64TeXbQOlnz8SM/0+f/vxzk2dq4Mfuy
  eKPXbg9jbh9vBZu7TGIH5CXjJYN0MhIXC6Uc0NZk3GJ3zti7ovXIhPB8/5bMsOhM5Q7Ba9bhA
  V3PNmvMeOTnnLT9egjT7D72gOX7y68s2ex2nVX47YcPyevj3xmyxX4LOcC71+jaWbHtXU/033
  5J2nw2uLCUc09yg8P+H//Mn6T3ZO/4yp5ib3Y27fO2CXNNY+ffYnGe73v9emi56v2q8xFiKuZ
  /mNk37b17+LZlrezh8ucBX2tCmOsO59c+2RAybfHO25+3LVyUHOK0PvqU+79NQX3thk9UGc7F
  XJM4b7VV4kDBp00Bq5RYijMSDbWYi4oTATKgj+trAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-355.messagelabs.com!1591138609!22923!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26495 invoked from network); 2 Jun 2020 22:56:51 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-19.tower-355.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Jun 2020 22:56:51 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id D773747A47B2C5552B08;
        Wed,  3 Jun 2020 06:56:47 +0800 (CST)
Received: from localhost.localdomain (10.64.88.167) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Tue, 2 Jun 2020
 15:56:43 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <ibm-acpi@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: lap or desk mode interface
Date:   Tue, 2 Jun 2020 18:56:15 -0400
Message-ID: <20200602225615.8336-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.88.167]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  Newer Lenovo Thinkpad platforms have support to identify whether the
  system is on-lap or not using an ACPI DYTC event from the firmware.

  This patch provides the ability to retrieve the current mode via sysfs
  entrypoints and will be used by userspace for thermal mode and WWAN
  functionality

Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
Reviewed-by: Sugumaran <slacshiminar@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
- cleaned up initialisation sequence to be cleaner and avoid spamming
  platforms that don't have DYTC with warning message. Tested on P52
- Adding platform-driver-x86 mailing list for review as requested

 drivers/platform/x86/thinkpad_acpi.c | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0f704484ae1d..8f51bbba21cd 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4049,6 +4049,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
 		/* recommended action: do nothing, we don't have
 		 * Lenovo ATM information */
+		tpacpi_driver_event(hkey);
 		return true;
 	case TP_HKEY_EV_THM_TRANSFM_CHANGED:
 		pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
@@ -9811,6 +9812,110 @@ static struct ibm_struct lcdshadow_driver_data = {
 	.write = lcdshadow_write,
 };
 
+/*************************************************************************
+ * DYTC subdriver, for the Lenovo performace mode feature
+ */
+
+#define DYTC_CMD_GET      2 /*To get current IC function and mode*/
+
+#define DYTC_GET_ENABLE_MASK  0x1 /*0 = disabled, 1 = enabled*/
+#define DYTC_GET_LAPMODE_SHIFT 17
+
+static int  dytc_lapmode;
+static void dytc_lapmode_notify_change(void)
+{
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
+			"dytc_lapmode");
+}
+
+static int dytc_command(int command)
+{
+	acpi_handle dytc_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
+		/*Platform doesn't support DYTC*/
+		return -ENODEV;
+	}
+	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", command))
+		return -EIO;
+	return output;
+}
+
+static int dytc_lapmode_get(void)
+{
+	int output;
+
+	output = dytc_command(DYTC_CMD_GET);
+	if ((output == -ENODEV) || (output == -EIO))
+		return output;
+
+	return ((output >> DYTC_GET_LAPMODE_SHIFT) &
+				DYTC_GET_ENABLE_MASK);
+}
+
+static void dytc_lapmode_refresh(void)
+{
+	int new_state;
+
+	new_state = dytc_lapmode_get();
+	if ((new_state == -ENODEV) || (new_state == -EIO))
+		return;
+
+	if (dytc_lapmode != new_state) {
+		dytc_lapmode = new_state;
+		dytc_lapmode_notify_change();
+	}
+}
+
+/* sysfs lapmode entry */
+static ssize_t dytc_lapmode_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	if (dytc_lapmode < 0)
+		return dytc_lapmode;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
+}
+
+static DEVICE_ATTR_RO(dytc_lapmode);
+
+static struct attribute *dytc_attributes[] = {
+	&dev_attr_dytc_lapmode.attr,
+	NULL
+};
+
+static const struct attribute_group dytc_attr_group = {
+	.attrs = dytc_attributes,
+};
+
+static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
+{
+	int res;
+
+	dytc_lapmode = dytc_lapmode_get();
+
+	if (dytc_lapmode < 0 && dytc_lapmode != -ENODEV)
+		return dytc_lapmode;
+
+	res = sysfs_create_group(&tpacpi_pdev->dev.kobj,
+				&dytc_attr_group);
+
+	return res;
+}
+
+static void dytc_exit(void)
+{
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj,
+			&dytc_attr_group);
+}
+
+static struct ibm_struct dytc_driver_data = {
+	.name = "dytc",
+	.exit = dytc_exit
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -9858,6 +9963,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 
 		mutex_unlock(&kbdlight_mutex);
 	}
+
+	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
+		dytc_lapmode_refresh();
+
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
@@ -10296,6 +10405,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_lcdshadow_init,
 		.data = &lcdshadow_driver_data,
 	},
+	{
+		.init = tpacpi_dytc_init,
+		.data = &dytc_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.26.2


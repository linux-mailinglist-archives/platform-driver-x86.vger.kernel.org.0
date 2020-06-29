Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5CA20D67D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jun 2020 22:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgF2TUh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 29 Jun 2020 15:20:37 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:47841 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728103AbgF2TUg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Jun 2020 15:20:36 -0400
Received: from [100.112.1.169] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 2D/88-60747-10F3AFE5; Mon, 29 Jun 2020 19:20:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsWSLveKTZfR/le
  cwffd0hYP5qZbzD5sYzHn2VpGi9V7XjA7sHj8PsDosXvBZyaP9/uusnl83iQXwBLFmpmXlF+R
  wJrx6OdJxoJlahXLfu5jbmC8otDFyMUhJPCfUWLC+20sEM5rRon3E14zdjFycrAJaEts2fKLr
  YuRg0NEQEbiw1pPkBpmgeOMEncPX2IDqREW8JbY/HMFK4jNIqAqMefBbGYQm1fASuJs81cwW0
  JAXqJ9+Xawek6gmjNdj1lAbCEBFYn7D5awQdQLSpyc+QQszgxU37wVYg6zgITEwRcv4Ob0X9z
  GAmEnSCx7eYd5AqPALCTts5C0z0LSvoCReRWjWVJRZnpGSW5iZo6uoYGBrqGhkS4QmhrrJVbp
  JumVFuumJhaX6BrqJZYX6xVX5ibnpOjlpZZsYgQGfEoB098djOdef9A7xCjJwaQkysug8ytOi
  C8pP6UyI7E4I76oNCe1+BCjDAeHkgRvrzVQTrAoNT21Ii0zBxh9MGkJDh4lEV57O6A0b3FBYm
  5xZjpE6hSjopQ4b6wVUEIAJJFRmgfXBov4S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeXV
  tgabwZOaVwE1/BbSYCWjxNS2wxSWJCCmpBibhySw+pz1yvTPN18+ZyJpj9f78xwmVSufmPOK7
  HXb45jnv7Omz5r6N/VxqxzjF+5UOq63znwUHfz10mG7k8br+6su1MV8kz3N2KnnHrQqoPiWT9
  lpZat2JsE/L+Ndun1a9qqTs/9pjOipMnYa3iswWNq3zvnjsRUvSxcOu5615BT4L3NDh29l/4P
  ak/Wd7fL+5zTCLb9v5ruk1q8p1edPJDfX3PnW+PXXPwig8cuL7bQVavA05bOq8c5NiJsYe5Ld
  JunPp5xJRuS1sUQEvp3Pryl2WlnJJYn8bv/bzau0XXNwHymaHigdOXvKwI+/wlU2Xv2cH+ovs
  XfVkxlrV4BydifyPp3fx79Y4PWv3pP98SizFGYmGWsxFxYkAAonsT3MDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-22.tower-395.messagelabs.com!1593458431!1208424!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32376 invoked from network); 29 Jun 2020 19:20:33 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-22.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jun 2020 19:20:33 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id CB865D54E71981940208;
        Tue, 30 Jun 2020 03:20:29 +0800 (CST)
Received: from localhost.localdomain.com (10.64.85.20) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Mon, 29 Jun 2020 12:20:25 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <ibm-acpi@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>, <bnocera@redhat.com>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Subject: [PATCH v4] platform/x86: thinkpad_acpi: lap or desk mode interface
Date:   Mon, 29 Jun 2020 15:17:48 -0400
Message-ID: <20200629191748.3859-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.85.20]
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
Changes in v4:
 - Correct hotkey event comment as we're handling event
 - Remove unnecessary check in dytc_lapmode_refresh
Changes in v3:
- Fixed inaccurate comments
- Used BIT macro to check lapmode bit setting as recommended and update
  define name
- Check for new_state == dytc_lapmode in dytc_lapmode_refresh

Changes in v2:
- cleaned up initialisation sequence to be cleaner and avoid spamming
  platforms that don't have DYTC with warning message. Tested on P52
- Adding platform-driver-x86 mailing list for review as requested

 drivers/platform/x86/thinkpad_acpi.c | 111 ++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0f704484ae1d..859b40c7113e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4047,8 +4047,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		return true;
 	case TP_HKEY_EV_THM_CSM_COMPLETED:
 		pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
-		/* recommended action: do nothing, we don't have
-		 * Lenovo ATM information */
+		/* Thermal event - pass on to event handler */
+		tpacpi_driver_event(hkey);
 		return true;
 	case TP_HKEY_EV_THM_TRANSFM_CHANGED:
 		pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
@@ -9811,6 +9811,105 @@ static struct ibm_struct lcdshadow_driver_data = {
 	.write = lcdshadow_write,
 };
 
+/*************************************************************************
+ * DYTC subdriver, for the Lenovo lapmode feature
+ */
+
+#define DYTC_CMD_GET          2 /* To get current IC function and mode */
+#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
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
+		/* Platform doesn't support DYTC */
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
+	return (output & BIT(DYTC_GET_LAPMODE_BIT) ? 1 : 0);
+}
+
+static void dytc_lapmode_refresh(void)
+{
+	int new_state;
+
+	new_state = dytc_lapmode_get();
+	if ((new_state == -ENODEV) || (new_state == -EIO) || (new_state == dytc_lapmode))
+		return;
+
+	dytc_lapmode = new_state;
+	dytc_lapmode_notify_change();
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
@@ -9858,6 +9957,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 
 		mutex_unlock(&kbdlight_mutex);
 	}
+
+	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
+		dytc_lapmode_refresh();
+
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
@@ -10296,6 +10399,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


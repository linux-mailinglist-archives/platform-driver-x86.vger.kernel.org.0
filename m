Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF5E2069F1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Jun 2020 04:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388166AbgFXCIh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 23 Jun 2020 22:08:37 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.116]:11062 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730898AbgFXCIg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jun 2020 22:08:36 -0400
Received: from [100.112.134.230] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-west-2.aws.symcld.net id 6D/91-53963-1A5B2FE5; Wed, 24 Jun 2020 02:08:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsWS8eIhr+7CrZ/
  iDM69E7d4MDfdYvZhG4s5z9YyWqze84LZgcXj9wFGj90LPjN5vN93lc3j8ya5AJYo1sy8pPyK
  BNaM2W/usxTcVal4cEO/gXGVfBcjF4eQwH9GiXmNL9i6GDmBnDeMEktXOIPYbALaElu2/AKKc
  3CICMhIfFjrCVLPLHCCUeLtiXeMIDXCAt4SXzavButlEVCVePH8JwuIzStgLTHvSTdYjYSAvE
  T78u1gNZxANWe6HrNA7FKRuP9gCRtEvaDEyZlPwOLMQPXNW2czQ9gSEgdfvGCGmKMgceTqNFY
  IO0Fi2cs7zBMYBWYhaZ+FpH0WkvYFjMyrGC2SijLTM0pyEzNzdA0NDHQNDY10DY2NdY0MjfUS
  q3ST9EqLdctTi0t0jfQSy4v1iitzk3NS9PJSSzYxAgM+paD16g7GOW8+6B1ilORgUhLlXbXuU
  5wQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6GBKCcYFFqempFWmYOMPpg0hIcPEoivMs3A6V5iw
  sSc4sz0yFSpxgVpcR5F28BSgiAJDJK8+DaYBF/iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5I
  w7wmQ8TyZeSVw018BLWYCWizpCLa4JBEhJdXAlPMhb0aVan7lmjtrX/LuDWa8mZDw+ntM6OJI
  nQP6jFNKMyyFNJ4ETv3rfO33/ct6Vee/ruUSeXBEzp3tS9aVhNcZOyKc5uW/3B2pH1Ai2/9bO
  0Y+oatkQ45+tU9EShVrdxhfpskWl4N7Xwi1C78X+WDJe1cmctZ0Zk6ubEfWC7mcSSci597+L9
  NdHlVimTGJRc2JjX9j3c52CR6p7Nlij9ZPL73tu+LcpFuHzc8byh6YqSLGmaVY1PPR1bt6epj
  Xd2k104l2ixwyzGx1vnezPJPcm7N/u9se/22x0ekT7hi8V6z6HiGSPkOScfHC62rHvBXmys24
  +7anUle2ozwp/ccj3/eMG8VmLXztVqDEUpyRaKjFXFScCAAZcXd2cwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-20.tower-346.messagelabs.com!1592964511!21360!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21839 invoked from network); 24 Jun 2020 02:08:33 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-20.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2020 02:08:33 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 78639E7A664BDD1DB635;
        Tue, 23 Jun 2020 22:08:31 -0400 (EDT)
Received: from localhost.localdomain.com (10.64.93.129) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Tue, 23 Jun 2020 19:08:28 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <bnocera@redhat.com>, <ibm-acpi@hmh.eng.br>,
        <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Subject: [PATCH v3] platform/x86: thinkpad_acpi: lap or desk mode interface
Date:   Tue, 23 Jun 2020 22:08:06 -0400
Message-ID: <20200624020806.25388-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.93.129]
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
Changes in v3:
- Fixed inaccurate comments
- Used BIT macro to check lapmode bit setting as recommended and update
  define name
- Check for new_state == dytc_lapmode in dytc_lapmode_refresh

Changes in v2:
- cleaned up initialisation sequence to be cleaner and avoid spamming
  platforms that don't have DYTC with warning message. Tested on P52
- Adding platform-driver-x86 mailing list for review as requested

 drivers/platform/x86/thinkpad_acpi.c | 110 +++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0f704484ae1d..ce3bfb546109 100644
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
@@ -9811,6 +9812,107 @@ static struct ibm_struct lcdshadow_driver_data = {
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
@@ -9858,6 +9960,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 
 		mutex_unlock(&kbdlight_mutex);
 	}
+
+	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
+		dytc_lapmode_refresh();
+
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
@@ -10296,6 +10402,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


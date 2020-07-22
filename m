Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634FD229E11
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jul 2020 19:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgGVRME (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jul 2020 13:12:04 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.5]:40860 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726907AbgGVRME (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jul 2020 13:12:04 -0400
Received: from [100.112.0.190] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-east-1.aws.symcld.net id 47/9E-31766-063781F5; Wed, 22 Jul 2020 17:12:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsWSLveKXTehWCL
  eoOWTosX+6xIWD+amW8w+bGMx59laRovVe14wO7B6/D7A6LF7wWcmj/f7rrJ5fN4kF8ASxZqZ
  l5RfkcCa8ejBeqaCxREVLauvMjYwfvXoYuTiEBL4zygxpWkKO4TzmlHix8mzQA4nB5uAtsSWL
  b/Yuhg5OEQEZCQ+rPUEqWEW2MYosXPHfVaQGmEBD4nOjgYwm0VAVeJB72d2kHpeAWuJ2afUQc
  ISAvIS7cu3s4HYnEAlZ7oes4DYQgIqEvcfLAGL8woISpyc+QQszgxU37x1NjOELSFx8MULZpg
  5fRMamSDsBIllL+8wT2AUmIWkfRaS9llI2hcwMq9iNE0qykzPKMlNzMzRNTQw0DU0NNI10jW2
  1Eus0k3SKy3WTU0sLtE11EssL9YrrsxNzknRy0st2cQIDPqUAib1HYyXX3/QO8QoycGkJMq7J
  VciXogvKT+lMiOxOCO+qDQntfgQowwHh5IE77sCoJxgUWp6akVaZg4wAmHSEhw8SiK8hwuB0r
  zFBYm5xZnpEKlTjLocJ1ctWcQsxJKXn5cqJc6bWgRUJABSlFGaBzcClgwuMcpKCfMyMjAwCPE
  UpBblZpagyr9iFOdgVBLm3Q2yiiczrwRu0yugI5iAjlC+KwpyREkiQkqqgWlW94cjImcF9Nrv
  nr779M/m6I3zYjeHZkSbqAu85UnduGjunEu9Jru3zOaZsurj0VThidPVPLwUqp/rqvkdVTO9G
  pmvI8sufqnyxMKL52evWnJjwpLX2x0/Wl3/Wlvjv33RLxs399c865oe92xpiOb5cfduzKLzOl
  ed9aQ28h48fKnJ8FPQleI5J16nr9JszZlasvTWN8uJH+rjjE5mRq/e9/yLBbd3Yf9ii5ju21X
  2+n82WCm1dBwSXF7897qKNGeNwqtWXW4O+xmMR/+8W/SGJy1L93ReKMeU+09CjizYupJzS9nl
  7ovfOU/Gb194n+OEyNxw0Yhl5u7nuqfsfvpnWbPY+RhGFnO+oHuTrRM2KbEUZyQaajEXFScCA
  M7TfbqBAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-14.tower-395.messagelabs.com!1595437917!2699613!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28169 invoked from network); 22 Jul 2020 17:12:00 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-14.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jul 2020 17:12:00 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 154F43EBAAAD4781AB6D;
        Thu, 23 Jul 2020 01:11:55 +0800 (CST)
Received: from localhost.localdomain.com (10.64.90.13) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Wed, 22 Jul 2020 10:11:52 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <ibm-acpi@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>, <bnocera@redhat.com>,
        <bberg@redhat.com>, Nitin Joshi <njoshi1@lenovo.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: performance mode interface
Date:   Wed, 22 Jul 2020 13:11:08 -0400
Message-ID: <20200722171108.65185-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.90.13]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
firmware to provide different performance/thermal modes.

The modes can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch
the operating mode between three different modes.

H - High performance. Maximum power is available and the temperature is
allowed to increase to the maximum for the platform.
M - Medium performance (aka balance). In this mode power will be limited
and the laptop will have a lower maximum temperature.
L - Low performance (aka quiet). In this mode power consumption is reduced
and the device will be cooler.

High performance mode is only available when the device is in 'desk mode'.
If the device detects that it is on a lap then it will automatically drop
into medium mode to maintain a safer operating temperature.

This patch provides an interface to determine the current mode and to also
allow the setting of the mode through the dytc_perfmode sysfs entry. This
can be used by userspace for improved control.

Reviewed-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  35 +++
 drivers/platform/x86/thinkpad_acpi.c          | 209 +++++++++++++++++-
 2 files changed, 235 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 2e9d62903ead..d5fef0bb562b 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -52,6 +52,7 @@ detailed description):
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
         - Palm sensor (aka psensor)
+        - Thermal mode status and control
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1466,6 +1467,40 @@ determine if the sensor is not installed or not. On these platforms the
 psensor state will always be reported as true to avoid high power being used
 incorrectly.
 
+DYTC Thermal mode status and control
+------------------------------------
+
+sysfs: dytc_perfmode
+
+Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced firmware to
+provide improved performance control.
+
+The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch the
+operating mode between three different modes. This sysfs node provide a better
+interface for user space to use
+
+The modes available are:
+
+H - High performance. Maximum power is available and the temperature is
+allowed to increase to the maximum for the platform.
+
+M - Medium performance (aka balance). In this mode power will be limited and
+the laptop will remain cooler.
+
+L - Low performance (aka quiet). In this mode power consumption is reduced and
+the device will be cooler and quieter
+
+Note: High performance mode is only available when the device is in 'deskmode'. If
+thde device detects that it is on a lap then it will automatically drop into medium
+mode to maintain a safer operating temperature.
+
+The sysfs entry provides the ability to return the current status and to set the
+desired mode. For example::
+
+        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
+        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
+        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
+
 EXPERIMENTAL: UWB
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 40f2e368fdf9..5aebaf1718b1 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9799,10 +9799,33 @@ static struct ibm_struct lcdshadow_driver_data = {
  * DYTC subdriver, for the Lenovo lapmode feature
  */
 
+#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
+#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
 #define DYTC_CMD_GET          2 /* To get current IC function and mode */
-#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
+#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
+
+#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 = disabled, 1 = enabled */
+#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
+#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
+
+#define DYTC_GET_FUNCTION_BIT 8  /* Bits 8-11 - function setting */
+#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
+#define DYTC_GET_LAPMODE_BIT  17 /* Bit 17 - lapmode. Set when on lap */
+
+#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - funct setting */
+#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
+#define DYTC_SET_VALID_BIT    20 /* Bit 20 - 1 = on, 0 = off */
+
+#define DYTC_FUNCTION_STD     0  /* Function = 0, standard mode */
+#define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
+#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
+
+#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
+#define DYTC_MODE_QUIET       3  /* low power mode aka quiet */
+#define DYTC_MODE_BALANCE   0xF  /* default mode aka balance */
 
 static bool dytc_lapmode;
+static bool dytc_mode_available;
 
 static void dytc_lapmode_notify_change(void)
 {
@@ -9822,7 +9845,81 @@ static int dytc_command(int command, int *output)
 	return 0;
 }
 
+static int dytc_perfmode_get(int *perfmode, int *funcmode)
+{
+	int output, err;
+
+	if (!dytc_mode_available)
+		return -ENODEV;
+
+	err = dytc_command(DYTC_CMD_GET, &output);
+	if (err)
+		return err;
+	*funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
+
+	if (*funcmode == DYTC_FUNCTION_CQL) {
+		int dummy;
+		/* We can't get the mode when in CQL mode - so we disable CQL
+		 * mode retrieve the mode and then enable it again.
+		 */
+		err = dytc_command(0x000F1001 /*Disable CQL*/, &dummy);
+		if (err)
+			return err;
+		err = dytc_command(DYTC_CMD_GET, &output);
+		if (err)
+			return err;
+		err = dytc_command(0x001F1001 /*Enable CQL*/, &dummy);
+		if (err)
+			return err;
+	}
+	*perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
+	return 0;
+}
+
+static int dytc_perfmode_set(int perfmode)
+{
+	int err, dytc_set;
+	int output;
+	int cur_perfmode, cur_funcmode;
+
+	if (!dytc_mode_available)
+		return -ENODEV;
+
+	if (perfmode == DYTC_MODE_BALANCE) {
+		/* To get back to balance mode we just issue a reset command */
+		err = dytc_command(DYTC_CMD_RESET, &output);
+		if (err)
+			return err;
+	} else {
+		/* Determine if we are in CQL mode. This alters the commands we do */
+		err = dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
+		if (err)
+			return err;
+
+		if (cur_funcmode == DYTC_FUNCTION_CQL) {
+			/* To set the mode we need to disable CQL first*/
+			err = dytc_command(0x000F1001 /*Disable CQL*/, &output);
+			if (err)
+				return err;
+		}
+		dytc_set = (1 << DYTC_SET_VALID_BIT) |
+			(DYTC_FUNCTION_MMC << DYTC_SET_FUNCTION_BIT) |
+			(perfmode << DYTC_SET_MODE_BIT) |
+			DYTC_CMD_SET;
+		err = dytc_command(dytc_set, &output);
+		if (err)
+			return err;
+		if (cur_funcmode == DYTC_FUNCTION_CQL) {
+			err = dytc_command(0x001F1001 /*Enable CQL*/, &output);
+			if (err)
+				return err;
+		}
+	}
+	return 0;
+}
+
 static int dytc_lapmode_get(bool *state)
+
 {
 	int output, err;
 
@@ -9846,6 +9943,77 @@ static void dytc_lapmode_refresh(void)
 	dytc_lapmode_notify_change();
 }
 
+/* sysfs perfmode entry */
+static ssize_t dytc_perfmode_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	int err;
+	int perfmode, funcmode;
+
+	err = dytc_perfmode_get(&perfmode, &funcmode);
+	if (err)
+		return err;
+
+	switch (perfmode) {
+	case DYTC_MODE_PERFORM:
+		/* High performance is only available in deskmode */
+		if (funcmode == DYTC_FUNCTION_CQL)
+			return snprintf(buf, PAGE_SIZE, "Medium (Reduced as lapmode active)\n");
+		else
+			return snprintf(buf, PAGE_SIZE, "High\n");
+	case DYTC_MODE_QUIET:
+		return snprintf(buf, PAGE_SIZE, "Low\n");
+	case DYTC_MODE_BALANCE:
+		return snprintf(buf, PAGE_SIZE, "Medium\n");
+	default:
+		return snprintf(buf, PAGE_SIZE, "Unknown (%d)\n", perfmode);
+	}
+}
+
+static ssize_t dytc_perfmode_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	int err;
+
+	switch (buf[0]) {
+	case 'l':
+	case 'L':
+		err = dytc_perfmode_set(DYTC_MODE_QUIET);
+		break;
+	case 'm':
+	case 'M':
+		err = dytc_perfmode_set(DYTC_MODE_BALANCE);
+		break;
+	case 'h':
+	case 'H':
+		err = dytc_perfmode_set(DYTC_MODE_PERFORM);
+		break;
+	default:
+		err = -EINVAL;
+		pr_err("Unknown operating mode. Ignoring\n");
+		break;
+	}
+	if (err)
+		return err;
+
+	tpacpi_disclose_usertask(attr->attr.name,
+				"Performance mode set to %c\n", buf[0]);
+	return count;
+}
+
+static DEVICE_ATTR_RW(dytc_perfmode);
+
+static struct attribute *dytc_perfmode_attributes[] = {
+	&dev_attr_dytc_perfmode.attr,
+	NULL,
+};
+
+static const struct attribute_group dytc_perf_attr_group = {
+	.attrs = dytc_perfmode_attributes,
+};
+
 /* sysfs lapmode entry */
 static ssize_t dytc_lapmode_show(struct device *dev,
 					struct device_attribute *attr,
@@ -9856,22 +10024,22 @@ static ssize_t dytc_lapmode_show(struct device *dev,
 
 static DEVICE_ATTR_RO(dytc_lapmode);
 
-static struct attribute *dytc_attributes[] = {
+static struct attribute *dytc_lap_attributes[] = {
 	&dev_attr_dytc_lapmode.attr,
 	NULL,
 };
 
-static const struct attribute_group dytc_attr_group = {
-	.attrs = dytc_attributes,
+static const struct attribute_group dytc_lap_attr_group = {
+	.attrs = dytc_lap_attributes,
 };
 
 static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
 {
-	int err;
+	int err, output;
 
-	err = dytc_lapmode_get(&dytc_lapmode);
+	err = dytc_command(DYTC_CMD_QUERY, &output);
 	/* If support isn't available (ENODEV) then don't return an error
-	 * but just don't create the sysfs group
+	 * just don't create the sysfs group
 	 */
 	if (err == -ENODEV)
 		return 0;
@@ -9879,14 +10047,37 @@ static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
 	if (err)
 		return err;
 
+	/* Check DYTC is enabled and supports mode setting */
+	dytc_mode_available = false;
+	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
+		/* Only DYTC v5.0 and later has this feature. */
+		int dytc_version;
+
+		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
+		if (dytc_version >= 5) {
+			pr_info("DYTC thermal mode configuration available\n");
+			dytc_mode_available = true;
+			/* Platform supports this feature - create the group */
+			err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
+			if (err)
+				return err;
+		}
+	}
+
+	err = dytc_lapmode_get(&dytc_lapmode);
+	if (err)
+		return err;
+
 	/* Platform supports this feature - create the group */
-	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
+	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
 	return err;
 }
 
 static void dytc_exit(void)
 {
-	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
+	if (dytc_mode_available)
+		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
 }
 
 static struct ibm_struct dytc_driver_data = {
-- 
2.26.2


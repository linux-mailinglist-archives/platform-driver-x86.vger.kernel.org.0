Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60B824DEEE
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Aug 2020 19:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgHURxo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Aug 2020 13:53:44 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:45041 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725873AbgHURxj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Aug 2020 13:53:39 -0400
Received: from [100.112.1.169] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-east-1.aws.symcld.net id 63/58-23612-F1A004F5; Fri, 21 Aug 2020 17:53:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRWlGSWpSXmKPExsWSLveKTVeeyyH
  e4Ot3fosHc9MtZh+2sZjzbC2jRVNnE5vF6j0vmB1YPSbNnMHs8fsAo8fuBZ+ZPN7vu8rm8XmT
  XABrFGtmXlJ+RQJrxr6WG2wF+6sr7nyfx9LAuDuti5GTQ0jgP6PE77esXYxcQPYbRom/n6eyg
  iTYBLQltmz5xdbFyMEhIiAj8WGtJ0gNs8BBRomJKy8ygdQIC3hLrFh9gxGkhkVAVeLrabBWXg
  EbiUXdL1lAbAkBeYn25dvZQGxOoJIzXY9ZIPaqSNx/sIQNol5Q4uTMJ2BxZqD65q2zmSFsCYm
  DL14wQ8xRkJjQf58Vwk6QWPbyDvMERoFZSNpnIWmfhaR9ASPzKkazpKLM9IyS3MTMHF1DAwNd
  Q0MjXSBpYK6XWKWbpFdarJuaWFyia6iXWF6sV1yZm5yTopeXWrKJERgBKQUM2TsYt7z5oHeIU
  ZKDSUmU99VX+3ghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzX2RzihQSLUtNTK9Iyc4DRCJOW4O
  BREuHt4wBK8xYXJOYWZ6ZDpE4xGnOcXLVkETPH5rlLFzELseTl56VKifM2gJQKgJRmlObBDYI
  liUuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmz2IGm8GTmlcDtewV0ChPQKda5tiCnlCQi
  pKQamDa/XNl4lnXSIXuda0uz9JSN/VY3HJt+qOiLXQrP/qKu59rhYTcmhfHM2uYSKtla5OSgt
  Gj3ZX39d/d+9v5wnt9z1YzF+YbIr83rVygVZ278MU9dTa/TKPHCvXIdsdjLB2cGpnDFL9PYbp
  lw4ChD+bbtBiEfFc2TTBXmirQdaf8+0exUZ6R/29tPkhLJz4V0090mN6RtVLmvs+v7r5D8koh
  fl0/O7Jq4+J69wS5v3e2pEwtTz1bNl34lp/ZvyblpkWYit+wy5n6+1pbi5Z+67RpT9A7xjp9y
  3FFWL3mnTmJoP5XrO419prjDlS0ljHpGS/eyzMxslF8hXli9YX6zndWSA/s84ssUvWerTvFkV
  mIpzkg01GIuKk4EAOm8aMyNAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-386.messagelabs.com!1598032412!1836919!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12738 invoked from network); 21 Aug 2020 17:53:34 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-15.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Aug 2020 17:53:34 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id F0BB4D8F9CEFB854C5D0;
        Sat, 22 Aug 2020 01:53:30 +0800 (CST)
Received: from localhost.localdomain.com (10.38.59.153) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Fri, 21 Aug 2020 10:53:27 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>, <ibm-acpi@hmh.eng.br>,
        <bnocera@redhat.com>, <mario.limonciello@dell.com>,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: performance mode interface
Date:   Fri, 21 Aug 2020 13:53:10 -0400
Message-ID: <20200821175310.335873-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.38.59.153]
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
Changes in v2:
 - Add userspace notification to hkey event handler. Note this got
   somewhat more complicated than expected as retrieving the performance
   mode when in lapmode generates an event itself; added a flag to
   ignore these known events.
 - Updated the values returned to be simpler (H/M*/M/L) as suggested.
 - Added ABI documentation as requested. Lap and palm sensor details
   added whilst I was doing this.
 - Cleaned up code based on recommendations as well as feedback received
   from other patch reviews.
 - Based on discussion with firmware team the lapmode sensor should only
   be made available for DYTC v5 and later. Added this to init logic.

 .../sysfs-devices-platform-thinkpad_acpi      |  34 +++
 .../admin-guide/laptops/thinkpad-acpi.rst     |  35 +++
 drivers/platform/x86/thinkpad_acpi.c          | 267 ++++++++++++++++--
 3 files changed, 310 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi b/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi
new file mode 100644
index 000000000000..28f07753a889
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi
@@ -0,0 +1,34 @@
+What:		/sys/devices/platform/thinkpad_acpi/dytc_perfmode
+Date:		August 2020
+Contact:	Mark Pearson <markpearson@lenovo.com>
+Description:
+		Reads return the current performance mode setting configured in firmware using
+		the below nomenclature.
+
+		Writes configure the performance mode setting by using the below nomenclature.
+
+		H  - High performance mode. Maximum power and temperature available.
+		M* - High performance mode but performance is limited to medium as system is
+		     in lapmode. Power and temperature maximums reduced to a safe threshold.
+		M  - Medium performance mode (aka 'balance'). Lower maximum power and temperatures
+		     but better battery life.
+		L  - Low performance mode (aka 'quiet'). Reduced power setting gives lower
+		     temperatures and extended battery life. Fans run quieter.
+
+What:		/sys/devices/platform/thinkpad_acpi/dytc_lapmode
+Date:		August 2020
+Contact:	Mark Pearson <markpearson@lenovo.com>
+Description:
+		Reads returns the current value of the lapmode sensor.
+
+		0 - desk mode is detected
+		1 - lap mode is detected
+
+What:		/sys/devices/platform/thinkpad_acpi/psensor_state
+Date:		August 2020
+Contact:	Nitin Joshi <njoshi1@lenovo.com>
+Description:
+		Reads returns the current value of the palm sensor.
+
+		0 - palm not detected
+		1 - palm detected
diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 6b57c52d8f13..b98f0de9e063 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -52,6 +52,7 @@ detailed description):
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
         - Palm sensor (aka psensor)
+	- Thermal mode status and control
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1465,6 +1466,40 @@ Note - some platforms have a limitation whereby the EC firmware cannot
 determine if the sensor is installed or not. On these platforms the psensor
 state will always be reported as true to avoid high power being used incorrectly.
 
+DYTC Thermal mode status and control
+------------------------------------
+
+sysfs: dytc_perfmode
+
+Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced firmware to
+provide improved performance control.
+
+The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch the
+operating mode between three different modes. This sysfs node provides a better
+interface for user space to use.
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
+the device will be cooler and quieter.
+
+Note: High performance mode is only available when the device is in 'deskmode'. If
+the device detects that it is on a lap then it will automatically drop into medium
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
index 41b75dd4755c..8fcb660aa5a2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9817,18 +9817,43 @@ static struct ibm_struct lcdshadow_driver_data = {
 };
 
 /*************************************************************************
- * DYTC subdriver, for the Lenovo lapmode feature
+ * DYTC subdriver, for the Lenovo lap and performance mode feature
  */
 
+#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
+#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
 #define DYTC_CMD_GET          2 /* To get current IC function and mode */
-#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
+#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
 
-static bool dytc_lapmode;
+#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 = disabled, 1 = enabled */
+#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
+#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
 
-static void dytc_lapmode_notify_change(void)
-{
-	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
-}
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
+
+#define DYTC_DISABLE_CQL ((DYTC_MODE_BALANCE << DYTC_SET_MODE_BIT) | \
+		(DYTC_FUNCTION_CQL << DYTC_SET_FUNCTION_BIT) | \
+		DYTC_CMD_SET)
+#define DYTC_ENABLE_CQL (DYTC_DISABLE_CQL | (1 << DYTC_SET_VALID_BIT))
+
+static bool dytc_lapmode;
+static int  dytc_perfmode;
+static bool dytc_available;
+static bool dytc_ignore_next_event;
 
 static int dytc_command(int command, int *output)
 {
@@ -9843,6 +9868,87 @@ static int dytc_command(int command, int *output)
 	return 0;
 }
 
+static int dytc_perfmode_get(int *perfmode, int *funcmode)
+{
+	int output, err;
+
+	if (!dytc_available)
+		return -ENODEV;
+
+	err = dytc_command(DYTC_CMD_GET, &output);
+	if (err)
+		return err;
+	*funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
+
+	if (*funcmode == DYTC_FUNCTION_CQL) {
+		int dummy;
+		/*
+		 * We can't get the mode when in CQL mode - so we disable CQL
+		 * mode retrieve the mode and then enable it again.
+		 * As disabling/enabling CQL triggers an event we set a flag to
+		 * ignore these events. This will be cleared by the event handler
+		 */
+		dytc_ignore_next_event = true;
+		err = dytc_command(DYTC_DISABLE_CQL, &dummy);
+		if (err)
+			return err;
+		err = dytc_command(DYTC_CMD_GET, &output);
+		if (err)
+			return err;
+		/* Again ignore this event */
+		dytc_ignore_next_event = true;
+		err = dytc_command(DYTC_ENABLE_CQL, &dummy);
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
+	if (!dytc_available)
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
+			dytc_ignore_next_event = true; /*ignore event*/
+			err = dytc_command(DYTC_DISABLE_CQL, &output);
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
+			dytc_ignore_next_event = true; /*ignore event*/
+			err = dytc_command(DYTC_ENABLE_CQL, &output);
+			if (err)
+				return err;
+		}
+	}
+	return 0;
+}
+
 static int dytc_lapmode_get(bool *state)
 {
 	int output, err;
@@ -9854,45 +9960,130 @@ static int dytc_lapmode_get(bool *state)
 	return 0;
 }
 
-static void dytc_lapmode_refresh(void)
+static void dytc_refresh(void)
 {
-	bool new_state;
+	bool lapmode;
+	int perfmode, funcmode;
 	int err;
 
-	err = dytc_lapmode_get(&new_state);
-	if (err || (new_state == dytc_lapmode))
+	err = dytc_lapmode_get(&lapmode);
+	if (err)
+		return;
+	if (dytc_ignore_next_event) {
+		dytc_ignore_next_event = false; /*clear setting*/
 		return;
+	}
+	if (lapmode != dytc_lapmode) {
+		dytc_lapmode = lapmode;
+		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
+	}
+	err = dytc_perfmode_get(&perfmode, &funcmode);
+	if (err)
+		return;
+	if (perfmode != dytc_perfmode) {
+		dytc_perfmode = perfmode;
+		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_perfmode");
+	}
+}
+
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
 
-	dytc_lapmode = new_state;
-	dytc_lapmode_notify_change();
+	switch (perfmode) {
+	case DYTC_MODE_PERFORM:
+		/* High performance is only available in deskmode */
+		if (funcmode == DYTC_FUNCTION_CQL)
+			return sprintf(buf, "M*\n");
+		else
+			return sprintf(buf, "H\n");
+	case DYTC_MODE_QUIET:
+		return sprintf(buf, "L\n");
+	case DYTC_MODE_BALANCE:
+		return sprintf(buf, "M\n");
+	default:
+		return sprintf(buf, "Unknown (%d)\n", perfmode);
+	}
 }
 
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
+	NULL
+};
+
+static const struct attribute_group dytc_perf_attr_group = {
+	.attrs = dytc_perfmode_attributes
+};
+
 /* sysfs lapmode entry */
 static ssize_t dytc_lapmode_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
+	return sprintf(buf, "%d\n", dytc_lapmode);
 }
 
 static DEVICE_ATTR_RO(dytc_lapmode);
 
-static struct attribute *dytc_attributes[] = {
+static struct attribute *dytc_lap_attributes[] = {
 	&dev_attr_dytc_lapmode.attr,
-	NULL,
+	NULL
 };
 
-static const struct attribute_group dytc_attr_group = {
-	.attrs = dytc_attributes,
+static const struct attribute_group dytc_lap_attr_group = {
+	.attrs = dytc_lap_attributes
 };
 
 static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
 {
-	int err;
+	int err, output;
 
-	err = dytc_lapmode_get(&dytc_lapmode);
-	/* If support isn't available (ENODEV) then don't return an error
-	 * but just don't create the sysfs group
+	err = dytc_command(DYTC_CMD_QUERY, &output);
+	/*
+	 * If support isn't available (ENODEV) then don't return an error
+	 * just don't create the sysfs group
 	 */
 	if (err == -ENODEV)
 		return 0;
@@ -9900,14 +10091,38 @@ static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
 	if (err)
 		return err;
 
-	/* Platform supports this feature - create the group */
-	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
+	/* Check DYTC is enabled and supports mode setting */
+	dytc_available = false;
+	dytc_ignore_next_event = false;
+	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
+		/* Only DYTC v5.0 and later has this feature. */
+		int dytc_version;
+
+		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
+		if (dytc_version >= 5) {
+			dbg_printk(TPACPI_DBG_INIT,
+				   "DYTC version %d: thermal mode available\n", dytc_version);
+			dytc_available = true;
+			/* Platform supports this feature - create the group */
+			err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
+			if (err)
+				return err;
+
+			err = dytc_lapmode_get(&dytc_lapmode);
+			if (err)
+				return err;
+			err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
+		}
+	}
 	return err;
 }
 
 static void dytc_exit(void)
 {
-	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
+	if (dytc_available) {
+		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
+		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
+	}
 }
 
 static struct ibm_struct dytc_driver_data = {
@@ -10057,7 +10272,7 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 	}
 
 	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
-		dytc_lapmode_refresh();
+		dytc_refresh();
 
 	if ((hkey_event == TP_HKEY_EV_PALM_DETECTED) ||
 		(hkey_event == TP_HKEY_EV_PALM_UNDETECTED))
-- 
2.26.2


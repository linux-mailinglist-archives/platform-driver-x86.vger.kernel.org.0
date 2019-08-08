Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 719F186AF6
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Aug 2019 21:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390397AbfHHT4D (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Aug 2019 15:56:03 -0400
Received: from mail.klausen.dk ([174.138.9.187]:59450 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390304AbfHHT4D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Aug 2019 15:56:03 -0400
From:   Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1565294160;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=YoBYw1ilVWGFPRvFO22CnUdjWO268YYW2hIENqj/Aqw=;
        b=zaM6QyvyxYYfTfCISzT65y4S5o5Emipxe2aTH3RLWrYFQEd6lerGMrcYn6FQNrx2Gxp00U
        5K4IqM9HHSK6to4OV29alcy0KMijTLBOpJ+xVMy/S6Kl3LQwuHNnP1QR2E+UTDKmm/wj2N
        L5zl4wE5c3LdAtc8m1+AuxZXSqUANp8=
To:     platform-driver-x86@vger.kernel.org
Cc:     Daniel Drake <drake@endlessm.com>,
        Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH v2] platform/x86: asus-wmi: Support setting a maximum charging percentage
Date:   Thu,  8 Aug 2019 21:55:32 +0200
Message-Id: <20190808195532.14220-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Most newer ASUS laptops supports settings a maximum charging percentage,
which help prolonging the battery life.

Tested on a Zenbook UX430UNR.

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
V2:
Add sysfs documentation.
Reorder ASUS_WMI_CHARGE_THRESHOLD and rename to ASUS_WMI_DEVID_RSOC.
Add a comment explaining the charge_threshold variable.
Rephrase the commit message (charge threshold -> maximum charging
percentage).

The sysfs knob is still called "charge_threshold", as
maximum_charging_percentage seems a bit long.
I did look on some of the other platform modules, the LG module
use battery_care_limit and the Samsung module use
battery_life_extender.

 .../ABI/testing/sysfs-platform-asus-wmi       |  8 +++
 drivers/platform/x86/asus-wmi.c               | 49 +++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h    |  3 ++
 3 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index 9e99f2909612..21730e7ccd47 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -46,3 +46,11 @@ Description:
 			* 0 - normal,
 			* 1 - overboost,
 			* 2 - silent
+
+What:		/sys/devices/platform/<platform>/charge_threshold
+Date:		Aug 2019
+KernelVersion:	5.3
+Contact:	"Kristian Klausen" <kristian@klausen.dk>
+Description:
+		Control the maximum charging percentage.
+		Accepted values are 0-100.
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 34dfbed65332..c4e6cc1e3b74 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -195,6 +195,9 @@ struct asus_wmi {
 	u8 fan_boost_mode_mask;
 	u8 fan_boost_mode;
 
+	/* The battery maximum charging percentage */
+	int charge_threshold;
+
 	struct hotplug_slot hotplug_slot;
 	struct mutex hotplug_lock;
 	struct mutex wmi_lock;
@@ -2075,6 +2078,43 @@ static ssize_t cpufv_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_WO(cpufv);
 
+
+static ssize_t charge_threshold_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	int value, ret, rv;
+
+	ret = kstrtouint(buf, 10, &value);
+
+	if (!count || ret != 0)
+		return -EINVAL;
+	if (value < 0 || value > 100)
+		return -EINVAL;
+
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, value, &rv);
+
+	if (rv != 1)
+		return -EIO;
+
+	/* There isn't any method in the DSDT to read the threshold, so we
+	 * save the threshold.
+	 */
+	asus->charge_threshold = value;
+	return count;
+}
+
+static ssize_t charge_threshold_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", asus->charge_threshold);
+}
+
+static DEVICE_ATTR_RW(charge_threshold);
+
 static struct attribute *platform_attributes[] = {
 	&dev_attr_cpufv.attr,
 	&dev_attr_camera.attr,
@@ -2083,6 +2123,7 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_lid_resume.attr,
 	&dev_attr_als_enable.attr,
 	&dev_attr_fan_boost_mode.attr,
+	&dev_attr_charge_threshold.attr,
 	NULL
 };
 
@@ -2106,6 +2147,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		devid = ASUS_WMI_DEVID_ALS_ENABLE;
 	else if (attr == &dev_attr_fan_boost_mode.attr)
 		ok = asus->fan_boost_mode_available;
+	else if (attr == &dev_attr_charge_threshold.attr)
+		devid = ASUS_WMI_DEVID_RSOC;
 
 	if (devid != -1)
 		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
@@ -2434,6 +2477,12 @@ static int asus_wmi_add(struct platform_device *pdev)
 	}
 
 	asus_wmi_debugfs_init(asus);
+	/* The charge threshold is only reset when the system is power cycled,
+	 * and we can't get the current threshold so let set it to 100% on
+	 * module load.
+	 */
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
+	asus->charge_threshold = 100;
 
 	return 0;
 
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 409e16064f4b..60249e22e844 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -81,6 +81,9 @@
 /* Deep S3 / Resume on LID open */
 #define ASUS_WMI_DEVID_LID_RESUME	0x00120031
 
+/* Maximum charging percentage */
+#define ASUS_WMI_DEVID_RSOC		0x00120057
+
 /* DSTS masks */
 #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
 #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002
-- 
2.22.0


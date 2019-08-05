Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCFF82586
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Aug 2019 21:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfHETXb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 5 Aug 2019 15:23:31 -0400
Received: from mail.klausen.dk ([174.138.9.187]:59498 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727802AbfHETXb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Aug 2019 15:23:31 -0400
From:   Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1565033008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HNrSCgf0wi7mukaR78ZbGTmVU02AngkzaBhxDQ/hsfU=;
        b=3RL5cfukQOlifaB0o5iVfdFSw7/1GzFB/B0zAsSdjcwf/5feEy/iPLcmVztVIXJsW2Co6T
        5sWUUVwgLxAp/F0oJmK+pGYPe8tcSsL83hVEABoK5XB7jFvD1V26aO/BW5mCsWgl0qtfDR
        w8CXRhqxgslHYn+UBq+XdeP6FChYrHE=
To:     platform-driver-x86@vger.kernel.org
Cc:     Daniel Drake <drake@endlessm.com>,
        Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] platform/x86: asus-wmi: Add support for charge threshold
Date:   Mon,  5 Aug 2019 21:23:05 +0200
Message-Id: <20190805192305.9692-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Most newer ASUS laptops supports limiting the battery charge level, which
help prolonging the battery life.

Tested on a Zenbook UX430UNR.

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
I'm not sure what to call it, is charge threshold good enough or do you
have any better ideas?

 drivers/platform/x86/asus-wmi.c            | 48 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 34dfbed65332..22ae350e0a96 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -195,6 +195,8 @@ struct asus_wmi {
 	u8 fan_boost_mode_mask;
 	u8 fan_boost_mode;
 
+	int charge_threshold;
+
 	struct hotplug_slot hotplug_slot;
 	struct mutex hotplug_lock;
 	struct mutex wmi_lock;
@@ -2075,6 +2077,43 @@ static ssize_t cpufv_store(struct device *dev, struct device_attribute *attr,
 
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
+	asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, value, &rv);
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
@@ -2083,6 +2122,7 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_lid_resume.attr,
 	&dev_attr_als_enable.attr,
 	&dev_attr_fan_boost_mode.attr,
+	&dev_attr_charge_threshold.attr,
 	NULL
 };
 
@@ -2106,6 +2146,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		devid = ASUS_WMI_DEVID_ALS_ENABLE;
 	else if (attr == &dev_attr_fan_boost_mode.attr)
 		ok = asus->fan_boost_mode_available;
+	else if (attr == &dev_attr_charge_threshold.attr)
+		devid = ASUS_WMI_CHARGE_THRESHOLD;
 
 	if (devid != -1)
 		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
@@ -2434,6 +2476,12 @@ static int asus_wmi_add(struct platform_device *pdev)
 	}
 
 	asus_wmi_debugfs_init(asus);
+	/* The charge threshold is only reset when the system is power cycled,
+	 * and we can't get the current threshold so let set it to 100% on
+	 * module load.
+	 */
+	asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, 100, NULL);
+	asus->charge_threshold = 100;
 
 	return 0;
 
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 409e16064f4b..53934ef38d98 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -61,6 +61,7 @@
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
+#define ASUS_WMI_CHARGE_THRESHOLD	0x00120057
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
-- 
2.22.0


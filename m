Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE546B5CC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Jul 2019 07:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfGQFLF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 17 Jul 2019 01:11:05 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43511 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfGQFLF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Jul 2019 01:11:05 -0400
Received: by mail-pg1-f193.google.com with SMTP id f25so10535427pgv.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2019 22:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LuQJoRRFgDYcvPEhbO3TyxMS7PksVfR02RIF1zYuH4=;
        b=RLuUlgCda6tquIydhMYQPvoQLVGnS9JYxA3vdeGJjaYLPES81azNV8QEoVm358RU15
         mNvWRpwzyO2iLungXecPDmFPYQuW2kQefDwEyjdv9An/7nlOxkOndgz76iH3uYr+VwaA
         Ca012ZS70jZA2GLfp6Rsk0IaOD8XYfUEOqHIkMVT5eqVm16B4yLDWWy9AFvmtcE2Z8j9
         XFEv62uU7c99syA0oiIEEoIh2GWsNDfXayqJl/FbhsgjUXdR5hxdTNqloqIzqZliE7bf
         mUpvIgUIMBnmC9YtWKc9TvaWMBN1ZIT33+vm/ukdvG6DPz4D5256DlvLrVos0VRHMjLu
         HZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LuQJoRRFgDYcvPEhbO3TyxMS7PksVfR02RIF1zYuH4=;
        b=Jn26Zp4hoK3ZANlZD6ftTyFQewuINsuvrrWVGCFM3yrYgC5weqUC7XOu+44mEsrVgZ
         +G/CRg+C9eOMfzODztdNGYwx31dghFfcXIn+lFoAADKulaYy9KsKDjjYSK0xLAVlgYPi
         wcA2kxjDLe9/7KIv9R7MZ+g3IS19CORk6IjMelkv/pIwv+yopn2IJcJVyMXbg+a1MLXK
         T9Lo1IJSPUKlDp3DovYhfhTIFhIhL6pzcrFE74PZQvv/VSY7xrGNbmSEAdcFDkxejkch
         7XC4O1JQr0gG5hRBE8y8bjEEcIwtT4wKVrbvNet1n4gLEGQ0+x0gUekElEAp5AeOwWhk
         17ug==
X-Gm-Message-State: APjAAAVSrfPffyyjWBMFFT/qQa5PPqTPiYyCrhm13jTd93ZGBQa4y1IC
        0/oPuHeLYRJ2rvCu/64zc7F00g==
X-Google-Smtp-Source: APXvYqx8aDPNB+n9d6pROZv4xBT5ROKOdSHwpaLN4pFAMNkqsChP2qy56zYXICYnNW6QZuNiMo5k9Q==
X-Received: by 2002:a63:4404:: with SMTP id r4mr38285393pga.245.1563340264293;
        Tue, 16 Jul 2019 22:11:04 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id k184sm19314769pgk.7.2019.07.16.22.11.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 22:11:03 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, yurii.pavlovskyi@gmail.com,
        linux@endlessm.com
Subject: [PATCH v2] platform/x86: asus: Rename "fan mode" to "fan boost mode"
Date:   Wed, 17 Jul 2019 13:10:58 +0800
Message-Id: <20190717051058.4148-1-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Asus WMI spec indicates that the function being controlled here
is called "Fan Boost Mode". The user-facing documentation also calls it
this.

The spec uses the term "fan mode" is used to refer to other things,
including functionality expected to appear on future products.
We missed this before as we are not dealing with the most readable of
specs, and didn't forsee any confusion around shortening the name.

Rename "fan mode" to "fan boost mode" to improve consistency with the
spec and to avoid a future naming conflict.

There is no interface breakage here since this has yet to be included
in an official kernel release. I also updated the kernel version listed
under ABI accordingly.

Signed-off-by: Daniel Drake <drake@endlessm.com>
Acked-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 .../ABI/testing/sysfs-platform-asus-wmi       |   6 +-
 drivers/platform/x86/asus-wmi.c               | 118 +++++++++---------
 include/linux/platform_data/x86/asus-wmi.h    |   2 +-
 3 files changed, 66 insertions(+), 60 deletions(-)

Please consider for Linux-5.3, otherwise we'd have an official released
kernel using the "fan_mode" name which would be more controversial to
change later.

v2:
 - Also adjust date in ABI documentation
 - mention how this was missed before in the commit msg

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index 87ae5cc983bf..9e99f2909612 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -37,9 +37,9 @@ Contact:	"AceLan Kao" <acelan.kao@canonical.com>
 Description:
 		Resume on lid open. 1 means on, 0 means off.
 
-What:		/sys/devices/platform/<platform>/fan_mode
-Date:		Apr 2019
-KernelVersion:	5.2
+What:		/sys/devices/platform/<platform>/fan_boost_mode
+Date:		Sep 2019
+KernelVersion:	5.3
 Contact:	"Yurii Pavlovskyi" <yurii.pavlovskyi@gmail.com>
 Description:
 		Fan boost mode:
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 508e6ad47793..65ce96dffdb1 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -81,12 +81,12 @@ MODULE_LICENSE("GPL");
 #define ASUS_FAN_CTRL_MANUAL		1
 #define ASUS_FAN_CTRL_AUTO		2
 
-#define ASUS_FAN_MODE_NORMAL		0
-#define ASUS_FAN_MODE_OVERBOOST		1
-#define ASUS_FAN_MODE_OVERBOOST_MASK	0x01
-#define ASUS_FAN_MODE_SILENT		2
-#define ASUS_FAN_MODE_SILENT_MASK	0x02
-#define ASUS_FAN_MODES_MASK		0x03
+#define ASUS_FAN_BOOST_MODE_NORMAL		0
+#define ASUS_FAN_BOOST_MODE_OVERBOOST		1
+#define ASUS_FAN_BOOST_MODE_OVERBOOST_MASK	0x01
+#define ASUS_FAN_BOOST_MODE_SILENT		2
+#define ASUS_FAN_BOOST_MODE_SILENT_MASK		0x02
+#define ASUS_FAN_BOOST_MODES_MASK		0x03
 
 #define USB_INTEL_XUSB2PR		0xD0
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
@@ -195,9 +195,9 @@ struct asus_wmi {
 	int asus_hwmon_num_fans;
 	int asus_hwmon_pwm;
 
-	bool fan_mode_available;
-	u8 fan_mode_mask;
-	u8 fan_mode;
+	bool fan_boost_mode_available;
+	u8 fan_boost_mode_mask;
+	u8 fan_boost_mode;
 
 	struct hotplug_slot hotplug_slot;
 	struct mutex hotplug_lock;
@@ -1501,14 +1501,15 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 
 /* Fan mode *******************************************************************/
 
-static int fan_mode_check_present(struct asus_wmi *asus)
+static int fan_boost_mode_check_present(struct asus_wmi *asus)
 {
 	u32 result;
 	int err;
 
-	asus->fan_mode_available = false;
+	asus->fan_boost_mode_available = false;
 
-	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_MODE, &result);
+	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_BOOST_MODE,
+				    &result);
 	if (err) {
 		if (err == -ENODEV)
 			return 0;
@@ -1517,72 +1518,77 @@ static int fan_mode_check_present(struct asus_wmi *asus)
 	}
 
 	if ((result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
-			(result & ASUS_FAN_MODES_MASK)) {
-		asus->fan_mode_available = true;
-		asus->fan_mode_mask = result & ASUS_FAN_MODES_MASK;
+			(result & ASUS_FAN_BOOST_MODES_MASK)) {
+		asus->fan_boost_mode_available = true;
+		asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
 	}
 
 	return 0;
 }
 
-static int fan_mode_write(struct asus_wmi *asus)
+static int fan_boost_mode_write(struct asus_wmi *asus)
 {
 	int err;
 	u8 value;
 	u32 retval;
 
-	value = asus->fan_mode;
+	value = asus->fan_boost_mode;
 
-	pr_info("Set fan mode: %u\n", value);
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_FAN_MODE, value, &retval);
+	pr_info("Set fan boost mode: %u\n", value);
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_FAN_BOOST_MODE, value,
+				    &retval);
 
 	if (err) {
-		pr_warn("Failed to set fan mode: %d\n", err);
+		pr_warn("Failed to set fan boost mode: %d\n", err);
 		return err;
 	}
 
 	if (retval != 1) {
-		pr_warn("Failed to set fan mode (retval): 0x%x\n", retval);
+		pr_warn("Failed to set fan boost mode (retval): 0x%x\n",
+			retval);
 		return -EIO;
 	}
 
 	return 0;
 }
 
-static int fan_mode_switch_next(struct asus_wmi *asus)
+static int fan_boost_mode_switch_next(struct asus_wmi *asus)
 {
-	if (asus->fan_mode == ASUS_FAN_MODE_NORMAL) {
-		if (asus->fan_mode_mask & ASUS_FAN_MODE_OVERBOOST_MASK)
-			asus->fan_mode = ASUS_FAN_MODE_OVERBOOST;
-		else if (asus->fan_mode_mask & ASUS_FAN_MODE_SILENT_MASK)
-			asus->fan_mode = ASUS_FAN_MODE_SILENT;
-	} else if (asus->fan_mode == ASUS_FAN_MODE_OVERBOOST) {
-		if (asus->fan_mode_mask & ASUS_FAN_MODE_SILENT_MASK)
-			asus->fan_mode = ASUS_FAN_MODE_SILENT;
+	u8 mask = asus->fan_boost_mode_mask;
+
+	if (asus->fan_boost_mode == ASUS_FAN_BOOST_MODE_NORMAL) {
+		if (mask & ASUS_FAN_BOOST_MODE_OVERBOOST_MASK)
+			asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_OVERBOOST;
+		else if (mask & ASUS_FAN_BOOST_MODE_SILENT_MASK)
+			asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_SILENT;
+	} else if (asus->fan_boost_mode == ASUS_FAN_BOOST_MODE_OVERBOOST) {
+		if (mask & ASUS_FAN_BOOST_MODE_SILENT_MASK)
+			asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_SILENT;
 		else
-			asus->fan_mode = ASUS_FAN_MODE_NORMAL;
+			asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_NORMAL;
 	} else {
-		asus->fan_mode = ASUS_FAN_MODE_NORMAL;
+		asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_NORMAL;
 	}
 
-	return fan_mode_write(asus);
+	return fan_boost_mode_write(asus);
 }
 
-static ssize_t fan_mode_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t fan_boost_mode_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", asus->fan_mode);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", asus->fan_boost_mode);
 }
 
-static ssize_t fan_mode_store(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan_boost_mode_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	int result;
 	u8 new_mode;
-
 	struct asus_wmi *asus = dev_get_drvdata(dev);
+	u8 mask = asus->fan_boost_mode_mask;
 
 	result = kstrtou8(buf, 10, &new_mode);
 	if (result < 0) {
@@ -1590,24 +1596,24 @@ static ssize_t fan_mode_store(struct device *dev, struct device_attribute *attr,
 		return result;
 	}
 
-	if (new_mode == ASUS_FAN_MODE_OVERBOOST) {
-		if (!(asus->fan_mode_mask & ASUS_FAN_MODE_OVERBOOST_MASK))
+	if (new_mode == ASUS_FAN_BOOST_MODE_OVERBOOST) {
+		if (!(mask & ASUS_FAN_BOOST_MODE_OVERBOOST_MASK))
 			return -EINVAL;
-	} else if (new_mode == ASUS_FAN_MODE_SILENT) {
-		if (!(asus->fan_mode_mask & ASUS_FAN_MODE_SILENT_MASK))
+	} else if (new_mode == ASUS_FAN_BOOST_MODE_SILENT) {
+		if (!(mask & ASUS_FAN_BOOST_MODE_SILENT_MASK))
 			return -EINVAL;
-	} else if (new_mode != ASUS_FAN_MODE_NORMAL) {
+	} else if (new_mode != ASUS_FAN_BOOST_MODE_NORMAL) {
 		return -EINVAL;
 	}
 
-	asus->fan_mode = new_mode;
-	fan_mode_write(asus);
+	asus->fan_boost_mode = new_mode;
+	fan_boost_mode_write(asus);
 
 	return result;
 }
 
-// Fan mode: 0 - normal, 1 - overboost, 2 - silent
-static DEVICE_ATTR_RW(fan_mode);
+// Fan boost mode: 0 - normal, 1 - overboost, 2 - silent
+static DEVICE_ATTR_RW(fan_boost_mode);
 
 /* Backlight ******************************************************************/
 
@@ -1887,8 +1893,8 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (asus->fan_mode_available && code == NOTIFY_KBD_FBM) {
-		fan_mode_switch_next(asus);
+	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
+		fan_boost_mode_switch_next(asus);
 		return;
 	}
 
@@ -2048,7 +2054,7 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_touchpad.attr,
 	&dev_attr_lid_resume.attr,
 	&dev_attr_als_enable.attr,
-	&dev_attr_fan_mode.attr,
+	&dev_attr_fan_boost_mode.attr,
 	NULL
 };
 
@@ -2070,8 +2076,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		devid = ASUS_WMI_DEVID_LID_RESUME;
 	else if (attr == &dev_attr_als_enable.attr)
 		devid = ASUS_WMI_DEVID_ALS_ENABLE;
-	else if (attr == &dev_attr_fan_mode.attr)
-		ok = asus->fan_mode_available;
+	else if (attr == &dev_attr_fan_boost_mode.attr)
+		ok = asus->fan_boost_mode_available;
 
 	if (devid != -1)
 		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
@@ -2329,9 +2335,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_platform;
 
-	err = fan_mode_check_present(asus);
+	err = fan_boost_mode_check_present(asus);
 	if (err)
-		goto fail_fan_mode;
+		goto fail_fan_boost_mode;
 
 	err = asus_wmi_sysfs_init(asus->platform_device);
 	if (err)
@@ -2416,7 +2422,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 fail_input:
 	asus_wmi_sysfs_exit(asus->platform_device);
 fail_sysfs:
-fail_fan_mode:
+fail_fan_boost_mode:
 fail_platform:
 	kfree(asus);
 	return err;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 8551156b8dca..4802cd2c7309 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -57,7 +57,7 @@
 #define ASUS_WMI_DEVID_KBD_BACKLIGHT	0x00050021
 #define ASUS_WMI_DEVID_LIGHT_SENSOR	0x00050022 /* ?? */
 #define ASUS_WMI_DEVID_LIGHTBAR		0x00050025
-#define ASUS_WMI_DEVID_FAN_MODE		0x00110018
+#define ASUS_WMI_DEVID_FAN_BOOST_MODE	0x00110018
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
-- 
2.20.1


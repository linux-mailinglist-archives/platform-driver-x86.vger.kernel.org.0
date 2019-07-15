Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A140683B2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2019 08:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfGOGyr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Jul 2019 02:54:47 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45754 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbfGOGyr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jul 2019 02:54:47 -0400
Received: by mail-pl1-f196.google.com with SMTP id y8so7781770plr.12
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jul 2019 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6E0WEH85Y5OoamrCg+T5XsVIDjDKRuLjdGem2CNSus=;
        b=jXALk52DuxM7mXuDYMNUtySgBCn3PGdK9br2dSKf/yjnXW8V3swXMKtapkvafyiEtn
         fbXmFloLE46CZw2vXV3M7B3piLlq7OeR/Z9QDxti1PAc6QjtZcuBtDRiTvZD47xFGMgg
         rgzhTHGRuJPvjgR23PLD2fWqIAqQcmrNWCIjrG0igWSRo9U/2KFb+g3g7E2Uo5zDDzL4
         xfTZYhk+ZBD3/b8lh0JBjGHcudLVknXwonm8ZpEzgBRULHPNd+YR7chWKSq2CpTAEmBI
         PpFs53hEYmumUrn8NCwmzOW7t6wE1f+6aH4iHgCYCJv8UA/i7IUEePsWhLFOR6u922fy
         oGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6E0WEH85Y5OoamrCg+T5XsVIDjDKRuLjdGem2CNSus=;
        b=Lpe53fUzPUeWkm/kXCC+MHoUmRaCVazoe4JGlfM7w6dSxSlX8JNUN185VXYaZiJIkH
         kiVHZweBuN0AcHGFzo6IhmGaHJqj03EavwOwdn4TamJA39XjBjKFQIBmqJiaQjXuP9A9
         FEvGFvsHV3gPTaBbQclvge52G6Ly1ia5opNxnpeuPMfXmQMpdN5CP5PSDpXwOGBDmfYp
         XDPJSHfZ+ZCHyFz9I1kt0oXAZTAgEAPP75tzdpYBUVMpREKU7eblvYUiFgMSDQzyZYwl
         x+UuHZIVmYuEYgH0iD/9VbNmRfNglS7Aq9HqnbzkjuV7ctet2dsyXQuwAsbf/neoVvN/
         1uog==
X-Gm-Message-State: APjAAAUjfaQqS56YaDW2HmijnlVk+m5hBpdn3RWbdpYtMh0TI65v9hW1
        Bl8PGqbTsnZQlFlyWbOa3nlNqQ==
X-Google-Smtp-Source: APXvYqwiJ8QsTsbthgSjbi6M+9zDuEiZXcL1wORDkmcKnowTNg1zoDte1XbyOZm0NA18QVollbB5sw==
X-Received: by 2002:a17:902:2b8a:: with SMTP id l10mr26529391plb.283.1563173685418;
        Sun, 14 Jul 2019 23:54:45 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id y22sm19183257pfo.39.2019.07.14.23.54.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 14 Jul 2019 23:54:44 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, yurii.pavlovskyi@gmail.com,
        linux@endlessm.com
Subject: [PATCH 1/3] platform/x86: asus: cleanup AGFN fan handling
Date:   Mon, 15 Jul 2019 14:54:37 +0800
Message-Id: <20190715065439.27159-1-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The asus-wmi driver currently uses the "AGFN" interface and
the FAN_CTRL device for fan control. According to the spec, this
interface is very dated and marked as pending removal from products
currently in development.

Clean up the way that the AGFN fan is detected and handled, also
preparing the driver for the introduction of an alternate fan
control method needed to support recent Asus products.

Not anticipating further development of this interface, simplify
the code by dropping any notion of being able to control multiple
AGFN fans (this was already limited to just a single fan through only
exposing a single fan in sysfs).

Check for the presence of AGFN fans at probe time, simplifying the code
flow in asus_hwmon_sysfs_is_visible().

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c            | 238 +++++++++------------
 include/linux/platform_data/x86/asus-wmi.h |   4 +-
 2 files changed, 109 insertions(+), 133 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 65ce96dffdb1..0a1410ea2250 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -78,6 +78,8 @@ MODULE_LICENSE("GPL");
 #define ASUS_FAN_MFUN			0x13
 #define ASUS_FAN_SFUN_READ		0x06
 #define ASUS_FAN_SFUN_WRITE		0x07
+
+/* Based on standard hwmon pwmX_enable values */
 #define ASUS_FAN_CTRL_MANUAL		1
 #define ASUS_FAN_CTRL_AUTO		2
 
@@ -133,7 +135,7 @@ struct agfn_args {
 } __packed;
 
 /* struct used for calling fan read and write methods */
-struct fan_args {
+struct agfn_fan_args {
 	struct agfn_args agfn;	/* common fields */
 	u8 fan;			/* fan number: 0: set auto mode 1: 1st fan */
 	u32 speed;		/* read: RPM/100 - write: 0-255 */
@@ -161,6 +163,11 @@ struct asus_rfkill {
 	u32 dev_id;
 };
 
+enum fan_type {
+	FAN_TYPE_NONE = 0,
+	FAN_TYPE_AGFN,		/* deprecated on newer platforms */
+};
+
 struct asus_wmi {
 	int dsts_id;
 	int spec;
@@ -191,9 +198,9 @@ struct asus_wmi {
 	struct asus_rfkill gps;
 	struct asus_rfkill uwb;
 
-	bool asus_hwmon_fan_manual_mode;
-	int asus_hwmon_num_fans;
-	int asus_hwmon_pwm;
+	enum fan_type fan_type;
+	int fan_pwm_mode;
+	int agfn_pwm;
 
 	bool fan_boost_mode_available;
 	u8 fan_boost_mode_mask;
@@ -1139,10 +1146,10 @@ static void asus_wmi_set_als(void)
 
 /* Hwmon device ***************************************************************/
 
-static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
+static int asus_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
 					  int *speed)
 {
-	struct fan_args args = {
+	struct agfn_fan_args args = {
 		.agfn.len = sizeof(args),
 		.agfn.mfun = ASUS_FAN_MFUN,
 		.agfn.sfun = ASUS_FAN_SFUN_READ,
@@ -1166,10 +1173,10 @@ static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
 	return 0;
 }
 
-static int asus_hwmon_agfn_fan_speed_write(struct asus_wmi *asus, int fan,
+static int asus_agfn_fan_speed_write(struct asus_wmi *asus, int fan,
 				     int *speed)
 {
-	struct fan_args args = {
+	struct agfn_fan_args args = {
 		.agfn.len = sizeof(args),
 		.agfn.mfun = ASUS_FAN_MFUN,
 		.agfn.sfun = ASUS_FAN_SFUN_WRITE,
@@ -1189,7 +1196,7 @@ static int asus_hwmon_agfn_fan_speed_write(struct asus_wmi *asus, int fan,
 		return -ENXIO;
 
 	if (speed && fan == 1)
-		asus->asus_hwmon_pwm = *speed;
+		asus->agfn_pwm = *speed;
 
 	return 0;
 }
@@ -1198,87 +1205,75 @@ static int asus_hwmon_agfn_fan_speed_write(struct asus_wmi *asus, int fan,
  * Check if we can read the speed of one fan. If true we assume we can also
  * control it.
  */
-static int asus_hwmon_get_fan_number(struct asus_wmi *asus, int *num_fans)
+static bool asus_wmi_has_agfn_fan(struct asus_wmi *asus)
 {
 	int status;
-	int speed = 0;
+	int speed;
+	u32 value;
 
-	*num_fans = 0;
+	status = asus_agfn_fan_speed_read(asus, 1, &speed);
+	if (status != 0)
+		return false;
 
-	status = asus_hwmon_agfn_fan_speed_read(asus, 1, &speed);
-	if (!status)
-		*num_fans = 1;
+	status = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_CTRL, &value);
+	if (status != 0)
+		return false;
 
-	return 0;
+	/*
+	 * We need to find a better way, probably using sfun,
+	 * bits or spec ...
+	 * Currently we disable it if:
+	 * - ASUS_WMI_UNSUPPORTED_METHOD is returned
+	 * - reverved bits are non-zero
+	 * - sfun and presence bit are not set
+	 */
+	return !(value == ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
+		 || (!asus->sfun && !(value & ASUS_WMI_DSTS_PRESENCE_BIT)));
 }
 
-static int asus_hwmon_fan_set_auto(struct asus_wmi *asus)
+static int asus_fan_set_auto(struct asus_wmi *asus)
 {
 	int status;
 
-	status = asus_hwmon_agfn_fan_speed_write(asus, 0, NULL);
+	status = asus_agfn_fan_speed_write(asus, 0, NULL);
 	if (status)
 		return -ENXIO;
 
-	asus->asus_hwmon_fan_manual_mode = false;
-
 	return 0;
 }
 
-static int asus_hwmon_fan_rpm_show(struct device *dev, int fan)
+static ssize_t pwm1_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
-	int value;
-	int ret;
-
-	/* no speed readable on manual mode */
-	if (asus->asus_hwmon_fan_manual_mode)
-		return -ENXIO;
-
-	ret = asus_hwmon_agfn_fan_speed_read(asus, fan+1, &value);
-	if (ret) {
-		pr_warn("reading fan speed failed: %d\n", ret);
-		return -ENXIO;
-	}
-
-	return value;
-}
-
-static void asus_hwmon_pwm_show(struct asus_wmi *asus, int fan, int *value)
-{
 	int err;
+	int value;
 
-	if (asus->asus_hwmon_pwm >= 0) {
-		*value = asus->asus_hwmon_pwm;
-		return;
-	}
+	/* If we already set a value then just return it */
+	if (asus->agfn_pwm >= 0)
+		return sprintf(buf, "%d\n", asus->agfn_pwm);
 
-	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_CTRL, value);
+	/*
+	 * If we haven't set already set a value through the AGFN interface,
+	 * we read a current value through the (now-deprecated) FAN_CTRL device.
+	 */
+	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_CTRL, &value);
 	if (err < 0)
-		return;
+		return err;
 
-	*value &= 0xFF;
-
-	if (*value == 1) /* Low Speed */
-		*value = 85;
-	else if (*value == 2)
-		*value = 170;
-	else if (*value == 3)
-		*value = 255;
-	else if (*value) {
-		pr_err("Unknown fan speed %#x\n", *value);
-		*value = -1;
+	value &= 0xFF;
+
+	if (value == 1) /* Low Speed */
+		value = 85;
+	else if (value == 2)
+		value = 170;
+	else if (value == 3)
+		value = 255;
+	else if (value) {
+		pr_err("Unknown fan speed %#x\n", value);
+		value = -1;
 	}
-}
-
-static ssize_t pwm1_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buf)
-{
-	struct asus_wmi *asus = dev_get_drvdata(dev);
-	int value;
-
-	asus_hwmon_pwm_show(asus, 0, &value);
 
 	return sprintf(buf, "%d\n", value);
 }
@@ -1298,11 +1293,11 @@ static ssize_t pwm1_store(struct device *dev,
 
 	value = clamp(value, 0, 255);
 
-	state = asus_hwmon_agfn_fan_speed_write(asus, 1, &value);
+	state = asus_agfn_fan_speed_write(asus, 1, &value);
 	if (state)
 		pr_warn("Setting fan speed failed: %d\n", state);
 	else
-		asus->asus_hwmon_fan_manual_mode = true;
+		asus->fan_pwm_mode = ASUS_FAN_CTRL_MANUAL;
 
 	return count;
 }
@@ -1311,10 +1306,21 @@ static ssize_t fan1_input_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
 {
-	int value = asus_hwmon_fan_rpm_show(dev, 0);
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	int value;
+	int ret;
 
-	return sprintf(buf, "%d\n", value < 0 ? -1 : value*100);
+	/* no speed readable on manual mode */
+	if (asus->fan_pwm_mode == ASUS_FAN_CTRL_MANUAL)
+		return -ENXIO;
+
+	ret = asus_agfn_fan_speed_read(asus, 1, &value);
+	if (ret) {
+		pr_warn("reading fan speed failed: %d\n", ret);
+		return -ENXIO;
+	}
 
+	return sprintf(buf, "%d\n", value < 0 ? -1 : value*100);
 }
 
 static ssize_t pwm1_enable_show(struct device *dev,
@@ -1323,10 +1329,7 @@ static ssize_t pwm1_enable_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
-	if (asus->asus_hwmon_fan_manual_mode)
-		return sprintf(buf, "%d\n", ASUS_FAN_CTRL_MANUAL);
-
-	return sprintf(buf, "%d\n", ASUS_FAN_CTRL_AUTO);
+	return sprintf(buf, "%d\n", asus->fan_pwm_mode);
 }
 
 static ssize_t pwm1_enable_store(struct device *dev,
@@ -1343,14 +1346,21 @@ static ssize_t pwm1_enable_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (state == ASUS_FAN_CTRL_MANUAL)
-		asus->asus_hwmon_fan_manual_mode = true;
-	else
-		status = asus_hwmon_fan_set_auto(asus);
+	switch (state) {
+	case ASUS_FAN_CTRL_MANUAL:
+		break;
 
-	if (status)
-		return status;
+	case ASUS_FAN_CTRL_AUTO:
+		status = asus_fan_set_auto(asus);
+		if (status)
+			return status;
+		break;
 
+	default:
+		return -EINVAL;
+	}
+
+	asus->fan_pwm_mode = state;
 	return count;
 }
 
@@ -1404,59 +1414,31 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct platform_device *pdev = to_platform_device(dev->parent);
 	struct asus_wmi *asus = platform_get_drvdata(pdev);
-	int dev_id = -1;
-	int fan_attr = -1;
 	u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
-	bool ok = true;
-
-	if (attr == &dev_attr_pwm1.attr)
-		dev_id = ASUS_WMI_DEVID_FAN_CTRL;
-	else if (attr == &dev_attr_temp1_input.attr)
-		dev_id = ASUS_WMI_DEVID_THERMAL_CTRL;
-
 
 	if (attr == &dev_attr_fan1_input.attr
 	    || attr == &dev_attr_fan1_label.attr
 	    || attr == &dev_attr_pwm1.attr
 	    || attr == &dev_attr_pwm1_enable.attr) {
-		fan_attr = 1;
-	}
-
-	if (dev_id != -1) {
-		int err = asus_wmi_get_devstate(asus, dev_id, &value);
+		if (asus->fan_type == FAN_TYPE_NONE)
+			return 0;
+	} else if (attr == &dev_attr_temp1_input.attr) {
+		int err = asus_wmi_get_devstate(asus,
+						ASUS_WMI_DEVID_THERMAL_CTRL,
+						&value);
 
-		if (err < 0 && fan_attr == -1)
+		if (err < 0)
 			return 0; /* can't return negative here */
-	}
 
-	if (dev_id == ASUS_WMI_DEVID_FAN_CTRL) {
-		/*
-		 * We need to find a better way, probably using sfun,
-		 * bits or spec ...
-		 * Currently we disable it if:
-		 * - ASUS_WMI_UNSUPPORTED_METHOD is returned
-		 * - reverved bits are non-zero
-		 * - sfun and presence bit are not set
-		 */
-		if (value == ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
-		    || (!asus->sfun && !(value & ASUS_WMI_DSTS_PRESENCE_BIT)))
-			ok = false;
-		else
-			ok = fan_attr <= asus->asus_hwmon_num_fans;
-	} else if (dev_id == ASUS_WMI_DEVID_THERMAL_CTRL) {
 		/*
 		 * If the temperature value in deci-Kelvin is near the absolute
 		 * zero temperature, something is clearly wrong
 		 */
 		if (value == 0 || value == 1)
-			ok = false;
-	} else if (fan_attr <= asus->asus_hwmon_num_fans && fan_attr != -1) {
-		ok = true;
-	} else {
-		ok = false;
+			return 0;
 	}
 
-	return ok ? attr->mode : 0;
+	return attr->mode;
 }
 
 static const struct attribute_group hwmon_attribute_group = {
@@ -1482,21 +1464,16 @@ static int asus_wmi_hwmon_init(struct asus_wmi *asus)
 
 static int asus_wmi_fan_init(struct asus_wmi *asus)
 {
-	int status;
-
-	asus->asus_hwmon_pwm = -1;
-	asus->asus_hwmon_num_fans = -1;
-	asus->asus_hwmon_fan_manual_mode = false;
+	asus->fan_type = FAN_TYPE_NONE;
+	asus->agfn_pwm = -1;
 
-	status = asus_hwmon_get_fan_number(asus, &asus->asus_hwmon_num_fans);
-	if (status) {
-		asus->asus_hwmon_num_fans = 0;
-		pr_warn("Could not determine number of fans: %d\n", status);
-		return -ENXIO;
+	if (asus_wmi_has_agfn_fan(asus)) {
+		asus->fan_type = FAN_TYPE_AGFN;
+		asus_fan_set_auto(asus);
+		asus->fan_pwm_mode = ASUS_FAN_CTRL_AUTO;
 	}
 
-	pr_info("Number of fans: %d\n", asus->asus_hwmon_num_fans);
-	return 0;
+	return asus->fan_type != FAN_TYPE_NONE;
 }
 
 /* Fan mode *******************************************************************/
@@ -2348,7 +2325,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 		goto fail_input;
 
 	err = asus_wmi_fan_init(asus); /* probably no problems on error */
-	asus_hwmon_fan_set_auto(asus);
 
 	err = asus_wmi_hwmon_init(asus);
 	if (err)
@@ -2440,7 +2416,7 @@ static int asus_wmi_remove(struct platform_device *device)
 	asus_wmi_rfkill_exit(asus);
 	asus_wmi_debugfs_exit(asus);
 	asus_wmi_sysfs_exit(asus->platform_device);
-	asus_hwmon_fan_set_auto(asus);
+	asus_fan_set_auto(asus);
 
 	kfree(asus);
 	return 0;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 4802cd2c7309..5ae9c062a1f6 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -12,7 +12,7 @@
 #define ASUS_WMI_METHODID_GPID		0x44495047 /* Get Panel ID?? (Resol) */
 #define ASUS_WMI_METHODID_QMOD		0x444F4D51 /* Quiet MODe */
 #define ASUS_WMI_METHODID_SPLV		0x4C425053 /* Set Panel Light Value */
-#define ASUS_WMI_METHODID_AGFN		0x4E464741 /* FaN? */
+#define ASUS_WMI_METHODID_AGFN		0x4E464741 /* Atk Generic FuNction */
 #define ASUS_WMI_METHODID_SFUN		0x4E554653 /* FUNCtionalities */
 #define ASUS_WMI_METHODID_SDSP		0x50534453 /* Set DiSPlay output */
 #define ASUS_WMI_METHODID_GDSP		0x50534447 /* Get DiSPlay output */
@@ -72,7 +72,7 @@
 
 /* Fan, Thermal */
 #define ASUS_WMI_DEVID_THERMAL_CTRL	0x00110011
-#define ASUS_WMI_DEVID_FAN_CTRL		0x00110012
+#define ASUS_WMI_DEVID_FAN_CTRL		0x00110012 /* deprecated */
 
 /* Power */
 #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
-- 
2.20.1


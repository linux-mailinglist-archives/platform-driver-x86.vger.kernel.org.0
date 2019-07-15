Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5E65683B4
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2019 08:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfGOGyx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Jul 2019 02:54:53 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36635 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbfGOGyw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jul 2019 02:54:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so6963890pfl.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jul 2019 23:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3eQ+ggCZRdBKqPSgoQ3LMIrmfuag6XQ/FmFnMC/2Jg8=;
        b=D7EH7vvK2srnTdwb0NZ2SH0ObAGd0YJ1BaXsdV1oIpKg9Y13LqSQxkAvQ0EDNKJANH
         sHS2LCVjNVmJF0H0Z9EMrWvPzCahF7cmtLsKyUDapuqjd6vSydaIRFh2y9QYCdg/ek0i
         hevyG8uGTPT1On02j9MT+AncRQz7KwjD1pt+oU0UIsHYRx4NlFAiVpjXCyb2/bcYAX4E
         eMvP8vnspHpyNA9hr+7Hosd9mHllh9LNC/Vot7B7K/NohWCHrx371mo8PyKRc1y+QvwN
         LJVF1Bm1pzW/8rE7lCWeiyMeBM/QMGHkbNQ3q6jJjvDpscHMf5QBNlaD3aOlE7YHX4Df
         EQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eQ+ggCZRdBKqPSgoQ3LMIrmfuag6XQ/FmFnMC/2Jg8=;
        b=RIJdXclvrW1Z636hOuENJy/dM4m+ecWlkZw47zrqPXPMzVLDTdr1VPSnMBT4LItino
         ZGDPTGTtklc6x5KUrrqpvGPJC4bqaoRrQ0zjUUCztpEYKYXOIM1hcvi51L+91IGLULzm
         p7qLwdLrC6NZC3tnqtgWgRJh/DzsZUUqpS66Gg5d6+ufrZucyKn8fBIXVRxTNyXZyNf6
         n1B1NGY1nHxi3R0OBFc8GQ85jV78VxeQqyq70JN5gvfQG+Xecwt7k6YXHZUBvz/RqPV3
         AfrD6MlRJjYttuXL/sXBZMSF21toMifFSfyGHMyCxdrngo6LbnR2xd479rrscgTihE/A
         x+MA==
X-Gm-Message-State: APjAAAWRVgfY8+ujmFNjgDur2BEH2tEsgippZStw4k6g7tu0YSq3PdFW
        UrnVY+9KhO19ZHwncF+m/maKEw==
X-Google-Smtp-Source: APXvYqx5NozAlOMoCgKxElNo6eUJJpvz9vbkDR0omin9QSgNs9e6H0U7yxoZ6MNteRHhDzWVywywqw==
X-Received: by 2002:a63:24a:: with SMTP id 71mr831060pgc.273.1563173691755;
        Sun, 14 Jul 2019 23:54:51 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id y22sm19183257pfo.39.2019.07.14.23.54.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 14 Jul 2019 23:54:51 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, yurii.pavlovskyi@gmail.com,
        linux@endlessm.com
Subject: [PATCH 3/3] platform/x86: asus: fix CPU fan control on recent products
Date:   Mon, 15 Jul 2019 14:54:39 +0800
Message-Id: <20190715065439.27159-3-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715065439.27159-1-drake@endlessm.com>
References: <20190715065439.27159-1-drake@endlessm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, asus-wmi was using the AGFN interface and FAN_CTRL device
for CPU fan control. However, this code has been found to be not fully
working on some recent products, and having checked the spec, these
interfaces are marked as being removed from future products currently
in development.

The replacement appears to be the CPU_FAN device, added in spec version
8.3 (March 2014) and present on many modern Asus laptops.

Add support for this device, and use it whenever it is detected.
The older approach based on AGFN and FAN_CTRL is used as a fallback
on products that do not have such device.

Other than switching between automatic and full speed, there is
no fan speed control through this new interface.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c            | 125 ++++++++++++++++-----
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 2 files changed, 101 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6925b2102f94..28e79d1028c6 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -80,6 +80,7 @@ MODULE_LICENSE("GPL");
 #define ASUS_FAN_SFUN_WRITE		0x07
 
 /* Based on standard hwmon pwmX_enable values */
+#define ASUS_FAN_CTRL_FULLSPEED		0
 #define ASUS_FAN_CTRL_MANUAL		1
 #define ASUS_FAN_CTRL_AUTO		2
 
@@ -166,6 +167,7 @@ struct asus_rfkill {
 enum fan_type {
 	FAN_TYPE_NONE = 0,
 	FAN_TYPE_AGFN,		/* deprecated on newer platforms */
+	FAN_TYPE_SPEC83,	/* starting in Spec 8.3, use CPU_FAN_CTRL */
 };
 
 struct asus_wmi {
@@ -1225,10 +1227,29 @@ static bool asus_wmi_has_agfn_fan(struct asus_wmi *asus)
 static int asus_fan_set_auto(struct asus_wmi *asus)
 {
 	int status;
+	u32 retval;
 
-	status = asus_agfn_fan_speed_write(asus, 0, NULL);
-	if (status)
+	switch (asus->fan_type) {
+	case FAN_TYPE_SPEC83:
+		status = asus_wmi_set_devstate(ASUS_WMI_DEVID_CPU_FAN_CTRL,
+					       0, &retval);
+		if (status)
+			return status;
+
+		if (retval != 1)
+			return -EIO;
+		break;
+
+	case FAN_TYPE_AGFN:
+		status = asus_agfn_fan_speed_write(asus, 0, NULL);
+		if (status)
+			return -ENXIO;
+		break;
+
+	default:
 		return -ENXIO;
+	}
+
 
 	return 0;
 }
@@ -1301,13 +1322,29 @@ static ssize_t fan1_input_show(struct device *dev,
 	int value;
 	int ret;
 
-	/* no speed readable on manual mode */
-	if (asus->fan_pwm_mode == ASUS_FAN_CTRL_MANUAL)
-		return -ENXIO;
+	switch (asus->fan_type) {
+	case FAN_TYPE_SPEC83:
+		ret = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CPU_FAN_CTRL,
+					    &value);
+		if (ret < 0)
+			return ret;
 
-	ret = asus_agfn_fan_speed_read(asus, 1, &value);
-	if (ret) {
-		pr_warn("reading fan speed failed: %d\n", ret);
+		value &= 0xffff;
+		break;
+
+	case FAN_TYPE_AGFN:
+		/* no speed readable on manual mode */
+		if (asus->fan_pwm_mode == ASUS_FAN_CTRL_MANUAL)
+			return -ENXIO;
+
+		ret = asus_agfn_fan_speed_read(asus, 1, &value);
+		if (ret) {
+			pr_warn("reading fan speed failed: %d\n", ret);
+			return -ENXIO;
+		}
+		break;
+
+	default:
 		return -ENXIO;
 	}
 
@@ -1320,6 +1357,15 @@ static ssize_t pwm1_enable_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	/*
+	 * Just read back the cached pwm mode.
+	 *
+	 * For the CPU_FAN device, the spec indicates that we should be
+	 * able to read the device status and consult bit 19 to see if we
+	 * are in Full On or Automatic mode. However, this does not work
+	 * in practice on X532FL at least (the bit is always 0) and there's
+	 * also nothing in the DSDT to indicate that this behaviour exists.
+	 */
 	return sprintf(buf, "%d\n", asus->fan_pwm_mode);
 }
 
@@ -1330,25 +1376,48 @@ static ssize_t pwm1_enable_store(struct device *dev,
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 	int status = 0;
 	int state;
+	int value;
 	int ret;
+	u32 retval;
 
 	ret = kstrtouint(buf, 10, &state);
 
 	if (ret)
 		return ret;
 
-	switch (state) {
-	case ASUS_FAN_CTRL_MANUAL:
-		break;
+	if (asus->fan_type == FAN_TYPE_SPEC83) {
+		switch (state) { /* standard documented hwmon values */
+		case ASUS_FAN_CTRL_FULLSPEED:
+			value = 1;
+			break;
+		case ASUS_FAN_CTRL_AUTO:
+			value = 0;
+			break;
+		default:
+			return -EINVAL;
+		}
 
-	case ASUS_FAN_CTRL_AUTO:
-		status = asus_fan_set_auto(asus);
-		if (status)
-			return status;
-		break;
+		ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_CPU_FAN_CTRL,
+					    value, &retval);
+		if (ret)
+			return ret;
 
-	default:
-		return -EINVAL;
+		if (retval != 1)
+			return -EIO;
+	} else if (asus->fan_type == FAN_TYPE_AGFN) {
+		switch (state) {
+		case ASUS_FAN_CTRL_MANUAL:
+			break;
+
+		case ASUS_FAN_CTRL_AUTO:
+			status = asus_fan_set_auto(asus);
+			if (status)
+				return status;
+			break;
+
+		default:
+			return -EINVAL;
+		}
 	}
 
 	asus->fan_pwm_mode = state;
@@ -1407,9 +1476,11 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 	struct asus_wmi *asus = platform_get_drvdata(pdev);
 	u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
 
-	if (attr == &dev_attr_fan1_input.attr
+	if (attr == &dev_attr_pwm1.attr) {
+		if (asus->fan_type != FAN_TYPE_AGFN)
+			return 0;
+	} else if (attr == &dev_attr_fan1_input.attr
 	    || attr == &dev_attr_fan1_label.attr
-	    || attr == &dev_attr_pwm1.attr
 	    || attr == &dev_attr_pwm1_enable.attr) {
 		if (asus->fan_type == FAN_TYPE_NONE)
 			return 0;
@@ -1458,13 +1529,17 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 	asus->fan_type = FAN_TYPE_NONE;
 	asus->agfn_pwm = -1;
 
-	if (asus_wmi_has_agfn_fan(asus)) {
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CPU_FAN_CTRL))
+		asus->fan_type = FAN_TYPE_SPEC83;
+	else if (asus_wmi_has_agfn_fan(asus))
 		asus->fan_type = FAN_TYPE_AGFN;
-		asus_fan_set_auto(asus);
-		asus->fan_pwm_mode = ASUS_FAN_CTRL_AUTO;
-	}
 
-	return asus->fan_type != FAN_TYPE_NONE;
+	if (asus->fan_type == FAN_TYPE_NONE)
+		return -ENODEV;
+
+	asus_fan_set_auto(asus);
+	asus->fan_pwm_mode = ASUS_FAN_CTRL_AUTO;
+	return 0;
 }
 
 /* Fan mode *******************************************************************/
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 5ae9c062a1f6..409e16064f4b 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -73,6 +73,7 @@
 /* Fan, Thermal */
 #define ASUS_WMI_DEVID_THERMAL_CTRL	0x00110011
 #define ASUS_WMI_DEVID_FAN_CTRL		0x00110012 /* deprecated */
+#define ASUS_WMI_DEVID_CPU_FAN_CTRL	0x00110013
 
 /* Power */
 #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
-- 
2.20.1


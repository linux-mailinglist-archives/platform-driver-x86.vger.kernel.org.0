Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97CED7875A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jul 2019 10:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfG2I1v (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 29 Jul 2019 04:27:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38261 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfG2I1v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Jul 2019 04:27:51 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so27640790pfn.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2019 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WTfOVNA8fZT65vyMFBO6334fGawfobsp9ogdYA9ebEw=;
        b=IX6NK4rEN0D8zy71oTU7NCMkuHmzUwJ3RIKm4VeQ6dYsQ6FvIqDgJIvJelCNk/q16m
         /MDefv8Ukf4yT+4Z3H76Ynm5xxl+JOA8cPrsiVHwCYq9eX3f/cch3vfvmFHhI3bMAr3d
         buw1CZXBt71ZlENh8YTwqqmfrlrAuefgbAMQKeW92vIbTv53gLIbF9JkfGe/5hyPLDuY
         Y/97Lc470RLKtUEX8NWCwDxivul9tyrAKEB8R+9x5zIXATzdQByEZjbfS4ML0UHkdCCF
         uQ9sfXdMNFvtj0JUBdlLWD2fw1JkZzmMSPzsQa9pw4XIL4KqXfQDYKP+SDuCZ9jtXouO
         BL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WTfOVNA8fZT65vyMFBO6334fGawfobsp9ogdYA9ebEw=;
        b=nlR0fPE6UdKCKAC7MwxCqHAeLCDbDWyDlFNlbxIfFTK2/aLga5xSfRDxDVcbiO/RR3
         VKjsTjuq2/AmYNAU31enisrlxrBa/D91naKTeRc086CRcmZIT8VKLuF8Fq6C/5XyRZIg
         re9oc2ETaLddAIEJSZHEQnTE9wvAWcF+GZGi1O7UpKbgF58sq/ndqbOIcghTk7izxEyM
         WU9IAKxgpMlztk02RdlA6wnmlRpECJsA1sNj2wvh4kPtUeCcpEmehhVm2tiuZ6MP2s/F
         M3x/7C2JLLlqA15QSa6NIbY6UroQihEE5sN7UAqTbzcLOAo4iWV5zX7mikkoL0R8GJqh
         XK8A==
X-Gm-Message-State: APjAAAU/aKGjNCez2K9ecX6mPB0pOwk6zqDNUE3rJmsVQ2aDS96k3s1q
        BRwgVa5M0z+ZBmBmg4vcOt//PYfaoG8=
X-Google-Smtp-Source: APXvYqy3ybq6EAtfoEgSEXmR+bOiNdj1TGpfaBUZ2p6wsVMaCuHVpKL6kvGwHBgBf+OUvwMonkGpug==
X-Received: by 2002:a63:8a49:: with SMTP id y70mr7819248pgd.271.1564388870435;
        Mon, 29 Jul 2019 01:27:50 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id z13sm51359531pjn.32.2019.07.29.01.27.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 01:27:49 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, yurii.pavlovskyi@gmail.com,
        linux@endlessm.com
Subject: [PATCH v2 3/3] platform/x86: asus-wmi: fix CPU fan control on recent products
Date:   Mon, 29 Jul 2019 16:27:39 +0800
Message-Id: <20190729082739.8045-3-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729082739.8045-1-drake@endlessm.com>
References: <20190729082739.8045-1-drake@endlessm.com>
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

Notes:
    v2: rediff against current review-andy branch

 drivers/platform/x86/asus-wmi.c            | 125 ++++++++++++++++-----
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 2 files changed, 101 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 25f1e256c442..34dfbed65332 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -67,6 +67,7 @@ MODULE_LICENSE("GPL");
 #define ASUS_FAN_SFUN_WRITE		0x07
 
 /* Based on standard hwmon pwmX_enable values */
+#define ASUS_FAN_CTRL_FULLSPEED		0
 #define ASUS_FAN_CTRL_MANUAL		1
 #define ASUS_FAN_CTRL_AUTO		2
 
@@ -153,6 +154,7 @@ struct asus_rfkill {
 enum fan_type {
 	FAN_TYPE_NONE = 0,
 	FAN_TYPE_AGFN,		/* deprecated on newer platforms */
+	FAN_TYPE_SPEC83,	/* starting in Spec 8.3, use CPU_FAN_CTRL */
 };
 
 struct asus_wmi {
@@ -1211,10 +1213,29 @@ static bool asus_wmi_has_agfn_fan(struct asus_wmi *asus)
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
@@ -1287,13 +1308,29 @@ static ssize_t fan1_input_show(struct device *dev,
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
 
@@ -1306,6 +1343,15 @@ static ssize_t pwm1_enable_show(struct device *dev,
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
 
@@ -1316,25 +1362,48 @@ static ssize_t pwm1_enable_store(struct device *dev,
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
@@ -1392,9 +1461,11 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 	struct asus_wmi *asus = dev_get_drvdata(dev->parent);
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
@@ -1443,13 +1514,17 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
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


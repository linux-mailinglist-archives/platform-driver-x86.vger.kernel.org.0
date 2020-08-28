Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1A62562AB
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Aug 2020 23:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgH1V43 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Aug 2020 17:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgH1V40 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Aug 2020 17:56:26 -0400
X-Greylist: delayed 403 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 28 Aug 2020 14:56:25 PDT
Received: from forward100o.mail.yandex.net (forward100o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78A3C061264
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 14:56:25 -0700 (PDT)
Received: from mxback23g.mail.yandex.net (mxback23g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:323])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 1CD304AC09A5;
        Sat, 29 Aug 2020 00:49:37 +0300 (MSK)
Received: from iva7-f62245f79210.qloud-c.yandex.net (iva7-f62245f79210.qloud-c.yandex.net [2a02:6b8:c0c:2e83:0:640:f622:45f7])
        by mxback23g.mail.yandex.net (mxback/Yandex) with ESMTP id 6hqoHSgAKx-nae4poRs;
        Sat, 29 Aug 2020 00:49:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1598651377;
        bh=TARJF1iVCZ5jUthlitaT8D0FZ88g7ASRFuIwOIU6bDc=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=b34FmIVqU0TksVJeTAkoukcttwWdeB4gqlNjlMDEbmBmzkHV/Ks0tnz+6T9BH2V4z
         BRgnAv8ohC2Iyqf72x0fpaCf9rmi7lewJdfDatj349QQmUiAecMgs76Xa19+9avoy5
         oTLScUEEdELVITL4SiN2L53hPvjnAE6RyKezY0l4=
Authentication-Results: mxback23g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva7-f62245f79210.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id wtE0T54V7Y-naHW7L5B;
        Sat, 29 Aug 2020 00:49:36 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Vasiliy Kupriakov <rublag-ns@yandex.ru>
To:     Corentin Chary <corentin.chary@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Vasiliy Kupriakov <rublag-ns@yandex.ru>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86 asus-wmi: Add GPU fan reading support
Date:   Sat, 29 Aug 2020 00:49:32 +0300
Message-Id: <20200828214932.20866-4-rublag-ns@yandex.ru>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828214932.20866-1-rublag-ns@yandex.ru>
References: <20200828214932.20866-1-rublag-ns@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The GPU fan interface is same as the CPU fan, so it is straightforward.

Signed-off-by: Vasiliy Kupriakov <rublag-ns@yandex.ru>
---
 drivers/platform/x86/asus-wmi.c            | 43 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 82505307ec17..07508c4d1a9a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -71,6 +71,8 @@ MODULE_LICENSE("GPL");
 #define ASUS_FAN_SFUN_READ		0x06
 #define ASUS_FAN_SFUN_WRITE		0x07
 
+#define ASUS_GPU_FAN_DESC		"gpu_fan"
+
 /* Based on standard hwmon pwmX_enable values */
 #define ASUS_FAN_CTRL_FULLSPEED		0
 #define ASUS_FAN_CTRL_MANUAL		1
@@ -201,6 +203,7 @@ struct asus_wmi {
 	enum fan_type fan_type;
 	int fan_pwm_mode;
 	int agfn_pwm;
+	bool gpu_fan_available;
 
 	bool fan_boost_mode_available;
 	u8 fan_boost_mode_mask;
@@ -1546,6 +1549,29 @@ static ssize_t fan1_label_show(struct device *dev,
 	return sprintf(buf, "%s\n", ASUS_FAN_DESC);
 }
 
+static ssize_t fan2_input_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	int value;
+	int ret;
+
+	ret = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_GPU_FAN_CTRL, &value);
+	if (ret < 0)
+		return ret;
+
+	value &= 0xFFFF;
+	return sprintf(buf, "%d\n", value < 0 ? -1 : value * 100);
+}
+
+static ssize_t fan2_label_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	return sprintf(buf, "%s\n", ASUS_GPU_FAN_DESC);
+}
+
 static ssize_t asus_hwmon_temp1(struct device *dev,
 				struct device_attribute *attr,
 				char *buf)
@@ -1568,6 +1594,10 @@ static DEVICE_ATTR_RW(pwm1_enable);
 static DEVICE_ATTR_RO(fan1_input);
 static DEVICE_ATTR_RO(fan1_label);
 
+/* GPU fan */
+static DEVICE_ATTR_RO(fan2_input);
+static DEVICE_ATTR_RO(fan2_label);
+
 /* Temperature */
 static DEVICE_ATTR(temp1_input, S_IRUGO, asus_hwmon_temp1, NULL);
 
@@ -1577,6 +1607,9 @@ static struct attribute *hwmon_attributes[] = {
 	&dev_attr_fan1_input.attr,
 	&dev_attr_fan1_label.attr,
 
+	&dev_attr_fan2_input.attr,
+	&dev_attr_fan2_label.attr,
+
 	&dev_attr_temp1_input.attr,
 	NULL
 };
@@ -1596,6 +1629,10 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 	    || attr == &dev_attr_pwm1_enable.attr) {
 		if (asus->fan_type == FAN_TYPE_NONE)
 			return 0;
+	} else if (attr == &dev_attr_fan2_input.attr
+	    || attr == &dev_attr_fan2_label.attr) {
+		if (!asus->gpu_fan_available)
+			return 0;
 	} else if (attr == &dev_attr_temp1_input.attr) {
 		int err = asus_wmi_get_devstate(asus,
 						ASUS_WMI_DEVID_THERMAL_CTRL,
@@ -1640,6 +1677,7 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 {
 	asus->fan_type = FAN_TYPE_NONE;
 	asus->agfn_pwm = -1;
+	asus->gpu_fan_available = false;
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CPU_FAN_CTRL))
 		asus->fan_type = FAN_TYPE_SPEC83;
@@ -1653,6 +1691,11 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 
 	asus_fan_set_auto(asus);
 	asus->fan_pwm_mode = ASUS_FAN_CTRL_AUTO;
+
+	if (asus->fan_type == FAN_TYPE_SPEC83 &&
+	    asus_wmi_has_fan(asus, ASUS_WMI_DEVID_GPU_FAN_CTRL))
+		asus->gpu_fan_available = true;
+
 	return 0;
 }
 
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 897b8332a39f..c0364ba63813 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -75,6 +75,7 @@
 #define ASUS_WMI_DEVID_THERMAL_CTRL	0x00110011
 #define ASUS_WMI_DEVID_FAN_CTRL		0x00110012 /* deprecated */
 #define ASUS_WMI_DEVID_CPU_FAN_CTRL	0x00110013
+#define ASUS_WMI_DEVID_GPU_FAN_CTRL	0x00110014
 
 /* Power */
 #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
-- 
2.28.0


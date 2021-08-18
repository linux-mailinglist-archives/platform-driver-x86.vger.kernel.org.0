Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7B33F0B9A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Aug 2021 21:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhHRTI2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 Aug 2021 15:08:28 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36681 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233554AbhHRTIV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 15:08:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 93CD55C00F4;
        Wed, 18 Aug 2021 15:07:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 18 Aug 2021 15:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ltI0PDs6CvDFzKiqlDBrtdYOA/DP8RpaCuL19rintps=; b=CmmUDHFf
        umualgywEfgEOBzhuhAsOwcGeR2/1VH8Z8WAk1KOZ77COoroN5WVkog1PEzm+kim
        yFu3pZRnqLE3tDAltjuehonYMOfv86LiLEZW2zuqG/GbYw8FKjSu3ieiUIahxsVi
        t4XpBNj6fJO81Gzx31yv19I8vxAGcoP8k/PoADPmXn+VQWqv70tguhguGj7wQ1zL
        QCvusHgfxpmISH7Mp/V0cN5DUeSWq/F1phu5wrtFItkP1+oK025uat3F3YrP4jl5
        l36XFynjZE6cSP0auOyT1XpeTGKkI3KLx+UBd7133F5/sCCcCS1wyzWudaQJIWnc
        j1badiDdiY3OYg==
X-ME-Sender: <xms:glodYbeVdotPh0HqpgVBnxmiVsSJ1QC1m_UGRZ1W8jlyZ4ZavDCpEQ>
    <xme:glodYRNFqurSD_fnYGV1KMDbu8Sz6kPs99QUTrtdsC3onGsnt6cd8TLNeZd2G-D8B
    EihltjRmidED69QJW0>
X-ME-Received: <xmr:glodYUjTcgOOmjh0WrJjHJZzcP3LcjNS-oYqClXjJX43PmiAzNwlpRgnVdbZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpedvteekvdeuhedthfeuudelheejie
    fhvddtteelleeghfekhfeugfehgeekffdtheenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:glodYc8R-hwxvO5--x2vG9hYrupzmA19pdex-Fv4idstiZJfqByEwg>
    <xmx:glodYXtTkSt2B1xVWSif6MVayfDCyb5Gj5-i1PLY2zZbICiW3kAizQ>
    <xmx:glodYbGpKz7ydfhwKXwSQ4QQddm-XK28rqtLMe_ytvuXOOjnCUm-Wg>
    <xmx:glodYQ41JxO84WaVjt7HBp6uCy4I83R63R3xJVvErxSUx597q5tv9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 15:07:43 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     linux-kernel@vger.kernel.org
Cc:     hdegoede@redhat.com, hadess@hadess.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v5 1/1] asus-wmi: Add support for platform_profile
Date:   Thu, 19 Aug 2021 07:07:31 +1200
Message-Id: <20210818190731.19170-2-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818190731.19170-1-luke@ljones.dev>
References: <20210818190731.19170-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add initial support for platform_profile where the support is
based on availability of ASUS_THROTTLE_THERMAL_POLICY.

Because throttle_thermal_policy is used by platform_profile and is
writeable separately to platform_profile any userspace changes to
throttle_thermal_policy need to notify platform_profile.

In future throttle_thermal_policy sysfs should be removed so that
only one method controls the laptop power profile.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/Kconfig    |   1 +
 drivers/platform/x86/asus-wmi.c | 130 +++++++++++++++++++++++++++++++-
 2 files changed, 127 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d12db6c316ea..46dec48a36c1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -281,6 +281,7 @@ config ASUS_WMI
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
+	select ACPI_PLATFORM_PROFILE
 	help
 	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
 	  Asus Notebooks).
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 90a6a0d00deb..cc5811844012 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -26,6 +26,7 @@
 #include <linux/rfkill.h>
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
+#include <linux/platform_profile.h>
 #include <linux/power_supply.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -219,6 +220,9 @@ struct asus_wmi {
 	bool throttle_thermal_policy_available;
 	u8 throttle_thermal_policy_mode;
 
+	struct platform_profile_handler platform_profile_handler;
+	bool platform_profile_support;
+
 	// The RSOC controls the maximum charging percentage.
 	bool battery_rsoc_available;
 
@@ -2103,12 +2107,23 @@ static int throttle_thermal_policy_set_default(struct asus_wmi *asus)
 static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
 {
 	u8 new_mode = asus->throttle_thermal_policy_mode + 1;
+	int err;
 
 	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
 		new_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
 
 	asus->throttle_thermal_policy_mode = new_mode;
-	return throttle_thermal_policy_write(asus);
+	err = throttle_thermal_policy_write(asus);
+	if (err)
+		return err;
+
+	/*
+	 * Ensure that platform_profile updates userspace with the change to ensure
+	 * that platform_profile and throttle_thermal_policy_mode are in sync.
+	 */
+	platform_profile_notify();
+
+	return 0;
 }
 
 static ssize_t throttle_thermal_policy_show(struct device *dev,
@@ -2124,9 +2139,10 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
 				    struct device_attribute *attr,
 				    const char *buf, size_t count)
 {
-	int result;
-	u8 new_mode;
 	struct asus_wmi *asus = dev_get_drvdata(dev);
+	u8 new_mode;
+	int result;
+	int err;
 
 	result = kstrtou8(buf, 10, &new_mode);
 	if (result < 0)
@@ -2136,7 +2152,15 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
 		return -EINVAL;
 
 	asus->throttle_thermal_policy_mode = new_mode;
-	throttle_thermal_policy_write(asus);
+	err = throttle_thermal_policy_write(asus);
+	if (err)
+		return err;
+
+	/*
+	 * Ensure that platform_profile updates userspace with the change to ensure
+	 * that platform_profile and throttle_thermal_policy_mode are in sync.
+	 */
+	platform_profile_notify();
 
 	return count;
 }
@@ -2144,6 +2168,94 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
 // Throttle thermal policy: 0 - default, 1 - overboost, 2 - silent
 static DEVICE_ATTR_RW(throttle_thermal_policy);
 
+/* Platform profile ***********************************************************/
+static int platform_profile_get(struct platform_profile_handler *pprof,
+				enum platform_profile_option *profile)
+{
+	struct asus_wmi *asus;
+	int tp;
+
+	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
+
+	tp = asus->throttle_thermal_policy_mode;
+
+	if (tp < 0)
+		return tp;
+
+	switch (tp) {
+	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
+		*profile = PLATFORM_PROFILE_QUIET;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int platform_profile_set(struct platform_profile_handler *pprof,
+				enum platform_profile_option profile)
+{
+	struct asus_wmi *asus;
+	int tp;
+
+	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
+
+	switch (profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
+		break;
+	case PLATFORM_PROFILE_QUIET:
+		tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	asus->throttle_thermal_policy_mode = tp;
+	return throttle_thermal_policy_write(asus);
+}
+
+static int platform_profile_setup(struct asus_wmi *asus)
+{
+	struct device *dev = &asus->platform_device->dev;
+	int err;
+
+	/*
+	 * Not an error if a component platform_profile relies on is unavailable
+	 * so early return, skipping the setup of platform_profile.
+	 */
+	if (!asus->throttle_thermal_policy_available)
+		return 0;
+
+	dev_info(dev, "Using throttle_thermal_policy for platform_profile support\n");
+
+	asus->platform_profile_handler.profile_get = platform_profile_get;
+	asus->platform_profile_handler.profile_set = platform_profile_set;
+
+	set_bit(PLATFORM_PROFILE_QUIET, asus->platform_profile_handler.choices);
+	set_bit(PLATFORM_PROFILE_BALANCED,
+		asus->platform_profile_handler.choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE,
+		asus->platform_profile_handler.choices);
+
+	err = platform_profile_register(&asus->platform_profile_handler);
+	if (err)
+		return err;
+
+	asus->platform_profile_support = true;
+	return 0;
+}
+
 /* Backlight ******************************************************************/
 
 static int read_backlight_power(struct asus_wmi *asus)
@@ -2904,6 +3016,10 @@ static int asus_wmi_add(struct platform_device *pdev)
 	else
 		throttle_thermal_policy_set_default(asus);
 
+	err = platform_profile_setup(asus);
+	if (err)
+		goto fail_platform_profile_setup;
+
 	err = panel_od_check_present(asus);
 	if (err)
 		goto fail_panel_od;
@@ -2993,6 +3109,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus_wmi_sysfs_exit(asus->platform_device);
 fail_sysfs:
 fail_throttle_thermal_policy:
+fail_platform_profile_setup:
+	if (asus->platform_profile_support)
+		platform_profile_remove();
 fail_fan_boost_mode:
 fail_egpu_enable:
 fail_dgpu_disable:
@@ -3017,6 +3136,9 @@ static int asus_wmi_remove(struct platform_device *device)
 	asus_fan_set_auto(asus);
 	asus_wmi_battery_exit(asus);
 
+	if (asus->platform_profile_support)
+		platform_profile_remove();
+
 	kfree(asus);
 	return 0;
 }
-- 
2.31.1


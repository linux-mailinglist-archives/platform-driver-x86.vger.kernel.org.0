Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EE8A4B46
	for <lists+platform-driver-x86@lfdr.de>; Sun,  1 Sep 2019 21:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbfIATFX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 1 Sep 2019 15:05:23 -0400
Received: from mail.klausen.dk ([174.138.9.187]:53808 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729173AbfIATFX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Sep 2019 15:05:23 -0400
From:   Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1567364720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Vh3a5k1b2eRvMjw+dMTk7q81r1jef9uyniYxusFHRFI=;
        b=EDJmh8RNLVrV19iMwNenYKBf9AjOEGb2JhWFvFFaoB432JQBQhWdTUvi0Y8N7oyFW0pPf4
        +DDRLo3UfGjRbJ3AGgPlbj9T2nid77wEZ1nxi1710lJZgtX95mKj6u778rnrLhiBTrav5v
        WV+HlTAf1oMLFQPQLRvQUSuIqtSv+8A=
To:     platform-driver-x86@vger.kernel.org
Cc:     Daniel Drake <drake@endlessm.com>,
        Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH v4] platform/x86: asus-wmi: Support setting a maximum charging percentage
Date:   Sun,  1 Sep 2019 21:04:52 +0200
Message-Id: <20190901190453.29720-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.23.0
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
V4:
Use asus_wmi_dev_is_present() instead of asus_wmi_get_devstate_simple()
to check if the RSOC is available.
asus_wmi_dev_is_present() use ASUS_WMI_DSTS_STATUS_BIT and
ASUS_WMI_DSTS_UNKNOWN_BIT which isn't mentioned in the spec for the RSOC.
Only unregister the battery_hook if battery_hook_register was called
previously.

V3:
Refactor to use the new battery hooking API[1] and knobs[2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa93854f7a7ed63d054405bf3779247d5300edd3
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=813cab8f3994250e136819ae48fbd1c95d980466

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

 drivers/platform/x86/asus-wmi.c            | 97 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 100 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 34dfbed65332..f0085953b381 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -26,6 +26,7 @@
 #include <linux/rfkill.h>
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
+#include <linux/power_supply.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/debugfs.h>
@@ -36,6 +37,7 @@
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <acpi/video.h>
+#include <acpi/battery.h>
 
 #include "asus-wmi.h"
 
@@ -195,6 +197,9 @@ struct asus_wmi {
 	u8 fan_boost_mode_mask;
 	u8 fan_boost_mode;
 
+	// The RSOC controls the maximum charging percentage.
+	bool battery_rsoc_available;
+
 	struct hotplug_slot hotplug_slot;
 	struct mutex hotplug_lock;
 	struct mutex wmi_lock;
@@ -368,6 +373,95 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/* Battery ********************************************************************/
+
+/* The battery maximum charging percentage */
+static int charge_end_threshold;
+
+static ssize_t charge_control_end_threshold_store(struct device *dev,
+						  struct device_attribute *attr,
+						  const char *buf, size_t count)
+{
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
+	charge_end_threshold = value;
+	return count;
+}
+
+static ssize_t charge_control_end_threshold_show(struct device *device,
+						 struct device_attribute *attr,
+						 char *buf)
+{
+	return sprintf(buf, "%d\n", charge_end_threshold);
+}
+
+static DEVICE_ATTR_RW(charge_control_end_threshold);
+
+static int asus_wmi_battery_add(struct power_supply *battery)
+{
+	/* The WMI method does not provide a way to specific a battery, so we
+	 * just assume it is the first battery.
+	 */
+	if (!strcmp(battery->desc->name, "BAT0") == 0)
+		return -ENODEV;
+
+	if (device_create_file(&battery->dev,
+	    &dev_attr_charge_control_end_threshold))
+		return -ENODEV;
+
+	/* The charge threshold is only reset when the system is power cycled,
+	 * and we can't get the current threshold so let set it to 100% when
+	 * a battery is added.
+	 */
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
+	charge_end_threshold = 100;
+
+	return 0;
+}
+
+static int asus_wmi_battery_remove(struct power_supply *battery)
+{
+	device_remove_file(&battery->dev,
+			   &dev_attr_charge_control_end_threshold);
+	return 0;
+}
+
+static struct acpi_battery_hook battery_hook = {
+	.add_battery = asus_wmi_battery_add,
+	.remove_battery = asus_wmi_battery_remove,
+	.name = "ASUS Battery Extension",
+};
+
+static void asus_wmi_battery_init(struct asus_wmi *asus)
+{
+	asus_wmi->battery_rsoc_available = false;
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_RSOC)) {
+		asus_wmi->battery_rsoc_available = true;
+		battery_hook_register(&battery_hook);
+	}
+}
+
+static void asus_wmi_battery_exit(struct asus_wmi *asus)
+{
+	if (asus_wmi->battery_rsoc_available)
+		battery_hook_unregister(&battery_hook);
+}
+
 /* LEDs ***********************************************************************/
 
 /*
@@ -2433,6 +2527,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 		goto fail_wmi_handler;
 	}
 
+	asus_wmi_battery_init(asus);
+
 	asus_wmi_debugfs_init(asus);
 
 	return 0;
@@ -2468,6 +2564,7 @@ static int asus_wmi_remove(struct platform_device *device)
 	asus_wmi_debugfs_exit(asus);
 	asus_wmi_sysfs_exit(asus->platform_device);
 	asus_fan_set_auto(asus);
+	asus_wmi_battery_exit(asus);
 
 	kfree(asus);
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
2.23.0


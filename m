Return-Path: <platform-driver-x86+bounces-14656-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 302CEBDC098
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Oct 2025 03:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3120E192793C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Oct 2025 01:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516CF2FDC52;
	Wed, 15 Oct 2025 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3hUH/Ax"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33A2FB0B5
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492985; cv=none; b=YCq7pmvqIJDSigxFl6MhJoU3XUOzmsvFELVdRmc2hZ3f4BcNE+6Lqy3mCevEBwrUsY2M3xe1cVE9SxA/enHEGsz8Hju3NZ9JL+kAFcDl454uFmh72GwXqr7t5QBrjwdSQdYz0cqZid/xieenQYLHgmZ4idP1Vk0jeTvZlU0blQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492985; c=relaxed/simple;
	bh=JnFEB1zfPIgTeNvxDUlq/ENOs5f13JuP3gq33Phdwu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6rt4+z2njz0krpPLz2rW4KtxpTl6X5YYoiyywLcIv6A05JATgwrhAdBJouTzOZIwICavcnvoab0Eo16n5xxMPz9oHlwKe/VFSaxzW3c6cUktmxeUI8ftkK0injuiT19kWm8lJ4CjJfGnUe16LiWIGZYbuvKa5VlNIvWQnCPtKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3hUH/Ax; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-421b93ee372so3183916f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 18:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760492980; x=1761097780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvW/p3WSXzasdlPz6egbM6LxJzT8873EOQRHO7ajI9A=;
        b=E3hUH/AxJ7lnYVKFV5PlXQc+Bx5C7522KRNMOz1N3jG+4wAAmhG+JexAzqR7UJEO8K
         GNHRqGbdUY2mupGqNVXSSNldl5+5w/nLFeFtJgqSR4fI/KG9BcRh2oxdd+/jBofoCt/d
         eYZHDlqVU+OfIQRyquKLU4LBqVLzY1o4WO0C0+srhYA29Lnude1zxW6kpi4PFdZ0m5bM
         yyYj4BPd4E4ErChtmUWE9Sj7+pXRvaZpf6qVohSkcS1Y4M/pXblX8klGw9oE6n8gq/PW
         Esu0Vcm1/kpX62ZRPchPaso4lFb5NA2BVzV19muLV6THTmFSVjrAVXSbcd2j58JxK87a
         jDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492980; x=1761097780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvW/p3WSXzasdlPz6egbM6LxJzT8873EOQRHO7ajI9A=;
        b=NErh1U8iTftzD1OcovvTivWdEpIMZIe5Jy3gYmtYrfe3efv6Ot/D5Xzn5Cc+hAHTcq
         OxUbZTEZl2uCkgWb6PFaDmaKHwRxE7blBEvuXOXKNo8Hx4T5+BtnyTTlXcCQfEPD4YZj
         sALFqci8LDiZLaotp9DcXXDQlJw0cXGlQK+uadTlTg848lmYFFAK9VYaOiUktfu4dgF+
         nlOZtnbtleTdePnnwHgc+qYhtgxsltDiUImrcSqG4laNeDgkgdhdg5VUYvkYDMIhWbsq
         752TLYNBG1FikOd+yyofWU/OO/vtPhALF4ay1xKVn9k8n9n2YfhjzjwhjSRuwV5UsG0M
         xLfA==
X-Gm-Message-State: AOJu0YxGAcNDiwjmY4Yjpv74vbMYsVBWU1nFXoR4uT4jkjpsmFYM1ZJ5
	kqc/CFrrK/6oBALkOnXevTr+Z6iCUL+0zxN15s6AH2JXjmeTyTMDI6fF
X-Gm-Gg: ASbGncth0AsWXbGM2Ii1AtB4s1oLua6fy4jQOx0y3OapmZ3es5c5w8d0lakhyUcHnKL
	7xDirBgWXASYKcWHVjaK4nTBiRsCJCuA4VYUwvXaoLY01+P4yKXmIroofxwgcKz3M1Z4j+hByGn
	XiTjNQHnqy/NBWwQ26Q6wcg2nipmtSWRHZIEfWUN5uU9QA6IIqPwM+/Me/1FEyIZY7bNQ6+39uo
	r2e9TzHmxmWLj5qQdzPGHfkUDcgZuPwtCwPIoFGEVseQxvh6QO6fHc2oGrargUSqCdrkSD0RgTW
	m48kirNXIwGjOwRHKZy0LkYUiLiqrLoXxsl1N2XTQUzHU4WKOXb5iJ2SyDDqb3PBoSnAwEX9icw
	3szsQoDkAaU6rGyOGbPwrOtZGJYaubWx0FVK9BsklD8e4Lw==
X-Google-Smtp-Source: AGHT+IE6FdUkEA8VTyiY9MvYbAWP2+DgymS+KgmaDfV2kGgi4ezIGErB/v+2S1L+/rIe6Nulg8MrVw==
X-Received: by 2002:a05:6000:1846:b0:425:825d:fae with SMTP id ffacd0b85a97d-4266e8e6e7amr18137392f8f.62.1760492980271;
        Tue, 14 Oct 2025 18:49:40 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm27368995f8f.10.2025.10.14.18.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:49:39 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v14 2/9] platform/x86: asus-armoury: move existing tunings to asus-armoury module
Date: Wed, 15 Oct 2025 03:47:29 +0200
Message-ID: <20251015014736.1402045-3-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015014736.1402045-1-benato.denis96@gmail.com>
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

The fw_attributes_class provides a much cleaner interface to all of the
attributes introduced to asus-wmi. This patch moves all of these extra
attributes over to fw_attributes_class, and shifts the bulk of these
definitions to a new kernel module to reduce the clutter of asus-wmi
with the intention of deprecating the asus-wmi attributes in future.

The work applies only to WMI methods which don't have a clearly defined
place within the sysfs and as a result ended up lumped together in
/sys/devices/platform/asus-nb-wmi/ with no standard API.

Where possible the fw attrs now implement defaults, min, max, scalar,
choices, etc. As en example dgpu_disable becomes:

/sys/class/firmware-attributes/asus-armoury/attributes/dgpu_disable/
├── current_value
├── display_name
├── possible_values
└── type

as do other attributes.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-asus.c                        |   1 +
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/asus-armoury.c           | 545 ++++++++++++++++++
 drivers/platform/x86/asus-armoury.h           | 164 ++++++
 drivers/platform/x86/asus-wmi.c               |   5 +-
 .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ++
 include/linux/platform_data/x86/asus-wmi.h    |  43 +-
 8 files changed, 777 insertions(+), 44 deletions(-)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h
 create mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a444d41e53b6..472bca54642b 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -27,6 +27,7 @@
 #include <linux/hid.h>
 #include <linux/module.h>
 #include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/platform_data/x86/asus-wmi-leds-ids.h>
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
 #include <linux/power_supply.h>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 46e62feeda3c..8b827680754c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -262,6 +262,18 @@ config ASUS_WIRELESS
 	  If you choose to compile this driver as a module the module will be
 	  called asus-wireless.
 
+config ASUS_ARMOURY
+	tristate "ASUS Armoury driver"
+	depends on ASUS_WMI
+	select FW_ATTR_CLASS
+	help
+	  Say Y here if you have a WMI aware Asus machine and would like to use the
+	  firmware_attributes API to control various settings typically exposed in
+	  the ASUS Armoury Crate application available on Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-armoury.
+
 config ASUS_WMI
 	tristate "ASUS WMI Driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index c7db2a88c11a..4b1220f9b194 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 # ASUS
 obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
 obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
+obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
 obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
 obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
new file mode 100644
index 000000000000..57ed9449ec5f
--- /dev/null
+++ b/drivers/platform/x86/asus-armoury.c
@@ -0,0 +1,545 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Asus Armoury (WMI) attributes driver.
+ *
+ * This driver uses the fw_attributes class to expose various WMI functions
+ * that are present in many gaming and some non-gaming ASUS laptops.
+ *
+ * These typically don't fit anywhere else in the sysfs such as under LED class,
+ * hwmon or others, and are set in Windows using the ASUS Armoury Crate tool.
+ *
+ * Copyright(C) 2024 Luke Jones <luke@ljones.dev>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/kmod.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/printk.h>
+#include <linux/types.h>
+
+#include "asus-armoury.h"
+#include "firmware_attributes_class.h"
+
+#define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
+
+#define ASUS_MINI_LED_MODE_MASK   0x03
+/* Standard modes for devices with only on/off */
+#define ASUS_MINI_LED_OFF         0x00
+#define ASUS_MINI_LED_ON          0x01
+/* Like "on" but the effect is more vibrant or brighter */
+#define ASUS_MINI_LED_STRONG_MODE 0x02
+/* New modes for devices with 3 mini-led mode types */
+#define ASUS_MINI_LED_2024_WEAK   0x00
+#define ASUS_MINI_LED_2024_STRONG 0x01
+#define ASUS_MINI_LED_2024_OFF    0x02
+
+static struct asus_armoury_priv {
+	struct device *fw_attr_dev;
+	struct kset *fw_attr_kset;
+
+	u32 mini_led_dev_id;
+	u32 gpu_mux_dev_id;
+} asus_armoury;
+
+struct fw_attrs_group {
+	bool pending_reboot;
+};
+
+static struct fw_attrs_group fw_attrs = {
+	.pending_reboot = false,
+};
+
+struct asus_attr_group {
+	const struct attribute_group *attr_group;
+	u32 wmi_devid;
+};
+
+static bool asus_wmi_is_present(u32 dev_id)
+{
+	u32 retval;
+	int status;
+
+	status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, &retval);
+	pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id, retval);
+
+	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
+}
+
+static void asus_set_reboot_and_signal_event(void)
+{
+	fw_attrs.pending_reboot = true;
+	kobject_uevent(&asus_armoury.fw_attr_dev->kobj, KOBJ_CHANGE);
+}
+
+static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", fw_attrs.pending_reboot);
+}
+
+static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
+
+static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
+{
+	return !strcmp(attr->attr.name, "gpu_mux_mode");
+}
+
+static int armoury_wmi_set_devstate(struct kobj_attribute *attr, u32 value, u32 wmi_dev)
+{
+	u32 result;
+	int err;
+
+	err = asus_wmi_set_devstate(wmi_dev, value, &result);
+	if (err) {
+		pr_err("Failed to set %s: %d\n", attr->attr.name, err);
+		return err;
+	}
+	/*
+	 * !1 is usually considered a fail by ASUS, but some WMI methods do use > 1
+	 * to return a status code or similar.
+	 */
+	if (result < 1) {
+		pr_err("Failed to set %s: (result): 0x%x\n", attr->attr.name, result);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * attr_uint_store() - Send an uint to wmi method, checks if within min/max exclusive.
+ * @kobj: Pointer to the driver object.
+ * @attr: Pointer to the attribute calling this function.
+ * @buf: The buffer to read from, this is parsed to `uint` type.
+ * @count: Required by sysfs attribute macros, pass in from the callee attr.
+ * @min: Minimum accepted value. Below this returns -EINVAL.
+ * @max: Maximum accepted value. Above this returns -EINVAL.
+ * @store_value: Pointer to where the parsed value should be stored.
+ * @wmi_dev: The WMI function ID to use.
+ *
+ * This function is intended to be generic so it can be called from any "_store"
+ * attribute which works only with integers. The integer to be sent to the WMI method
+ * is range checked and an error returned if out of range.
+ *
+ * If the value is valid and WMI is success, then the sysfs attribute is notified
+ * and if asus_bios_requires_reboot() is true then reboot attribute is also notified.
+ *
+ * Returns: Either count, or an error.
+ */
+static ssize_t attr_uint_store(struct kobject *kobj, struct kobj_attribute *attr, const char *buf,
+			      size_t count, u32 min, u32 max, u32 *store_value, u32 wmi_dev)
+{
+	u32 value;
+	int err;
+
+	err = kstrtouint(buf, 10, &value);
+	if (err)
+		return err;
+
+	if (value < min || value > max)
+		return -EINVAL;
+
+	err = armoury_wmi_set_devstate(attr, value, wmi_dev);
+	if (err)
+		return err;
+
+	if (store_value != NULL)
+		*store_value = value;
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	if (asus_bios_requires_reboot(attr))
+		asus_set_reboot_and_signal_event();
+
+	return count;
+}
+
+static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	return sysfs_emit(buf, "enumeration\n");
+}
+
+/* Mini-LED mode **************************************************************/
+static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
+						struct kobj_attribute *attr, char *buf)
+{
+	u32 value;
+	int err;
+
+	err = asus_wmi_get_devstate_dsts(asus_armoury.mini_led_dev_id, &value);
+	if (err)
+		return err;
+
+	value &= ASUS_MINI_LED_MODE_MASK;
+
+	/*
+	 * Remap the mode values to match previous generation mini-LED. The last gen
+	 * WMI 0 == off, while on this version WMI 2 == off (flipped).
+	 */
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
+		switch (value) {
+		case ASUS_MINI_LED_2024_WEAK:
+			value = ASUS_MINI_LED_ON;
+			break;
+		case ASUS_MINI_LED_2024_STRONG:
+			value = ASUS_MINI_LED_STRONG_MODE;
+			break;
+		case ASUS_MINI_LED_2024_OFF:
+			value = ASUS_MINI_LED_OFF;
+			break;
+		}
+	}
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
+						 struct kobj_attribute *attr,
+						const char *buf, size_t count)
+{
+	u32 mode;
+	int err;
+
+	err = kstrtou32(buf, 10, &mode);
+	if (err)
+		return err;
+
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE &&
+	    mode > ASUS_MINI_LED_ON)
+		return -EINVAL;
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2 &&
+	    mode > ASUS_MINI_LED_STRONG_MODE)
+		return -EINVAL;
+
+	/*
+	 * Remap the mode values so expected behaviour is the same as the last
+	 * generation of mini-LED with 0 == off, 1 == on.
+	 */
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
+		switch (mode) {
+		case ASUS_MINI_LED_OFF:
+			mode = ASUS_MINI_LED_2024_OFF;
+			break;
+		case ASUS_MINI_LED_ON:
+			mode = ASUS_MINI_LED_2024_WEAK;
+			break;
+		case ASUS_MINI_LED_STRONG_MODE:
+			mode = ASUS_MINI_LED_2024_STRONG;
+			break;
+		}
+	}
+
+	err = armoury_wmi_set_devstate(attr, mode, asus_armoury.mini_led_dev_id);
+	if (err)
+		return err;
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+}
+
+static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
+						  struct kobj_attribute *attr, char *buf)
+{
+	switch (asus_armoury.mini_led_dev_id) {
+	case ASUS_WMI_DEVID_MINI_LED_MODE:
+		return sysfs_emit(buf, "0;1\n");
+	case ASUS_WMI_DEVID_MINI_LED_MODE2:
+		return sysfs_emit(buf, "0;1;2\n");
+	default:
+		return -ENODEV;
+	}
+}
+
+ATTR_GROUP_ENUM_CUSTOM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
+
+static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
+						struct kobj_attribute *attr, const char *buf,
+						size_t count)
+{
+	int result, err;
+	u32 optimus;
+
+	err = kstrtou32(buf, 10, &optimus);
+	if (err)
+		return err;
+
+	if (optimus > 1)
+		return -EINVAL;
+
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
+		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_DGPU, &result);
+		if (err)
+			return err;
+		if (result && !optimus) {
+			pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %02X %02X\n",
+				result, optimus);
+			return -ENODEV;
+		}
+	}
+
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
+		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU, &result);
+		if (err)
+			return err;
+		if (result && !optimus) {
+			pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled\n");
+			return -EBUSY;
+		}
+	}
+
+	err = armoury_wmi_set_devstate(attr, optimus, asus_armoury.gpu_mux_dev_id);
+	if (err)
+		return err;
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+	asus_set_reboot_and_signal_event();
+
+	return count;
+}
+WMI_SHOW_INT(gpu_mux_mode_current_value, "%u\n", asus_armoury.gpu_mux_dev_id);
+ATTR_GROUP_BOOL_CUSTOM(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
+
+/*
+ * A user may be required to store the value twice, typical store first, then
+ * rescan PCI bus to activate power, then store a second time to save correctly.
+ */
+static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
+						struct kobj_attribute *attr, const char *buf,
+						size_t count)
+{
+	int result, err;
+	u32 disable;
+
+	err = kstrtou32(buf, 10, &disable);
+	if (err)
+		return err;
+
+	if (disable > 1)
+		return -EINVAL;
+
+	if (asus_armoury.gpu_mux_dev_id) {
+		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
+		if (err)
+			return err;
+		if (!result && disable) {
+			pr_warn("Can not disable dGPU when the MUX is in dGPU mode\n");
+			return -EBUSY;
+		}
+	}
+
+	err = armoury_wmi_set_devstate(attr, disable, ASUS_WMI_DEVID_DGPU);
+	if (err)
+		return err;
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+}
+WMI_SHOW_INT(dgpu_disable_current_value, "%d\n", ASUS_WMI_DEVID_DGPU);
+ATTR_GROUP_BOOL_CUSTOM(dgpu_disable, "dgpu_disable", "Disable the dGPU");
+
+/* The ACPI call to enable the eGPU also disables the internal dGPU */
+static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					       const char *buf, size_t count)
+{
+	int result, err;
+	u32 enable;
+
+	err = kstrtou32(buf, 10, &enable);
+	if (err)
+		return err;
+
+	if (enable > 1)
+		return -EINVAL;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU_CONNECTED, &result);
+	if (err) {
+		pr_warn("Failed to get eGPU connection status: %d\n", err);
+		return err;
+	}
+
+	if (asus_armoury.gpu_mux_dev_id) {
+		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
+		if (err) {
+			pr_warn("Failed to get GPU MUX status: %d\n", result);
+			return err;
+		}
+		if (!result && enable) {
+			pr_warn("Can not enable eGPU when the MUX is in dGPU mode\n");
+			return -ENODEV;
+		}
+	}
+
+	err = armoury_wmi_set_devstate(attr, enable, ASUS_WMI_DEVID_EGPU);
+	if (err)
+		return err;
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+}
+WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
+ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
+
+/* Simple attribute creation */
+ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
+		       "Show the current mode of charging");
+
+ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SOUND,
+		   "Set the boot POST sound");
+ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
+		   "Set MCU powersaving mode");
+ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
+		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
+		   "Show the eGPU connection status");
+
+/* If an attribute does not require any special case handling add it here */
+static const struct asus_attr_group armoury_attr_groups[] = {
+	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
+	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
+	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
+
+	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
+	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
+	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
+	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+};
+
+static int asus_fw_attr_add(void)
+{
+	int err, i;
+
+	asus_armoury.fw_attr_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
+						NULL, "%s", DRIVER_NAME);
+	if (IS_ERR(asus_armoury.fw_attr_dev)) {
+		err = PTR_ERR(asus_armoury.fw_attr_dev);
+		goto fail_class_get;
+	}
+
+	asus_armoury.fw_attr_kset = kset_create_and_add("attributes", NULL,
+						&asus_armoury.fw_attr_dev->kobj);
+	if (!asus_armoury.fw_attr_kset) {
+		err = -ENOMEM;
+		goto err_destroy_classdev;
+	}
+
+	err = sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
+	if (err) {
+		pr_err("Failed to create sysfs level attributes\n");
+		goto err_destroy_kset;
+	}
+
+	asus_armoury.mini_led_dev_id = 0;
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE))
+		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
+	else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2))
+		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
+
+	if (asus_armoury.mini_led_dev_id) {
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 &mini_led_mode_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for mini_led\n");
+			goto err_remove_file;
+		}
+	}
+
+	asus_armoury.gpu_mux_dev_id = 0;
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX))
+		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX;
+	else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO))
+		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX_VIVO;
+
+	if (asus_armoury.gpu_mux_dev_id) {
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 &gpu_mux_mode_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for gpu_mux\n");
+			goto err_remove_mini_led_group;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
+		if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
+			continue;
+
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 armoury_attr_groups[i].attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for %s\n",
+			       armoury_attr_groups[i].attr_group->name);
+			goto err_remove_groups;
+		}
+	}
+
+	return 0;
+
+err_remove_groups:
+	while (i--) {
+		if (asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
+			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
+					   armoury_attr_groups[i].attr_group);
+	}
+	if (asus_armoury.gpu_mux_dev_id)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
+err_remove_mini_led_group:
+	if (asus_armoury.mini_led_dev_id)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
+err_remove_file:
+	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
+err_destroy_kset:
+	kset_unregister(asus_armoury.fw_attr_kset);
+err_destroy_classdev:
+fail_class_get:
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	return err;
+}
+
+/* Init / exit ****************************************************************/
+
+static int __init asus_fw_init(void)
+{
+	char *wmi_uid;
+
+	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
+	if (!wmi_uid)
+		return -ENODEV;
+
+	/*
+	 * if equal to "ASUSWMI" then it's DCTS that can't be used for this
+	 * driver, DSTS is required.
+	 */
+	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
+		return -ENODEV;
+
+	return asus_fw_attr_add();
+}
+
+static void __exit asus_fw_exit(void)
+{
+	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
+	kset_unregister(asus_armoury.fw_attr_kset);
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+}
+
+module_init(asus_fw_init);
+module_exit(asus_fw_exit);
+
+MODULE_IMPORT_NS("ASUS_WMI");
+MODULE_AUTHOR("Luke Jones <luke@ljones.dev>");
+MODULE_DESCRIPTION("ASUS BIOS Configuration Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("wmi:" ASUS_NB_WMI_EVENT_GUID);
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
new file mode 100644
index 000000000000..61675e7b5a60
--- /dev/null
+++ b/drivers/platform/x86/asus-armoury.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Definitions for kernel modules using asus-armoury driver
+ *
+ *  Copyright (c) 2024 Luke Jones <luke@ljones.dev>
+ */
+
+#ifndef _ASUS_ARMOURY_H_
+#define _ASUS_ARMOURY_H_
+
+#include <linux/types.h>
+#include <linux/platform_device.h>
+
+#define DRIVER_NAME "asus-armoury"
+
+#define __ASUS_ATTR_RO(_func, _name)					\
+	{								\
+		.attr = { .name = __stringify(_name), .mode = 0444 },	\
+		.show = _func##_##_name##_show,				\
+	}
+
+#define __ASUS_ATTR_RO_AS(_name, _show)					\
+	{								\
+		.attr = { .name = __stringify(_name), .mode = 0444 },	\
+		.show = _show,						\
+	}
+
+#define __ASUS_ATTR_RW(_func, _name) \
+	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
+
+#define __WMI_STORE_INT(_attr, _min, _max, _wmi)			\
+	static ssize_t _attr##_store(struct kobject *kobj,		\
+				     struct kobj_attribute *attr,	\
+				     const char *buf, size_t count)	\
+	{								\
+		return attr_uint_store(kobj, attr, buf, count, _min,	\
+					_max, NULL, _wmi);		\
+	}
+
+#define WMI_SHOW_INT(_attr, _fmt, _wmi)						\
+	static ssize_t _attr##_show(struct kobject *kobj,			\
+				    struct kobj_attribute *attr, char *buf)	\
+	{									\
+		u32 result;							\
+		int err;							\
+										\
+		err = asus_wmi_get_devstate_dsts(_wmi, &result);		\
+		if (err)							\
+			return err;						\
+		return sysfs_emit(buf, _fmt,					\
+				  result & ~ASUS_WMI_DSTS_PRESENCE_BIT);	\
+	}
+
+/* Create functions and attributes for use in other macros or on their own */
+
+/* Shows a formatted static variable */
+#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)				\
+	static ssize_t _attrname##_##_prop##_show(				\
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf)	\
+	{									\
+		return sysfs_emit(buf, _fmt, _val);				\
+	}									\
+	static struct kobj_attribute attr_##_attrname##_##_prop =		\
+		__ASUS_ATTR_RO(_attrname, _prop)
+
+#define __ATTR_RO_INT_GROUP_ENUM(_attrname, _wmi, _fsname, _possible, _dispname)\
+	WMI_SHOW_INT(_attrname##_current_value, "%d\n", _wmi);			\
+	static struct kobj_attribute attr_##_attrname##_current_value =		\
+		__ASUS_ATTR_RO(_attrname, current_value);			\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);		\
+	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible);		\
+	static struct kobj_attribute attr_##_attrname##_type =			\
+		__ASUS_ATTR_RO_AS(type, enum_type_show);			\
+	static struct attribute *_attrname##_attrs[] = {			\
+		&attr_##_attrname##_current_value.attr,				\
+		&attr_##_attrname##_display_name.attr,				\
+		&attr_##_attrname##_possible_values.attr,			\
+		&attr_##_attrname##_type.attr,					\
+		NULL								\
+	};									\
+	static const struct attribute_group _attrname##_attr_group = {		\
+		.name = _fsname, .attrs = _attrname##_attrs			\
+	}
+
+#define __ATTR_RW_INT_GROUP_ENUM(_attrname, _minv, _maxv, _wmi, _fsname,\
+				 _possible, _dispname)			\
+	__WMI_STORE_INT(_attrname##_current_value, _minv, _maxv, _wmi);	\
+	WMI_SHOW_INT(_attrname##_current_value, "%d\n", _wmi);		\
+	static struct kobj_attribute attr_##_attrname##_current_value =	\
+		__ASUS_ATTR_RW(_attrname, current_value);		\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
+	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible);	\
+	static struct kobj_attribute attr_##_attrname##_type =		\
+		__ASUS_ATTR_RO_AS(type, enum_type_show);		\
+	static struct attribute *_attrname##_attrs[] = {		\
+		&attr_##_attrname##_current_value.attr,			\
+		&attr_##_attrname##_display_name.attr,			\
+		&attr_##_attrname##_possible_values.attr,		\
+		&attr_##_attrname##_type.attr,				\
+		NULL							\
+	};								\
+	static const struct attribute_group _attrname##_attr_group = {	\
+		.name = _fsname, .attrs = _attrname##_attrs		\
+	}
+
+/* Boolean style enumeration, base macro. Requires adding show/store */
+#define __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)	\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
+	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible);	\
+	static struct kobj_attribute attr_##_attrname##_type =		\
+		__ASUS_ATTR_RO_AS(type, enum_type_show);		\
+	static struct attribute *_attrname##_attrs[] = {		\
+		&attr_##_attrname##_current_value.attr,			\
+		&attr_##_attrname##_display_name.attr,			\
+		&attr_##_attrname##_possible_values.attr,		\
+		&attr_##_attrname##_type.attr,				\
+		NULL							\
+	};								\
+	static const struct attribute_group _attrname##_attr_group = {	\
+		.name = _fsname, .attrs = _attrname##_attrs		\
+	}
+
+#define ATTR_GROUP_BOOL_RO(_attrname, _fsname, _wmi, _dispname)	\
+	__ATTR_RO_INT_GROUP_ENUM(_attrname, _wmi, _fsname, "0;1", _dispname)
+
+
+#define ATTR_GROUP_BOOL_RW(_attrname, _fsname, _wmi, _dispname)	\
+	__ATTR_RW_INT_GROUP_ENUM(_attrname, 0, 1, _wmi, _fsname, "0;1", _dispname)
+
+#define ATTR_GROUP_ENUM_INT_RO(_attrname, _fsname, _wmi, _possible, _dispname)	\
+	__ATTR_RO_INT_GROUP_ENUM(_attrname, _wmi, _fsname, _possible, _dispname)
+
+/*
+ * Requires <name>_current_value_show(), <name>_current_value_show()
+ */
+#define ATTR_GROUP_BOOL_CUSTOM(_attrname, _fsname, _dispname)		\
+	static struct kobj_attribute attr_##_attrname##_current_value =	\
+		__ASUS_ATTR_RW(_attrname, current_value);		\
+	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
+
+/*
+ * Requires <name>_current_value_show(), <name>_current_value_show()
+ * and <name>_possible_values_show()
+ */
+#define ATTR_GROUP_ENUM_CUSTOM(_attrname, _fsname, _dispname)			\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);		\
+	static struct kobj_attribute attr_##_attrname##_current_value =		\
+		__ASUS_ATTR_RW(_attrname, current_value);			\
+	static struct kobj_attribute attr_##_attrname##_possible_values =	\
+		__ASUS_ATTR_RO(_attrname, possible_values);			\
+	static struct kobj_attribute attr_##_attrname##_type =			\
+		__ASUS_ATTR_RO_AS(type, enum_type_show);			\
+	static struct attribute *_attrname##_attrs[] = {			\
+		&attr_##_attrname##_current_value.attr,				\
+		&attr_##_attrname##_display_name.attr,				\
+		&attr_##_attrname##_possible_values.attr,			\
+		&attr_##_attrname##_type.attr,					\
+		NULL								\
+	};									\
+	static const struct attribute_group _attrname##_attr_group = {		\
+		.name = _fsname, .attrs = _attrname##_attrs			\
+	}
+
+#endif /* _ASUS_ARMOURY_H_ */
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ab5306e05a..0d0c84a37ad8 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -30,6 +30,7 @@
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
 #include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/platform_data/x86/asus-wmi-leds-ids.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -55,8 +56,6 @@ module_param(fnlock_default, bool, 0444);
 #define to_asus_wmi_driver(pdrv)					\
 	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
 
-#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
-
 #define NOTIFY_BRNUP_MIN		0x11
 #define NOTIFY_BRNUP_MAX		0x1f
 #define NOTIFY_BRNDOWN_MIN		0x20
@@ -105,8 +104,6 @@ module_param(fnlock_default, bool, 0444);
 #define USB_INTEL_XUSB2PR		0xD0
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
 
-#define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
-
 #define WMI_EVENT_MASK			0xFFFF
 
 #define FAN_CURVE_POINTS		8
diff --git a/include/linux/platform_data/x86/asus-wmi-leds-ids.h b/include/linux/platform_data/x86/asus-wmi-leds-ids.h
new file mode 100644
index 000000000000..281b98ba0ca7
--- /dev/null
+++ b/include/linux/platform_data/x86/asus-wmi-leds-ids.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
+#define __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
+
+#include <linux/types.h>
+#include <linux/dmi.h>
+
+/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
+#if IS_REACHABLE(CONFIG_ASUS_WMI) || IS_REACHABLE(CONFIG_HID_ASUS)
+static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
+		},
+	},
+	{ },
+};
+#endif
+
+#endif	/* __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H */
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index dbd44d9fbb6f..71c68425b3b9 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -6,6 +6,9 @@
 #include <linux/types.h>
 #include <linux/dmi.h>
 
+#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
+#define ASUS_ACPI_UID_ASUSWMI	"ASUSWMI"
+
 /* WMI Methods */
 #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
 #define ASUS_WMI_METHODID_SFBD		0x44424653 /* Set First Boot Device */
@@ -191,44 +194,4 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 }
 #endif
 
-/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
-static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
-		},
-	},
-	{ },
-};
-
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.51.0



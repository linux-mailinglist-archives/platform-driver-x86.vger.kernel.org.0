Return-Path: <platform-driver-x86+bounces-9738-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC37A44F7B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Feb 2025 23:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8CE33B54A4
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Feb 2025 22:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0145121480D;
	Tue, 25 Feb 2025 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls45Ht4M"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AC421420D;
	Tue, 25 Feb 2025 22:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520868; cv=none; b=l/c+xN4klo+R9pj6sehFvwktRsefgZ8uBRwtU+/VQZcndR8RqEjqlWHdeUYb3oocLk9f7W+tlQcxBTQCQwrKKwi+wwni7un0+XWxkVN10ot8oKbQW0PWPeaJtlEDViCck7W3lvb6iFK9YKhbr8SLMvSFYoOkl0Pytw2l6iZPPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520868; c=relaxed/simple;
	bh=tsIn0aucyxBof+SRqlAMePMDtOcsrMOwMvbJ9ArZUng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+0r6/7dcci8hQCLwbRiO0cKV13fa0nPc7asGOREZj/+ALkoClUqnsXEhfPR7hCkh3gXuC92xuuq7kneFKIqr/L4TwWSXkWGCi5kVDE1mvXMUm+2HMFSs5awqR3kAdYGRm16eB+dLVTMSqi74zelCb1w9UuWkF+9J7z99dMb8BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls45Ht4M; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22185cddbffso4204165ad.1;
        Tue, 25 Feb 2025 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740520866; x=1741125666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TXKd6UkN3Hg8KFSyjnRrCcr9fJdV1PGOq0/4yh+RTo=;
        b=ls45Ht4MCdiDYYmQibDfQ7BzOlTRPXVefnIWo9fssJ89P0raDu7dfTYl9oxC8LNPJE
         Fs8QrXJijQllfSrOwxOtKK/IVFizr5SNYEPgVbJRBkeNb2dsDC5Wbsd5MUtNrpTWca/4
         mb8Mb/+oPMl+0wjzHS0c1tua2CeO1zEFljJMZ8bw6lX1DeVaLcpCFUhW6YUzVAE841R6
         G7+kKp8sgb6+ta/0OtO+Z00W1V+lheJCl2h5TPe3YWxtb0BWVvZkto9CtrJmy24RNNkJ
         CYXu8Wf1twVMJRmwGy1tG2DdmTMif2PKh4zVBxIl32KWrla0IWup5yww7OfnhnhJUnCc
         vcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740520866; x=1741125666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TXKd6UkN3Hg8KFSyjnRrCcr9fJdV1PGOq0/4yh+RTo=;
        b=Vwf8UG0vblYESHACDeSolH2IRT4O2fr11ZTo/yy/LldQ3h8sVr0XuBiiMDeoK4HfoY
         xCrjdoosK52tncGVdTH4l6Qt3P16Sfoj2RaohCd9VE8SxnXSrsTTfyShzmhDycQq1La2
         P0rEdUrxviR7eYKmvB8BIFHPiT+gNioOvtwJ0tcMIVJxOefCQWvmoabkDULRgA8eM0Ro
         V91lhM1Kdw5JwhRfci8Hm7ryFXo7LrZN45IxdD/nIuPcwOhls1HQRrG1XYKfzGBHf3Tm
         Qm1Ynzhnb/3fBZEMrobfvKhKhMVHUs3Kc21i3adgEweTV4iQIlHwpZbipquCqBU+DDZH
         9MGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtlfoyu0ygk7zt0T7K/iE1xTgEZDG6NzEG8oQIDvrv21K6KV72dQ7KHiYzArv6LGjmuc56CBQ9GuWT8N87@vger.kernel.org, AJvYcCWJzhLj9osiaSk6iTyoJaCQ6fpKWKwxn8thM+GnznYueRNcPfjSYHVQ5El3wYc79w5eR8WKukRmDtwwUtzDrQo3AbxLlA==@vger.kernel.org, AJvYcCWdBOazsONqcOPwz0X+eLChBXa4FfUX+Z2ux2Ao8yYD6LAplUaccYlIkBcIxm7w2/P0v45LqcXTv1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YymPWcyWc5wPHGe/B0VvwFyMC3t7zZsSk95gA5zMEPbjXpNdGZz
	Bwjt24rEwpwIjcGuFyY0aWX6Fhe1gsbBcyThEJo+ILx2HkUUXzA7
X-Gm-Gg: ASbGnctA1aQUuy0mwH0MiBGAzwfiXbSt9USGRN3OecWC4klFxuedF13m0q/Rzb8x/wu
	/jhUo1psgDXXdn8ULvVnh9Wm6IenKww9P0JAjU9hkCzZjRFg9kdSWvf5OHZAQlWVp20zYjgL/Du
	hDxcfLXnLT2bL8XJ3SHV9cn8PEi3I6WTo2id873zCbBygnQlghwh74XluTyqt/wquruAeAlEh13
	Jmrd2d7tg2hGAxkFG4bQNGouigSy6IDIePrCmG/TztT6GW1YBsCVRytI9MF+QhaQTIoDd+/THpc
	EWKTeTNt3cwwU8ECMpryJxY5q2Ey+TEmEAgyiVb1FDKdJqVLtY7P7wAWVZayr3GhI93WYMPy303
	dsa6yuU20t7mzdBZxgXWcSK+q
X-Google-Smtp-Source: AGHT+IG1RrKlRDfngAvylxvoMEi15LzJW7Nx6bQ22Pmj48nHvZtGseZxIh9WwH3aIxMYP9z6kurjlA==
X-Received: by 2002:a05:6a00:3a1e:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-734140898f3mr46112860b3a.4.1740520865748;
        Tue, 25 Feb 2025 14:01:05 -0800 (PST)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6f912fsm2114122b3a.61.2025.02.25.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:01:05 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
Date: Tue, 25 Feb 2025 13:59:55 -0800
Message-ID: <20250225220037.16073-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225220037.16073-1-derekjohn.clark@gmail.com>
References: <20250225220037.16073-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lenovo-wmi-other.c which provides a driver for the Lenovo
"Other Mode" WMI interface that comes on some Lenovo "Gaming
Series" hardware. Provides a firmware-attributes class which
enables the use of tunable knobs for SPL, SPPT, and FPPT.

v3:
- Add notifier block and store result for getting the Gamezone interface
  profile changes.
- Add driver as master component of capdata01 driver.
- Use FIELD_PREP where appropriate.
- Move macros and associated functions out of lemovo-wmi.h that are only
  used by this driver.
v2:
- Use devm_kmalloc to ensure driver can be instanced, remove global
  reference.
- Ensure reverse Christmas tree for all variable declarations.
- Remove extra whitespace.
- Use guard(mutex) in all mutex instances, global mutex.
- Use pr_fmt instead of adding the driver name to each pr_err.
- Remove noisy pr_info usage.
- Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
- Use list to get the lenovo_wmi_om_priv instance in some macro
  called functions as the data provided by the macros that use it
  doesn't pass a member of the struct for use in container_of.
- Do not rely on GameZone interface to grab the current fan mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 MAINTAINERS                             |   1 +
 drivers/platform/x86/Kconfig            |  14 +
 drivers/platform/x86/Makefile           |   1 +
 drivers/platform/x86/lenovo-wmi-other.c | 549 ++++++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi.h       |  13 +
 5 files changed, 578 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f6d3e79e50ce..f6e16b2346a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13159,6 +13159,7 @@ F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/x86/lenovo-wmi-capdata01.c
 F:	drivers/platform/x86/lenovo-wmi-gamezone.c
+F:	drivers/platform/x86/lenovo-wmi-other.c
 F:	drivers/platform/x86/lenovo-wmi.c
 F:	drivers/platform/x86/lenovo-wmi.h
 
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 56336dc3c2d0..017ecdfad8ce 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -480,6 +480,20 @@ config LENOVO_WMI_DATA01
 	depends on ACPI_WMI
 	select LENOVO_WMI
 
+config LENOVO_WMI_TUNING
+	tristate "Lenovo Other Mode WMI Driver"
+	depends on ACPI_WMI
+	select FW_ATTR_CLASS
+	select LENOVO_WMI
+	select LENOVO_WMI_DATA01
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  firmware_attributes API to control various tunable settings typically exposed by
+	  Lenovo software in Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-other.
+
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index be9031bea090..28ce39631a6d 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_LENOVO_WMI)	+= lenovo-wmi.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
 obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
 obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
+obj-$(CONFIG_LENOVO_WMI_TUNING)	+= lenovo-wmi-other.o
 
 # Intel
 obj-y				+= intel/
diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform/x86/lenovo-wmi-other.c
new file mode 100644
index 000000000000..cd04ead94ba3
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-other.c
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Other Mode WMI interface driver. This driver uses the fw_attributes
+ * class to expose the various WMI functions provided by the "Other Mode" WMI
+ * interface. This enables CPU and GPU power limit as well as various other
+ * attributes for devices that fall under the "Gaming Series" of Lenovo laptop
+ * devices. Each attribute exposed by the "Other Mode"" interface has a
+ * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the driver to
+ * probe details about the attribute such as set/get support, step, min, max,
+ * and default value. Each attibute has multiple pages, one for each of the
+ * fan profiles managed by the Gamezone interface.
+ *
+ * These attributes typically don't fit anywhere else in the sysfs and are set
+ * in Windows using one of Lenovo's multiple user applications.
+ *
+ * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/kobject.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+#include "lenovo-wmi.h"
+#include "firmware_attributes_class.h"
+
+/* Interface GUIDs */
+#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
+
+/* Device IDs */
+#define WMI_DEVICE_ID_CPU 0x01
+
+/* WMI_DEVICE_ID_CPU feature IDs */
+#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
+#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
+#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
+
+/* Type IDs*/
+#define WMI_TYPE_ID_NONE 0x00
+
+/* Method IDs */
+#define WMI_FAN_TABLE_GET 5 /* Other Mode FAN_METHOD Getter */
+#define WMI_FAN_TABLE_SET 6 /* Other Mode FAN_METHOD Setter */
+#define WMI_FEATURE_VALUE_GET 17 /* Other Mode Getter */
+#define WMI_FEATURE_VALUE_SET 18 /* Other Mode Setter */
+
+/* Attribute ID bitmasks */
+#define ATTR_DEV_ID_MASK GENMASK(31, 24)
+#define ATTR_FEAT_ID_MASK GENMASK(23, 16)
+#define ATTR_MODE_ID_MASK GENMASK(15, 8)
+#define ATTR_TYPE_ID_MASK GENMASK(7, 0)
+
+enum attribute_property {
+	DEFAULT_VAL,
+	MAX_VAL,
+	MIN_VAL,
+	STEP_VAL,
+	SUPPORTED,
+};
+
+/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
+struct tunable_attr_01 {
+	u32 type_id;
+	u32 device_id;
+	u32 feature_id;
+	u32 store_value;
+	struct device *dev;
+	struct capdata01 *capdata;
+};
+
+/* Tunable Attributes */
+struct tunable_attr_01 ppt_pl1_spl = { .device_id = WMI_DEVICE_ID_CPU,
+				       .feature_id = WMI_FEATURE_ID_CPU_SPL,
+				       .type_id = WMI_TYPE_ID_NONE };
+struct tunable_attr_01 ppt_pl2_sppt = { .device_id = WMI_DEVICE_ID_CPU,
+					.feature_id = WMI_FEATURE_ID_CPU_SPPT,
+					.type_id = WMI_TYPE_ID_NONE };
+struct tunable_attr_01 ppt_pl3_fppt = { .device_id = WMI_DEVICE_ID_CPU,
+					.feature_id = WMI_FEATURE_ID_CPU_FPPT,
+					.type_id = WMI_TYPE_ID_NONE };
+
+struct capdata01_attr_group {
+	const struct attribute_group *attr_group;
+	struct tunable_attr_01 *tunable_attr;
+};
+
+#define FW_ATTR_FOLDER "lenovo-wmi-other"
+
+/**
+ * int_type_show() - Emit the data type for an integer attribute
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ *
+ * Returns: Number of characters written to buf.
+ */
+static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			     char *buf)
+{
+	return sysfs_emit(buf, "integer\n");
+}
+
+/**                                      .
+ * attr_capdata01_get - Get the data of the specified attribute
+ * from lenovo_wmi_om->cd01.
+ * @tunable_attr: The attribute to be populated.
+ *
+ * Returns: Either 0 or an error.
+ */
+static struct capdata01 *
+attr_capdata01_get_data(struct lenovo_wmi_om *om,
+			struct tunable_attr_01 *tunable_attr,
+			enum thermal_mode mode)
+{
+	u32 attribute_id =
+		FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
+		FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	int idx;
+
+	if (!om->cd01)
+		return NULL;
+
+	for (idx = 0; idx < om->cd01->instance_count; idx++) {
+		if (om->cd01->capdata[idx]->id != attribute_id)
+			continue;
+		return om->cd01->capdata[idx];
+	}
+
+	return NULL;
+}
+
+/**
+ * attr_capdata01_show() - Get the value of the specified attribute property
+ * from LENOVO_CAPABILITY_DATA_01.
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ * @tunable_attr: The attribute to be read.
+ * @prop: The property of this attribute to be read.
+ *
+ * This function is intended to be generic so it can be called from any "_show"
+ * attribute which works only with integers.
+ *
+ * If the WMI is success, then the sysfs attribute is notified.
+ *
+ * Returns: Either number of characters written to buf, or an error.
+ */
+static ssize_t attr_capdata01_show(struct kobject *kobj,
+				   struct kobj_attribute *kattr, char *buf,
+				   struct tunable_attr_01 *tunable_attr,
+				   enum attribute_property prop)
+{
+	struct lenovo_wmi_om *om = dev_get_drvdata(tunable_attr->dev);
+	struct capdata01 *capdata;
+	int value;
+
+	if (!om)
+		return -ENODEV;
+
+	capdata = attr_capdata01_get_data(om, tunable_attr,
+					  SMARTFAN_MODE_CUSTOM);
+
+	if (!capdata)
+		return -ENODEV;
+
+	switch (prop) {
+	case DEFAULT_VAL:
+		value = capdata->default_value;
+		break;
+	case MAX_VAL:
+		value = capdata->max_value;
+		break;
+	case MIN_VAL:
+		value = capdata->min_value;
+		break;
+	case STEP_VAL:
+		value = capdata->step;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return sysfs_emit(buf, "%d\n", value);
+}
+
+/* Simple attribute creation */
+
+/*
+ * att_current_value_store() - Set the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to read from, this is parsed to `int` type.
+ * @count: Required by sysfs attribute macros, pass in from the callee attr.
+ * @tunable_attr: The attribute to be stored.
+ *
+ * This function is intended to be generic so it can be called from any
+ * attribute's "current_value_store" which works only with integers. The
+ * integer to be sent to the WMI method is range checked and an error returned
+ * if out of range.
+ *
+ * If the value is valid and WMI is success, then the sysfs attribute is
+ * notified.
+ *
+ * Returns: Either count, or an error.
+ */
+static ssize_t attr_current_value_store(struct kobject *kobj,
+					struct kobj_attribute *kattr,
+					const char *buf, size_t count,
+					struct tunable_attr_01 *tunable_attr)
+{
+	struct lenovo_wmi_om *om = dev_get_drvdata(tunable_attr->dev);
+	struct capdata01 *capdata;
+	u32 attribute_id;
+	u32 value;
+	int err;
+
+	if (!om)
+		return -ENODEV;
+
+	capdata = attr_capdata01_get_data(om, tunable_attr,
+					  SMARTFAN_MODE_CUSTOM);
+
+	if (!capdata)
+		return -ENODEV;
+
+	attribute_id = FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		       FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		       FIELD_PREP(ATTR_MODE_ID_MASK, SMARTFAN_MODE_CUSTOM) |
+		       FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+	err = kstrtouint(buf, 10, &value);
+	if (err)
+		return err;
+
+	if (value < capdata->min_value || value > capdata->max_value)
+		return -EINVAL;
+
+	err = lenovo_wmidev_evaluate_method_2(om->wdev, 0x0,
+					      WMI_FEATURE_VALUE_SET,
+					      attribute_id, value, NULL);
+
+	if (err)
+		return err;
+
+	tunable_attr->store_value = value;
+	return count;
+};
+
+/*
+ * attr_current_value_show() - Get the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ * @tunable_attr: The attribute to be read.
+ *
+ * This function is intended to be generic so it can be called from any "_show"
+ * attribute which works only with integers.
+ *
+ * If the WMI is success, then the sysfs attribute is notified.
+ *
+ * Returns: Either number of characters written to buf, or an error.
+ */
+static ssize_t attr_current_value_show(struct kobject *kobj,
+				       struct kobj_attribute *kattr, char *buf,
+				       struct tunable_attr_01 *tunable_attr)
+{
+	struct lenovo_wmi_om *om = dev_get_drvdata(tunable_attr->dev);
+	u32 attribute_id;
+	int retval;
+	int err;
+
+	if (!om)
+		return -ENODEV;
+
+	attribute_id = FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		       FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		       FIELD_PREP(ATTR_MODE_ID_MASK, om->mode) |
+		       FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+	err = lenovo_wmidev_evaluate_method_1(om->wdev, 0x0, WMI_FEATURE_VALUE_GET,
+					      attribute_id, &retval);
+
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", retval);
+}
+
+/* Attribute macros */
+#define __LL_ATTR_RO(_func, _name)                                    \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _func##_##_name##_show,                       \
+	}
+
+#define __LL_ATTR_RO_AS(_name, _show)                                 \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _show,                                        \
+	}
+
+#define __LL_ATTR_RW(_func, _name) \
+	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
+
+/* Shows a formatted static variable */
+#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                          \
+	static ssize_t _attrname##_##_prop##_show(                             \
+		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                      \
+		return sysfs_emit(buf, _fmt, _val);                            \
+	}                                                                      \
+	static struct kobj_attribute attr_##_attrname##_##_prop =              \
+		__LL_ATTR_RO(_attrname, _prop)
+
+/* Attribute current value read/write */
+#define __LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                            \
+	static ssize_t _attrname##_current_value_store(                        \
+		struct kobject *kobj, struct kobj_attribute *kattr,            \
+		const char *buf, size_t count)                                 \
+	{                                                                      \
+		return attr_current_value_store(kobj, kattr, buf, count,       \
+						&_attrname);                   \
+	}                                                                      \
+	static ssize_t _attrname##_current_value_show(                         \
+		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                      \
+		return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
+	}                                                                      \
+	static struct kobj_attribute attr_##_attrname##_current_value =        \
+		__LL_ATTR_RW(_attrname, current_value)
+
+/* Attribute property read only */
+#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)                    \
+	static ssize_t _attrname##_##_prop##_show(                             \
+		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
+	{                                                                      \
+		return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
+					   _prop_type);                        \
+	}                                                                      \
+	static struct kobj_attribute attr_##_attrname##_##_prop =              \
+		__LL_ATTR_RO(_attrname, _prop)
+
+#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)     \
+	__LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                   \
+	__LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  \
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   \
+	__LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          \
+	__LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          \
+	__LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  \
+	static struct kobj_attribute attr_##_attrname##_type =         \
+		__LL_ATTR_RO_AS(type, int_type_show);                  \
+	static struct attribute *_attrname##_attrs[] = {               \
+		&attr_##_attrname##_current_value.attr,                \
+		&attr_##_attrname##_default_value.attr,                \
+		&attr_##_attrname##_display_name.attr,                 \
+		&attr_##_attrname##_max_value.attr,                    \
+		&attr_##_attrname##_min_value.attr,                    \
+		&attr_##_attrname##_scalar_increment.attr,             \
+		&attr_##_attrname##_type.attr,                         \
+		NULL,                                                  \
+	};                                                             \
+	static const struct attribute_group _attrname##_attr_group = { \
+		.name = _fsname, .attrs = _attrname##_attrs            \
+	}
+
+ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
+			    "Set the CPU sustained power limit");
+ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
+			    "Set the CPU slow package power tracking limit");
+ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
+			    "Set the CPU fast package power tracking limit");
+
+static struct capdata01_attr_group capdata01_attr_groups[] = {
+	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
+	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
+	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
+	{},
+};
+
+static int lenovo_wmi_om_fw_attr_add(struct lenovo_wmi_om *om)
+{
+	int err, i;
+
+	om->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
+					MKDEV(0, 0), NULL, "%s",
+					FW_ATTR_FOLDER);
+	if (IS_ERR(om->fw_attr_dev)) {
+		err = PTR_ERR(om->fw_attr_dev);
+		return err;
+	}
+
+	om->fw_attr_kset =
+		kset_create_and_add("attributes", NULL, &om->fw_attr_dev->kobj);
+	if (!om->fw_attr_kset) {
+		err = -ENOMEM;
+		goto err_destroy_classdev;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
+		err = sysfs_create_group(&om->fw_attr_kset->kobj,
+					 capdata01_attr_groups[i].attr_group);
+		if (err) {
+			pr_debug("Failed to create sysfs-group for %s: %d\n",
+				 capdata01_attr_groups[i].attr_group->name,
+				 err);
+			goto err_remove_groups;
+		}
+		capdata01_attr_groups[i].tunable_attr->dev = &om->wdev->dev;
+	}
+	return 0;
+
+err_remove_groups:
+	while (i-- > 0) {
+		sysfs_remove_group(&om->fw_attr_kset->kobj,
+				   capdata01_attr_groups[i].attr_group);
+	}
+	kset_unregister(om->fw_attr_kset);
+
+err_destroy_classdev:
+	device_unregister(om->fw_attr_dev);
+	return err;
+}
+
+static int lenovo_wmi_om_notifier(struct notifier_block *nb, unsigned long cmd,
+				  void *data)
+{
+	struct lenovo_wmi_om *om = container_of(nb, struct lenovo_wmi_om, nb);
+
+	if (!om)
+		NOTIFY_BAD;
+
+	if (cmd != THERMAL_MODE_EVENT)
+		NOTIFY_OK;
+
+	om->mode = *((enum thermal_mode *)data);
+
+	return NOTIFY_OK;
+}
+
+static int lenovo_wmi_om_master_bind(struct device *dev)
+{
+	struct lenovo_wmi_om *om = dev_get_drvdata(dev);
+
+	int ret;
+
+	ret = component_bind_all(dev, om);
+	if (ret)
+		return ret;
+
+	return lenovo_wmi_om_fw_attr_add(om);
+}
+
+static void lenovo_wmi_om_master_unbind(struct device *dev)
+{
+	component_unbind_all(dev, NULL);
+}
+
+static const struct component_master_ops lenovo_wmi_om_master_ops = {
+	.bind = lenovo_wmi_om_master_bind,
+	.unbind = lenovo_wmi_om_master_unbind,
+};
+
+static int lenovo_wmi_other_probe(struct wmi_device *wdev, const void *context)
+{
+	struct notifier_block lenovo_wmi_om_notifier_block = {
+		.notifier_call = lenovo_wmi_om_notifier,
+	};
+	struct component_match *master_match = NULL;
+	struct lenovo_wmi_om *om;
+	int ret;
+
+	om = devm_kzalloc(&wdev->dev, sizeof(*om), GFP_KERNEL);
+	if (!om) {
+		ret = -ENOMEM;
+		goto err_exit;
+	}
+
+	om->wdev = wdev;
+	om->nb = lenovo_wmi_om_notifier_block;
+	om->mode = SMARTFAN_MODE_CUSTOM; /* fallback */
+
+	dev_set_drvdata(&wdev->dev, om);
+
+	ret = devm_lenovo_wmi_gz_register_notifier(&wdev->dev, &om->nb);
+	if (ret) {
+		pr_err("Failed to register notifier_block\n");
+		goto err_exit;
+	}
+
+	component_match_add(&wdev->dev, &master_match, lenovo_wmi_cd01_match,
+			    NULL);
+	if (IS_ERR_OR_NULL(master_match)) {
+		ret = -ENOMEM;
+		goto err_exit;
+	}
+
+	ret = component_master_add_with_match(&wdev->dev,
+					      &lenovo_wmi_om_master_ops,
+					      master_match);
+	if (ret < 0) {
+		dev_err(&wdev->dev, "Master comp add failed %d\n", ret);
+		goto err_exit;
+	}
+
+	return 0;
+err_exit:
+	kfree(om);
+	return ret;
+}
+
+static void lenovo_wmi_other_remove(struct wmi_device *wdev)
+{
+	struct lenovo_wmi_om *om = dev_get_drvdata(&wdev->dev);
+
+	kset_unregister(om->fw_attr_kset);
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	component_master_del(&wdev->dev, &lenovo_wmi_om_master_ops);
+}
+
+static const struct wmi_device_id lenovo_wmi_other_id_table[] = {
+	{ LENOVO_OTHER_METHOD_GUID, NULL },
+	{}
+};
+
+static struct wmi_driver lenovo_wmi_other_driver = {
+	.driver = {
+		.name = "lenovo_wmi_other",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lenovo_wmi_other_id_table,
+	.probe = lenovo_wmi_other_probe,
+	.remove = lenovo_wmi_other_remove,
+	.no_singleton = true,
+};
+
+module_wmi_driver(lenovo_wmi_other_driver);
+
+MODULE_IMPORT_NS("CAPDATA_WMI");
+MODULE_IMPORT_NS("GZ_WMI");
+MODULE_IMPORT_NS("LENOVO_WMI");
+MODULE_DEVICE_TABLE(wmi, lenovo_wmi_other_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/lenovo-wmi.h
index 07fa67ed89d6..40b6418fbf02 100644
--- a/drivers/platform/x86/lenovo-wmi.h
+++ b/drivers/platform/x86/lenovo-wmi.h
@@ -61,6 +61,19 @@ struct capdata01 {
 	u32 max_value;
 };
 
+/* other method structs */
+struct lenovo_wmi_om {
+	struct component_master_ops *ops;
+	struct lenovo_wmi_cd01 *cd01;
+	struct capdata01 **capdata;
+	struct device *fw_attr_dev;
+	struct kset *fw_attr_kset;
+	struct notifier_block nb;
+	struct wmi_device *wdev;
+	enum thermal_mode mode;
+	int instance_count;
+};
+
 /* wmidev_evaluate_method helper functions */
 int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instance,
 				    u32 method_id, u32 arg0, u32 arg1,
-- 
2.48.1



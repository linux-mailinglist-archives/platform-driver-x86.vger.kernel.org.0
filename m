Return-Path: <platform-driver-x86+bounces-10307-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42BA6855E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 Mar 2025 08:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD5C177C1B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 Mar 2025 06:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E84624EF7D;
	Wed, 19 Mar 2025 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="iROrxbwL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HHUBQWux"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394624EF6A;
	Wed, 19 Mar 2025 06:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367533; cv=none; b=dx2rDCVORo+r3dNPtAUvqKTkK2WEKfq6a+nHo6meHYmbrL2CoW6yw/fHfkYd9bbxgd1QrPqEtANKqJU2g5ON5SqXs+2YM4ZZYCpl9fKLzsnuYpDBCZyiE2YYsI7UqUP8yMWl7NVbhKvxFwVoxqfAAebSgclphcj/IypDDHfQflg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367533; c=relaxed/simple;
	bh=TRo6ChXl93rTP17i38qKJx0W+0s3OzZ1UUL/KmrZuGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eDXRfVbXqPn/g1nEqazE7pmSwqJEp9La05nO7mOnIYPAJhpFXtPIkMxaaOzUC3GSNUBIIX/fiPCiXwH1yuyqs8wH/i2qR3pHuL7Ze3mcfhp9FoSk0Wnbj1x+45CR3LhVf6a8YAVJlF4DfXTV+GmEhiYTtDoiBV3fWe0K4ujsIHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=iROrxbwL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HHUBQWux; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B9B2C25401E0;
	Wed, 19 Mar 2025 02:58:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Wed, 19 Mar 2025 02:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742367528;
	 x=1742453928; bh=uL96Ype419GRbMkp9Sxv0yc+A2jedPdnmZcGJSbkOmo=; b=
	iROrxbwLTYNjJIOKILYZ5zLDlorN8PuW5/KjXKqPCm+p7TBhCgY6J1ALJRTkWl7D
	vc06SP1MRgvDGmaoWdwmdFcirsOH7W8zs7IJcuhyh3Khw4FMX8wjDLYPceG09+GD
	0k49PLGNlZrlkMjWmKNXz54sWNGaj6L7C5J53bTTAKL1utG2ARgIpHTNxI3txAwz
	MGKFLX+ikqyZDsm5cc6aGRxSQA5GcxIGM17VAMh+je/vJyDI428P8H7cb/2i+Wb7
	KNydAL0xhBDto66/K5Pqw//dzZuCvZW/RgfcCoVdMglq3rBmHPWK77BiRTOO1RKd
	OdCaFtNmFTieUdiTMEbcCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742367528; x=
	1742453928; bh=uL96Ype419GRbMkp9Sxv0yc+A2jedPdnmZcGJSbkOmo=; b=H
	HUBQWuxb8XHa6N5uPTz+hUKXRvno53fDtkBIZfwLURzcjZ1/8qSK6xnfWYFxkqPg
	PwtVi8dzJJIdOxRwjbnVehDZMPmx2hyGowwdy5hYHJDF3LYqWrQ0I8x0tF/FlzL4
	ByQOuzl6e5WvwMy0/s2uGNW+Y3VskqbsLV3MVuoiwWyt6XOIM0VTgO2Cay2nrNUz
	fzU4yNFvpim/s9DS7saE1hcbQ61h5eKAdiixD6eqIRUcZ5Ha/nRPSfe6LUJAjd39
	jf5iAhFQS+17e685DFLQoG3+M7WeIzs3xs6Wpw74UfgKMp2KpFUzCifwg5RxlwYG
	7YZOfmA+uLLbk6nA48tAQ==
X-ME-Sender: <xms:KGvaZ-TDQ5ZRJe8N-cm_CVCJJzBj9CtnIFzHRtavbz6sK7S-X02tRw>
    <xme:KGvaZzxc_3JXrppm09DkSrsrdr4UxUnAdoNAxf_giYlCXfWBJFGpe0eLxWz9-COsJ
    n77nM-UPhXg6M9yzVI>
X-ME-Received: <xmr:KGvaZ72FSGqzpzQtCVpcLsMeyN9iVLtFMCfVREth6sJU7h_FP9f-4g39J6ftGzaYIZ99ROsx0s-0HITLPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeegieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefnuhhkvgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeelfeevleeukedtgedvgeegfeetjedthfdthfefleej
    kefggfelffeliedtledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeei
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonh
    gtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehluhhkvgeslhhjohhnvghsrdgu
    vghv
X-ME-Proxy: <xmx:KGvaZ6ArKN7Dja0Ik4rmJ0Ruliriq4eQiLQUa1SyNdazrJuyB5Ustg>
    <xmx:KGvaZ3gXEOIUzacUolvJatXO0Bdrk3zIEXo4pZaGmftxTU-jugmnBg>
    <xmx:KGvaZ2pqdulAwnLdRAW8YWdqkLy17mJY20z13R2bHSVEo1rKisxBTg>
    <xmx:KGvaZ6gcXEM7ct8dwC3XQ-6Z4TEYb8y8OECyKBSutf98THVM9bQflg>
    <xmx:KGvaZ9bKua0nH0RX17bflOD2MsfrESFpxjGoxTGKdi0_Z3b4PA3bYtQb>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Mar 2025 02:58:44 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v8 2/8] platform/x86: asus-armoury: move existing tunings to asus-armoury module
Date: Wed, 19 Mar 2025 19:58:21 +1300
Message-ID: <20250319065827.53478-3-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319065827.53478-1-luke@ljones.dev>
References: <20250319065827.53478-1-luke@ljones.dev>
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

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/Kconfig               |  12 +
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/asus-armoury.c        | 539 +++++++++++++++++++++
 drivers/platform/x86/asus-armoury.h        | 165 +++++++
 drivers/platform/x86/asus-wmi.c            |   4 -
 include/linux/platform_data/x86/asus-wmi.h |   3 +
 6 files changed, 720 insertions(+), 4 deletions(-)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..294364cc7478 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -267,6 +267,18 @@ config ASUS_WIRELESS
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
index e1b142947067..fe3e7e7dede8 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 # ASUS
 obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
 obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
+obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
 obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
 obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
new file mode 100644
index 000000000000..12acd851e6b2
--- /dev/null
+++ b/drivers/platform/x86/asus-armoury.c
@@ -0,0 +1,539 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Asus Armoury (WMI) attributes driver. This driver uses the fw_attributes
+ * class to expose the various WMI functions that many gaming and some
+ * non-gaming ASUS laptops have available.
+ * These typically don't fit anywhere else in the sysfs such as under LED class,
+ * hwmon or other, and are set in Windows using the ASUS Armoury Crate tool.
+ *
+ * Copyright(C) 2024 Luke Jones <luke@ljones.dev>
+ */
+
+#include <linux/acpi.h>
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
+ * attr_int_store() - Send an int to wmi method, checks if within min/max exclusive.
+ * @kobj: Pointer to the driver object.
+ * @attr: Pointer to the attribute calling this function.
+ * @buf: The buffer to read from, this is parsed to `int` type.
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
+	}
+
+	return sysfs_emit(buf, "0\n");
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
+			return -ENODEV;
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
+WMI_SHOW_INT(gpu_mux_mode_current_value, "%d\n", asus_armoury.gpu_mux_dev_id);
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
+			return -ENODEV;
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
+			return result;
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
+	while (--i >= 0) {
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
index 000000000000..42c8171e5d8a
--- /dev/null
+++ b/drivers/platform/x86/asus-armoury.h
@@ -0,0 +1,165 @@
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
index 2784b8e6514e..e2ac3f20760a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -55,8 +55,6 @@ module_param(fnlock_default, bool, 0444);
 #define to_asus_wmi_driver(pdrv)					\
 	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
 
-#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
-
 #define NOTIFY_BRNUP_MIN		0x11
 #define NOTIFY_BRNUP_MAX		0x1f
 #define NOTIFY_BRNDOWN_MIN		0x20
@@ -105,8 +103,6 @@ module_param(fnlock_default, bool, 0444);
 #define USB_INTEL_XUSB2PR		0xD0
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
 
-#define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
-
 #define WMI_EVENT_MASK			0xFFFF
 
 #define FAN_CURVE_POINTS		8
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 96ff25b2b51b..4574e30c53fc 100644
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
-- 
2.49.0



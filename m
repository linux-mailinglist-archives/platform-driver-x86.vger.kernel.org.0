Return-Path: <platform-driver-x86+bounces-2082-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8715087CE56
	for <lists+platform-driver-x86@lfdr.de>; Fri, 15 Mar 2024 14:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E158282E1A
	for <lists+platform-driver-x86@lfdr.de>; Fri, 15 Mar 2024 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F5337711;
	Fri, 15 Mar 2024 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="I1pnnnD4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28E1BF28;
	Fri, 15 Mar 2024 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710510719; cv=none; b=XTLOWl+dTe/KKysJ2i7vzSzWnAp5v13dXj5b2TyW84H8IoQWMwhYFasv6wUrX17WSK1zl4urHPGGEPmcz/34lqJLl+dfUcL/OVH2bH+PC1jrHHEtqxz0r1Rxu37OAdYuUambRuLhzoTdfdICo5Cuq4DZmKpCimIiv8dpKLUvNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710510719; c=relaxed/simple;
	bh=cQdZcctlx5RnLL3SAODH+Mfrs1oboFH6pGD74qEDrKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dx5Hjz3JXXj9xJlwFqbAWlLriN5tM3bAxHZMOrhBRfNtFrbh5tfgX9y/of1C1TRB4oIp5TJBOXc2VyH1stFzgPEKSi9KiUvdg9AG/oe0K7bb/62dxEymbW0N5OBUVvQmFqUUrC3ln2pLpY5LYJF0uIE+meQ4w1E6BQk50m0jF2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=I1pnnnD4; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id BA84141EF4;
	Fri, 15 Mar 2024 18:51:37 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1710510698; bh=cQdZcctlx5RnLL3SAODH+Mfrs1oboFH6pGD74qEDrKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I1pnnnD4SSQtBBl8gv4dJSGBMyKMuvHfgZBG/FhwqjmhgPHEME08qRuju7TbG4h4p
	 HsCPxQ1s0K5HDX0yTQ7ZQ8s4q/WEzdai5uPQZ5Nv8RRf6bmHIkOUiGHOUeIaxwvGR6
	 qo91ugQ+ogowLQUf16gqGFmJiBdmwPLBeOcP5v9YoWbIlMQX0xemUFhwzPHFtuUfvU
	 3+U2OT70rs9SFrVJhwbxDooZk2Jm9A80k5KM3ZjitX0RMeyCCp+nhjo5DvO7mfd5AP
	 nw+pqhkXbbnG4laSUEoYWOFLPtCGxLNR5lUkL6W/HC1bzimGAV1FCGp9DfXqsyWdGe
	 LmxXENvOQRQiQ==
From: Nikita Travkin <nikita@trvn.ru>
Date: Fri, 15 Mar 2024 18:51:17 +0500
Subject: [PATCH v5 3/4] platform: arm64: Add Acer Aspire 1 embedded
 controller driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-aspire1-ec-v5-3-f93381deff39@trvn.ru>
References: <20240315-aspire1-ec-v5-0-f93381deff39@trvn.ru>
In-Reply-To: <20240315-aspire1-ec-v5-0-f93381deff39@trvn.ru>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=19218; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=cQdZcctlx5RnLL3SAODH+Mfrs1oboFH6pGD74qEDrKw=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBl9FJmsDzMcAxaO5t5vfAqStQFp7kXkz7QGeLGT
 YyJUn6wLSGJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZfRSZgAKCRBDHOzuKBm/
 dZWuD/4uHmEmMhDWY5DJIXWDiR81ww2pVMmoEhxAi27TwOH2UwxXa7S+bStCacQA5JApPzIW6VH
 XlZLDD1zpDVyMNY6FjqXl4GW0BVDhDBttZJGW5/JOZz9mYTS4VdDhjpHAJ8DT58S7wInAPjlpZC
 5FwbYOw/Uyy1m1VZvlDvacuaaf/dWCTbgFWC+EuVjjK6lx8x3+gyYW47o+vtVhe1tBinNzjUcgX
 ryosvfuBy2qfSQEFogdwzlGISjdnjOSTIfH+b7WpKUYeK4ElV88p9WMpaU+8qdtsDCcSBzCwlBe
 Xx090RQG/lv3BJg7sZrtMDgvuDhWjdBWryJlEBlhJ84bQoldTLTAFBrFGBsWqys3K7KewDkYrdq
 spyWVcko4ZgbJHX7y8QmiYijlDGmc2CF2VLcKJ7wwmspXVGyFenTWkB9JJw3FBfOvk4Xdql1wcW
 jXG1R4QdAV61HwJVmbR/BG/8PL1KIWaKMA3FsN9JOmvO6OT/YJgdq5dSMuvkQg5nTs+32s8CP05
 K7UaSzCoqnN+0u6dQNfvPmPTAfoW19bL6uDL7ox8Zz0+W7OhB6iGqHztD9CdGPU6WHM1GXf3c12
 +j7+b4hisyEEqkevVxkyqBE+B03MPklIU1QBJo2sXQ1KvhzbyXTLUsa4cIFV8sksoHwFgGrd/Oy
 RGFKig7az16R3vQ==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Acer Aspire 1 is a Snapdragon 7c based laptop. It uses an embedded
controller to perform a set of various functions, such as:

- Battery and charger monitoring;
- Keyboard layout control (i.e. fn_lock settings);
- USB Type-C DP alt mode HPD notifications;
- Laptop lid status.

Unfortunately, while all this functionality is implemented in ACPI, it's
currently not possible to use ACPI to boot Linux on such Qualcomm
devices. To allow Linux to still support the features provided by EC,
this driver reimplments the relevant ACPI parts. This allows us to boot
the laptop with Device Tree and retain all the features.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 MAINTAINERS                              |   6 +
 drivers/platform/arm64/Kconfig           |  16 +
 drivers/platform/arm64/Makefile          |   2 +
 drivers/platform/arm64/acer-aspire1-ec.c | 562 +++++++++++++++++++++++++++++++
 4 files changed, 586 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 186338451099..991303ee340c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -258,6 +258,12 @@ L:	linux-acenic@sunsite.dk
 S:	Maintained
 F:	drivers/net/ethernet/alteon/acenic*
 
+ACER ASPIRE 1 EMBEDDED CONTROLLER DRIVER
+M:	Nikita Travkin <nikita@trvn.ru>
+S:	Maintained
+F:	Documentation/devicetree/bindings/platform/acer,aspire1-ec.yaml
+F:	drivers/platform/arm64/acer-aspire1-ec.c
+
 ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
 M:	Peter Kaestle <peter@piie.net>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 644b83ede093..07d47879a9e3 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -16,4 +16,20 @@ menuconfig ARM64_PLATFORM_DEVICES
 
 if ARM64_PLATFORM_DEVICES
 
+config EC_ACER_ASPIRE1
+	tristate "Acer Aspire 1 Emedded Controller driver"
+	depends on I2C
+	depends on DRM
+	depends on POWER_SUPPLY
+	depends on INPUT
+	help
+	  Say Y here to enable the EC driver for the (Snapdragon-based)
+	  Acer Aspire 1 laptop. The EC handles battery and charging
+	  monitoring as well as some misc functions like the lid sensor
+	  and USB Type-C DP HPD events.
+
+	  This driver provides battery and AC status support for the mentioned
+	  laptop where this information is not properly exposed via the
+	  standard ACPI devices.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index f91cdc7155e2..4fcc9855579b 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -4,3 +4,5 @@
 #
 # This dir should only include drivers for EC-like devices.
 #
+
+obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/arm64/acer-aspire1-ec.c
new file mode 100644
index 000000000000..dbb1cce13965
--- /dev/null
+++ b/drivers/platform/arm64/acer-aspire1-ec.c
@@ -0,0 +1,562 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2024, Nikita Travkin <nikita@trvn.ru> */
+
+#include <asm-generic/unaligned.h>
+#include <drm/drm_bridge.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/workqueue_types.h>
+
+#define MILLI_TO_MICRO			1000
+
+#define ASPIRE_EC_EVENT			0x05
+
+#define ASPIRE_EC_EVENT_WATCHDOG	0x20
+#define ASPIRE_EC_EVENT_KBD_BKL_ON	0x57
+#define ASPIRE_EC_EVENT_KBD_BKL_OFF	0x58
+#define ASPIRE_EC_EVENT_LID_CLOSE	0x9b
+#define ASPIRE_EC_EVENT_LID_OPEN	0x9c
+#define ASPIRE_EC_EVENT_BKL_UNBLANKED	0x9d
+#define ASPIRE_EC_EVENT_BKL_BLANKED	0x9e
+#define ASPIRE_EC_EVENT_FG_INF_CHG	0x85
+#define ASPIRE_EC_EVENT_FG_STA_CHG	0xc6
+#define ASPIRE_EC_EVENT_HPD_DIS		0xa3
+#define ASPIRE_EC_EVENT_HPD_CON		0xa4
+
+#define ASPIRE_EC_FG_DYNAMIC		0x07
+#define ASPIRE_EC_FG_STATIC		0x08
+
+#define ASPIRE_EC_FG_FLAG_PRESENT	BIT(0)
+#define ASPIRE_EC_FG_FLAG_FULL		BIT(1)
+#define ASPIRE_EC_FG_FLAG_DISCHARGING	BIT(2)
+#define ASPIRE_EC_FG_FLAG_CHARGING	BIT(3)
+
+#define ASPIRE_EC_RAM_READ		0x20
+#define ASPIRE_EC_RAM_WRITE		0x21
+
+#define ASPIRE_EC_RAM_WATCHDOG		0x19
+#define ASPIRE_EC_WATCHDOG_BIT		BIT(6)
+
+#define ASPIRE_EC_RAM_KBD_MODE		0x43
+
+#define ASPIRE_EC_RAM_KBD_FN_EN		BIT(0)
+#define ASPIRE_EC_RAM_KBD_MEDIA_ON_TOP	BIT(5)
+#define ASPIRE_EC_RAM_KBD_ALWAYS_SET	BIT(6)
+#define ASPIRE_EC_RAM_KBD_NUM_LAYER_EN	BIT(7)
+
+#define ASPIRE_EC_RAM_KBD_MODE_2	0x60
+
+#define ASPIRE_EC_RAM_KBD_MEDIA_NOTIFY	BIT(3)
+
+#define ASPIRE_EC_RAM_HPD_STATUS	0xf4
+#define ASPIRE_EC_HPD_CONNECTED		0x03
+
+#define ASPIRE_EC_RAM_LID_STATUS	0x4c
+#define ASPIRE_EC_LID_OPEN		BIT(6)
+
+#define ASPIRE_EC_RAM_ADP		0x40
+#define ASPIRE_EC_AC_STATUS		BIT(0)
+
+struct aspire_ec {
+	struct i2c_client *client;
+	struct power_supply *bat_psy;
+	struct power_supply *adp_psy;
+	struct input_dev *idev;
+
+	bool bridge_configured;
+	struct drm_bridge bridge;
+	struct work_struct work;
+};
+
+static int aspire_ec_ram_read(struct i2c_client *client, u8 off, u8 *data, u8 data_len)
+{
+	i2c_smbus_write_byte_data(client, ASPIRE_EC_RAM_READ, off);
+	i2c_smbus_read_i2c_block_data(client, ASPIRE_EC_RAM_READ, data_len, data);
+	return 0;
+}
+
+static int aspire_ec_ram_write(struct i2c_client *client, u8 off, u8 data)
+{
+	u8 tmp[2] = {off, data};
+
+	i2c_smbus_write_i2c_block_data(client, ASPIRE_EC_RAM_WRITE, sizeof(tmp), tmp);
+	return 0;
+}
+
+static irqreturn_t aspire_ec_irq_handler(int irq, void *data)
+{
+	struct aspire_ec *ec = data;
+	int id;
+	u8 tmp;
+
+	/*
+	 * The original ACPI firmware actually has a small sleep in the handler.
+	 *
+	 * It seems like in most cases it's not needed but when the device
+	 * just exits suspend, our i2c driver has a brief time where data
+	 * transfer is not possible yet. So this delay allows us to suppress
+	 * quite a bunch of spurious error messages in dmesg. Thus it's kept.
+	 */
+	usleep_range(15000, 30000);
+
+	id = i2c_smbus_read_byte_data(ec->client, ASPIRE_EC_EVENT);
+	if (id < 0) {
+		dev_err(&ec->client->dev, "Failed to read event id: %pe\n", ERR_PTR(id));
+		return IRQ_HANDLED;
+	}
+
+	switch (id) {
+	case 0x0: /* No event */
+		break;
+
+	case ASPIRE_EC_EVENT_WATCHDOG:
+		/*
+		 * Here acpi responds to the event and clears some bit.
+		 * Notify (\_SB.I2C3.BAT1, 0x81) // Information Change
+		 * Notify (\_SB.I2C3.ADP1, 0x80) // Status Change
+		 */
+		aspire_ec_ram_read(ec->client, ASPIRE_EC_RAM_WATCHDOG, &tmp, sizeof(tmp));
+		tmp &= ~ASPIRE_EC_WATCHDOG_BIT;
+		aspire_ec_ram_write(ec->client, ASPIRE_EC_RAM_WATCHDOG, tmp);
+		break;
+
+	case ASPIRE_EC_EVENT_LID_CLOSE:
+		/* Notify (\_SB.LID0, 0x80) // Status Change */
+		input_report_switch(ec->idev, SW_LID, 1);
+		input_sync(ec->idev);
+		break;
+
+	case ASPIRE_EC_EVENT_LID_OPEN:
+		/* Notify (\_SB.LID0, 0x80) // Status Change */
+		input_report_switch(ec->idev, SW_LID, 0);
+		input_sync(ec->idev);
+		break;
+
+	case ASPIRE_EC_EVENT_FG_INF_CHG:
+		/* Notify (\_SB.I2C3.BAT1, 0x81) // Information Change */
+		fallthrough;
+	case ASPIRE_EC_EVENT_FG_STA_CHG:
+		/* Notify (\_SB.I2C3.BAT1, 0x80) // Status Change */
+		power_supply_changed(ec->bat_psy);
+		power_supply_changed(ec->adp_psy);
+		break;
+
+	case ASPIRE_EC_EVENT_HPD_DIS:
+		if (ec->bridge_configured)
+			drm_bridge_hpd_notify(&ec->bridge, connector_status_disconnected);
+		break;
+
+	case ASPIRE_EC_EVENT_HPD_CON:
+		if (ec->bridge_configured)
+			drm_bridge_hpd_notify(&ec->bridge, connector_status_connected);
+		break;
+
+	case ASPIRE_EC_EVENT_BKL_BLANKED:
+	case ASPIRE_EC_EVENT_BKL_UNBLANKED:
+		/* Display backlight blanked on FN+F6. No action needed. */
+		break;
+
+	case ASPIRE_EC_EVENT_KBD_BKL_ON:
+	case ASPIRE_EC_EVENT_KBD_BKL_OFF:
+		/*
+		 * There is a keyboard backlight connector on Aspire 1 that is
+		 * controlled by FN+F8. There is no kb backlight on the device though.
+		 * Seems like this is used on other devices like Acer Spin 7.
+		 * No action needed.
+		 */
+		break;
+
+	default:
+		dev_warn(&ec->client->dev, "Unknown event id=0x%x\n", id);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * Power supply.
+ */
+
+struct aspire_ec_bat_psy_static_data {
+	u8 unk1;
+	u8 flags;
+	__le16 unk2;
+	__le16 voltage_design;
+	__le16 capacity_full;
+	__le16 unk3;
+	__le16 serial;
+	u8 model_id;
+	u8 vendor_id;
+} __packed;
+
+static const char * const aspire_ec_bat_psy_battery_model[] = {
+	"AP18C4K",
+	"AP18C8K",
+	"AP19B8K",
+	"AP16M4J",
+	"AP16M5J",
+};
+
+static const char * const aspire_ec_bat_psy_battery_vendor[] = {
+	"SANYO",
+	"SONY",
+	"PANASONIC",
+	"SAMSUNG",
+	"SIMPLO",
+	"MOTOROLA",
+	"CELXPERT",
+	"LGC",
+	"GETAC",
+	"MURATA",
+};
+
+struct aspire_ec_bat_psy_dynamic_data {
+	u8 unk1;
+	u8 flags;
+	u8 unk2;
+	__le16 capacity_now;
+	__le16 voltage_now;
+	__le16 current_now;
+	__le16 unk3;
+	__le16 unk4;
+} __packed;
+
+static int aspire_ec_bat_psy_get_property(struct power_supply *psy,
+				      enum power_supply_property psp,
+				      union power_supply_propval *val)
+{
+	struct aspire_ec *ec = power_supply_get_drvdata(psy);
+	struct aspire_ec_bat_psy_static_data sdat;
+	struct aspire_ec_bat_psy_dynamic_data ddat;
+	int str_index = 0;
+
+	i2c_smbus_read_i2c_block_data(ec->client, ASPIRE_EC_FG_STATIC, sizeof(sdat), (u8 *)&sdat);
+	i2c_smbus_read_i2c_block_data(ec->client, ASPIRE_EC_FG_DYNAMIC, sizeof(ddat), (u8 *)&ddat);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
+		if (ddat.flags & ASPIRE_EC_FG_FLAG_CHARGING)
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		else if (ddat.flags & ASPIRE_EC_FG_FLAG_DISCHARGING)
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+		else if (ddat.flags & ASPIRE_EC_FG_FLAG_FULL)
+			val->intval = POWER_SUPPLY_STATUS_FULL;
+		break;
+
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = get_unaligned_le16(&ddat.voltage_now) * MILLI_TO_MICRO;
+		break;
+
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
+		val->intval = le16_to_cpu(sdat.voltage_design) * MILLI_TO_MICRO;
+		break;
+
+	case POWER_SUPPLY_PROP_CHARGE_NOW:
+		val->intval = get_unaligned_le16(&ddat.capacity_now) * MILLI_TO_MICRO;
+		break;
+
+	case POWER_SUPPLY_PROP_CHARGE_FULL:
+		val->intval = le16_to_cpu(sdat.capacity_full) * MILLI_TO_MICRO;
+		break;
+
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = get_unaligned_le16(&ddat.capacity_now) * 100;
+		val->intval /= le16_to_cpu(sdat.capacity_full);
+		break;
+
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		val->intval = (s16)get_unaligned_le16(&ddat.current_now) * MILLI_TO_MICRO;
+		break;
+
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = !!(ddat.flags & ASPIRE_EC_FG_FLAG_PRESENT);
+		break;
+
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_SYSTEM;
+		break;
+
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		str_index = sdat.model_id - 1;
+
+		if (str_index >= 0 && str_index < ARRAY_SIZE(aspire_ec_bat_psy_battery_model))
+			val->strval = aspire_ec_bat_psy_battery_model[str_index];
+		else
+			val->strval = "Unknown";
+		break;
+
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		str_index = sdat.vendor_id - 3; /* ACPI uses 3 as an offset here. */
+
+		if (str_index >= 0 && str_index < ARRAY_SIZE(aspire_ec_bat_psy_battery_vendor))
+			val->strval = aspire_ec_bat_psy_battery_vendor[str_index];
+		else
+			val->strval = "Unknown";
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static enum power_supply_property aspire_ec_bat_psy_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
+	POWER_SUPPLY_PROP_CHARGE_NOW,
+	POWER_SUPPLY_PROP_CHARGE_FULL,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
+};
+
+static const struct power_supply_desc aspire_ec_bat_psy_desc = {
+	.name		= "aspire-ec-bat",
+	.type		= POWER_SUPPLY_TYPE_BATTERY,
+	.get_property	= aspire_ec_bat_psy_get_property,
+	.properties	= aspire_ec_bat_psy_props,
+	.num_properties	= ARRAY_SIZE(aspire_ec_bat_psy_props),
+};
+
+static int aspire_ec_adp_psy_get_property(struct power_supply *psy,
+				      enum power_supply_property psp,
+				      union power_supply_propval *val)
+{
+	struct aspire_ec *ec = power_supply_get_drvdata(psy);
+	u8 tmp;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		aspire_ec_ram_read(ec->client, ASPIRE_EC_RAM_ADP, &tmp, sizeof(tmp));
+		val->intval = !!(tmp & ASPIRE_EC_AC_STATUS);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static enum power_supply_property aspire_ec_adp_psy_props[] = {
+	POWER_SUPPLY_PROP_ONLINE,
+};
+
+static const struct power_supply_desc aspire_ec_adp_psy_desc = {
+	.name		= "aspire-ec-adp",
+	.type		= POWER_SUPPLY_TYPE_MAINS,
+	.get_property	= aspire_ec_adp_psy_get_property,
+	.properties	= aspire_ec_adp_psy_props,
+	.num_properties	= ARRAY_SIZE(aspire_ec_adp_psy_props),
+};
+
+/*
+ * USB-C DP Alt mode HPD.
+ */
+
+static int aspire_ec_bridge_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
+{
+	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
+}
+
+static void aspire_ec_bridge_update_hpd_work(struct work_struct *work)
+{
+	struct aspire_ec *ec = container_of(work, struct aspire_ec, work);
+	u8 tmp;
+
+	aspire_ec_ram_read(ec->client, ASPIRE_EC_RAM_HPD_STATUS, &tmp, sizeof(tmp));
+	if (tmp == ASPIRE_EC_HPD_CONNECTED)
+		drm_bridge_hpd_notify(&ec->bridge, connector_status_connected);
+	else
+		drm_bridge_hpd_notify(&ec->bridge, connector_status_disconnected);
+}
+
+static void aspire_ec_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct aspire_ec *ec = container_of(bridge, struct aspire_ec, bridge);
+
+	schedule_work(&ec->work);
+}
+
+static const struct drm_bridge_funcs aspire_ec_bridge_funcs = {
+	.hpd_enable = aspire_ec_bridge_hpd_enable,
+	.attach = aspire_ec_bridge_attach,
+};
+
+/*
+ * Sysfs attributes.
+ */
+
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aspire_ec *ec = i2c_get_clientdata(to_i2c_client(dev));
+	u8 tmp;
+
+	aspire_ec_ram_read(ec->client, ASPIRE_EC_RAM_KBD_MODE, &tmp, sizeof(tmp));
+
+	return sysfs_emit(buf, "%u\n", !(tmp & ASPIRE_EC_RAM_KBD_MEDIA_ON_TOP));
+}
+
+static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct aspire_ec *ec = i2c_get_clientdata(to_i2c_client(dev));
+	u8 tmp;
+
+	bool state;
+	int ret;
+
+	ret = kstrtobool(buf, &state);
+	if (ret)
+		return ret;
+
+	aspire_ec_ram_read(ec->client, ASPIRE_EC_RAM_KBD_MODE, &tmp, sizeof(tmp));
+
+	if (state)
+		tmp &= ~ASPIRE_EC_RAM_KBD_MEDIA_ON_TOP;
+	else
+		tmp |= ASPIRE_EC_RAM_KBD_MEDIA_ON_TOP;
+
+	aspire_ec_ram_write(ec->client, ASPIRE_EC_RAM_KBD_MODE, tmp);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(fn_lock);
+
+static struct attribute *aspire_ec_attrs[] = {
+	&dev_attr_fn_lock.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(aspire_ec);
+
+static int aspire_ec_probe(struct i2c_client *client)
+{
+	struct power_supply_config psy_cfg = {0};
+	struct device *dev = &client->dev;
+	struct fwnode_handle *fwnode;
+	struct aspire_ec *ec;
+	int ret;
+	u8 tmp;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->client = client;
+	i2c_set_clientdata(client, ec);
+
+	/* Battery status reports */
+	psy_cfg.drv_data = ec;
+	ec->bat_psy = devm_power_supply_register(dev, &aspire_ec_bat_psy_desc, &psy_cfg);
+	if (IS_ERR(ec->bat_psy))
+		return dev_err_probe(dev, PTR_ERR(ec->bat_psy),
+				     "Failed to register battery power supply\n");
+
+	ec->adp_psy = devm_power_supply_register(dev, &aspire_ec_adp_psy_desc, &psy_cfg);
+	if (IS_ERR(ec->adp_psy))
+		return dev_err_probe(dev, PTR_ERR(ec->adp_psy),
+				     "Failed to register AC power supply\n");
+
+	/* Lid switch */
+	ec->idev = devm_input_allocate_device(dev);
+	if (!ec->idev)
+		return -ENOMEM;
+
+	ec->idev->name = "aspire-ec";
+	ec->idev->phys = "aspire-ec/input0";
+	input_set_capability(ec->idev, EV_SW, SW_LID);
+
+	ret = input_register_device(ec->idev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Input device register failed\n");
+
+	/* Enable the keyboard fn keys */
+	tmp = ASPIRE_EC_RAM_KBD_FN_EN | ASPIRE_EC_RAM_KBD_ALWAYS_SET;
+	tmp |= ASPIRE_EC_RAM_KBD_MEDIA_ON_TOP;
+	aspire_ec_ram_write(client, ASPIRE_EC_RAM_KBD_MODE, tmp);
+
+	aspire_ec_ram_read(client, ASPIRE_EC_RAM_KBD_MODE_2, &tmp, sizeof(tmp));
+	tmp |= ASPIRE_EC_RAM_KBD_MEDIA_NOTIFY;
+	aspire_ec_ram_write(client, ASPIRE_EC_RAM_KBD_MODE_2, tmp);
+
+	/* External Type-C display attach reports */
+	fwnode = device_get_named_child_node(dev, "connector");
+	if (fwnode) {
+		INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
+		ec->bridge.funcs = &aspire_ec_bridge_funcs;
+		ec->bridge.of_node = to_of_node(fwnode);
+		ec->bridge.ops = DRM_BRIDGE_OP_HPD;
+		ec->bridge.type = DRM_MODE_CONNECTOR_USB;
+
+		ret = devm_drm_bridge_add(dev, &ec->bridge);
+		if (ret) {
+			fwnode_handle_put(fwnode);
+			return dev_err_probe(dev, ret, "Failed to register drm bridge\n");
+		}
+
+		ec->bridge_configured = true;
+	}
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					aspire_ec_irq_handler, IRQF_ONESHOT,
+					dev_name(dev), ec);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+	return 0;
+}
+
+static int aspire_ec_resume(struct device *dev)
+{
+	struct aspire_ec *ec = i2c_get_clientdata(to_i2c_client(dev));
+	u8 tmp;
+
+	aspire_ec_ram_read(ec->client, ASPIRE_EC_RAM_LID_STATUS, &tmp, sizeof(tmp));
+	input_report_switch(ec->idev, SW_LID, !!(tmp & ASPIRE_EC_LID_OPEN));
+	input_sync(ec->idev);
+
+	return 0;
+}
+
+static const struct i2c_device_id aspire_ec_id[] = {
+	{ "aspire1-ec", },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aspire_ec_id);
+
+static const struct of_device_id aspire_ec_of_match[] = {
+	{ .compatible = "acer,aspire1-ec", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspire_ec_of_match);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(aspire_ec_pm_ops, NULL, aspire_ec_resume);
+
+static struct i2c_driver aspire_ec_driver = {
+	.driver = {
+		.name = "aspire-ec",
+		.of_match_table = aspire_ec_of_match,
+		.pm = pm_sleep_ptr(&aspire_ec_pm_ops),
+		.dev_groups = aspire_ec_groups,
+	},
+	.probe = aspire_ec_probe,
+	.id_table = aspire_ec_id,
+};
+module_i2c_driver(aspire_ec_driver);
+
+MODULE_DESCRIPTION("Acer Aspire 1 embedded controller");
+MODULE_AUTHOR("Nikita Travkin <nikita@trvn.ru>");
+MODULE_LICENSE("GPL");

-- 
2.44.0



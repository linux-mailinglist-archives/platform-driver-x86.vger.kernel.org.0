Return-Path: <platform-driver-x86+bounces-3881-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B0907FC3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Jun 2024 01:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A964E1C212CF
	for <lists+platform-driver-x86@lfdr.de>; Thu, 13 Jun 2024 23:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95153157462;
	Thu, 13 Jun 2024 23:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcnYjbiI"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE7914EC45
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jun 2024 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322231; cv=none; b=D6W9ZIRNtqZXmNhMPaAZ+VRdxpLjgl9zQ9x5Fol7ZWQ5uLSh01W07EfU2FbLlujBCCbaBn/IgTS0cblsj3kqyDbkoJHhBw+0BlymkRI55iMPop8uAXjeiPnWZWR40zI3Pm3NczJjee7qSVhm1OQw6xVH3nffXAQMLbKK81QiHFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322231; c=relaxed/simple;
	bh=PvcGzg+0ChJQPpPnd2VfcGRFOQL0Q8NiPcLnsj72mFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QtS7XOYDCYzH9Z6JEGkA7IJUhN0ge6Qufdy9KzphJM15l1/uRlZoJudBrc7yFmUm1vATW+SeRoYrRuyJhxbb2mqU20JUfiwzxwkCZajlocq+dE+/5N5Q+C/JTPRqSGr+RPusWySaHhfWElesDL8EBBo9atk+0mdG1NbtHJxOWww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcnYjbiI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc335e49aso1867296e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jun 2024 16:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718322226; x=1718927026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxsI/mJs6MKvdrfcgrO8NtP2A4s/Owj83oRWARax2jM=;
        b=rcnYjbiIcoaj7djgaLKYsZQI9AcIWCAM+YsRXuBkPoAGOdGFWbC/OR6HiKIUup/TXD
         frTp2dPp/J6rgtveKfi9jbiAp1qreQAitTLqSOf3iNePGrWKPE+8CraAteQy5BKlHeJH
         wgzfb95hOA7BWagUZmZFfsO6GqLmRKMj/zFCxJYuz0gndO6PGaqr7R376wjLFNDaXwhQ
         hcQNRCGCstCs6GSDUvS3ihsG8qefz1lzOyGxj1xHvz6XK7VC9bVH8qxYuLFMoz7kBpkf
         QckiIBj8msaVN+R8MhQ/JFwO8KDkIEvcyhW2YySiRh1ETF81+RMukVn5+q+4/ZoTgoWu
         y3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322226; x=1718927026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxsI/mJs6MKvdrfcgrO8NtP2A4s/Owj83oRWARax2jM=;
        b=YhWyY5tTemdCSd8GMF11Rgruy+DkHojEK3cu+fxefyk5zw7jETgstGWR6raKj+QJoc
         T/R577AuJJ6kOwN6Lk4PqUOTEhXHubsdvIz+NMrmqWyyixHS6SyzqaojH+aOq4T/ZZGd
         hQ3Hij7JMN91+opiM3rBzM4CqaiNiZlh9OrCDa/eHWxDc/q1fzanGiTRw0WpXNBYfJls
         vdP+cSuYw6z5/9zq3fV20xt0VCquMXqMJddECgQVa3kTqMLKqe29CsG2UOF4RXGaDZze
         OuhKsSixs6Owa5whABIsTYUxxgtAIiRELTV/jco6YuhICuxbNAC5jxN0L1VXmPx1BtwJ
         Jsjw==
X-Forwarded-Encrypted: i=1; AJvYcCVukgMLuq99VjVnkfuOzpXd2NSL30JfrboVqvBCipiR+eGQe11kc/pPxN3Jv1wtbcLIO/02mAOG5du0w2lCXaINT+Oqgn0o6mjtg89Xt5YjIHXNAA==
X-Gm-Message-State: AOJu0Yy0YdmkuiJRWhiU+7YeRvKypK4GkdyT3gs6oTOnMVpitrEBePPp
	1RTFi2zTKkrIFm1j/maApNtwtVqEjssguLGOL5GIYpb0s5BGrQkdT2P3BY3Sf0I=
X-Google-Smtp-Source: AGHT+IHPrl0Wf9IRRFaZTq1XU71HfnGOwLrQKLe8Lx1npVDdAlBDkbpmoC9dLX9kEENLulfQ/oyrig==
X-Received: by 2002:a19:e019:0:b0:52c:98b4:2634 with SMTP id 2adb3069b0e04-52ca6e64a0emr637345e87.26.1718322226299;
        Thu, 13 Jun 2024 16:43:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872260sm359298e87.142.2024.06.13.16.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:43:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 02:43:41 +0300
Subject: [PATCH v7 4/6] power: supply: lenovo_yoga_c630_battery: add Lenovo
 C630 driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-yoga-ec-driver-v7-4-9f0b9b40ae76@linaro.org>
References: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
In-Reply-To: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15940;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PvcGzg+0ChJQPpPnd2VfcGRFOQL0Q8NiPcLnsj72mFk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2i25vYOkqpplCk92/MKWXcGvu15WqtF4oxmitnPniS
 0Al08ZORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkpwD7H+6gmFk+dcUXBblP
 Rs+fq83ItSkjpmlLkZafeF3ejb2Wtps5t3vHPkrwfTR5UodcUee20DtMr9mWpjupXZtrvXxd7Fu
 OPtOZvmwbTnu7LugN2mrQprQgfcXR2RJbF++JnDtb5k3T4cflpQJuyt9XqaVaCze9uSFnz2w2tz
 TZ5tqNp9oNrWV/GKdJ+3rJcm0vDfCuW9vHP6Phd3Fn70R/x9X8OhsOOP+wOaQt4yUruefar/3Cu
 k/O8KrYehZrvkhT+b2lUfLaRA2dK88ZY20VI1Y48r5S+9OVkCu+hHXtz9yVJtfvif6NdDR+/YVP
 VU3oyIWJ3q5xfbZblgsx7RUyerCRoZmd8b2bpIyc0wwA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Lenovo Yoga C630 WOS laptop the EC provides access to the adapter
and battery status. Add the driver to read power supply status on the
laptop.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/power/supply/Kconfig                    |   9 +
 drivers/power/supply/Makefile                   |   1 +
 drivers/power/supply/lenovo_yoga_c630_battery.c | 500 ++++++++++++++++++++++++
 3 files changed, 510 insertions(+)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 3e31375491d5..55ab8e90747d 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -167,6 +167,15 @@ config BATTERY_LEGO_EV3
 	help
 	  Say Y here to enable support for the LEGO MINDSTORMS EV3 battery.
 
+config BATTERY_LENOVO_YOGA_C630
+	tristate "Lenovo Yoga C630 battery"
+	depends on OF && EC_LENOVO_YOGA_C630
+	help
+	  This driver enables battery support on the Lenovo Yoga C630 laptop.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called lenovo_yoga_c630_battery.
+
 config BATTERY_PMU
 	tristate "Apple PMU battery"
 	depends on PPC32 && ADB_PMU
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 58b567278034..8ebbdcf92dac 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_BATTERY_DS2782)	+= ds2782_battery.o
 obj-$(CONFIG_BATTERY_GAUGE_LTC2941)	+= ltc2941-battery-gauge.o
 obj-$(CONFIG_BATTERY_GOLDFISH)	+= goldfish_battery.o
 obj-$(CONFIG_BATTERY_LEGO_EV3)	+= lego_ev3_battery.o
+obj-$(CONFIG_BATTERY_LENOVO_YOGA_C630) += lenovo_yoga_c630_battery.o
 obj-$(CONFIG_BATTERY_PMU)	+= pmu_battery.o
 obj-$(CONFIG_BATTERY_QCOM_BATTMGR)	+= qcom_battmgr.o
 obj-$(CONFIG_BATTERY_OLPC)	+= olpc_battery.o
diff --git a/drivers/power/supply/lenovo_yoga_c630_battery.c b/drivers/power/supply/lenovo_yoga_c630_battery.c
new file mode 100644
index 000000000000..0209cdb5546f
--- /dev/null
+++ b/drivers/power/supply/lenovo_yoga_c630_battery.c
@@ -0,0 +1,500 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024, Linaro Ltd
+ * Authors:
+ *    Bjorn Andersson
+ *    Dmitry Baryshkov
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/power_supply.h>
+#include <linux/platform_data/lenovo-yoga-c630.h>
+
+struct yoga_c630_psy {
+	struct yoga_c630_ec *ec;
+	struct device *dev;
+	struct fwnode_handle *fwnode;
+	struct notifier_block nb;
+
+	/* guards all battery properties and registration of power supplies */
+	struct mutex lock;
+
+	struct power_supply *adp_psy;
+	struct power_supply *bat_psy;
+
+	unsigned long last_status_update;
+
+	bool adapter_online;
+
+	bool unit_mA;
+
+	bool bat_present;
+	unsigned int bat_status;
+	unsigned int design_capacity;
+	unsigned int design_voltage;
+	unsigned int full_charge_capacity;
+
+	unsigned int capacity_now;
+	unsigned int voltage_now;
+
+	int current_now;
+	int rate_now;
+};
+
+#define LENOVO_EC_CACHE_TIME		(10 * HZ)
+
+#define LENOVO_EC_ADPT_STATUS		0xa3
+#define LENOVO_EC_ADPT_STATUS_PRESENT		BIT(7)
+#define LENOVO_EC_BAT_ATTRIBUTES	0xc0
+#define LENOVO_EC_BAT_ATTRIBUTES_UNIT_IS_MA	BIT(1)
+#define LENOVO_EC_BAT_STATUS		0xc1
+#define LENOVO_EC_BAT_STATUS_DISCHARGING	BIT(0)
+#define LENOVO_EC_BAT_STATUS_CHARGING		BIT(1)
+#define LENOVO_EC_BAT_REMAIN_CAPACITY	0xc2
+#define LENOVO_EC_BAT_VOLTAGE		0xc6
+#define LENOVO_EC_BAT_DESIGN_VOLTAGE	0xc8
+#define LENOVO_EC_BAT_DESIGN_CAPACITY	0xca
+#define LENOVO_EC_BAT_FULL_CAPACITY	0xcc
+#define LENOVO_EC_BAT_CURRENT		0xd2
+#define LENOVO_EC_BAT_FULL_FACTORY	0xd6
+#define LENOVO_EC_BAT_PRESENT		0xda
+#define LENOVO_EC_BAT_PRESENT_IS_PRESENT	BIT(0)
+#define LENOVO_EC_BAT_FULL_REGISTER	0xdb
+#define LENOVO_EC_BAT_FULL_REGISTER_IS_FACTORY	BIT(0)
+
+static int yoga_c630_psy_update_bat_info(struct yoga_c630_psy *ecbat)
+{
+	struct yoga_c630_ec *ec = ecbat->ec;
+	int val;
+
+	lockdep_assert_held(&ecbat->lock);
+
+	val = yoga_c630_ec_read8(ec, LENOVO_EC_BAT_PRESENT);
+	if (val < 0)
+		return val;
+	ecbat->bat_present = !!(val & LENOVO_EC_BAT_PRESENT_IS_PRESENT);
+	if (!ecbat->bat_present)
+		return val;
+
+	val = yoga_c630_ec_read8(ec, LENOVO_EC_BAT_ATTRIBUTES);
+	if (val < 0)
+		return val;
+	ecbat->unit_mA = val & LENOVO_EC_BAT_ATTRIBUTES_UNIT_IS_MA;
+
+	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_DESIGN_CAPACITY);
+	if (val < 0)
+		return val;
+	ecbat->design_capacity = val * 1000;
+
+	/*
+	 * DSDT has delays after most of EC reads in these methods.
+	 * Having no documentation for the EC we have to follow and sleep here.
+	 */
+	msleep(50);
+
+	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_DESIGN_VOLTAGE);
+	if (val < 0)
+		return val;
+	ecbat->design_voltage = val;
+
+	msleep(50);
+
+	val = yoga_c630_ec_read8(ec, LENOVO_EC_BAT_FULL_REGISTER);
+	if (val < 0)
+		return val;
+	val = yoga_c630_ec_read16(ec,
+				  val & LENOVO_EC_BAT_FULL_REGISTER_IS_FACTORY ?
+				  LENOVO_EC_BAT_FULL_FACTORY :
+				  LENOVO_EC_BAT_FULL_CAPACITY);
+	if (val < 0)
+		return val;
+
+	ecbat->full_charge_capacity = val * 1000;
+
+	if (!ecbat->unit_mA) {
+		ecbat->design_capacity *= 10;
+		ecbat->full_charge_capacity *= 10;
+	}
+
+	return 0;
+}
+
+static int yoga_c630_psy_maybe_update_bat_status(struct yoga_c630_psy *ecbat)
+{
+	struct yoga_c630_ec *ec = ecbat->ec;
+	int current_mA;
+	int val;
+
+	guard(mutex)(&ecbat->lock);
+	if (time_before(jiffies, ecbat->last_status_update + LENOVO_EC_CACHE_TIME))
+		return 0;
+
+	val = yoga_c630_ec_read8(ec, LENOVO_EC_BAT_STATUS);
+	if (val < 0)
+		return val;
+	ecbat->bat_status = val;
+
+	msleep(50);
+
+	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_REMAIN_CAPACITY);
+	if (val < 0)
+		return val;
+	ecbat->capacity_now = val * 1000;
+
+	msleep(50);
+
+	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_VOLTAGE);
+	if (val < 0)
+		return val;
+	ecbat->voltage_now = val * 1000;
+
+	msleep(50);
+
+	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_CURRENT);
+	if (val < 0)
+		return val;
+	current_mA = sign_extend32(val, 15);
+	ecbat->current_now = current_mA * 1000;
+	ecbat->rate_now = current_mA * (ecbat->voltage_now / 1000);
+
+	msleep(50);
+
+	if (!ecbat->unit_mA)
+		ecbat->capacity_now *= 10;
+
+	ecbat->last_status_update = jiffies;
+
+	return 0;
+}
+
+static int yoga_c630_psy_update_adapter_status(struct yoga_c630_psy *ecbat)
+{
+	struct yoga_c630_ec *ec = ecbat->ec;
+	int val;
+
+	guard(mutex)(&ecbat->lock);
+
+	val = yoga_c630_ec_read8(ec, LENOVO_EC_ADPT_STATUS);
+	if (val < 0)
+		return val;
+
+	ecbat->adapter_online = !!(val & LENOVO_EC_ADPT_STATUS_PRESENT);
+
+	return 0;
+}
+
+static bool yoga_c630_psy_is_charged(struct yoga_c630_psy *ecbat)
+{
+	if (ecbat->bat_status != 0)
+		return false;
+
+	if (ecbat->full_charge_capacity <= ecbat->capacity_now)
+		return true;
+
+	if (ecbat->design_capacity <= ecbat->capacity_now)
+		return true;
+
+	return false;
+}
+
+static int yoga_c630_psy_bat_get_property(struct power_supply *psy,
+					 enum power_supply_property psp,
+					 union power_supply_propval *val)
+{
+	struct yoga_c630_psy *ecbat = power_supply_get_drvdata(psy);
+	int rc = 0;
+
+	if (!ecbat->bat_present && psp != POWER_SUPPLY_PROP_PRESENT)
+		return -ENODEV;
+
+	rc = yoga_c630_psy_maybe_update_bat_status(ecbat);
+	if (rc)
+		return rc;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		if (ecbat->bat_status & LENOVO_EC_BAT_STATUS_DISCHARGING)
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+		else if (ecbat->bat_status & LENOVO_EC_BAT_STATUS_CHARGING)
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		else if (yoga_c630_psy_is_charged(ecbat))
+			val->intval = POWER_SUPPLY_STATUS_FULL;
+		else
+			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = ecbat->bat_present;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
+		val->intval = ecbat->design_voltage;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
+	case POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN:
+		val->intval = ecbat->design_capacity;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_FULL:
+	case POWER_SUPPLY_PROP_ENERGY_FULL:
+		val->intval = ecbat->full_charge_capacity;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_NOW:
+	case POWER_SUPPLY_PROP_ENERGY_NOW:
+		val->intval = ecbat->capacity_now;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		val->intval = ecbat->current_now;
+		break;
+	case POWER_SUPPLY_PROP_POWER_NOW:
+		val->intval = ecbat->rate_now;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = ecbat->voltage_now;
+		break;
+	case POWER_SUPPLY_PROP_TECHNOLOGY:
+		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
+		break;
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = "PABAS0241231";
+		break;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = "Compal";
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_SYSTEM;
+		break;
+	default:
+		rc = -EINVAL;
+		break;
+	}
+
+	return rc;
+}
+
+static enum power_supply_property yoga_c630_psy_bat_mA_properties[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
+	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
+	POWER_SUPPLY_PROP_CHARGE_FULL,
+	POWER_SUPPLY_PROP_CHARGE_NOW,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_POWER_NOW,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_TECHNOLOGY,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
+	POWER_SUPPLY_PROP_SCOPE,
+};
+
+static enum power_supply_property yoga_c630_psy_bat_mWh_properties[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
+	POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN,
+	POWER_SUPPLY_PROP_ENERGY_FULL,
+	POWER_SUPPLY_PROP_ENERGY_NOW,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_POWER_NOW,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_TECHNOLOGY,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
+	POWER_SUPPLY_PROP_SCOPE,
+};
+
+static const struct power_supply_desc yoga_c630_psy_bat_psy_desc_mA = {
+	.name = "yoga-c630-battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = yoga_c630_psy_bat_mA_properties,
+	.num_properties = ARRAY_SIZE(yoga_c630_psy_bat_mA_properties),
+	.get_property = yoga_c630_psy_bat_get_property,
+};
+
+static const struct power_supply_desc yoga_c630_psy_bat_psy_desc_mWh = {
+	.name = "yoga-c630-battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = yoga_c630_psy_bat_mWh_properties,
+	.num_properties = ARRAY_SIZE(yoga_c630_psy_bat_mWh_properties),
+	.get_property = yoga_c630_psy_bat_get_property,
+};
+
+static int yoga_c630_psy_adpt_get_property(struct power_supply *psy,
+					  enum power_supply_property psp,
+					  union power_supply_propval *val)
+{
+	struct yoga_c630_psy *ecbat = power_supply_get_drvdata(psy);
+	int ret = 0;
+
+	ret = yoga_c630_psy_update_adapter_status(ecbat);
+	if (ret < 0)
+		return ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = ecbat->adapter_online;
+		break;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = POWER_SUPPLY_USB_TYPE_C;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static enum power_supply_property yoga_c630_psy_adpt_properties[] = {
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_USB_TYPE,
+};
+
+static const enum power_supply_usb_type yoga_c630_psy_adpt_usb_type[] = {
+	POWER_SUPPLY_USB_TYPE_C,
+};
+
+static const struct power_supply_desc yoga_c630_psy_adpt_psy_desc = {
+	.name = "yoga-c630-adapter",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.usb_types = yoga_c630_psy_adpt_usb_type,
+	.num_usb_types = ARRAY_SIZE(yoga_c630_psy_adpt_usb_type),
+	.properties = yoga_c630_psy_adpt_properties,
+	.num_properties = ARRAY_SIZE(yoga_c630_psy_adpt_properties),
+	.get_property = yoga_c630_psy_adpt_get_property,
+};
+
+static int yoga_c630_psy_register_bat_psy(struct yoga_c630_psy *ecbat)
+{
+	struct power_supply_config bat_cfg = {};
+
+	bat_cfg.drv_data = ecbat;
+	bat_cfg.fwnode = ecbat->fwnode;
+	ecbat->bat_psy = power_supply_register_no_ws(ecbat->dev,
+						     ecbat->unit_mA ?
+						     &yoga_c630_psy_bat_psy_desc_mA :
+						     &yoga_c630_psy_bat_psy_desc_mWh,
+						     &bat_cfg);
+	if (IS_ERR(ecbat->bat_psy)) {
+		dev_err(ecbat->dev, "failed to register battery supply\n");
+		return PTR_ERR(ecbat->bat_psy);
+	}
+
+	return 0;
+}
+
+static void yoga_c630_ec_refresh_bat_info(struct yoga_c630_psy *ecbat)
+{
+	bool current_unit;
+
+	guard(mutex)(&ecbat->lock);
+
+	current_unit = ecbat->unit_mA;
+
+	yoga_c630_psy_update_bat_info(ecbat);
+
+	if (current_unit != ecbat->unit_mA) {
+		power_supply_unregister(ecbat->bat_psy);
+		yoga_c630_psy_register_bat_psy(ecbat);
+	}
+}
+
+static int yoga_c630_psy_notify(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct yoga_c630_psy *ecbat = container_of(nb, struct yoga_c630_psy, nb);
+
+	switch (action) {
+	case LENOVO_EC_EVENT_BAT_INFO:
+		yoga_c630_ec_refresh_bat_info(ecbat);
+		break;
+	case LENOVO_EC_EVENT_BAT_ADPT_STATUS:
+		power_supply_changed(ecbat->adp_psy);
+		fallthrough;
+	case LENOVO_EC_EVENT_BAT_STATUS:
+		power_supply_changed(ecbat->bat_psy);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int yoga_c630_psy_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct yoga_c630_ec *ec = adev->dev.platform_data;
+	struct power_supply_config adp_cfg = {};
+	struct device *dev = &adev->dev;
+	struct yoga_c630_psy *ecbat;
+	int ret;
+
+	ecbat = devm_kzalloc(&adev->dev, sizeof(*ecbat), GFP_KERNEL);
+	if (!ecbat)
+		return -ENOMEM;
+
+	ecbat->ec = ec;
+	ecbat->dev = dev;
+	mutex_init(&ecbat->lock);
+	ecbat->fwnode = adev->dev.parent->fwnode;
+	ecbat->nb.notifier_call = yoga_c630_psy_notify;
+
+	auxiliary_set_drvdata(adev, ecbat);
+
+	adp_cfg.drv_data = ecbat;
+	adp_cfg.fwnode = ecbat->fwnode;
+	adp_cfg.supplied_to = (char **)&yoga_c630_psy_bat_psy_desc_mA.name;
+	adp_cfg.num_supplicants = 1;
+	ecbat->adp_psy = devm_power_supply_register_no_ws(dev, &yoga_c630_psy_adpt_psy_desc, &adp_cfg);
+	if (IS_ERR(ecbat->adp_psy)) {
+		dev_err(dev, "failed to register AC adapter supply\n");
+		return PTR_ERR(ecbat->adp_psy);
+	}
+
+	scoped_guard(mutex, &ecbat->lock) {
+		ret = yoga_c630_psy_update_bat_info(ecbat);
+		if (ret)
+			goto err_unreg_bat;
+
+		ret = yoga_c630_psy_register_bat_psy(ecbat);
+		if (ret)
+			goto err_unreg_bat;
+	}
+
+	ret = yoga_c630_ec_register_notify(ecbat->ec, &ecbat->nb);
+	if (ret)
+		goto err_unreg_bat;
+
+	return 0;
+
+err_unreg_bat:
+	power_supply_unregister(ecbat->bat_psy);
+	return ret;
+}
+
+static void yoga_c630_psy_remove(struct auxiliary_device *adev)
+{
+	struct yoga_c630_psy *ecbat = auxiliary_get_drvdata(adev);
+
+	yoga_c630_ec_unregister_notify(ecbat->ec, &ecbat->nb);
+	power_supply_unregister(ecbat->bat_psy);
+}
+
+static const struct auxiliary_device_id yoga_c630_psy_id_table[] = {
+	{ .name = YOGA_C630_MOD_NAME "." YOGA_C630_DEV_PSY, },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, yoga_c630_psy_id_table);
+
+static struct auxiliary_driver yoga_c630_psy_driver = {
+	.name = YOGA_C630_DEV_PSY,
+	.id_table = yoga_c630_psy_id_table,
+	.probe = yoga_c630_psy_probe,
+	.remove = yoga_c630_psy_remove,
+};
+
+module_auxiliary_driver(yoga_c630_psy_driver);
+
+MODULE_DESCRIPTION("Lenovo Yoga C630 psy");
+MODULE_LICENSE("GPL");

-- 
2.39.2



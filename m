Return-Path: <platform-driver-x86+bounces-7454-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7BD9E44AF
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Dec 2024 20:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 897161653A2
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Dec 2024 19:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7581C3BF0;
	Wed,  4 Dec 2024 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZkF7nzI"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8611A8F7A
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733340900; cv=none; b=m6qvt5A2bYJeLeY90/9f5aSCi/XkFl2Z/W7NgDI9EpIQVlNzTlLKeZ68Qngt1UH/ojmH9+29jAEnF+9yBWC4k72R6WwF4+98ip0oh9RCzyuy9SRahnrKj0fu6mpNI0Uepwe7U/9m8GI6tM8DzlNF6ku4PcM14lPOipEZUDif6vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733340900; c=relaxed/simple;
	bh=GRblEScp0q7QTWrQP4P1LCRNc15+pEFtohY6/tdusZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfWJ5dVyv7OpwyIUqEZCAXXRX+kcFpPoNyBRJFOTaE8LDgLilPLCF4zN/G+fruXWdyD5Or5AkMpTn1P9TtpfANMzbbKibXM4nDDZJnQc/+eGO/CptzUyONzrP+W6qE/luMHwJUTECdr1riX+ut7TXDPYvQ61PhteT3tHxN158YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZkF7nzI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733340897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uifj64u4wQ/Yvla0cPpAgs7/f3vLpYKK7vhrsht6pNA=;
	b=VZkF7nzIP6HnXMJ0IJVKqgGuzqHyYrcz0k6a3BTa1Wc9Yy/rPOXoRlxH/F+yhjHhnMxddP
	ObZlOFW33F16EFn6Thc0c+ngEG430zW1MGWqOZY80m50/j8OEek/XsyheITPJdrpPTF4F6
	qyMSGQqxjaNDlEct42nllPdyxlNLOnc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-Kjw7jgc3MXaK7a-7a-RYGA-1; Wed,
 04 Dec 2024 14:34:56 -0500
X-MC-Unique: Kjw7jgc3MXaK7a-7a-RYGA-1
X-Mimecast-MFC-AGG-ID: Kjw7jgc3MXaK7a-7a-RYGA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2CE0319560AB;
	Wed,  4 Dec 2024 19:34:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C283D19560A2;
	Wed,  4 Dec 2024 19:34:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/2] platform/x86/intel: bytcrc_pwrsrc: Optionally register a power_supply dev
Date: Wed,  4 Dec 2024 20:34:41 +0100
Message-ID: <20241204193442.65374-2-hdegoede@redhat.com>
In-Reply-To: <20241204193442.65374-1-hdegoede@redhat.com>
References: <20241204193442.65374-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On some Android tablets with Crystal Cove PMIC the DSDT lacks an ACPI AC
device to indicate whether a charger is plugged in or not.

Add support for registering a "crystal_cove_pwrsrc" power_supply class
device to indicate charger online status. This is made conditional on
a "linux,register-pwrsrc-power_supply" boolean device-property to avoid
registering a duplicate power_supply class device on devices where this
is already handled by an ACPI AC device.

Note the "linux,register-pwrsrc-power_supply" property is only used on
x86/ACPI (non devicetree) devs and the devicetree-bindings maintainers
have requested properties like these to not be added to the devicetree
bindings, so the new property is deliberately not added to any bindings.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Add Andy's Reviewed-by

Changes in v2:
- Adress a few small review remarks
---
 drivers/platform/x86/intel/bytcrc_pwrsrc.c | 79 +++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/bytcrc_pwrsrc.c b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
index 418b71af27ff..73121f77c017 100644
--- a/drivers/platform/x86/intel/bytcrc_pwrsrc.c
+++ b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
@@ -8,13 +8,22 @@
  * Copyright (C) 2013 Intel Corporation
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/debugfs.h>
+#include <linux/interrupt.h>
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
+#define CRYSTALCOVE_PWRSRC_IRQ		0x03
 #define CRYSTALCOVE_SPWRSRC_REG		0x1E
+#define CRYSTALCOVE_SPWRSRC_USB		BIT(0)
+#define CRYSTALCOVE_SPWRSRC_DC		BIT(1)
+#define CRYSTALCOVE_SPWRSRC_BATTERY	BIT(2)
 #define CRYSTALCOVE_RESETSRC0_REG	0x20
 #define CRYSTALCOVE_RESETSRC1_REG	0x21
 #define CRYSTALCOVE_WAKESRC_REG		0x22
@@ -22,6 +31,7 @@
 struct crc_pwrsrc_data {
 	struct regmap *regmap;
 	struct dentry *debug_dentry;
+	struct power_supply *psy;
 	unsigned int resetsrc0;
 	unsigned int resetsrc1;
 	unsigned int wakesrc;
@@ -118,13 +128,60 @@ static int crc_pwrsrc_read_and_clear(struct crc_pwrsrc_data *data,
 	return regmap_write(data->regmap, reg, *val);
 }
 
+static irqreturn_t crc_pwrsrc_irq_handler(int irq, void *_data)
+{
+	struct crc_pwrsrc_data *data = _data;
+	unsigned int irq_mask;
+
+	if (regmap_read(data->regmap, CRYSTALCOVE_PWRSRC_IRQ, &irq_mask))
+		return IRQ_NONE;
+
+	regmap_write(data->regmap, CRYSTALCOVE_PWRSRC_IRQ, irq_mask);
+
+	power_supply_changed(data->psy);
+	return IRQ_HANDLED;
+}
+
+static int crc_pwrsrc_psy_get_property(struct power_supply *psy,
+				       enum power_supply_property psp,
+				       union power_supply_propval *val)
+{
+	struct crc_pwrsrc_data *data = power_supply_get_drvdata(psy);
+	unsigned int pwrsrc;
+	int ret;
+
+	if (psp != POWER_SUPPLY_PROP_ONLINE)
+		return -EINVAL;
+
+	ret = regmap_read(data->regmap, CRYSTALCOVE_SPWRSRC_REG, &pwrsrc);
+	if (ret)
+		return ret;
+
+	val->intval = !!(pwrsrc & (CRYSTALCOVE_SPWRSRC_USB |
+				   CRYSTALCOVE_SPWRSRC_DC));
+	return 0;
+}
+
+static const enum power_supply_property crc_pwrsrc_psy_props[] = {
+	POWER_SUPPLY_PROP_ONLINE,
+};
+
+static const struct power_supply_desc crc_pwrsrc_psy_desc = {
+	.name = "crystal_cove_pwrsrc",
+	.type = POWER_SUPPLY_TYPE_MAINS,
+	.properties = crc_pwrsrc_psy_props,
+	.num_properties = ARRAY_SIZE(crc_pwrsrc_psy_props),
+	.get_property = crc_pwrsrc_psy_get_property,
+};
+
 static int crc_pwrsrc_probe(struct platform_device *pdev)
 {
 	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
 	struct crc_pwrsrc_data *data;
-	int ret;
+	int irq, ret;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -149,6 +206,24 @@ static int crc_pwrsrc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (device_property_read_bool(dev->parent, "linux,register-pwrsrc-power_supply")) {
+		struct power_supply_config psy_cfg = { .drv_data = data };
+
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return irq;
+
+		data->psy = devm_power_supply_register(dev, &crc_pwrsrc_psy_desc, &psy_cfg);
+		if (IS_ERR(data->psy))
+			return dev_err_probe(dev, PTR_ERR(data->psy), "registering power-supply\n");
+
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+						crc_pwrsrc_irq_handler,
+						IRQF_ONESHOT, KBUILD_MODNAME, data);
+		if (ret)
+			return dev_err_probe(dev, ret, "requesting IRQ\n");
+	}
+
 	data->debug_dentry = debugfs_create_dir(KBUILD_MODNAME, NULL);
 	debugfs_create_file("pwrsrc", 0444, data->debug_dentry, data, &pwrsrc_fops);
 	debugfs_create_file("resetsrc", 0444, data->debug_dentry, data, &resetsrc_fops);
-- 
2.47.0



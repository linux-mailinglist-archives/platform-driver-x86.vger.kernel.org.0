Return-Path: <platform-driver-x86+bounces-10581-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB2A70683
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Mar 2025 17:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D622189C97A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Mar 2025 16:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFBA25BAA9;
	Tue, 25 Mar 2025 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrD9+Fas"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA725C6E2
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2025 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919278; cv=none; b=JkNbnJPk+Rv0MKspxfa5oQeUuyRsimZ73hnrTYlLSwqMwoanyZLd1/m/OzV63ZyVNM5E0rpUr6Odi1am5e3R5EfXQ7fLP8Osj3qLMh4VIIHEjntsTqx8Dej9xGmDguVvJ9iIkhMwUypBUm0k6z4V6jreKuXPuXPl90q1u+lJICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919278; c=relaxed/simple;
	bh=gsMlnd38Psc3SaI9GEpL2QYV7gDlfVkONvSXqzgv8lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGV2D/sSmA7RaU0cPuyFQkRmbYgaQFa8auEgFIH9wOcmF5HLbNmUNf1ZTIaTAs7jUcKSIeUWxsqmfJ9lzYpSpJz4D7O/GwJul9SQfd+N0ksvKYB6700jdcBaAj0XfI2B2Np74XH/KxV3R6/ww5nk0LQWh5M78bN95ksZvV6p5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrD9+Fas; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742919275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HnRLG9xVvPIADBKT198ZOyHaoYN/0FEtBZPtkKvLk5A=;
	b=LrD9+FasptYG/HBqeTmbX8i24+9fQX9Y99ooLBwbYHWyzfNt7UY4Tesom5wJuQ74f3T0b1
	esg+DlDOCyN/X6sgmrD/JxUoDodZkco1DOZuC2SIj5uA6vh8qJJ4N9QQt9RxvcRE8N9/jl
	wKt8SWCGm8yif7QZrfYqJeEK1+pwsPM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-GlI1KpqfOAGeAHexR1Xpuw-1; Tue,
 25 Mar 2025 12:14:32 -0400
X-MC-Unique: GlI1KpqfOAGeAHexR1Xpuw-1
X-Mimecast-MFC-AGG-ID: GlI1KpqfOAGeAHexR1Xpuw_1742919270
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F1DC518BAF5D;
	Tue, 25 Mar 2025 16:14:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB2D7180B48D;
	Tue, 25 Mar 2025 16:14:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 6/8] platform/x86: int3472: Prepare for registering more then 1 GPIO regulator
Date: Tue, 25 Mar 2025 17:13:38 +0100
Message-ID: <20250325161340.342192-7-hdegoede@redhat.com>
In-Reply-To: <20250325161340.342192-1-hdegoede@redhat.com>
References: <20250325161340.342192-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Prepare the discrete code for registering more then 1 GPIO regulator.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 26 ++++++++++++-------
 drivers/platform/x86/intel/int3472/common.h   | 20 ++++++++------
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 459dbb2cd68a..93033ced8633 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -195,12 +195,17 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	struct regulator_config cfg = { };
 	int i, j;
 
+	if (int3472->n_regulators >= INT3472_MAX_REGULATORS) {
+		dev_err(int3472->dev, "Too many regulators mapped\n");
+		return -EINVAL;
+	}
+
 	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
 		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
 		return -EOVERFLOW;
 	}
 
-	regulator = &int3472->regulator;
+	regulator = &int3472->regulators[int3472->n_regulators];
 	string_upper(regulator->supply_name_upper, supply_name);
 
 	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
@@ -218,28 +223,29 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
-	init_data.consumer_supplies = int3472->regulator.supply_map;
+	init_data.consumer_supplies = regulator->supply_map;
 	init_data.num_consumer_supplies = j;
 
 	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
 		 acpi_dev_name(int3472->adev), supply_name);
 
-	int3472->regulator.rdesc = INT3472_REGULATOR(
-						int3472->regulator.regulator_name,
-						&int3472_gpio_regulator_ops);
+	regulator->rdesc = INT3472_REGULATOR(regulator->regulator_name,
+					     &int3472_gpio_regulator_ops);
 
 	cfg.dev = &int3472->adev->dev;
 	cfg.init_data = &init_data;
 	cfg.ena_gpiod = gpio;
 
-	int3472->regulator.rdev = regulator_register(int3472->dev,
-						     &int3472->regulator.rdesc,
-						     &cfg);
+	regulator->rdev = regulator_register(int3472->dev, &regulator->rdesc, &cfg);
+	if (IS_ERR(regulator->rdev))
+		return PTR_ERR(regulator->rdev);
 
-	return PTR_ERR_OR_ZERO(int3472->regulator.rdev);
+	int3472->n_regulators++;
+	return 0;
 }
 
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472)
 {
-	regulator_unregister(int3472->regulator.rdev);
+	for (int i = 0; i < int3472->n_regulators; i++)
+		regulator_unregister(int3472->regulators[i].rdev);
 }
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index b0638c29d847..9f995028137b 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -25,6 +25,7 @@
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
+#define INT3472_MAX_REGULATORS					3
 
 #define GPIO_SUPPPLY_NAME_LENGTH				5
 #define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
@@ -76,6 +77,15 @@ struct int3472_discrete_quirks {
 	const char *avdd_second_sensor;
 };
 
+struct int3472_gpio_regulator {
+	/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
+	struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
+	char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
+	char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
+	struct regulator_dev *rdev;
+	struct regulator_desc rdesc;
+};
+
 struct int3472_discrete_device {
 	struct acpi_device *adev;
 	struct device *dev;
@@ -84,14 +94,7 @@ struct int3472_discrete_device {
 
 	const struct int3472_sensor_config *sensor_config;
 
-	struct int3472_gpio_regulator {
-		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
-		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
-		char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
-		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
-		struct regulator_dev *rdev;
-		struct regulator_desc rdesc;
-	} regulator;
+	struct int3472_gpio_regulator regulators[INT3472_MAX_REGULATORS];
 
 	struct int3472_clock {
 		struct clk *clk;
@@ -113,6 +116,7 @@ struct int3472_discrete_device {
 
 	unsigned int ngpios; /* how many GPIOs have we seen */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
+	unsigned int n_regulators; /* how many have we mapped to a regulator */
 	struct gpiod_lookup_table gpios;
 };
 
-- 
2.49.0



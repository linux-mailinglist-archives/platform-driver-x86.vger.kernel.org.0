Return-Path: <platform-driver-x86+bounces-11083-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC2A8B964
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Apr 2025 14:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3FC5169541
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Apr 2025 12:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D5386342;
	Wed, 16 Apr 2025 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P75XmQeq"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C2435971
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807286; cv=none; b=ctFIZLisiDb3ZFm15iPa6iCP9J/4ZZVNkXI5OTpAd+pZIR9LHNTkNIxaDzKDIINYaMklMAcKtwagBdS3sVYW6ZL+1fd6w0u1K9v8Ye+qDe9HltCRHA5zAq8Rj8Z3S74G/hBCgXB63nApO5+naSHbwb7oLZRnyaJxdDmVUsAiql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807286; c=relaxed/simple;
	bh=BQnBUpqV1bEXqQgMgtM4rnFuFLMF8ErqQ/UlMIWkmdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YI32id2hHh+Rm95c+QGpFy2aMcBVmeMoOWBIIVa3xgbarl+oAbejCPZ+eo06/SABwtqA905MpWOMCytUSz+0t5/vUxVg1Q4R48Y+I6EknGqVt+FUDUTruikRbkV3XZn1DntgjsFKrmmQ+VQFdE0xt8Ar0X0Aa+xToH9OSIxhq2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P75XmQeq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gKumbbTGCxAYpcBh9bEatQixUpU+Kg0SOeepNsH4tic=;
	b=P75XmQeqhEVZyX6MsaYneTzsk/J0fCm4Z3cOXSUW+dtwUMPcmiXDbXDdefARziAxKMdy2t
	eGbe9u89NqZ94CLn8auC1g4Mkadjt7c7hacd+2caRA6AnjIhVw/0qdDGdkSY+Ze2hPA25V
	kA6LEvITmVyQw+yvWlJpPBV4bsO43mw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-cycpsH3oMsWv-4pGMU6kjg-1; Wed,
 16 Apr 2025 08:41:19 -0400
X-MC-Unique: cycpsH3oMsWv-4pGMU6kjg-1
X-Mimecast-MFC-AGG-ID: cycpsH3oMsWv-4pGMU6kjg_1744807277
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8982F180087B;
	Wed, 16 Apr 2025 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D581D195608D;
	Wed, 16 Apr 2025 12:41:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 7/9] platform/x86: int3472: Prepare for registering more than 1 GPIO regulator
Date: Wed, 16 Apr 2025 14:40:35 +0200
Message-ID: <20250416124037.90508-8-hdegoede@redhat.com>
In-Reply-To: <20250416124037.90508-1-hdegoede@redhat.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Prepare the discrete code for registering more than 1 GPIO regulator.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- s/n_regulators/n_regulator_gpios/
---
 .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++-------
 drivers/platform/x86/intel/int3472/common.h   | 20 +++++++++++-------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index b4af17e8dcaf..4f6e119394d7 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -196,12 +196,17 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	struct regulator_config cfg = { };
 	int i, j;
 
+	if (int3472->n_regulator_gpios >= INT3472_MAX_REGULATORS) {
+		dev_err(int3472->dev, "Too many regulators mapped\n");
+		return -EINVAL;
+	}
+
 	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
 		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
 		return -E2BIG;
 	}
 
-	regulator = &int3472->regulator;
+	regulator = &int3472->regulators[int3472->n_regulator_gpios];
 	string_upper(regulator->supply_name_upper, supply_name);
 
 	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
@@ -219,7 +224,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
-	init_data.consumer_supplies = int3472->regulator.supply_map;
+	init_data.consumer_supplies = regulator->supply_map;
 	init_data.num_consumer_supplies = j;
 
 	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
@@ -233,14 +238,16 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	cfg.init_data = &init_data;
 	cfg.ena_gpiod = gpio;
 
-	int3472->regulator.rdev = regulator_register(int3472->dev,
-						     &int3472->regulator.rdesc,
-						     &cfg);
+	regulator->rdev = regulator_register(int3472->dev, &regulator->rdesc, &cfg);
+	if (IS_ERR(regulator->rdev))
+		return PTR_ERR(regulator->rdev);
 
-	return PTR_ERR_OR_ZERO(int3472->regulator.rdev);
+	int3472->n_regulator_gpios++;
+	return 0;
 }
 
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472)
 {
-	regulator_unregister(int3472->regulator.rdev);
+	for (int i = 0; i < int3472->n_regulator_gpios; i++)
+		regulator_unregister(int3472->regulators[i].rdev);
 }
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index c3b28424af6e..e88a22a6f81b 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -25,6 +25,7 @@
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
+#define INT3472_MAX_REGULATORS					3
 
 /* E.g. "avdd\0" */
 #define GPIO_SUPPPLY_NAME_LENGTH				5
@@ -88,6 +89,15 @@ struct int3472_discrete_quirks {
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
@@ -96,14 +106,7 @@ struct int3472_discrete_device {
 
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
@@ -125,6 +128,7 @@ struct int3472_discrete_device {
 
 	unsigned int ngpios; /* how many GPIOs have we seen */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
+	unsigned int n_regulator_gpios; /* how many have we mapped to a regulator */
 	struct gpiod_lookup_table gpios;
 };
 
-- 
2.49.0



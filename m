Return-Path: <platform-driver-x86+bounces-11082-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53BA8B962
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Apr 2025 14:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE956188D141
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Apr 2025 12:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DC7132122;
	Wed, 16 Apr 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HE0dcx9C"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC934CF5
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807280; cv=none; b=WQVYzvbtU7iIubJnl0Os6Ukxy/erBUxuuyEXn+Vx+Q4T8gOkrCd3ksV6p/6WEhtiErd/+PAfrMcO44EAsJwzdr5DbNE7HgVc0EnFqR+8wnprLsmvdaL8r3FP22Io3SEzqkvBhrsnQLn/BiEtOb6lSFXvxZkrEoainsQLApW0AQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807280; c=relaxed/simple;
	bh=JAz81X/F8354Xr/1oCkOgaT/XUdcA5ZHBtj80xFuyTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIoXfKvENHcQDNbp7vV9sR8gFPlhfnC0UF6rbG/ogCnHl2lVLMLIma2IfKybzI2zpd6VeOMc8ldNqGSRVFPHAE4aHuTeApOfRk5AtMZk+pCKDXnf2kfRHUAUyh/3bsBhqr0+NGinfcTjWgvrC3LUUC18/83wTixZZ0+XSeWlCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HE0dcx9C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+LAEEz8GGbkt7txvvlRqdicVV8q4UoQUCxkkL/cya8=;
	b=HE0dcx9CU4dtTge9hnLcx+5LHf5cluqht75HuryHanNU99FyA78MrcZVK4PT8mOyfOkKau
	eu/rT5y4+UnFnoGc2xUv+V5jkqGgNuqEHjieIy2x7V7q7eB52yL3jyuoYeKRPy9oNVKg9W
	CyZiL4F+6xXiz5Gh3zoy2JyvUsfI2K0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-4Btrc8SiMEaTyU-0K_pp6w-1; Wed,
 16 Apr 2025 08:41:15 -0400
X-MC-Unique: 4Btrc8SiMEaTyU-0K_pp6w-1
X-Mimecast-MFC-AGG-ID: 4Btrc8SiMEaTyU-0K_pp6w_1744807273
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B388180010A;
	Wed, 16 Apr 2025 12:41:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6FAB195608D;
	Wed, 16 Apr 2025 12:41:09 +0000 (UTC)
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
Subject: [PATCH v3 6/9] platform/x86: int3472: Avoid GPIO regulator spikes
Date: Wed, 16 Apr 2025 14:40:34 +0200
Message-ID: <20250416124037.90508-7-hdegoede@redhat.com>
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

Avoid the GPIO controlling the avdd regulator being driven low or high
for a very short time leading to spikes by adding an enable delay of 2 ms
and a minimum off to on delay of also 2 ms.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Add a comment to the defines int3472/common.h explaining where the 2 ms
  comes from
---
 .../platform/x86/intel/int3472/clk_and_regulator.c  |  7 ++++---
 drivers/platform/x86/intel/int3472/common.h         | 13 ++++++++++++-
 drivers/platform/x86/intel/int3472/discrete.c       |  4 +++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index a08b953b597a..b4af17e8dcaf 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -187,6 +187,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   unsigned int enable_time,
 				   const char *supply_name,
 				   const char *second_sensor)
 {
@@ -224,9 +225,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
 		 acpi_dev_name(int3472->adev), supply_name);
 
-	int3472->regulator.rdesc = INT3472_REGULATOR(
-						int3472->regulator.regulator_name,
-						&int3472_gpio_regulator_ops);
+	regulator->rdesc = INT3472_REGULATOR(regulator->regulator_name,
+					     &int3472_gpio_regulator_ops,
+					     enable_time, GPIO_REGULATOR_OFF_ON_DELAY);
 
 	cfg.dev = &int3472->adev->dev;
 	cfg.init_data = &init_data;
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index b750a309ee16..c3b28424af6e 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -32,17 +32,27 @@
 #define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
 /* lower- and upper-case mapping */
 #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
+/*
+ * Ensure the GPIO is driven low/high for at least 2 ms before changing.
+ *
+ * 2 ms has been chosen because it is the minimum time ovXXXX sensors need to
+ * have their reset line driven logical high to properly register a reset.
+ */
+#define GPIO_REGULATOR_ENABLE_TIME				(2 * USEC_PER_MSEC)
+#define GPIO_REGULATOR_OFF_ON_DELAY				(2 * USEC_PER_MSEC)
 
 #define INT3472_LED_MAX_NAME_LEN				32
 
 #define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
 
-#define INT3472_REGULATOR(_name, _ops)				\
+#define INT3472_REGULATOR(_name, _ops, _enable_time, _off_on_delay) \
 	(const struct regulator_desc) {				\
 		.name = _name,					\
 		.type = REGULATOR_VOLTAGE,			\
 		.ops = _ops,					\
 		.owner = THIS_MODULE,				\
+		.enable_time = _enable_time,			\
+		.off_on_delay = _off_on_delay,			\
 	}
 
 #define to_int3472_clk(hw)					\
@@ -134,6 +144,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   unsigned int enable_time,
 				   const char *supply_name,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f6dae82739e5..a2db4fae0e6d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -311,7 +311,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			ret = skl_int3472_register_regulator(int3472, gpio, con_id,
+			ret = skl_int3472_register_regulator(int3472, gpio,
+							     GPIO_REGULATOR_ENABLE_TIME,
+							     con_id,
 							     int3472->quirks.avdd_second_sensor);
 			if (ret)
 				err_msg = "Failed to map regulator to sensor\n";
-- 
2.49.0



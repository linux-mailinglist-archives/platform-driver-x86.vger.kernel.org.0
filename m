Return-Path: <platform-driver-x86+bounces-11135-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51DA91A58
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Apr 2025 13:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90BB23BE953
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Apr 2025 11:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8400238C22;
	Thu, 17 Apr 2025 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4FpFE1N"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8C23814F
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888462; cv=none; b=qG94EBlTa3HwcHGOYpJZCOLzrd/LS6yyA0N/4Bk1q0DwNnBaJ3riUEUOsXQhLiU+54vHlWfIhN7nh+yhwmeC8u7zpljzMOMVaaTpdQBv1t1No0x69EFr3PEB9OgzRjq9S5BMjaPR4ewk6m63Cn7YHEigtcTKDOQnqvGBCbil8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888462; c=relaxed/simple;
	bh=9Pqv4lsCcy8j31avKT95eOF7DOAcHJpEGFfVfIDE2fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb5SIwPzVxUKLne3A3FVWaMuGGHlulO/B+tJJBzIFzywrz+UqE3qALjBmueCic2/CbxDcvZrJKb3sQHl50O5L34BWIaCuuuJ0MzdaeTmj9rEA1cO2pM7sakYEE/dQp9AhNNn82Cywwbb5afOgFSfzKvGEDvREVMHdjJSrwO4nvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4FpFE1N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744888457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Isioa2l6nxUeLsHPfGnYDLBRr0Pg9PTO8XS3qjgGg7U=;
	b=E4FpFE1NOmUKFSpi1oYKMAD6LAzxQk4vSqQNeY2tRpHnKQiCz+SgvSGN5qFH55OfHD7Mqo
	I4RibgGjd2rKh4h4XrHT3wEPiwQZ9YVvWFB0oWvRPyA7GTuaFCv6DNtIAGHH4eUXG2spci
	MW8F/Tx3AZOQJ9s/l4TaPABnzjFaA5s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-WB1W9JqHNFCZAMbQvWL5Xg-1; Thu,
 17 Apr 2025 07:14:14 -0400
X-MC-Unique: WB1W9JqHNFCZAMbQvWL5Xg-1
X-Mimecast-MFC-AGG-ID: WB1W9JqHNFCZAMbQvWL5Xg_1744888453
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C349A18001D5;
	Thu, 17 Apr 2025 11:14:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.7])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 54AD4180045C;
	Thu, 17 Apr 2025 11:14:09 +0000 (UTC)
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
Subject: [PATCH v4 6/9] platform/x86: int3472: Avoid GPIO regulator spikes
Date: Thu, 17 Apr 2025 13:13:34 +0200
Message-ID: <20250417111337.38142-7-hdegoede@redhat.com>
In-Reply-To: <20250417111337.38142-1-hdegoede@redhat.com>
References: <20250417111337.38142-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
index b7a1abc2919c..9f9f2c52e026 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -187,6 +187,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   unsigned int enable_time,
 				   const char *supply_name,
 				   const char *second_sensor)
 {
@@ -227,9 +228,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
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



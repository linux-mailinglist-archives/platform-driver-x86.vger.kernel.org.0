Return-Path: <platform-driver-x86+bounces-11137-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 132CBA91A52
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Apr 2025 13:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851EC19E511F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Apr 2025 11:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32807238D2E;
	Thu, 17 Apr 2025 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aXONy2iD"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8666E238147
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888471; cv=none; b=OCZNz12wSGM2HNDRupTKhaJ35KR+rN9XHvPa7Ojb9PRTe3+USRiI+CVM1zToJIW5MbaYxdQ9XbacQcFnR2Ym29HONpuB9xh1uMbrJPI0AuyrzozpM3DXM+IY3hJE7ac61/AxoCBhnAJb613zxul50BPN3xEUEOA+Ydw4pboCwSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888471; c=relaxed/simple;
	bh=69wn8HkIVTYm+j/kCuRtrse0u6eNczG36e/pbY8h/NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzBSI3VU1R77gb1UawmUSWsdHSR97FgwhiLHBzlB0XKkMYFdTaiv1+tPYQVq9yPz9GVed+Z5CmOPtpEXfhmL0SyN4RGr4joZFpy8WhWYCrw46+DLTePgQNiPaQiBx2rFX6uNaCARvP86yI83txW0Tfk9TbRKa0qrvXk1hDqIFwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aXONy2iD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744888465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Y4lc9+AomjcJoxuaSDmHbVB6ytTYBYkEPBKNmLGtF8=;
	b=aXONy2iD0KX8qUIZWlwqzweDv0jWp3v/RXXtN+fcpmdKBMr5hLnvodt0h8gCbEpjKROyWP
	SrVM7Lm5aD0m+1dvn5hpGfYEK2VSRnzMWe66ndhBOT63mkZ0Z7dwPzVoCki5VOnZ2GFN8+
	7+NyH+0fJlU0neY5M37nf+YHRuT8Oco=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-280-5tu5eUJbOSuEhxHeV2Jhdw-1; Thu,
 17 Apr 2025 07:14:22 -0400
X-MC-Unique: 5tu5eUJbOSuEhxHeV2Jhdw-1
X-Mimecast-MFC-AGG-ID: 5tu5eUJbOSuEhxHeV2Jhdw_1744888461
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3ECF19560B1;
	Thu, 17 Apr 2025 11:14:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.7])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4489818002AD;
	Thu, 17 Apr 2025 11:14:17 +0000 (UTC)
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
Subject: [PATCH v4 8/9] platform/x86: int3472: Add handshake pin support
Date: Thu, 17 Apr 2025 13:13:36 +0200
Message-ID: <20250417111337.38142-9-hdegoede@redhat.com>
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

New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
pin defined in the INT3472 sensor companion device which describes
the sensor's GPIOs.

This pin is primarily used on designs with a Lattice FPGA chip which is
capable of running the sensor independently of the main CPU for features
like presence detection. This pin needs to be driven high to make the FPGA
run the power-on sequence of the sensor. After driving the pin high,
the FPGA "firmware" needs 25ms to complete the power-on sequence.

Add support for this modelling the handshake pin as a GPIO driven "dvdd"
regulator with a 25 ms enable time. This model was chosen because:

1. Sensor chips don't have a handshake pin, so we need to abstract this
   in some way which does not require modification to the sensor drivers,
   sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
   is normal. So this will work to get the right value set to the handshake
   pin without requiring sensor driver modifications.

2. Sensors typically wait only a small time for the sensor to power-on
   after de-asserting reset. Not the 25ms the Lattice chip requires.
   Using the regulator framework's enable_time allows hiding the need for
   this delay from the sensor drivers.

Link: https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2341731
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Use unique error messages for power-enable vs handshake
  skl_int3472_register_regulator() failures
- Drop setting of constraints.enable_time. enable_time already gets set
  in struct regulator_desc (missed left-over from an older patch version)

Changes in v3:
- Small commitmsg improvements
---
 drivers/platform/x86/intel/int3472/common.h   |  1 +
 drivers/platform/x86/intel/int3472/discrete.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index e88a22a6f81b..56fb91dcc130 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -22,6 +22,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index a2db4fae0e6d..bcc7bb122a56 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
 		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_HANDSHAKE:
+		*con_id = "dvdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	default:
 		*con_id = "unknown";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -290,6 +294,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
+	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio)) {
 			ret = PTR_ERR(gpio);
@@ -316,7 +321,16 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 							     con_id,
 							     int3472->quirks.avdd_second_sensor);
 			if (ret)
-				err_msg = "Failed to map regulator to sensor\n";
+				err_msg = "Failed to map power-enable to sensor\n";
+
+			break;
+		case INT3472_GPIO_TYPE_HANDSHAKE:
+			/* Setups using a handshake pin need 25 ms enable delay */
+			ret = skl_int3472_register_regulator(int3472, gpio,
+							     25 * USEC_PER_MSEC,
+							     con_id, NULL);
+			if (ret)
+				err_msg = "Failed to map handshake to sensor\n";
 
 			break;
 		default: /* Never reached */
-- 
2.49.0



Return-Path: <platform-driver-x86+bounces-4850-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A230E95226F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Aug 2024 21:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CE9828342E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Aug 2024 19:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B0D1BE234;
	Wed, 14 Aug 2024 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jycn1H/W"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C51BE258
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662140; cv=none; b=YV+kAVF5A/u9X+gnITdm9J7LXDSmgrDpsFxWcV0L0gbyqG8NYoWt3axSlTtIblCC8gcu/lbq5iMcXeT+NW/p1s7R7LzdkN5CdWgjtap+Vz6B8h0w+Ad2VzYn9HOPdfqGqLaFP4CZ7KD+sN1iZutsOw+TDUHO1suteB4V+z8wOTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662140; c=relaxed/simple;
	bh=YycQpJWyhxScbHq2pW8ucYKq+biS52IxM0khc45t9M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMr25Z0YoaW7HkubXYaIk89aOPLC2pLSmptt9BTew8rPRQiKn1MfxdpkXD6p0l53DDA9qWreMrFgl9vOKi+NFa2+DIhRA0LvcrWd0W6DPXV6j2vuRudvBziaZYtvFXX5ow5XYJ51roPFGQCHr0N3QkJT8omA+F+KrDnrM8uTmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jycn1H/W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723662138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aitqo/e8h8sOVoD29qX08D/PX+903Imz6b8hBT9MSkY=;
	b=Jycn1H/WFDGmADEQcS8e8Uec+IirbGJTRAcsmv87F7c1RugEJOavcdjt+6JAnQFNcPaPVL
	x5YU62CAwMcSvk082gTH/hVKJzlDync2HXf/XySoNcrk15u/4LAGmlTRD5/EQ4EypD9Uma
	OIHvlK/PAE1pcamYIc8+NKWwFiX6/MM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-_fweJcyiPi6Po87xTtNMUQ-1; Wed,
 14 Aug 2024 15:02:13 -0400
X-MC-Unique: _fweJcyiPi6Po87xTtNMUQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B37C1913799;
	Wed, 14 Aug 2024 19:02:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.22])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8CAFE1955F35;
	Wed, 14 Aug 2024 19:02:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: dell-uart-backlight: Use acpi_video_get_backlight_type()
Date: Wed, 14 Aug 2024 21:01:58 +0200
Message-ID: <20240814190159.15650-3-hdegoede@redhat.com>
In-Reply-To: <20240814190159.15650-1-hdegoede@redhat.com>
References: <20240814190159.15650-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The dell-uart-backlight driver supports backlight control on Dell All In
One (AIO) models using a backlight controller board connected to an UART.

In DSDT this uart port will be defined as:

   Name (_HID, "DELL0501")
   Name (_CID, EisaId ("PNP0501")

Now the first AIO has turned up which has not only the DSDT bits for this,
but also an actual controller attached to the UART, yet it is not using
this controller for backlight control.

Use the acpi_video_get_backlight_type() function from the ACPI video-detect
code to check if the dell-uart-backlight driver should actually be used.
This allows reusing the existing ACPI video-detect infra to override
the backlight control method on the commandline or with DMI quirks.

Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/Kconfig               | 1 +
 drivers/platform/x86/dell/dell-uart-backlight.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index f711c59fcf1b..11c2cb7d05b0 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -162,6 +162,7 @@ config DELL_SMO8800
 config DELL_UART_BACKLIGHT
 	tristate "Dell AIO UART Backlight driver"
 	depends on ACPI
+	depends on ACPI_VIDEO
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on SERIAL_DEV_BUS
 	help
diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index 87d2a20b4cb3..3995f90add45 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -20,6 +20,7 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/wait.h>
+#include <acpi/video.h>
 #include "../serdev_helpers.h"
 
 /* The backlight controller must respond within 1 second */
@@ -332,10 +333,17 @@ struct serdev_device_driver dell_uart_bl_serdev_driver = {
 
 static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
 {
+	enum acpi_backlight_type bl_type;
 	struct serdev_device *serdev;
 	struct device *ctrl_dev;
 	int ret;
 
+	bl_type = acpi_video_get_backlight_type();
+	if (bl_type != acpi_backlight_dell_uart) {
+		dev_dbg(&pdev->dev, "Not loading (ACPI backlight type = %d)\n", bl_type);
+		return -ENODEV;
+	}
+
 	ctrl_dev = get_serdev_controller("DELL0501", NULL, 0, "serial0");
 	if (IS_ERR(ctrl_dev))
 		return PTR_ERR(ctrl_dev);
-- 
2.46.0



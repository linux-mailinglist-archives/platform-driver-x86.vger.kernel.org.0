Return-Path: <platform-driver-x86+bounces-1429-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4B858691
	for <lists+platform-driver-x86@lfdr.de>; Fri, 16 Feb 2024 21:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67D661C21595
	for <lists+platform-driver-x86@lfdr.de>; Fri, 16 Feb 2024 20:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBDF1384A6;
	Fri, 16 Feb 2024 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KnfiGTGF"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ACD12FF60
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114657; cv=none; b=eL7dDjG+QH6Plj6nyMsx6MS6QvsLX+0gCjG8Q4rVNuJ/bnjpK/d62tMfK96G5GMFuKXbKSsmrDNhLeCgJOzkggXaTYDJy6LA/o80sD00K1mf0r63qYLa2xs7VnJ+hmOSFP1gr3SMcn0Lue+Ii7UzAO0oBhQiod6DIaqXjH7bF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114657; c=relaxed/simple;
	bh=jqLc3At4jb0AbuvL1BcHyJG8A0YmPKtRCKGfbRGj4ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXf/yYdCVfdeT2zbMHtnX0D51/g2vOf4FXNCF9+y0UdxMJ29pNFYVlYwpRJFfThu2U9wctNQpyfB7Bn5Cj1lEQ+n6nAdAYaompROQjk1LvA2WpV7b2C6KXENJfgTDp8CIe0/yBvjzwG4akVZ157PhuBUpz301ot4l2wG4OSwCBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KnfiGTGF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708114653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkE2oOQWi1wQC7hd5FJywI9KVF8bEEQnGmSJcm9uI2w=;
	b=KnfiGTGFkZgscq2CGLHbnGW1NcmpVdfKqf9gEBYjVoscb+8+ajp2msSKyb828fPlI2paZ4
	eOrdJkh+ytBJcXHbTdsFtFem0A6c1b5HO8+b2OQzXspwuUq4b9u1OpM62rNuSwuGE1H5GE
	59eHHHg2e6jzrrj39U36mtbfw8wqRVE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-V8VYuRq7MXCRvR3xroKwQQ-1; Fri,
 16 Feb 2024 15:17:31 -0500
X-MC-Unique: V8VYuRq7MXCRvR3xroKwQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C5593C0C497;
	Fri, 16 Feb 2024 20:17:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 886F32166AE8;
	Fri, 16 Feb 2024 20:17:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] platform/x86: x86-android-tablets: Fix keyboard touchscreen on Lenovo Yogabook1 X90
Date: Fri, 16 Feb 2024 21:17:18 +0100
Message-ID: <20240216201721.239791-2-hdegoede@redhat.com>
In-Reply-To: <20240216201721.239791-1-hdegoede@redhat.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

After commit 4014ae236b1d ("platform/x86: x86-android-tablets: Stop using
gpiolib private APIs") the touchscreen in the keyboard half of
the Lenovo Yogabook1 X90 stopped working with the following error:

 Goodix-TS i2c-goodix_ts: error -EBUSY: Failed to get irq GPIO

The problem is that when getting the IRQ for instantiated i2c_client-s
from a GPIO (rather then using an IRQ directly from the IOAPIC),
x86_acpi_irq_helper_get() now properly requests the GPIO, which disallows
other drivers from requesting it. Normally this is a good thing, but
the goodix touchscreen also uses the IRQ as an output during reset
to select which of its 2 possible I2C addresses should be used.

Add a new free_gpio flag to struct x86_acpi_irq_data to deal with this
and release the GPIO after getting the IRQ in this special case.

Fixes: 4014ae236b1d ("platform/x86: x86-android-tablets: Stop using gpiolib private APIs")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/core.c                | 3 +++
 drivers/platform/x86/x86-android-tablets/lenovo.c              | 1 +
 drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index f8221a15575b..f6547c9d7584 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -113,6 +113,9 @@ int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 		if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
 			irq_set_irq_type(irq, irq_type);
 
+		if (data->free_gpio)
+			devm_gpiod_put(&x86_android_tablet_device->dev, gpiod);
+
 		return irq;
 	case X86_ACPI_IRQ_TYPE_PMIC:
 		status = acpi_get_handle(NULL, data->chip, &handle);
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index f1c66a61bfc5..c297391955ad 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -116,6 +116,7 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.trigger = ACPI_EDGE_SENSITIVE,
 			.polarity = ACPI_ACTIVE_LOW,
 			.con_id = "goodix_ts_irq",
+			.free_gpio = true,
 		},
 	}, {
 		/* Wacom Digitizer in keyboard half */
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 49fed9410adb..468993edfeee 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -39,6 +39,7 @@ struct x86_acpi_irq_data {
 	int index;
 	int trigger;  /* ACPI_EDGE_SENSITIVE / ACPI_LEVEL_SENSITIVE */
 	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
+	bool free_gpio; /* Release GPIO after getting IRQ (for TYPE_GPIOINT) */
 	const char *con_id;
 };
 
-- 
2.43.0



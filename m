Return-Path: <platform-driver-x86+bounces-2819-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F238A6320
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Apr 2024 07:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1523B20D77
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Apr 2024 05:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B7E3BB30;
	Tue, 16 Apr 2024 05:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7xkJkSQ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8DC3B7AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 05:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713246006; cv=none; b=mmhbe8gFyjsWaaRPdvIsFAZoIIWCJwvKurS0lswIdDtehZkx0lDl6L6NDGqi2doJQ0gmKmkuIDT9Y6prvzwLk/OVrDipWqgDKM4R5q9j1wM3u4Q+weGqBtCprThnQy1ItsgV4rtCy6m0WDLEcDmDl7PV0v90EQ2/ZGhA4f1SMDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713246006; c=relaxed/simple;
	bh=+55S4oRIAMDdcjdwd2tMpXVDwAx0gM6uvk5BEebFs4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yp5+mhEAUdrQXGA/myhbuQ5firCqOcnukD0pbtmbsLt2KtgLrhlbUgu9rRFLdMVgBkYqMiHljBDNSYQWNTGSfjWB3TxHLHA2NDmA91RsFAUVWf9yJMGpB6eVaBO6l3zn3XJ76mqoTxIS51wIl+Lpvvi5UwOcCgXsDr1Uxin1QA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b7xkJkSQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713246004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PiGC8XIvz4znawb/VkO4X/ecJuSv6PcgzmcML1mcfEw=;
	b=b7xkJkSQQbRd1D5l8BRZC3RQ1NTHsLsd3VgP/xYZM0MVpizJrG9mBYWo7dfsL+kwNdDDGM
	S3J1hJwjL7GJ1D+C+CXMDGXuzFTUmBOSZL+Vo9oSB6IGAp2plhYotDxOvQYEWo8XCzJMgv
	pgQavyFGeLb3Dtv+c3YksTLsuWUR01I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-JBKYJeYDNgq3y42L4_wN0w-1; Tue,
 16 Apr 2024 01:40:01 -0400
X-MC-Unique: JBKYJeYDNgq3y42L4_wN0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E32163C000B2;
	Tue, 16 Apr 2024 05:40:00 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B15551EF;
	Tue, 16 Apr 2024 05:39:54 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v6 3/5] leds: rgb: leds-ktd202x: I2C ID tables for KTD2026 and 2027
Date: Tue, 16 Apr 2024 13:39:07 +0800
Message-ID: <20240416053909.256319-4-hpa@redhat.com>
In-Reply-To: <20240416053909.256319-1-hpa@redhat.com>
References: <20240416053909.256319-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

This table shows the maximum support LED channel for KTD2026 and KTD-2027.
The 3-channel LED controller KTD2026 controls R/G/B three LEDs. The
4-channel LED controller KTD2027 controls R/G/B and a flashing LEDs.

Link: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 8d0ed1a95a9f..2c47b0405961 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -609,6 +609,13 @@ static void ktd202x_shutdown(struct i2c_client *client)
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
 }
 
+static const struct i2c_device_id ktd202x_id[] = {
+	{"ktd2026", KTD2026_NUM_LEDS},
+	{"ktd2027", KTD2027_NUM_LEDS},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ktd202x_id);
+
 static const struct of_device_id ktd202x_match_table[] = {
 	{ .compatible = "kinetic,ktd2026", .data = (void *)KTD2026_NUM_LEDS },
 	{ .compatible = "kinetic,ktd2027", .data = (void *)KTD2027_NUM_LEDS },
@@ -623,7 +630,8 @@ static struct i2c_driver ktd202x_driver = {
 	},
 	.probe = ktd202x_probe,
 	.remove = ktd202x_remove,
-	.shutdown = ktd202x_shutdown
+	.shutdown = ktd202x_shutdown,
+	.id_table = ktd202x_id
 };
 module_i2c_driver(ktd202x_driver);
 
-- 
2.44.0



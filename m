Return-Path: <platform-driver-x86+bounces-3298-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B498C2ABF
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 May 2024 21:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B14D1F23E96
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 May 2024 19:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F6B4D13F;
	Fri, 10 May 2024 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQ1J3FnL"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDAB4D58A
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 May 2024 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715370031; cv=none; b=i5NgiA3jWsGjqqZa6hbE2VjQ7AZVjNfpylO+OzzMvdWb6SumGgv4zLmsmSdl0GPi/1I/xrTSEsXB141pjCpYrRqhzHlDpPDGhKxgnw5G4E+gHRn5U9asJN52CSwcKgaho7I+Ud/4tR6sHaRwdy56SSyMWjxy1KZtVHBUN7KJYkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715370031; c=relaxed/simple;
	bh=tDp8kB4Fxb+CaPt6qvuTykWT/fAJ1NUUGBv+ePfAosw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WN8RPMi9j0kL7sQPFZiRtCdtBh5o5/H6EgwoK4iyYGEExTQqJcFB6U95+zMQrnARLffg117Z4QfNcVfiS3XF1cHAZqBYx4m6q3/HbEEjg98r8v36CZd9Iz/GuMW4ChVxGeP2FaqX/0WtD7S3PyOuKYTrMSl8XJmcP77rc4hMXWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQ1J3FnL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715370026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUHkXCDxcY2pVGfvaOH44s8hgAZMHCTkcr+gYURoGoY=;
	b=KQ1J3FnLc4zwaBQgUw9lnJSPHXN+TOlCSiXHKaunNaD8jFAWKERJF/DYdffx0SMccFNndP
	VQuHu1ptp/Nkrg76GYIzC1vt/DQ7rfmhcxGzTOpGf2e+ZOH2gCC68DgG4xTVZBdZRPknws
	Tadrvlse4ADW7qG0fqw2X2bXqzy1t74=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-LV_eOQ1nMGWL7GDOHBXICQ-1; Fri, 10 May 2024 15:40:20 -0400
X-MC-Unique: LV_eOQ1nMGWL7GDOHBXICQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF13B800206;
	Fri, 10 May 2024 19:40:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3EA40D184;
	Fri, 10 May 2024 19:40:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/3] power: supply: power-supply-leds: Add activate() callback to triggers
Date: Fri, 10 May 2024 21:40:12 +0200
Message-ID: <20240510194012.138192-4-hdegoede@redhat.com>
In-Reply-To: <20240510194012.138192-1-hdegoede@redhat.com>
References: <20240510194012.138192-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Add an activate() callback to the power-supply LED triggers so that
the LED being activated will properly reflect the current power-supply
state for power-supply devices which are already fully registered
when the trigger gets activated.

This fixes e.g. wrong LED state (1) when the LED gets registered
after the power-supply device.

1) Until the psy driver has a reason to call power_supply_changed()
   which may take quite a while

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/power/supply/power_supply_leds.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/power/supply/power_supply_leds.c b/drivers/power/supply/power_supply_leds.c
index 634f7d33afd0..7ff6d41671b9 100644
--- a/drivers/power/supply/power_supply_leds.c
+++ b/drivers/power/supply/power_supply_leds.c
@@ -24,6 +24,16 @@ struct power_supply_led_trigger {
 	struct power_supply *psy;
 };
 
+static int power_supply_led_trigger_activate(struct led_classdev *led_cdev)
+{
+	struct power_supply_led_trigger *psy_trig =
+		container_of(led_cdev->trigger, struct power_supply_led_trigger, trig);
+
+	/* Sync current power-supply state to LED being activated */
+	power_supply_update_leds(psy_trig->psy);
+	return 0;
+}
+
 static int power_supply_register_led_trigger(struct power_supply *psy,
 					     const char *name_template,
 					     struct led_trigger **tp)
@@ -41,6 +51,7 @@ static int power_supply_register_led_trigger(struct power_supply *psy,
 		goto err_free_trigger;
 	}
 
+	psy_trig->trig.activate = power_supply_led_trigger_activate;
 	psy_trig->psy = psy;
 
 	err = led_trigger_register(&psy_trig->trig);
-- 
2.44.0



Return-Path: <platform-driver-x86+bounces-3297-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C158C2ABE
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 May 2024 21:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECE57B22481
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 May 2024 19:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A994D595;
	Fri, 10 May 2024 19:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rnvd7a3O"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED68487BE
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 May 2024 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715370030; cv=none; b=PBDGZSbYfrCIgkxPt1OgFlFw/jwriD5Em9l1LA7Oa9vUoxf0ZN+MvBtR3v0VgCS4b9dWmsFnL5Fc5hjYwnuiHBUT3KD4CBkkB7cEBgcigoS11Fj3R8sZbRsLYYtP3fKSunzk2TSR+9/l6OVZrwBl6sTM2VFQSegzqlmiF/E9T8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715370030; c=relaxed/simple;
	bh=GIPYvWRS1h9Oeo0cmI+5YIpwhF91vs3WtNHK30O5q5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOZyCuZae5IQpw/vnQOyZN1Fbu6LtN2ZL5iByhrJB05a3rdcswpTbL38WkLVIONzWh1nMj5fEji9J9Yv4gmm7gqaGKPx8xMW4WaKEEgprycLSbV3B3zkovcX4ESezm4ZqFE95+EUp/5lrPb+rWikh2gITKqnFnhXEqeGCaSBlFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rnvd7a3O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715370026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3xfg38y7Jv3qVLfkVJ9QKSJvbM3Zbt8n3bJThcrhns=;
	b=Rnvd7a3OvxYWhfemgHPMndEI8CVSsLMYS9Wfi5rlefcp+MxsQd2t7+fu47u4Zpk/uH9JwR
	hztZ1ZiehunLumE2kwjorfk2hfbzxl35KbHcxDUjMi+zNllcGJg58clpADngBX8Y9L4Fxn
	9SP+uD1EYKseBOc1NPsnEfPC7Zcm2Eo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-ocdO1fL9NFafiF-HTMI4xw-1; Fri, 10 May 2024 15:40:18 -0400
X-MC-Unique: ocdO1fL9NFafiF-HTMI4xw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59EA1101A554;
	Fri, 10 May 2024 19:40:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02FD140004D;
	Fri, 10 May 2024 19:40:16 +0000 (UTC)
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
Subject: [PATCH 2/3] power: supply: power-supply-leds: Share trig pointer for online and charging_full
Date: Fri, 10 May 2024 21:40:11 +0200
Message-ID: <20240510194012.138192-3-hdegoede@redhat.com>
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

Either 5 different LED triggers are registered for battery power-supply
devices or a single online LED trigger is used for non battery power-supply
devices.

These 5 / 1 LED trigger(s) are never used at the same time. So there is
no need for a separate LED trigger pointer for the online trigger. Rename
the first battery trigger from charging_full_trig to just trig and use this
for the online trigger too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/power/supply/power_supply_leds.c | 18 +++++++++---------
 include/linux/power_supply.h             |  3 +--
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/power/supply/power_supply_leds.c b/drivers/power/supply/power_supply_leds.c
index 3e20b0f30aa3..634f7d33afd0 100644
--- a/drivers/power/supply/power_supply_leds.c
+++ b/drivers/power/supply/power_supply_leds.c
@@ -83,7 +83,7 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
 
 	switch (status.intval) {
 	case POWER_SUPPLY_STATUS_FULL:
-		led_trigger_event(psy->charging_full_trig, LED_FULL);
+		led_trigger_event(psy->trig, LED_FULL);
 		led_trigger_event(psy->charging_trig, LED_OFF);
 		led_trigger_event(psy->full_trig, LED_FULL);
 		/* Going from blink to LED on requires a LED_OFF event to stop blink */
@@ -95,7 +95,7 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
 				     LED_FULL);
 		break;
 	case POWER_SUPPLY_STATUS_CHARGING:
-		led_trigger_event(psy->charging_full_trig, LED_FULL);
+		led_trigger_event(psy->trig, LED_FULL);
 		led_trigger_event(psy->charging_trig, LED_FULL);
 		led_trigger_event(psy->full_trig, LED_OFF);
 		led_trigger_blink(psy->charging_blink_full_solid_trig, 0, 0);
@@ -105,7 +105,7 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
 				     LED_FULL);
 		break;
 	default:
-		led_trigger_event(psy->charging_full_trig, LED_OFF);
+		led_trigger_event(psy->trig, LED_OFF);
 		led_trigger_event(psy->charging_trig, LED_OFF);
 		led_trigger_event(psy->full_trig, LED_OFF);
 		led_trigger_event(psy->charging_blink_full_solid_trig,
@@ -118,7 +118,7 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
 
 static void power_supply_remove_bat_triggers(struct power_supply *psy)
 {
-	power_supply_unregister_led_trigger(psy->charging_full_trig);
+	power_supply_unregister_led_trigger(psy->trig);
 	power_supply_unregister_led_trigger(psy->charging_trig);
 	power_supply_unregister_led_trigger(psy->full_trig);
 	power_supply_unregister_led_trigger(psy->charging_blink_full_solid_trig);
@@ -130,7 +130,7 @@ static int power_supply_create_bat_triggers(struct power_supply *psy)
 	int err = 0;
 
 	err |= power_supply_register_led_trigger(psy, "%s-charging-or-full",
-						 &psy->charging_full_trig);
+						 &psy->trig);
 	err |= power_supply_register_led_trigger(psy, "%s-charging",
 						 &psy->charging_trig);
 	err |= power_supply_register_led_trigger(psy, "%s-full",
@@ -163,19 +163,19 @@ static void power_supply_update_gen_leds(struct power_supply *psy)
 	dev_dbg(&psy->dev, "%s %d\n", __func__, online.intval);
 
 	if (online.intval)
-		led_trigger_event(psy->online_trig, LED_FULL);
+		led_trigger_event(psy->trig, LED_FULL);
 	else
-		led_trigger_event(psy->online_trig, LED_OFF);
+		led_trigger_event(psy->trig, LED_OFF);
 }
 
 static int power_supply_create_gen_triggers(struct power_supply *psy)
 {
-	return power_supply_register_led_trigger(psy, "%s-online", &psy->online_trig);
+	return power_supply_register_led_trigger(psy, "%s-online", &psy->trig);
 }
 
 static void power_supply_remove_gen_triggers(struct power_supply *psy)
 {
-	power_supply_unregister_led_trigger(psy->online_trig);
+	power_supply_unregister_led_trigger(psy->trig);
 }
 
 /* Choice what triggers to create&update. */
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index e218a8ab72ee..65082ef75692 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -309,10 +309,9 @@ struct power_supply {
 #endif
 
 #ifdef CONFIG_LEDS_TRIGGERS
-	struct led_trigger *charging_full_trig;
+	struct led_trigger *trig;
 	struct led_trigger *charging_trig;
 	struct led_trigger *full_trig;
-	struct led_trigger *online_trig;
 	struct led_trigger *charging_blink_full_solid_trig;
 	struct led_trigger *charging_orange_full_green_trig;
 #endif
-- 
2.44.0



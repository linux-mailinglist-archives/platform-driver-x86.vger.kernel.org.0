Return-Path: <platform-driver-x86+bounces-3652-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F598D60EB
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 May 2024 13:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68CEE1C23CF6
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 May 2024 11:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A2D157A7C;
	Fri, 31 May 2024 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GsnKOVtT"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F554157E86
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 May 2024 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717155707; cv=none; b=Oq8MDlB0VpCtvTMo/CwXnr/GRlVtw2AoGUjG5Qo9csDN00ILDmjZ1fNW4vZ+11h5JjnWwex8WAtyj9pFaJsC5IjhDfxFJ9muzvMIANeHG4OAsVA9tnMjVWISd/oG5Bjwg3qwZxFhDEttkoovspD+sHKwyxDwEWpqH/TaRE59SrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717155707; c=relaxed/simple;
	bh=/CeZO8P3yRa5P9DPXznYJiofXgqqSZbh6DS+WBO9nL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYzkCU5PTLOLfrZrlsnWWWeljf9SmEcMPW9bJoYRHWCcfQpieSnz6TH3AY5pXF2TRjpT47ZkaRPDnlVvgmEZYV4BPSlUZ6/kBIjIC0dwtLe2MAsGBj+CspFXtOWjgC2Xp4xkahA5kpSXHR7Xs0rCwIjfkJSZvJ903fHDZj0R9Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GsnKOVtT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717155705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFZrjXsSoHW+qJc7BEcaZV8+6at8h5OVnX/5Uq+p8GQ=;
	b=GsnKOVtTDYRKfWLN13/7GJgGDoRDY1Rk7yUzJ/sAw9+LAHHG3g0cSS67T+1ncnYwYhEST5
	xY62o2ClPJBGNXaEDEh7xR3/dt5hcqXTw+akB7evgFZOcKtv1jnxrhujW/dSa6VTk93cpV
	PmALnrvPSmBLoX2BaKYwXKwOU8zNozA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-MKuw0uvcM2O_4PMDiXQK_w-1; Fri,
 31 May 2024 07:41:41 -0400
X-MC-Unique: MKuw0uvcM2O_4PMDiXQK_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CEAB29AA381;
	Fri, 31 May 2024 11:41:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C18CD740F;
	Fri, 31 May 2024 11:41:39 +0000 (UTC)
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
	linux-pm@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v10 6/6] power: supply: power-supply-leds: Add charging_orange_full_green trigger for RGB LED
Date: Fri, 31 May 2024 13:41:24 +0200
Message-ID: <20240531114124.45346-7-hdegoede@redhat.com>
In-Reply-To: <20240531114124.45346-1-hdegoede@redhat.com>
References: <20240531114124.45346-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

From: Kate Hsuan <hpa@redhat.com>

Add a charging_orange_full_green LED trigger and the trigger is based on
led_mc_trigger_event() which can set an RGB LED when the trigger is
triggered. The LED will show orange when the battery status is charging.
The LED will show green when the battery status is full.

Link: https://lore.kernel.org/linux-leds/f40a0b1a-ceac-e269-c2dd-0158c5b4a1ad@gmail.com/
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Kate Hsuan <hpa@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
[hdegoede@redhat.com change color order to RGB]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/power/supply/power_supply_leds.c | 23 +++++++++++++++++++++++
 include/linux/power_supply.h             |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/power/supply/power_supply_leds.c b/drivers/power/supply/power_supply_leds.c
index c7db29d5fcb8..73935de844d9 100644
--- a/drivers/power/supply/power_supply_leds.c
+++ b/drivers/power/supply/power_supply_leds.c
@@ -22,6 +22,8 @@
 static void power_supply_update_bat_leds(struct power_supply *psy)
 {
 	union power_supply_propval status;
+	unsigned int intensity_green[3] = { 0, 255, 0 };
+	unsigned int intensity_orange[3] = { 255, 128, 0 };
 
 	if (power_supply_get_property(psy, POWER_SUPPLY_PROP_STATUS, &status))
 		return;
@@ -36,12 +38,20 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
 		/* Going from blink to LED on requires a LED_OFF event to stop blink */
 		led_trigger_event(psy->charging_blink_full_solid_trig, LED_OFF);
 		led_trigger_event(psy->charging_blink_full_solid_trig, LED_FULL);
+		led_mc_trigger_event(psy->charging_orange_full_green_trig,
+				     intensity_green,
+				     ARRAY_SIZE(intensity_green),
+				     LED_FULL);
 		break;
 	case POWER_SUPPLY_STATUS_CHARGING:
 		led_trigger_event(psy->charging_full_trig, LED_FULL);
 		led_trigger_event(psy->charging_trig, LED_FULL);
 		led_trigger_event(psy->full_trig, LED_OFF);
 		led_trigger_blink(psy->charging_blink_full_solid_trig, 0, 0);
+		led_mc_trigger_event(psy->charging_orange_full_green_trig,
+				     intensity_orange,
+				     ARRAY_SIZE(intensity_orange),
+				     LED_FULL);
 		break;
 	default:
 		led_trigger_event(psy->charging_full_trig, LED_OFF);
@@ -49,6 +59,8 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
 		led_trigger_event(psy->full_trig, LED_OFF);
 		led_trigger_event(psy->charging_blink_full_solid_trig,
 			LED_OFF);
+		led_trigger_event(psy->charging_orange_full_green_trig,
+			LED_OFF);
 		break;
 	}
 }
@@ -74,6 +86,11 @@ static int power_supply_create_bat_triggers(struct power_supply *psy)
 	if (!psy->charging_blink_full_solid_trig_name)
 		goto charging_blink_full_solid_failed;
 
+	psy->charging_orange_full_green_trig_name = kasprintf(GFP_KERNEL,
+		"%s-charging-orange-full-green", psy->desc->name);
+	if (!psy->charging_orange_full_green_trig_name)
+		goto charging_red_full_green_failed;
+
 	led_trigger_register_simple(psy->charging_full_trig_name,
 				    &psy->charging_full_trig);
 	led_trigger_register_simple(psy->charging_trig_name,
@@ -82,9 +99,13 @@ static int power_supply_create_bat_triggers(struct power_supply *psy)
 				    &psy->full_trig);
 	led_trigger_register_simple(psy->charging_blink_full_solid_trig_name,
 				    &psy->charging_blink_full_solid_trig);
+	led_trigger_register_simple(psy->charging_orange_full_green_trig_name,
+				    &psy->charging_orange_full_green_trig);
 
 	return 0;
 
+charging_red_full_green_failed:
+	kfree(psy->charging_blink_full_solid_trig_name);
 charging_blink_full_solid_failed:
 	kfree(psy->full_trig_name);
 full_failed:
@@ -101,10 +122,12 @@ static void power_supply_remove_bat_triggers(struct power_supply *psy)
 	led_trigger_unregister_simple(psy->charging_trig);
 	led_trigger_unregister_simple(psy->full_trig);
 	led_trigger_unregister_simple(psy->charging_blink_full_solid_trig);
+	led_trigger_unregister_simple(psy->charging_orange_full_green_trig);
 	kfree(psy->charging_blink_full_solid_trig_name);
 	kfree(psy->full_trig_name);
 	kfree(psy->charging_trig_name);
 	kfree(psy->charging_full_trig_name);
+	kfree(psy->charging_orange_full_green_trig_name);
 }
 
 /* Generated power specific LEDs triggers. */
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 8e5705a56b85..c852cc882501 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -319,6 +319,8 @@ struct power_supply {
 	char *online_trig_name;
 	struct led_trigger *charging_blink_full_solid_trig;
 	char *charging_blink_full_solid_trig_name;
+	struct led_trigger *charging_orange_full_green_trig;
+	char *charging_orange_full_green_trig_name;
 #endif
 };
 
-- 
2.45.1



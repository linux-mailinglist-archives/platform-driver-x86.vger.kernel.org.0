Return-Path: <platform-driver-x86+bounces-7711-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F779ED3EB
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Dec 2024 18:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6229160EA9
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Dec 2024 17:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0B81DE880;
	Wed, 11 Dec 2024 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LEFcJ3Sx"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4691FF1B4
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939127; cv=none; b=I1hgJkX5hCgo5mBrU/9td51ykMJuqbesW9LsMTrrezuw4ahvlmc6UeLZyaNTyMIgqiNLwbyuZU3zW9tdyKcVmBXN2ylDB4MHPTl8ivyPkKgbEbBm3Plp/u+5n9G2HmXDEl7pOdt5nYVhtmtkFLr0INgzH7tEGR/wCM1jUasjH3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939127; c=relaxed/simple;
	bh=TwI4kcw5E9dXvSi8E3cuhfIKNw9o/lb2MgRfPnYXifI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/2CWVxx8R8/RVAp3V7qyfIVCbCSFwOcbTm/MwiLgGB0ayLkWXcDX9iny7NknJBuY6MDhGo8OzDIlTXlSX8xMxv0FU3eJJGpyjTqZ4gGOMeMETw//K8Y2o9RunMY6VCh/Jd77oIfhfokHyuf+wJYL6dYe6daD5Qh7XdyJDl5wiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LEFcJ3Sx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733939124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNZ3RmF3vV/5HrOiNLwpkU5SzMysJ0TEKo30ECSVbhE=;
	b=LEFcJ3SxWtp/JO288bQOijXJF3EVwrkk9y7ifQa5MY73IpjydVo0wIWWjwHrAMgjyFkvLf
	SjVwMfP7F1frZWZAUlG+pTuQGiYHegkQ9hVZaam3k6F47+VXhybR0z78ELVkAMcETxMFQG
	yb9bJ/pamQGyJOtNjoxCXkSphjEFh38=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-QHu25gL-MUOOgUignDX3lg-1; Wed,
 11 Dec 2024 12:45:19 -0500
X-MC-Unique: QHu25gL-MUOOgUignDX3lg-1
X-Mimecast-MFC-AGG-ID: QHu25gL-MUOOgUignDX3lg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A7DE19560B6;
	Wed, 11 Dec 2024 17:45:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D2271956048;
	Wed, 11 Dec 2024 17:45:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 4/4] platform/x86: dell-laptop: Use power_supply_charge_types_show/_parse() helpers
Date: Wed, 11 Dec 2024 18:44:51 +0100
Message-ID: <20241211174451.355421-5-hdegoede@redhat.com>
In-Reply-To: <20241211174451.355421-1-hdegoede@redhat.com>
References: <20241211174451.355421-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Make battery_modes a map between tokens and enum power_supply_charge_type
values instead of between tokens and strings and use the new
power_supply_charge_types_show/_parse() helpers for show()/store()
to ensure that things are handled in the same way as in other drivers.

This also changes battery_supported_modes to be a bitmap of charge-types
(enum power_supply_charge_type values) rather then a bitmap of indices
into battery_modes[].

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 54 ++++++++++++-------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 5671bd0deee7..9a4cfcb8bbe0 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -103,15 +103,15 @@ static bool mute_led_registered;
 
 struct battery_mode_info {
 	int token;
-	const char *label;
+	enum power_supply_charge_type charge_type;
 };
 
 static const struct battery_mode_info battery_modes[] = {
-	{ BAT_PRI_AC_MODE_TOKEN,   "Trickle" },
-	{ BAT_EXPRESS_MODE_TOKEN,  "Fast" },
-	{ BAT_STANDARD_MODE_TOKEN, "Standard" },
-	{ BAT_ADAPTIVE_MODE_TOKEN, "Adaptive" },
-	{ BAT_CUSTOM_MODE_TOKEN,   "Custom" },
+	{ BAT_PRI_AC_MODE_TOKEN,   POWER_SUPPLY_CHARGE_TYPE_TRICKLE },
+	{ BAT_EXPRESS_MODE_TOKEN,  POWER_SUPPLY_CHARGE_TYPE_FAST },
+	{ BAT_STANDARD_MODE_TOKEN, POWER_SUPPLY_CHARGE_TYPE_STANDARD },
+	{ BAT_ADAPTIVE_MODE_TOKEN, POWER_SUPPLY_CHARGE_TYPE_ADAPTIVE },
+	{ BAT_CUSTOM_MODE_TOKEN,   POWER_SUPPLY_CHARGE_TYPE_CUSTOM },
 };
 static u32 battery_supported_modes;
 
@@ -2261,46 +2261,42 @@ static ssize_t charge_types_show(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
-	ssize_t count = 0;
+	enum power_supply_charge_type charge_type;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
-		bool active;
+		charge_type = battery_modes[i].charge_type;
 
-		if (!(battery_supported_modes & BIT(i)))
+		if (!(battery_supported_modes & BIT(charge_type)))
 			continue;
 
-		active = dell_battery_mode_is_active(battery_modes[i].token);
-		count += sysfs_emit_at(buf, count, active ? "[%s] " : "%s ",
-				battery_modes[i].label);
+		if (!dell_battery_mode_is_active(battery_modes[i].token))
+			continue;
+
+		return power_supply_charge_types_show(dev, battery_supported_modes,
+						      charge_type, buf);
 	}
 
-	/* convert the last space to a newline */
-	if (count > 0)
-		count--;
-	count += sysfs_emit_at(buf, count, "\n");
-
-	return count;
+	/* No active mode found */
+	return -EIO;
 }
 
 static ssize_t charge_types_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
-	bool matched = false;
-	int err, i;
+	int charge_type, err, i;
+
+	charge_type = power_supply_charge_types_parse(battery_supported_modes, buf);
+	if (charge_type < 0)
+		return charge_type;
 
 	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
-		if (!(battery_supported_modes & BIT(i)))
-			continue;
-
-		if (sysfs_streq(battery_modes[i].label, buf)) {
-			matched = true;
+		if (battery_modes[i].charge_type == charge_type)
 			break;
-		}
 	}
-	if (!matched)
-		return -EINVAL;
+	if (i == ARRAY_SIZE(battery_modes))
+		return -EIO;
 
 	err = dell_battery_set_mode(battery_modes[i].token);
 	if (err)
@@ -2430,7 +2426,7 @@ static u32 __init battery_get_supported_modes(void)
 
 	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
 		if (dell_smbios_find_token(battery_modes[i].token))
-			modes |= BIT(i);
+			modes |= BIT(battery_modes[i].charge_type);
 	}
 
 	return modes;
-- 
2.47.1



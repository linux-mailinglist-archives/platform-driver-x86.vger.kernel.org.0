Return-Path: <platform-driver-x86+bounces-3184-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEAF8BA210
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 May 2024 23:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FEAB1C20D66
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 May 2024 21:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36CA181BAB;
	Thu,  2 May 2024 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P1LxTsTN"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A871181D00
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 May 2024 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714684485; cv=none; b=Rvf2CI5d07ost/xBtnAXMogtjTF7vH01+FMjo4eHgklGzar6KOFQMkhvqRdL6DKDXmCh7SEByDKcybFsoU5YCmGo1uNlqT4AM2OxJ+HDxCHjIlgB9y8K8mq2b2w+2NzEloAcrWJJigFP0VnVI0nAD06Lh/bEvM/uqikzsgXpfLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714684485; c=relaxed/simple;
	bh=MMeAWbl4GerV19NWPVRdwyf5tL869ZhpN2F7AxLXf9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nq/7VxCg0CC0r5HnfCn3VNwO5yHhhFyJE4MVLe0zM7hzR3gXlqj9atchrSZArXJe7pVxL4CZvhDCkYumot3xpHnTfmTzpKN3aWOA5jQ32nNPwWhrlZQGZvo36FEBAd6Vro+WOEM6pzeDI/GHRz62gSYEQZ+6+eOp6qi0kK8OJws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P1LxTsTN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714684483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fukb6bdJnnF4Pi+8FCoy/hhI7DCgB2hnwu3U79wYpLI=;
	b=P1LxTsTNrcakwDs+nbk6coGJMLU1ZjLf4KuIW/1fLYavBDUtmYnHhf2Jrhk0NsiMA3Iow9
	Ac4po3bIhst/aHG5TAiY9/nhDsCHxz/A1G1FVEPi10SVLHyDKSfhoRrAO1c3yHdOes19Dz
	0npkdfT+PINhfi0fuF9cuX3yAKGnptg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-NjZF_RA3MwiSiG1SNdnzRw-1; Thu,
 02 May 2024 17:14:39 -0400
X-MC-Unique: NjZF_RA3MwiSiG1SNdnzRw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 982DE3C0256A;
	Thu,  2 May 2024 21:14:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44E7D492BC7;
	Thu,  2 May 2024 21:14:37 +0000 (UTC)
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
Subject: [PATCH v8 7/7] platform: x86-android-tablets: Xiaomi pad2 RGB LED fwnode updates
Date: Thu,  2 May 2024 23:14:25 +0200
Message-ID: <20240502211425.8678-8-hdegoede@redhat.com>
In-Reply-To: <20240502211425.8678-1-hdegoede@redhat.com>
References: <20240502211425.8678-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

From: Kate Hsuan <hpa@redhat.com>

Xiaomi pad2 RGB LED fwnode updates:

1. Set "label" instead "function" to change the LED classdev name from
   "rgb:indicator" to "i2c-ktd2026:rgb:indicator" to match the usual
   triplet name format for LED classdevs.

2. Set the trigger to the new "bq27520-0-charging-orange-full-green"
   powersupply trigger type for multi-color LEDs.

3. Put the fwnode link for red before green in ktd2026_node_group[] so that
   multi_index becomes "red green blue".

Signed-off-by: Kate Hsuan <hpa@redhat.com>
Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/other.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index ce487b3c972c..198ea894d071 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -609,8 +609,8 @@ static const struct software_node ktd2026_node = {
 static const struct property_entry ktd2026_rgb_led_props[] = {
 	PROPERTY_ENTRY_U32("reg", 0),
 	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
-	PROPERTY_ENTRY_STRING("function", "indicator"),
-	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging"),
+	PROPERTY_ENTRY_STRING("label", "i2c-ktd2026:rgb:indicator"),
+	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging-orange-full-green"),
 	{ }
 };
 
@@ -656,9 +656,9 @@ static const struct software_node ktd2026_red_led_node = {
 static const struct software_node *ktd2026_node_group[] = {
 	&ktd2026_node,
 	&ktd2026_rgb_led_node,
+	&ktd2026_red_led_node,
 	&ktd2026_green_led_node,
 	&ktd2026_blue_led_node,
-	&ktd2026_red_led_node,
 	NULL
 };
 
-- 
2.44.0



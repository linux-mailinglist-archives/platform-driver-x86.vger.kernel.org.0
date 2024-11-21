Return-Path: <platform-driver-x86+bounces-7211-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 325FD9D519A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Nov 2024 18:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D122E1F22342
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Nov 2024 17:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946BB1AF0A1;
	Thu, 21 Nov 2024 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jyk0mZFC"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500A1AB6C0;
	Thu, 21 Nov 2024 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209783; cv=none; b=GhkGxM5zFqgP3gNnx+uNQLZLelH4cJTXhak7v5Z59dReYVGdJcsFSvzHioFxM4D2dNu2zyUVjgK62RK85chq/fqhh71yF2Vq+1t/AJdjMOC4hPx8bobBYNLh4xcj4gM0wauLuYG0oHXWRxn9ONVA3pS4/ki2g1ABOUbjfAteoXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209783; c=relaxed/simple;
	bh=pICBVtaZg0n5UbIT/5BQPKYWqraIJQwrXAPwly/1lsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLTq2xYNvUUcKhSQK63IBKnROr4CzXXhKthzbnxYkbX2XuCUlJA3mLcRp94gGzdDIt9UX+9/W0lnrtv7odC71U2gND2EXLt2WdtlBJ+kn5XkHisy7VuOC26J7+w+DiXUdfo8iXU8M/K+KNUnBj5J8dgs1B8B5xqIw+OuVvY2uw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jyk0mZFC; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 849D92E0963A;
	Thu, 21 Nov 2024 19:22:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1732209778;
	bh=nIjR2p0YcBkL2caLKP7kGbNnMWaOSQpHKmr9UXjFGMg=; h=From:To:Subject;
	b=jyk0mZFCN3AlzgxqXnHx9+sIXZY525QfHl6fWv/1HzQ3MdLpxMcL3qRBNazW0xyGd
	 P3vQ1Jlt3BB9JiWHSYdGNwdnsSVSQ8/Eyd2qdq7Pu3UDxK7PDr8ELj5gIabHiW/f/I
	 t4XZVGMzjYIN0uHLtstsgD2ZqAhd0xwwMyXvr9F4=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Kyle Gospodnetich <me@kylegospodneti.ch>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC 06/13] acpi/x86: s2idle: rename Screen On/Off to Display On/Off
Date: Thu, 21 Nov 2024 18:22:31 +0100
Message-ID: <20241121172239.119590-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <173220977865.5739.5786625115036377066@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Microsoft and Intel use the term "Display" to refer to the _DSM 3,4
calls and the term "Screen" for the state ("Screen Off"). Currently,
the code uses "Screen On/Off" to name the variables, which is about
to become confusing as they become callbacks. To prepare for that,
rename the variables to "Display On/Off".

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/acpi/x86/s2idle.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index dd0b40b9bbe8..7391f87f3aa0 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -39,8 +39,8 @@ static const struct acpi_device_id lps0_device_ids[] = {
 #define ACPI_LPS0_DSM_UUID	"c4eb40a0-6cd2-11e2-bcfd-0800200c9a66"
 
 #define ACPI_LPS0_GET_DEVICE_CONSTRAINTS	1
-#define ACPI_LPS0_SCREEN_OFF	3
-#define ACPI_LPS0_SCREEN_ON	4
+#define ACPI_LPS0_DISPLAY_OFF	3
+#define ACPI_LPS0_DISPLAY_ON	4
 #define ACPI_LPS0_ENTRY		5
 #define ACPI_LPS0_EXIT		6
 #define ACPI_LPS0_MS_ENTRY      7
@@ -50,8 +50,8 @@ static const struct acpi_device_id lps0_device_ids[] = {
 #define ACPI_LPS0_DSM_UUID_AMD      "e3f32452-febc-43ce-9039-932122d37721"
 #define ACPI_LPS0_ENTRY_AMD         2
 #define ACPI_LPS0_EXIT_AMD          3
-#define ACPI_LPS0_SCREEN_OFF_AMD    4
-#define ACPI_LPS0_SCREEN_ON_AMD     5
+#define ACPI_LPS0_DISPLAY_OFF_AMD   4
+#define ACPI_LPS0_DISPLAY_ON_AMD    5
 
 static acpi_handle lps0_device_handle;
 static guid_t lps0_dsm_guid;
@@ -361,10 +361,10 @@ static const char *acpi_sleep_dsm_state_to_str(unsigned int state)
 {
 	if (lps0_dsm_func_mask_microsoft || !acpi_s2idle_vendor_amd()) {
 		switch (state) {
-		case ACPI_LPS0_SCREEN_OFF:
-			return "screen off";
-		case ACPI_LPS0_SCREEN_ON:
-			return "screen on";
+		case ACPI_LPS0_DISPLAY_OFF:
+			return "display off";
+		case ACPI_LPS0_DISPLAY_ON:
+			return "display on";
 		case ACPI_LPS0_ENTRY:
 			return "lps0 entry";
 		case ACPI_LPS0_EXIT:
@@ -376,10 +376,10 @@ static const char *acpi_sleep_dsm_state_to_str(unsigned int state)
 		}
 	} else {
 		switch (state) {
-		case ACPI_LPS0_SCREEN_ON_AMD:
-			return "screen on";
-		case ACPI_LPS0_SCREEN_OFF_AMD:
-			return "screen off";
+		case ACPI_LPS0_DISPLAY_ON_AMD:
+			return "display on";
+		case ACPI_LPS0_DISPLAY_OFF_AMD:
+			return "display off";
 		case ACPI_LPS0_ENTRY_AMD:
 			return "lps0 entry";
 		case ACPI_LPS0_EXIT_AMD:
@@ -552,12 +552,12 @@ int acpi_s2idle_prepare_late(void)
 	/* Screen off */
 	if (lps0_dsm_func_mask > 0)
 		acpi_sleep_run_lps0_dsm(acpi_s2idle_vendor_amd() ?
-					ACPI_LPS0_SCREEN_OFF_AMD :
-					ACPI_LPS0_SCREEN_OFF,
+					ACPI_LPS0_DISPLAY_OFF_AMD :
+					ACPI_LPS0_DISPLAY_OFF,
 					lps0_dsm_func_mask, lps0_dsm_guid);
 
 	if (lps0_dsm_func_mask_microsoft > 0)
-		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SCREEN_OFF,
+		acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_OFF,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
 
 	/* LPS0 entry */
@@ -626,12 +626,12 @@ void acpi_s2idle_restore_early(void)
 
 	/* Screen on */
 	if (lps0_dsm_func_mask_microsoft > 0)
-		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SCREEN_ON,
+		acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_ON,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
 	if (lps0_dsm_func_mask > 0)
 		acpi_sleep_run_lps0_dsm(acpi_s2idle_vendor_amd() ?
-					ACPI_LPS0_SCREEN_ON_AMD :
-					ACPI_LPS0_SCREEN_ON,
+						ACPI_LPS0_DISPLAY_ON_AMD :
+						ACPI_LPS0_DISPLAY_ON,
 					lps0_dsm_func_mask, lps0_dsm_guid);
 }
 
-- 
2.47.0



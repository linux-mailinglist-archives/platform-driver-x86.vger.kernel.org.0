Return-Path: <platform-driver-x86+bounces-2922-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A68ABFC0
	for <lists+platform-driver-x86@lfdr.de>; Sun, 21 Apr 2024 17:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D44F1C20A80
	for <lists+platform-driver-x86@lfdr.de>; Sun, 21 Apr 2024 15:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79F9199A1;
	Sun, 21 Apr 2024 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pe3NCHJJ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D3917BA2
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714340; cv=none; b=i1qc3i4pvNHg6K0w79FPsKzdwv7bRqRT4KXxR5DywJLJbMFkJuwPCNO8J2xTwwEAc4ypA2D3381XR8AUiIakPCyxBA8Dip4J06yzYITSH8J8Fc5Vh9SptmFzDe2CsSgsi6qBTZcoKbD5igNR4IvpSBM/Vv2585BOHPDA+xz3Xj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714340; c=relaxed/simple;
	bh=1Tn5sh1ZJJRmS1HwlGfr2a7zeR6zKF+kqoxAHqgw+DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFEwH4zQLfgAU8Sn2EcHiEqIn3WZC4hQ4B6Z79SaUx52SwLndvu3NgtqtgpNiWc8SmExWQetClc7ISD2dbxXDemhD2eZG9DyIz6+MGH3FfglKSOL6VJK2XDs95famOGN9o22QRACloA8jgzfjfUZrvogkxt8gsGD5UocgGIFKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pe3NCHJJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjRWtrTCZPjO/R9YCvR5OjpGKpxB8NsBR5wh8az0r/A=;
	b=Pe3NCHJJluQlV3LIxwqrbTB27eZtK2+9uR6XB5W9GRi9WjpN1J/gWW6iR+sS2Gl1viQQOl
	M3SGHIEBJcQU6zt2qoLBLHkueWXvwebh4nw6EkygITZmbuNhV4vE3SUnoaOzbNkPTFcFY1
	fJoY2av+DCg/vlhfUFqnttfxGDY5QhM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-PInweQSbMRaqrTV1Ztzfow-1; Sun,
 21 Apr 2024 11:45:33 -0400
X-MC-Unique: PInweQSbMRaqrTV1Ztzfow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7577A29AA3B7;
	Sun, 21 Apr 2024 15:45:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AF7F402482D;
	Sun, 21 Apr 2024 15:45:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Nitin Joshi <njoshi1@lenovo.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 04/24] platform/x86: thinkpad_acpi: Drop ignore_acpi_ev
Date: Sun, 21 Apr 2024 17:45:00 +0200
Message-ID: <20240421154520.37089-5-hdegoede@redhat.com>
In-Reply-To: <20240421154520.37089-1-hdegoede@redhat.com>
References: <20240421154520.37089-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Setting ignore_acpi_ev to true has the same result as setting
send_acpi_ev to false, so there is no need to have both.

Drop ignore_acpi_ev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 56 +++++++++-------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 007223fded30..bb6b880a5b50 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3755,9 +3755,7 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
 }
 
 /* 0x1000-0x1FFF: key presses */
-static bool hotkey_notify_hotkey(const u32 hkey,
-				 bool *send_acpi_ev,
-				 bool *ignore_acpi_ev)
+static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 {
 	unsigned int scancode = hkey & 0xfff;
 
@@ -3772,12 +3770,10 @@ static bool hotkey_notify_hotkey(const u32 hkey,
 		    scancode <= TP_ACPI_HOTKEYSCAN_ADAPTIVE_START) {
 			/* HKEY event 0x1001 is scancode 0x00 */
 			scancode--;
-			if (!(hotkey_source_mask & (1 << scancode))) {
+			if (!(hotkey_source_mask & (1 << scancode)))
 				tpacpi_input_send_key_masked(scancode);
-				*send_acpi_ev = false;
-			} else {
-				*ignore_acpi_ev = true;
-			}
+
+			*send_acpi_ev = false;
 			return true;
 		}
 		break;
@@ -3793,21 +3789,19 @@ static bool hotkey_notify_hotkey(const u32 hkey,
 }
 
 /* 0x2000-0x2FFF: Wakeup reason */
-static bool hotkey_notify_wakeup(const u32 hkey,
-				 bool *send_acpi_ev,
-				 bool *ignore_acpi_ev)
+static bool hotkey_notify_wakeup(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_WKUP_S3_UNDOCK: /* suspend, undock */
 	case TP_HKEY_EV_WKUP_S4_UNDOCK: /* hibernation, undock */
 		hotkey_wakeup_reason = TP_ACPI_WAKEUP_UNDOCK;
-		*ignore_acpi_ev = true;
+		*send_acpi_ev = false;
 		break;
 
 	case TP_HKEY_EV_WKUP_S3_BAYEJ: /* suspend, bay eject */
 	case TP_HKEY_EV_WKUP_S4_BAYEJ: /* hibernation, bay eject */
 		hotkey_wakeup_reason = TP_ACPI_WAKEUP_BAYEJ;
-		*ignore_acpi_ev = true;
+		*send_acpi_ev = false;
 		break;
 
 	case TP_HKEY_EV_WKUP_S3_BATLOW: /* Battery on critical low level/S3 */
@@ -3830,9 +3824,7 @@ static bool hotkey_notify_wakeup(const u32 hkey,
 }
 
 /* 0x4000-0x4FFF: dock-related events */
-static bool hotkey_notify_dockevent(const u32 hkey,
-				 bool *send_acpi_ev,
-				 bool *ignore_acpi_ev)
+static bool hotkey_notify_dockevent(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_UNDOCK_ACK:
@@ -3863,7 +3855,6 @@ static bool hotkey_notify_dockevent(const u32 hkey,
 	case TP_HKEY_EV_KBD_COVER_ATTACH:
 	case TP_HKEY_EV_KBD_COVER_DETACH:
 		*send_acpi_ev = false;
-		*ignore_acpi_ev = true;
 		return true;
 
 	default:
@@ -3872,9 +3863,7 @@ static bool hotkey_notify_dockevent(const u32 hkey,
 }
 
 /* 0x5000-0x5FFF: human interface helpers */
-static bool hotkey_notify_usrevent(const u32 hkey,
-				 bool *send_acpi_ev,
-				 bool *ignore_acpi_ev)
+static bool hotkey_notify_usrevent(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_PEN_INSERTED:  /* X61t: tablet pen inserted into bay */
@@ -3892,7 +3881,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
 	case TP_HKEY_EV_LID_OPEN:	/* Lid opened */
 	case TP_HKEY_EV_BRGHT_CHANGED:	/* brightness changed */
 		/* do not propagate these events */
-		*ignore_acpi_ev = true;
+		*send_acpi_ev = false;
 		return true;
 
 	default:
@@ -3904,9 +3893,7 @@ static void thermal_dump_all_sensors(void);
 static void palmsensor_refresh(void);
 
 /* 0x6000-0x6FFF: thermal alarms/notices and keyboard events */
-static bool hotkey_notify_6xxx(const u32 hkey,
-				 bool *send_acpi_ev,
-				 bool *ignore_acpi_ev)
+static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_THM_TABLE_CHANGED:
@@ -3953,14 +3940,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		/* key press events, we just ignore them as long as the EC
 		 * is still reporting them in the normal keyboard stream */
 		*send_acpi_ev = false;
-		*ignore_acpi_ev = true;
 		return true;
 
 	case TP_HKEY_EV_KEY_FN_ESC:
 		/* Get the media key status to force the status LED to update */
 		acpi_evalf(hkey_handle, NULL, "GMKS", "v");
 		*send_acpi_ev = false;
-		*ignore_acpi_ev = true;
 		return true;
 
 	case TP_HKEY_EV_TABLET_CHANGED:
@@ -3988,7 +3973,6 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 {
 	u32 hkey;
 	bool send_acpi_ev;
-	bool ignore_acpi_ev;
 	bool known_ev;
 
 	if (event != 0x80) {
@@ -4013,18 +3997,15 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 		}
 
 		send_acpi_ev = true;
-		ignore_acpi_ev = false;
 
 		switch (hkey >> 12) {
 		case 1:
 			/* 0x1000-0x1FFF: key presses */
-			known_ev = hotkey_notify_hotkey(hkey, &send_acpi_ev,
-						 &ignore_acpi_ev);
+			known_ev = hotkey_notify_hotkey(hkey, &send_acpi_ev);
 			break;
 		case 2:
 			/* 0x2000-0x2FFF: Wakeup reason */
-			known_ev = hotkey_notify_wakeup(hkey, &send_acpi_ev,
-						 &ignore_acpi_ev);
+			known_ev = hotkey_notify_wakeup(hkey, &send_acpi_ev);
 			break;
 		case 3:
 			/* 0x3000-0x3FFF: bay-related wakeups */
@@ -4045,19 +4026,16 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 			break;
 		case 4:
 			/* 0x4000-0x4FFF: dock-related events */
-			known_ev = hotkey_notify_dockevent(hkey, &send_acpi_ev,
-						&ignore_acpi_ev);
+			known_ev = hotkey_notify_dockevent(hkey, &send_acpi_ev);
 			break;
 		case 5:
 			/* 0x5000-0x5FFF: human interface helpers */
-			known_ev = hotkey_notify_usrevent(hkey, &send_acpi_ev,
-						 &ignore_acpi_ev);
+			known_ev = hotkey_notify_usrevent(hkey, &send_acpi_ev);
 			break;
 		case 6:
 			/* 0x6000-0x6FFF: thermal alarms/notices and
 			 *                keyboard events */
-			known_ev = hotkey_notify_6xxx(hkey, &send_acpi_ev,
-						 &ignore_acpi_ev);
+			known_ev = hotkey_notify_6xxx(hkey, &send_acpi_ev);
 			break;
 		case 7:
 			/* 0x7000-0x7FFF: misc */
@@ -4079,7 +4057,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 		}
 
 		/* netlink events */
-		if (!ignore_acpi_ev && send_acpi_ev) {
+		if (send_acpi_ev) {
 			acpi_bus_generate_netlink_event(
 					ibm->acpi->device->pnp.device_class,
 					dev_name(&ibm->acpi->device->dev),
-- 
2.44.0



Return-Path: <platform-driver-x86+bounces-3036-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D78B0982
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Apr 2024 14:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B0B28810E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Apr 2024 12:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3115B15B103;
	Wed, 24 Apr 2024 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQYNlQcB"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CA15B153
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961732; cv=none; b=mW7h6WkI1mP7TPdtbMpvt/mHLrvusO+tKdeCechkvOsFYd08ls3Yx1X4fl1YZryW5Y970m0c4RrtsW7B5DSUAKII8YwHCyRe16JxW8wU0VMhynpcf9XLOix1HJ+vVQklDaKkLX0C3dBReKeweyogC6ie2I7DdcJkjsNPGPONKdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961732; c=relaxed/simple;
	bh=pA3zs6ICMVFcv1q0KDhWKmoIAtVkp5nNeIKMYO7vOug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UitgUOo5FsEubyu5hW1REQ7ejH/hU7gigexSoWsN6J9JnyQlUJ2YVJr4ywfrGIB0y/cb93n9jmbOlnbzan6nRoPFhyyy44yCmFxKfQq8sIJj+B/pxa2VD10CNISYKYlhgkKLmKIcfdpjJBv2ucXv4HW6fiBsMQikcbRapelp89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQYNlQcB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuwwD+KTAfqJ+CY4F9iVqiDgMbPy75oW4icyRUiQ9/o=;
	b=EQYNlQcBGfaoPnzBeyD+N7zFWG/s0l8gC9KLr1tKxPBqnBO+EIciMEssRrDWo9IPQEwasC
	lL0gY/S9RGfPHQ/8gWl+5MvlyMuKVA3YnPXNpT6OikeUj1jnEQj0TcOvBzmLf8CT+XluJT
	6dHNJhG3U9Zv/H0SZMYkatrnX95SFyA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-z10U_yZVP5KqO6IxrAQCjA-1; Wed,
 24 Apr 2024 08:28:43 -0400
X-MC-Unique: z10U_yZVP5KqO6IxrAQCjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0175B3C0009A;
	Wed, 24 Apr 2024 12:28:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D139FC01595;
	Wed, 24 Apr 2024 12:28:41 +0000 (UTC)
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
Subject: [PATCH v2 05/24] platform/x86: thinkpad_acpi: Use tpacpi_input_send_key() in adaptive kbd code
Date: Wed, 24 Apr 2024 14:28:15 +0200
Message-ID: <20240424122834.19801-6-hdegoede@redhat.com>
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Use tpacpi_input_send_key() in adaptive_keyboard_hotkey_notify_hotkey()
instead of re-implementing it there.

Note this change will also result in a behavioral change, key presses on
the adaptive keyboard will now also send a EV_MSC event with the scancode,
just like all other hotkey presses already do. This is not a bug but
a feature.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index bb6b880a5b50..126e39367924 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3670,7 +3670,6 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 {
 	int current_mode = 0;
 	int new_mode = 0;
-	int keycode;
 
 	switch (scancode) {
 	case DFR_CHANGE_ROW:
@@ -3711,19 +3710,8 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 				scancode);
 			return false;
 		}
-		keycode = hotkey_keycode_map[scancode - FIRST_ADAPTIVE_KEY +
-					     TP_ACPI_HOTKEYSCAN_ADAPTIVE_START];
-		if (keycode != KEY_RESERVED) {
-			mutex_lock(&tpacpi_inputdev_send_mutex);
-
-			input_report_key(tpacpi_inputdev, keycode, 1);
-			input_sync(tpacpi_inputdev);
-
-			input_report_key(tpacpi_inputdev, keycode, 0);
-			input_sync(tpacpi_inputdev);
-
-			mutex_unlock(&tpacpi_inputdev_send_mutex);
-		}
+		tpacpi_input_send_key(scancode - FIRST_ADAPTIVE_KEY +
+				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
 		return true;
 	}
 }
-- 
2.44.0



Return-Path: <platform-driver-x86+bounces-3039-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE18B0988
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Apr 2024 14:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17E41B2631C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Apr 2024 12:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC5F15B0F6;
	Wed, 24 Apr 2024 12:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZxYcmnRU"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441362561B
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961735; cv=none; b=SC80yRUtef5RyY8wUxmxTcg9ELgUdplDrXbFAsXlsQEnzMQrnpsqWTGhyjWDKk0CMkoA0iDd2eu2ea7rgCQfRWDx7u7lQ4jHlzGFocD749A0JoShng1X86p4ql+i3ad/AMeWLnZemMqdaTpX01MpoF8cjxWnua6I9G5a6JtG4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961735; c=relaxed/simple;
	bh=dv8Rwy8TH4WIzk5Yt7ZaVdnJxI3SyNridraoh62d9yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7nsPJNi0v1CI+okQM0X33JeuCowVg0YGfPOaDHDFqG/LMixwQcRbDhkYfmXKfgKBSehz/lU04Wzvpo+6bx2yQmvm3FMUczdHxEjVt6KuUhbhbBXHEp/K3qLSizFAH7CXWWbrT+rv/mEYJ0YyuMs/RkAO60daA4W7tTMzUIRZns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZxYcmnRU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgfbFtYFNUM9RnvzEqVv1Q0J+WIxJOhE6A52Glxaa+c=;
	b=ZxYcmnRUJQU6ou7dlXJx4vC/7fv2Y14tRi+tQt+1IpU2vEsW0CbViGsgZz5uYwXzgRJQwZ
	656aH5/LAXJ/bhc8no/YiT1hpqi5Wqbfyte55pcVJtmq8NyVWjdQz9w7JEFDvPOi0dukvK
	b7jcPXeDflwv/X0BdV438QsG5a6D6dI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Z4BA7TeEMJ6AIUHEudGySg-1; Wed, 24 Apr 2024 08:28:50 -0400
X-MC-Unique: Z4BA7TeEMJ6AIUHEudGySg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B67E0811029;
	Wed, 24 Apr 2024 12:28:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91DD6C271B5;
	Wed, 24 Apr 2024 12:28:48 +0000 (UTC)
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
Subject: [PATCH v2 10/24] platform/x86: thinkpad_acpi: Move hotkey_user_mask check to tpacpi_input_send_key()
Date: Wed, 24 Apr 2024 14:28:20 +0200
Message-ID: <20240424122834.19801-11-hdegoede@redhat.com>
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Move hotkey_user_mask check to tpacpi_input_send_key(), this is
a preparation patch for further refactoring.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ba440213ae49..05c1a562f6a1 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2256,6 +2256,10 @@ static void tpacpi_input_send_key(const unsigned int scancode)
 {
 	const unsigned int keycode = hotkey_keycode_map[scancode];
 
+	if (scancode < TP_ACPI_HOTKEYSCAN_ADAPTIVE_START &&
+	    !(hotkey_user_mask & (1 << scancode)))
+		return;
+
 	if (keycode != KEY_RESERVED) {
 		mutex_lock(&tpacpi_inputdev_send_mutex);
 
@@ -2275,8 +2279,7 @@ static void tpacpi_input_send_key(const unsigned int scancode)
 static void tpacpi_input_send_key_masked(const unsigned int scancode)
 {
 	hotkey_driver_event(scancode);
-	if (hotkey_user_mask & (1 << scancode))
-		tpacpi_input_send_key(scancode);
+	tpacpi_input_send_key(scancode);
 }
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-- 
2.44.0



Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A468C1C701F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgEFMQi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 May 2020 08:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728079AbgEFMQi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 May 2020 08:16:38 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A34CC061A0F
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2020 05:16:38 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so904054pfc.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2020 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZuNvOFEH+tlEXKiJjOGGmk1/RDnJucmaveeVZh9sZQ=;
        b=aI8Wu5sFDjDGjtXvAR3WDas0MCZ9QoWJOJIUmJ5ttN1XSecGxucUVHBzv+89RGWY73
         aficIc2NXNNXDNF6WGCQMuQkLV2jb5OOK/ey8uP1Lydm0Y27B6rqYW5ILchwKNbB5Sza
         6DLQv9ScaOK4Bif/L616lgy2cXhuBBKeCa4QuYid1rnV7Ktata4OVWmF6HrxRFsk6N1Z
         U/S/cgcsrK00MrxxKeZDnlDDyQQ9yMRX1INcjqVsHkt1M8ObK+QRwAqjZFI8t88awrcS
         GkheiqvHYuQMcKlN6sn4nv1RFfV22aefdaA9AfAdqXAFGl86bYUVNQE1YjMI7aI/SwKu
         wUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WZuNvOFEH+tlEXKiJjOGGmk1/RDnJucmaveeVZh9sZQ=;
        b=TNWxEOKSvqMHDbFA1MxHiwZu9yZJIzh/LLYm1T1PQYATz/HvMOUR18/m3bKXTHhm0q
         tOTvDyQxIf098eJYfqmDMeqLqZLEW7VR9oHH+I+DbSO3RV4jRq8UUuNLb6Wsd2UUEtTg
         WXv0phfa/a8403BmQ/PMfoEgt0qmaI1A7GIWlVSS90KBTEXWbR9tzaw7slWpku3CGKIN
         xwHox93/5bTSGi8xM7vVjvaYGktX6vcXX2ncggBoIVaF64kIoBdtHMMUVs2rreR9hWzk
         jupZbTVV4FhXXLzFPDZkfuejOYQYKjcSX/zzI8P1BFo6bUY3qy/B8PiPlzwV32m6wi7F
         79Ew==
X-Gm-Message-State: AGi0PuZh6RvUZDv4XqRePpf62vgTseBB2twRUb5cESTeO/xJ4OFHEQ/G
        PsOGZbyiSnVLDoK6rkWYNSk=
X-Google-Smtp-Source: APiQypIHaL/OCr9BfinXJJ6OwPpwEDX30l0Gl7EhhA+VI5ibi69paBqOx+MypwoNhORc68/PWiPymg==
X-Received: by 2002:a62:65c3:: with SMTP id z186mr7810446pfb.46.1588767397759;
        Wed, 06 May 2020 05:16:37 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id i4sm1599965pgd.9.2020.05.06.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:16:35 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id 881C6248D12; Wed,  6 May 2020 21:16:33 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: [PATCH v3 1/2] [sony-laptop] SNC calls should handle BUFFER types
Date:   Wed,  6 May 2020 21:16:29 +0900
Message-Id: <20200506121630.72382-2-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200506121630.72382-1-malattia@linux.it>
References: <20200506121630.72382-1-malattia@linux.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mattia Dongili <malattia@linux.it>

After commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
objects for ASL create_field() operator") ACPICA creates buffers even
when new fields are small enough to fit into an integer.
Many SNC calls counted on the old behaviour.
Since sony-laptop already handles the INTEGER/BUFFER case in
sony_nc_buffer_call, switch sony_nc_int_call to use its more generic
function instead.

Fixes: 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer objects for ASL create_field() operator")
Reported-by: Dominik Mierzejewski <dominik@greysector.net>
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207491
Reported-by: William Bader <williambader@hotmail.com>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1830150
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 43 +++++++++---------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 51309f7ceede..425707e8d188 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -757,33 +757,6 @@ static union acpi_object *__call_snc_method(acpi_handle handle, char *method,
 	return result;
 }
 
-static int sony_nc_int_call(acpi_handle handle, char *name, int *value,
-		int *result)
-{
-	union acpi_object *object = NULL;
-	if (value) {
-		u64 v = *value;
-		object = __call_snc_method(handle, name, &v);
-	} else
-		object = __call_snc_method(handle, name, NULL);
-
-	if (!object)
-		return -EINVAL;
-
-	if (object->type != ACPI_TYPE_INTEGER) {
-		pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
-				ACPI_TYPE_INTEGER, object->type);
-		kfree(object);
-		return -EINVAL;
-	}
-
-	if (result)
-		*result = object->integer.value;
-
-	kfree(object);
-	return 0;
-}
-
 #define MIN(a, b)	(a > b ? b : a)
 static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 		void *buffer, size_t buflen)
@@ -795,7 +768,9 @@ static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 	if (!object)
 		return -EINVAL;
 
-	if (object->type == ACPI_TYPE_BUFFER) {
+	if (!buffer) {
+		// do nothing
+	} else if (object->type == ACPI_TYPE_BUFFER) {
 		len = MIN(buflen, object->buffer.length);
 		memcpy(buffer, object->buffer.pointer, len);
 
@@ -804,8 +779,7 @@ static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 		memcpy(buffer, &object->integer.value, len);
 
 	} else {
-		pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
-				ACPI_TYPE_BUFFER, object->type);
+		pr_warn("Unexpected acpi_object: 0x%x\n", object->type);
 		ret = -EINVAL;
 	}
 
@@ -813,6 +787,15 @@ static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 	return ret;
 }
 
+static int sony_nc_int_call(acpi_handle handle, char *name, int *value, int
+		*result)
+{
+	if (result)
+		*result = 0;
+	return sony_nc_buffer_call(handle, name, (u64 *)value, result,
+			sizeof(*result));
+}
+
 struct sony_nc_handles {
 	u16 cap[0x10];
 	struct device_attribute devattr;
-- 
2.25.1


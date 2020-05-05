Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1041C52D6
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 12:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgEEKPz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 06:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728663AbgEEKPz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 06:15:55 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FA0C061A41
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 03:15:53 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h11so630349plr.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wXZBeis5IIoGnsyyD6tnO5zVfw/q2kwwMwp2dqUqkLk=;
        b=fXnFqxbG9x2fvGg65JG3kIhJzPBWN1EtEtgiKR1wiZ1SPLIW6HaOtM1HNrbTGNeTcW
         ReHi0cOgllhkZiwRKsNOw/emBCM9IL9tGJMDTqoOt1/QD+6tYGSG1SMaz4fch9xJLumg
         NUCy9hIIExJZpB/l44Xd9CN+tLjIkrTV26WDwa662FPve4FAG+AD44wWuXcMSCXqZpWv
         Ujjxr37vbbAftTIlh4OONmFSjP93eu+eEdw8YaEWRBY7pjD/MsHUS8yuQBQ+3lSWqZjB
         dZbXAAzbdsLheP1gcO2JNzoDfa6eonj8EDzFy66nMeCpxtIBf1xB+CKe108pazhajoZf
         ra/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wXZBeis5IIoGnsyyD6tnO5zVfw/q2kwwMwp2dqUqkLk=;
        b=ebvji5KYOomLsoOCcYcew7hYUihWyb8js2EYuXPdfqd/bXv7w8+0mWhbUrXe4PD29+
         IhBJ4bvJ/k3Y0lvK2msb7GtT+Pk4Jl54axO9UruVU+eQRPSQu0enFT9dCmZqdXBX5SKq
         ynY0zdpu1JQQoJxM5uk/xwroA6RnvLMRzAGv2TGiP80aEmf19G/Sk/1JlOCtWzR/0Gnk
         SloB5NJPpOR3oY4qqmyivUjvX9Flyeqhs/kLPDKcQKQFd3fTF0TOFZMGz9M3E1xOuEPu
         ppKEPTlQaPNzm7xgs1vJKOpfl4WD2er8ZuW788FWC2gOhC6Usf/rmeGUecMgHA7X2GAz
         Ghmg==
X-Gm-Message-State: AGi0PuZUfrR2Zv5Vfcipc+Lc5Yq5rDXOViC7KJqazIs5QZShP/4snFCo
        5fCyWlmUc65mPLzuwMFJe9Wk2Z5GirCIsQ==
X-Google-Smtp-Source: APiQypKn0QJiNmfqN94z1+mbfrJzCmi14RCcQnzpn/Giyk/hyNz12ji7AOK0jJ4zvwGl8Z/jgB9g/A==
X-Received: by 2002:a17:902:464:: with SMTP id 91mr2256675ple.261.1588673753400;
        Tue, 05 May 2020 03:15:53 -0700 (PDT)
Received: from hilbert.taihen.jp (ae146065.dynamic.ppp.asahi-net.or.jp. [14.3.146.65])
        by smtp.gmail.com with ESMTPSA id e4sm1239600pge.45.2020.05.05.03.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 03:15:52 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id 7D30E240AD9; Tue,  5 May 2020 20:18:11 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: [PATCH 1/2] [sony-laptop] SNC calls should handle BUFFER types
Date:   Tue,  5 May 2020 20:18:09 +0900
Message-Id: <20200505111810.65586-2-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505111810.65586-1-malattia@linux.it>
References: <20200505111810.65586-1-malattia@linux.it>
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


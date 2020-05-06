Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F4B1C6535
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 02:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbgEFAqb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 20:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729677AbgEFAqa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 20:46:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA01C061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 17:46:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a7so28560pju.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 17:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wXZBeis5IIoGnsyyD6tnO5zVfw/q2kwwMwp2dqUqkLk=;
        b=I6ocjJ/agk6iI2WJ9CrAgEeAUs00M5IXvWf17wN3VN+I6GGcboF8OCOKPgy6xIW3D3
         L3JQqO6olCj9QsoGmXJ85tsTlQL2QE2tbSQDdMaqzhcQnp1b1snBTCz9YkjTrXlLIDyJ
         54+HPd7b2RDJHtT/I0kwNZgUwPVV8xeqRxPZyqyEUd1Wfkj5PpL6ORGdjK2yHdbjL2ii
         l90xVoyL+vg7rjinkAyd3gm6TpXrF6txU4xeTvVheZay20fRI0EAFRx2uqY/n1rboPcC
         Cw9+XcanRruP3VF016uXIbwlUIY/k/XF/q0fIe56u4wTOGX1qo1o6dkci16uODiWkpKF
         HA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wXZBeis5IIoGnsyyD6tnO5zVfw/q2kwwMwp2dqUqkLk=;
        b=CVdCO3VQ6UDfnRW40lFZPn1XvEI+sC79WQBkwTyEKchVLUGiCCgchqzPBwdsU7B01k
         P2Sy7uD0mOo6ANIkWpvwvqucCpl+5xycuOGOqI3BkJQgWI+dSWkBCPmx1a+Zd4lmlwip
         34IYvsHAiqLV4QEWX36rbjPKh5c0VRIG2OEiMIaaNHtO1faoz7LBhn8Sm06VNCvw6Cz7
         GITA8OdkvDcSOYmRIix9Jpjv6D4/RO3r5rWe3oBJolT1++cfJFnyFJ1nnxSlYVZR28tV
         6ACiN8MM6bkf/20DqGRnqgjK+jypM9xRm7lmz5K/SdJMBQJcfp8/Us1QJUfMV8qyxc8V
         smCw==
X-Gm-Message-State: AGi0PuYuOKOryA91ILgIRvNXehJC7qz61wJr+VHV8g7lCddDp60i2eB/
        4pg5cTQ4Cz0x7mXZKHytGSc=
X-Google-Smtp-Source: APiQypLnAqXnA59Bxl2fDIcZOR4NG+R8tswMBTRI/ZPz92oF/mJbOjEF/1mgYv5CODnKWFmqOlI9Yg==
X-Received: by 2002:a17:902:bc89:: with SMTP id bb9mr5709745plb.101.1588725990047;
        Tue, 05 May 2020 17:46:30 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id 23sm267093pgm.18.2020.05.05.17.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:46:29 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id CFD00243B99; Wed,  6 May 2020 10:48:47 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: [PATCH v2 1/2] [sony-laptop] SNC calls should handle BUFFER types
Date:   Wed,  6 May 2020 10:48:42 +0900
Message-Id: <20200506014843.18467-2-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200506014843.18467-1-malattia@linux.it>
References: <20200506014843.18467-1-malattia@linux.it>
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


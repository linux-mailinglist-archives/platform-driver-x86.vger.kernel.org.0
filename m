Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E371C9F7A
	for <lists+platform-driver-x86@lfdr.de>; Fri,  8 May 2020 02:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgEHAOP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 20:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726509AbgEHAOO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 20:14:14 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E328C05BD43
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 17:14:14 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d22so22909pgk.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 17:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yGZhp+t56lDt9wd6HFxeky0a/LbyvQoXPtHsot7/bXo=;
        b=p0IvBy5XwIl2EEuCIbrudiPBlhBWiSn1LwF+XkfejST0DcQaQeIKOWWcCO8opft6jr
         ycG4+LRIgp1BtK2dIS242uuNCIIw+/BrsPageOl922VljdfNvvmfsCtAKqNIh8HDc2ng
         pH4jrkDdUOvH++yLZPfTWSoJkInOKkS+oriDm+0WYD7zvzBtrCcUcB3vCr2A+xEDcYPL
         gO6CxDq/If1Ajc10KDxGhGqEYLLIUxbpXg9ZFxq8Youvo7xijV5Yy318lv/NmEoMmSqu
         AJB3IrctUj9T2TC2cC2eQe1nWOoaUv3G6NPU3aETEqP35K2arooG0uHTKcEH4xaegwSt
         QqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yGZhp+t56lDt9wd6HFxeky0a/LbyvQoXPtHsot7/bXo=;
        b=Mx/zqbB54NUG7vIbQUbzQj//57a29QrVUL1WtihhPyApSWJRF9nL9lu01YSUBR0Jxl
         IzlY9Ab6m9UQGqNVLcFQykeg0slcNhkBv6bF3sfHCDePpgsr6651CGRIJTzaugowUyc8
         x7kkkdQCv+9ijZO8jYaU87AXJDv/TqQh6/yJ5EKq9fFKD69Q/ww0XUT1bzLfLMzKh5pg
         vPPpwwFba+8V18ygdgMrRStdf/p+rPWbydJaONO+Kc4cvb1iEPDKVlxUwHbQ6I42oMnz
         KFnByqOf7VhEKp7ktwy0QMPusQlkyaXUrp4+952Hv42j05KLh8y1/k/gQBOUz7TSNJ2+
         mtyA==
X-Gm-Message-State: AGi0PuZPjVy6DOoDyHHHnG1hyruIzbM+S7BPPqMp6Gh20FqcpAOx1VrU
        soZwaBFI/oi1Ie6dHgkxmjg=
X-Google-Smtp-Source: APiQypIwKAgI3q6Hhd2axXnsHaJfTzz1djFea483PLSd9S9ujBADlSG0diJyOCLolEtGZ/95LDu2wg==
X-Received: by 2002:a62:f941:: with SMTP id g1mr15919398pfm.118.1588896853957;
        Thu, 07 May 2020 17:14:13 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id b29sm49408pgn.15.2020.05.07.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 17:14:13 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id A3AA0243BE3; Fri,  8 May 2020 09:14:08 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: [PATCH v4 1/2] platform/x86: sony-laptop: SNC calls should handle BUFFER types
Date:   Fri,  8 May 2020 09:14:04 +0900
Message-Id: <20200508001405.71176-2-malattia@linux.it>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508001405.71176-1-malattia@linux.it>
References: <20200508001405.71176-1-malattia@linux.it>
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
 drivers/platform/x86/sony-laptop.c | 53 +++++++++++++-----------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 51309f7ceede..6932cd11e660 100644
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
@@ -795,17 +768,20 @@ static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 	if (!object)
 		return -EINVAL;
 
-	if (object->type == ACPI_TYPE_BUFFER) {
+	if (!buffer) {
+		/* do nothing */
+	} else if (object->type == ACPI_TYPE_BUFFER) {
 		len = MIN(buflen, object->buffer.length);
+		memset(buffer, 0, buflen);
 		memcpy(buffer, object->buffer.pointer, len);
 
 	} else if (object->type == ACPI_TYPE_INTEGER) {
 		len = MIN(buflen, sizeof(object->integer.value));
+		memset(buffer, 0, buflen);
 		memcpy(buffer, &object->integer.value, len);
 
 	} else {
-		pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
-				ACPI_TYPE_BUFFER, object->type);
+		pr_warn("Unexpected acpi_object: 0x%x\n", object->type);
 		ret = -EINVAL;
 	}
 
@@ -813,6 +789,23 @@ static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 	return ret;
 }
 
+static int sony_nc_int_call(acpi_handle handle, char *name, int *value, int
+		*result)
+{
+	int ret;
+
+	if (value) {
+		u64 v = *value;
+
+		ret = sony_nc_buffer_call(handle, name, &v, result,
+				sizeof(*result));
+	} else {
+		ret =  sony_nc_buffer_call(handle, name, NULL, result,
+				sizeof(*result));
+	}
+	return ret;
+}
+
 struct sony_nc_handles {
 	u16 cap[0x10];
 	struct device_attribute devattr;
-- 
2.26.2


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7BB010DD30
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfK3Ixn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:43 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40146 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfK3Ixm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:42 -0500
Received: by mail-wm1-f66.google.com with SMTP id y5so17410561wmi.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to;
        bh=wUzBo8WprLwhIYpds2E6kfsyeNJOPBho8igETDbKAi4=;
        b=UzpvPx/gpkkqrv8jMLosqdwVi5aV/5rWXnLPd/BoJwB7ZZL6N1Q0v27HdYuGzkhbXd
         9pGz5klIgSOSKP5Jq6QB44jtsHE+H1ug6X04YN3cHcoqLyJwD+NLNagqv2tcWLzWdTFl
         qwMgNATToDHSkAVMvQvEHmmZP6haSYUMFREVdq7xD+08WqoVvVuVMCO57kjL2M07Exmz
         S1y3R6F9LlH2MEAZBSchrewMZh5EWjxoLOzN4hxuC67BzepcZsE502PboY2i8eZ59+4P
         H/Dvtu1U+gsBwGSc0/vt64hkcHD199WmDQRw/2CI6d+iDU6RVUyRn8qGpyk0Tb5efjUQ
         E4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to;
        bh=wUzBo8WprLwhIYpds2E6kfsyeNJOPBho8igETDbKAi4=;
        b=h0vC9JhytsTdT6wM8DFt8ApiMcrAAAC7EDX5mel21TxukwksMuntnczmHfLmDA07kB
         IBMyMHKYGEnGJ3Zs31so+o11OST/qCoM8JhaFwTviRHIYIufxIwio3ik63fd6g9YQzon
         dl04xO+T6spfeEAVmpBa35nEtR/uKPvw5I2y/ESa5Hii+OoO1sXvhLRUPrj9qWnPsW8X
         u5Az/YzOk8494HxSmwTZVl2mqoxb4Y2vLN26pzbmfTultebQVTEfqsCwh5OzLQQ38EsP
         e895c7kix876KmvEPDM7w5DFtGJ4lGgUlXD+AehQCSfSy3E6+KcHgljdiXcj0p/Rm/QZ
         cfxg==
X-Gm-Message-State: APjAAAXsZprlGQ3J/WUIeJpiAdIl7uO2UFZCln/5eciNSjt4CEHyJsSl
        GMdGF7U+kJgfgq5WXNkzmBYX
X-Google-Smtp-Source: APXvYqwONGMVRQTqbC+nOrL3nNuBEUBco7BuqyY+LfGVFjonKLgvOKchV4NypYfgHbU5CL08Iim3AQ==
X-Received: by 2002:a1c:9e49:: with SMTP id h70mr18315400wme.79.1575104019614;
        Sat, 30 Nov 2019 00:53:39 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id b17sm6098871wrx.15.2019.11.30.00.53.38
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:39 -0800 (PST)
Message-Id: <39f4fb68c150f5da49e864ecdab3f25e93529e7f.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
References: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:42:45 +0200
Subject: [PATCH V2 5/7] platform/x86: lg-laptop.c: Manage battery limit
 correctly for 2019 models
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Read/write battery charging limit using WMBB instead of WMAB for 2019
and newer models.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 40 +++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index d4c49f822394..ccdc93be2a9b 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -75,6 +75,8 @@ static u32 inited;
 #define INIT_KBD_LED            0x10
 #define INIT_SPARSE_KEYMAP      0x80
 
+static int battery_limit_use_wmbb;
+
 static const struct key_entry wmi_keymap[] = {
 	{KE_KEY, 0x70, {KEY_F15} },	 /* LG control panel (F1) */
 	{KE_KEY, 0x74, {KEY_F13} },	 /* Touchpad toggle (F5) */
@@ -466,7 +468,11 @@ static ssize_t battery_care_limit_store(struct device *dev,
 	if (value == 100 || value == 80) {
 		union acpi_object *r;
 
-		r = lg_wmab(WM_BATT_LIMIT, WM_SET, value);
+		if (!battery_limit_use_wmbb)
+			r = lg_wmab(WM_BATT_LIMIT, WM_SET, value);
+		else
+			r = lg_wmbb(WMBB_BATT_LIMIT, WM_SET, value);
+
 		if (!r)
 			return -EIO;
 
@@ -484,16 +490,29 @@ static ssize_t battery_care_limit_show(struct device *dev,
 	unsigned int status;
 	union acpi_object *r;
 
-	r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
-	if (!r)
-		return -EIO;
+	if (!battery_limit_use_wmbb) {
+		r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
+		if (!r)
+			return -EIO;
 
-	if (r->type != ACPI_TYPE_INTEGER) {
-		kfree(r);
-		return -EIO;
-	}
+		if (r->type != ACPI_TYPE_INTEGER) {
+			kfree(r);
+			return -EIO;
+		}
+
+		status = r->integer.value;
+	} else {
+		r = lg_wmbb(WMBB_BATT_LIMIT, WM_GET, 0);
+		if (!r)
+			return -EIO;
 
-	status = r->integer.value;
+		if (r->type != ACPI_TYPE_BUFFER) {
+			kfree(r);
+			return -EIO;
+		}
+
+		status = r->buffer.pointer[0x10];
+	}
 	kfree(r);
 	if (status != 80 && status != 100)
 		status = 0;
@@ -648,6 +667,9 @@ static int acpi_add(struct acpi_device *device)
 		}
 	pr_info("product: %s  year: %d  debug v4\n", product, year);
 
+	if (year >= 2019)
+		battery_limit_use_wmbb = 1;
+
 	ret = sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group);
 	if (ret)
 		goto out_platform_device;
-- 
2.21.0


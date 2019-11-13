Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B96FB631
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbfKMRSP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:18:15 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35950 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbfKMRSO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:18:14 -0500
Received: by mail-wr1-f66.google.com with SMTP id r10so3315889wrx.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:to:from:date:subject;
        bh=SRsrN/jjTo/bqNZ/WOpDtN+dG13KjlRUoDzbKjjZUhs=;
        b=epbjxocpBDxe0yzf5/31BebtJBVn0PjMKjV4wRMedv9naEN+aq5Y35QyZgKmg5I8t2
         2iEvR6rQTPOzSPCiLrh/TAZxzG4/Zmb8FWBPGwC9/AGoO74eRR86hYLHllxrvpLEMExY
         qr8BzqMvo0bPn1xlm9wXKsYDhC/DrF9l0cgN1P7hpnpfaFT/kUmSMGfo8i39AOgnmR+C
         zfa2W0DIw1KvYo2jWuuYYVm/I1Msqw5sY+n/2fGAzvLMiVq0UoeLdwFQrri6AuU1GIEO
         C9QPph2CbnONv/4TnixIy6120B7ma/hOPWGmVRxnmFQIHmBcs436fEAxSGNZeonBEsxZ
         HHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:to:from:date
         :subject;
        bh=SRsrN/jjTo/bqNZ/WOpDtN+dG13KjlRUoDzbKjjZUhs=;
        b=AHphXH2QT/nNBLGBnMg85e99SITzaA315BNHMwfP+SLveR6DKtzAaJxdDOV0NGiSHJ
         kDzz1RSCCMoNF0zGc8JHCV/YQSeUIUCYJfpr3t0oQDzOU1xGrEfPmyzJkVRWWBsv1I4k
         /XMuuyW1Ht3lH9OR7DIE/+CawGUOVy5aALDuHFlP7zFRgSK1th4IESVsoKTTpOqbgDGD
         SN/grRhDnXYAYKPbLvK1gZlTc7cRD87+PkccynwIo6vKGqnMiSRoZ46Lzgfp1XV2YQ9p
         4aMFzOtQ3/t09tNGv5yyea2ou/8OuiV3p4PU2HiDW4rn8hnF0idVmskodYimoRom8KVA
         X44w==
X-Gm-Message-State: APjAAAUn4DYSxgD6qp+4DxdSE/eKaqx5ry34sROOE/emJEu1n4iRakkQ
        iuQtXimAtsRKKq0u2CQJVq6vwnQJJQ==
X-Google-Smtp-Source: APXvYqz0doROO8tnUL+48IiIj5WUq2ppeEdZEXRqY74gFYoAe8HsubaNtjCSeaZ/wdRvkfARYehSXA==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr4030870wrn.48.1573665492177;
        Wed, 13 Nov 2019 09:18:12 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id z14sm3480608wrl.60.2019.11.13.09.18.11
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:18:11 -0800 (PST)
Message-Id: <abdd74c9ea2af38c82f0de72df8bf4aee081358b.1573664004.git.matan@svgalib.org>
In-Reply-To: <cover.1573664004.git.matan@svgalib.org>
References: <cover.1573664004.git.matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 17:46:54 +0200
Subject: [PATCH 5/7] Read/write battery charging limit using WMBB instead of
 WMAB for 2019 and later models
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Model up to 2018 use a WMAB method to manage the battery limit while 2019
models use a WMBB method.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 42 +++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index b8839fcfa4a8..843f8f8f1eaf 100644
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


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 548A1FB62C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbfKMRRv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:17:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40231 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfKMRRu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:17:50 -0500
Received: by mail-wm1-f67.google.com with SMTP id f3so2901293wmc.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:to:from:date:subject;
        bh=Qc5MBIX4grxF4cE1Ss/aBGUs156tFixYK1JIlPJ1GTo=;
        b=R16Uip3srrMG6tOtgY9HcIApfr58Ib6d4KA0T2FYzRSFR56eAaXlTL4fFr4gaNd9xr
         sxuvobkCdNwdMxr7WinB7NKrjgNSwxodMKiVAdfDcC9CDMUGooGCxXdxew1+Mljy4ilI
         S5eC3UNIKjIPcbYrICa1KOK3gZn4K8Yf4BhZXWc2mIAwLyugC3Jxi860bfupbsR/4uRD
         6dNq5bBdR+u5z1vE3PS4Dbkx22RYwnDqiI1RQcc0qo1NNUm2ES9tpBYKeFImhkY6eqvq
         4kcdi3BkkP6ovKMP3jSvzYhSKNFyBohy08UKe15ep8vWKz7sPaYEWBIGBfnQ4rd4mGCD
         BUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:to:from:date
         :subject;
        bh=Qc5MBIX4grxF4cE1Ss/aBGUs156tFixYK1JIlPJ1GTo=;
        b=Lxzj5aD2juD/kXQza8nGCOKCsBtUtffCBGatXw8rUSdF81ncnh+y2uTQbcHdJlCBi/
         /3+afG+s54fau7hMWMLER1C7vPzvzsM/KTYniVcBZ9m/7HuzSJ5FS6IZDNLmi3oXbDpl
         e4Bw01fVEsJtA9Orfm4m00WdWjlOZFBjtsY2aslfCD/eN5L6wyZYUMiYlgo6QRYjZiMN
         JGAdEv1caqbfjRhQTelRR1ZkGQCIXZZ9IS924vsq9DspN61sTOtPSZJz7D3bIjPbYNxS
         2KE4+QahAACp9CqRunTxhjg+ci1/e/RbxQKffXkfqmPYJDAA3EMCB75qK67Fx2/RT+gu
         qDEw==
X-Gm-Message-State: APjAAAXrQYEen2pj14XeqewM9jTL/s3xI+VQzb2rgNgFiPz5kAPbjEwO
        7pp6ldCnW/G3xo8cJGzdBwyiahvLPg==
X-Google-Smtp-Source: APXvYqwqStsbyGfTLiiJcza+WvyFarkNmF8FqKM5mD/P4h7XJB7qo8B1XjvB+gV18mGenESFa9vB4w==
X-Received: by 2002:a05:600c:22d1:: with SMTP id 17mr4043597wmg.31.1573665468312;
        Wed, 13 Nov 2019 09:17:48 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id u203sm2974144wme.34.2019.11.13.09.17.47
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:17:47 -0800 (PST)
Message-Id: <045854d4aee211852c8edbc795278cf44a69d70a.1573664004.git.matan@svgalib.org>
In-Reply-To: <cover.1573664004.git.matan@svgalib.org>
References: <cover.1573664004.git.matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 17:46:17 +0200
Subject: [PATCH 4/7] Get model name and year from DMI product name
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There are small differences between different models. The DMI product name
appears to be consistent enough for extracting the model year information.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 467143394ca9..b8839fcfa4a8 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
@@ -606,6 +607,8 @@ static struct platform_driver pf_driver = {
 static int acpi_add(struct acpi_device *device)
 {
 	int ret;
+	const char *product;
+	int year = 2017;
 
 	if (pf_device)
 		return 0;
@@ -624,6 +627,27 @@ static int acpi_add(struct acpi_device *device)
 		goto out_platform_registered;
 	}
 
+	product = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (strlen(product) > 4)
+		switch (product[4]) {
+		case '5':
+		case '6':
+			year = 2016;
+			break;
+		case '7':
+			year = 2017;
+			break;
+		case '8':
+			year = 2018;
+			break;
+		case '9':
+			year = 2019;
+			break;
+		default:
+			year = 2019;
+		}
+	pr_info("product: %s  year: %d  debug v4\n", product, year);
+
 	ret = sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group);
 	if (ret)
 		goto out_platform_device;
-- 
2.21.0


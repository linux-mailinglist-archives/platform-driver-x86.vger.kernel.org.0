Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C0010DD2F
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfK3Ixk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:40 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40145 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfK3Ixk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:40 -0500
Received: by mail-wm1-f68.google.com with SMTP id y5so17410504wmi.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to;
        bh=USqBAeKS9vDKDTcR3GflnhSYrOv2Ef8XnGW36gbHde8=;
        b=l4vx0Ozgk9COi2brcSxuMus40Rc+s8/Lw9N+upDRQtucmYNYowpl/OkXOzDOQUKtXm
         Dso6/d1osAJDrY+HYbynxGH4baQK0O0nsxq6VifMOlSstvZ5RBeRuUpimE6wAvlZU9TT
         k8dcDmWbhJFq6jkYC1CqJ47KsQjMwTyoTAgp+SMMATakhEu2JftcSIuxueLe1/khMp0A
         qZ9oEWv+j4IepjqKFbnE8o0q7eFIlcey476FGoy47qQ5pQBRz+kldNyGteRZD21OUjCk
         TT+h9BSalFzB41ROmiTjPZSnZfs1ZAdOdz2U2mr0Y5sP4KXDPc+ixhW6sEPnglol87eo
         89Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to;
        bh=USqBAeKS9vDKDTcR3GflnhSYrOv2Ef8XnGW36gbHde8=;
        b=g8f6oQno/E5RQzrA5wtSeAf5u5Mwnwbj88zLcccHnHKiEEFB+eqG3khjdCpD2oUEJY
         AyXfgBRO8vp9/SxwLRIBeGeT2eg2F1fqM8PGaHTt3F06EvXZMmK385lZOK/OeoFlOtoc
         FosqLvm4p91CHsibVb3JJTBziYiUnzJke7nuVqsWNHVsyHBVWv90F/51io6ss3bCoMm4
         x3dHZPZ2sN80b2e8RwvRE0MyEu/b9cyiPyyjZT8Ogpk1DvDWphS+E5cX60/Evoh/QA4A
         zStmljyssaa9VXNBD4J7FWv0wbY6gmiO7HLwFMQa2ifP94HuLolRZ1btuzd1SDOPD8Sk
         ec2A==
X-Gm-Message-State: APjAAAXU2MyLtHgvkzPzthp9b+AkSDwDB0rco9EK8n0KjhqeU0ht7h0R
        K1gWOE2C7fpP90AR7i4Syc+i3C2Bag==
X-Google-Smtp-Source: APXvYqwqhdaebv0L5+mhbwUb/5xi6jJJ1YpW8g0NwBHJzpNd3GDA2NH86x2UoQP4fN236ATGPWtsQA==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr16252175wmd.80.1575104017403;
        Sat, 30 Nov 2019 00:53:37 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id d8sm9097609wre.13.2019.11.30.00.53.36
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:36 -0800 (PST)
Message-Id: <cab87eefeb0c84d6481674729a9efd48d18123e6.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
References: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:41:54 +0200
Subject: [PATCH V2 4/7] platform/x86: lg-laptop.c: Get model name and year
 from DMI product name
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Model year seems to be encoded simply in the DMI product name, so take it
from there. Tablet for factor is still not handled differently.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 2f0ce69d8e31..d4c49f822394 100644
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


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C01A9AE5
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Sep 2019 08:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731233AbfIEGrT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Sep 2019 02:47:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35805 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730778AbfIEGrT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Sep 2019 02:47:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so1087098pfw.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2019 23:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/z/fEHOrsK82Y1ofBetcsSWQGDh48/k+RVElI1RO7o=;
        b=OwMu18AcOOAyMqJD4wJ/W4yR5pdjw1N258iRYCa0lhZ/jva8bkXn5KSuVZhY5OSHDg
         805uhgNtDhYEBo3truJWQ3FrGs/D7i6PmbVPmr+OlbojY014I9BHxPS9g2lmQmMM7esK
         yIBw34Cq+rSvk5dxoXziSN6ZkA1tBrYLT7eHO2Pb9nT71FI1WUQYX9IAbxeFROkGrZ8s
         fVc/QU844yVw9UX0wTwYJCKmDa/H79ikDkKldMBUIFiCiCILguz+btbxUd7rPxtrBT2I
         xRNIQ+GtxSmhQAUCF1ZGFUt+fr0YqUlZW6qlLQl0BnyZ69XfY1hf6iaHNZEdaiIXKZJ6
         yWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/z/fEHOrsK82Y1ofBetcsSWQGDh48/k+RVElI1RO7o=;
        b=eXt/2asTR5lM/OMyy2s1GVSYdHJ23b5ZzYBxnFnI85ws8px2P96H3mWSZZVBHx02wB
         ZChjyWZFljnfDyIRxvM+wntLiFXpmPIwkFcCQs60jW1oQpEOWsVa7ctlhHjLXFRC2Tir
         LamxVuvjZjm8pW1mcwKSShyZQX/Y+QVCppFWj4cRfnSXvISPlgGHrbbbPXPrHSxUQ3Tz
         RzVBqRpKIY3+CLowzExmYBSb4IydLmpLqltmj6JNrEWmg6szORy5viYNEoH5uO46Kaiu
         zHsDgQr4lZMHKL1+pSPRrAEuHabPbaa+z3tXQwEmXScHRmlGddC8RuuK0i8p/9dKgBe5
         9nPQ==
X-Gm-Message-State: APjAAAU7Ny4SKdBle8fMx5Cyo6ekDXYP61W1wIiV0r1FjV9VnuQ1sC5z
        6d0ldctGpJg8dZFrDPSOod7yYw==
X-Google-Smtp-Source: APXvYqyT64f2i5qRmgn1BwnKJl5DRdSKj8YLiQc6JP71plOtfRuizvipZFWJfRIo/YgGnz8mMSaWsg==
X-Received: by 2002:a63:fc09:: with SMTP id j9mr1662132pgi.377.1567666038386;
        Wed, 04 Sep 2019 23:47:18 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id 67sm1016041pjo.29.2019.09.04.23.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 23:47:17 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     eric.piel@tremplin-utc.net, dvhart@infradead.org,
        andy@infradead.org
Cc:     pavel@suse.cz, platform-driver-x86@vger.kernel.org,
        linux@endlessm.com, burman.yan@gmail.com
Subject: [PATCH 2/2] hp_accel: fix accelerometer orientation for EliteBook 840
Date:   Thu,  5 Sep 2019 14:47:07 +0800
Message-Id: <20190905064707.7640-2-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905064707.7640-1-drake@endlessm.com>
References: <20190905064707.7640-1-drake@endlessm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The HP EliteBook 840 G1 accelerometer does not behave according to the
current "EliteBook 84" driver quirk.

Instead, it needs all three axes inverted in order to achieve the
behaviour described in the lis3lv02d.rst documentation. We have confirmed
this on multiple units.

Add a new product-specific quirk to correct this, but also leave the
previous match in place, assuming that it is correct for other models
that will continue to match that one instead.

DMI data of this product is:
Handle 0x000D, DMI type 1, 27 bytes
System Information
	Manufacturer: Hewlett-Packard
	Product Name: HP EliteBook 840 G1
	Version: A3009DD10303
	Serial Number: 5CG51115YS
	SKU Number: F9W96UP#ABA
	Family: 103C_5336AN G=N L=BUS B=HP S=ELI

Handle 0x000E, DMI type 2, 16 bytes
Base Board Information
	Manufacturer: Hewlett-Packard
	Product Name: 198F
	Version: KBC Version 15.59
	Serial Number: PDXVC00WB8G0Y2

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/hp_accel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index 7a2747455237..bbacaa21d539 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -162,6 +162,7 @@ static int lis3lv02d_dmi_matched(const struct dmi_system_id *dmi)
 DEFINE_CONV(normal, 1, 2, 3);
 DEFINE_CONV(y_inverted, 1, -2, 3);
 DEFINE_CONV(x_inverted, -1, 2, 3);
+DEFINE_CONV(xyz_inverted, -1, -2, -3);
 DEFINE_CONV(x_inverted_usd, -1, 2, -3);
 DEFINE_CONV(z_inverted, 1, 2, -3);
 DEFINE_CONV(xy_swap, 2, 1, 3);
@@ -237,6 +238,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	AXIS_DMI_MATCH("Mini510x", "HP Mini 510", xy_rotated_left_usd),
 	AXIS_DMI_MATCH("HPB63xx", "HP ProBook 63", xy_swap),
 	AXIS_DMI_MATCH("HPB64xx", "HP ProBook 64", xy_swap),
+	AXIS_DMI_MATCH("HPEB840", "HP EliteBook 840", xyz_inverted),
 	AXIS_DMI_MATCH("HPB64xx", "HP EliteBook 84", xy_swap),
 	AXIS_DMI_MATCH("HPB65xx", "HP ProBook 65", x_inverted),
 	AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
-- 
2.20.1


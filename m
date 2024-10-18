Return-Path: <platform-driver-x86+bounces-6039-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E698F9A3709
	for <lists+platform-driver-x86@lfdr.de>; Fri, 18 Oct 2024 09:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D90BB23143
	for <lists+platform-driver-x86@lfdr.de>; Fri, 18 Oct 2024 07:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C673184535;
	Fri, 18 Oct 2024 07:22:58 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9880185B6F;
	Fri, 18 Oct 2024 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236177; cv=none; b=slTYOLGxFck+Cifad2YbBC0SUBW4Ld8h0x9KazT61VPbwHHukfE18USKIcC1tRgMe2M/ONoYOgtpTaRZei4JZEcZkIkI0NEd990bcYAlJi5xTsw046AFqTBA3PkIeU//rtKxMAWmS/ztVAzD7k1fDzzU+2J9ua4QWStEPOdNuYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236177; c=relaxed/simple;
	bh=untHnLDmoXPrStlarHDIcBkrvmbku0S8PgZDYgSerK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KEo9nyogZratc1T/2FGtbuxfJmaKFIgUY57GhV8E7WMJPJcsluCRfpH5snb/8b8Xsl19d52F8ooIlM76Taj3MQJiYy9lCWGR5HI0naNiNw/Md3ksQnjeUGCtWOESNxsSs+F1jB7rvj/psFYO4LMK2itATKVGUPujrdMaZEcM2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bdee44b08d2111efa216b1d71e6e1362-20241018
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:18cb4b58-3770-4992-a838-d5c61c43b36c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:59d269628a3a3556756c051bc45c53de,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0
	,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bdee44b08d2111efa216b1d71e6e1362-20241018
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 347286467; Fri, 18 Oct 2024 15:22:33 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
	by node2.com.cn (NSMail) with SMTP id 002BEB803CA1;
	Fri, 18 Oct 2024 15:22:32 +0800 (CST)
X-ns-mid: postfix-67120CB8-862319517
Received: from localhost.localdomain (unknown [172.25.120.36])
	by node2.com.cn (NSMail) with ESMTPA id B820DB803CA1;
	Fri, 18 Oct 2024 07:22:31 +0000 (UTC)
From: zenghongling <zenghongling@kylinos.cn>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: cascardo@holoscopio.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	zhongling0719@126.com,
	zenghongling <zenghongling@kylinos.cn>
Subject: [PATH] platform/x86: classmate-laptop: Replace snprintf in show functions with sysfs_emit
Date: Fri, 18 Oct 2024 15:22:17 +0800
Message-Id: <20241018072217.97909-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  show() must not use snprintf() when formatting the value to be
returned to user space.

Signed-off-by: zenghongling <zenghongling@kylinos.cn>
---
 drivers/platform/x86/classmate-laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x=
86/classmate-laptop.c
index cb6fce6..14c238f 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -208,7 +208,7 @@ static ssize_t cmpc_accel_sensitivity_show_v4(struct =
device *dev,
 	inputdev =3D dev_get_drvdata(&acpi->dev);
 	accel =3D dev_get_drvdata(&inputdev->dev);
=20
-	return sprintf(buf, "%d\n", accel->sensitivity);
+	return sysfs_emit(buf, "%d\n", accel->sensitivity);
 }
=20
 static ssize_t cmpc_accel_sensitivity_store_v4(struct device *dev,
@@ -257,7 +257,7 @@ static ssize_t cmpc_accel_g_select_show_v4(struct dev=
ice *dev,
 	inputdev =3D dev_get_drvdata(&acpi->dev);
 	accel =3D dev_get_drvdata(&inputdev->dev);
=20
-	return sprintf(buf, "%d\n", accel->g_select);
+	return sysfs_emit(buf, "%d\n", accel->g_select);
 }
=20
 static ssize_t cmpc_accel_g_select_store_v4(struct device *dev,
@@ -550,7 +550,7 @@ static ssize_t cmpc_accel_sensitivity_show(struct dev=
ice *dev,
 	inputdev =3D dev_get_drvdata(&acpi->dev);
 	accel =3D dev_get_drvdata(&inputdev->dev);
=20
-	return sprintf(buf, "%d\n", accel->sensitivity);
+	return sysfs_emit(buf, "%d\n", accel->sensitivity);
 }
=20
 static ssize_t cmpc_accel_sensitivity_store(struct device *dev,
--=20
2.1.0



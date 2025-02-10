Return-Path: <platform-driver-x86+bounces-9352-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD5A2EC9E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 10 Feb 2025 13:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 438E7161F3F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 10 Feb 2025 12:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A931A223311;
	Mon, 10 Feb 2025 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lWM1HhKu"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724C223310
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2025 12:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190712; cv=none; b=SQRBnQ+h1Y5ZOjrQqIiqTvkbyI+IfzPrBTSCDVYgKluTgVX72nQ/sdte5rDgwGT+mCMhNY1UjcoULI4CLDf7LrIJ8kxR5hyzN/R8vem1mGps9+p7Lqx+vg19RRRXTCh/X3DSesyIFUYiM54ddYe++hd4zcMMm9Wjb0HQmmnnl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190712; c=relaxed/simple;
	bh=qjSIgdAZ24T7tEVscCy0/dbSoB5tg9cqtETpeWww1Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHCQmAC3RMhurb8UNBCXC/fmhFTuxy/gYRcm7qkjEinjVrCTmnThabXBQhgy5HVkzg21netbxvIwexbPvpD0rRMclnbMRTLLziyYKvOoHJhYKDNEShk52aKEGkJCWSrdv8d9dvmhCap8OYBl8MqzwkImr6GDx2ZDDt/6z5G2jr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lWM1HhKu; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739190698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kfTXh6DZ400dvZqO6JrvnoYt9O+Ir0fmnFhb2HbjbyY=;
	b=lWM1HhKukHVv/Yuy70oDYAL9q3zDDXyUXyEBAl1QP/wl5WkAQ87bzCol4RWeAZ7aXbNdVY
	KHb38HqgV5TgfD4aZ1LzFmjhMOk1ajOZC4Ek3xbRHnviLqCVj/x5EYsakv/J9QmeaVZuQy
	TrtpYdLCNcUrlWA9WCGhqdFLj1wlUjw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mattia Dongili <malattia@linux.it>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sonypi: Use str_on_off() helper in sonypi_display_info()
Date: Mon, 10 Feb 2025 13:31:03 +0100
Message-ID: <20250210123103.112938-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/char/sonypi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index f887569fd3d0..677bb5ac950a 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -37,6 +37,7 @@
 #include <linux/kfifo.h>
 #include <linux/platform_device.h>
 #include <linux/gfp.h>
+#include <linux/string_choices.h>
 
 #include <linux/uaccess.h>
 #include <asm/io.h>
@@ -1268,12 +1269,12 @@ static void sonypi_display_info(void)
 	       "compat = %s, mask = 0x%08lx, useinput = %s, acpi = %s\n",
 	       sonypi_device.model,
 	       verbose,
-	       fnkeyinit ? "on" : "off",
-	       camera ? "on" : "off",
-	       compat ? "on" : "off",
+	       str_on_off(fnkeyinit),
+	       str_on_off(camera),
+	       str_on_off(compat),
 	       mask,
-	       useinput ? "on" : "off",
-	       SONYPI_ACPI_ACTIVE ? "on" : "off");
+	       str_on_off(useinput),
+	       str_on_off(SONYPI_ACPI_ACTIVE));
 	printk(KERN_INFO "sonypi: enabled at irq=%d, port1=0x%x, port2=0x%x\n",
 	       sonypi_device.irq,
 	       sonypi_device.ioport1, sonypi_device.ioport2);
-- 
2.48.1



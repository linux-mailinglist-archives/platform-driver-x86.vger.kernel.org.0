Return-Path: <platform-driver-x86+bounces-5761-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BDC9916EE
	for <lists+platform-driver-x86@lfdr.de>; Sat,  5 Oct 2024 15:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4D391F2274E
	for <lists+platform-driver-x86@lfdr.de>; Sat,  5 Oct 2024 13:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D352F1531ED;
	Sat,  5 Oct 2024 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="POJqDu3I"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C7E14B942
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728133567; cv=none; b=Y4y0YpWXLLZvXp6CRunK42LPJJukh9z6lTfPhoYv0EMHjmxSQ0jXmZKzxQ2Y7Nocrq924Qn0FMQ0VHDn+t5rvdlEJGKMuMVXFB9fisVtE4+bOh4j1BMJyquyoplUt+9+zt04B3KcgzUIyIEFuMqAvNOuZgXn+qtxK1FXgo1JYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728133567; c=relaxed/simple;
	bh=3lnEf9j+D+2aOx9BOaKfJ4H2nOYQW3JFQ3wUEV0Szuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n8aVXWt0ryB5zD6to8cuVuwETPUQJeh1TRv5hbmfImcALb3k8N3nPnDMbhrXZveKHCjfACmgt0DQmGF5UUN6dh9ey7RH0OL0uNnloUenQqWVpRXpaM59YcEzBtlnHZwbv8ODLEym84MOxvisJ4qCFK1UOkhE0+CJvY19phbkG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=POJqDu3I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728133565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ydeRJU74T4OsiHquGxcbvI1Q8l5mrWjS52PSoOrtskU=;
	b=POJqDu3IfIap+wuzJqrqUslfqXe/ntPbqFrxoURA9LiKhHyUCESr1iu7IE7euef64LBdjK
	Zu1e3Ro9qR5S39MtKbOTo6fTIify64tTXI4ZY1aAi1jb2MhftNqHzJOJwejapHWg0uPbMB
	TXqsntVdI6tz1HiGDLs62qTBTEXsnqI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-nxUeBJKCNe2I6wbCGnwUsg-1; Sat,
 05 Oct 2024 09:05:59 -0400
X-MC-Unique: nxUeBJKCNe2I6wbCGnwUsg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA3DD19560A7;
	Sat,  5 Oct 2024 13:05:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.19])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3ADEB3000198;
	Sat,  5 Oct 2024 13:05:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	stable@vger.kernel.org,
	Aleksandr Burakov <a.burakov@rosalinux.ru>
Subject: [PATCH] platform/x86: x86-android-tablets: Fix use after free on platform_device_register() errors
Date: Sat,  5 Oct 2024 15:05:45 +0200
Message-ID: <20241005130545.64136-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

x86_android_tablet_remove() frees the pdevs[] array, so it should not
be used after calling x86_android_tablet_remove().

When platform_device_register() fails, store the pdevs[x] PTR_ERR() value
into the local ret variable before calling x86_android_tablet_remove()
to avoid using pdevs[] after it has been freed.

Fixes: 5eba0141206e ("platform/x86: x86-android-tablets: Add support for instantiating platform-devs")
Fixes: e2200d3f26da ("platform/x86: x86-android-tablets: Add gpio_keys support to x86_android_tablet_init()")
Cc: stable@vger.kernel.org
Reported-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
Closes: https://lore.kernel.org/platform-driver-x86/20240917120458.7300-1-a.burakov@rosalinux.ru/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 1427a9a39008..ef572b90e06b 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -390,8 +390,9 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 	for (i = 0; i < pdev_count; i++) {
 		pdevs[i] = platform_device_register_full(&dev_info->pdev_info[i]);
 		if (IS_ERR(pdevs[i])) {
+			ret = PTR_ERR(pdevs[i]);
 			x86_android_tablet_remove(pdev);
-			return PTR_ERR(pdevs[i]);
+			return ret;
 		}
 	}
 
@@ -443,8 +444,9 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 								  PLATFORM_DEVID_AUTO,
 								  &pdata, sizeof(pdata));
 		if (IS_ERR(pdevs[pdev_count])) {
+			ret = PTR_ERR(pdevs[pdev_count]);
 			x86_android_tablet_remove(pdev);
-			return PTR_ERR(pdevs[pdev_count]);
+			return ret;
 		}
 		pdev_count++;
 	}
-- 
2.46.2



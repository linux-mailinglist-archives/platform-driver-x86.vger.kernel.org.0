Return-Path: <platform-driver-x86+bounces-11909-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7BAAAE9D1
	for <lists+platform-driver-x86@lfdr.de>; Wed,  7 May 2025 20:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D52409C0F13
	for <lists+platform-driver-x86@lfdr.de>; Wed,  7 May 2025 18:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED02214813;
	Wed,  7 May 2025 18:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1hZfais"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE424E4CE
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643688; cv=none; b=Fgb7lec8I/HigBMM/TUc/fQn8KSsLgVdGaa7DkvhOLxqzeJTDGDfhoc3Hu+h6GGOxtrkmmHQeir/ADk/kGW7BYvk4n+sIBO8iSj8S52rLgg+RMBd1Dt/LnbZxtbMqJ8jX6WZXIH1qdcJqYBJmCqqbqT5RoTFfdX77TYO/BPhhmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643688; c=relaxed/simple;
	bh=E2EZlpZUfEMSUs7rclh0DUwSGFf0JmriNRguug/IG3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twS0ibaid831k9lmD81U4+t0HrRvfEHmq/gDyEkxOyFd0GGlfrPrWFLBVTaHneAavEEpJs/Llq78F+nh/6F2bqPaj+LTJm+RWSmXOfxiI6YA2HZ896XzElcwzV53rMO28XtO0ZCsYWjLLNJ9LTJrI/d65jvyrGbF4rC0cucdxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1hZfais; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsBD3M6XUvRSQXDokTcq457nvKRoi4SYPq2XkNK1vQo=;
	b=X1hZfaisb94+pO/RarvoXtFsaOani6yWawFshVrcx3lt7oU4HIVohLKrDfhu6zCgaKrfeY
	TzuGzaV1rtyBbhyihwAk/CyD5uoJAzSp7eRqPmECrxqGVW/kl1ZJd8lJQFyzL3dZQH27zY
	tDt30M6NsvL2Fg1f5ofF9kGNhunJn30=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335--BHS_UlWMkWfM70TEwXmrg-1; Wed,
 07 May 2025 14:48:01 -0400
X-MC-Unique: -BHS_UlWMkWfM70TEwXmrg-1
X-Mimecast-MFC-AGG-ID: -BHS_UlWMkWfM70TEwXmrg_1746643680
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D769A1956050;
	Wed,  7 May 2025 18:47:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 41A2630001A1;
	Wed,  7 May 2025 18:47:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/6] platform/x86: int3472: Export int3472_discrete_parse_crs()
Date: Wed,  7 May 2025 20:47:34 +0200
Message-ID: <20250507184737.154747-4-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

At the moment the atomisp has duplicate code for parsing Intel camera
sensor GPIOS and calling the special 79234640-9e10-4fea-a5c1-b5aa8b19756f
_DSM to get the GPIO type and map it to the sensor.

Export int3472_discrete_parse_crs() so that the atomisp driver can reuse
the INT3472 code for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 15 ++++++++++-----
 include/linux/platform_data/x86/int3472.h     |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 808d75e8deda..c706671e2f63 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -363,7 +363,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	return 1;
 }
 
-static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
+int int3472_discrete_parse_crs(struct int3472_discrete_device *int3472)
 {
 	LIST_HEAD(resource_list);
 	int ret;
@@ -388,17 +388,22 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(int3472_discrete_parse_crs, "INTEL_INT3472_DISCRETE");
 
-static void skl_int3472_discrete_remove(struct platform_device *pdev)
+void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
 {
-	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
-
 	gpiod_remove_lookup_table(&int3472->gpios);
 
 	skl_int3472_unregister_clock(int3472);
 	skl_int3472_unregister_pled(int3472);
 	skl_int3472_unregister_regulator(int3472);
 }
+EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
+
+static void skl_int3472_discrete_remove(struct platform_device *pdev)
+{
+	int3472_discrete_cleanup(platform_get_drvdata(pdev));
+}
 
 static int skl_int3472_discrete_probe(struct platform_device *pdev)
 {
@@ -453,7 +458,7 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
 	 */
 	INIT_LIST_HEAD(&int3472->gpios.list);
 
-	ret = skl_int3472_parse_crs(int3472);
+	ret = int3472_discrete_parse_crs(int3472);
 	if (ret) {
 		skl_int3472_discrete_remove(pdev);
 		return ret;
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 0a835cc85c67..89410f0cb73a 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -147,6 +147,9 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 					 struct acpi_device **sensor_adev_ret,
 					 const char **name_ret);
 
+int int3472_discrete_parse_crs(struct int3472_discrete_device *int3472);
+void int3472_discrete_cleanup(struct int3472_discrete_device *int3472);
+
 int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
 				    struct gpio_desc *gpio);
 int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472);
-- 
2.49.0



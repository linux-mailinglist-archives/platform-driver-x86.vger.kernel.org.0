Return-Path: <platform-driver-x86+bounces-4849-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67F95226E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Aug 2024 21:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EB9AB23F23
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Aug 2024 19:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8C11BE243;
	Wed, 14 Aug 2024 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bRJ9m7nJ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F00613C673
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662135; cv=none; b=LJF9y8x+02Q3ZhFGUCMYknnuqMPDePHJmNSnk5GWajHvAuIejtWgw2FC6k8Q1rhlbb/NvOGw+7qShA+5G4TgBv72iCelplJzkVyyIkvWo5a9nG/LXdLkdpTv9W/Vga1lEzYNIPgYwFU1MFegrufMMP/QkSx7kt58KNyHv0F2D4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662135; c=relaxed/simple;
	bh=DGy+c13+26Igia4lcHdcGdci1sn6tyDhQb+bo4/0JFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPZPzFyEgXegASQEY4hyoV1cSwEC/AU/k2BVx1AOiaLmPue8C6hrtrtutQVUlwuCvhSbD8Io97RD9j8p/nUz9Eohbuqsig9eASqpvmeZ8SLJtfXTjGYtpIaop1CUeBk7CGioNS8rOLOHc9DvsyzB2L6j5DZBfDQbLuiZj3omPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bRJ9m7nJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723662132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/HYaNpt+Hxgow8hyB4/IctLXMbXyzlPpsD0bDBpFGE=;
	b=bRJ9m7nJadLUlYLEwV1c4qaL6ouPDRIK2Bfp9jZzC+1uwaqAZxrZN7MvW5XfUeF4rm4ssx
	1/y7YZ/7lyIpSHgsFZ3uoiUhnnvYNBrCLN0HwXAyTVZojIJ7TB5eqnfGm+1GdL6zODbe+X
	mnvVGyRO9vHoWb7P6H2vEFzJ1sGIan4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-9ojPAhtCPGakEkwjO7Rkug-1; Wed,
 14 Aug 2024 15:02:08 -0400
X-MC-Unique: 9ojPAhtCPGakEkwjO7Rkug-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6099A1944CEE;
	Wed, 14 Aug 2024 19:02:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.22])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AC0AB19560AA;
	Wed, 14 Aug 2024 19:02:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ACPI: video: Add Dell UART backlight controller detection
Date: Wed, 14 Aug 2024 21:01:57 +0200
Message-ID: <20240814190159.15650-2-hdegoede@redhat.com>
In-Reply-To: <20240814190159.15650-1-hdegoede@redhat.com>
References: <20240814190159.15650-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Dell All In One (AIO) models released after 2017 use a backlight
controller board connected to an UART.

In DSDT this uart port will be defined as:

   Name (_HID, "DELL0501")
   Name (_CID, EisaId ("PNP0501")

Commit 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
has added support for this, but I neglected to tie this into
acpi_video_get_backlight_type().

Now the first AIO has turned up which has not only the DSDT bits for this,
but also an actual controller attached to the UART, yet it is not using
this controller for backlight control.

Add support to acpi_video_get_backlight_type() for a new dell_uart
backlight type. So that the existing infra to override the backlight
control method on the commandline or with DMI quirks can be used.

Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 7 +++++++
 include/acpi/video.h        | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index c11cbe5b6eaa..e509dcbf3090 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -54,6 +54,8 @@ static void acpi_video_parse_cmdline(void)
 		acpi_backlight_cmdline = acpi_backlight_nvidia_wmi_ec;
 	if (!strcmp("apple_gmux", acpi_video_backlight_string))
 		acpi_backlight_cmdline = acpi_backlight_apple_gmux;
+	if (!strcmp("dell_uart", acpi_video_backlight_string))
+		acpi_backlight_cmdline = acpi_backlight_dell_uart;
 	if (!strcmp("none", acpi_video_backlight_string))
 		acpi_backlight_cmdline = acpi_backlight_none;
 }
@@ -918,6 +920,7 @@ enum acpi_backlight_type __acpi_video_get_backlight_type(bool native, bool *auto
 	static DEFINE_MUTEX(init_mutex);
 	static bool nvidia_wmi_ec_present;
 	static bool apple_gmux_present;
+	static bool dell_uart_present;
 	static bool native_available;
 	static bool init_done;
 	static long video_caps;
@@ -932,6 +935,7 @@ enum acpi_backlight_type __acpi_video_get_backlight_type(bool native, bool *auto
 				    &video_caps, NULL);
 		nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
 		apple_gmux_present = apple_gmux_detect(NULL, NULL);
+		dell_uart_present = acpi_dev_present("DELL0501", NULL, -1);
 		init_done = true;
 	}
 	if (native)
@@ -962,6 +966,9 @@ enum acpi_backlight_type __acpi_video_get_backlight_type(bool native, bool *auto
 	if (apple_gmux_present)
 		return acpi_backlight_apple_gmux;
 
+	if (dell_uart_present)
+		return acpi_backlight_dell_uart;
+
 	/* Use ACPI video if available, except when native should be preferred. */
 	if ((video_caps & ACPI_VIDEO_BACKLIGHT) &&
 	     !(native_available && prefer_native_over_acpi_video()))
diff --git a/include/acpi/video.h b/include/acpi/video.h
index 3d538d4178ab..044c463138df 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -50,6 +50,7 @@ enum acpi_backlight_type {
 	acpi_backlight_native,
 	acpi_backlight_nvidia_wmi_ec,
 	acpi_backlight_apple_gmux,
+	acpi_backlight_dell_uart,
 };
 
 #if IS_ENABLED(CONFIG_ACPI_VIDEO)
-- 
2.46.0



Return-Path: <platform-driver-x86+bounces-10608-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FAA70BE2
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Mar 2025 22:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6755818981E7
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Mar 2025 21:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858D25E81B;
	Tue, 25 Mar 2025 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aE3Qr2yX"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043413D531
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2025 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742936708; cv=none; b=OPlvrlPQ7taDUZq7RDhtK376N4CgZZ/Vj6LxJt3/QnqgXgZsrT7d1akJxMpHAjBL1Vk5+bARKEGAvPof9ndkz3mIE3xsc2c2kWcSH3B3MZ6mprKHNlGoWl0vBuyhPOmcXWzzzfAlKy+/z21Q94aRYIgw8Gi3HgVDSL1wpMKmojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742936708; c=relaxed/simple;
	bh=RRzKB9jKRXaAw68uR4HOI6psfkepueaqKVYwROP88CM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkQEAB3WMZwxrmV+KcFZ69R+HmT0euwV9DbF82PuB8rtESoBE8P1QvheITi5t+fbML+gE7J3/s/NYW5JJN2vZZQz3u1ZC0/fIC32CxACg1X6hMAX6KqqHa121IrVsJzO3PgPVQwt5ztMX10U5x3pDDSphFPtZ3wnyPY4hNWsivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aE3Qr2yX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742936705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nYPo0x0dKf9DX0OrvIOCSnF7qUC8RxKeg8hu98cG3ik=;
	b=aE3Qr2yXwXPCmtEPqLN0C1Pk6oY0Rr2qWTx9d7WyVCZcx/VbIP/URJ+RulvDnqCnqnYiwR
	IcCm64QVllGFd0rICVp/PaVlciOPGFMzdceey21Oryaeh15AzxF+jlwUDBKv+8ontilCxY
	lp6HO27wzToCm7m9RN+YjNE/peASXRU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-Huqs8eapPTuqutx2gJdm9g-1; Tue,
 25 Mar 2025 17:05:03 -0400
X-MC-Unique: Huqs8eapPTuqutx2gJdm9g-1
X-Mimecast-MFC-AGG-ID: Huqs8eapPTuqutx2gJdm9g_1742936702
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 055D4190308B;
	Tue, 25 Mar 2025 21:05:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B67B11800944;
	Tue, 25 Mar 2025 21:04:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-acpi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Agoston Lorincz <pipacsba@gmail.com>,
	stable@kernel.org
Subject: [PATCH] ACPI: x86: Extend Lenovo Yoga Tab 3 quirk with skip GPIO event-handlers
Date: Tue, 25 Mar 2025 22:04:50 +0100
Message-ID: <20250325210450.358506-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Depending on the secureboot signature on EFI\BOOT\BOOTX86.EFI the
Lenovo Yoga Tab 3 UEFI will switch its OSID ACPI variable between
1 (Windows) and 4 (Android(GMIN)).

In Windows mode a GPIO event handler gets installed for GPO1 pin 5,
causing Linux' x86-android-tables code which deals with the general
brokenness of this device's ACPI tables to fail to probe with:

[   17.853705] x86_android_tablets: error -16 getting GPIO INT33FF:01 5
[   17.859623] x86_android_tablets x86_android_tablets: probe with driver

which renders sound, the touchscreen, charging-management,
battery-monitoring and more non functional.

Add ACPI_QUIRK_SKIP_GPIO_EVENT_HANDLERS to the existing quirks for this
device to fix this.

Reported-by: Agoston Lorincz <pipacsba@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/CAMEzqD+DNXrAvUOHviB2O2bjtcbmo3xH=kunKr4nubuMLbb_0A@mail.gmail.com/
Cc: stable@kernel.org
Fixes: fe820db35275 ("ACPI: x86: Add skip i2c clients quirk for Lenovo Yoga Tab 3 Pro (YT3-X90F)")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/x86/utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index 068c1612660b..4ee30c2897a2 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -374,7 +374,8 @@ static const struct dmi_system_id acpi_quirk_skip_dmi_ids[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
 		},
 		.driver_data = (void *)(ACPI_QUIRK_SKIP_I2C_CLIENTS |
-					ACPI_QUIRK_SKIP_ACPI_AC_AND_BATTERY),
+					ACPI_QUIRK_SKIP_ACPI_AC_AND_BATTERY |
+					ACPI_QUIRK_SKIP_GPIO_EVENT_HANDLERS),
 	},
 	{
 		/* Medion Lifetab S10346 */
-- 
2.49.0



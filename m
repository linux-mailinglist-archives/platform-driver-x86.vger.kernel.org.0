Return-Path: <platform-driver-x86+bounces-3991-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2038391252B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Jun 2024 14:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A459A281DE5
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Jun 2024 12:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871461514D3;
	Fri, 21 Jun 2024 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QARMIf/W"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709714F9EF
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Jun 2024 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972785; cv=none; b=RvbSUrOwhUDt989+qRJgDwmA8Xd/vhGjwXXF0n3JxKLCh2w4AhYYfMMawdfFahS9E9eLs6q7hGdKCjWTJlmRa+yfR4nRQnMDPaooEakKHJCIjRHBvXxJ402pgzkGJ/6uDpzY76zCy+59i16Si95t0Z6BBAXCX76bLuWBp9SeM9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972785; c=relaxed/simple;
	bh=GqCJUEu6HvllrEv6mt7zNui7VJwFT5x1A/AE8OsFp+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrpzsoAB2s7QRuZgY5QfxcjzT0Pffk4xlsajvQq3teSUwx2noJ6FyFgYLw5oidBhioP7OL6PuxjiWtxKbN0MwZ1ECK6tr7vHKsmtmyvXmP5AVRq2AWMPYTz5Tmhw01DdQmxP8A5lutLvvDdoI14CWofGNSKbxMqbgdPPken3tsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QARMIf/W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718972783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vIlGIjnZaRmqlGYYwh9589os9i1avVj+5PIgcozfw4=;
	b=QARMIf/WTC8y3NCKct/JnObHIgTJdNV0YKTIv6TyvEbxhdfNX1RmkZmHNpEga0nOdTsWmT
	rtm+EeTwngP2DIo3xBbo/KeQ/gHVSxwZuyl+PkD/d5J89ITJnc27F2LxbD7rC+U5RhBCdK
	nLYYSanBHsKTG1J5IW+BZNw/nUL5Tm4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-IkT0cEbvPgCDX_HyHi4ZVg-1; Fri,
 21 Jun 2024 08:26:19 -0400
X-MC-Unique: IkT0cEbvPgCDX_HyHi4ZVg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84F601955D89;
	Fri, 21 Jun 2024 12:26:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.69])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E7965300144C;
	Fri, 21 Jun 2024 12:25:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v3 5/6] platform/x86: dell-smo8800: Add a couple more models to dell_lis3lv02d_devices[]
Date: Fri, 21 Jun 2024 14:25:00 +0200
Message-ID: <20240621122503.10034-6-hdegoede@redhat.com>
In-Reply-To: <20240621122503.10034-1-hdegoede@redhat.com>
References: <20240621122503.10034-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add the accelerometer address for the following laptop models
to dell_lis3lv02d_devices[]:

Dell Latitude E6330
Dell Latitude E6430
Dell XPS 15 9550

Tested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smo8800.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index 2e49bbb569c6..4c79b2599d96 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -173,6 +173,20 @@ static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
 		},
 		.driver_data = (void *)0x29L,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6330"),
+		},
+		.driver_data = (void *)0x29L,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6430"),
+		},
+		.driver_data = (void *)0x29L,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
@@ -194,6 +208,13 @@ static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
 		},
 		.driver_data = (void *)0x29L,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
+		},
+		.driver_data = (void *)0x29L,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-- 
2.45.1



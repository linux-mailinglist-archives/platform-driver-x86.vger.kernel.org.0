Return-Path: <platform-driver-x86+bounces-13712-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EAEB25073
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 19:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 411EC884132
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 16:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2642B28C877;
	Wed, 13 Aug 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8hoArl4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8928B7C7;
	Wed, 13 Aug 2025 16:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104192; cv=none; b=FnHoS2j73WfAbxyniHiPiXluqu/im2143jQWn/Q99w66oMqJRlxFQwpndlzNsMT0lUTA9t3Lgyjti+nZMvydZ1UfaA26ZWcI6Msp7hll9vgh/1A1sHVAAaJx4xD7TuAMhB5ISDuJ3bKicad3SnHAp75Mypeyfk3ksUFv0JaC0Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104192; c=relaxed/simple;
	bh=jdTt99zTFwp8lgnDaks26fen2aaiRoAN4AquVCkP0sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctMW5rnwwB9HNtmkMXqJUlOUmY6CGnk6AVchu5T91bOcsumhtQnC3rylZKZZaiT7jD9CcXSHG1iJr1xMP7GUKf6j0tpWr7U2vBfN1g0Cgi7dK+pgjTyPQGF4CcpaQyV8fDhvaZofo745OQBgdy2e3u5JDpFroSdet6j9xcvSZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8hoArl4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso18338f8f.2;
        Wed, 13 Aug 2025 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755104189; x=1755708989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bahhmgzHnPWV/bB99PC0Ps0ouIbSPRYTBAKPg8RY1TQ=;
        b=T8hoArl40cIRzpbfPpNLv1k84BvHeXY1qoK4TMBi3D8yGsUPgF+vfuwIkI9g7NHOlN
         UXnQnsJ8Q1VXMaO8BhSFuwulUt+q2Ca8d9SJ7yzERH3P9t9YryEcqtO6Z21jKR27I/JP
         vys5bnH7IKfRluRsQaEvcCAKEmVbvlAA0AgqV3kdmAqh2XcCDZ6ryrOxDx7+pkwx4S8I
         c4fxuOWwjUoKX2QNmrb/QaqHP2TszpWIEdeEZvSTL83EqT5vkysQcv6wgVGCnofpznaE
         WfL1TSdOo3FTUKiSCd6/XvakXESxzLrgPinJKGwIQnjwH6QZfRjEhFNmZLJeyqlae4R4
         bW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104189; x=1755708989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bahhmgzHnPWV/bB99PC0Ps0ouIbSPRYTBAKPg8RY1TQ=;
        b=lo8sFAtuhOHnypUOb7JCBoTEGnNzCSkgmOluAF567IMq593YpeMs8Ptq+AoVaOzJC6
         GznQOJqdAABpHURWVbUcArdpbAKcCt0JpxvjTpTpVxgVjmIeHbfWEgd8tWA8YSmX03Nw
         6uNg8gaO0O7en6BgBgJMukmvoljLu31ytuU/HFTvbXyPrRTvdlLFonFqiG5aChX9gMUM
         kaT5EKCDJfhi5lQoHpaKTd4Y0FV8Sz+eAG9Q3mEn/ZjlT6khaE21uUIY8XpbyQwnLZJg
         mZ1H7jPgu8BncslH/PoR20cf1E9OxqcPqLBk6EWkOBua9hrQRyNGxFtoCxfh2DUQk0sY
         6J7A==
X-Forwarded-Encrypted: i=1; AJvYcCVVNKLS+U0D1Im/p7f9pgPL+Ga/wdJfyi5EpkZdKOmyIn60P3f4UzRlZdGU5XO2Tof0qlLOj3pxKuATPDRe3YQbNbwu@vger.kernel.org
X-Gm-Message-State: AOJu0YzzpRPC9WNSDl4slWg0rpBRRUwIsGUAXuKGmVlLmJKO6O6+nITH
	7alg8hND68isLggMD7Fpm8BZ5mYkHDVp75jqRKVQAotqh/rbSp493nyiS5GbTQ==
X-Gm-Gg: ASbGncvzGPB3fvKAMkGrZnqhON2qLm3+z8ELucypM7UbAUcxlmw9WONBs/bUUlmbD1T
	Wl33oUVHXu1VgjxKbFuk6/kcExBoveE2LlGUy5tY7lU1X7M7ufK43lSfSSkrUkEjZlX14FZlR2a
	V0kmJokPGb+KRV5nxNpGmWfnx18HJQrNA6+42xzqk1ADNtY2vjZCN2wOsWI8+fN/bpQ0M1wPXvh
	H6qzfzl1puJ8SAezvaHwwqlApfH9OmFLPxiTKdS5obqs6xrGwN2whU1UJps0XGddqXfktHvVjKS
	4/vvNHh2WShZUUh6idnd2z+mWwsHpL/sDiszd6T6T3e22pJ4+LHDAtKi/6XJAh3ex3dJueAUqee
	OBEtFFD1aMVWI7rCiBXJ7kotCIKKN4i1sag==
X-Google-Smtp-Source: AGHT+IF1xzsc63vs8oMzAu/wGK7eolSYkFDwhJS2Nm4g444t9hgC3mkezTySHN9+D1LBDRqR1TYc9Q==
X-Received: by 2002:a05:6000:401f:b0:3b8:d4c5:686f with SMTP id ffacd0b85a97d-3b9fc36a553mr5617f8f.39.1755104188605;
        Wed, 13 Aug 2025 09:56:28 -0700 (PDT)
Received: from denis-pc ([176.206.95.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48de68sm48600399f8f.67.2025.08.13.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:56:28 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Derek John Clark <derekjohn.clark@gmail.com>
Subject: [PATCH v11 3/8] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Wed, 13 Aug 2025 18:56:15 +0200
Message-ID: <20250813165620.1131127-4-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813165620.1131127-1-benato.denis96@gmail.com>
References: <20250813165620.1131127-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Add panel_hd_mode to toggle the panel mode between single and high
definition modes.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 57ed9449ec5f..68ce2c159ae1 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -92,7 +92,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
-	return !strcmp(attr->attr.name, "gpu_mux_mode");
+	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
 static int armoury_wmi_set_devstate(struct kobj_attribute *attr, u32 value, u32 wmi_dev)
@@ -403,6 +404,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
 		   "Set MCU powersaving mode");
 ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
+		   "Set the panel HD mode to UHD<0> or FHD<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -416,6 +419,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 71c68425b3b9..10acd5d52e38 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -76,6 +76,7 @@
 #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
 
 /* Misc */
+#define ASUS_WMI_DEVID_PANEL_HD		0x0005001C
 #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
 #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
-- 
2.39.5



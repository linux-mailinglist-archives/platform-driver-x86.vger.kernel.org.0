Return-Path: <platform-driver-x86+bounces-13715-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFBBB2506A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 18:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD5CB1778B2
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 16:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9545C291C1E;
	Wed, 13 Aug 2025 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQHa5oyY"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD5228D82A;
	Wed, 13 Aug 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104194; cv=none; b=ByneoCJ7GpoSjqDfDl0b5Ux5TsJ68C7o3K41UFsOOXxxR4mK0dbhLb3BjB25q3ztS0xy6lzyKb3eHBPCDo/7bVMv1FQKJJLC1zYwHZScpAZGkJaJKIdh0X/PVNqV0HoXkYKW0A4Buq+IgZHqp0dT1rcPW//DcIlNqJ3y/VHCNgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104194; c=relaxed/simple;
	bh=8jgIH7XnWMLqsnWJ6OeACFWXMvRU6laBsCAb9zgQ6kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6TclRcZXP8Le6d1xFlVqOkcPpl7jHN/cyzW2WM1AAjP472T3WljK0vQ1UKuTGO/4TjJQQW0VkjacvxDB0mlfhrQ7VjYXMWtaO2iYeINdVr/DbUfsWzD2OqqWVoN0aFB1YzeebEDB3uDHP2JzNozbcwlWP2tmZ1VO9hdCtdqwTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQHa5oyY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso9459f8f.2;
        Wed, 13 Aug 2025 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755104191; x=1755708991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQx2vq98GEuezaSiwsscob1GjYJvNL2TpoEEMWC48Zs=;
        b=ZQHa5oyYdMokt3AHX5IkrlHbBF3hIt2DEPPW2kvxcshHVzdFOdsZot+okM3bwxkjeg
         HdfcB6NON7nkgRPi4HFIifQ8x+fv9QKRqTiAaJqbCWlih9DobsF+KzrNY7gY+ObnkoSk
         DGzzFeQPu8QTr21YrsE+1uW2DNDlRldph83R6H/ypa49BuzfqOTe0BBE2Dk8fJuv2JFa
         zqsCvD35s2k3QvAlnXrhrGX1if2SVjIHmxv+sm9RBGG7vEQgCpYTnsa8h2RPy+vcpOpn
         Wtg1gwwpHK/OD//TahcT3yd9F64isyO2d0MgqIeo1DVJV1x7XbwnL6ROHVNI/Au5cIl2
         9AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104191; x=1755708991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQx2vq98GEuezaSiwsscob1GjYJvNL2TpoEEMWC48Zs=;
        b=wyKEKf49OJFJl/+r3brHU0UnkYsXdyzKet0eJ5izV0E5OoAQGGCzZYsCG72DSO0VlY
         QyyH6mbUTpZzaARnXBTqVDkQluhRkWPXRG8wmTnrvaCAT1WTCGHLdEIqhtT8A+roWnZT
         qzRLC3TRlSJ2Jz9gDxwxxJnyKvCL3D7Zh1Afe3iVxnKi0m9BgRkS86SIm/MsB0K0cs3j
         sSmicOKuQi6eN8fQ3pxXGRg9PoTCETB/FWl/6Pebg7L9OTMQsljPacUNvC66boDQj1b0
         xw2mlxyltFO9q02rtnNGfTC+Y7H5UiozNboNzL4q+YUJEhkV2QnuenxMyx8GE1SDiBuS
         V08w==
X-Forwarded-Encrypted: i=1; AJvYcCVF8X06k3lcQL9K12lXtZE7xGsnfxmHHJ8OTZNY0/fOXEcbOGiDh8Q85MemmiIIxlv7qRSlUricVqYkqCIeA+aPhHWx@vger.kernel.org
X-Gm-Message-State: AOJu0YzayWJS/bacbAIv7uhjTW7luN3XiY3xJSZwDQewHKnuE4nuxuTI
	7uAs8aRTkJ/DzEede29j0lWxoIpm394A5oW6vxfzOmCIFLCTBJY+Xgcb1IoHpA==
X-Gm-Gg: ASbGncvfUiFlYrs0qg0cw0PDSNCDs95AxMHifQfKKLvArryBSSAbDabjOP/JMola88H
	XCDShr0Gtft6j+obURHlx01Idrc5XvUa+nPJJCpef4YXDgY+VN9zJs7dHS4kuEC197L94gYnnRZ
	NuAQP3eX0dIHUKkQF9UT5hVmm5vuyMnXFXJ5iBwDXUlAfH3S21kwaZxWPQNDOThwJAiKydP6/Iv
	B9sTrFj7+eyrH/TESsQt+BkJej9LqQci2lYFhT3ytXihVrfha9WtpPTwhnpUOOnx0W/42zyEWmR
	/Wp9/ZrSyUkhWMAqJtJ23e4hoexDnZglPJwwKgzCTPbV8k8F+IhYvi98zMynbKPXJoOKLOhDLdC
	UvPWt4li8NhbGl6rDxhSYe+fAacC8CfBapQ==
X-Google-Smtp-Source: AGHT+IHvh3/iM2hrlsXawQPQOH2GEy1niiyzqWc8IuD/D1EQJi3B9j+pk8IgYFYFRGSMXHRB516OEw==
X-Received: by 2002:a05:6000:26d0:b0:3b7:9ae1:eb9 with SMTP id ffacd0b85a97d-3b9edfbc54emr26585f8f.23.1755104190832;
        Wed, 13 Aug 2025 09:56:30 -0700 (PDT)
Received: from denis-pc ([176.206.95.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48de68sm48600399f8f.67.2025.08.13.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:56:30 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Derek John Clark <derekjohn.clark@gmail.com>
Subject: [PATCH v11 6/8] platform/x86: asus-armoury: add screen auto-brightness toggle
Date: Wed, 13 Aug 2025 18:56:18 +0200
Message-ID: <20250813165620.1131127-7-benato.denis96@gmail.com>
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

Add screen_auto_brightness toggle supported on some laptops.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 4 ++++
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 4629389c4c25..36571290fc40 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -731,6 +731,9 @@ ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
 ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
 		   "Set the panel HD mode to UHD<0> or FHD<1>");
+ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
+		   ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS,
+		   "Set the panel brightness to Off<0> or On<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -748,6 +751,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
 	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
+	{ &screen_auto_brightness_attr_group, ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 9a79dae97adf..260796fee301 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -83,6 +83,7 @@
 #define ASUS_WMI_DEVID_LID_FLIP_ROG	0x00060077
 #define ASUS_WMI_DEVID_MINI_LED_MODE	0x0005001E
 #define ASUS_WMI_DEVID_MINI_LED_MODE2	0x0005002E
+#define ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS	0x0005002A
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
-- 
2.39.5



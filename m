Return-Path: <platform-driver-x86+bounces-5319-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C53972554
	for <lists+platform-driver-x86@lfdr.de>; Tue, 10 Sep 2024 00:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9A11F249BE
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Sep 2024 22:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F2218C35E;
	Mon,  9 Sep 2024 22:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=basnieuwenhuizen.nl header.i=@basnieuwenhuizen.nl header.b="Gr6FwBGn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17EA189B82
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725921311; cv=none; b=fkreKCSNHolPSAGENglSqdUWY7hxF8Xn+hYosCBcgQJB/cufIlyv1MAq85b4hHmU5QUFt5TWbOaq/grc7Cj/CSwap7uwxP9pu6WK2YPQMvxBK+ZxIyiqezzRfYCy9YDClgUgNcv4LOtDb65IYgSdX+tWx2Z1YK21INLQlhSirag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725921311; c=relaxed/simple;
	bh=nh4P9bveQw9df08McHCSRO43LqQ7oCWck0IXNtb4xU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/vlRM9B86HhOlGSYtMWYwevmZnqASAvqE1El2CKOC6CjWFzJfoI3nKEFJ9CO6p0oY4RsEN6hrFwCD0Er1UPWW9yncLdn+hNdQXFT+MG016DA1G8V7xb7IGMIjdeCVMKPtk9xUApGiAKJZ0urjV9RdXSqNTP3rkNPoNyBIAmQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basnieuwenhuizen.nl; spf=pass smtp.mailfrom=basnieuwenhuizen.nl; dkim=pass (2048-bit key) header.d=basnieuwenhuizen.nl header.i=@basnieuwenhuizen.nl header.b=Gr6FwBGn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basnieuwenhuizen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basnieuwenhuizen.nl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374ca65cafdso3038175f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Sep 2024 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=basnieuwenhuizen.nl; s=google; t=1725921305; x=1726526105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4MICI6g3yUok6wutwkSUYOvmuKDHD5fYjAV3OeIKts=;
        b=Gr6FwBGnKfo2dIqVTrtsi1OOJTQbqDdpFWaer67HAiS1Ec6oWmgeYeOwIn2HIkTtfY
         lJ2fiiU7Xn8dIKxeR1KAjaDOy8/RbNXWXRIOr4KEiKdMK4A3p2jWk2/gD+r2gX8QXtS4
         nCt1yHHSbGCMWu8QWc1vmzt8O+91pU1jgKeLyEpzQBxPvlPpzeO12byOR07Ujxu0//4A
         7UEaMJU4I08ErrTAI+Z3XIjdtQj9ywElIMA4YgYzBNyCMSArm5Oj8DWX1BtVae/zzbf5
         n7q8i503j+rTFi4TysX3w+I3UlLplYzFJpM4UwHmlJQe4Sh59Glg1acJrWp7iw9oMWM8
         Id/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725921305; x=1726526105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4MICI6g3yUok6wutwkSUYOvmuKDHD5fYjAV3OeIKts=;
        b=TjwWER/5/cPcAnNf0beqc6DM4xyCAFblIUEKjCxeKbx7sYqimkoMcxT9Xki+4974hq
         vZBphrLC0w0X0jW+ilwsaFq+5qBMSSUA5tJB3E82OxOgxdk0Otjx3A5P2vZd7sgLj8OC
         vrkBRT9VoZPO2p5M3O3dfYINktlXIDEZywI1o/CxOfpeFlSDLaFagVpiF0ehkRVTJfeE
         JCEmeebx7rmpGpxQDREbC72SOuDQaTZKCLREyQZ/jONCIJv+uC7SxnQLmdljQnKUbgra
         pSxySkSPYE4zaSd5I9rBNUOUVkEga6OUTAz2sVqHrrmsVcORtpHAKpTHZRHrjJFyuZAy
         w3iA==
X-Gm-Message-State: AOJu0YzgyLSg/iIi4pg20UencWkIPih4fx7twySeIBrYUtbmbPnemZEv
	F0DiNPeIe+CDLrCRcGiJzpochclaHb0BYUhpCRPynebJeaRNTmQMoDTkwu0BJqeMewAcIF2MngM
	m
X-Google-Smtp-Source: AGHT+IFZUAvWGz5OHP/qofhTYW7wiosl34eXYlf9+2F2FzBtkfyB0DU8bePqE4LvpKoNJK4IOH/W8w==
X-Received: by 2002:adf:f6c2:0:b0:376:274c:c8b3 with SMTP id ffacd0b85a97d-378949ef869mr5319868f8f.5.1725921305215;
        Mon, 09 Sep 2024 15:35:05 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a781:a500:aaa1:59ff:feea:fd4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a73sm89835435e9.3.2024.09.09.15.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 15:35:04 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev,
	corentin.chary@gmail.com,
	Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: [PATCH] platform/x86: asus-wmi: Disable OOBE experience on Zenbook S 16
Date: Tue, 10 Sep 2024 00:35:03 +0200
Message-ID: <20240909223503.1445779-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OOBE experience fades the keyboard backlight in & out continuously,
and make the backlight uncontrollable using its device.

Workaround taken from
https://wiki.archlinux.org/index.php?title=ASUS_Zenbook_UM5606&diff=next&oldid=815547

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/platform/x86/asus-wmi.c            | 10 ++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index cc735931f97b..3b333d6076ac 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1779,6 +1779,16 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE)) {
+		/*
+		 * Disable OOBE state, so that e.g. the keyboard backlight
+		 * works.
+		 */
+		rv = asus_wmi_set_devstate(ASUS_WMI_DEVID_OOBE, 1, NULL);
+		if (rv)
+			goto error;
+	}
+
 error:
 	if (rv)
 		asus_wmi_led_exit(asus);
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 0aeeae1c1943..ae9bf7479e7b 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -62,6 +62,7 @@
 #define ASUS_WMI_DEVID_KBD_BACKLIGHT	0x00050021
 #define ASUS_WMI_DEVID_LIGHT_SENSOR	0x00050022 /* ?? */
 #define ASUS_WMI_DEVID_LIGHTBAR		0x00050025
+#define ASUS_WMI_DEVID_OOBE		0x0005002F
 /* This can only be used to disable the screen, not re-enable */
 #define ASUS_WMI_DEVID_SCREENPAD_POWER	0x00050031
 /* Writing a brightness re-enables the screen if disabled */
-- 
2.45.2



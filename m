Return-Path: <platform-driver-x86+bounces-2422-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E28920BF
	for <lists+platform-driver-x86@lfdr.de>; Fri, 29 Mar 2024 16:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA4C8B21639
	for <lists+platform-driver-x86@lfdr.de>; Fri, 29 Mar 2024 15:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E847F386;
	Fri, 29 Mar 2024 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tsDzz/ct"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAA1CD21
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711726295; cv=none; b=OYM9huTs162FX0a+THPHRUdLkI6so3oLryAaots4lTQtAnNLUfe/hvXDO7s+GqIUAAoyK4x3xLOcZ/ebRCIfKZXLvUby2eYXIBBf+qbhGLyuBQiiqNRzEAdq8TfryUkR9P3dXEp+Hf4xSZqaZAP6R259Lf9OQxXTYZ2bVfWdBCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711726295; c=relaxed/simple;
	bh=e+BQtyz+R/vmvwkltCBHxspJxIr8Y1jFRmEMtkh4+zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R9OIaBqdhBa+z23QFE38+ulnDWrd1zw0A1ZlgcYbuURPgv0WHj1wHRSLk8m8FkEGRnupUN+lSw533QDbC66oJ6GiSok/RVKMDvYsrQlXQyAobUiYjVVnYZH2JoWUomZZBCjCss3zkHoQ6jBXkYyEItwbo8gRSY80uS9zuYmhv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tsDzz/ct; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4154614b47eso9307375e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711726292; x=1712331092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m258F6KAkYv5whie4zvIuYfAIKK7ihN/LQFSFmJvAXE=;
        b=tsDzz/ctbicTBC2clp3aJjyRpB8jD4MGMAz+WefIrRl3H0KoPVjUcfKg7NKNPQWxxm
         1Skhaz9VSCAhKj6k5hSowE2V1lsLtg0RCRIXtOAdWNjyAQFx5wjr2nnAlldy8TJGf2bb
         YxHOyT+P93fg9MF60tEgiIn9/mz1VoVR6qh+y3ThdnyNXpkq5+f+IE2KrcjHfCk152Zi
         GIXkEGiIz1h2pDp5eNZ2CzDnE/LsGRiOz4lirpXKaSAYWl4V8HaD0tbAH0GZowQCoftV
         q2hz8Y/ozopHAL43C4hKZ1u7noyyZffNOGTUP/FxHK8ihvu4JGHc92xBxyY5FzLQdYSF
         H+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711726292; x=1712331092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m258F6KAkYv5whie4zvIuYfAIKK7ihN/LQFSFmJvAXE=;
        b=YeLtXGj6yEwrIrLzZzP71153K3fctdtah5ei95ya6gsBORuz1hJQbVylNpDLZ7zqyq
         gTVoHCvubBsrgfb29rZ+aDgEyfl4NBKfRzDjvt9hhSwITeDbPPlEcpUZt+0V8uITM2hn
         EV/JQqsS8QZnYEydBrJLlwB80Uq3M/XcS8ujm69mbYt0db39X8r/shUC+rGMyDLsxeBv
         XvTR1zWTE72tLKSw6E9vJXTuB8x7Zw0jQcROSoVZikhoVJb8vrMUukCOIYaOK76Nvrrs
         ZmnOaCryjkFWTk5DeiRWjEF5SS7mLD6jpXeRk6FCiS4VMDOGGqbKX+Srsi/yPguKTIgC
         dTjw==
X-Gm-Message-State: AOJu0YyUHrfxdgAsqBHEFMGIRLsgqXTnBgKWdGXQ0I6a/bzQ43Si1BTA
	h7xSmzGWXqjs9Nktpj01XqHxdX1qoButCI7HD3bD6VlbQ1UNGb7zd9kgGVySg+V7ftySD6uVVrP
	bceo8Pg==
X-Google-Smtp-Source: AGHT+IFnFtyz7M0SRCkWW+kdv83i6HZ+Advv4U3i9XwfB4T4hrtqb5rQL5fWiVK95vkYvZTzzDFW9Q==
X-Received: by 2002:a05:600c:1caa:b0:414:8ffb:a6bf with SMTP id k42-20020a05600c1caa00b004148ffba6bfmr4841008wms.18.1711726292181;
        Fri, 29 Mar 2024 08:31:32 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b004140d326399sm7020791wms.1.2024.03.29.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 08:31:31 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: platform-driver-x86@vger.kernel.org,
	jlee@suse.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	onenowy@gmail.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: Add support for Acer PH18-71
Date: Fri, 29 Mar 2024 16:28:00 +0100
Message-ID: <20240329152800.29393-1-bero@baylibre.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Acer Predator PH18-71 to acer_quirks with predator_v4
to support mode button and fan speed sensor.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index ee2e164f86b9c..38c932df6446a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -597,6 +597,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_predator_v4,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Predator PH18-71",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PH18-71"),
+		},
+		.driver_data = &quirk_acer_predator_v4,
+	},
 	{
 		.callback = set_force_caps,
 		.ident = "Acer Aspire Switch 10E SW3-016",
-- 
2.44.0



Return-Path: <platform-driver-x86+bounces-13911-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14DB3C836
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Aug 2025 07:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD1C1B247EA
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Aug 2025 05:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02816284687;
	Sat, 30 Aug 2025 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eA6s4Mca"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA525277C96
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756532070; cv=none; b=GJOP0pu6omevhnotQgk700Zs8Io7KEaPQvwl1pcMAX6V98F+2Bmtzw0/xHsAIhvYPOw4UqVrHeuhIOaYibkClZntgbbF+dwS+ktEmDzRvmQniuYlhGiQG9gfSX5/Y0Ou32cbzM+aO71EEXtsH3YoxkULQ7atS4LfZH0X3znF/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756532070; c=relaxed/simple;
	bh=i5MsBomPmvZvARXlPhnQZIJJ76sehIpcVJk6xtGPPmM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZzneNtzfpYtiIeDhrkte/dbdohjfVVITZ3upNDy7l1Y9es5oIxLuGUVILrh074wjDCu/TQuqmry7ZDz5+/fWYuzMoVkhJULct6C4mKKgdZUav1zIXJlmOmBbDTwlrKcEnc2oTX/0OShGIj4qM0Bb/hwb0I9PkzzD/i9LnmihidQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eA6s4Mca; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-61c6d735e9bso2469656a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Aug 2025 22:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756532067; x=1757136867; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zimki/zwOp+r6f1xZDKXQKE3q1yeo7Wm/nsMmZAsYU=;
        b=eA6s4McaBUlBbr0UXKNluSszylGsOMF8dpj6lB3vRyT+9e5hSpjdVoxdsZZL0YHavR
         AKw2uvCnhUlhTizS3te/5C0ozwo9qjJwfxQxQSM/yQZZkGi9pmNsRl6rK/5ftwWAOekv
         oe1hcS+VI34IOwysZKX5xg67PMNexaxOnAWXB/FC5VB9QY0E9y0kZhAVxoh4+exwpZ+8
         7JrObqey5uprBbR69apjp5aa4zH/tMMR1fVHrFqfVntS9y+6N3qi76VaAndjXs02rZ0n
         9GifpnF4/3+3Sc5oRmoVnWepeiAiNhOVALIjHMCYnzdf7WQKTYuc4SXUIZtDNS7IUuwP
         ziLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756532067; x=1757136867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zimki/zwOp+r6f1xZDKXQKE3q1yeo7Wm/nsMmZAsYU=;
        b=PwD/HgD0udmYqsWBBK1zDCJ1ix0yEJNldtUVfMw5UUOSqzn+FdOPbtYzZ2OCwA8xY0
         4zd0900p4Yl7Dck/kBKaLvmiYvXqVs+19OyPUhOiwTANpi2weNdZdfd8iNvIHsnrOfaq
         /O7QeBLK4hN04UOTS3CgOABO6bTxf9GhP7DEH9+u+XiNBzQbxrhmQDtysGvitSI4fdI8
         meqL5/HRj/FlWqRs57N4ZAWAfssXUScei6jhIUCDANCbV2aMXFlkhR7LEE/hidbw6sY1
         EY0bjBE8JO4bvx/cnZXov5rMvN/jsVkYTT+2aBGtgjblu1UnOyWw9xDhbQKQuA6eeKd8
         76Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Raue+aVa0frpauLK+jr0HHXaUYu5OcPza4WYgsX4pvXPvKLU8Cc6n3v0keMvBHKxeGl/8rihPeKeItBu312P82jj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd4oZ9Mdy3xOVliupqPsBaH3tp7Uedp2BEgdU+A2s4msWYXZTU
	yF1LqnzkcYlhSVG/CWloBd1bX8tjFbUOGKwAFKNONiDGsG+9gGjvl5v5EBvDK93eRnUp3Uijcij
	qj/sgKg==
X-Google-Smtp-Source: AGHT+IG6CJVeBMWJnX2c9NmFJfVhMO1R4hI+uZwvcabTMAXAbkOVLBEDSkpq+WoKzeKeuA0Me6o57/hbQiA=
X-Received: from edad25.prod.google.com ([2002:a05:6402:4019:b0:618:b715:a0e8])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:270e:b0:617:b28c:e134
 with SMTP id 4fb4d7f45d1cf-61d260cc308mr874895a12.0.1756532067341; Fri, 29
 Aug 2025 22:34:27 -0700 (PDT)
Date: Sat, 30 Aug 2025 05:33:57 +0000
In-Reply-To: <20250830053404.763995-1-srosek@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250830053404.763995-1-srosek@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250830053404.763995-6-srosek@google.com>
Subject: [PATCH v1 05/12] ACPI: DPTF: Move INT3403 device IDs to header
From: Slawomir Rosek <srosek@google.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Alex Hung <alexhung@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, 
	AceLan Kao <acelan.kao@canonical.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zhang Rui <rui.zhang@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Tomasz Nowicki <tnowicki@google.com>, 
	Stanislaw Kardach <skardach@google.com>, Michal Krawczyk <mikrawczyk@google.com>, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org, 
	Slawomir Rosek <srosek@google.com>
Content-Type: text/plain; charset="UTF-8"

The ACPI INT3403 device IDs are shared between the DPTF core
and thermal drivers, thus they are moved to the common header.

Signed-off-by: Slawomir Rosek <srosek@google.com>
---
 drivers/acpi/dptf/int340x_thermal.c                    |  9 +--------
 drivers/acpi/int340x_thermal.h                         | 10 ++++++++++
 .../thermal/intel/int340x_thermal/int3403_thermal.c    | 10 ++--------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index cf2e95a4f65a..f042bf22b664 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -16,7 +16,7 @@ static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	ACPI_INT3400_DEVICE_IDS,
 	ACPI_INT3401_DEVICE_IDS,
 	ACPI_INT3402_DEVICE_IDS,
-	{"INT3403"},
+	ACPI_INT3403_DEVICE_IDS,
 	{"INT3404"},
 	{"INT3406"},
 	{"INT3407"},
@@ -25,37 +25,30 @@ static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	{"INT340A"},
 	{"INT340B"},
 	{"INT3532"},
-	{"INTC1043"},
 	{"INTC1044"},
 	{"INTC1045"},
-	{"INTC1046"},
 	{"INTC1047"},
 	{"INTC1048"},
 	{"INTC1049"},
 	{"INTC1050"},
 	{"INTC1060"},
 	{"INTC1061"},
-	{"INTC1062"},
 	{"INTC1063"},
 	{"INTC1064"},
 	{"INTC1065"},
 	{"INTC1066"},
-	{"INTC1069"},
 	{"INTC106A"},
 	{"INTC106B"},
 	{"INTC106C"},
 	{"INTC106D"},
-	{"INTC10A1"},
 	{"INTC10A2"},
 	{"INTC10A3"},
 	{"INTC10A4"},
 	{"INTC10A5"},
-	{"INTC10D5"},
 	{"INTC10D6"},
 	{"INTC10D7"},
 	{"INTC10D8"},
 	{"INTC10D9"},
-	{"INTC10FD"},
 	{"INTC10FE"},
 	{"INTC10FF"},
 	{"INTC1100"},
diff --git a/drivers/acpi/int340x_thermal.h b/drivers/acpi/int340x_thermal.h
index cc1dfa56fc09..3b34b5338618 100644
--- a/drivers/acpi/int340x_thermal.h
+++ b/drivers/acpi/int340x_thermal.h
@@ -24,4 +24,14 @@
 #define ACPI_INT3402_DEVICE_IDS	\
 	{"INT3402"}
 
+#define ACPI_INT3403_DEVICE_IDS	\
+	{"INT3403"},	\
+	{"INTC1043"},	\
+	{"INTC1046"},	\
+	{"INTC1062"},	\
+	{"INTC1069"},	\
+	{"INTC10A1"},	\
+	{"INTC10D5"},	\
+	{"INTC10FD"}
+
 #endif
diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
index ba63796761eb..d246c69d4872 100644
--- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
@@ -12,6 +12,7 @@
 #include <linux/thermal.h>
 #include <linux/platform_device.h>
 #include "int340x_thermal_zone.h"
+#include "../../../../drivers/acpi/int340x_thermal.h"
 
 #define INT3403_TYPE_SENSOR		0x03
 #define INT3403_TYPE_CHARGER		0x0B
@@ -269,14 +270,7 @@ static void int3403_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3403_device_ids[] = {
-	{"INT3403", 0},
-	{"INTC1043", 0},
-	{"INTC1046", 0},
-	{"INTC1062", 0},
-	{"INTC1069", 0},
-	{"INTC10A1", 0},
-	{"INTC10D5", 0},
-	{"INTC10FD", 0},
+	ACPI_INT3403_DEVICE_IDS,
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, int3403_device_ids);
-- 
2.51.0.318.gd7df087d1a-goog



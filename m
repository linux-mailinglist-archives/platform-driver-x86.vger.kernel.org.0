Return-Path: <platform-driver-x86+bounces-14464-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D5FBB3C73
	for <lists+platform-driver-x86@lfdr.de>; Thu, 02 Oct 2025 13:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1513A4606
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Oct 2025 11:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6593115A7;
	Thu,  2 Oct 2025 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yl9o4QIS"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DE30FF29
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Oct 2025 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759404857; cv=none; b=kV5UMEZdYPLoYHhBRlHeXZ0ek4jOz6mONH1Rjv2sOm5NyrFe3oMsFlz4QQP5W5in+Ea+8XbFfVJz5ip4k0q5FmVJYaJw1UK8kvkagtOOZrfrV+SrQK0QGUI7cb8Vid0tnUsmWrd12ed51M8QcHMr7w/vPh1oK37nbMYeoSq/WJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759404857; c=relaxed/simple;
	bh=4OP6QBdFKr1574GZhyc2cb1Lv+GX8ez8QVbJWQWOSGk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d7J5T1RlVt2NY+6Gk517IoOlZfaNArdPCzM5lwZk+AZWzCcUzPQxAhF7OHxK3XOzo3wGrxdx0nLClxS/LJFe0oPyQpaE/Xd5OQLcml3RVAseHiecxOW7/D/JhgNRtNvDUHUwJWbxz21Wi4uh/xeJNLvu/yCwae1ceha1xG5BCuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yl9o4QIS; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-634c01ca90fso1160141a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Oct 2025 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759404854; x=1760009654; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgpUJcZIT53UUziBi2oBrvyEh4rGfYabLqvWzsqp90A=;
        b=yl9o4QISp/HuDiOBl78uizac9ONNsWBTwjSk7NgXErl4BxfQtpffv2wI5ED6LimNq3
         z0X0q86LNIKfevGBCGt7SFDuC16e3cZLAtE+5GaMd/v3zNMsyCW8u6NKaf+LdCbu5L+b
         4b44NeULuk2NrIXQ91iltZaVY6OOu43wvq2h51yFjetvU02ScTDEGf2e8etZFoXj3r6T
         Xolj7ywxVMmJ7wOS8lB5uXuZTGhSQr8OcXG2i8jz9niRHHC42ygPfBW51IAObukXKfRe
         Hnc/rPpjaGrwWNQlCnlgGSfq+wly/kJMmJgen3FPvQ6bzO9y0dl1AoQd+ZY3cSCKZfwm
         mfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759404854; x=1760009654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgpUJcZIT53UUziBi2oBrvyEh4rGfYabLqvWzsqp90A=;
        b=lz2YR/7oGOo2KIcuy/El1/dUixgewrtL5uPK3gkWvxiOcz80cY61e7cb+hsy18dAAa
         P28WTiWfZMhovopGXbh6Mfd6JD/T794BnbLX98oGegynF7R+Ss65napmm5DPb/prPiFB
         a9jtBG3O6rccZIpL/BJS/l075tzQMrqrzvtiqrBj0efmceVcWMyYqOS0Cuuny5RmLngc
         pTgX5O+p7Alr6CilUDa9Q/Yo+WNHUcMLyQ9DwvCHs4HGCi/19JnThdGccMWJvl9k30eI
         HpNHGPuIoXmLLkk4qcRp0JsDaoWmnr00Hm2P5GZCUXfsYnRUYLz0xX73XzNT2z83mZ1s
         Gqlg==
X-Forwarded-Encrypted: i=1; AJvYcCVMCO6W2EgQd0XeJjsUHJjaNCDUFBQ7hzg6AgUNbIkhU1kYbIP8wMZ65bTtkcXj+f7OrPOhwnmiuxKF+iCpsjxHWVWO@vger.kernel.org
X-Gm-Message-State: AOJu0YysMbCx51X9otTFpKVJLyjgLToJO1otwaHdfuLP+cLyGuxbdU0K
	0Ov3oTaAwy8/99vlDcEcbL+MiSitEcbHOG/5q7CNCLC389MA0/mERY9il44uvU50c+ThtdZjyfU
	WfIgjvQ==
X-Google-Smtp-Source: AGHT+IEViJurBgSj1HUwewxJ2lufwYxLh7QiIceZMFqK3KJHnZaS1MP+gTNpl0gquADVo4qzM8B94yHCRDA=
X-Received: from edqm3.prod.google.com ([2002:aa7:c483:0:b0:636:4ff7:efe])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:909:b0:637:ec7d:4d6c
 with SMTP id 4fb4d7f45d1cf-637ec7d4f8cmr859439a12.11.1759404853757; Thu, 02
 Oct 2025 04:34:13 -0700 (PDT)
Date: Thu,  2 Oct 2025 11:34:04 +0000
In-Reply-To: <20251002113404.3117429-1-srosek@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251002113404.3117429-1-srosek@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251002113404.3117429-7-srosek@google.com>
Subject: [PATCH v3 6/6] ACPI: DPTF: Move INT340X enumeration to modules
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

Move enumeration of INT340X ACPI device objects on the platform bus
from DPTF core to thermal drivers using ACPI platform core methods

Signed-off-by: Slawomir Rosek <srosek@google.com>
---
 drivers/acpi/dptf/dptf_pch_fivr.c                       | 2 +-
 drivers/acpi/dptf/dptf_power.c                          | 2 +-
 drivers/acpi/dptf/int340x_thermal.c                     | 7 +++++--
 drivers/acpi/fan_core.c                                 | 2 +-
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 2 +-
 drivers/thermal/intel/int340x_thermal/int3401_thermal.c | 2 +-
 drivers/thermal/intel/int340x_thermal/int3402_thermal.c | 2 +-
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 2 +-
 drivers/thermal/intel/int340x_thermal/int3406_thermal.c | 2 +-
 9 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/dptf/dptf_pch_fivr.c b/drivers/acpi/dptf/dptf_pch_fivr.c
index cb81636a5d63..f3cd52c89e8d 100644
--- a/drivers/acpi/dptf/dptf_pch_fivr.c
+++ b/drivers/acpi/dptf/dptf_pch_fivr.c
@@ -162,7 +162,7 @@ static struct platform_driver pch_fivr_driver = {
 	},
 };
 
-module_platform_driver(pch_fivr_driver);
+module_acpi_platform_driver(pch_fivr_driver);
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/acpi/dptf/dptf_power.c b/drivers/acpi/dptf/dptf_power.c
index d7c59f016083..b85e876b2e85 100644
--- a/drivers/acpi/dptf/dptf_power.c
+++ b/drivers/acpi/dptf/dptf_power.c
@@ -239,7 +239,7 @@ static struct platform_driver dptf_power_driver = {
 	},
 };
 
-module_platform_driver(dptf_power_driver);
+module_acpi_platform_driver(dptf_power_driver);
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index 7d1308b1f513..b2be3a8df9ac 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -27,8 +27,11 @@ static const struct acpi_device_id int340x_thermal_device_ids[] = {
 static int int340x_thermal_handler_attach(struct acpi_device *adev,
 					const struct acpi_device_id *id)
 {
-	if (IS_ENABLED(CONFIG_INT340X_THERMAL))
-		acpi_create_platform_device(adev, NULL);
+	/*
+	 * Do not attach INT340X devices until platform drivers are loaded.
+	 * Enumeration of INT340X ACPI device objects on the platform bus
+	 * should be done by thermal drivers.
+	 */
 	return 1;
 }
 
diff --git a/drivers/acpi/fan_core.c b/drivers/acpi/fan_core.c
index 04ff608f2ff0..61681ff24477 100644
--- a/drivers/acpi/fan_core.c
+++ b/drivers/acpi/fan_core.c
@@ -463,7 +463,7 @@ static struct platform_driver acpi_fan_driver = {
 	},
 };
 
-module_platform_driver(acpi_fan_driver);
+module_acpi_platform_driver(acpi_fan_driver);
 
 MODULE_AUTHOR("Paul Diefenbaugh");
 MODULE_DESCRIPTION("ACPI Fan Driver");
diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
index 6311125c3ebd..0005961328fc 100644
--- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -699,7 +699,7 @@ static struct platform_driver int3400_thermal_driver = {
 		   },
 };
 
-module_platform_driver(int3400_thermal_driver);
+module_acpi_platform_driver(int3400_thermal_driver);
 
 MODULE_DESCRIPTION("INT3400 Thermal driver");
 MODULE_AUTHOR("Zhang Rui <rui.zhang@intel.com>");
diff --git a/drivers/thermal/intel/int340x_thermal/int3401_thermal.c b/drivers/thermal/intel/int340x_thermal/int3401_thermal.c
index e0603f218d2e..d496f8b171e0 100644
--- a/drivers/thermal/intel/int340x_thermal/int3401_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3401_thermal.c
@@ -69,7 +69,7 @@ static struct platform_driver int3401_driver = {
 	},
 };
 
-module_platform_driver(int3401_driver);
+module_acpi_platform_driver(int3401_driver);
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_DESCRIPTION("Processor Thermal Reporting Device Driver");
diff --git a/drivers/thermal/intel/int340x_thermal/int3402_thermal.c b/drivers/thermal/intel/int340x_thermal/int3402_thermal.c
index 213d4535f2c1..d06c06fadce5 100644
--- a/drivers/thermal/intel/int340x_thermal/int3402_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3402_thermal.c
@@ -100,7 +100,7 @@ static struct platform_driver int3402_thermal_driver = {
 		   },
 };
 
-module_platform_driver(int3402_thermal_driver);
+module_acpi_platform_driver(int3402_thermal_driver);
 
 MODULE_DESCRIPTION("INT3402 Thermal driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
index d246c69d4872..33735515b47d 100644
--- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
@@ -284,7 +284,7 @@ static struct platform_driver int3403_driver = {
 	},
 };
 
-module_platform_driver(int3403_driver);
+module_acpi_platform_driver(int3403_driver);
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/thermal/intel/int340x_thermal/int3406_thermal.c b/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
index d05ca8bc4061..03cc026cdffb 100644
--- a/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
@@ -203,7 +203,7 @@ static struct platform_driver int3406_thermal_driver = {
 		   },
 };
 
-module_platform_driver(int3406_thermal_driver);
+module_acpi_platform_driver(int3406_thermal_driver);
 
 MODULE_DESCRIPTION("INT3406 Thermal driver");
 MODULE_LICENSE("GPL v2");
-- 
2.51.0.618.g983fd99d29-goog



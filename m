Return-Path: <platform-driver-x86+bounces-13913-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287FB3C83C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Aug 2025 07:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7275850E4
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Aug 2025 05:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93D52877CB;
	Sat, 30 Aug 2025 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ix6H+lzR"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7887283C8E
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756532072; cv=none; b=YxcoislJqAR7PTSA3T/S9J9CiGauoZSKzjKaD6TkjxBUkF1q0FfSbfe3co6NOtOD9IPtjRKjFL03H8G6I7ydbZpFp5cwDDElEEnj1ls+Hr+wlGHMQIzXwAwxhsxrckL5wFbQtl9DTiJX8fGZuvMAQeL8E/rfd3bq1+d0/AfUKrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756532072; c=relaxed/simple;
	bh=dQAOrGekz6zChuoQRjAATB5KSFFu0zYpdpAdPSxbqDE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lf8tFhx6IXPI5lC5BUxT9clxkGZh3NqQ2eyQKC8D2STxlXx+fiUsfNhALSzD+ol10KBCrwZZLHw2xu5OOZpS3RWBDMg0aURYJkc7m/Iny3TPD1wt3XgstpAVaunEX4xpNAlU2tdfVl6QdpRdhx55wyJJhMMcowxwIHiDNwbtDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ix6H+lzR; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-61d2096224bso471226a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Aug 2025 22:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756532069; x=1757136869; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGeMur4fUxttqE8wvIu4puQb64CSg/KvtrOy/q9BAQE=;
        b=ix6H+lzRG5HsLtU6T7ef7tdJttbhMRtzwcavzS1xBo9R9HTH35IX9r+A6hlvnDR51p
         yOez9QUrkZY+NeGUlvdJdUxNIbB5eS3oOVJhAd/XG4WxpR9AGxX8XIG6UgSvbNkwLr/J
         QtwhSUGtEBJBnV9PvtVq+vjAWNRII85L+A3flWwUY9YPuE9sClwyxmVyFTDAHt9tyyy1
         LHZj/DCNSMH4UG8ypsfjTuQ0EvM2UFu0ink4fqrm0abthP6BNIkF4k6G+SGk1+vd2yyC
         xYLfDhs4Eo4fjy70Vp2LdkDVgNqZxcox15Zoifc+NzHucYF5tNEl1zZMXOpvehj4YPUL
         wnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756532069; x=1757136869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGeMur4fUxttqE8wvIu4puQb64CSg/KvtrOy/q9BAQE=;
        b=sEgWEnlLqcKY5Vl+g+KNyfmG4yMmTUJ9vji2QqA5YiljT812yXXB8O/2bYnB1B72RO
         F1mQUUV91UAAaOYifNZn9oukzWyT0obERzw3sZQRoSzeGB41o5raNDrmJ2oc7NR+27UT
         S2DGNEWPvkipwAftECqiH/3Nn6aIMHpC4gQk7/r5qfZPPwYVhy7+LhuftNxPyxjQGzq6
         OHD8PdZg94ubROXg4AQ50WEGPR91GDMjKbZvmDXGpstm0Z5IaBEq78fY7XFleqTKxiGP
         jOpKIQrHdkdHUwvINfsE+WFpNV27e06yRLI5bCXyRwB2cBqSms/RmerNAXsXPL6cB99a
         0DGg==
X-Forwarded-Encrypted: i=1; AJvYcCWGtLNTz17A7+/nIYS+ozIeL7omYcrmQ+sh9yttJvVpiWjSfVe+9kDt3eQzsbslyteJsVWPxr0F/SK07U8IVb38biFW@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTiZj+Q9IDu94HT9pEtMtBQJyBnND3LshTMHzjoh06nogCnp/
	L3tLWnIaHoxlye4e2abxicrXsYu+8EkZlpNRZRfRk6+oXxCYIGFXEovlLYi0c4mIuy3MHoBkAMJ
	GJMde5g==
X-Google-Smtp-Source: AGHT+IHSsYU/I0Cbka4jlBah30LsSVhahauBm0YkEEAXHmzhK820kNJASrzqj4XhIscX8zopfxrYNc/A+gU=
X-Received: from edbio8.prod.google.com ([2002:a05:6402:2188:b0:617:8b41:2efd])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35d3:b0:61d:13b:3c6d
 with SMTP id 4fb4d7f45d1cf-61d26c3339amr941002a12.24.1756532069249; Fri, 29
 Aug 2025 22:34:29 -0700 (PDT)
Date: Sat, 30 Aug 2025 05:33:59 +0000
In-Reply-To: <20250830053404.763995-1-srosek@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250830053404.763995-1-srosek@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250830053404.763995-8-srosek@google.com>
Subject: [PATCH v1 07/12] ACPI: DPTF: Move INT3406 device IDs to header
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

The ACPI INT3406 device IDs are shared between the DPTF core
and thermal drivers, thus they are moved to the common header.

Signed-off-by: Slawomir Rosek <srosek@google.com>
---
 drivers/acpi/dptf/int340x_thermal.c                     | 2 +-
 drivers/acpi/int340x_thermal.h                          | 3 +++
 drivers/thermal/intel/int340x_thermal/int3406_thermal.c | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index be2299aadcff..131648ddec87 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -18,7 +18,7 @@ static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	ACPI_INT3402_DEVICE_IDS,
 	ACPI_INT3403_DEVICE_IDS,
 	ACPI_INT3404_DEVICE_IDS,
-	{"INT3406"},
+	ACPI_INT3406_DEVICE_IDS,
 	{"INT3407"},
 	{"INT3408"},
 	{"INT3409"},
diff --git a/drivers/acpi/int340x_thermal.h b/drivers/acpi/int340x_thermal.h
index d1ffa9c3cfb7..946f5bb23b44 100644
--- a/drivers/acpi/int340x_thermal.h
+++ b/drivers/acpi/int340x_thermal.h
@@ -44,4 +44,7 @@
 	{"INTC10D6", }, /* Fan for Panther Lake generation */ \
 	{"INTC10FE", } /* Fan for Wildcat Lake generation */
 
+#define ACPI_INT3406_DEVICE_IDS	\
+	{"INT3406"}
+
 #endif
diff --git a/drivers/thermal/intel/int340x_thermal/int3406_thermal.c b/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
index e21fcbccf4ba..d05ca8bc4061 100644
--- a/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
@@ -12,6 +12,7 @@
 #include <linux/backlight.h>
 #include <linux/thermal.h>
 #include <acpi/video.h>
+#include "../../../../drivers/acpi/int340x_thermal.h"
 
 #define INT3406_BRIGHTNESS_LIMITS_CHANGED	0x80
 
@@ -187,7 +188,7 @@ static void int3406_thermal_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3406_thermal_match[] = {
-	{"INT3406", 0},
+	ACPI_INT3406_DEVICE_IDS,
 	{}
 };
 
-- 
2.51.0.318.gd7df087d1a-goog



Return-Path: <platform-driver-x86+bounces-4781-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0242994F6D6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2024 20:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B731C21A74
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2024 18:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BCA18C330;
	Mon, 12 Aug 2024 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="noSaYr/R"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89C12B9B7
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723488118; cv=none; b=pkHZ4jDSVFZLxP4/qDf1KCPFbq7HTMeIdDZZwLzAYGUoiR17dHVH87xiKFJZo+oUPRKbCH6+lauFkFgaYBdbSgPJRbgehmD62ogkg5LyVWkGkTgQlYsJvGZer5LhA+axb7FAp2+1B4C14hJRjyT16j6e2GOX3pFTaz7+Cjnrvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723488118; c=relaxed/simple;
	bh=AAhoSUedFQ21Pzt+ZLf5UI+xIte0RYuXGfOPV8lhJkQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AfY52McciUwgJ+wi99TqwftCF+ZvWHGFoJoR2/CFHVIWzP5FLdI9QKHACMKmGWOqspzam20o5r+6U89IyeaZlRItVjyfR5Ys15UJxm06dfMduxPLWwMG3KY0PJl+JEWbtF3LFccXYIrj0SABz3yTAyA4M4Wy41e3GsylgCAaKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=noSaYr/R; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-66890dbb7b8so108302187b3.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723488116; x=1724092916; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nI7HvxsW6/J3qlupAqXzePRp1xg6T40uW8wUoGhn2xg=;
        b=noSaYr/RV8h//OC8Ml5d4jnyUYR/nfw+dhI8xPmK31/2A2i/3mXf16KeNcgMGkqUCg
         C45ErjiBkKvQEQjLH1iOKm5bkHu2w8egQe7QfcIaVXFJpL6DdasjtFfc9gsWAvLUFLXd
         qmB+hhVyfqpsvh+aznlRZbe/qGRYtErOLIYhh2yTGaNk+EHYC+d7W7N1/SmlRfgxpDtX
         1up9vKqUvrdPMXMMuZQMO0+y8oKdM/28odd3lTz4lm3nQdVQxPzW6zb19B168eRbFf4t
         s+JGIigQdZP94kPOrPMEDxTJRL0jL3fl+G6Ux1YgHUhJmW0N1sq46PmaPvFMGmKNsg+b
         zwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723488116; x=1724092916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nI7HvxsW6/J3qlupAqXzePRp1xg6T40uW8wUoGhn2xg=;
        b=TKtdO/qtal8YAaWdG1GGDGtTmE+R+yyD73/J2qFquhYHJaDpG/fi0EF1KcOCJxpJFw
         62vJ3Gc+3aKxCRRe97Qm5nTxYWtt00+b60T1Q6DMPpy+4WtS5BOghRF0aEPwyWH2Ynjk
         Iddg8y1FMJpx/0N3u/yGxDNb8rkJx2+rt/zO0qVsEdBfKK1kfGh8Q+e4YiZKCq9/jwNu
         UnP9gtrvtUduQFP2b6TZhHY1iqwMqbar4FLOKwBHDTQkB98dPp4LZDMOMjndhsHG0g5a
         rPxXkFcEQASvk9Ycgoomk1OJXTZufxqNDgirjkYe3JzY2WV+lsGnElYvuDHPen2522VO
         MUoA==
X-Forwarded-Encrypted: i=1; AJvYcCV0HDcYMIYAB/dWYGlDh2q4mAucs6SIkPOCVLG+qpM5peiGuaQ9WVrF/I5KxIpVkVsL5kvsCrNpJnKsnb0Lu6J7pFEWJ6BG9BCWLWKTTcbw2f5xvA==
X-Gm-Message-State: AOJu0Yz7r14i0OZ0GTgT+dQwJU1RxJgw1pZKmHMKyux8zDiN0xaAeX7f
	2X2W64fUmhBKEvpOSa1pVJktFMAqSF+mI/dKLNCSeSJsTPgQvvHJVX2EeLjym/umsYrUYLZjHjM
	AiNJfvJ5ktmfDCg==
X-Google-Smtp-Source: AGHT+IHyX7O3OMhj0SimuYiJ6Gy10rgLPqYfuUi/gIFhYUEZSR1qaftT6St/zesxOuoSti285RBcVCrSUaKbXJo=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a05:690c:d8c:b0:667:8a45:d0f9 with SMTP
 id 00721157ae682-6a96c03e52dmr114577b3.0.1723488115781; Mon, 12 Aug 2024
 11:41:55 -0700 (PDT)
Date: Mon, 12 Aug 2024 18:41:42 +0000
In-Reply-To: <935e8c82-3c91-4c9a-8e43-e6045b28279d@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <935e8c82-3c91-4c9a-8e43-e6045b28279d@redhat.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240812184150.1079924-1-mmaslanka@google.com>
Subject: [PATCH v6 1/2] clocksource: acpi_pm: Add external callback for suspend/resume
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Provides the capability to register an external callback for the ACPI PM
timer, which is called during the suspend and resume processes.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>

---
Changes in v6:
- Add the acpi_pmtmr_unregister_suspend_resume_callback function to remove callback
- Add EXPORT_SYMBOL_GPL to the added functions
- Link to v5: https://lore.kernel.org/lkml/20240812043741.3434744-1-mmaslanka@google.com/
---
---
 drivers/clocksource/acpi_pm.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/acpi_pmtmr.h    | 13 +++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/clocksource/acpi_pm.c b/drivers/clocksource/acpi_pm.c
index 82338773602ca..b4330a01a566b 100644
--- a/drivers/clocksource/acpi_pm.c
+++ b/drivers/clocksource/acpi_pm.c
@@ -25,6 +25,10 @@
 #include <asm/io.h>
 #include <asm/time.h>
 
+static void *suspend_resume_cb_data;
+
+static void (*suspend_resume_callback)(void *data, bool suspend);
+
 /*
  * The I/O port the PMTMR resides at.
  * The location is detected during setup_arch(),
@@ -58,6 +62,32 @@ u32 acpi_pm_read_verified(void)
 	return v2;
 }
 
+void acpi_pmtmr_register_suspend_resume_callback(void (*cb)(void *data, bool suspend), void *data)
+{
+	suspend_resume_callback = cb;
+	suspend_resume_cb_data = data;
+}
+EXPORT_SYMBOL_GPL(acpi_pmtmr_register_suspend_resume_callback);
+
+void acpi_pmtmr_unregister_suspend_resume_callback(void)
+{
+	suspend_resume_callback = NULL;
+	suspend_resume_cb_data = NULL;
+}
+EXPORT_SYMBOL_GPL(acpi_pmtmr_unregister_suspend_resume_callback);
+
+static void acpi_pm_suspend(struct clocksource *cs)
+{
+	if (suspend_resume_callback)
+		suspend_resume_callback(suspend_resume_cb_data, true);
+}
+
+static void acpi_pm_resume(struct clocksource *cs)
+{
+	if (suspend_resume_callback)
+		suspend_resume_callback(suspend_resume_cb_data, false);
+}
+
 static u64 acpi_pm_read(struct clocksource *cs)
 {
 	return (u64)read_pmtmr();
@@ -69,6 +99,8 @@ static struct clocksource clocksource_acpi_pm = {
 	.read		= acpi_pm_read,
 	.mask		= (u64)ACPI_PM_MASK,
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.suspend	= acpi_pm_suspend,
+	.resume		= acpi_pm_resume,
 };
 
 
diff --git a/include/linux/acpi_pmtmr.h b/include/linux/acpi_pmtmr.h
index 50d88bf1498d7..0ded9220d379c 100644
--- a/include/linux/acpi_pmtmr.h
+++ b/include/linux/acpi_pmtmr.h
@@ -26,6 +26,19 @@ static inline u32 acpi_pm_read_early(void)
 	return acpi_pm_read_verified() & ACPI_PM_MASK;
 }
 
+/**
+ * Register callback for suspend and resume event
+ *
+ * @cb Callback triggered on suspend and resume
+ * @data Data passed with the callback
+ */
+void acpi_pmtmr_register_suspend_resume_callback(void (*cb)(void *data, bool suspend), void *data);
+
+/**
+ * Remove registered callback for suspend and resume event
+ */
+void acpi_pmtmr_unregister_suspend_resume_callback(void);
+
 #else
 
 static inline u32 acpi_pm_read_early(void)
-- 
2.46.0.76.ge559c4bf1a-goog



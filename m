Return-Path: <platform-driver-x86+bounces-5410-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A17397CCBA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Sep 2024 18:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9B501F23CE3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Sep 2024 16:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D0D1A0AFB;
	Thu, 19 Sep 2024 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jOuy5kTC"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4D1A08C0
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726764841; cv=none; b=nRhSVKhl0K1lv3LlU2//N2qBURkZPap1xZzaT8bk7shwmXZdE4I0RxL4LjHsiKngRHsvxRnob1ue6JxeycImJBijHe/q4cjsdxjgxeua4sa0UGrCoNCuy1x5dHHp5qpYakP6QEKMp/uXAMNuKeivFLjbOC5+4KzeE24LSjveE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726764841; c=relaxed/simple;
	bh=r83giQhv+wdGkGVm0A1lTterNV2Xu2zbcG8fllzeV8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzox5WKqQCNSsGDAkTvWS1iqfbPZnGWfguqdv4hDht50h7qznhSK9mz6xJwoJA0raoHfRW46Zl0D38iY9iKiW32Xtr+VRdGLv2xaNdFgirMNh8ujrfcvf8CSmEV6t0WWqQX2nZuiF0VpFLi7hOgF7Fc0JJzwTjreLZYAE0uOzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jOuy5kTC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726764838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aSuHNzG8p7jlj6yGR863iiZBqKSDhQlRijPfqGucVxc=;
	b=jOuy5kTCY7BtMDQiGmSbm2oVQhfG+jyeOqMT45sCM9mC7OjwP8JRxpMS217lF19AuTKULT
	mGZXMk4W/8VRo7iQWYFyKXe3GakXzKX5w5H+GrmHxUo9dga+njcFc/sl3NILXJj+oPHQ6f
	ymOQUvzOJEgMVpvOlx/7QUJPGcdwIr0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-552-cH2fokswO3aJrv3g-uTOdg-1; Thu,
 19 Sep 2024 12:53:55 -0400
X-MC-Unique: cH2fokswO3aJrv3g-uTOdg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7D84193611B;
	Thu, 19 Sep 2024 16:53:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.90])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF4481956060;
	Thu, 19 Sep 2024 16:53:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	regressions@lists.linux.dev,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Marek Maslanka <mmaslanka@google.com>
Subject: [PATCH] platform/x86:intel/pmc: Leave ACPI PM Timer alone when using S3 suspend
Date: Thu, 19 Sep 2024 18:53:49 +0200
Message-ID: <20240919165349.235777-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Disabling the ACPI PM timer causes suspend to no longer work on
a Intel Kaby Lake Dell XPS 13 using deep / S3 suspend.

The power-savings from disabling the pm-timer are mostly relevant for
s0ix suspend. If regular S3 suspend is used the firmware is in control of
the suspend and if necessary it should disable the timer if necessary.

Limit the disabling of the ACPI PM Timer on suspend to when using
S0ix (so not firmware, but OS handled) suspend to fix this.

Fixes: e86c8186d03a ("platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/linux-pm/18784f62-91ff-4d88-9621-6c88eb0af2b5@molgen.mpg.de/
Cc: Marek Maslanka <mmaslanka@google.com>
Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/pmc/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index f443bf8bb82c..c753f013b59d 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1275,6 +1275,10 @@ static void pmc_core_acpi_pm_timer_suspend_resume(void *data, bool suspend)
 	if (!map->acpi_pm_tmr_ctl_offset)
 		return;
 
+	/* Check if the suspend will actually use S0ix */
+	if (suspend && pm_suspend_via_firmware())
+		return;
+
 	guard(mutex)(&pmcdev->lock);
 
 	if (!suspend && !pmcdev->enable_acpi_pm_timer_on_resume)
-- 
2.46.0



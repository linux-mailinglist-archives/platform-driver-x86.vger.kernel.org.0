Return-Path: <platform-driver-x86+bounces-487-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87650816E61
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Dec 2023 13:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A9341C24462
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Dec 2023 12:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBAF37870;
	Mon, 18 Dec 2023 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpMVjOg+"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C92B3786B;
	Mon, 18 Dec 2023 12:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D19C433C9;
	Mon, 18 Dec 2023 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702903476;
	bh=VaGdVRt6EH+pJSceuZvmm0LcghXBIcZ+HhWT582K8jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GpMVjOg+HZcothJWThnBrFfSVZZtSJ/t9A9d6we82heYnImaEmKNnEFiuupTidS48
	 xxlDp1kPXl3waWknwmoQ5YGdOf6h68x74ZXu/1fkAs28NnjUsFMIXPrv5biKHIpJ1H
	 YPDsGDfAKfm79DuiQvslYzu6gySmHNxkdMaVp5Twzy2RUM9KgA0E4nKhU/psqkfhih
	 NovCGK5/Op8M6E/Ccfa2lPN2/atEYiPvxATAkkgE+mkfA7GiR5kn6uPTXHBqOSjVn1
	 oR/blUSTgRkdWIGVsX1tzBsT5ak6ZO9bs6t64LOGi6PDULModDq0dmujSzGQ4PlPjq
	 jRvOjWw+/fEgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Arnold Gozum <arngozum@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	acelan.kao@canonical.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 09/18] platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
Date: Mon, 18 Dec 2023 07:43:43 -0500
Message-ID: <20231218124415.1379060-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218124415.1379060-1-sashal@kernel.org>
References: <20231218124415.1379060-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.7
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 14c200b7ca46b9a9f4af9e81d258a58274320b6f ]

2 issues have been reported on the Dell Inspiron 7352:

1. Sometimes the tablet-mode-switch stops reporting tablet-mode
   change events.

   Add a "VBDL" call to notify_handler() to work around this.

2. Sometimes the tablet-mode is incorrect after suspend/resume

   Add a detect_tablet_mode() to resume() to fix this.

Reported-by: Arnold Gozum <arngozum@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com/
Tested-by: Arnold Gozum <arngozum@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/r/20231204150601.46976-1-hdegoede@redhat.com
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel/vbtn.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 6fa1735ad7a49..210b0a81b7ecb 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -73,10 +73,10 @@ struct intel_vbtn_priv {
 	bool wakeup_mode;
 };
 
-static void detect_tablet_mode(struct platform_device *device)
+static void detect_tablet_mode(struct device *dev)
 {
-	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
-	acpi_handle handle = ACPI_HANDLE(&device->dev);
+	struct intel_vbtn_priv *priv = dev_get_drvdata(dev);
+	acpi_handle handle = ACPI_HANDLE(dev);
 	unsigned long long vgbs;
 	acpi_status status;
 	int m;
@@ -89,6 +89,8 @@ static void detect_tablet_mode(struct platform_device *device)
 	input_report_switch(priv->switches_dev, SW_TABLET_MODE, m);
 	m = (vgbs & VGBS_DOCK_MODE_FLAG) ? 1 : 0;
 	input_report_switch(priv->switches_dev, SW_DOCK, m);
+
+	input_sync(priv->switches_dev);
 }
 
 /*
@@ -134,7 +136,7 @@ static int intel_vbtn_input_setup(struct platform_device *device)
 	priv->switches_dev->id.bustype = BUS_HOST;
 
 	if (priv->has_switches) {
-		detect_tablet_mode(device);
+		detect_tablet_mode(&device->dev);
 
 		ret = input_register_device(priv->switches_dev);
 		if (ret)
@@ -198,6 +200,9 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
 
 	sparse_keymap_report_event(input_dev, event, val, autorelease);
+
+	/* Some devices need this to report further events */
+	acpi_evaluate_object(handle, "VBDL", NULL, NULL);
 }
 
 /*
@@ -352,7 +357,13 @@ static void intel_vbtn_pm_complete(struct device *dev)
 
 static int intel_vbtn_pm_resume(struct device *dev)
 {
+	struct intel_vbtn_priv *priv = dev_get_drvdata(dev);
+
 	intel_vbtn_pm_complete(dev);
+
+	if (priv->has_switches)
+		detect_tablet_mode(dev);
+
 	return 0;
 }
 
-- 
2.43.0



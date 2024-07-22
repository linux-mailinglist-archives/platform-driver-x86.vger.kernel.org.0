Return-Path: <platform-driver-x86+bounces-4463-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5FC938D79
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jul 2024 12:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 583F828698E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jul 2024 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D7B16C6BE;
	Mon, 22 Jul 2024 10:28:55 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9E6168498;
	Mon, 22 Jul 2024 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644135; cv=none; b=NsUfShcYSSoVsXSMpZkmJsewHnJj/wj338YS1bMAOFfFQnM9NPiGnPMDqudQtk2X+30YnJJ48oICkelP78w8ACnOSKWnS4xYaUK04hwdIHtym2lFF1ldfpBnsoigyvYT1CjuZ915X6lm1UHVgvLmOqygU2Y6hcPko5/8uteY3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644135; c=relaxed/simple;
	bh=VQDKFcoOxMKGDPSCKWVQ27wov+YG6LkdDqErAAwXv44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QdLpc/PzdwgLEWLyRVVas3Wqm09qutHrf11LEL/tet8A364E9WmBNAhtW1a4S7GUllCquIzRw0qJSKMarK+HGzOqh4Ahn/hssJkO4jP4T8aS5PBqA3OiODHW+baxnBkBY1abWCxA//a3S/YfHYzS51HQRGEJIZzPE38ksptXmI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68624.dsl.pool.telekom.hu [::ffff:81.182.134.36])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000738C3.00000000669E345D.001898B4; Mon, 22 Jul 2024 12:28:45 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Hans de Goede <hdegoede@redhat.com>,
  =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
  Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v3 1/4] platform/x86: ideapad-laptop: introduce a generic notification chain
Date: Mon, 22 Jul 2024 12:27:21 +0200
Message-ID: <c5a43efae8a32bd034c3d19c0a686941347575a7.1721294787.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721294787.git.soyer@irl.hu>
References: <cover.1721294787.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

There are several cases where a notification chain can simplify Lenovo
WMI drivers.

Add a generic notification chain into ideapad-laptop.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/platform/x86/ideapad-laptop.c | 37 +++++++++++++++++++++++++++
 drivers/platform/x86/ideapad-laptop.h |  5 ++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1ace711f7442..866b32bfe2c9 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1592,6 +1592,39 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	priv->r_touchpad_val = value;
 }
 
+static int ideapad_laptop_nb_notify(struct notifier_block *nb,
+				    unsigned long action, void *data)
+{
+	switch (action) {
+	}
+
+	return 0;
+}
+
+static struct notifier_block ideapad_laptop_notifier = {
+	.notifier_call = ideapad_laptop_nb_notify,
+};
+
+static BLOCKING_NOTIFIER_HEAD(ideapad_laptop_chain_head);
+
+int ideapad_laptop_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&ideapad_laptop_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(ideapad_laptop_register_notifier, IDEAPAD_LAPTOP);
+
+int ideapad_laptop_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&ideapad_laptop_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(ideapad_laptop_unregister_notifier, IDEAPAD_LAPTOP);
+
+void ideapad_laptop_call_notifier(unsigned long action, void *data)
+{
+	blocking_notifier_call_chain(&ideapad_laptop_chain_head, action, data);
+}
+EXPORT_SYMBOL_NS_GPL(ideapad_laptop_call_notifier, IDEAPAD_LAPTOP);
+
 static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct ideapad_private *priv = data;
@@ -1974,6 +2007,8 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (err)
 		goto shared_init_failed;
 
+	ideapad_laptop_register_notifier(&ideapad_laptop_notifier);
+
 	return 0;
 
 shared_init_failed:
@@ -2006,6 +2041,8 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 	struct ideapad_private *priv = dev_get_drvdata(&pdev->dev);
 	int i;
 
+	ideapad_laptop_unregister_notifier(&ideapad_laptop_notifier);
+
 	ideapad_shared_exit(priv);
 
 	acpi_remove_notify_handler(priv->adev->handle,
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
index 4498a96de597..3eb0dcd6bf7b 100644
--- a/drivers/platform/x86/ideapad-laptop.h
+++ b/drivers/platform/x86/ideapad-laptop.h
@@ -12,6 +12,11 @@
 #include <linux/acpi.h>
 #include <linux/jiffies.h>
 #include <linux/errno.h>
+#include <linux/notifier.h>
+
+int ideapad_laptop_register_notifier(struct notifier_block *nb);
+int ideapad_laptop_unregister_notifier(struct notifier_block *nb);
+void ideapad_laptop_call_notifier(unsigned long action, void *data);
 
 enum {
 	VPCCMD_R_VPC1 = 0x10,
-- 
2.45.2



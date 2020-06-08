Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F231F2FAB
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Jun 2020 02:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgFIAwm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Jun 2020 20:52:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:55900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728282AbgFHXJ7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Jun 2020 19:09:59 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D536208A9;
        Mon,  8 Jun 2020 23:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591657799;
        bh=ACdQ3qp26A1ZlMF9aC8M8fXP/Db9ZuKGda0HYAtZQ28=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FVevOBihoFE3QMqezExPdcQZn8WE7dnnGmT2wwLqe7tEt7urLoQI6d/USyh9+vCa+
         Jzok8YKq8Xf/Fa5gqwqQad75XTyXxlPnjFCp2qWnrKjBxT/PGRJFldNWWc9/EzJyUb
         kw60quRPVtZqX1Wt5shRrOcTGiUh06BVMcTEeK5s=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 177/274] platform/x86: intel-vbtn: Do not advertise switches to userspace if they are not there
Date:   Mon,  8 Jun 2020 19:04:30 -0400
Message-Id: <20200608230607.3361041-177-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 990fbb48067bf8cfa34b7d1e6e1674eaaef2f450 ]

Commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
switch on 2-in-1's") added a DMI chassis-type check to avoid accidentally
reporting SW_TABLET_MODE = 1 to userspace on laptops (specifically on the
Dell XPS 9360), to avoid e.g. userspace ignoring touchpad events because
userspace thought the device was in tablet-mode.

But if we are not getting the initial status of the switch because the
device does not have a tablet mode, then we really should not advertise
the presence of a tablet-mode switch to userspace at all, as userspace may
use the mere presence of this switch for certain heuristics.

Fixes: de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode switch on 2-in-1's")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel-vbtn.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 634096cef21a..500fae82e12c 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -55,6 +55,7 @@ static const struct key_entry intel_vbtn_switchmap[] = {
 struct intel_vbtn_priv {
 	struct key_entry keymap[KEYMAP_LEN];
 	struct input_dev *input_dev;
+	bool has_switches;
 	bool wakeup_mode;
 };
 
@@ -70,7 +71,7 @@ static int intel_vbtn_input_setup(struct platform_device *device)
 		keymap_len += ARRAY_SIZE(intel_vbtn_keymap);
 	}
 
-	if (true) {
+	if (priv->has_switches) {
 		memcpy(&priv->keymap[keymap_len], intel_vbtn_switchmap,
 		       ARRAY_SIZE(intel_vbtn_switchmap) *
 		       sizeof(struct key_entry));
@@ -138,16 +139,12 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 
 static void detect_tablet_mode(struct platform_device *device)
 {
-	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
 	unsigned long long vgbs;
 	acpi_status status;
 	int m;
 
-	if (!(chassis_type && strcmp(chassis_type, "31") == 0))
-		return;
-
 	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
 	if (ACPI_FAILURE(status))
 		return;
@@ -158,6 +155,19 @@ static void detect_tablet_mode(struct platform_device *device)
 	input_report_switch(priv->input_dev, SW_DOCK, m);
 }
 
+static bool intel_vbtn_has_switches(acpi_handle handle)
+{
+	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
+	unsigned long long vgbs;
+	acpi_status status;
+
+	if (!(chassis_type && strcmp(chassis_type, "31") == 0))
+		return false;
+
+	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
+	return ACPI_SUCCESS(status);
+}
+
 static int intel_vbtn_probe(struct platform_device *device)
 {
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
@@ -176,13 +186,16 @@ static int intel_vbtn_probe(struct platform_device *device)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
 
+	priv->has_switches = intel_vbtn_has_switches(handle);
+
 	err = intel_vbtn_input_setup(device);
 	if (err) {
 		pr_err("Failed to setup Intel Virtual Button\n");
 		return err;
 	}
 
-	detect_tablet_mode(device);
+	if (priv->has_switches)
+		detect_tablet_mode(device);
 
 	status = acpi_install_notify_handler(handle,
 					     ACPI_DEVICE_NOTIFY,
-- 
2.25.1


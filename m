Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630A141A77E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Sep 2021 07:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239090AbhI1F5g (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Sep 2021 01:57:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238935AbhI1F5K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 01:57:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EC0C611CE;
        Tue, 28 Sep 2021 05:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632808531;
        bh=jGOYxpRgIXc8g3UFir3TVK0TktrZ19tVxEQrjNYeP80=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gSMRdHmsepYdiMqqus04BTo6Ky6kIsEu6IXnI6tR3WdsrpSYgUx9+dcL8nDB3yKeJ
         JkkATjN4XLGwORnjNRTenuXGFbSdaegQZkyQelBagB09Ep8bWn8hXVL1bQjpkfSVNh
         +aNwgViTvImKzxEu6+M1d4QT3tkY/6c6HK8TvyDOuVpUOa1xE8IEz9UVz21R5Gh0ID
         WRgE3QYxLtMYDf8oD24sXYeNp1pXjkO8AFcKVTIKvs/vrIouAddl+zYHiNdc76tv1N
         p41MKm2eUtrsghybA7TURAnYrpdlpOCbGf6yvCKnyMUzHC1EZGj2BOalmtS8FNsJbS
         MIB+K+GO9xYug==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Tobias Gurtzick <magic@wizardtales.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 11/40] platform/x86/intel: hid: Add DMI switches allow list
Date:   Tue, 28 Sep 2021 01:54:55 -0400
Message-Id: <20210928055524.172051-11-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928055524.172051-1-sashal@kernel.org>
References: <20210928055524.172051-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: José Expósito <jose.exposito89@gmail.com>

[ Upstream commit b201cb0ebe87b209e252d85668e517ac1929e250 ]

Some devices, even non convertible ones, can send incorrect
SW_TABLET_MODE reports.

Add an allow list and accept such reports only from devices in it.

Bug reported for Dell XPS 17 9710 on:
https://gitlab.freedesktop.org/libinput/libinput/-/issues/662

Reported-by: Tobias Gurtzick <magic@wizardtales.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Tobias Gurtzick <magic@wizardtales.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Link: https://lore.kernel.org/r/20210920160312.9787-1-jose.exposito89@gmail.com
[hdegoede@redhat.com: Check dmi_switches_auto_add_allow_list only once]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel-hid.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 2e4e97a626a5..7b03b497d93b 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -118,12 +118,30 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
 	{ }
 };
 
+/*
+ * Some devices, even non convertible ones, can send incorrect SW_TABLET_MODE
+ * reports. Accept such reports only from devices in this list.
+ */
+static const struct dmi_system_id dmi_auto_add_switch[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31" /* Convertible */),
+		},
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32" /* Detachable */),
+		},
+	},
+	{} /* Array terminator */
+};
+
 struct intel_hid_priv {
 	struct input_dev *input_dev;
 	struct input_dev *array;
 	struct input_dev *switches;
 	bool wakeup_mode;
-	bool dual_accel;
+	bool auto_add_switch;
 };
 
 #define HID_EVENT_FILTER_UUID	"eeec56b3-4442-408f-a792-4edd4d758054"
@@ -452,10 +470,8 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	 * Some convertible have unreliable VGBS return which could cause incorrect
 	 * SW_TABLET_MODE report, in these cases we enable support when receiving
 	 * the first event instead of during driver setup.
-	 *
-	 * See dual_accel_detect.h for more info on the dual_accel check.
 	 */
-	if (!priv->switches && !priv->dual_accel && (event == 0xcc || event == 0xcd)) {
+	if (!priv->switches && priv->auto_add_switch && (event == 0xcc || event == 0xcd)) {
 		dev_info(&device->dev, "switch event received, enable switches supports\n");
 		err = intel_hid_switches_setup(device);
 		if (err)
@@ -596,7 +612,8 @@ static int intel_hid_probe(struct platform_device *device)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
 
-	priv->dual_accel = dual_accel_detect();
+	/* See dual_accel_detect.h for more info on the dual_accel check. */
+	priv->auto_add_switch = dmi_check_system(dmi_auto_add_switch) && !dual_accel_detect();
 
 	err = intel_hid_input_setup(device);
 	if (err) {
-- 
2.33.0


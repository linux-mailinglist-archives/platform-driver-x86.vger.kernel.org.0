Return-Path: <platform-driver-x86+bounces-45-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45E7F6E1A
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 09:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BBAEB20B07
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 08:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6FE8F77;
	Fri, 24 Nov 2023 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="VXEWHu8h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z9t2qg4s"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF234D5A;
	Fri, 24 Nov 2023 00:28:01 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A18EB5C0181;
	Fri, 24 Nov 2023 03:27:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 24 Nov 2023 03:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1700814478; x=1700900878; bh=KiR+qoWmJg
	GddW07+jSsQyLAITJ4G6vi0xmsj0T3ZiU=; b=VXEWHu8hoavivVlXlKLMWSNhYq
	L/4D/jIPkOSk27AHBhPslwqa742Fzm7u4NIs5ckkUl9B/HFs5mD2kN8YASGqgqMz
	tRIx15yAT+gWC5HuV1F2OMPlvpAE+X07iRNNmnXlWRedxKXTluBerZyGSIw1F2jr
	7RzSks79ZyG6Toij+GsGztHsiKxSZtKV4yfOqq+R9N1gO7G4N6J/+AZmUn/ESyqu
	tIT5Fk37lK3DgtJ1OEL9EMTo8crOA6ckTy4CJqYptO5bjR+lQFPESh5r58nr4ll4
	EwP2fttKFSLIuoGVipLPmhSm/DSXQLRPxiVcYdUl4UaANDVZt8GIiDS/TV3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700814478; x=1700900878; bh=KiR+qoWmJgGdd
	W07+jSsQyLAITJ4G6vi0xmsj0T3ZiU=; b=Z9t2qg4sUTI5LtPJXqEhlfrQN5uGr
	tmEnTPNBhG5O59oVQpYOiusmaEr2Bg26IuGcoXfVCH9gi8PKUcbNmNJQzI8UlHWC
	xK/SCdDViJr9hVcTnpS5xodbfdbuSMaITRvtmnO5eXWsFjOqGZt9iOVsTw9O9u6S
	14n9QlqXuofFbqhEyHjeBK8L3Zt3y0bP2zbs0lvbPuZsG94Fx3DjZ+/SvhcCyyqX
	XqSUcqhYYkNdLeINnSCl8Gul9Q1dISiAMPM60IkT0R/NfYm5iL0eQA+jgXdNM3gB
	BWYUKYHKgGKTNENlktzLIYVA2itim2TlKgxU6QwUYJhwTVAEIJvziqzVQ==
X-ME-Sender: <xms:jV5gZa3ni166qmZfRSRxHqoxGpdznojtHYPfwnIE1nfV3DvU3PcCUA>
    <xme:jV5gZdEuKdVKPq6-_8CVKIEP_aoRWHnDfeFUIbaN4nAzGBh0ucv4tbaaFS1mJUvAl
    xNsyFpVc08QR21RDxY>
X-ME-Received: <xmr:jV5gZS4NpSD9C47jYqaMiP5dHQ_P8nRF1DWdE0saGvPOXTOWfKsjNs8Ud-oS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgudejtdfhuddukefffeekiefftd
    dtvdfhgeduudeuffeuhfefgfegfeetvedvgeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:jV5gZb1caX__S7-TbFL6F7BSdSQAS9EqVy3IacqGGIUS1JeaK5XXqA>
    <xmx:jV5gZdEOrokL9apWBYu4tSaUgWcS7ot5781l0z3ZPGhjueB4tAO50A>
    <xmx:jV5gZU-x_meobrDlCrdAnZi-t82tMWCDYR_mZE1YdWXjaCAGxhiyIg>
    <xmx:jl5gZdBRCC-iQnMFhXqdORGsQLrrMXQ1R4C8TK1s-g45xfsWEDBQBw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Nov 2023 03:27:55 -0500 (EST)
From: "Luke D. Jones" <luke@ljones.dev>
To: hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] platform/x86: asus-wmi: disable USB0 hub on ROG Ally before suspend
Date: Fri, 24 Nov 2023 21:27:48 +1300
Message-ID: <20231124082749.23353-1-luke@ljones.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS have worked around an issue in XINPUT in Windows by tweaking the MCU
firmware to disable the USB0 hub on screen disable when suspending.

The issue we have with this however is one of timing - the call the tells
the MCU to this isn't able to complete before suspend is done so we call
this in a prepare() and add a small msleep() to ensure it is done.

Without this the MCU is unable to initialise itself correctly on resume.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6a79f16233ab..c28829d45fb5 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -16,6 +16,7 @@
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/fb.h>
 #include <linux/hwmon.h>
@@ -132,6 +133,9 @@ module_param(fnlock_default, bool, 0444);
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
 #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
+/* Controls the power state of the USB0 hub on ROG Ally which input is on */
+#define ASUS_USB0_PWR_SB_PCI0_SBRG_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
+
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
 static int throttle_thermal_policy_write(struct asus_wmi *);
@@ -300,6 +304,9 @@ struct asus_wmi {
 
 	bool fnlock_locked;
 
+	/* The ROG Ally device requires the USB hub to be disabled before suspend */
+	bool pre_suspend_ec0_csee_disable;
+
 	struct asus_wmi_debug debug;
 
 	struct asus_wmi_driver *driver;
@@ -4488,6 +4495,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->nv_temp_tgt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_NV_THERM_TARGET);
 	asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
 	asus->mini_led_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE);
+	asus->pre_suspend_ec0_csee_disable = acpi_has_method(NULL, ASUS_USB0_PWR_SB_PCI0_SBRG_EC0_CSEE)
+						&& dmi_match(DMI_BOARD_NAME, "RC71L");
 
 	err = fan_boost_mode_check_present(asus);
 	if (err)
@@ -4654,6 +4663,38 @@ static int asus_hotk_resume(struct device *device)
 		asus_wmi_fnlock_update(asus);
 
 	asus_wmi_tablet_mode_get_state(asus);
+
+	return 0;
+}
+
+static int asus_hotk_resume_early(struct device *device)
+{
+	struct asus_wmi *asus = dev_get_drvdata(device);
+	acpi_status status;
+
+	if (asus->pre_suspend_ec0_csee_disable) {
+		status = acpi_execute_simple_method(NULL, ASUS_USB0_PWR_SB_PCI0_SBRG_EC0_CSEE, 0xB8);
+		if (ACPI_FAILURE(status)) {
+			pr_warn("failed to set USB hub power on\n");
+			return 1;
+		}
+	}
+	return 0;
+}
+
+static int asus_hotk_prepare(struct device *device)
+{
+	struct asus_wmi *asus = dev_get_drvdata(device);
+	acpi_status status;
+
+	if (asus->pre_suspend_ec0_csee_disable) {
+		status = acpi_execute_simple_method(NULL, ASUS_USB0_PWR_SB_PCI0_SBRG_EC0_CSEE, 0xB7);
+		msleep(500); /* sleep required to ensure n-key is disabled before sleep continues */
+		if (ACPI_FAILURE(status)) {
+			pr_warn("failed to set USB hub power off\n");
+			// return 1;
+		}
+	}
 	return 0;
 }
 
@@ -4701,6 +4742,8 @@ static const struct dev_pm_ops asus_pm_ops = {
 	.thaw = asus_hotk_thaw,
 	.restore = asus_hotk_restore,
 	.resume = asus_hotk_resume,
+	.resume_early = asus_hotk_resume_early,
+	.prepare = asus_hotk_prepare,
 };
 
 /* Registration ***************************************************************/
-- 
2.43.0



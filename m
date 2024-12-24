Return-Path: <platform-driver-x86+bounces-7977-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC99FBA92
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Dec 2024 09:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CA5716584E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Dec 2024 08:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562A1191F7C;
	Tue, 24 Dec 2024 08:38:56 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4154156F54;
	Tue, 24 Dec 2024 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029536; cv=none; b=VxUQhYaY36kAe54duf5vieQx3OeZi9Yh93Em8uw+InsuEjIw/XfJgvsXTbDl7aGUfxxPW6DWBBCgCTtpEJ9MEqy2zAA3xPk5PBGbchG92qSc2rY5jCFEQ4034GyuLYOm5TTUR4xo3+SrY0+1iQf0/W9h4J+SqXONvbTHkozo4pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029536; c=relaxed/simple;
	bh=SyxVVj48dhRBsfg9QfEHfq4lTe8Xyw0CNOgaeAE9UHU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bWXzgCbXcve7qzyU8h/wLduChagd3nLKbBiMyRGv7Mr5K02AOcAgx42P8VRokf3hYRovgyeeoX1bLt6CcZedfwcRWtA23wtnUM+PKwbhotaBCiOhYpCpjzMHC59YHGEuz/PaS2VmvLzEKg5kvrW1SRvjm8Nu1leoh9alDtjoGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from test-Lenovo-ThinkBook-14-Gen6.lenovo.com (unknown[123.114.236.251])
	by rmsmtp-lg-appmail-13-12002 (RichMail) with SMTP id 2ee2676a71ef510-71c10;
	Tue, 24 Dec 2024 16:34:03 +0800 (CST)
X-RM-TRANSID:2ee2676a71ef510-71c10
From: Jackie Dong <xy-jackie@139.com>
To: perex@perex.cz,
	tiwai@suse.com,
	bo.liu@senarytech.com,
	kovalev@altlinux.org,
	me@oldherl.one,
	jaroslaw.janik@gmail.com,
	songxiebing@kylinos.cn,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	dongeg1@lenovo.com,
	Jackie Dong <xy-jackie@139.com>
Subject: [PATCH v2] ALSA: hda: Support for Ideapad hotkey mute LEDs
Date: Tue, 24 Dec 2024 16:33:16 +0800
Message-Id: <20241224083316.20222-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New ideapad helper file with support for handling FN key mute LEDs.
Update conexant and realtec codec to add LED support.

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Jackie Dong  <xy-jackie@139.com>
---
Changes in v2:
 - Add a new enum CXT_FIXUP_LENOVO_XPAD_ACPI and define it as an entry in patch_conexant.c
 - Add a new enum ALC269_FIXUP_LENOVO_XPAD_ACPI and define it as an entry in patch_realtek.c

 sound/pci/hda/ideapad_hotkey_led_helper.c | 36 +++++++++++++++++++++++
 sound/pci/hda/patch_conexant.c            | 13 +++++++-
 sound/pci/hda/patch_realtek.c             | 20 ++++++++++++-
 3 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 sound/pci/hda/ideapad_hotkey_led_helper.c

diff --git a/sound/pci/hda/ideapad_hotkey_led_helper.c b/sound/pci/hda/ideapad_hotkey_led_helper.c
new file mode 100644
index 000000000000..c10d97964d49
--- /dev/null
+++ b/sound/pci/hda/ideapad_hotkey_led_helper.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ideapad helper functions for Lenovo Ideapad LED control,
+ * It should be included from codec driver.
+ */
+
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
+
+#include <linux/acpi.h>
+#include <linux/leds.h>
+
+static bool is_ideapad(struct hda_codec *codec)
+{
+	return (codec->core.subsystem_id >> 16 == 0x17aa) &&
+	       (acpi_dev_found("LHK2019") || acpi_dev_found("VPC2004"));
+}
+
+static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		if (!is_ideapad(codec))
+			return;
+		snd_hda_gen_add_mute_led_cdev(codec, NULL);
+		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
+	}
+}
+
+#else /* CONFIG_IDEAPAD_LAPTOP */
+
+static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+}
+
+#endif /* CONFIG_IDEAPAD_LAPTOP */
diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 538c37a78a56..4985e72b9094 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -291,6 +291,7 @@ enum {
 	CXT_FIXUP_GPIO1,
 	CXT_FIXUP_ASPIRE_DMIC,
 	CXT_FIXUP_THINKPAD_ACPI,
+	CXT_FIXUP_LENOVO_XPAD_ACPI,
 	CXT_FIXUP_OLPC_XO,
 	CXT_FIXUP_CAP_MIX_AMP,
 	CXT_FIXUP_TOSHIBA_P105,
@@ -313,6 +314,9 @@ enum {
 /* for hda_fixup_thinkpad_acpi() */
 #include "thinkpad_helper.c"
 
+/* for hda_fixup_ideapad_acpi() */
+#include "ideapad_hotkey_led_helper.c"
+
 static void cxt_fixup_stereo_dmic(struct hda_codec *codec,
 				  const struct hda_fixup *fix, int action)
 {
@@ -928,6 +932,12 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = hda_fixup_thinkpad_acpi,
 	},
+	[CXT_FIXUP_LENOVO_XPAD_ACPI] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = hda_fixup_ideapad_acpi,
+		.chained = true,
+		.chain_id = CXT_FIXUP_THINKPAD_ACPI,
+	},
 	[CXT_FIXUP_OLPC_XO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_olpc_xo,
@@ -1119,7 +1129,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3977, "Lenovo IdeaPad U310", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
-	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
+	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
 	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
@@ -1133,6 +1143,7 @@ static const struct hda_model_fixup cxt5066_fixup_models[] = {
 	{ .id = CXT_FIXUP_HEADPHONE_MIC_PIN, .name = "headphone-mic-pin" },
 	{ .id = CXT_PINCFG_LENOVO_TP410, .name = "tp410" },
 	{ .id = CXT_FIXUP_THINKPAD_ACPI, .name = "thinkpad" },
+	{ .id = CXT_FIXUP_LENOVO_XPAD_ACPI, .name = "thinkpad-ideapad" },
 	{ .id = CXT_PINCFG_LEMOTE_A1004, .name = "lemote-a1004" },
 	{ .id = CXT_PINCFG_LEMOTE_A1205, .name = "lemote-a1205" },
 	{ .id = CXT_FIXUP_OLPC_XO, .name = "olpc-xo" },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 61ba5dc35b8b..5f9927401322 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6934,6 +6934,16 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 	hda_fixup_thinkpad_acpi(codec, fix, action);
 }
 
+/* for hda_fixup_ideapad_acpi() */
+#include "ideapad_hotkey_led_helper.c"
+
+static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
+	hda_fixup_ideapad_acpi(codec, fix, action);
+}
+
 /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
 static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 						  const struct hda_fixup *fix,
@@ -7556,6 +7566,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER,
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC269_FIXUP_THINKPAD_ACPI,
+	ALC269_FIXUP_LENOVO_XPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
 	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
 	ALC269VC_FIXUP_INFINIX_Y4_MAX,
@@ -8327,6 +8338,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_SKU_IGNORE,
 	},
+	[ALC269_FIXUP_LENOVO_XPAD_ACPI] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ideapad_acpi,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+	},
 	[ALC269_FIXUP_DMIC_THINKPAD_ACPI] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_inv_dmic,
@@ -11065,7 +11082,7 @@ static const struct hda_quirk alc269_fixup_vendor_tbl[] = {
 	SND_PCI_QUIRK_VENDOR(0x1025, "Acer Aspire", ALC271_FIXUP_DMIC),
 	SND_PCI_QUIRK_VENDOR(0x103c, "HP", ALC269_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK_VENDOR(0x104d, "Sony VAIO", ALC269_FIXUP_SONY_VAIO),
-	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", ALC269_FIXUP_THINKPAD_ACPI),
+	SND_PCI_QUIRK_VENDOR(0x17aa, "Lenovo XPAD", ALC269_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK_VENDOR(0x19e5, "Huawei Matebook", ALC255_FIXUP_MIC_MUTE_LED),
 	{}
 };
@@ -11130,6 +11147,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC290_FIXUP_MONO_SPEAKERS_HSJACK, .name = "mono-speakers"},
 	{.id = ALC290_FIXUP_SUBWOOFER_HSJACK, .name = "alc290-subwoofer"},
 	{.id = ALC269_FIXUP_THINKPAD_ACPI, .name = "thinkpad"},
+	{.id = ALC269_FIXUP_LENOVO_XPAD_ACPI, .name = "lenovo xpad led"},
 	{.id = ALC269_FIXUP_DMIC_THINKPAD_ACPI, .name = "dmic-thinkpad"},
 	{.id = ALC255_FIXUP_ACER_MIC_NO_PRESENCE, .name = "alc255-acer"},
 	{.id = ALC255_FIXUP_ASUS_MIC_NO_PRESENCE, .name = "alc255-asus"},
-- 
2.34.1




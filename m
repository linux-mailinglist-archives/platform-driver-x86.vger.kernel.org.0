Return-Path: <platform-driver-x86+bounces-8672-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AAA127E1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Jan 2025 16:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D00188AFC1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Jan 2025 15:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2646114D2B9;
	Wed, 15 Jan 2025 15:53:08 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92B1DA21;
	Wed, 15 Jan 2025 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956388; cv=none; b=hDCwOoNKDVUek2SdrIQwT0BeoMfjEtEY4ToUOsT6lygLIpPYe8jOsdWhJkAa/E/wXEedgatI11NHwp6cpCc4LyLYqMZfNO0qZhlKfVYqEpnaNnMSv9RPk6hUqCbWLqCpzrxReBqtVCOfBpB2xo8HryJCkoJK/gBCW4BZorKvahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956388; c=relaxed/simple;
	bh=PhWcjZmP6LL/nUEwVezHS4v46mxjgkBFjXBVbvvDOeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqreg3VbwHMFwTCcAo86Nb+jSM3f2S4YhkRzajhEtLF9zR/+tJDf2rAzxlBao+xhSHwWmpcCZmgyF9LsXa8k4cuzawPc1NirVMqRlchROD9orzbGQ2P75ZbHQp7OG9IIZkA5SkmUGfP3xdn9sPj83sH1r3QC1zRO3EtgKsy972w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from test-ThinkBook-16-G8-IRL.. (unknown[2409:8A00:7871:C6F0:5208:1445:325:B752])
	by rmsmtp-lg-appmail-07-12085 (RichMail) with SMTP id 2f356787d8dc7bf-107c4;
	Wed, 15 Jan 2025 23:48:57 +0800 (CST)
X-RM-TRANSID:2f356787d8dc7bf-107c4
From: Jackie Dong <xy-jackie@139.com>
To: perex@perex.cz,
	tiwai@suse.com,
	bo.liu@senarytech.com,
	kovalev@altlinux.org,
	me@oldherl.one,
	jaroslaw.janik@gmail.com,
	songxiebing@kylinos.cn,
	cs@tuxedo.de,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	dongeg1@lenovo.com,
	Jackie Dong <xy-jackie@139.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v3] ALSA: hda: Support for Ideapad hotkey mute LEDs
Date: Wed, 15 Jan 2025 23:48:11 +0800
Message-ID: <20250115154811.11869-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.43.0
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
Changed from v2:
 - Removed alc_fixup_no_shutup() from alc_fixup_ideapad_acpi() to make
   sure alc_fixup_no_shutup() only be called once for Thinkpad and
   Ideapad.
 
Changed from v1:
 - Add a new enum CXT_FIXUP_LENOVO_XPAD_ACPI and define it as an entry in patch_conexant.c
 - Add a new enum ALC269_FIXUP_LENOVO_XPAD_ACPI and define it as an entry in patch_realtek.c

 sound/pci/hda/ideapad_hotkey_led_helper.c | 36 +++++++++++++++++++++++
 sound/pci/hda/patch_conexant.c            | 13 +++++++-
 sound/pci/hda/patch_realtek.c             | 19 +++++++++++-
 3 files changed, 66 insertions(+), 2 deletions(-)
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
index 61ba5dc35b8b..c702974187d6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6934,6 +6934,15 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 	hda_fixup_thinkpad_acpi(codec, fix, action);
 }
 
+/* for hda_fixup_ideapad_acpi() */
+#include "ideapad_hotkey_led_helper.c"
+
+static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+	hda_fixup_ideapad_acpi(codec, fix, action);
+}
+
 /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
 static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 						  const struct hda_fixup *fix,
@@ -7556,6 +7565,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER,
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC269_FIXUP_THINKPAD_ACPI,
+	ALC269_FIXUP_LENOVO_XPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
 	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
 	ALC269VC_FIXUP_INFINIX_Y4_MAX,
@@ -8327,6 +8337,12 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -11065,7 +11081,7 @@ static const struct hda_quirk alc269_fixup_vendor_tbl[] = {
 	SND_PCI_QUIRK_VENDOR(0x1025, "Acer Aspire", ALC271_FIXUP_DMIC),
 	SND_PCI_QUIRK_VENDOR(0x103c, "HP", ALC269_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK_VENDOR(0x104d, "Sony VAIO", ALC269_FIXUP_SONY_VAIO),
-	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", ALC269_FIXUP_THINKPAD_ACPI),
+	SND_PCI_QUIRK_VENDOR(0x17aa, "Lenovo XPAD", ALC269_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK_VENDOR(0x19e5, "Huawei Matebook", ALC255_FIXUP_MIC_MUTE_LED),
 	{}
 };
@@ -11130,6 +11146,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC290_FIXUP_MONO_SPEAKERS_HSJACK, .name = "mono-speakers"},
 	{.id = ALC290_FIXUP_SUBWOOFER_HSJACK, .name = "alc290-subwoofer"},
 	{.id = ALC269_FIXUP_THINKPAD_ACPI, .name = "thinkpad"},
+	{.id = ALC269_FIXUP_LENOVO_XPAD_ACPI, .name = "lenovo xpad led"},
 	{.id = ALC269_FIXUP_DMIC_THINKPAD_ACPI, .name = "dmic-thinkpad"},
 	{.id = ALC255_FIXUP_ACER_MIC_NO_PRESENCE, .name = "alc255-acer"},
 	{.id = ALC255_FIXUP_ASUS_MIC_NO_PRESENCE, .name = "alc255-asus"},
-- 
2.43.0




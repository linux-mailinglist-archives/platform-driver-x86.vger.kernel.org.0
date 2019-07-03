Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 311975E7FF
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Jul 2019 17:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfGCPlh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Jul 2019 11:41:37 -0400
Received: from fallback19.mail.ru ([185.5.136.251]:34906 "EHLO
        fallback19.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfGCPlg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Jul 2019 11:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=08jv7BdavyOl/EfKvA2EDgiMkApgnu+DJ8CJwq9Q+nE=;
        b=DrBnOsmDFar7yPZANjjPlsCJvXqrXsphjwumtkwm3vjo8ZYSCEilEM8GW8h5KPVplVewdCbimqS3u+dU4sJU8SQa0nROHlOAsxTk78h2CLfvh8pSeDPwFSqE3SJKgfEduVqhni0WaalFa1SF54Z+uHP6mvzIMImnmkH+Kj8aEw8=;
Received: from [10.161.8.33] (port=48546 helo=smtp14.mail.ru)
        by fallback19.m.smailru.net with esmtp (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihO1-00019i-I8
        for platform-driver-x86@vger.kernel.org; Wed, 03 Jul 2019 18:41:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=08jv7BdavyOl/EfKvA2EDgiMkApgnu+DJ8CJwq9Q+nE=;
        b=DrBnOsmDFar7yPZANjjPlsCJvXqrXsphjwumtkwm3vjo8ZYSCEilEM8GW8h5KPVplVewdCbimqS3u+dU4sJU8SQa0nROHlOAsxTk78h2CLfvh8pSeDPwFSqE3SJKgfEduVqhni0WaalFa1SF54Z+uHP6mvzIMImnmkH+Kj8aEw8=;
Received: by smtp14.mail.ru with esmtpa (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihNz-0001vG-Ek; Wed, 03 Jul 2019 18:41:31 +0300
From:   Nemcev_Aleksey@inbox.ru
To:     platform-driver-x86@vger.kernel.org
Cc:     Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
Subject: [PATCH 2/4] platform/x86: asus-nb-wmi: Add Asus FX705GE support
Date:   Wed,  3 Jul 2019 18:41:00 +0300
Message-Id: <20190703154102.20002-2-Nemcev_Aleksey@inbox.ru>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
References: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-77F55803: CF41D5CA8C6D3C0C7F9F52485CB584D7FE68477BFBFC01B4DF6F5E1BD76335352A21B7A11F1B30830F517926C4E28B08ADAB024B4846C063
X-7FA49CB5: 0D63561A33F958A54B404DB1D2F0FA59FD68E4B5506F529493CB32A2E80AE4028941B15DA834481FA18204E546F3947C17119E5299B287EEF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B47272755C61AA17BA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C224901F8F2FECC0250C83AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE7B8DF8BCBF3A9906FCD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE7A6F206C3C3CBDA8CA084E6503CB7830275ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57E8FBB06288C1946000306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: BAC27832F44D5424910E42FD2D628468E35CA7FE35398775E4E89C4BF8899FDDD016A075C73C5D8BB5D628A7EF4494575C5F6E3C72ABB53BB0D9B300F142F0238EAA47040EB6BC244E4EA347F45ED768B49EAA7E57EF395F3453F38A29522196
X-Mras: OK
X-77F55803: E8DB3678F13EF3E07F9F52485CB584D7271FD7DF62800FDC8A2F546F6BD22D818C4C95DF3A3EC579378F28A064171B154377C52109CA8204
X-7FA49CB5: 0D63561A33F958A55A140C4E4A4CEA2DBB4C1E95D4FD2485A590C7A2C0DEB50D8941B15DA834481FA18204E546F3947C7AE820D2C17D0E56F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8BC908CD1B87A134A2A471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0FECB2555BB02FD5A93B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: A5480F10D64C9005D917D4885F602B38603BC1C7A63DF6115C258A0D1BAD70160A95ADFD67C9AF73E50935EE66542E109654EF9EE9506939349998EA56B56CE1D251A790F4B35225EC94D6048180DDBE5FEEDEB644C299C0ED14614B50AE0675
X-Mras: OK
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>

This model has an AURA RGB backlight,
so wmi_needs_3_args quirk is required

Signed-off-by: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
---
 drivers/platform/x86/asus-nb-wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 4bed95357a32..bf937321f42e 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -406,6 +406,16 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_forceals,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. FX705GE",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME,
+				  "TUF Gaming FX705GE_FX705GE"),
+		},
+		.driver_data = &quirk_asus_wmi_needs_3_args,
+	},
 	{},
 };
 
@@ -441,6 +451,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
 	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
 	{ KE_KEY, 0x32, { KEY_MUTE } },
+	{ KE_KEY, 0x33, { KEY_BRIGHTNESS_MIN } },
 	{ KE_KEY, 0x35, { KEY_SCREENLOCK } },
 	{ KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
 	{ KE_KEY, 0x41, { KEY_NEXTSONG } },
@@ -467,6 +478,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_IGNORE, 0x6E, },  /* Low Battery notification */
 	{ KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
+	{ KE_KEY, 0x7C, { KEY_MICMUTE } },
 	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
 	{ KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
 	{ KE_KEY, 0x82, { KEY_CAMERA } },
-- 
2.20.1


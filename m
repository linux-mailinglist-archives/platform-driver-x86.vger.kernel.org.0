Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB81B5E7FD
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Jul 2019 17:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfGCPlg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Jul 2019 11:41:36 -0400
Received: from fallback18.mail.ru ([185.5.136.250]:49310 "EHLO
        fallback18.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfGCPlg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Jul 2019 11:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=zR46rN/9K6Nv/G8PoM5HtAOAcJptYAc/7tZWvRpDr2M=;
        b=Opn2WQRHwBaOkPvAD+IGA9Bv4hL3b1Xz4hSLqKASDkx4M6epbcj10GnBumpe9hX48nObrPtbHhG3M6Cf+KWixHdM++5Qv3BA7Y3j3TQUmQBaFli4XqKtSiFSiw7I1iJD7Ds8v8ayRbUYKBIn3pkm25tfK2+F0bgRLKppq/gLnBI=;
Received: from [10.161.8.33] (port=45294 helo=smtp14.mail.ru)
        by fallback18.m.smailru.net with esmtp (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihO1-0007Pv-KH
        for platform-driver-x86@vger.kernel.org; Wed, 03 Jul 2019 18:41:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=zR46rN/9K6Nv/G8PoM5HtAOAcJptYAc/7tZWvRpDr2M=;
        b=Opn2WQRHwBaOkPvAD+IGA9Bv4hL3b1Xz4hSLqKASDkx4M6epbcj10GnBumpe9hX48nObrPtbHhG3M6Cf+KWixHdM++5Qv3BA7Y3j3TQUmQBaFli4XqKtSiFSiw7I1iJD7Ds8v8ayRbUYKBIn3pkm25tfK2+F0bgRLKppq/gLnBI=;
Received: by smtp14.mail.ru with esmtpa (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihO0-0001vG-2L; Wed, 03 Jul 2019 18:41:32 +0300
From:   Nemcev_Aleksey@inbox.ru
To:     platform-driver-x86@vger.kernel.org
Cc:     Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
Subject: [PATCH 4/4] platform/x86: asus-wmi: Add wmi_backlight_disable quirk
Date:   Wed,  3 Jul 2019 18:41:02 +0300
Message-Id: <20190703154102.20002-4-Nemcev_Aleksey@inbox.ru>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
References: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-77F55803: 2D1AD755E866B1545A78504BD2AC294133C3DD4F2B53C4ED17ED78923D6B0CE41525770315BAB53328E8E641A45F6172
X-7FA49CB5: 0D63561A33F958A50A026C60573BBA36FD68E4B5506F5294CA6DB79C7E6915A48941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C224901F8F2FECC0250C83AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE7B8DF8BCBF3A9906FCD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE7A6F206C3C3CBDA8CA084E6503CB7830275ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57E8FBB06288C1946000306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: BAC27832F44D5424910E42FD2D628468E35CA7FE35398775B3371D5F4858F91592A0E2AEE18925A2B5D628A7EF4494575C5F6E3C72ABB53BB0D9B300F142F0238EAA47040EB6BC244E4EA347F45ED768B49EAA7E57EF395F3453F38A29522196
X-Mras: OK
X-77F55803: E8DB3678F13EF3E07F9F52485CB584D7271FD7DF62800FDC8A2F546F6BD22D8120D17E6A58C3BAADC32952AB6B70CBF04377C52109CA8204
X-7FA49CB5: 0D63561A33F958A55A140C4E4A4CEA2D6DE5A5629C987E2E01E33DD264EC52E08941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0FECB2555BB02FD5A93B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: A5480F10D64C9005D917D4885F602B38603BC1C7A63DF611B5B8EE185B81EDFF0A95ADFD67C9AF73E50935EE66542E109654EF9EE9506939349998EA56B56CE1D251A790F4B35225EC94D6048180DDBE5FEEDEB644C299C0ED14614B50AE0675
X-Mras: OK
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>

This quirk is for some Asus notebooks like FX705GE with
working ACPI backlight control, if asus-nb-wmi breaks it

Fixes display backlight control on FX705GE after asus-nb-wmi module load

Signed-off-by: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 drivers/platform/x86/asus-wmi.c    | 3 ++-
 drivers/platform/x86/asus-wmi.h    | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 5d98f5bdba14..94d1775c6934 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -88,6 +88,7 @@ static struct quirk_entry quirk_asus_x55u = {
 static struct quirk_entry quirk_asus_fx705ge = {
 	.wmi_needs_3_args = true,
 	.wmi_uses_dsts2 = true,
+	.wmi_backlight_disable = true,
 };
 
 static struct quirk_entry quirk_asus_wapf4 = {
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 4c62425f99c8..75022e816042 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2254,7 +2254,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->xusb2pr)
 		asus_wmi_set_xusb2pr(asus);
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type() == acpi_backlight_vendor
+	    && !asus->driver->quirks->wmi_backlight_disable) {
 		err = asus_wmi_backlight_init(asus);
 		if (err && err != -ENODEV)
 			goto fail_backlight;
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 3d39de76b01b..df2aac92860b 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -35,6 +35,7 @@ struct quirk_entry {
 	bool wmi_force_als_set;
 	bool wmi_needs_3_args;
 	bool wmi_uses_dsts2;
+	bool wmi_backlight_disable;
 	int wapf;
 	/*
 	 * For machines with AMD graphic chips, it will send out WMI event
-- 
2.20.1


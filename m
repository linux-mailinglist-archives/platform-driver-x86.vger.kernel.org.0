Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D808B5E7FE
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Jul 2019 17:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfGCPlh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Jul 2019 11:41:37 -0400
Received: from fallback16.mail.ru ([94.100.177.128]:33202 "EHLO
        fallback16.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCPlg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Jul 2019 11:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=GiDII3Ss3OZOU3MToWryMnR7Z02Vm9QlYDxlkwtqL/I=;
        b=o0ogbOxY6CoWTSwHyt5Ds6usAyJhFk1KYep4PtFJjxdZ2AS0R9at1yNxo71hX/ppgX8/KCjdo0AzIut536sQt13nlu1kFMLCgi1ZuhOXQHXZMFTLGYl9thu1EfItVnE8/oM7EOgQRlOB+B7EmsXCPwFPsqvMxs5XsxEg66rsVVM=;
Received: from [10.161.8.33] (port=38288 helo=smtp14.mail.ru)
        by fallback16.i with esmtp (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihO1-0008TD-KD
        for platform-driver-x86@vger.kernel.org; Wed, 03 Jul 2019 18:41:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=GiDII3Ss3OZOU3MToWryMnR7Z02Vm9QlYDxlkwtqL/I=;
        b=o0ogbOxY6CoWTSwHyt5Ds6usAyJhFk1KYep4PtFJjxdZ2AS0R9at1yNxo71hX/ppgX8/KCjdo0AzIut536sQt13nlu1kFMLCgi1ZuhOXQHXZMFTLGYl9thu1EfItVnE8/oM7EOgQRlOB+B7EmsXCPwFPsqvMxs5XsxEg66rsVVM=;
Received: by smtp14.mail.ru with esmtpa (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihNz-0001vG-OI; Wed, 03 Jul 2019 18:41:31 +0300
From:   Nemcev_Aleksey@inbox.ru
To:     platform-driver-x86@vger.kernel.org
Cc:     Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
Subject: [PATCH 3/4] platform/x86: asus-wmi: Add wmi_uses_dsts2 quirk
Date:   Wed,  3 Jul 2019 18:41:01 +0300
Message-Id: <20190703154102.20002-3-Nemcev_Aleksey@inbox.ru>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
References: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-77F55803: 3FFC80838138E3AB5A78504BD2AC294133C3DD4F2B53C4EDBD7DF4EF93E8939741A4BFE9FD16ACE971627129559B8843
X-7FA49CB5: 0D63561A33F958A54B404DB1D2F0FA59FD68E4B5506F5294B5196C11317BF4318941B15DA834481FA18204E546F3947CBC0ADEB1C81BB362F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B587F3D2152687E5CA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C224901F8F2FECC0250C83AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE7B8DF8BCBF3A9906FCD04E86FAF290E2DBBC930A3941E20C675ECD9A6C639B01B78DA827A17800CE7A6F206C3C3CBDA8CA084E6503CB7830275ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57E8FBB06288C1946000306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: BAC27832F44D5424910E42FD2D628468E35CA7FE35398775E4E89C4BF8899FDD3322F70B0A6416E7B5D628A7EF4494575C5F6E3C72ABB53BB0D9B300F142F0238EAA47040EB6BC244E4EA347F45ED768B49EAA7E57EF395F3453F38A29522196
X-Mras: OK
X-77F55803: E8DB3678F13EF3E07F9F52485CB584D7271FD7DF62800FDC8A2F546F6BD22D81F974C2B8D2000934ED2B66D443F6C8A44377C52109CA8204
X-Mras: OK
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>

This quirk force driver to use ASUS_WMI_METHODID_DSTS2 to detect featues
It is requiered on some Asus notebook models like FX705GE with buggy
WMI which does not return ASUS_WMI_UNSUPPORTED_METHOD on unsupported
methods

Fixes detection of keyboard backlight on Asus FX705GE

Signed-off-by: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
---
 drivers/platform/x86/asus-nb-wmi.c | 11 ++++++-----
 drivers/platform/x86/asus-wmi.c    |  3 +++
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index bf937321f42e..5d98f5bdba14 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -85,6 +85,11 @@ static struct quirk_entry quirk_asus_x55u = {
 	.no_display_toggle = true,
 };
 
+static struct quirk_entry quirk_asus_fx705ge = {
+	.wmi_needs_3_args = true,
+	.wmi_uses_dsts2 = true,
+};
+
 static struct quirk_entry quirk_asus_wapf4 = {
 	.wapf = 4,
 	.wmi_backlight_set_devstate = true,
@@ -110,10 +115,6 @@ static struct quirk_entry quirk_asus_forceals = {
 	.wmi_force_als_set = true,
 };
 
-static struct quirk_entry quirk_asus_wmi_needs_3_args = {
-	.wmi_needs_3_args = true,
-};
-
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -414,7 +415,7 @@ static const struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME,
 				  "TUF Gaming FX705GE_FX705GE"),
 		},
-		.driver_data = &quirk_asus_wmi_needs_3_args,
+		.driver_data = &quirk_asus_fx705ge,
 	},
 	{},
 };
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 56a407fa8944..4c62425f99c8 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1946,6 +1946,9 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	else
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
 
+	if (asus->driver->quirks->wmi_uses_dsts2)
+		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
+
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
 	if (asus->driver->quirks->wapf >= 0)
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 9568e42a6995..3d39de76b01b 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -34,6 +34,7 @@ struct quirk_entry {
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
 	bool wmi_needs_3_args;
+	bool wmi_uses_dsts2;
 	int wapf;
 	/*
 	 * For machines with AMD graphic chips, it will send out WMI event
-- 
2.20.1


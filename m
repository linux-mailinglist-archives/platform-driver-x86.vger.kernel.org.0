Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81AC710DD2B
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbfK3Ixc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45396 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfK3Ixc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id j42so11931306wrj.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to;
        bh=17rai4AOUIzw793LMAM4emDqB1FCdXP5Tp77eGn2L8A=;
        b=ZUMy+b5a0a1oBAxkdTe+WXQVB7zqzx9h+WF6RsOaEdKkCFWQZIVWGwCU63icWQLWFE
         8PdUYtjryo0sZzkEJ1TPQJ7FcJQfgmvNB0KtjVjt2T+/pOe9kdvDPu7wYtOI3ZW1extM
         ZLjDYObuzqCbQlhK2y5UM9BFStCITnyfKHmfLs+K28eQOa5l8obhLXxEdiJfaGfs2U6L
         k6w1BBETa652cmQo2W36E8eOwfe8A4vQXNtLoTpwobYu1Gkgt1QrR2uL4BlLeHsr9U3G
         BKUbYU31EZ125HKDTSFnEf+bt6cuPuo/tfPQ7GHIuCK049M0xg4nPyOS0lh0XarFn9YO
         eAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to;
        bh=17rai4AOUIzw793LMAM4emDqB1FCdXP5Tp77eGn2L8A=;
        b=gr3ZQBP8+BnLrnqEzEGTFv2CL+6pX1dx5KvgwAnKXfaaeNCTkBGVvHbmdpnBG2vGFz
         RL4hWOoXPJN33uUMZmEXPO0c0JQ0Nm3Uy51ArPGD3ax4CpcgJJhXTxXN02ONNxrVYwYQ
         GaPtkiwG/ZsQhjlLCBVhJGyuth42n1VmnlD45RF358S3QLPGob9KOqyDfW/C8WSc7yDe
         yiTHYNSbRAUi+Nu1FswWD54xiD2Xv1Jy+g8ITzR0Dvo/q0iMzMAvc6u6irxiBeb+MlDc
         RLb4AXTsG/Panw4zuZE7Ew9lfxvsEc4fo1nVD6o5aUXPhtHcqNMXs0WYTfGNHgZIqxWT
         dGvQ==
X-Gm-Message-State: APjAAAXNAoDNeuUIhh4zR90jBx05HdVGwFlL/gtBe4CgRP/1mOj9AiAF
        sw3WxTISqjVETtPKT4FU0MGA
X-Google-Smtp-Source: APXvYqxvRIkrb25y2cfAeZo4NQg2gf6hewpsi0LPtXxORtZsPklRaOxs/61caReWIUGd9pY6167AEA==
X-Received: by 2002:adf:ea42:: with SMTP id j2mr22178521wrn.270.1575104010434;
        Sat, 30 Nov 2019 00:53:30 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id m3sm30169136wrw.20.2019.11.30.00.53.29
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:29 -0800 (PST)
Message-Id: <61c52c2146085859728f496388d886581b877c41.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
References: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:40:38 +0200
Subject: [PATCH V2 1/7] platform/x86: lg-laptop.c: Add module version and fix
 whitespace
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add module version and fix a small whitespace discrepancy.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index c0bb1f864dfe..78d3e3d2e51a 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -26,6 +26,7 @@
 MODULE_AUTHOR("Matan Ziv-Av");
 MODULE_DESCRIPTION("LG WMI Hotkey Driver");
 MODULE_LICENSE("GPL");
+MODULE_VERSION("1.1");
 
 #define WMI_EVENT_GUID0	"E4FB94F9-7F2B-4173-AD1A-CD1D95086248"
 #define WMI_EVENT_GUID1	"023B133E-49D1-4E10-B313-698220140DC2"
@@ -69,7 +70,7 @@ static u32 inited;
 #define INIT_INPUT_ACPI         0x04
 #define INIT_TPAD_LED           0x08
 #define INIT_KBD_LED            0x10
-#define INIT_SPARSE_KEYMAP        0x80
+#define INIT_SPARSE_KEYMAP      0x80
 
 static const struct key_entry wmi_keymap[] = {
 	{KE_KEY, 0x70, {KEY_F15} },	 /* LG control panel (F1) */
-- 
2.21.0


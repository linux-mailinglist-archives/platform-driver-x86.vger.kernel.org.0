Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A82BFFB628
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfKMRRE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:17:04 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41292 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbfKMRRE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:17:04 -0500
Received: by mail-wr1-f66.google.com with SMTP id b18so1809760wrj.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:to:from:date:subject;
        bh=kJ/QJuLwRVNogdV4oTyh10DbfNaFy4rwlTQCRY5pR68=;
        b=UHFWcY+AWCkiFQdYFzQHsQgxlSK8LdVkkzAnevsTk6LZ6FXyFhFM8zmhKEWPrIoZdv
         4ftSNEwF1fPBYFPG/DglNzK6OX96ut/wZO/VwYyrOZrBBtFoiiNwLlQBL/JLFex/awTC
         Gc7Gav7+AcAIUkSFlknEc7rL8v0meZ3rQSwe+ueFSOqrOS+r+42dYNLlihAT3ZGOQZZ3
         JnHX5aeZ3qdt+O6YjF4vRritML54qsCj6pzHg7HU7rrjxqxfITXLTsZ5OOQa10LZpgPi
         M2ggmQF01IVay4t5NDINdnQyteZi1mj2MlgtIckS0eVdXo1J8PXCzJN0nrTsglNMpz4r
         +0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:to:from:date
         :subject;
        bh=kJ/QJuLwRVNogdV4oTyh10DbfNaFy4rwlTQCRY5pR68=;
        b=Mh6r3nKZ0NCWZmYOYhgeBZ55ed58sYIm6PS2nt6uSvuutZZwIZp0+T/GPcR+ranwc7
         wjD+vjX3zjEZYaRZupX7w0N92cAt14VOnMH3zcxf2XU5EqJXvBydH/gQGcin99KGPU8E
         J3ao1XSioydqUiY3WtMXuzura3OwaEwWU3umQfWDH3jXat1C4Ryv+Ke7vLxANjHLgbyg
         YFSeLkCMUctQehCJNygyAv8G9g1GdOD7Tz0kyyOWe1Z80j4A7o4ANKtbbO4qi69ySL0V
         UdIy/c9ybGqUZbbquruVa+xPGJDSRzAoJMm6I0gV5B2GNP5Ue6smzU6h2yvp8boFTabg
         R3Bg==
X-Gm-Message-State: APjAAAVS+Yu+J82cDKuHHxKs0Iq3TLPkSvnB0LAVh5mDUIe9DW+jCj/8
        yFXmtxa93eND+5UnJgglGlWaqS9JmA==
X-Google-Smtp-Source: APXvYqwZDTb43hDNKdu90l2Gf+1B/F53d45RKWGsKQAF87ZmqKdwjeHbXQ3IuG2RSe0peVBCHryEnw==
X-Received: by 2002:adf:db92:: with SMTP id u18mr3766625wri.1.1573665421636;
        Wed, 13 Nov 2019 09:17:01 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id j66sm2593445wma.19.2019.11.13.09.17.00
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:17:00 -0800 (PST)
Message-Id: <84d87b964f9ed3fa9f0cb0afe1baf3ba417cde8a.1573664004.git.matan@svgalib.org>
In-Reply-To: <cover.1573664004.git.matan@svgalib.org>
References: <cover.1573664004.git.matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 17:40:30 +0200
Subject: [PATCH 1/7] Add module version and fix whitespace
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

- Add module version information
- Fix a small whitespace inconsistency


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


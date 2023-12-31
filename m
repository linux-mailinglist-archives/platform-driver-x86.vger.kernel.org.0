Return-Path: <platform-driver-x86+bounces-707-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A09B820BF9
	for <lists+platform-driver-x86@lfdr.de>; Sun, 31 Dec 2023 17:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AF6A1C21545
	for <lists+platform-driver-x86@lfdr.de>; Sun, 31 Dec 2023 16:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F6D6FBC;
	Sun, 31 Dec 2023 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B/vG1kiL"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BA7476
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704040413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcPKqcziUFTnDsajzis9/eBZaXJtJhW3QMCvWtQiRmQ=;
	b=B/vG1kiLXGuKPs5nfeMAx5DbkH6ll2lUSHBBrw1gBMhAYFmpkiqoFOH2FQBpqjMnlrz75k
	BAtsamguKqaGFABCYiIGZ41Q5VOkHcy9ZLMYq6seO5zVckc9mTbpEOXF6pTSulneQXmLxG
	tIhdRs36jpYMtMn7rR7mgwd4/AHMPDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-PiKVBY25PA2gJtUn5B_ChA-1; Sun, 31 Dec 2023 11:33:29 -0500
X-MC-Unique: PiKVBY25PA2gJtUn5B_ChA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 552FF101A52A;
	Sun, 31 Dec 2023 16:33:29 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D7FDC15E6C;
	Sun, 31 Dec 2023 16:33:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 1/4] platform/x86: pmc_atom: Annotate d3_sts register bit defines
Date: Sun, 31 Dec 2023 17:33:19 +0100
Message-ID: <20231231163322.9492-2-hdegoede@redhat.com>
In-Reply-To: <20231231163322.9492-1-hdegoede@redhat.com>
References: <20231231163322.9492-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

The include/linux/platform_data/x86/pmc_atom.h d3_sts register bit defines
are named after how these bits are used on Bay Trail devices.

On Cherry Trail (CHT) devices some of these bits have a different meaning
according to the datasheet.

At a comment to the defines for bits which have a different meaning
on Cherry Trail devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/platform_data/x86/pmc_atom.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/platform_data/x86/pmc_atom.h b/include/linux/platform_data/x86/pmc_atom.h
index b8a701c77fd0..5eec0e22acdf 100644
--- a/include/linux/platform_data/x86/pmc_atom.h
+++ b/include/linux/platform_data/x86/pmc_atom.h
@@ -104,14 +104,14 @@
 #define	BIT_SCC_SDIO		BIT(9)
 #define	BIT_SCC_SDCARD		BIT(10)
 #define	BIT_SCC_MIPI		BIT(11)
-#define	BIT_HDA			BIT(12)
+#define	BIT_HDA			BIT(12) /* CHT datasheet: reserved */
 #define	BIT_LPE			BIT(13)
 #define	BIT_OTG			BIT(14)
-#define	BIT_USH			BIT(15)
-#define	BIT_GBE			BIT(16)
-#define	BIT_SATA		BIT(17)
-#define	BIT_USB_EHCI		BIT(18)
-#define	BIT_SEC			BIT(19)
+#define	BIT_USH			BIT(15) /* CHT datasheet: reserved */
+#define	BIT_GBE			BIT(16) /* CHT datasheet: reserved */
+#define	BIT_SATA		BIT(17) /* CHT datasheet: reserved */
+#define	BIT_USB_EHCI		BIT(18) /* CHT datasheet: XHCI!    */
+#define	BIT_SEC			BIT(19) /* BYT datasheet: reserved */
 #define	BIT_PCIE_PORT0		BIT(20)
 #define	BIT_PCIE_PORT1		BIT(21)
 #define	BIT_PCIE_PORT2		BIT(22)
-- 
2.43.0



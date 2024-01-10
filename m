Return-Path: <platform-driver-x86+bounces-861-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDB826F2C
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 14:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E631F22FDF
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 13:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA5C40C1F;
	Mon,  8 Jan 2024 13:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyR+cfOt"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F041202
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704718978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbHrAVR/UYE+NhiX8FSxKQYDvkmi138c+kYCLqFBr0I=;
	b=KyR+cfOtTOdGycaeuZeg2HkfkOnHqCpn/k2dvMdTzc+rCAhZqZiR26Pb6wO4sBMUjQ8Z7L
	LciseZ04qIljq2I6h7wWtnUT9XtksOJSN2yKkZQqeMA0wjHlZUmVOg90Gjqa6/5qdxj19H
	JKv7h02akCn8U/MrLQkSKk/turSPUNI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-5Yz6YF4GN_-EJ8fQDcQU_w-1; Mon, 08 Jan 2024 08:02:54 -0500
X-MC-Unique: 5Yz6YF4GN_-EJ8fQDcQU_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4E35837185;
	Mon,  8 Jan 2024 13:02:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0B6F5190;
	Mon,  8 Jan 2024 13:02:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/5] platform/x86: pmc_atom: Check state of PMC clocks on s2idle
Date: Mon,  8 Jan 2024 14:02:37 +0100
Message-ID: <20240108130238.540794-5-hdegoede@redhat.com>
In-Reply-To: <20240108130238.540794-1-hdegoede@redhat.com>
References: <20240108130238.540794-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Extend the s2idle check with checking that none of the PMC clocks
is in the forced-on state. If one of the clocks is in forced on
state then S0i3 cannot be reached.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Improve comment for clocks check

Changes in v2:
- Drop the PMC_CLK_* defines these are defined in
  include/linux/platform_data/x86/pmc_atom.h now
- Drop duplicated "pmc_atom: " prefix from pr_err() message
---
 drivers/platform/x86/pmc_atom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index ec60b734b9cb..9f2009a354f9 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -477,6 +477,7 @@ static void pmc_s2idle_check(void)
 	u32 func_dis, func_dis_2;
 	u32 d3_sts_0, d3_sts_1;
 	u32 false_pos_sts_0, false_pos_sts_1;
+	int i;
 
 	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
 	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
@@ -501,6 +502,16 @@ static void pmc_s2idle_check(void)
 
 	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
 	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
+
+	/* Forced-on PMC clocks prevent S0i3 */
+	for (i = 0; i < PMC_CLK_NUM; i++) {
+		u32 ctl = pmc_reg_read(pmc, PMC_CLK_CTL_OFFSET + 4 * i);
+
+		if ((ctl & PMC_MASK_CLK_CTL) != PMC_CLK_CTL_FORCE_ON)
+			continue;
+
+		pr_err("clock %d is ON prior to freeze (ctl 0x%08x)\n", i, ctl);
+	}
 }
 
 static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
-- 
2.43.0



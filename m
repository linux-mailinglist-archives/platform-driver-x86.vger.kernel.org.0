Return-Path: <platform-driver-x86+bounces-860-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7D826F2A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 14:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053DE283BB5
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 13:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDAA4121C;
	Mon,  8 Jan 2024 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V41vo326"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165F40C18
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704718975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49wGINqIxP29fbkk6isFlsJplSVg1J5xNebNmQgDko0=;
	b=V41vo3266Hqm/JrrDXhw4/y9dz0If9AGcQNlxiXTPEkrRnEu0H9+X2RFcaFY5CQ2ViI7l7
	CO96fb/FfTjgxB8QUxwsGhQxGe9/lxK6oHbx3egmMlnmRS4dpcNuxE1jk+NXxUzRCbyQFu
	bSOm7bET8D6sLTnU19ZCnS58xiR/qJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-TGSFTNtGOHOJPocn8miKrQ-1; Mon, 08 Jan 2024 08:02:51 -0500
X-MC-Unique: TGSFTNtGOHOJPocn8miKrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F7FF85A58A;
	Mon,  8 Jan 2024 13:02:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9234A5190;
	Mon,  8 Jan 2024 13:02:48 +0000 (UTC)
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
Subject: [PATCH v3 3/5] platform/x86: pmc_atom: Check state of PMC managed devices on s2idle
Date: Mon,  8 Jan 2024 14:02:36 +0100
Message-ID: <20240108130238.540794-4-hdegoede@redhat.com>
In-Reply-To: <20240108130238.540794-1-hdegoede@redhat.com>
References: <20240108130238.540794-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

From: Johannes Stezenbach <js@sig21.net>

For the Bay Trail or Cherry Trail SoC to enter the S0i3 power-level
at s2idle suspend requires most of the hw-blocks / devices in the SoC
to be in D3 when entering s2idle suspend.

If some devices are not in D3 then the SoC will stay in a higher
power state, consuming much more power from the battery then in S0i3.

Use the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
functionality to register a new s2idle check function which checks that
all hardware blocks in the South complex (controlled by the PMC)
are in a state that allows the SoC to enter S0i3 and prints an error
message for any device in D0.

Some blocks are not used on lower-featured versions of the SoC and
these blocks will always report being in D0 on SoCs were they are
not used. A false-positive mask is used to identify these blocks
and for blocks in this mask the error is turned into a debug message
to avoid false-positive error messages.

Note the pmc_atom code is enabled by CONFIG_X86_INTEL_LPSS which
already depends on ACPI.

Signed-off-by: Johannes Stezenbach <js@sig21.net>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[hdegoede: Use acpi_s2idle_dev_ops, ignore fused off blocks, PMIC I2C]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Reword commit message
- Drop confusing /* Low Part */ and /* High Part */ comments

Changes in v2:
- Drop duplicated "pmc_atom: " prefix from pr_err() / pr_dbg() messages
---
 drivers/platform/x86/pmc_atom.c | 64 +++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 93a6414c6611..ec60b734b9cb 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -6,6 +6,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
+#include <linux/suspend.h>
 
 struct pmc_bit_map {
 	const char *name;
@@ -448,6 +450,64 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 	return 0;
 }
 
+#ifdef CONFIG_SUSPEND
+static void pmc_dev_state_check(u32 sts, const struct pmc_bit_map *sts_map,
+				u32 fd, const struct pmc_bit_map *fd_map,
+				u32 sts_possible_false_pos)
+{
+	int index;
+
+	for (index = 0; sts_map[index].name; index++) {
+		if (!(fd_map[index].bit_mask & fd) &&
+		    !(sts_map[index].bit_mask & sts)) {
+			if (sts_map[index].bit_mask & sts_possible_false_pos)
+				pm_pr_dbg("%s is in D0 prior to s2idle\n",
+					  sts_map[index].name);
+			else
+				pr_err("%s is in D0 prior to s2idle\n",
+				       sts_map[index].name);
+		}
+	}
+}
+
+static void pmc_s2idle_check(void)
+{
+	struct pmc_dev *pmc = &pmc_device;
+	const struct pmc_reg_map *m = pmc->map;
+	u32 func_dis, func_dis_2;
+	u32 d3_sts_0, d3_sts_1;
+	u32 false_pos_sts_0, false_pos_sts_1;
+
+	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
+	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
+	d3_sts_0 = pmc_reg_read(pmc, PMC_D3_STS_0);
+	d3_sts_1 = pmc_reg_read(pmc, PMC_D3_STS_1);
+
+	/*
+	 * Some blocks are not used on lower-featured versions of the SoC and
+	 * always report D0, add these to false_pos mask to log at debug level.
+	 */
+	if (m->d3_sts_1	== byt_d3_sts_1_map) {
+		/* Bay Trail */
+		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_PCIE_PORT0 |
+			BIT_PCIE_PORT1 | BIT_PCIE_PORT2 | BIT_PCIE_PORT3 |
+			BIT_LPSS2_F5_I2C5;
+		false_pos_sts_1 = BIT_SMB | BIT_USH_SS_PHY | BIT_DFX;
+	} else {
+		/* Cherry Trail */
+		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_LPSS2_F7_I2C7;
+		false_pos_sts_1 = BIT_SMB | BIT_STS_ISH;
+	}
+
+	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
+	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
+}
+
+static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
+	.check = pmc_s2idle_check,
+};
+#endif
+
 static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct pmc_dev *pmc = &pmc_device;
@@ -485,6 +545,10 @@ static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
 		dev_warn(&pdev->dev, "platform clocks register failed: %d\n",
 			 ret);
 
+#ifdef CONFIG_SUSPEND
+	acpi_register_lps0_dev(&pmc_s2idle_ops);
+#endif
+
 	pmc->init = true;
 	return ret;
 }
-- 
2.43.0



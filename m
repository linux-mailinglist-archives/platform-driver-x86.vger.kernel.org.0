Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C6E6F2C3A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 May 2023 04:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbjEAC6h (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 Apr 2023 22:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbjEAC61 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Apr 2023 22:58:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8A21BC7;
        Sun, 30 Apr 2023 19:57:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F348760FC6;
        Mon,  1 May 2023 02:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAFFC4339B;
        Mon,  1 May 2023 02:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682909876;
        bh=epKsAZ6DSYzK4rCW0R5nLL2mxBdnP+pZABR+ucWo7ew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RIxpH1puc01MWXjGKrSoZo2rhvUiX6ZiWOgTmHJ5JwnvNplqzk6kbjdsk9I9NAgWX
         Z+fapg24Tz0DNyd6AfNRp5wwwGt+3aTB2oiBtpE2qePmEIa5eJ8h08MDwgbySOxHpI
         Q/x7C/DQlMZaHunBtLL6WAC5Vsa38uI+aqhNfY1+oDIKxas4R9qmSnGLE1TYO2rhJ4
         uEr4Hzs6OLLWhHU1JGXdkJbdalT3XSKb6JFCF8gKS2xItItBDrFPB/bhSuvi4JxaPb
         zwKEOMj/zpmzHyjOXXgHktZ27/ZksiFO3LlLYoWIhBlKjRcQUfKnARFvcI00P/JxN7
         dxvyzQs6DaZaw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 17/44] platform/x86/intel: vsec: Explicitly enable capabilities
Date:   Sun, 30 Apr 2023 22:56:05 -0400
Message-Id: <20230501025632.3253067-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025632.3253067-1-sashal@kernel.org>
References: <20230501025632.3253067-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: "David E. Box" <david.e.box@linux.intel.com>

[ Upstream commit 3f95ecf2a3e4db09e58d307932037e8f1210d6e7 ]

Discovered Intel VSEC/DVSEC capabilities are enabled by default and only
get disabled by quirk. Instead, remove such quirks and only enable support
for capabilities that have been explicitly added to a new capabilities
field. While here, also reorder the device info structures alphabetically.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Link: https://lore.kernel.org/r/20230316224628.2855884-1-david.e.box@linux.intel.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel/vsec.c | 69 ++++++++++++++-----------------
 drivers/platform/x86/intel/vsec.h |  9 +++-
 2 files changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 2311c16cb975d..91be391bba3f7 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -67,14 +67,6 @@ enum intel_vsec_id {
 	VSEC_ID_TPMI		= 66,
 };
 
-static enum intel_vsec_id intel_vsec_allow_list[] = {
-	VSEC_ID_TELEMETRY,
-	VSEC_ID_WATCHER,
-	VSEC_ID_CRASHLOG,
-	VSEC_ID_SDSI,
-	VSEC_ID_TPMI,
-};
-
 static const char *intel_vsec_name(enum intel_vsec_id id)
 {
 	switch (id) {
@@ -98,26 +90,19 @@ static const char *intel_vsec_name(enum intel_vsec_id id)
 	}
 }
 
-static bool intel_vsec_allowed(u16 id)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(intel_vsec_allow_list); i++)
-		if (intel_vsec_allow_list[i] == id)
-			return true;
-
-	return false;
-}
-
-static bool intel_vsec_disabled(u16 id, unsigned long quirks)
+static bool intel_vsec_supported(u16 id, unsigned long caps)
 {
 	switch (id) {
+	case VSEC_ID_TELEMETRY:
+		return !!(caps & VSEC_CAP_TELEMETRY);
 	case VSEC_ID_WATCHER:
-		return !!(quirks & VSEC_QUIRK_NO_WATCHER);
-
+		return !!(caps & VSEC_CAP_WATCHER);
 	case VSEC_ID_CRASHLOG:
-		return !!(quirks & VSEC_QUIRK_NO_CRASHLOG);
-
+		return !!(caps & VSEC_CAP_CRASHLOG);
+	case VSEC_ID_SDSI:
+		return !!(caps & VSEC_CAP_SDSI);
+	case VSEC_ID_TPMI:
+		return !!(caps & VSEC_CAP_TPMI);
 	default:
 		return false;
 	}
@@ -206,7 +191,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	unsigned long quirks = info->quirks;
 	int i;
 
-	if (!intel_vsec_allowed(header->id) || intel_vsec_disabled(header->id, quirks))
+	if (!intel_vsec_supported(header->id, info->caps))
 		return -EINVAL;
 
 	if (!header->num_entries) {
@@ -261,14 +246,14 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 static bool intel_vsec_walk_header(struct pci_dev *pdev,
 				   struct intel_vsec_platform_info *info)
 {
-	struct intel_vsec_header **header = info->capabilities;
+	struct intel_vsec_header **header = info->headers;
 	bool have_devices = false;
 	int ret;
 
 	for ( ; *header; header++) {
 		ret = intel_vsec_add_dev(pdev, *header, info);
 		if (ret)
-			dev_info(&pdev->dev, "Could not add device for DVSEC id %d\n",
+			dev_info(&pdev->dev, "Could not add device for VSEC id %d\n",
 				 (*header)->id);
 		else
 			have_devices = true;
@@ -403,14 +388,8 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
 	return 0;
 }
 
-/* TGL info */
-static const struct intel_vsec_platform_info tgl_info = {
-	.quirks = VSEC_QUIRK_NO_WATCHER | VSEC_QUIRK_NO_CRASHLOG |
-		  VSEC_QUIRK_TABLE_SHIFT | VSEC_QUIRK_EARLY_HW,
-};
-
 /* DG1 info */
-static struct intel_vsec_header dg1_telemetry = {
+static struct intel_vsec_header dg1_header = {
 	.length = 0x10,
 	.id = 2,
 	.num_entries = 1,
@@ -419,19 +398,31 @@ static struct intel_vsec_header dg1_telemetry = {
 	.offset = 0x466000,
 };
 
-static struct intel_vsec_header *dg1_capabilities[] = {
-	&dg1_telemetry,
+static struct intel_vsec_header *dg1_headers[] = {
+	&dg1_header,
 	NULL
 };
 
 static const struct intel_vsec_platform_info dg1_info = {
-	.capabilities = dg1_capabilities,
+	.caps = VSEC_CAP_TELEMETRY,
+	.headers = dg1_headers,
 	.quirks = VSEC_QUIRK_NO_DVSEC | VSEC_QUIRK_EARLY_HW,
 };
 
 /* MTL info */
 static const struct intel_vsec_platform_info mtl_info = {
-	.quirks = VSEC_QUIRK_NO_WATCHER | VSEC_QUIRK_NO_CRASHLOG,
+	.caps = VSEC_CAP_TELEMETRY,
+};
+
+/* OOBMSM info */
+static const struct intel_vsec_platform_info oobmsm_info = {
+	.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_SDSI | VSEC_CAP_TPMI,
+};
+
+/* TGL info */
+static const struct intel_vsec_platform_info tgl_info = {
+	.caps = VSEC_CAP_TELEMETRY,
+	.quirks = VSEC_QUIRK_TABLE_SHIFT | VSEC_QUIRK_EARLY_HW,
 };
 
 #define PCI_DEVICE_ID_INTEL_VSEC_ADL		0x467d
@@ -446,7 +437,7 @@ static const struct pci_device_id intel_vsec_pci_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, VSEC_DG1, &dg1_info) },
 	{ PCI_DEVICE_DATA(INTEL, VSEC_MTL_M, &mtl_info) },
 	{ PCI_DEVICE_DATA(INTEL, VSEC_MTL_S, &mtl_info) },
-	{ PCI_DEVICE_DATA(INTEL, VSEC_OOBMSM, &(struct intel_vsec_platform_info) {}) },
+	{ PCI_DEVICE_DATA(INTEL, VSEC_OOBMSM, &oobmsm_info) },
 	{ PCI_DEVICE_DATA(INTEL, VSEC_RPL, &tgl_info) },
 	{ PCI_DEVICE_DATA(INTEL, VSEC_TGL, &tgl_info) },
 	{ }
diff --git a/drivers/platform/x86/intel/vsec.h b/drivers/platform/x86/intel/vsec.h
index ae8fe92c5595b..0fd042c171ba0 100644
--- a/drivers/platform/x86/intel/vsec.h
+++ b/drivers/platform/x86/intel/vsec.h
@@ -5,6 +5,12 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 
+#define VSEC_CAP_TELEMETRY	BIT(0)
+#define VSEC_CAP_WATCHER	BIT(1)
+#define VSEC_CAP_CRASHLOG	BIT(2)
+#define VSEC_CAP_SDSI		BIT(3)
+#define VSEC_CAP_TPMI		BIT(4)
+
 struct pci_dev;
 struct resource;
 
@@ -27,7 +33,8 @@ enum intel_vsec_quirks {
 
 /* Platform specific data */
 struct intel_vsec_platform_info {
-	struct intel_vsec_header **capabilities;
+	struct intel_vsec_header **headers;
+	unsigned long caps;
 	unsigned long quirks;
 };
 
-- 
2.39.2


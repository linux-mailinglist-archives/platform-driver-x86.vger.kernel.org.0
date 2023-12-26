Return-Path: <platform-driver-x86+bounces-637-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902781E344
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 01:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC90128344A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 00:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC5046B85;
	Tue, 26 Dec 2023 00:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmKr0A+K"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C39046B80;
	Tue, 26 Dec 2023 00:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C52C433C8;
	Tue, 26 Dec 2023 00:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550074;
	bh=E1NbftOdOXkGt0sj7tVUYZomB+qWhkKFai9nioZF9rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CmKr0A+KNnCB2tBG/pWB1fxrk1uO/MTzZwAc2E1VNe6BBrnFCt+PktzKwUeNvxkrY
	 oT3XPeTOAea9aSg3l7wJn/l9/CXIarWmPiuOC2yC0SSye0YegAMp/hrPq8+xLwrCRa
	 D+028oR3kn9/RtO6nG6U9T1f53TghLmOzTEEiCxhU7yTZpbOrfQbSvTAxcbJhLf3H1
	 J8d7flQjwDd/1Br95LL+0C7kpPGwvr6irynI71zDDpJCVmBsTd6FTQqWpoRQM7W096
	 z+whitcVsY4IilGCx2Xyx21sZyawZz6+VCPJMmTC++0qHvnmaOYZ/bbPSY6JQBSeER
	 LNFNXRuV3WGFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	Shyam-sundar.S-k@amd.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 20/39] platform/x86/amd/pmc: Move platform defines to header
Date: Mon, 25 Dec 2023 19:19:10 -0500
Message-ID: <20231226002021.4776-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002021.4776-1-sashal@kernel.org>
References: <20231226002021.4776-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.8
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 85980669a863514dd47761efd6c1bc4677a2ae08 ]

The platform defines will be used by the quirks in the future,
so move them to the common header to allow use by both source
files.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/20231212045006.97581-2-mario.limonciello@amd.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/amd/pmc/pmc.c | 10 ----------
 drivers/platform/x86/amd/pmc/pmc.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 212f164bc3dba..3fea32880ac8d 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -87,16 +87,6 @@
 #define SMU_MSG_LOG_RESET		0x07
 #define SMU_MSG_LOG_DUMP_DATA		0x08
 #define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RV			0x15D0
-#define AMD_CPU_ID_RN			0x1630
-#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
-#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
-#define AMD_CPU_ID_YC			0x14B5
-#define AMD_CPU_ID_CB			0x14D8
-#define AMD_CPU_ID_PS			0x14E8
-#define AMD_CPU_ID_SP			0x14A4
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
 
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index c27bd6a5642f4..a85c235247d38 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -41,4 +41,15 @@ struct amd_pmc_dev {
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
 
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RV			0x15D0
+#define AMD_CPU_ID_RN			0x1630
+#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
+#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
+#define AMD_CPU_ID_CB			0x14D8
+#define AMD_CPU_ID_PS			0x14E8
+#define AMD_CPU_ID_SP			0x14A4
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+
 #endif /* PMC_H */
-- 
2.43.0



Return-Path: <platform-driver-x86+bounces-1797-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07186FA32
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Mar 2024 07:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FE6A280D74
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Mar 2024 06:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70F46119;
	Mon,  4 Mar 2024 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h0RPBYh1"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A01170A
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 06:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709534533; cv=fail; b=jGJOnhSZQBMkDA5uwwujHIwJp/DldzPUp9BL4w9lRDX6s4dwNFTFnMyutdrRmdZWsBWuZZf1vQIYZ470c+3W9Z05TzDvzekCROkF7F9v5SHg5n+cHsnw/XX+UBO5idQJaqIf6aDC8TdhUNsifA53HveNxdUFHC91I8IFY+5asbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709534533; c=relaxed/simple;
	bh=Hj5VOCyEltod3FG+H/Vahx/57a2OrHy/gysnN0vbswA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B5pIJhRyEXhp9BULo8dowxq2ne3SPQ7k7DgQdv42wWbvBMbpSoWvk4iM/d2UqVWbw3a/oUNE20B5aBI4ODkcWYvtNV6vgWRAA1w3BDpJAPVpYK1Gynei6ZcuEsV9ApHjJwmLBvJQi9MvZoPTiD5Pu1CN24V3P4h513zWHatPh4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h0RPBYh1; arc=fail smtp.client-ip=40.107.102.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qj2AMCDSSOW/2Btah7rW1cJmDOcKxqgDvGc0JThjEDF6F9tC8syiKlZ4orpjx2j+q7kE8Awf9s6In/vh3w6HiRANkyEv0gR/qOv3Q6/L/1BPvGDa/c9t7ShvYY306UgOyNVLGqbFKg1RtPRqm9v5dYjk9jZ3A4B4wqnO+W16tppWCPj9tB7aK3dIhGHLydWRVo3Ujq3eOTh+nOwywAZCAqzealM9HZ46CmV0yyHtTX1fwrv2dIHhNJ7MzqOIsN2cOEx+l2cRW43V+/WhcjGrC1owr36o3k4A0+kCeGEpBuTM2rSc+AxdZrCUPVQKmGa1CT1IZ1A6Lwg+9x8mQv76+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cBxTaReqGJWZuoQw14Ai1RCjvATQ2DDrHrnfS/8lAY=;
 b=RUHEPaKvtUuxfMG6EliKGOLgZdj242d//7EQPOpzizpmQ9u86ZiP4N4r9YhdUZbch9/fJlDf0TJ6rKkgUnPkWOQtSO1uTfez2zYDRyKobttmeRbtbOUwnsiJUPfwAGqFOGnIQBTBYJfjbbWP8XvdtJ4pJeXncQ3RRayehKb7+eCt1xjNqxbcHPZ1r4jRzOmuBYEiCQ7NyQAIpMnOJLqGgoy8tvwVe5R8857TuUehlovuBVGTK3hqsKaQaHRiwuQUDGDOCiSzuPBBxDAhv6xkH3TcQA6A8A/bk68zBvn7xoPYHy6w2oix/gZlcNzKcXXZCg03Hw4Wy9+0P1OAsbxPpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cBxTaReqGJWZuoQw14Ai1RCjvATQ2DDrHrnfS/8lAY=;
 b=h0RPBYh1NdI9c1s6x7JHUGobMwBw9Y9wiOz++bpU1Yw+YzRmZFx0wjkPXwFPpv2jikV1A0Vkg+eobuUFFNauofF93bxmTEb8lqgq1W4aCi/BJ+KNuTpkDfUOq5hX4aYTPMblcmHXhm9CRapsPMYTJyq2K4C/boOX75yobP/mLZk=
Received: from BN9PR03CA0448.namprd03.prod.outlook.com (2603:10b6:408:113::33)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 06:42:06 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::36) by BN9PR03CA0448.outlook.office365.com
 (2603:10b6:408:113::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 06:42:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 06:42:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 00:42:02 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Date: Mon, 4 Mar 2024 12:11:47 +0530
Message-ID: <20240304064147.2586158-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: e628f325-4418-4c1c-a93c-08dc3c16352c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lG7iMsA7XiU82a1F8S+18qjE7T/9cuHGeUw5RdakgVaYj1sw7lVgyT42mWTXTUoU3M9v2vfzeXPOrXUfvSY5gHyqxayI5OeOQ4WWEQdAXqoQJtia165sPcj+ZDz9FI/569P1NYATSWmRNYVFpyc2x+S2vgRdwgZcDU7TokN3cCFavxjMFdyzvJ7fn4LmnK5TjTTIUFwISpRFPC0pyKECHd67AYUTTuxv8jqvYbcQjOXkl4ZplZG0D9MDqq1Fe8EgydjQAhXo1ZS7WiEWGDHR8PrfBwb/8rwfdcHJXUiuOEbHQuY7huYTlzHc4xTrPImDPtnEwITnrWbdvluL1KfmWgsaEH+E0gTAZpsjpTnFBrArHQtK15CpyZE8/9QkOyUZ1f65U38kv+IjjUderx1Ca9uQD21R0O2j5WTzE7/jiCtTJUhIwOmBGQyxg9+GQuvclH2dSCMSsoGtw5addKYH0wFuH3VDzet4aF1vyQg10vb3jrt1r9/IljZ+8Ut6kG4Lw9KzL7Y+KbmmIvdYlsfda/T2SbGvjpSiQEgVP2Y/LDtmrTdFcs2KwK6yRPoWB43zVYHhtfHUKkQPOqh3Ybv459XYsNwlknplZWVZdNn5KVJOysDdU+ZZNKNOWWUOcLqvuQCddNAEfXCLvUwzRGBu8fTmZ0MO0xRyEzbvyi6xHWT1BrqYSc2KD7ycJ0sIj64AqDH+Xe4YvC28e2MGBbxadrHcXeI1qV9CaiK8CLPCL7bu/pV8KbQW3VllDHL9RCGB
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 06:42:05.8365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e628f325-4418-4c1c-a93c-08dc3c16352c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950

AMD MP2 STB function provides a data buffer used to log debug information
about the system execution during S2Idle suspend/resume.

A data buffer known as the STB (Smart Trace Buffer) is a circular buffer
which is a low-level log to assist in debugging by providing insights
into any potential hangs or stalls that may occur during the S2Idle
suspend/resume processes.

The current PMC driver retrieves STB data from MP1, but there can be
scenarios where MP1 might hang or become unresponsive, leading to the
loss of critical data present in the STB buffer. This defeats the purpose
of the STB buffer, which was originally meant to help identify system
failures.

This feature creates stb_read_previous_boot debugfs allows users to
retrieve the STB log from MP2 specifically from the last occurrence of
the S2Idle suspend/resume. A userspace daemon can access STB log of last
S2Idle suspend/resume which can help to troubleshoot potential issues
related to hangs or stalls during the S2Idle suspend/resume sequence.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
Changes in v3:
	- Changed an error path for deinitialization or freeing resources.
	- Modified the macro and variable to have a more specific name.
	- Included header files for USEC_PER_MSEC, writeq, and writel.
	- Switched the data type of the 'len' variable from 'int' to 
	  'unsigned int'.
	- Used one variable for return values.

Changes in v2:
	- Used linux/sizes.h instead of defining KB.
	- Defined timeout containing unit as per USEC_PER_MSEC.
	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
	- Changed string stb to STB in log messages.
	- Defined literals using Macro.

 drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
 drivers/platform/x86/amd/pmc/Makefile  |   1 +
 drivers/platform/x86/amd/pmc/mp2_stb.c | 260 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     |   4 +
 drivers/platform/x86/amd/pmc/pmc.h     |  14 ++
 5 files changed, 302 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c

diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
index 883c0a95ac0c..8177486babf9 100644
--- a/drivers/platform/x86/amd/pmc/Kconfig
+++ b/drivers/platform/x86/amd/pmc/Kconfig
@@ -18,3 +18,26 @@ config AMD_PMC
 
 	  If you choose to compile this driver as a module the module will be
 	  called amd-pmc.
+
+config AMD_MP2_STB
+	bool "AMD SoC MP2 STB function"
+	depends on AMD_PMC
+	help
+	  AMD MP2 STB function provides a data buffer used to log debug
+	  information about the system execution during S2Idle suspend/resume.
+	  A data buffer known as the STB (Smart Trace Buffer) is a circular
+	  buffer which is a low-level log for the SoC which is used to debug
+	  any hangs/stalls during S2Idle suspend/resume.
+
+	  The current PMC driver retrieves STB data from MP1, but there can be
+	  scenarios where MP1 might hang or become unresponsive, leading to the
+	  loss of critical data present in the STB buffer. This defeats the
+	  purpose of the STB buffer, which was originally meant to help identify
+	  system failures.
+
+	  Creates stb_read_previous_boot debugfs to get STB, a userspace daemon
+	  can access STB log of last S2Idle suspend/resume which can help to
+	  debug if hangs/stalls during S2Idle suspend/resume
+
+	  Say Y or N here if you have a notebook powered by AMD RYZEN CPU/APU
+	  and supports MP2 STB.
diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
index 4aaa29d351c9..f1d9ab19d24c 100644
--- a/drivers/platform/x86/amd/pmc/Makefile
+++ b/drivers/platform/x86/amd/pmc/Makefile
@@ -6,3 +6,4 @@
 
 amd-pmc-objs := pmc.o pmc-quirks.o
 obj-$(CONFIG_AMD_PMC) += amd-pmc.o
+amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
new file mode 100644
index 000000000000..4acea31daaaa
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD MP2 STB layer
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/time.h>
+
+#include "pmc.h"
+
+#define VALID_MSG 0xA
+#define VALID_RESPONSE 2
+
+#define AMD_C2P_MSG0 0x10500
+#define AMD_C2P_MSG1 0x10504
+#define AMD_P2C_MSG0 0x10680
+#define AMD_P2C_MSG1 0x10684
+
+#define MP2_RESP_SLEEP_US 500
+#define MP2_RESP_TIMEOUT_US (1600 * USEC_PER_MSEC)
+
+#define MP2_STB_DATA_LEN_2KB 1
+#define MP2_STB_DATA_LEN_16KB 4
+
+static struct amd_mp2_dev *mp2;
+
+struct mp2_cmd_base {
+	union {
+		u32 ul;
+		struct {
+			u32 cmd_id : 4;
+			u32 intr_disable : 1;
+			u32 is_dma_used : 1;
+			u32 rsvd : 26;
+		} cmd;
+	};
+};
+
+struct mp2_cmd_response {
+	union {
+		u32 resp;
+		struct {
+			u32 cmd_id : 4;
+			u32 status : 4;
+			u32 response : 4;
+			u32 rsvd2 : 20;
+		} response;
+	};
+};
+
+struct mp2_stb_data_valid {
+	union {
+		u32 data_valid;
+		struct {
+			u32 valid : 16;
+			u32 length : 16;
+		} val;
+	};
+};
+
+static int amd_mp2_wait_response(u8 cmd_id, u32 command_sts)
+{
+	struct mp2_cmd_response cmd_resp;
+
+	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
+				(cmd_resp.response.response == 0x0 &&
+				 cmd_resp.response.status == command_sts &&
+				 cmd_resp.response.cmd_id == cmd_id), MP2_RESP_SLEEP_US,
+				 MP2_RESP_TIMEOUT_US))
+		return cmd_resp.response.status;
+
+	return -ETIMEDOUT;
+}
+
+static void amd_mp2_stb_send_cmd(u8 cmd_id, bool is_dma_used)
+{
+	struct mp2_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.cmd.cmd_id = cmd_id;
+	cmd_base.cmd.intr_disable = 1;
+	cmd_base.cmd.is_dma_used = is_dma_used;
+
+	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
+	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
+}
+
+static int amd_mp2_stb_region(unsigned int len)
+{
+	struct device *dev = &mp2->pdev->dev;
+
+	len *= SZ_1K;
+
+	if (!mp2->stbdata) {
+		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
+		if (!mp2->vslbase)
+			return -ENOMEM;
+
+		mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
+		if (!mp2->stbdata)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int amd_mp2_process_cmd(struct file *filp)
+{
+	struct device *dev = &mp2->pdev->dev;
+	struct mp2_stb_data_valid stb_dv;
+	int status;
+
+	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
+
+	if (stb_dv.val.valid != VALID_MSG) {
+		dev_err(dev, "Invalid STB data\n");
+		return -EBADMSG;
+	}
+
+	if (stb_dv.val.length != MP2_STB_DATA_LEN_2KB &&
+	    stb_dv.val.length != MP2_STB_DATA_LEN_16KB) {
+		dev_err(dev, "Unsupported length\n");
+		return -EMSGSIZE;
+	}
+
+	mp2->stb_len = BIT(stb_dv.val.length);
+
+	status = amd_mp2_stb_region(mp2->stb_len);
+	if (status) {
+		dev_err(dev, "Failed to init STB region, status %d\n", status);
+		return status;
+	}
+
+	amd_mp2_stb_send_cmd(VALID_MSG, true);
+	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
+	if (status == VALID_RESPONSE) {
+		memcpy_fromio(mp2->stbdata, mp2->vslbase, SZ_1K * mp2->stb_len);
+		filp->private_data = mp2->stbdata;
+		mp2->is_stb_data = true;
+	} else {
+		dev_err(dev, "Failed to start STB dump, status %d\n", status);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
+{
+	if (!mp2->is_stb_data)
+		return amd_mp2_process_cmd(filp);
+
+	filp->private_data = mp2->stbdata;
+
+	return 0;
+}
+
+static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
+					loff_t *pos)
+{
+	if (!filp->private_data)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, size, pos, filp->private_data, SZ_1K * mp2->stb_len);
+}
+
+static const struct file_operations amd_mp2_stb_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = amd_mp2_stb_debugfs_open,
+	.read = amd_mp2_stb_debugfs_read,
+};
+
+static void amd_mp2_dbgfs_register(struct amd_pmc_dev *dev)
+{
+	if (!dev->dbgfs_dir)
+		return;
+
+	debugfs_create_file("stb_read_previous_boot", 0644, dev->dbgfs_dir, dev,
+			    &amd_mp2_stb_debugfs_fops);
+}
+
+void amd_mp2_stb_deinit(void)
+{
+	struct pci_dev *pdev;
+
+	if (mp2 && mp2->pdev) {
+		pdev = mp2->pdev;
+		pci_dev_put(pdev);
+		if (mp2->devres_gid)
+			devres_release_group(&pdev->dev, mp2->devres_gid);
+		mp2 = NULL;
+	}
+}
+
+void amd_mp2_stb_init(struct amd_pmc_dev *dev)
+{
+	struct pci_dev *pdev;
+	int rc;
+
+	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
+	if (!mp2)
+		goto mp2_error;
+
+	pdev = pci_get_device(PCI_VENDOR_ID_AMD, 0x172c, NULL);
+	if (!pdev)
+		goto mp2_error;
+
+	mp2->pdev = pdev;
+
+	mp2->devres_gid = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!mp2->devres_gid) {
+		dev_err(&pdev->dev, "devres_open_group failed\n");
+		goto mp2_error;
+	}
+
+	rc = pcim_enable_device(pdev);
+	if (rc) {
+		dev_err(&pdev->dev, "pcim_enable_device failed\n");
+		goto mp2_error;
+	}
+
+	rc = pcim_iomap_regions(pdev, BIT(2), "mp2 stb");
+	if (rc) {
+		dev_err(&pdev->dev, "pcim_iomap_regions failed\n");
+		goto mp2_error;
+	}
+
+	/* MP2 MMIO is mapped to BAR2 */
+	mp2->mmio = pcim_iomap_table(pdev)[2];
+	if (!mp2->mmio) {
+		dev_err(&pdev->dev, "pcim_iomap_table failed\n");
+		goto mp2_error;
+	}
+
+	pci_set_master(pdev);
+
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (rc) {
+		dev_err(&pdev->dev, "failed to set DMA mask\n");
+		goto mp2_error;
+	}
+
+	amd_mp2_dbgfs_register(dev);
+	dev->mp2 = mp2;
+
+	return;
+
+mp2_error:
+	amd_mp2_stb_deinit();
+}
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 108e12fd580f..926257125ac1 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
+		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
 	return 0;
 
@@ -1122,6 +1124,8 @@ static void amd_pmc_remove(struct platform_device *pdev)
 		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
 	amd_pmc_dbgfs_unregister(dev);
 	pci_dev_put(dev->rdev);
+	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
+		amd_mp2_stb_deinit();
 	mutex_destroy(&dev->lock);
 }
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 827eef65e133..a49af1fa0060 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,17 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+struct amd_mp2_dev {
+	void __iomem *mmio;
+	void __iomem *vslbase;
+	void *stbdata;
+	void *devres_gid;
+	struct pci_dev *pdev;
+	dma_addr_t dma_addr;
+	int stb_len;
+	bool is_stb_data;
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -38,10 +49,13 @@ struct amd_pmc_dev {
 	struct dentry *dbgfs_dir;
 	struct quirk_entry *quirks;
 	bool disable_8042_wakeup;
+	struct amd_mp2_dev *mp2;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
+void amd_mp2_stb_init(struct amd_pmc_dev *dev);
+void amd_mp2_stb_deinit(void);
 
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RV			0x15D0
-- 
2.25.1



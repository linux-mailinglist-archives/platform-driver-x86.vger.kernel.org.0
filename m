Return-Path: <platform-driver-x86+bounces-11831-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA0AA982F
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 May 2025 18:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FBCE3ABF41
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 May 2025 16:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF9125D527;
	Mon,  5 May 2025 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PDMaSXWV"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421915AF6;
	Mon,  5 May 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460888; cv=fail; b=DdVHuxvM3x2BdFPAZgoDtO2AkujUaUu+I4m/fk0SParanoheGdjNKDpL/hbAEhWSeGvq0yC4BVsT4bvX28Bgvz5rxVtcfb53/YAchjcnDbG1n4AegaVuTIqcL8USnBMPY+JJbLmlFJfxTBlAEZH2mfjirxclJqdoB0J0ZCALR0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460888; c=relaxed/simple;
	bh=TI0inDm7wUJfjjjPlzS09OQbDrukuWndF5jT1h4LieM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nwjlkjGC05aJvN/MgY6eDIeMXUoVuZKWXqCKD49J3OJEoAcqF7OSrhm20x/1ksazM79MPfvG1Y9eS0lyYM1XiMjzijHCoGbxkIFjc4/mw6nSVkDmGN1AVf5OHv7fLyKI1azTcWMH7b2Wtt+qrIYOBlZrLJ2E0YSxF3Tp/OKz7qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PDMaSXWV; arc=fail smtp.client-ip=40.107.236.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzmwEOF53T/tV2TYjz91+r/7bSmvlkcsKE2DbklYV3h6ETYtYWyjYWlvb8zCxtgbv2a+eEhfgqZCmrxToyP2zZVxWvbEaq72NAbvzNkGn6QHv4BYAlRsUPJ//R8o8gkKuNKn8Y2WWo6LbMuACGLsOyGxXKjBpTL/kvpsgSfzcksRjzgub9Y1r1GdNd016k5pYLRzMXfrLVn0Y5h+MT17txXhkbJsd7R9zlhfq36r+hfa/vxo7VFH/E2thKKfkdkOoda83lP7HxrJ4uoRWSq6dG9FyBZKCFU5AlKkMfcyDpzkTFPZw1N6LFpZwDf26JDghNctcSrTShshHu+L42Gqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9LzrIz8PfmSz9es1h1OaCt5wyqbaja0V3usZktBgaM=;
 b=wJ8x182drz+Tw0912by2DcyxYtLB9eI2x20tc0885TUx8fHcvEvJ2ANUkkWNyUTTnenbcF3zQgrFRwj2QBTRBTzXIWfGFmg3R7OIwq8UXg8zuo4+qLQGGjkvG1gprhjTdLmgxnO4PVfrtpF+XhcmkUmJpEh2MT0DvbMCU2Gr/FHVtqsmswOhz4W1dBhTnlcmq92QgQBVKStHtbG7AiV97ecCH+GP7lUADGzFke6v/hBBgAsd8dipdY4uFtwtXfh4me25+fXWgYTABwTVTuNc2cQ4xJAE6svmjSsQvR4PYGYkZKPoA/4UyUEMGbGSvMNdT/8MieZafRBh7TsYN5hSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9LzrIz8PfmSz9es1h1OaCt5wyqbaja0V3usZktBgaM=;
 b=PDMaSXWV6vv49fO6BPcl2kfN4LVYPr5sGfdRYPzwYsY7aIhepOQeYHmq2VRAAtXlTYWnmOLtIbraGB+9PKvKJX5cyTDU4LyFfnoE9fg2TAbf3lzI1/uhJN7OFNlyPe7Rxqj3Ik7YP/uTbbu/EVsNY5R0gu5yU3BaZx+IXnGkqvU=
Received: from DS7PR05CA0024.namprd05.prod.outlook.com (2603:10b6:5:3b9::29)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 16:01:23 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:5:3b9:cafe::d3) by DS7PR05CA0024.outlook.office365.com
 (2603:10b6:5:3b9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Mon,
 5 May 2025 16:01:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 16:01:22 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 May 2025 11:01:18 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <hdegoede@redhat.com>, <W_Armin@gmx.de>, <ilpo.jarvinen@linux.intel.com>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v11] platform/x86: Add AMD ISP platform config for OV05C10
Date: Mon, 5 May 2025 12:00:58 -0400
Message-ID: <20250505160105.4122057-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a7c685-1c7b-4959-2732-08dd8bee1509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JEIVlhSTD9eSFu5NxA501lAH8etzHo6uTwJGFPq9+lvluQQek27BA7aVd54h?=
 =?us-ascii?Q?Xggt50NJJhACfb28UgsyKrBDrE/rPaOZxHv4gsR+YmZSvT1YnYCRFG3pUr3N?=
 =?us-ascii?Q?VcPVxfSVHHx8gjE/6kGmzT+AS/VIDxiFbt0zfmZa8DzTkzMBwOufRwckbZEK?=
 =?us-ascii?Q?XrI95Lo21HDkgrW5UCLX8YDtCyhooNVKQMb6zx8AKWCmAhdkctUdsLc06Gw7?=
 =?us-ascii?Q?F+iyfcacgVE6AsCrnXxNIdGLPgb7gnl4Det9lbBar9q3KeMhdHg7fn+60hk4?=
 =?us-ascii?Q?TAUlL0n9KD1y7H54W3s5s+Nc10zzK85PDP6YRXv45HdhLaDKDYWFEmYvQCDZ?=
 =?us-ascii?Q?cM0Q0Qcx924skBzreBC9jRGeOH3yTACKpqCRjh9aFCcutVkZZqwX5YjTMUpY?=
 =?us-ascii?Q?aIucZq4C0Uc47icyZ9p0S8/N8Mmi2GFO2a0+3xJXhhzJkN9f+M61zRwIAm30?=
 =?us-ascii?Q?qcYtlicu99X0cdNaSj4gz3xdz4RCuil5AufZNKNTZU9bEJ3ELG6CD3qm/YCu?=
 =?us-ascii?Q?sd65ikx26DtfdQ4PBHXkDthAowrraGAMqQ85xuNU3F/yvHAHPHe9bTZXwgvZ?=
 =?us-ascii?Q?hvWaA/mwKeMa91V/7ZHMF0pHVlc7sdTf/a+ECtIcuAxRM5jrOpb7HuHtKchB?=
 =?us-ascii?Q?t4lEkq1yuxPZuKhLRPyxfdnuhhI6SdY5rA5PNOl3hz/4FLtVdaGvYIbZqx2u?=
 =?us-ascii?Q?GTavvQ+x7uRMOxZX7RsMteLRr04RNxRrjsVN2cYyfqe59moJAY8OLxkRryFX?=
 =?us-ascii?Q?W+1gXFUy7ww1jaAHMhgbta9CAomUD2dcOYysu/2IgAv8EPBtr0ld7qlL+/4v?=
 =?us-ascii?Q?3Et6ScJ+S6B+Bgc+eHdYlOLsIlFJOD19Yo9/2CqwqEr4NAzuoqaFX06PI3AH?=
 =?us-ascii?Q?iXjaB3QxN2nRRq+gzs+5cmGrfp8wtHY3hYzti1KplZmOfRxNn8ZQ8UCms4TE?=
 =?us-ascii?Q?WjyNJl1aHLuOFwRX2friS1o86HBhsIBVvFbvVf+hVHJqbblCxa3ZtIUICXWr?=
 =?us-ascii?Q?cw+rnfANvXv4XUR/Z2j3nGqJboOzOlr0TSmdS78rohQDhUHX1pwvFc1IRF94?=
 =?us-ascii?Q?mlfbw0BbgQft/OJYPkwunuUY3Vp7VziGhA6ChsSPViXV+61Idp9xv/sxHOwx?=
 =?us-ascii?Q?HuXWjFa7ZWO+6EkpDdCHdBIPvxluvmw9/mFvOS16ykt1Fa3GvxYigX8FWcfk?=
 =?us-ascii?Q?z3af5yqRJv8DrpNDoUGhqs+AjgzLyS3xnSAXZWlyDesDku8L5MlQCMPekUCD?=
 =?us-ascii?Q?0IYxk7mVlGZmBBmyY2/K34nZkUkL5LS6xVR4FaxKI9SlN1RCbuy9/afgONR/?=
 =?us-ascii?Q?OOzkaaTGWVzT4UKNSf53t4Uzqn4seFaqExIKxb4o/2vdc9PO5XzgjamiRcPY?=
 =?us-ascii?Q?VTN6ycEu72atXC8H9OEq639TV1Di/QoQd8DPucdvCvFIIvOBqeCDgJuq4ukV?=
 =?us-ascii?Q?d7lHSvySeZoCSeysy5d5Md1jb3UhCQBVc+fYmwFUlGUcC3N/Inm6lEp850LE?=
 =?us-ascii?Q?HrsshqmUqbAVUalTKuX2+D45zBZu6584jfSx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 16:01:22.6410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a7c685-1c7b-4959-2732-08dd8bee1509
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v10 -> v11:

* Add check for return value of devm_mutex_init()

 drivers/platform/x86/amd/Kconfig    |  11 ++
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 280 ++++++++++++++++++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 drivers/platform/x86/amd/amd_isp4.c

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c3e086ea64fc..152a68a470e8 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -32,3 +32,14 @@ config AMD_WBRF
 
 	  This mechanism will only be activated on platforms that advertise a
 	  need for it.
+
+config AMD_ISP_PLATFORM
+	tristate "AMD ISP4 platform driver"
+	depends on I2C && X86_64 && ACPI
+	help
+	  Platform driver for AMD platforms containing image signal processor
+	  gen 4. Provides camera sensor module board information to allow
+	  sensor and V4L drivers to work properly.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called amd_isp4.
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index c6c40bdcbded..b0e284b5d497 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
 obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
+obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
new file mode 100644
index 000000000000..20993726949a
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD ISP platform driver for sensor i2-client instantiation
+ *
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/units.h>
+
+#define AMDISP_OV05C10_I2C_ADDR		0x10
+#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
+#define AMDISP_OV05C10_HID		"OMNI5C10"
+#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
+#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
+
+/*
+ * AMD ISP platform definition to configure the device properties
+ * missing in the ACPI table.
+ */
+struct amdisp_platform {
+	struct i2c_board_info board_info;
+	struct notifier_block i2c_nb;
+	struct i2c_client *i2c_dev;
+	struct mutex lock; /* protects i2c client creation */
+};
+
+/* Top-level OV05C10 camera node property table */
+static const struct property_entry ov05c10_camera_props[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
+	{ }
+};
+
+/* Root AMD ISP OV05C10 camera node definition */
+static const struct software_node camera_node = {
+	.name = AMDISP_OV05C10_HID,
+	.properties = ov05c10_camera_props,
+};
+
+/*
+ * AMD ISP OV05C10 Ports node definition. No properties defined for
+ * ports node for OV05C10.
+ */
+static const struct software_node ports = {
+	.name = "ports",
+	.parent = &camera_node,
+};
+
+/*
+ * AMD ISP OV05C10 Port node definition. No properties defined for
+ * port node for OV05C10.
+ */
+static const struct software_node port_node = {
+	.name = "port@",
+	.parent = &ports,
+};
+
+/*
+ * Remote endpoint AMD ISP node definition. No properties defined for
+ * remote endpoint node for OV05C10.
+ */
+static const struct software_node remote_ep_isp_node = {
+	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
+};
+
+/*
+ * Remote endpoint reference for isp node included in the
+ * OV05C10 endpoint.
+ */
+static const struct software_node_ref_args ov05c10_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
+};
+
+/* OV05C supports one single link frequency */
+static const u64 ov05c10_link_freqs[] = {
+	925 * HZ_PER_MHZ,
+};
+
+/* OV05C supports only 2-lane configuration */
+static const u32 ov05c10_data_lanes[] = {
+	1,
+	2,
+};
+
+/* OV05C10 endpoint node properties table */
+static const struct property_entry ov05c10_endpoint_props[] = {
+	PROPERTY_ENTRY_U32("bus-type", 4),
+	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
+				     ARRAY_SIZE(ov05c10_data_lanes)),
+	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
+				     ARRAY_SIZE(ov05c10_link_freqs)),
+	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
+	{ }
+};
+
+/* AMD ISP endpoint node definition */
+static const struct software_node endpoint_node = {
+	.name = "endpoint",
+	.parent = &port_node,
+	.properties = ov05c10_endpoint_props,
+};
+
+/*
+ * AMD ISP swnode graph uses 5 nodes and also its relationship is
+ * fixed to align with the structure that v4l2 expects for successful
+ * endpoint fwnode parsing.
+ *
+ * It is only the node property_entries that will vary for each platform
+ * supporting different sensor modules.
+ */
+#define NUM_SW_NODES 5
+
+static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
+	&camera_node,
+	&ports,
+	&port_node,
+	&endpoint_node,
+	&remote_ep_isp_node,
+	NULL
+};
+
+static const struct acpi_device_id amdisp_sensor_ids[] = {
+	{ AMDISP_OV05C10_HID },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
+
+static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
+{
+	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
+}
+
+static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
+{
+	struct i2c_board_info *info = &ov05c10->board_info;
+	struct i2c_client *i2c_dev;
+
+	guard(mutex)(&ov05c10->lock);
+
+	if (ov05c10->i2c_dev)
+		return;
+
+	i2c_dev = i2c_new_client_device(adap, info);
+	if (IS_ERR(i2c_dev)) {
+		dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
+		return;
+	}
+	ov05c10->i2c_dev = i2c_dev;
+}
+
+static int isp_i2c_bus_notify(struct notifier_block *nb,
+			      unsigned long action, void *data)
+{
+	struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
+	struct device *dev = data;
+	struct i2c_client *client;
+	struct i2c_adapter *adap;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		adap = i2c_verify_adapter(dev);
+		if (!adap)
+			break;
+		if (is_isp_i2c_adapter(adap))
+			instantiate_isp_i2c_client(ov05c10, adap);
+		break;
+	case BUS_NOTIFY_REMOVED_DEVICE:
+		client = i2c_verify_client(dev);
+		if (!client)
+			break;
+
+		scoped_guard(mutex, &ov05c10->lock) {
+			if (ov05c10->i2c_dev == client) {
+				dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
+				ov05c10->i2c_dev = NULL;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct amdisp_platform *prepare_amdisp_platform(struct device *dev)
+{
+	struct amdisp_platform *isp_ov05c10;
+	int ret;
+
+	isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
+	if (!isp_ov05c10)
+		return ERR_PTR(-ENOMEM);
+
+	ret = devm_mutex_init(dev, &isp_ov05c10->lock);
+	if(ret)
+		return ERR_PTR(ret);
+
+	isp_ov05c10->board_info.dev_name = "ov05c10";
+	strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
+	isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
+
+	ret = software_node_register_node_group(ov05c10_nodes);
+	if (ret)
+		return ERR_PTR(ret);
+
+	isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
+
+	return isp_ov05c10;
+}
+
+static int try_to_instantiate_i2c_client(struct device *dev, void *data)
+{
+	struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
+	struct i2c_adapter *adap = i2c_verify_adapter(dev);
+
+	if (!ov05c10 || !adap)
+		return 0;
+	if (!adap->owner)
+		return 0;
+
+	if (is_isp_i2c_adapter(adap))
+		instantiate_isp_i2c_client(ov05c10, adap);
+
+	return 0;
+}
+
+static int amd_isp_probe(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10;
+	int ret;
+
+	ov05c10 = prepare_amdisp_platform(&pdev->dev);
+	if (IS_ERR(ov05c10))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
+				     "failed to prepare AMD ISP platform fwnode\n");
+
+	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
+	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	if (ret)
+		goto error_unregister_sw_node;
+
+	/* check if adapter is already registered and create i2c client instance */
+	i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
+
+	platform_set_drvdata(pdev, ov05c10);
+	return 0;
+
+error_unregister_sw_node:
+	software_node_unregister_node_group(ov05c10_nodes);
+	return ret;
+}
+
+static void amd_isp_remove(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
+
+	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	i2c_unregister_device(ov05c10->i2c_dev);
+	software_node_unregister_node_group(ov05c10_nodes);
+}
+
+static struct platform_driver amd_isp_platform_driver = {
+	.driver	= {
+		.name			= AMD_ISP_PLAT_DRV_NAME,
+		.acpi_match_table	= amdisp_sensor_ids,
+	},
+	.probe	= amd_isp_probe,
+	.remove	= amd_isp_remove,
+};
+
+module_platform_driver(amd_isp_platform_driver);
+
+MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0



Return-Path: <platform-driver-x86+bounces-6768-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5069BE593
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 Nov 2024 12:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B28C51F222B5
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 Nov 2024 11:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902AA1DED43;
	Wed,  6 Nov 2024 11:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q90fNvdf"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA131DDC3A
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892654; cv=fail; b=tsKJuPfVCS0TbF8x/e6LC89AQjhpX8/DpyCGMfcyaqixKt4LOtnw+f/xFN+4AOULG3abDv1acIog6UY6cF1gh6jJ/H69WlA4EHxX9QH9wbRj6PRe39crqXrg681sXMf3JVzp7hM4Cyd3NN5O9B5rJvYkzb4KgKW++Cr6C46Iu+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892654; c=relaxed/simple;
	bh=4T9lTeKqx1dlDyPkjqMe8+5r1mgkK9JqPrNkQjjsCCk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H819c97pFtptMWzTMmCAYVrTFVOOJD+0QVC1RKcvQOAVjvHx62SWdSIY+NJme9bT104ZMBf+slBjnqAg4FaYojFVCYNnDiy/nCXgK4RHT2yoiyTOo6uexst8A2NWDO+1VwWVxDNfFkFuvfYrlHTf2pjUFFZjzsrGUT94PtkFJTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q90fNvdf; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFYAIvq6nwlyPK9Ka0AlQSS/dXIhHd36wfiWt7de/o4vrceyem5a0FzUPH2ZLEhpvzvyCRy4D6xIJGc5YBmGv0uOXbMdhbcDL3GVoFFhVTS7b+lh5YpZiPYllZ4maU6xUTcK5Rokk/8sIrEb+g+AjC4wq+ErIPuOC/S+NllduEp1llynolxXoFkr9AZZ+UD9JXJ2TJRKttR3b4du8YKIUcJSt59M5wiJ1oHXVvIupOEpooqaUu1t7WpGPD+Kc95EfJCp7H9IMno2CZgADWOSLeUEpGFQ2K1YFp+NMH31CCrqQQ0SlBIaVOnGZ/5K8ZS7Wpk4CY15/zSNunCD77/SVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBH+gkxyCXca2Z/CWJU9rIBlWIhhbnJoPLZX6tjdtTs=;
 b=aTokvzzpfLktvc61IUUqPYxp277SL9eSSPde5L9GW8mg18Ctz37pzCQnCC71DU3ffEwOzfqI3wROjvJiL6IM1cbsuUEora1tiPIvu/jVHfgL2+YG71wrckkQMxbNUkaxl97IJ/vPf+tp9lrUf380whjRaVgwaSlrRf4Wh/88cW3BIGFMDg4678uvutKjtl8A7totsLbaROwMH5lGj8dumEzToHcJspecMIdJBZHnfJ3qzXmBAgiOcsRWAzdbz/WciVysHU/6g1n6rdwyCWolCLBjLXTR5zFTCnd9Cl/xJsTWXorWM5Savk3tMATzFEV354gfh9bh3G8Nrk+7slCBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBH+gkxyCXca2Z/CWJU9rIBlWIhhbnJoPLZX6tjdtTs=;
 b=Q90fNvdfNQdHfwZEgAHLoqohyMBAvqaCgZOI9cu31OZ6d+NG2QVfkiizyqk9ShaJtsFRFT7nQR4rV15dZssqN1YsdwxHSWbDfQdyeCErhapCExhQX6q0NCMpPOHNqVF0Gx91IdMBAbhHiSvMdAS9RF0Y0dYJ2TTirsO4swkT6sc=
Received: from MW4P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::17)
 by SA1PR12MB8946.namprd12.prod.outlook.com (2603:10b6:806:375::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 11:30:46 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::95) by MW4P221CA0012.outlook.office365.com
 (2603:10b6:303:8b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31 via Frontend
 Transport; Wed, 6 Nov 2024 11:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 11:30:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 05:28:42 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
Date: Wed, 6 Nov 2024 16:58:20 +0530
Message-ID: <20241106112821.1012452-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com>
References: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SA1PR12MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b1c941-68f7-49b0-7055-08dcfe5674dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o3WknYQy4Tx3OuKMLzzpl3+9QX4xnhGFwhZyTFDZojOmkSgVXj23q6yq8tDJ?=
 =?us-ascii?Q?yA3AXKv7PhqZoa+akMr/HWshJYqaoQ6iWIbQTXmurvhIYoS1I4Fox/5MCF55?=
 =?us-ascii?Q?rNXiX/ycwqq+c6O2ljtSJl2iXfqMr10RA3hzLUGGCMuq1pcJVlTAAab3IiIc?=
 =?us-ascii?Q?oYve/l/TeprKAzKKeLSynL6wNeOjrYO1jan8O7i1EZix4WGcSwWv1oDDK7mD?=
 =?us-ascii?Q?ujoG1AUhkyTnvh0sgniyAt78RxKDyRTjs435TMeqQ+Xn7PpB03Uz0/NPzsXt?=
 =?us-ascii?Q?76wMxvw+V47q/78hFORboqnqAsYrxLc1JOkTBnfF+Oalg5dVAAJHwv5l2sM6?=
 =?us-ascii?Q?G0PtmCdHAw0TgyX/6JMXGejjjIwzxAbga5i/wbw/2/AocXUuipxlxZgQKkah?=
 =?us-ascii?Q?Y7wY4QzS9Sk8HEhoQ+QBQwE+3sv+Fd2QdQhYy3KldAtVlXdwXIYxBnACiorY?=
 =?us-ascii?Q?u3PX5X2hLCJH3uW1Wj9We2wc3sQFNMlK3kE6mqtkdMfTkVPC9XM57gnx9hmF?=
 =?us-ascii?Q?tXHWDfRBX+CdS2FyEqhkY89zlr7HeNKroXv4FkwjfPG7bJYAV+SN7M0Ks3+Z?=
 =?us-ascii?Q?81uaROJ1QHjkDjHlC+qLw/12h53AgnQDlt/59PFxdEDfKVJ61iVIg9ytY6AW?=
 =?us-ascii?Q?adWSpZYeLY8uUZ+082koF7MyB3hIVhM2SvwY5+vO1b25qALHh+ltGqfGLjxf?=
 =?us-ascii?Q?VthOxM1Frw9cH/m4b64TTrjPUaOgzDGRzgOeCudSDAlfRn7gTrNWSUduTTPz?=
 =?us-ascii?Q?Ut3yuaQbAcuGtOwN62BbzYf+pJtJATlKSj93oR9+KeBqLHAQzo5vIyIfc/9a?=
 =?us-ascii?Q?H/4aARsqKtCCUnPU47rvbAUueH+gF7ReLBnWRln3HGALLA1RJqHoFyJQdaJn?=
 =?us-ascii?Q?vqGJvmqWrlpxNxyRQdDgYo6wNYh/7H2StytBAHYF7VVJGOgc9f7j8MwPWZ+y?=
 =?us-ascii?Q?r9J9GrAQjBk5y1eYSvlwz9vPo5KU3HFVBcZHjNQBi/HWjXNV/gkgUnV8TtAk?=
 =?us-ascii?Q?uP8zDeL5hG8rVvKDLjzuOQRjIPAQhnhvJCJB4xt0C4djRmRhYy0Aov2ojZ6G?=
 =?us-ascii?Q?ZuRSJgqh41IcmGSD04t8F26IGxoKOTp+1MIYhnPdAF7/Z+uvbeLM4JGEsDHt?=
 =?us-ascii?Q?WvNSUa7bV26SkoR1sFft0Jyyfbk7qhSKJxkihXBnpO3Nxraw1Je7uSh1o13F?=
 =?us-ascii?Q?NEMA7EgOOkPuM1y2xxk7CYqvj04+K2ij9E9omzXkxMxbqPpH9KIpv7qEnzmH?=
 =?us-ascii?Q?MuULphmI2NHnbqLSW3KZVAYe7N1VPydWeNtGtTp97ocs2aGnhBOZkJB3W2Nw?=
 =?us-ascii?Q?e54AFbb2jJY9h//Fns+zfXep4Dg2aqDYSMACrrmJ6wlagGLW3TNFO5B8IXNg?=
 =?us-ascii?Q?PR2dLq/mMflYqtOPhXeqf9cgqS/0EsIy4FdKAGEm2dVMaKzaWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:45.9517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b1c941-68f7-49b0-7055-08dcfe5674dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8946

AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
switching between Frequency and Cache modes. To optimize performance,
implement the AMD 3D V-Cache Optimizer, which allows selecting either:

Frequency mode: cores within the faster CCD are prioritized before
those in the slower CCD.

Cache mode: cores within the larger L3 CCD are prioritized before
those in the smaller L3 CCD.

Co-developed-by: Perry Yuan <perry.yuan@amd.com>
Signed-off-by: Perry Yuan <perry.yuan@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 MAINTAINERS                           |   7 ++
 drivers/platform/x86/amd/Kconfig      |  12 ++
 drivers/platform/x86/amd/Makefile     |   2 +
 drivers/platform/x86/amd/x3d_vcache.c | 170 ++++++++++++++++++++++++++
 4 files changed, 191 insertions(+)
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 91d0609db61b..60155effead9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -965,6 +965,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/list/
 F:	drivers/infiniband/hw/efa/
 F:	include/uapi/rdma/efa-abi.h
 
+AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
+M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+R:	Mario Limonciello <mario.limonciello@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/amd/x3d_vcache.c
+
 AMD ADDRESS TRANSLATION LIBRARY (ATL)
 M:	Yazen Ghannam <Yazen.Ghannam@amd.com>
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index f88682d36447..d73f691020d0 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -6,6 +6,18 @@
 source "drivers/platform/x86/amd/pmf/Kconfig"
 source "drivers/platform/x86/amd/pmc/Kconfig"
 
+config AMD_3D_VCACHE
+	tristate "AMD 3D V-Cache Performance Optimizer Driver"
+	depends on X86_64 && ACPI
+	help
+	  The driver provides a sysfs interface, enabling the setting of a bias
+	  that alters CPU core reordering. This bias prefers cores with higher
+	  frequencies or larger L3 caches on processors supporting AMD 3D V-Cache
+	  technology.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_3d_vcache.
+
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
 	depends on AMD_NB && X86_64 && ACPI
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index dcec0a46f8af..16e4cce02242 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -4,6 +4,8 @@
 # AMD x86 Platform-Specific Drivers
 #
 
+obj-$(CONFIG_AMD_3D_VCACHE)     += amd_3d_vcache.o
+amd_3d_vcache-objs              := x3d_vcache.o
 obj-$(CONFIG_AMD_PMC)		+= pmc/
 amd_hsmp-y			:= hsmp.o
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
diff --git a/drivers/platform/x86/amd/x3d_vcache.c b/drivers/platform/x86/amd/x3d_vcache.c
new file mode 100644
index 000000000000..4a72ffe75cce
--- /dev/null
+++ b/drivers/platform/x86/amd/x3d_vcache.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD 3D V-Cache Performance Optimizer Driver
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ *          Perry Yuan <perry.yuan@amd.com>
+ *          Mario Limonciello <mario.limonciello@amd.com>
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+static char *x3d_mode = "frequency";
+module_param(x3d_mode, charp, 0);
+MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' (default) or 'cache'");
+
+#define DSM_REVISION_ID			0
+#define DSM_SET_X3D_MODE		1
+
+static guid_t x3d_guid = GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, 0x0a,
+				   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);
+
+enum amd_x3d_mode_type {
+	MODE_INDEX_FREQ,
+	MODE_INDEX_CACHE,
+};
+
+static const char * const amd_x3d_mode_strings[] = {
+	[MODE_INDEX_FREQ] = "frequency",
+	[MODE_INDEX_CACHE] = "cache",
+};
+
+struct amd_x3d_dev {
+	struct device *dev;
+	acpi_handle ahandle;
+	/* To protect x3d mode setting */
+	struct mutex lock;
+	enum amd_x3d_mode_type curr_mode;
+};
+
+static int amd_x3d_get_mode(struct amd_x3d_dev *data)
+{
+	guard(mutex)(&data->lock);
+
+	return data->curr_mode;
+}
+
+static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
+{
+	union acpi_object *out, argv;
+
+	guard(mutex)(&data->lock);
+	argv.type = ACPI_TYPE_INTEGER;
+	argv.integer.value = new_state;
+
+	out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID, DSM_SET_X3D_MODE,
+				&argv);
+	if (!out) {
+		dev_err(data->dev, "failed to evaluate _DSM\n");
+		return -EINVAL;
+	}
+
+	data->curr_mode = new_state;
+
+	kfree(out);
+
+	return 0;
+}
+
+static ssize_t amd_x3d_mode_store(struct device *dev, struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct amd_x3d_dev *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = sysfs_match_string(amd_x3d_mode_strings, buf);
+	if (ret < 0)
+		return ret;
+
+	ret = amd_x3d_mode_switch(data, ret);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t amd_x3d_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amd_x3d_dev *data = dev_get_drvdata(dev);
+	int mode = amd_x3d_get_mode(data);
+
+	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[mode]);
+}
+static DEVICE_ATTR_RW(amd_x3d_mode);
+
+static struct attribute *amd_x3d_attrs[] = {
+	&dev_attr_amd_x3d_mode.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(amd_x3d);
+
+static int amd_x3d_resume_handler(struct device *dev)
+{
+	struct amd_x3d_dev *data = dev_get_drvdata(dev);
+	int ret = amd_x3d_get_mode(data);
+
+	return amd_x3d_mode_switch(data, ret);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(amd_x3d_pm, NULL, amd_x3d_resume_handler);
+
+static const struct acpi_device_id amd_x3d_acpi_ids[] = {
+	{"AMDI0101"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
+
+static int amd_x3d_probe(struct platform_device *pdev)
+{
+	struct amd_x3d_dev *data;
+	acpi_handle handle;
+	int ret;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, BIT(DSM_SET_X3D_MODE)))
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &pdev->dev;
+	data->ahandle = handle;
+	platform_set_drvdata(pdev, data);
+
+	ret = match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mode);
+
+	devm_mutex_init(data->dev, &data->lock);
+
+	return amd_x3d_mode_switch(data, ret);
+}
+
+static struct platform_driver amd_3d_vcache_driver = {
+	.driver = {
+		.name = "amd_x3d_vcache",
+		.dev_groups = amd_x3d_groups,
+		.acpi_match_table = amd_x3d_acpi_ids,
+		.pm = pm_sleep_ptr(&amd_x3d_pm),
+	},
+	.probe = amd_x3d_probe,
+};
+module_platform_driver(amd_3d_vcache_driver);
+
+MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1



Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59AB58451F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 28 Jul 2022 19:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiG1Rmv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 28 Jul 2022 13:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbiG1Rmu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:50 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD35B74CC2
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZclH49qesNDbIjBXNTutRGshPEBAs//hYECXA2lbQdUXx30ufs8CCrXX4PcvBJ1mT3FMVWF3iO3JZ//ghdpjgnLwqfa51CGR8twcfAvzCphtTv1Zm1mUvqedRSubTCPl1xsX+cdXlCtYPbzua5QcCJyynPH0RBAjNCOOs+jvpG3yVOTolq0RVoq2NGB9BZAgo5IBLfMHyJYuU2PgkozvlTjkOnwXiPC6NimzIZC65x7YyeCCHEWvj0tam8BtznTYoFPFmPMwjAissODfhdCk+mpRDMqhBjD1QszNOxw0NsbcrBmJ9iHZ7ln5QQpiIuMZgHbVnM79JJulIrODCrW7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dmEODbXJZ7g8nKhqhv1aOplbb39t3KgL8xWdsA2ZUM=;
 b=Hz1GHAZXCvaEtoIYuLX07VmfXq9klE4ck08DKhq9qhSRFtZYw2zZiibS0ABk8VMyxM/1nlwpNPLSwyCmHw0py6SQO0P8Qd7M1BhPx6ZOI5kIrrmaNVbBqSXqD27GuHV35oxxj+Qa13Ob/axJSX4EzH6hcq6kjSdjqrhSWHjp3a0NJ44vS4AVpexVe9A1s+wxODM7UXiYDGwsXNBrD34opUJorsPiPkLa0C6weDwzibJvqIrWvntFba+Ar8ybIDYxiSDc5DvEsHbAe+V9buU70tyveKPUP/8R4XFvGLQffwn0Y/YYZ+X/xQAF10ggtGLJjTW2i5piYl6iQ1XWIOZiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dmEODbXJZ7g8nKhqhv1aOplbb39t3KgL8xWdsA2ZUM=;
 b=nlVTP1z1T4cQsCwWrH0YzJbOytP6d0csfQ7/qQWjZhU9qKEOAr/FXfiBXwMvtcWi2Ovb3zOFQe1Ua8wVESf07ahSjlW+nc8APVC55kBc1RdZxOP2VgIeyk6WhoLBk7YlhcUtFp+fORCot1WrNU1QhTv4m/breEGgkM5cZSda+F0=
Received: from MW2PR16CA0025.namprd16.prod.outlook.com (2603:10b6:907::38) by
 MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Thu, 28 Jul
 2022 17:42:46 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::e2) by MW2PR16CA0025.outlook.office365.com
 (2603:10b6:907::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:43 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 03/11] platform/x86/amd/pmf: Add support SPS PMF feature
Date:   Thu, 28 Jul 2022 23:12:00 +0530
Message-ID: <20220728174208.2081453-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
References: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ddef474-3d5f-46a3-856b-08da70c09550
X-MS-TrafficTypeDiagnostic: MW5PR12MB5682:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEAhHtv0o1ZrnssVvqOAuH6jE24nzqZzqon5waHiWm2s1yoDMq6dc2RYdj1MN2JYZjdMaxTWHChfwQRnMT4mDugCNeD38GAAq/5oI0LFE4KIIjOs9k+Z65VzHrI29lItjuxCxW2icExhHkU4oBgXtUDcWZtbvhxa6jKqotJI/ITN5uQ8mcrNdILkS1V4HcmJkylFGI3If4YhesLDgDBdoSClmBKllUPWs4b70UbrbWR2fqqMAsfHLgHmsK8EHt5dMGwUwsk/OEbJTUj1agzYUPTdHHSBIwV/A/rVwzLjAmHRT2Uq8yhhbPX0VgVP0GoRhRBEWffNKt3B9Uzg4pma1baMbBPP8pykpm2F5dWYSoLeEVIqdW9syf397nTlQbV8oO8PY5iKgLodRRfBS4lhbwy2YTizVFE6pGjn264P17EAZPHIuz+fSIGYUSRyxrJ8ce2BHXbZKEO1xXz3LUXQ4WqEKFbEuatvKb1nu+Hi/nf6oYHI/shIRqaHRjEaiFDcgtLb4G86AgepCMr/OnwqmL/YB0JmwbowEa/6d1FU4jgeptoBx/nd6siljRRl8UwVNMeX3pJnyChpftH1tgpvcZ8jknfTBMEDx+vmMELXk/mn2tsZ2FxjTYp0rPAJjjFFsG9FF3VM5VNp6FfePonQ4jSTArRZ4xrAGqEaiEaWvRJUk+0zxL4384jm6PlMpopD9IhiL+l7d9eW4Ij2PKhknRFQ5p4GcdeX85tALGHuJm0Fq2rOMdI1X98w8rWOfdWlgTvknz3xsthRYyxY6AoWNGI5lbqaY3yfHhwKx5Rgqz0ga6i8ZCi11rkDsRIbYfljc+e57BdEiNDFqL1rUygL6g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(54906003)(336012)(110136005)(478600001)(7696005)(16526019)(47076005)(1076003)(186003)(40460700003)(426003)(36860700001)(36756003)(356005)(82310400005)(70206006)(41300700001)(4326008)(8676002)(2906002)(70586007)(81166007)(26005)(8936002)(83380400001)(2616005)(86362001)(6666004)(30864003)(5660300002)(316002)(82740400003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:46.5585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddef474-3d5f-46a3-856b-08da70c09550
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SPS (a.k.a. Static Power Slider) gives a feel of Windows performance
power slider for the Linux users, where the user selects a certain
mode (like "balanced", "low-power" or "performance") and the thermals
associated with each selected mode gets applied from the silicon
side via the mailboxes defined through PMFW.

PMF driver hooks to platform_profile by reading the PMF ACPI fn9 to
see if the support is being advertised by ACPI interface.

If supported, the PMF driver reacts to platform_profile selection choices
made by the user and adjust the system thermal behavior.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c   |   8 ++
 drivers/platform/x86/amd/pmf/core.c   |  26 +++++
 drivers/platform/x86/amd/pmf/pmf.h    |  64 +++++++++++
 drivers/platform/x86/amd/pmf/sps.c    | 152 ++++++++++++++++++++++++++
 5 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/sps.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 2617eba773ce..557521a80427 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -5,4 +5,4 @@
 #
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
-amd-pmf-objs := core.o acpi.o
+amd-pmf-objs := core.o acpi.o sps.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index bd796d7e1d96..41abd8680d8d 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -98,6 +98,7 @@ static int apmf_if_call_store_buffer(struct apmf_if *apmf_if, int func, void *de
 static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
+	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
 }
 
 int is_apmf_func_supported(unsigned long index)
@@ -106,6 +107,13 @@ int is_apmf_func_supported(unsigned long index)
 	return ((supported_func & (1 << (index - 1))) != 0);
 }
 
+int apmf_get_static_slider_granular(struct apmf_if *apmf_if,
+				    struct apmf_static_slider_granular_output *data)
+{
+	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_STATIC_SLIDER_GRANULAR,
+									data, sizeof(*data));
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
 {
 	struct apmf_verify_interface output;
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c5002b7bb904..b6006e8ee1a1 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/power_supply.h>
 #include "pmf.h"
 
 /* PMF-SMU communication registers */
@@ -45,6 +46,14 @@
 #define DELAY_MIN_US	2000
 #define DELAY_MAX_US	3000
 
+int amd_pmf_get_power_source(void)
+{
+	if (power_supply_is_system_supplied() > 0)
+		return POWER_SOURCE_AC;
+	else
+		return POWER_SOURCE_DC;
+}
+
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
 {
 	return ioread32(dev->regbase + reg_offset);
@@ -138,6 +147,21 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
+static void amd_pmf_init_features(struct amd_pmf_dev *dev)
+{
+	/* Enable Static Slider */
+	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+		amd_pmf_init_sps(dev);
+		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
+	}
+}
+
+static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
+{
+	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		amd_pmf_deinit_sps(dev);
+}
+
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0102", 0},
 	{ }
@@ -206,6 +230,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_init_features(dev);
 
 	mutex_init(&dev->lock);
 	dev_info(dev->dev, "registered PMF device successfully\n");
@@ -218,6 +243,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
 	mutex_destroy(&dev->lock);
+	amd_pmf_deinit_features(dev);
 	kfree(dev->buf);
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 08c6bc0e2b42..30740a5cd30d 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,10 +12,12 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/platform_profile.h>
 
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
+#define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
 /* Message Definitions */
 #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
@@ -36,9 +38,12 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 
+#define ARG_NONE 0
+
 /* AMD PMF BIOS interfaces */
 struct apmf_if_functions {
 	bool system_params;
+	bool static_slider_granular;
 };
 
 struct apmf_if {
@@ -60,6 +65,30 @@ struct apmf_system_params {
 	u8 command_code;
 } __packed;
 
+enum amd_stt_skin_temp {
+	STT_TEMP_APU,
+	STT_TEMP_HS2,
+	STT_TEMP_COUNT,
+};
+
+enum amd_slider_op {
+	SLIDER_OP_GET,
+	SLIDER_OP_SET,
+};
+
+enum power_source {
+	POWER_SOURCE_AC,
+	POWER_SOURCE_DC,
+	POWER_SOURCE_MAX,
+};
+
+enum power_modes {
+	POWER_MODE_PERFORMANCE,
+	POWER_MODE_BALANCED_POWER,
+	POWER_MODE_POWER_SAVER,
+	POWER_MODE_MAX,
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -68,11 +97,46 @@ struct amd_pmf_dev {
 	u32 cpu_id;
 	struct device *dev;
 	struct apmf_if *apmf_if;
+	enum platform_profile_option current_profile;
+	struct platform_profile_handler pprof;
 	struct mutex lock; /* protects the PMF interface */
 };
 
+struct apmf_sps_prop_granular {
+	u32 fppt;
+	u32 sppt;
+	u32 sppt_apu_only;
+	u32 spl;
+	u32 stt_min;
+	u8 stt_skin_temp[STT_TEMP_COUNT];
+	u32 fan_id;
+} __packed;
+
+/* Static Slider */
+struct apmf_static_slider_granular_output {
+	u16 size;
+	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX * POWER_MODE_MAX];
+} __packed;
+
+struct amd_pmf_static_slider_granular {
+	u16 size;
+	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
+};
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
+int is_apmf_func_supported(unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
+int amd_pmf_get_power_source(void);
+
+/* SPS Layer */
+u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
+void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
+			   struct amd_pmf_static_slider_granular *table);
+int amd_pmf_init_sps(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
+int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
+				    struct apmf_static_slider_granular_output *output);
+void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
new file mode 100644
index 000000000000..2601adbfe14a
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework (PMF) Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include "pmf.h"
+
+static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
+			       enum platform_profile_option *profile);
+static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
+			       enum platform_profile_option profile);
+static struct amd_pmf_static_slider_granular config_store;
+
+void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
+{
+	struct apmf_static_slider_granular_output output;
+	int i, j, idx = 0;
+
+	memset(&config_store, 0, sizeof(config_store));
+
+	if (dev->apmf_if->func.static_slider_granular) {
+		apmf_get_static_slider_granular(dev->apmf_if, &output);
+
+		for (i = 0; i < POWER_SOURCE_MAX; i++) {
+			for (j = 0; j < POWER_MODE_MAX; j++) {
+				config_store.prop[i][j].spl = output.prop[idx].spl;
+				config_store.prop[i][j].sppt = output.prop[idx].sppt;
+				config_store.prop[i][j].sppt_apu_only =
+							output.prop[idx].sppt_apu_only;
+				config_store.prop[i][j].fppt = output.prop[idx].fppt;
+				config_store.prop[i][j].stt_min = output.prop[idx].stt_min;
+				config_store.prop[i][j].stt_skin_temp[STT_TEMP_APU] =
+						output.prop[idx].stt_skin_temp[STT_TEMP_APU];
+				config_store.prop[i][j].stt_skin_temp[STT_TEMP_HS2] =
+						output.prop[idx].stt_skin_temp[STT_TEMP_HS2];
+				config_store.prop[i][j].fan_id = output.prop[idx].fan_id;
+				idx++;
+			}
+		}
+	}
+}
+
+void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
+			   struct amd_pmf_static_slider_granular *table)
+{
+	int src = amd_pmf_get_power_source();
+
+	if (op == SLIDER_OP_SET) {
+		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
+		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
+				 config_store.prop[src][idx].sppt_apu_only, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+				 config_store.prop[src][idx].stt_min, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
+	} else if (op == SLIDER_OP_GET) {
+		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &table->prop[src][idx].spl);
+		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &table->prop[src][idx].fppt);
+		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &table->prop[src][idx].sppt);
+		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
+				 &table->prop[src][idx].sppt_apu_only);
+		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
+				 &table->prop[src][idx].stt_min);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
+				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_APU]);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
+				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_HS2]);
+	}
+}
+
+static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
+			       enum platform_profile_option *profile)
+{
+	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
+
+	*profile = pmf->current_profile;
+	return 0;
+}
+
+u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
+{
+	u8 mode;
+
+	switch (pmf->current_profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		mode = POWER_MODE_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		mode = POWER_MODE_BALANCED_POWER;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		mode = POWER_MODE_POWER_SAVER;
+		break;
+	default:
+		dev_err(pmf->dev, "Unknown Platform Profile.\n");
+		break;
+	}
+
+	return mode;
+}
+
+int amd_pmf_profile_set(struct platform_profile_handler *pprof,
+			enum platform_profile_option profile)
+{
+	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
+	u8 mode;
+
+	pmf->current_profile = profile;
+	mode = amd_pmf_get_pprof_modes(pmf);
+	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
+	return 0;
+}
+
+int amd_pmf_init_sps(struct amd_pmf_dev *dev)
+{
+	int err = 0;
+
+	dev->pprof.profile_get = amd_pmf_profile_get;
+	dev->pprof.profile_set = amd_pmf_profile_set;
+
+	/* Setup supported modes */
+	set_bit(PLATFORM_PROFILE_LOW_POWER, dev->pprof.choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, dev->pprof.choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, dev->pprof.choices);
+
+	/* Create platform_profile structure and register */
+	err = platform_profile_register(&dev->pprof);
+	if (err) {
+		dev_err(dev->dev, "Failed to register SPS support, this is most likely an SBIOS bug: %d\n",
+			err);
+		return -EEXIST;
+	}
+
+	dev->current_profile = PLATFORM_PROFILE_BALANCED;
+	amd_pmf_load_defaults_sps(dev);
+
+	return err;
+}
+
+void amd_pmf_deinit_sps(struct amd_pmf_dev *dev)
+{
+	platform_profile_remove();
+}
-- 
2.25.1


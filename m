Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D84584512
	for <lists+platform-driver-x86@lfdr.de>; Thu, 28 Jul 2022 19:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiG1Rmu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 28 Jul 2022 13:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbiG1Rms (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:48 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBFB747B1
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZ7JEpYDfCXPCXmYYnITq980RgY14jBZ80XT+bgQm98Wx+x0jO1V63sA/ghXXqXMyvxP0T9AcUlzkjvqZRdtHUMyB0X6mOteZOKH8/aD21+7glyQgQK2XyFhAGLHQRbVQuGzQVHQNMMQXopb7ShG5y5a78R/Hd1aKS7bKpCC4JdWek2GRkQythXwqKqqOfeloMd0IzntEgh8hm59WjQ4w302KyO2xmVxbbulW5UESeXJwQHwSW/I/Rj07c8RBk4pG8cTvOsdqxW48lb81UxS2p+h7a3oDuiVatosuGnS92PCbixe4WNBX4Crgw6G2QAc/Z75nAbdVZlkj7PxUOj/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gW/L+FNdJI6KIY6poPeUBcKuDxWAuv2jDnBAPezxrTo=;
 b=aatXqwjMRTQqSDyHiTZPbB7mLPJ1DABTQiAhyKhsH0TohwvXlkHkaOGo8aNZonfrsnsxgIqpe/Ix2UuxX2uPAkkll9h110dLbT0i3/9QkVUZHtfeTsRcKzcKW0ox1top+klpW3muPCM7ssQFUYsISRjlB9UHhSJ0nOHwMlFHQIoCfDgyhTKADgGozEm6G9MnI968HO7sH28eD5DU5l/lEE5PrjAMwY7r3+5T/xY1/UdEQtFViaBXImGLy7Trj+NTCKzVN8SVErNrThCWb4jtsJr9aJyOt8iHlofDu3rtE1q9IdCd1Ufjjmek/2DXbkm2eTYc0sP73o86mIBfaqo6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gW/L+FNdJI6KIY6poPeUBcKuDxWAuv2jDnBAPezxrTo=;
 b=htKptvWMbAvFl45R8ypv+9ItsIB/5yyII5wD4FBWlGDHeeYPB4c44+xQxfhVPdUT0LatIa3AFkaAa8K6+FbiLBNiaj/qGbqqw71TOj6e3TOzSz75nUzf+BFoCeHCWsgr9jya42gMIZAZMAqJSrkNCTQvCYPRgIC8PbyFEY27RQM=
Received: from MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::30)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 17:42:43 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::ae) by MW4P221CA0025.outlook.office365.com
 (2603:10b6:303:8b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 01/11] platform/x86/amd/pmf: Add support for PMF core layer
Date:   Thu, 28 Jul 2022 23:11:58 +0530
Message-ID: <20220728174208.2081453-2-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c1c826ef-c7da-4b91-7bef-08da70c092d6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84+bPMhKMhfhxrS++pzmi2UoH2muzgnioSD6EsL5yE2yda+SNwJw6xYtOwi0Pmlsx4Z1smW7gbBqgbm1IXzeNHVrfILLqkjl1QcqXjzXBFUGZOigO1jmjCZttHycVtY7ja6NVIxIr+4kIljV3pwuxbbGPiu/DwPXDq1LwSD6nHxZ19zcq8s0s35Gw5qGRX146C0wlD8tH/Num3+x2OUriSP0AC7ZWPER+nAS8DZ4F5n6FpumPLRPLLoHDq/1QQteqM5RehTRKClr5hVhY035V1nuH0baP8T49KPwHZ+QH0zg+el99HMNw7eF5+n5PJ3+AMXxwbgV1eWoTQsKi8juFAtYo/A5iJGJHNyqrpf3M7TSb7RZz9s0w8OsKZj9wH4wmStU8RpruBc4cufCxtZJ3SeItamqOAwF1UViiNYj+wLDJT9/gTQl8c8RtlaKy4Rsosa1XGg7yQmcXcmYtMxgeCU20sHwRodVdPNMvTHhRsWGDwRV19VtB3H2O9G6WyI1xl1m/oWeQ2vs83G5w2B2IbOLNjWucz4T/lQ0GZRh20rhBpsH+kqxSDnbH5jAqpX7reHpdAu4ISy8ohACzmJ8nPV80IAMXGEf3XYlEuQbp8DQujZrNkT+8BHqe6Hx8gVMEZhQurVLdDmq9tBep7ybmKjmM5oz3YrOMUcfjS8bDYF+5i1t3FerXhPmiLXbX89gahz8QMzZnu+j5KX4X2PreLIooDu6P7DgO6EaCHxo1vpUDVz3n3LXsxQ0757nfwvVPEUmMCGmrbLF9iFApiD1DlmyemFtXa/XDXo7NFwx8BcBLwzMnO+Frwb9zUGttyIouB8XsS4IpzifU3RHC1+xYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(40470700004)(46966006)(36840700001)(7696005)(86362001)(316002)(186003)(81166007)(1076003)(41300700001)(6666004)(40460700003)(83380400001)(16526019)(426003)(82310400005)(26005)(54906003)(110136005)(478600001)(36756003)(336012)(36860700001)(8676002)(4326008)(82740400003)(47076005)(8936002)(2906002)(30864003)(70206006)(2616005)(40480700001)(5660300002)(356005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:42.3720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c826ef-c7da-4b91-7bef-08da70c092d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF core layer is meant to abstract the common functionalities
across PMF features. This layer also does the plumbing work
like setting up the mailbox channel for the communication
between the PMF driver and the PMFW (Power Management Firmware)
running on the SMU.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/Kconfig      |   2 +
 drivers/platform/x86/amd/Makefile     |   1 +
 drivers/platform/x86/amd/pmf/Kconfig  |  16 ++
 drivers/platform/x86/amd/pmf/Makefile |   8 +
 drivers/platform/x86/amd/pmf/core.c   | 235 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    |  46 +++++
 6 files changed, 308 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 drivers/platform/x86/amd/pmf/core.c
 create mode 100644 drivers/platform/x86/amd/pmf/pmf.h

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c0d0a3c5170c..a825af8126c8 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -3,6 +3,8 @@
 # AMD x86 Platform Specific Drivers
 #
 
+source "drivers/platform/x86/amd/pmf/Kconfig"
+
 config AMD_PMC
 	tristate "AMD SoC PMC driver"
 	depends on ACPI && PCI && RTC_CLASS
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index a03fbb08e808..2c229198e24c 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -8,3 +8,4 @@ amd-pmc-y			:= pmc.o
 obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
 amd_hsmp-y			:= hsmp.o
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+obj-$(CONFIG_AMD_PMF)		+= pmf/
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
new file mode 100644
index 000000000000..2a5f72419515
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD PMF Driver
+#
+
+config AMD_PMF
+	tristate "AMD Platform Management Framework"
+	depends on ACPI
+	help
+	  This driver provides support for the AMD Platform Management Framework.
+	  The goal is to enhance end user experience by making AMD PCs smarter,
+	  quiter, power efficient by adapting to user behavior and environment.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called amd_pmf.
+
diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
new file mode 100644
index 000000000000..459005f659e5
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/amd/pmf
+# AMD Platform Management Framework
+#
+
+obj-$(CONFIG_AMD_PMF) += amd-pmf.o
+amd-pmf-objs := core.o
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
new file mode 100644
index 000000000000..aef97965c181
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include "pmf.h"
+
+/* PMF-SMU communication registers */
+#define AMD_PMF_REGISTER_MESSAGE	0xA18
+#define AMD_PMF_REGISTER_RESPONSE	0xA78
+#define AMD_PMF_REGISTER_ARGUMENT	0xA58
+
+/* Base address of SMU for mapping physical address to virtual address */
+#define AMD_PMF_SMU_INDEX_ADDRESS	0xB8
+#define AMD_PMF_SMU_INDEX_DATA		0xBC
+#define AMD_PMF_MAPPING_SIZE		0x01000
+#define AMD_PMF_BASE_ADDR_OFFSET	0x10000
+#define AMD_PMF_BASE_ADDR_LO		0x13B102E8
+#define AMD_PMF_BASE_ADDR_HI		0x13B102EC
+#define AMD_PMF_BASE_ADDR_LO_MASK	GENMASK(15, 0)
+#define AMD_PMF_BASE_ADDR_HI_MASK	GENMASK(31, 20)
+
+/* SMU Response Codes */
+#define AMD_PMF_RESULT_OK                    0x01
+#define AMD_PMF_RESULT_CMD_REJECT_BUSY       0xFC
+#define AMD_PMF_RESULT_CMD_REJECT_PREREQ     0xFD
+#define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
+#define AMD_PMF_RESULT_FAILED                0xFF
+
+/* List of supported CPU ids */
+#define AMD_CPU_ID_PS			0x14e8
+
+#define PMF_MSG_DELAY_MIN_US		50
+#define RESPONSE_REGISTER_LOOP_MAX	20000
+
+#define DELAY_MIN_US	2000
+#define DELAY_MAX_US	3000
+
+static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
+{
+	return ioread32(dev->regbase + reg_offset);
+}
+
+static inline void amd_pmf_reg_write(struct amd_pmf_dev *dev, int reg_offset, u32 val)
+{
+	iowrite32(val, dev->regbase + reg_offset);
+}
+
+static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
+{
+	u32 value;
+
+	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_RESPONSE);
+	dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
+
+	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
+	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
+
+	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_MESSAGE);
+	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
+}
+
+int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data)
+{
+	int rc;
+	u32 val;
+
+	mutex_lock(&dev->lock);
+
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
+				val, val != 0, PMF_MSG_DELAY_MIN_US,
+				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "failed to talk to SMU\n");
+		goto out_unlock;
+	}
+
+	/* Write zero to response register */
+	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_RESPONSE, 0);
+
+	/* Write argument into argument register */
+	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_ARGUMENT, arg);
+
+	/* Write message ID to message ID register */
+	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_MESSAGE, message);
+
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
+				val, val != 0, PMF_MSG_DELAY_MIN_US,
+				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "SMU response timed out\n");
+		goto out_unlock;
+	}
+
+	switch (val) {
+	case AMD_PMF_RESULT_OK:
+		if (get) {
+			/* PMFW may take longer time to return back the data */
+			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
+			*data = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
+		}
+		break;
+	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
+		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
+		rc = -EBUSY;
+		goto out_unlock;
+	case AMD_PMF_RESULT_CMD_UNKNOWN:
+		dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
+		rc = -EINVAL;
+		goto out_unlock;
+	case AMD_PMF_RESULT_CMD_REJECT_PREREQ:
+	case AMD_PMF_RESULT_FAILED:
+	default:
+		dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
+		rc = -EIO;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&dev->lock);
+	amd_pmf_dump_registers(dev);
+	return rc;
+}
+
+static const struct pci_device_id pmf_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
+	{ }
+};
+
+static const struct acpi_device_id amd_pmf_acpi_ids[] = {
+	{"AMDI0102", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
+
+static int amd_pmf_probe(struct platform_device *pdev)
+{
+	struct amd_pmf_dev *dev;
+	struct pci_dev *rdev;
+	u32 base_addr_lo;
+	u32 base_addr_hi;
+	u64 base_addr;
+	u32 val;
+	int err;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->dev = &pdev->dev;
+
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
+		pci_dev_put(rdev);
+		return -ENODEV;
+	}
+
+	dev->cpu_id = rdev->device;
+	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_LO);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
+	if (err) {
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
+
+	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_HI);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
+	if (err) {
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	base_addr_hi = val & AMD_PMF_BASE_ADDR_LO_MASK;
+	pci_dev_put(rdev);
+	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+
+	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMF_BASE_ADDR_OFFSET,
+				    AMD_PMF_MAPPING_SIZE);
+	if (!dev->regbase)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dev);
+
+	mutex_init(&dev->lock);
+	dev_info(dev->dev, "registered PMF device successfully\n");
+
+	return 0;
+}
+
+static int amd_pmf_remove(struct platform_device *pdev)
+{
+	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
+
+	mutex_destroy(&dev->lock);
+	kfree(dev->buf);
+	return 0;
+}
+
+static struct platform_driver amd_pmf_driver = {
+	.driver = {
+		.name = "amd-pmf",
+		.acpi_match_table = amd_pmf_acpi_ids,
+	},
+	.probe = amd_pmf_probe,
+	.remove = amd_pmf_remove,
+};
+module_platform_driver(amd_pmf_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
new file mode 100644
index 000000000000..1c2e942e5096
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Platform Management Framework Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#ifndef PMF_H
+#define PMF_H
+
+/* Message Definitions */
+#define SET_SPL				0x03 /* SPL: Sustained Power Limit */
+#define SET_SPPT			0x05 /* SPPT: Slow Package Power Tracking */
+#define SET_FPPT			0x07 /* FPPT: Fast Package Power Tracking */
+#define GET_SPL				0x0B
+#define GET_SPPT			0x0D
+#define GET_FPPT			0x0F
+#define SET_DRAM_ADDR_HIGH	0x14
+#define SET_DRAM_ADDR_LOW	0x15
+#define SET_TRANSFER_TABLE	0x16
+#define SET_STT_MIN_LIMIT	0x18 /* STT: Skin Temperature Tracking */
+#define SET_STT_LIMIT_APU	0x19
+#define SET_STT_LIMIT_HS2	0x1A
+#define SET_SPPT_APU_ONLY	0x1D
+#define GET_SPPT_APU_ONLY	0x1E
+#define GET_STT_MIN_LIMIT	0x1F
+#define GET_STT_LIMIT_APU	0x20
+#define GET_STT_LIMIT_HS2	0x21
+
+struct amd_pmf_dev {
+	void __iomem *regbase;
+	void __iomem *smu_virt_addr;
+	void *buf;
+	u32 base_addr;
+	u32 cpu_id;
+	struct device *dev;
+	struct mutex lock; /* protects the PMF interface */
+};
+
+/* Core Layer */
+int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
+
+#endif /* PMF_H */
-- 
2.25.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F0B3B6808
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Jun 2021 20:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbhF1SG6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 28 Jun 2021 14:06:58 -0400
Received: from mail-mw2nam10on2085.outbound.protection.outlook.com ([40.107.94.85]:47822
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233028AbhF1SG6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:06:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXe/XX2wAJMvzMqTxEUCthASOvYjuhpUVUif7KeU1ra9tKDBr8COhXES0MIbe1cawsI+xK2HBBPr5OWlEWUiNNJ00XQB4HjGCv48rTHZo7ocoulUn5lIYhwIXW4x2pTODPo7Sz7P1rXSOfMxpQT1ZFB+o1Vs8tm5hE6WRiq77EdkCYF+AbiiA5AqqzWGvFn7Neahga8hE918PvPM3v3obdPoXuVyMnJEm1dfwAxYTfkw9lBGYUePj4ajsesvRlW8sjoeTzPKHVFR0g8CCLIPvHt1jOKNLFAVyh5Bd0sHL5bMrjskP1wbdTLZ057XMM97eCUB7+zquMmaV9zkvp3Odw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDyvhWriuZpnKc4Xxl3DgUwV28+e1A+RNozPBek7tlI=;
 b=X1f/Y7Y/IqoIe1mtRYtNA5h0QlFntG5ijdWB1ccp1Z6QWnQ/oXuVq0J0EQ2G7ZEwxqCCdZc7kUwTz4Drla0QRKU0lbZOARXOhOwFF+pYo/xTZU7AqPRO661qRUa2F/g1Ow0VvWIn5WE23RAkoW63scNVoiH6eJfJGxnU1FBOkm+ZBWhqUFL6dJkTPV3CMko1URLpwMRfmEInfWlQU7UXSL4WznclXhxSivoX/SbI6osTh2NSAMapbGaZsq9OtkrnaMnAEZ1NQD38sT4juegdlbymGGSN8cwyKk/M2zpyLGgOTk86H6rL1vhiZexEcpqNHSNHdF5nB/hT9OyZ4mbGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDyvhWriuZpnKc4Xxl3DgUwV28+e1A+RNozPBek7tlI=;
 b=PBXaVkda7yS6CXVU1wvzVP3Hrdf/D82rtDhr/tDlTg7pLdL0hBBddUeKCX6Rc+31XiHia38/wa4Hj0PqyGO6KWJZ0Jww0iMsd6mb/IZ0Xzb5asakLybTnjdiXHwg/nwRBzVoje5qoHyw8XeXxnu5TOiZS7iJl8NmvXjEeFtkzHo=
Received: from MW4PR04CA0311.namprd04.prod.outlook.com (2603:10b6:303:82::16)
 by DM5PR12MB1803.namprd12.prod.outlook.com (2603:10b6:3:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 18:04:31 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::2a) by MW4PR04CA0311.outlook.office365.com
 (2603:10b6:303:82::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 18:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 18:04:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 13:04:28 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/7] platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
Date:   Mon, 28 Jun 2021 23:33:58 +0530
Message-ID: <20210628180403.236553-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
References: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcda215e-04f9-45de-21fd-08d93a5f2d98
X-MS-TrafficTypeDiagnostic: DM5PR12MB1803:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1803FCC9B2AFC91E3E4C90F39A039@DM5PR12MB1803.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pXba0IfIGAff7/rSex0j9MDiR2HAObkKw84RgOyP6GQvqnJi7b4vXNm17XdcWAbeN6XupybqE4MYWcVJR80G2vaacY+T3uqSvDnppO0KSelcyGJ9aI+r4RyHDIgoLOir+iWdXIgXLKZ8htYUhLllV1q4fh4yeODHlBJoXzh+hFlBoLmLccogyOpoRqZ1oexsDLgdr+adXJFVQB9aymZ8H6PsOXS3A1h4EMfjdVYHI/h/ib/Qi4iwIV5kJ27v1nYKApBVH8oyAeAJLpBhTWYYzn/9SsTPtO+LK9V6WjnFTJb9WnO8E0vjL4ojwOzTR0OhViL2IO/yBWdLo8qTizErDYAxC8BHE1rqIRQj+eFo3SjO9hktl3tn6YMincQf/GU5dnCvSlq6/6Y2Nki6JEVuoTDmQlRR/Ugk/G3JaiMt1Qt1tKkVyCFcLOMrBHoR/N8oBIYORAGTJ4Bz4aPz/3oisZuMXH7fBb0bVCrDwr6V0GqO8u0rzyIG15Cg5yy4Ig+gI3YY201fGMDGmBVMYmU9SWebVQoK5GNOdH8qkAGuC2V+S5LZLgWQP8EGQtW+Jn+9Af5OLcPTB097YIXEHF+YwdBrhzrGXcVrCMZdwGO3UiweSe1mYA2/W4AxLZSr31X4TO2psyexjQckQIfJauj9+IpkU8Q2dwUVZJX0iYGbJUQbr4jIK5HgAMB5S/Eu/gUCTAWuq1sebBBTq0zh/mnFB8t3Y/D/FufO8cCjAcMEVvY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(83380400001)(36756003)(82310400003)(478600001)(36860700001)(82740400003)(8676002)(110136005)(7696005)(8936002)(186003)(70206006)(70586007)(356005)(316002)(26005)(81166007)(16526019)(1076003)(86362001)(336012)(6666004)(2616005)(426003)(5660300002)(4326008)(2906002)(54906003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 18:04:30.9225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcda215e-04f9-45de-21fd-08d93a5f2d98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1803
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It was lately understood that the current mechanism available in the
driver to get SMU firmware info works only on internal SMU builds and
there is a separate way to get all the SMU logging counters (addressed
in the next patch). Hence remove all the smu info shown via debugfs as it
is no more useful.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2: split into multiple patches as suggested by Hans
v3: No change
v4: No change

 drivers/platform/x86/amd-pmc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index e3262ed967d9..227efd7ce174 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -52,7 +52,6 @@
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
 
-#define AMD_SMU_FW_VERSION		0x0
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
 
@@ -89,11 +88,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
-	struct amd_pmc_dev *dev = s->private;
-	u32 value;
-
-	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
-	seq_printf(s, "SMU FW Info: %x\n", value);
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
@@ -281,10 +275,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	pci_dev_put(rdev);
 	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
 
-	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
-	if (!dev->smu_base)
-		return -ENOMEM;
-
 	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
 				    AMD_PMC_MAPPING_SIZE);
 	if (!dev->regbase)
-- 
2.25.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A92710B72
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 May 2023 13:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240400AbjEYLuy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 25 May 2023 07:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjEYLux (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 07:50:53 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888CF97
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 04:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnqMmtHgS9nLAFPGG0FI86Id7NM871T4hOuWRRJPCSiN6Cf5KLpTA0JP4Gbx70/OMNh4EOpeKgvTUqzWgRrvKn5nPSvfRFc+IjU57VnIX3Y7kgwIA1aXPJZSlizJD511zJF0M07JKRfqCkwzv9q+/nOFXJOuuwRbIsOLsHVBOoIIJFzshOlYV3rs+AheeNQk2WWhOI+u42cjrpXHaKob9pyR7ZvNLWkhbLUozI3nGK33SkRyfaww+C+/72z3TlrQWrlG2NtUfvvYTp5WFWXKVIR0OPIPJu+7F64sWczhBF7Dp/SbisX74IWsQgO1EIBBxUEnshhIt7ZG0G4xZqXWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl3MViNHh8ZVa0aRlqOeFKQehXuanyJQZkuJgJ/VHeo=;
 b=McniGAUGUnegvrUV4HFn8hvZi9zciwyt6l/m9aWbGVQOi0wktFY33hKrrMk0/LoFdiMQbQZvw9uu2svegeyF2u9cjXFhu9N9VxuGsCUKP9o4ejh/mlc0rHJdylbkfsGmAKkQ0An4qsBIWXzctR8hHTrnZ2G4IUacdOSfTeTG1Zv1fO6aHjkYQOWrhFI10MklJixfmkKLwiYqJABhr5jlpVlN1W7jgj+wIvFFJ+oYvUP/Vm5vavFcbod9+lqUQWa1TSI4Y9JV3ztA3fTVQXe9nRUKlbCQM9vl2mq57LSRUm/qK9hG6ViUiDe2huSbMEjy2naBRHvglJv84lWS/3UU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl3MViNHh8ZVa0aRlqOeFKQehXuanyJQZkuJgJ/VHeo=;
 b=ts3CsginxkDbXlNnJbyIkhJKtE86cp7thyze6VAYHalFpkleswfe32lw4Td2Sr7y8cz6F/TztG35EKXZv73guqalXBbmSsIODZWOdUYwCzMz5HVTx3enbdhonDlVbPZgMAvPU9K1GaXN9Ky56hUXlUnc+cBf88LzPlK18WZkClg=
Received: from SJ0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:a03:331::21)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 11:50:50 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:331:cafe::5c) by SJ0PR03CA0076.outlook.office365.com
 (2603:10b6:a03:331::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 11:50:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 11:50:49 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 06:50:46 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 1/4] platform/x86/amd: pmc: Pass true/false to bool argument
Date:   Thu, 25 May 2023 17:20:01 +0530
Message-ID: <20230525115004.865395-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
References: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aeab7de-6d49-4a03-e65f-08db5d1648e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzRRkH8/KucbfeuX62krR8bLRgNNwhuo9yz0BgRBJBIRsxqj8kM1XIO6pxINn78l6SZ25kD8ytonUvxZuiReGb5Nbs9jzEJKuYGhpxneIicpBJbrz4WPz5KhSWMK7rhW10DNgAjBZqWHup09B+uLc3Bb6lG/CpXKXoyq6vndiWoHFZwJMzl8SgBY7jWjNOgcwLhJpN51/4INhHq97iJDibkahZI4KuipXQHqWlJdWiqPMgjjW09oDvM0G+noZy9kOiXZ3D+JnZvND16EfQpjbOTzxc6AWDXQYJbbRBtlaVWVrJSHV0eN4uCVxfhm1Y3IH83u8c3uinmkRhtb3QcgbpUK9rD2jx25x/f4Xdqpj2eD94k8BMx8Z/591PPkwJlYN1vmxBwRFZRcXAzPKs+jjGdib+7Bjc9t9sxJXcOPlX/uM9GMHo/ognRIPn4bb8zA5+3dtG803qS95N0JpFv+MjNqo2o3eBoTMa3jaKXTpRUT02G9j5E7O5l4Qcmw5wGwLPys+/ad6XpouBV5NcXxBERUoNP8DtSvY6QoaHxRlwZCa7SHCtuNnxRYZ7Ezw8I6JQ0T1WadbWSBiUsoZM6AHAp1KAV7OUNUCeANHE+WL5XmX3p9VdE4HKDMgdxuEmaAYAhFdIAHr9Zp5gmRXDfZj5HM84LSydfbVwSumgeJz7+wbFMV/Gv0vGplxEnJEoEbmhUdMejDQ7Qb6wxJOudLzDE+BlYaKWEi3W8s3eNAdipz/M3PlndHvuQv3nPnTvCcuxIboRGa0uMTEMWzBp4bJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(2616005)(336012)(83380400001)(40460700003)(66574015)(47076005)(2906002)(426003)(36860700001)(16526019)(186003)(36756003)(86362001)(82310400005)(356005)(81166007)(82740400003)(40480700001)(6666004)(316002)(7696005)(41300700001)(8936002)(8676002)(5660300002)(478600001)(54906003)(110136005)(70206006)(70586007)(4326008)(1076003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:50:49.6162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aeab7de-6d49-4a03-e65f-08db5d1648e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Pass true/false to the bool argument of the amd_pmc_send_cmd() function,
instead of 1/0 to match the function signature.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 427905714f79..f28c295b47dd 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -261,7 +261,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 1;
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, true);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 	if (ret) {
@@ -317,15 +317,15 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 
 	/* Get Active devices list from SMU */
 	if (!dev->active_ips)
-		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
+		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, true);
 
 	/* Get dram address */
 	if (!dev->smu_virt_addr) {
 		u32 phys_addr_low, phys_addr_hi;
 		u64 smu_phys_addr;
 
-		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
-		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
+		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, true);
+		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, true);
 		smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 		dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr,
@@ -335,8 +335,8 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 	}
 
 	/* Start the logging */
-	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
-	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
+	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, false);
+	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, false);
 
 	return 0;
 }
@@ -377,7 +377,7 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
 	if (dev->cpu_id == AMD_CPU_ID_PCO)
 		return -ENODEV;
 
-	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
+	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, true);
 	if (rc)
 		return rc;
 
@@ -794,7 +794,7 @@ static void amd_pmc_s2idle_prepare(void)
 	}
 
 	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
+	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, false);
 	if (rc) {
 		dev_err(pdev->dev, "suspend failed: %d\n", rc);
 		return;
@@ -829,7 +829,7 @@ static int amd_pmc_dump_data(struct amd_pmc_dev *pdev)
 	if (pdev->cpu_id == AMD_CPU_ID_PCO)
 		return -ENODEV;
 
-	return amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
+	return amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, false);
 }
 
 static void amd_pmc_s2idle_restore(void)
@@ -839,7 +839,7 @@ static void amd_pmc_s2idle_restore(void)
 	u8 msg;
 
 	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
+	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, false);
 	if (rc)
 		dev_err(pdev->dev, "resume failed: %d\n", rc);
 
@@ -899,13 +899,13 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
 	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, true);
 
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
-- 
2.25.1


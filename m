Return-Path: <platform-driver-x86+bounces-5123-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395F4963AF0
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Aug 2024 08:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73222854E6
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Aug 2024 06:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6763E161914;
	Thu, 29 Aug 2024 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h1VbI18Q"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D115E5CF
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911651; cv=fail; b=ouQWhBYJH9i4+XAiGR56MR9K3420ahUjeaGZDczC1V5STZcU39AbRtzzENzWztxtzLJkr90vM9uCHpHLKse4QjNcg0HANUoJbAlhcUk0HHFs6j5GGahOtlGkrZbv4rUia0af8qD1LKkc+tCeU5jD4J0KQRx4qScjZk3SmNi3WyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911651; c=relaxed/simple;
	bh=CQ/ivc2VNZ2v8QzqbvFO7Zr58YmweyY187x5kkZHbms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsVM5AYnfMuMu8ig6IrPHohMMrrzlj3vTac+6cfM9PQXmyj6Iunc8v8ehxmQvVN0GE+GQLbwrWKYU9WeZ2war6YDb3WcJXjHBr1iOPE0b9heNIcczp0PG96YCe9GT8Yh4fWW2L7M/1FC6co8n4Z0i1BWwYnmdioOSpijkd2E6oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h1VbI18Q; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xxf4X0EW/+oVyrwOE6otpYVXFTPJz1sKTnsEAkM6YkrgvqRsIGo43DHZZfh+PF39ZObbkoO3XjTUbP9BsZmYlDqZhMitbuRvdlqVqrK3aXNAfeiCxuoNwyotPIx4SBBhMTnax8kFpUTsR4kGfvMd8K1ixZi3+FTaqBNyuHWqSlJfvtXH2Ktn/lzgcMNFlD4dJidmUoC347w9+aVik/iATBwt8vivrrXJDSnCVMPflHGH7xRfZIKQe/6BVREneymo7+T3dNyyu6ZFnP9XYNFx73eRbEnQg/s/PNwgleToSmF2bA6JfAMPyHuiGNSDTNkNMF1Z+1qdBv3ZfVr8aHPa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTMSrc5NI7Jyk0B34WjmNrDWAjwNtxQOvYYWz3tc51Q=;
 b=KHaBrPbjeW2v62R77Zi9gVO/BYzVIyIoymj/Wl13sa6j1SnoBJD9x9BbsJalpanUocrRnLtr1kPcJ36yyb1Xg4MLcYU/fVD2l6rPiUmDagMN7iL59ccGpG1+xxR4djCnb57DKxMXKBVEHwB5ViWeWYU5ze112Zw47BFyYaiSt7Kok/BN+YfBq9CHfrH4WAsXV933+QtStVavDBRLjuCsxNz4gx3hrfz3iZ3rNZUABFBTzCXwNGOpacbxB/wStnzX10c2txwTX0fRi3OOCe11OGfF/jnlWOu8Y5rpRY6jhbAF2O8/WdvuQHch0SR5Z62JQMOXzJeDDWWsNZ/ipfdQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTMSrc5NI7Jyk0B34WjmNrDWAjwNtxQOvYYWz3tc51Q=;
 b=h1VbI18QRO2ASTSLgkOvAO3xkZRJhDX+H2n1AeEy4gHv9XEp855jZvSuKVFXQkomB7WQbwBmZE35ych9OG7b6RMFmXKzNBqRMwAhqCXRc7pb3DRtO/IJ8H0tzToTCuKGVpu7Du5dd8ROiS2fdJykfnfoxTbfUyH5EofSIJHdhyA=
Received: from SJ0PR03CA0293.namprd03.prod.outlook.com (2603:10b6:a03:39e::28)
 by DM4PR12MB6544.namprd12.prod.outlook.com (2603:10b6:8:8d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Thu, 29 Aug 2024 06:07:22 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::3c) by SJ0PR03CA0293.outlook.office365.com
 (2603:10b6:a03:39e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:21 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:18 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 10/10] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Thu, 29 Aug 2024 06:06:07 +0000
Message-ID: <20240829060617.1548658-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829060617.1548658-1-suma.hegde@amd.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DM4PR12MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 3542ab98-4a23-4b24-d3be-08dcc7f0d8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LGWF6ZEW+tv94W9EJ6QwHVZLLK3HSeZXGTwXsNygKD0eoEdwNp++bRTXFq4Y?=
 =?us-ascii?Q?ZiWVvAjmLhHI4iK4tk6KszNGHYpFntgOYIyHJD/LFJKq1w7w0BX/9OJAbSu2?=
 =?us-ascii?Q?+f59sEJaZIK2TYUI3YwjIEeG6doIkxIEb2bkCHrREVxVD3Q7BYqHE6yn5k3V?=
 =?us-ascii?Q?4OtKizYcXJSdR7tCHxw/i0xHj7/PE0J4KutBlVNLj4QyI8Yds3cmEl2G7oOJ?=
 =?us-ascii?Q?3VAJb8iDV5eydjN6Lv2cLmloM/rVnGMXTfBWSIzeztCESRmtQoOkpgoH9jmu?=
 =?us-ascii?Q?hrs1v6BN647UDMVSRBxfxVVh9b8B3ZV+1MLn4S2i2RqrjxYo38GylKOKS4TE?=
 =?us-ascii?Q?ZUTcBXme6xF68dUa/nVupKttrAos1zVbcUXd4ealMyfmMXaROCtowM+onBzv?=
 =?us-ascii?Q?jhreo1tJmC/c90xWZPNwNkxGSBCuWaMCiROCvbBwOIz3nuwGaP07S3aIvhkW?=
 =?us-ascii?Q?srpCotnD/dhTuGoPAOxbHTCfXBNt5lOGaQOulm/Krrby42ShdwNxnues4XEN?=
 =?us-ascii?Q?6vX0eW29w6xibeNbep7tfAnu/f/EwZ/V8XN50+2GmaAhlLM9Kp4nkppig3bj?=
 =?us-ascii?Q?cRI98bDKi+1Pl59x0Tj4z31Fopyw2/bNVG2zGNby4QHmFCivLigid3qg4o+6?=
 =?us-ascii?Q?oV1oR72Xh20S3v132u2rkG0S2Qx32No/I0swzBjcWNQ7rN3IDy6zQ6Mze7NL?=
 =?us-ascii?Q?1vX7YxeMEBB/vLOfn4We6Yv/bFANU5+gVhtX1FbznoJdxFTutLNNNkjuji8G?=
 =?us-ascii?Q?53Dqhx8m8wMhRwXDjFr9Lm7wyDtEJrw7QzYRqL4/DtgOVsjR8oBQJANA8LD6?=
 =?us-ascii?Q?E7WJoV7KUsJfj41DT6dNb2h6xwVC1SYKOjDfi5uhotMHzjiNirNpXCeAHeHS?=
 =?us-ascii?Q?3qwFvDqGwCPvxmLUE+v3vi7l6E+YgGgceB86SL8dZ6HEiOQtObk2mimEk57P?=
 =?us-ascii?Q?6j7x3ydVX2apnrTQHMhtqpHludyxK+XyqRbF/NBpzEsqsYs5/pUJdcg3xMhh?=
 =?us-ascii?Q?9iehku+kJvUA17v4gHvopPmIAxruWiWpr3RHqHJdEe906H47Uh59eLpz5taR?=
 =?us-ascii?Q?307MHwWwjX3bdDAGAt5Yeu8l63C/d2WUq+gjGs28h37qZApEAoTnLl+SAvcR?=
 =?us-ascii?Q?AQWyuYT2egoSFZQAn8d5zYtCslPeflnf8J3tnZ69F243NzhLTg3nnfT2pF3i?=
 =?us-ascii?Q?m42GNo3TQO1hxqHIEjx1yATDUrdLGBOvWrSvnXnOG+NRsUM4BTBNDmyzDdCc?=
 =?us-ascii?Q?gYfcmZyrAfBUR/+hdH+V2ajAjbmpnV8AjcCKzyfsS1laTiNv0vYlvVrGhkst?=
 =?us-ascii?Q?A1Q6eJihZEd8Zia0U43RZo+6kHRVMOdUnfPlDtrX4tsbw16amci4CYXvYbf6?=
 =?us-ascii?Q?T7xaY7dvoKgmGLYKe1M4ETMZyCOJ0AgxBvnrZscD0xcjDjZyP4zEtO4WFjHR?=
 =?us-ascii?Q?VRo0uwhwPoDsa95fYrWogg8HTMiITMZ5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:21.7427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3542ab98-4a23-4b24-d3be-08dcc7f0d8a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6544

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

.read() and .is_bin_visibile() have slightly different
implemetations on ACPI and non-ACPI system, so move them
to respective files.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v5:
Assign integer directly to .private.

Changes since v4:
Change ->private from string pointer to u16 pointer.

Changes since v3:
This patch and next patch(9th and 10th patch in v3 series) are merged
and commit description is updated.

Changes since v2:
None

Changes since v1:
1. Change is_visible to is_bin_visible in commit message
1. Add parenthesis around read and is_bin_visible in commit message
2. Change plat_dev to hsmp_pdev, hsmp_device to mdev
3. Remove unnecessary if, else conditions in hsmp_is_sock_attr_visible
4. Change un cached to un-cached

 drivers/platform/x86/amd/hsmp/acpi.c |  74 +++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.c |  77 +---------------
 drivers/platform/x86/amd/hsmp/hsmp.h |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c | 131 +++++++++++++++++++++------
 4 files changed, 165 insertions(+), 125 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 196c5eaa2ac7..239083750e2b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/acpi.h>
@@ -211,6 +212,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sema_init(&sock->hsmp_sem, 1);
 
+	dev_set_drvdata(dev, sock);
+
 	/* Read MP1 base address from CRS method */
 	ret = hsmp_read_acpi_crs(sock);
 	if (ret)
@@ -220,27 +223,42 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-static int hsmp_create_acpi_sysfs_if(struct device *dev)
+static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+				    struct bin_attribute *bin_attr, char *buf,
+				    loff_t off, size_t count)
 {
-	struct attribute_group *attr_grp;
-	u16 sock_ind;
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	struct hsmp_message msg = { 0 };
 	int ret;
 
-	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
-	if (!attr_grp)
-		return -ENOMEM;
+	if (!sock)
+		return -EINVAL;
 
-	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
+	/* Do not support lseek(), reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(sock->dev, "Wrong buffer size\n");
+		return -EINVAL;
+	}
 
-	ret = hsmp_get_uid(dev, &sock_ind);
-	if (ret)
-		return ret;
+	msg.msg_id      = HSMP_GET_METRIC_TABLE;
+	msg.sock_ind    = sock->sock_ind;
 
-	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
+	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
+	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
+}
 
-	return devm_device_add_group(dev, attr_grp);
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
+{
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
 }
 
 static int init_acpi(struct device *dev)
@@ -275,9 +293,36 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+		ret = hsmp_get_tbl_dram_base(sock_ind);
+		if (ret)
+			dev_err(dev, "Failed to init metric table\n");
+	}
+
 	return ret;
 }
 
+static struct bin_attribute  hsmp_metric_tbl_attr = {
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
+	.read = hsmp_metric_tbl_read,
+	.size = sizeof(struct hsmp_metric_table),
+};
+
+static struct bin_attribute *hsmp_attr_list[] = {
+	&hsmp_metric_tbl_attr,
+	NULL
+};
+
+static struct attribute_group hsmp_attr_grp = {
+	.bin_attrs = hsmp_attr_list,
+	.is_bin_visible = hsmp_is_sock_attr_visible,
+};
+
+static const struct attribute_group *hsmp_groups[] = {
+	&hsmp_attr_grp,
+	NULL
+};
+
 static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 	{ACPI_HSMP_DEVICE_HID, 0},
 	{}
@@ -306,10 +351,6 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	if (!hsmp_pdev.is_probed) {
 		ret = hsmp_misc_register(&pdev->dev);
 		if (ret)
@@ -338,6 +379,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.acpi_match_table = amd_hsmp_acpi_ids,
+		.dev_groups = hsmp_groups,
 	},
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8c8e361b1feb..019802fb3cb4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -278,35 +278,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count)
-{
-	struct hsmp_socket *sock = bin_attr->private;
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	if (!sock)
-		return -EINVAL;
-
-	/* Do not support lseek(), reads entire metric table */
-	if (count < bin_attr->size) {
-		dev_err(sock->dev, "Wrong buffer size\n");
-		return -EINVAL;
-	}
-
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
-	msg.sock_ind	= sock->sock_ind;
-
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
-
-	return bin_attr->size;
-}
-
-static int hsmp_get_tbl_dram_base(u16 sock_ind)
+int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
@@ -339,53 +311,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
-{
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-	else
-		return 0;
-}
-
-static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
-{
-	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
-
-	sysfs_bin_attr_init(hattr);
-	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
-	hattr->attr.mode	= 0444;
-	hattr->read		= hsmp_metric_tbl_read;
-	hattr->size		= sizeof(struct hsmp_metric_table);
-	hattr->private		= &hsmp_pdev.sock[sock_ind];
-	hattrs[0]		= hattr;
-
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
-		return hsmp_get_tbl_dram_base(sock_ind);
-	else
-		return 0;
-}
-
-/* One bin sysfs for metrics table */
-#define NUM_HSMP_ATTRS		1
-
-int hsmp_create_attr_list(struct attribute_group *attr_grp,
-			  struct device *dev, u16 sock_ind)
-{
-	struct bin_attribute **hsmp_bin_attrs;
-
-	/* Null terminated list of attributes */
-	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
-				      sizeof(*hsmp_bin_attrs),
-				      GFP_KERNEL);
-	if (!hsmp_bin_attrs)
-		return -ENOMEM;
-
-	attr_grp->bin_attrs = hsmp_bin_attrs;
-
-	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
-}
-
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 9ab50bc74676..c4148fc2530c 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -57,16 +57,10 @@ struct hsmp_plat_device {
 
 extern struct hsmp_plat_device hsmp_pdev;
 
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count);
 int hsmp_cache_proto_ver(u16 sock_ind);
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id);
-int hsmp_create_attr_list(struct attribute_group *attr_grp,
-			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
+int hsmp_get_tbl_dram_base(u16 sock_ind);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index be5bb8fe346c..3b9875c371a1 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/device.h>
@@ -61,36 +62,111 @@ static const struct file_operations hsmp_fops = {
 	.compat_ioctl	= hsmp_ioctl,
 };
 
-static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
+static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+				    struct bin_attribute *bin_attr, char *buf,
+				    loff_t off, size_t count)
 {
-	const struct attribute_group **hsmp_attr_grps;
-	struct attribute_group *attr_grp;
-	u16 i;
-
-	hsmp_attr_grps = devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
-				      sizeof(*hsmp_attr_grps),
-				      GFP_KERNEL);
-	if (!hsmp_attr_grps)
-		return -ENOMEM;
+	struct hsmp_message msg = { 0 };
+	struct hsmp_socket *sock;
+	u16 sock_ind;
+	int ret;
 
-	/* Create a sysfs directory for each socket */
-	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
-					GFP_KERNEL);
-		if (!attr_grp)
-			return -ENOMEM;
+	sock_ind = (u16)(uintptr_t)bin_attr->private;
+	if (sock_ind >= hsmp_pdev.num_sockets)
+		return -EINVAL;
 
-		snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= hsmp_pdev.sock[i].name;
-		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
-		hsmp_attr_grps[i]		= attr_grp;
+	sock = &hsmp_pdev.sock[sock_ind];
+	if (!sock)
+		return -EINVAL;
 
-		hsmp_create_attr_list(attr_grp, dev, i);
+	/* Do not support lseek(), reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(sock->dev, "Wrong buffer size\n");
+		return -EINVAL;
 	}
 
-	return device_add_groups(dev, hsmp_attr_grps);
+	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.sock_ind	= sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
+}
+
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
+{
+	u16 sock_ind;
+
+	sock_ind = (u16)(uintptr_t)battr->private;
+
+	if (id == 0 && sock_ind >= hsmp_pdev.num_sockets)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
+}
+
+/*
+ * AMD supports maximum of 8 sockets in a system.
+ * Static array of 8 + 1(for NULL) elements is created below
+ * to create sysfs groups for sockets.
+ * is_bin_visible function is used to show / hide the necessary groups.
+ */
+#define HSMP_BIN_ATTR(index, _list) \
+static struct bin_attribute attr##index = { \
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444}, \
+	.private = (void *)index, \
+	.read = hsmp_metric_tbl_read, \
+	.size = sizeof(struct hsmp_metric_table), \
+}; \
+static struct bin_attribute _list[] = { \
+	&attr##index, \
+	NULL \
 }
 
+HSMP_BIN_ATTR(0, *sock0_attr_list);
+HSMP_BIN_ATTR(1, *sock1_attr_list);
+HSMP_BIN_ATTR(2, *sock2_attr_list);
+HSMP_BIN_ATTR(3, *sock3_attr_list);
+HSMP_BIN_ATTR(4, *sock4_attr_list);
+HSMP_BIN_ATTR(5, *sock5_attr_list);
+HSMP_BIN_ATTR(6, *sock6_attr_list);
+HSMP_BIN_ATTR(7, *sock7_attr_list);
+
+#define HSMP_BIN_ATTR_GRP(index, _list, _name) \
+static struct attribute_group sock##index##_attr_grp = { \
+	.bin_attrs = _list, \
+	.is_bin_visible = hsmp_is_sock_attr_visible, \
+	.name = #_name, \
+}
+
+HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
+HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
+HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
+HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
+HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
+HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
+HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
+HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
+
+static const struct attribute_group *hsmp_groups[] = {
+	&sock0_attr_grp,
+	&sock1_attr_grp,
+	&sock2_attr_grp,
+	&sock3_attr_grp,
+	&sock4_attr_grp,
+	&sock5_attr_grp,
+	&sock6_attr_grp,
+	&sock7_attr_grp,
+	NULL
+};
+
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
@@ -141,6 +217,12 @@ static int init_platform_device(struct device *dev)
 			dev_err(dev, "Failed to read HSMP protocol version\n");
 			return ret;
 		}
+
+		if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+			ret = hsmp_get_tbl_dram_base(i);
+			if (ret)
+				dev_err(dev, "Failed to init metric table\n");
+		}
 	}
 
 	return 0;
@@ -162,10 +244,6 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	return hsmp_misc_register(&pdev->dev);
 }
 
@@ -179,6 +257,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.25.1



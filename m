Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABD24AFB9F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Feb 2022 19:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240651AbiBISrk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 9 Feb 2022 13:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240671AbiBISr0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Feb 2022 13:47:26 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08on2056.outbound.protection.outlook.com [40.107.102.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2D1C1DC043
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 10:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWrtPKvC9ZzPeE+6A84d1BjXW2WBs24n0UFM9SRLSTwimAZTw0JDRj9stur4GTOESjhN64QHWX/+J12LeF3/Uwn97chuWkhOt/MmKAcKBNAj4hH5yCJhMlSOVM3FpcFQ441Jg9pLJ/LYaBQr+wWwtpPCq014GZh1jsIbehRuwYx0FpGqHMYCQ9JE9YKK7zz0cYG9m4NwqddFgd6QtS+meP0UgwJB59U3LtaGUIMofiPk/F0kPr7S+3qVsymQAUoiSvBiFEkRDNO9bl7AwmCIsQbLr3SYN6zgUKF/+NistJvm3yPbvsfqEjWmdDzz/+pDfyKmkr9zNXQMTMrha/J/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN498DNm8NrBAqUOx+agFqvL2ZW0EZXNYiVTE/sqcD4=;
 b=kX58PVkWAbH8pltGbx/AKfHbXFXsp6wP8EuMLfxlOuk5OASglktuSivyRWAg91FF0Sx6lNajMNy/VHpDQKbWAtpid56Xbh0Fxn08PtFviRTZijNuGpqW85VX12+f5rCJcphRm7DB49fyeQR7fxFqHnUeosRCP7FT8TIayjCwmvqr6Nbz97B8JLtI/THq9Vl/48bhj5nRoGztyZ/Cwo85lAhR2UVyre52lBDPwUTjbtMdf3JCs0EBEkudmf9hpR+BfSEW5wiyfAEmtPC5odDsytiUln9fZyGuYzDEWepl+x21AjYtKJDOwLFrNhsI/cSXdjFYUR35uJWn9u+P4GHxLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN498DNm8NrBAqUOx+agFqvL2ZW0EZXNYiVTE/sqcD4=;
 b=Krj04Yosh24Fq+hdFlJgK5QLL39W+xxocmCO+mcZ4ldSDx8BLTVfQrrf3V5GKNrl0eji1SlnIF4iUF2d1pkzpT5Pl2lRfsihXWNCWF7CajbXKND7EKSxnXsxs6mTbykw1zT/3OuaYtK5Zo9Xe/A66TntvNRO/bf+WB0Z0mmMQk8=
Received: from DM6PR18CA0026.namprd18.prod.outlook.com (2603:10b6:5:15b::39)
 by BY5PR12MB3970.namprd12.prod.outlook.com (2603:10b6:a03:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 18:44:26 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::75) by DM6PR18CA0026.outlook.office365.com
 (2603:10b6:5:15b::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 18:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 18:44:26 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 12:44:22 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>, <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
Date:   Thu, 10 Feb 2022 00:14:05 +0530
Message-ID: <20220209184406.99938-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b46c2138-3b82-4603-dec7-08d9ebfc32a6
X-MS-TrafficTypeDiagnostic: BY5PR12MB3970:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3970FE3AD9C4B27958FE86B1E82E9@BY5PR12MB3970.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p9sZf6i1xCZAXnNEGyYZ2d8PvCP3lKfKp9oD5MlnfgCuwMhcKRTISXUKoszUcihIOVb0550yeFP4F/UQyLvJvTp00l3AtxQ2GI0u2wgme6hbGmk5W/uCfV9MisU9i8U4B3wni/uCuC0YU1H7XIjzv1Ae9hBfkTP4rpHKnf4OllV88mGrDjQTrJPwmP4xvxWSNGv+UCgBuojmvABGtqBV2M9vNLk7KHd3ZYSa9l1Xi3pOL+4085iQE6Grj1c63aVwmozLbgl9Uu8RkSfdSi2YZ1ZUR3NnTx6qfuCrmLZNOdVYvbLs7YJ9r/qa6lbirEQXrbIw9jYWDseuer36+/CSOZOsStYMvatJdBm1hzAVY9TYsvip784VDZddkTbodxEQXNaIGumz9rc8MQSKxhCc31c4GCmf5MH+gHSAoWnoBwBoE46OfzyuyCOZCpywQLuq+wGTsnvlk5To0ORfF8akYchwACXyCo9mw1Xkn8y45T4Jy0sue83OUVwou3T1ncDCTeVkLA+XjEwv987klLP+8E0Hw5oFjctfIRmfwpsMXeWWLnO7VFVnMEH18PpBhgg1RDCoaB5Z1dKMb8Wb/vBad60+I7f3r8rK1GLl9CJe1hoQDHSErL0eSMTmpI8MvvdoT4oeqBTJKhhUc1phWfcYdJI2Ww0/MciFuoFhkev/cLW2Kac7RNLG16tTI+9hppUi4YEClOGMbOYF3OqZd1d49T2w0uSUIOKDrD9qWsEaSe3r5K1cRLpujSlPBESY1vETJy1JDqgU+y9kTVnnwAd914nsk135hVRkPcQR2NzIW1I=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(966005)(70586007)(36756003)(70206006)(4326008)(5660300002)(30864003)(8676002)(8936002)(508600001)(6666004)(316002)(54906003)(6916009)(2906002)(40460700003)(1076003)(26005)(82310400004)(83380400001)(81166007)(2616005)(426003)(7696005)(16526019)(47076005)(336012)(356005)(186003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:44:26.2624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46c2138-3b82-4603-dec7-08d9ebfc32a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3970
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

Recent Fam19h EPYC server line of processors from AMD support system
management functionality via HSMP (Host System Management Port) interface.

The Host System Management Port (HSMP) is an interface to provide
OS-level software with access to system management functions via a
set of mailbox registers.

More details on the interface can be found in chapter
"7 Host System Management Port (HSMP)" of the following PPR
https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip

This patch adds new amd_hsmp module under the drivers/platforms/x86/
which creates miscdevice with an IOCTL interface to the user space.
/dev/hsmp is for running the hsmp mailbox commands.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
Changes since v3:
remove change ids
Changes since v2:
1. Updated MAINTAINERS page
2. Added message description table with num_args, response_sz and type fields.
   This will be useful for user space applications and the driver
   to validate the inputs.
3. removed the model check and added a statement in the documentation.

Changes since v1:
1. Add supported model check
   . This interface is supported only on server line of CPUs.
2. Handle Reserved messages
3. Add brief descriptions of the Messages
4. Add Carlos Bilbao's reviewed-by


 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   9 +
 arch/x86/include/asm/amd_hsmp.h               |  16 +
 arch/x86/include/uapi/asm/amd_hsmp.h          |  94 ++++
 drivers/platform/x86/Kconfig                  |  13 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/amd_hsmp.c               | 417 ++++++++++++++++++
 7 files changed, 552 insertions(+)
 create mode 100644 arch/x86/include/asm/amd_hsmp.h
 create mode 100644 arch/x86/include/uapi/asm/amd_hsmp.h
 create mode 100644 drivers/platform/x86/amd_hsmp.c

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 687efcf245c1..663e316d320c 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -372,6 +372,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:thomas@winischhofer.net>
 0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
                                                                      <mailto:mathieu.desnoyers@efficios.com>
+0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
+                                                                     <mailto:nchatrad@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
 ====  =====  ======================================================= ================================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index f41088418aae..bb2fc501d13f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -989,6 +989,15 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/amd-pmc.*
 
+AMD HSMP DRIVER
+M:	Chatradhi Naveen Krishna <naveenkrishna.chatradhi@amd.com>
+R:	Bilbao, Carlos <carlos.bilbao@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	arch/x86/include/asm/amd_hsmp.h
+F:	arch/x86/include/uapi/asm/amd_hsmp.h
+F:	drivers/platform/x86/amd_hsmp.c
+
 AMD POWERPLAY AND SWSMU
 M:	Evan Quan <evan.quan@amd.com>
 L:	amd-gfx@lists.freedesktop.org
diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
new file mode 100644
index 000000000000..db2846bb3c37
--- /dev/null
+++ b/arch/x86/include/asm/amd_hsmp.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _ASM_X86_AMD_HSMP_H_
+#define _ASM_X86_AMD_HSMP_H_
+
+#include <uapi/asm/amd_hsmp.h>
+
+#if (defined(CONFIG_AMD_HSMP) || defined(CONFIG_AMD_HSMP_MODULE))
+int hsmp_send_message(struct hsmp_message *msg);
+#else
+int hsmp_send_message(struct hsmp_message *msg)
+{
+	return -ENODEV;
+}
+#endif
+#endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
new file mode 100644
index 000000000000..d1cee2c2040c
--- /dev/null
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _UAPI_ASM_X86_AMD_HSMP_H_
+#define _UAPI_ASM_X86_AMD_HSMP_H_
+
+#include <linux/types.h>
+
+#pragma pack(4)
+
+#define HSMP_MAX_MSG_LEN 8
+
+/*
+ * HSMP Messages supported
+ */
+enum hsmp_message_ids {
+	HSMP_TEST = 1,			/* 01h Increments input value by 1 */
+	HSMP_GET_SMU_VER,		/* 02h SMU FW version */
+	HSMP_GET_PROTO_VER,		/* 03h HSMP interface version */
+	HSMP_GET_SOCKET_POWER,		/* 04h average package power consumption */
+	HSMP_SET_SOCKET_POWER_LIMIT,	/* 05h Set the socket power limit */
+	HSMP_GET_SOCKET_POWER_LIMIT,	/* 06h Get current socket power limit */
+	HSMP_GET_SOCKET_POWER_LIMIT_MAX,/* 07h Get maximum socket power value */
+	HSMP_SET_BOOST_LIMIT,		/* 08h Set a core maximum frequency limit */
+	HSMP_SET_BOOST_LIMIT_SOCKET,	/* 09h Set socket maximum frequency level */
+	HSMP_GET_BOOST_LIMIT,		/* 0Ah Get current frequency limit */
+	HSMP_GET_PROC_HOT,		/* 0Bh Get PROCHOT status */
+	HSMP_SET_XGMI_LINK_WIDTH,	/* 0Ch Set max and min width of xGMI Link */
+	HSMP_SET_DF_PSTATE,		/* 0Dh Alter APEnable/Disable messages behavior */
+	HSMP_SET_AUTO_DF_PSTATE,	/* 0Eh Enable DF P-State Performance Boost algorithm */
+	HSMP_GET_FCLK_MCLK,		/* 0Fh Get FCLK and MEMCLK for current socket */
+	HSMP_GET_CCLK_THROTTLE_LIMIT,	/* 10h Get CCLK frequency limit in socket */
+	HSMP_GET_C0_PERCENT,		/* 11h Get average C0 residency in socket */
+	HSMP_SET_NBIO_DPM_LEVEL,	/* 12h Set max/min LCLK DPM Level for a given NBIO */
+					/* 13h Reserved */
+	HSMP_GET_DDR_BANDWIDTH = 0x14,	/* 14h Get theoretical maximum and current DDR Bandwidth */
+	HSMP_GET_TEMP_MONITOR,		/* 15h Get per-DIMM temperature and refresh rates */
+	HSMP_MSG_ID_MAX,
+};
+
+struct hsmp_message {
+	__u32	msg_id;				/* Message ID */
+	__u16	num_args;			/* Number of arguments in message */
+	__u16	response_sz;			/* Number of expected response words */
+	__u32	args[HSMP_MAX_MSG_LEN];		/* Argument(s) */
+	__u32	response[HSMP_MAX_MSG_LEN];	/* Response word(s) */
+	__u16	sock_ind;			/* socket number */
+};
+
+struct hsmp_msg_desc {
+	int num_args;
+	int response_sz;
+	int type;
+};
+
+enum hsmp_msg_type {
+	RSVD = -1,
+	SET  = 0,
+	GET  = 1,
+};
+
+static const struct hsmp_msg_desc msg_desc_table[] = {
+	/* num_args, response_size, type */
+	{0, 0, RSVD},	/* RESERVED */
+	{1, 1, GET},	/* HSMP_TEST */
+	{0, 1, GET},	/* HSMP_GET_SMU_VER */
+	{0, 1, GET},	/* HSMP_GET_PROTO_VER */
+	{0, 1, GET},	/* HSMP_GET_SOCKET_POWER */
+	{1, 0, SET},	/* HSMP_SET_SOCKET_POWER_LIMIT */
+	{0, 1, GET},	/* HSMP_GET_SOCKET_POWER_LIMIT */
+	{0, 1, GET},	/* HSMP_GET_SOCKET_POWER_LIMIT_MAX */
+	{1, 0, SET},	/* HSMP_SET_BOOST_LIMIT */
+	{1, 0, SET},	/* HSMP_SET_BOOST_LIMIT_SOCKET */
+	{1, 1, GET},	/* HSMP_GET_BOOST_LIMIT */
+	{0, 1, GET},	/* HSMP_GET_PROC_HOT */
+	{1, 0, SET},	/* HSMP_SET_XGMI_LINK_WIDTH */
+	{1, 0, SET},	/* HSMP_SET_DF_PSTATE */
+	{0, 0, SET},	/* HSMP_SET_AUTO_DF_PSTATE */
+	{0, 2, GET},	/* HSMP_GET_FCLK_MCLK */
+	{0, 1, GET},	/* HSMP_GET_CCLK_THROTTLE_LIMIT */
+	{0, 1, GET},	/* HSMP_GET_C0_PERCENT */
+	{1, 0, SET},	/* HSMP_SET_NBIO_DPM_LEVEL */
+	{0, 0, RSVD},	/* RESERVED */
+	{0, 1, GET},	/* HSMP_GET_DDR_BANDWIDTH */
+	{0, 1, GET},	/* HSMP_GET_TEMP_MONITOR */
+};
+
+/* Reset to default packing */
+#pragma pack()
+
+/* Define unique ioctl command for hsmp msgs using generic _IOWR */
+#define HSMP_BASE_IOCTL_NR			0xF8
+#define HSMP_IOCTL_CMD				_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
+
+#endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 24deeeb29af2..0906c36ea07b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -210,6 +210,19 @@ config AMD_PMC
 	  If you choose to compile this driver as a module the module will be
 	  called amd-pmc.
 
+config AMD_HSMP
+	tristate "AMD HSMP Driver"
+	depends on AMD_NB && X86_64
+	help
+	  The driver provides a way for user space tools to monitor and manage
+	  system management functionality on EPYC server CPUs from AMD.
+
+	  Host System Management Port (HSMP) interface is a mailbox interface
+	  between the x86 core and the System Management Unit (SMU) firmware.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_hsmp.
+
 config ADV_SWBUTTON
 	tristate "Advantech ACPI Software Button Driver"
 	depends on ACPI && INPUT
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index c12a9b044fd8..b3a93a5053a3 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
 
 # AMD
 obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
+obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
 
 # Advantech
 obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd_hsmp.c
new file mode 100644
index 000000000000..858f194e5a4c
--- /dev/null
+++ b/drivers/platform/x86/amd_hsmp.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2022, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides a device implementation for HSMP interface
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/amd_hsmp.h>
+#include <asm/amd_nb.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/semaphore.h>
+
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"1.0"
+
+/* HSMP Status / Error codes */
+#define HSMP_STATUS_NOT_READY	0x00
+#define HSMP_STATUS_OK		0x01
+#define HSMP_ERR_INVALID_MSG	0xFE
+#define HSMP_ERR_INVALID_INPUT	0xFF
+
+/* Timeout in millsec */
+#define HSMP_MSG_TIMEOUT	100
+#define HSMP_SHORT_SLEEP	1
+
+#define HSMP_WR			true
+#define HSMP_RD			false
+
+/*
+ * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
+ * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
+ * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
+ */
+#define SMN_HSMP_MSG_ID		0x3B10534
+#define SMN_HSMP_MSG_RESP	0x3B10980
+#define SMN_HSMP_MSG_DATA	0x3B109E0
+
+#define HSMP_INDEX_REG		0xc4
+#define HSMP_DATA_REG		0xc8
+
+static struct semaphore *hsmp_sem;
+
+static struct miscdevice hsmp_device;
+
+static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
+			 u32 *value, bool write)
+{
+	int ret;
+
+	ret = pci_write_config_dword(root, HSMP_INDEX_REG, address);
+	if (ret)
+		return ret;
+
+	ret = (write ? pci_write_config_dword(root, HSMP_DATA_REG, *value)
+		     : pci_read_config_dword(root, HSMP_DATA_REG, value));
+
+	return ret;
+}
+
+/*
+ * Send a message to the HSMP port via PCI-e config space registers.
+ *
+ * The caller is expected to zero out any unused arguments.
+ * If a response is expected, the number of response words should be greater than 0.
+ *
+ * Returns 0 for success and populates the requested number of arguments.
+ * Returns a negative error code for failure.
+ */
+static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
+{
+	unsigned long timeout, short_sleep;
+	u32 mbox_status;
+	u32 arg_num;
+	int ret;
+
+	/* Clear the status register */
+	mbox_status = HSMP_STATUS_NOT_READY;
+	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
+	if (ret) {
+		pr_err("Error %d clearing mailbox status register\n", ret);
+		return ret;
+	}
+
+	arg_num = 0;
+	/* Write any message arguments */
+	while (arg_num < msg->num_args) {
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (arg_num << 2),
+				    &msg->args[arg_num], HSMP_WR);
+		if (ret) {
+			pr_err("Error %d writing message argument %d\n", ret, arg_num);
+			return ret;
+		}
+		arg_num++;
+	}
+
+	/* Write the message ID which starts the operation */
+	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
+	if (ret) {
+		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
+		return ret;
+	}
+
+	/*
+	 * Depending on when the trigger write completes relative to the SMU
+	 * firmware 1 ms cycle, the operation may take from tens of us to 1 ms
+	 * to complete. Some operations may take more. Therefore we will try
+	 * a few short duration sleeps and switch to long sleeps if we don't
+	 * succeed quickly.
+	 */
+	short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
+	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
+
+	while (time_before(jiffies, timeout)) {
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
+		if (ret) {
+			pr_err("Error %d reading mailbox status\n", ret);
+			return ret;
+		}
+
+		if (mbox_status != HSMP_STATUS_NOT_READY)
+			break;
+		if (time_before(jiffies, short_sleep))
+			usleep_range(50, 100);
+		else
+			usleep_range(1000, 2000);
+	}
+
+	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
+		return -ETIMEDOUT;
+	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
+		return -ENOMSG;
+	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
+		return -EINVAL;
+	} else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
+		pr_err("Message ID %u unknown failure (status = 0x%X)\n",
+		       msg->msg_id, mbox_status);
+		return -EIO;
+	}
+
+	/* SMU has responded OK. Read response data */
+	arg_num = 0;
+	while (arg_num < msg->response_sz) {
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (arg_num << 2),
+				    &msg->response[arg_num], HSMP_RD);
+		if (ret) {
+			pr_err("Error %d reading response %u for message ID:%u\n",
+			       ret, arg_num, msg->msg_id);
+			break;
+		}
+		arg_num++;
+	}
+
+	return ret;
+}
+
+static int validate_message(struct hsmp_message *msg)
+{
+	/* Message ID within valid range of message IDs */
+	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
+		return -EINVAL;
+
+	/* Reserved message IDs */
+	if (msg_desc_table[msg->msg_id].type == RSVD)
+		return -EINVAL;
+
+	/* Message with number of arguments and response size not matching the HSMP spec */
+	if (msg->num_args != msg_desc_table[msg->msg_id].num_args ||
+	    msg->response_sz != msg_desc_table[msg->msg_id].response_sz)
+		return -EINVAL;
+
+	return 0;
+}
+
+int hsmp_send_message(struct hsmp_message *msg)
+{
+	struct amd_northbridge *nb;
+	int ret;
+
+	if (!msg)
+		return -EINVAL;
+
+	nb = node_to_amd_nb(msg->sock_ind);
+	if (!nb || !nb->root)
+		return -ENODEV;
+
+	if (validate_message(msg))
+		return -EINVAL;
+
+	/*
+	 * The time taken by smu operation to complete is between
+	 * 10us to 1ms. Sometime it may take more time.
+	 * In SMP system timeout of 100 millisecs should
+	 * be enough for the previous thread to finish the operation
+	 */
+	ret = down_timeout(&hsmp_sem[msg->sock_ind],
+			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
+	if (ret < 0)
+		return ret;
+
+	ret = __hsmp_send_message(nb->root, msg);
+
+	up(&hsmp_sem[msg->sock_ind]);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hsmp_send_message);
+
+static int hsmp_test(u16 sock_ind)
+{
+	struct hsmp_message msg = { 0 };
+	struct amd_northbridge *nb;
+	int ret = -ENODEV;
+
+	nb = node_to_amd_nb(sock_ind);
+	if (!nb || !nb->root)
+		return ret;
+
+	/*
+	 * Test the hsmp port by performing TEST command. The test message takes
+	 * one argument and returns the value of that argument + 1.
+	 */
+	msg.sock_ind	= sock_ind;
+	msg.response_sz = 1;
+	msg.num_args	= 1;
+	msg.msg_id	= HSMP_TEST;
+	msg.args[0]	= 0xDEADBEEF;
+
+	ret = __hsmp_send_message(nb->root, &msg);
+	if (ret)
+		return ret;
+
+	if (msg.response[0] != (msg.args[0] + 1)) {
+		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
+		       sock_ind, msg.args[0] + 1, msg.response[0]);
+		return -EBADE;
+	}
+
+	return 0;
+}
+
+static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	int __user *arguser = (int  __user *)arg;
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
+		return -EFAULT;
+
+	if (validate_message(&msg))
+		return -EINVAL;
+
+	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
+	case FMODE_WRITE:
+		/*
+		 * Device is opened in O_WRONLY mode
+		 * Execute only set/configure commands
+		 */
+		if (msg_desc_table[msg.msg_id].type != SET)
+			return -EINVAL;
+		break;
+	case FMODE_READ:
+		/*
+		 * Device is opened in O_RDONLY mode
+		 * Execute only get/monitor commands
+		 */
+		if (msg_desc_table[msg.msg_id].type != GET)
+			return -EINVAL;
+		break;
+	case FMODE_READ | FMODE_WRITE:
+		/*
+		 * Device is opened in O_RDWR mode
+		 * Execute both get/monitor and set/configure commands
+		 */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret =  hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	if (msg_desc_table[msg.msg_id].response_sz > 0) {
+		/* Copy results back to user for get/monitor commands */
+		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
+};
+
+static int hsmp_pltdrv_probe(struct platform_device *pdev)
+{
+	int ret, i;
+
+	hsmp_sem = devm_kzalloc(&pdev->dev,
+				(amd_nb_num() * sizeof(struct semaphore)),
+				GFP_KERNEL);
+	if (!hsmp_sem)
+		return -ENOMEM;
+
+	for (i = 0; i < amd_nb_num(); i++)
+		sema_init(&hsmp_sem[i], 1);
+
+	hsmp_device.name	= "hsmp_cdev";
+	hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+	hsmp_device.fops	= &hsmp_fops;
+	hsmp_device.parent	= &pdev->dev;
+	hsmp_device.nodename	= "hsmp";
+	hsmp_device.mode	= 0644;
+
+	ret = misc_register(&hsmp_device);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int hsmp_pltdrv_remove(struct platform_device *pdev)
+{
+	misc_deregister(&hsmp_device);
+
+	return 0;
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_pltdrv_probe,
+	.remove		= hsmp_pltdrv_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+	},
+};
+
+static struct platform_device *amd_hsmp_platdev;
+
+static int __init hsmp_plt_init(void)
+{
+	int ret = -ENODEV;
+	u16 num_sockets;
+	int i;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
+		pr_err("HSMP is not supported on Family:%x model:%x\n",
+		       boot_cpu_data.x86, boot_cpu_data.x86_model);
+		return ret;
+	}
+
+	/*
+	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
+	 * if we have N SMN/DF interfaces that ideally means N sockets
+	 */
+	num_sockets = amd_nb_num();
+	if (num_sockets == 0)
+		return ret;
+
+	/* Test the hsmp interface on each socket */
+	for (i = 0; i < num_sockets; i++) {
+		ret = hsmp_test(i);
+		if (ret) {
+			pr_err("HSMP is not supported on Fam:%x model:%x\n",
+			       boot_cpu_data.x86, boot_cpu_data.x86_model);
+			pr_err("Or Is HSMP disabled in BIOS ?\n");
+			return -EOPNOTSUPP;
+		}
+	}
+
+	ret = platform_driver_register(&amd_hsmp_driver);
+	if (ret)
+		return ret;
+
+	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
+	if (!amd_hsmp_platdev) {
+		ret = -ENOMEM;
+		goto drv_unregister;
+	}
+
+	ret = platform_device_add(amd_hsmp_platdev);
+	if (ret) {
+		platform_device_put(amd_hsmp_platdev);
+		goto drv_unregister;
+	}
+
+	return 0;
+
+drv_unregister:
+	platform_driver_unregister(&amd_hsmp_driver);
+	return ret;
+}
+
+static void __exit hsmp_plt_exit(void)
+{
+	platform_device_unregister(amd_hsmp_platdev);
+	platform_driver_unregister(&amd_hsmp_driver);
+}
+
+device_initcall(hsmp_plt_init);
+module_exit(hsmp_plt_exit);
+
+MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL v2");
-- 
2.17.1


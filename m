Return-Path: <platform-driver-x86+bounces-4447-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BB938258
	for <lists+platform-driver-x86@lfdr.de>; Sat, 20 Jul 2024 19:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB61C1C20A21
	for <lists+platform-driver-x86@lfdr.de>; Sat, 20 Jul 2024 17:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD361487DC;
	Sat, 20 Jul 2024 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rM26EyV6"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8ED1482FC
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497602; cv=fail; b=MyxJDEufq0Z8i8ckvk+usAinwsa1vqnJWEyuoVCC1G1yP+VDiza8avVR1Bosf+WsRvS7OfUA1IxVPo7i7cwYZ9PGbdoREinbh0okPGMF9H4IE6EUYfl4v9bVAtrwnGMk5YMcdR2JCzrs9rhiRB7xVbLqwMtZFlzUblnYFmJZPVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497602; c=relaxed/simple;
	bh=1yzb33XkZzx1SmLSECJ33NL1GzVlEJZ4FbucUJMc3To=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sO8/60wxtPacmrfWVFmptm5Y10WLJEOPrcnBplCmBfxizzaIboBtQ5ZnqS6BoDByH08PUnJFb1fW0ljA6OlRizaFB7xknQzdZTPpEVV90E5ua8ZLpjzFabRgAmcRd2LroUAP95AMIY4rx1jg1lcljRGWRRIjV9cnCVb0HR3/ZPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rM26EyV6; arc=fail smtp.client-ip=40.107.93.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYF/582xEPDAjbQvAxggygHZlxFv4Qj8zeCCX7MbsYyrqdgSFW+FhVBUphTsBAGHVwUH6+7GtLTswyNkPRteLlzIbwcxCj8DQX/JyBJwkYHnfhViefhDkURYjeIvJeK+/L1jkVYLwcYzpfVXCC8Rr90XMJHnw3myd8+V2M98DOCz3wXvCeZInNr0ZL6cgoJiykg4xDIqHRAZTtxzq6wVQPNZHTRObzfj+ciodRq8+WDCdNiSMalAnowY82DTy84wfIFoWDsPofWH1oKP5ilAE6wjw+oi8KK0VEPg4x1A2Ruc9KISTAHpTtWud6dziTNEGU/qIUCS7ZyXHVuiduCnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+xe9D4t811G/5isRd1qxPewwAPX+axOdXgNQJQn1lk=;
 b=rt3Ud5JLt4ITwwiNpszDZ2UrrCEkFxrgNyIxY4IiPrONyTzwrWc3ZghzzfRs3oRsUe95fCueV9Gmx6UDYUWkLo4293ba1PO3aQRCLb/vR4Dr+UhKvJGOcbAMo3ZiS//Xrzc8di3ZfncUbyI0Wje6HiUx8yJNZl3BYutDvg9q8dgxs/kjP80U1IgULBnjk1OxvaknEhK25E4i7CvXjMjgzrsAKqg/bAhkn97DTHRFOh3Za1Evo306SKpf3wePcGzRsVSoDydyfSlBcE6rPaABiyrJsm/1wdMdoR5ZGcsa53zbEaB3ua+8NlsjiExbvm1OnHmGSCu5cb5yUJDktJWYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+xe9D4t811G/5isRd1qxPewwAPX+axOdXgNQJQn1lk=;
 b=rM26EyV6VBqEOS0pYeLiqWBROpJsWX6DAvNHThZQKaT+Acd2yTChxPTnRTy4cWjBIAmHNwV4wkj/QlbKKIBmISTjlEK+aFWXaBofvGMucWbxlullmDA0a21XxVd2gNcMYgn3/3oKocQfqHS77zb57kZb2R6Ea04c/h1lQe4VULA=
Received: from DM5PR07CA0074.namprd07.prod.outlook.com (2603:10b6:4:ad::39) by
 MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Sat, 20 Jul
 2024 17:46:36 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::8) by DM5PR07CA0074.outlook.office365.com
 (2603:10b6:4:ad::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:36 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:34 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 07/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI and plat drivers
Date: Sat, 20 Jul 2024 17:45:48 +0000
Message-ID: <20240720174552.946255-7-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba1d2e6-487a-49af-7d71-08dca8e3e70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3uWf6rBZyBrXttGgeU4QoeIZWEo10SZXE1GaurRepKMYj91+VqOHi3XRM8K3?=
 =?us-ascii?Q?GqVZUNzWbXMwvhYbvehVPuBKl1DbIV2Bpzmv8s4p2Rxe3nGdAXbT9318TDfA?=
 =?us-ascii?Q?CfeIwj15RnIyIg7ToGEmCRl2WD1pzuupNjzeqouSbzcDklP8jIm6yP9Ilx1z?=
 =?us-ascii?Q?XRlUdfRjnhw1acFiQ2XQgPrnYOxbtq3RSyyjDsirRtus7cdkD/v9whCIJyFU?=
 =?us-ascii?Q?refzSPM6vdH8gJdBdWPohGiOtLzqLkHRC54adnZMo0lbFwyxCdxDQP0s+3/W?=
 =?us-ascii?Q?NKbhxwTHdGKnp7trmgq5TVQFRfZZI9EcCFVnqmgtrIMvzEpjzShPoysiuZnX?=
 =?us-ascii?Q?JMvGGRmZxaBqAayFRHn/OlTJIsHgO+/iVMm7sH980+ZLvkidzoOu4ckdbz9K?=
 =?us-ascii?Q?Rl62zr7FjK+vTe+KQ8WWkmHlr5SiQC220fyFxWKuDprpwny5wOOTRuymGW1S?=
 =?us-ascii?Q?F8mYpCsgCDsI3VwZCKQep5DnH94pyVdEbZqsqvEsIo2EfS6trtlrRGEmVATh?=
 =?us-ascii?Q?xQTE/jvZz0wkO/8xPgCxobodmCiFiRukfyfF/irHryb/zkf3xD0jWcKUk4Mn?=
 =?us-ascii?Q?0YeYIqu7y4T0xWSkVr9WvtKqDKM/hhlX9A4MEfbYWwSLVl/YmxqIkwJ8ewOC?=
 =?us-ascii?Q?zOftppPfaPjAY3kAn3LAuidZXhdyv4BYp03kqILsuUjUQJOtw0E3dHdzolid?=
 =?us-ascii?Q?eS2wyEGXXbJlc+OW1lyCgc0K1klkBMLyzi3kthR9DB53E6EyWTLaMhxggKTz?=
 =?us-ascii?Q?FmerqUU+LTfRICAiXXcKk1ZQNFZXY8uRhJTbXVul/7HGbUU/OmglfVI6dnWF?=
 =?us-ascii?Q?h2fo2aoNfikH3NX0DxZ/E2gP1n4SI5C1YwszIoOJox36ZJrKL+v7N17M1AlA?=
 =?us-ascii?Q?QD5I4/nPkkFq+exJ3f5+VucHrmgEUDIH9x9coojkMdHWKC3XB00AEs0I/jv5?=
 =?us-ascii?Q?lQ933rdwHMYL0HXkE7A0ED6z2h/23NItY5MOb56Y7qBA55KiD+boZWSxa/tA?=
 =?us-ascii?Q?nITGek+IuK0uaqIVngmFsfiWMOQDXnWE8DWnVU5hq9oESgX5KyMGSkygwG5T?=
 =?us-ascii?Q?XVp/h/GUctUAfcbCbt/9kY+ezw/gRWD3U3NIFh2lMW9dsnVVR8yqIBUMRyms?=
 =?us-ascii?Q?DDXJa3fk554qNePxL+H3GKsRnzUjDzNwhGx9JAAz6Ksn/wMS7fA7618TEVTz?=
 =?us-ascii?Q?oXDFHFAivb2UmcBYp+GABP8S4Ht4O9lDLn+Z5nKyUDA8y55P1HKZxpfkpd48?=
 =?us-ascii?Q?G4QOk6Rl4NtRU3Saep+lqeM1unydhDsSmWI1KIf7A8A/bhs1BJBML+qkJPM6?=
 =?us-ascii?Q?4MWdBPkUN6DyxtGXCfpqr1mW1nG3J5JR9yhaltoYuaxpRemJPNUdfkn78oOe?=
 =?us-ascii?Q?dlOaoWtYmxrUnklFp8xCSW31wQF76p7s/3fuoGOmkgcfKiY5QGyi2SeUFa/B?=
 =?us-ascii?Q?JUvYLIZuWxzQPc9owvgSQPgOTz4/lhYM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:36.6097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba1d2e6-487a-49af-7d71-08dca8e3e70a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

Separate the probes for ACPI and platform device drivers.
Provide a Kconfig option to select either the
ACPI or the platform device based driver.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
Following files are modified to add new symbol
 - drivers/platform/x86/amd/hsmp/Kconfig, 
 - drivers/platform/x86/amd/hsmp/Makefile
 - drivers/platform/x86/amd/Makefile
AMD_HSMP is used as common symbol and new AMD_HSMP_PLAT symbol is added

Changes since v1:
Rename "plat_dev" to "hsmp_pdev"

 arch/x86/include/asm/amd_hsmp.h        |   2 +-
 drivers/platform/x86/amd/Makefile      |   2 +-
 drivers/platform/x86/amd/hsmp/Kconfig  |  33 ++++++-
 drivers/platform/x86/amd/hsmp/Makefile |   6 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 119 ++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
 drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
 8 files changed, 188 insertions(+), 129 deletions(-)

diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
index 03c2ce3edaf5..ada14e55f9f4 100644
--- a/arch/x86/include/asm/amd_hsmp.h
+++ b/arch/x86/include/asm/amd_hsmp.h
@@ -5,7 +5,7 @@
 
 #include <uapi/asm/amd_hsmp.h>
 
-#if IS_ENABLED(CONFIG_AMD_HSMP)
+#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
 int hsmp_send_message(struct hsmp_message *msg);
 #else
 static inline int hsmp_send_message(struct hsmp_message *msg)
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index 96ec24c8701b..f0b2fe81c685 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -5,6 +5,6 @@
 #
 
 obj-$(CONFIG_AMD_PMC)		+= pmc/
-obj-y				+= hsmp/
+obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
index b55d4ed9bceb..23fb98066225 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -4,14 +4,39 @@
 #
 
 config AMD_HSMP
-	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64 && ACPI
+	tristate "AMD Host System Management Port driver"
+	depends on AMD_NB
 	help
+	  Host System Management Port (HSMP) interface is a mailbox interface
+	  between the x86 core and the System Management Unit (SMU) firmware.
 	  The driver provides a way for user space tools to monitor and manage
 	  system management functionality on EPYC server CPUs from AMD.
 
-	  Host System Management Port (HSMP) interface is a mailbox interface
-	  between the x86 core and the System Management Unit (SMU) firmware.
+menu "AMD HSMP Probe"
+	depends on AMD_HSMP
+
+config AMD_HSMP_ACPI
+	tristate "ACPI based probe"
+	depends on ACPI
+	help
+	  This driver supports ACPI based probing.
+
+	  You may enable this, if your platform bios provides an ACPI object
+	  as described in the documentation.
 
 	  If you choose to compile this driver as a module the module will be
 	  called amd_hsmp.
+
+config AMD_HSMP_PLAT
+	tristate "Platform device based probe"
+	depends on AMD_HSMP_ACPI=n
+	help
+	  This driver supports platform device based probing.
+
+	  You may enable this, if your platform bios does not provide
+	  HSMP ACPI object.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_hsmp.
+
+endmenu
diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index 0cc92865c0a2..18d9a0d1e8c5 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -4,5 +4,7 @@
 # AMD HSMP Driver
 #
 
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o plat.o acpi.o
+obj-$(CONFIG_AMD_HSMP)			+= amd_hsmp.o
+amd_hsmp-objs				:= hsmp.o
+amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)	+= plat.o
+amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)	+= acpi.o
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 46cb86d5d550..86100943aadc 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -11,29 +11,43 @@
 
 #include "hsmp.h"
 
+#include <asm/amd_nb.h>
+
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
+#include <linux/platform_device.h>
 #include <linux/uuid.h>
 
 #include <uapi/asm-generic/errno-base.h>
 
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"2.3"
+#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
+
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
-void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			u32 *value, bool write)
+static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			      u32 *value, bool write)
 {
 	if (write)
 		iowrite32(*value, sock->virt_base_addr + offset);
 	else
 		*value = ioread32(sock->virt_base_addr + offset);
+	return 0;
 }
 
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
+};
+
 /* This is the UUID used for HSMP */
 static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
 						0xa6, 0x9f, 0x4e, 0xa2,
@@ -194,9 +208,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	int ret;
 
-	sock->sock_ind			= sock_ind;
-	sock->dev			= dev;
-	hsmp_pdev.is_acpi_device	= true;
+	sock->sock_ind		= sock_ind;
+	sock->dev		= dev;
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 
 	sema_init(&sock->hsmp_sem, 1);
 
@@ -209,7 +223,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-int hsmp_create_acpi_sysfs_if(struct device *dev)
+static int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
 	struct attribute_group *attr_grp;
 	u16 sock_ind;
@@ -232,7 +246,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-int init_acpi(struct device *dev)
+static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
@@ -266,3 +280,94 @@ int init_acpi(struct device *dev)
 
 	return ret;
 }
+
+static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
+	{ACPI_HSMP_DEVICE_HID, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
+
+static bool check_acpi_support(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
+		return true;
+
+	return false;
+}
+
+static int hsmp_acpi_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.num_sockets = amd_nb_num();
+		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+			return -ENODEV;
+
+		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+					      sizeof(*hsmp_pdev.sock),
+					      GFP_KERNEL);
+		if (!hsmp_pdev.sock)
+			return -ENOMEM;
+	}
+
+	if (!check_acpi_support(&pdev->dev)) {
+		dev_err(&pdev->dev, "Not ACPI device?\n");
+		return -ENODEV;
+	}
+
+	ret = init_acpi(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		return ret;
+	}
+
+	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
+		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
+		hsmp_pdev.mdev.fops	= &hsmp_fops;
+		hsmp_pdev.mdev.parent	= &pdev->dev;
+		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
+		hsmp_pdev.mdev.mode	= 0644;
+
+		ret = misc_register(&hsmp_pdev.mdev);
+		if (ret)
+			return ret;
+		hsmp_pdev.is_probed = true;
+	}
+
+	return 0;
+}
+
+static void hsmp_acpi_remove(struct platform_device *pdev)
+{
+	/*
+	 * We register only one misc_device even on multi-socket system.
+	 * So, deregister should happen only once.
+	 */
+	if (hsmp_pdev.is_probed) {
+		misc_deregister(&hsmp_pdev.mdev);
+		hsmp_pdev.is_probed = false;
+	}
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_acpi_probe,
+	.remove_new	= hsmp_acpi_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
+	},
+};
+
+module_platform_driver(amd_hsmp_driver);
+
+MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 14edaace4379..759ec1d4d60d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -31,17 +31,6 @@
 
 struct hsmp_plat_device hsmp_pdev;
 
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
-			 u32 *value, bool write)
-{
-	if (hsmp_pdev.is_acpi_device)
-		amd_hsmp_acpi_rdwr(sock, offset, value, write);
-	else
-		return amd_hsmp_pci_rdwr(sock, offset, value, write);
-
-	return 0;
-}
-
 /*
  * Send a message to the HSMP port via PCI-e config space registers
  * or by writing to MMIO space.
@@ -64,7 +53,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d clearing mailbox status register\n", ret);
 		return ret;
@@ -73,8 +62,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	index = 0;
 	/* Write any message arguments */
 	while (index < msg->num_args) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_WR);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+					  &msg->args[index], HSMP_WR);
 		if (ret) {
 			pr_err("Error %d writing message argument %d\n", ret, index);
 			return ret;
@@ -83,7 +72,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
@@ -100,7 +89,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
 	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading mailbox status\n", ret);
 			return ret;
@@ -135,8 +124,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	 */
 	index = 0;
 	while (index < msg->response_sz) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+					  &msg->args[index], HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading response %u for message ID:%u\n",
 			       ret, index, msg->msg_id);
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index a77887d298b6..5d4fc7735a87 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -41,6 +41,7 @@ struct hsmp_socket {
 	struct pci_dev *root;
 	struct device *dev;
 	u16 sock_ind;
+	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
 struct hsmp_plat_device {
@@ -48,19 +49,14 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_acpi_device;
 	bool is_probed;
 };
 
 extern struct hsmp_plat_device hsmp_pdev;
 
-int init_acpi(struct device *dev);
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
 			     loff_t off, size_t count);
-int hsmp_create_acpi_sysfs_if(struct device *dev);
-int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-		      u32 *value, bool write);
 int hsmp_cache_proto_ver(u16 sock_ind);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
@@ -68,6 +64,4 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 int hsmp_create_attr_list(struct attribute_group *attr_grp,
 			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
-void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			u32 *value, bool write);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index c297540bb64c..3bce2c570f2b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -13,15 +13,13 @@
 
 #include <asm/amd_nb.h>
 
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
+#define DRIVER_VERSION		"2.3"
 
 /*
  * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
@@ -37,8 +35,8 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
-int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-		      u32 *value, bool write)
+static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+			     u32 *value, bool write)
 {
 	int ret;
 
@@ -113,6 +111,7 @@ static int init_platform_device(struct device *dev)
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
 
 		/*
 		 * This is a transitional change from non-ACPI to ACPI, only
@@ -146,89 +145,39 @@ static int init_platform_device(struct device *dev)
 	return 0;
 }
 
-static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
-	{ACPI_HSMP_DEVICE_HID, 0},
-	{}
-};
-MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
-
-static bool check_acpi_support(struct device *dev)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-
-	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
-		return true;
-
-	return false;
-}
-
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	/*
-	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
-	 * each socket, so the per socket probing, but the memory allocated for
-	 * sockets should be contiguous to access it as an array,
-	 * Hence allocate memory for all the sockets at once instead of allocating
-	 * on each probe.
-	 */
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
-					      sizeof(*hsmp_pdev.sock),
-					      GFP_KERNEL);
-		if (!hsmp_pdev.sock)
-			return -ENOMEM;
-	}
+	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+				      sizeof(*hsmp_pdev.sock),
+				      GFP_KERNEL);
+	if (!hsmp_pdev.sock)
+		return -ENOMEM;
 
-	if (check_acpi_support(&pdev->dev)) {
-		ret = init_acpi(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-			return ret;
-		}
-		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-		if (ret)
-			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-	} else {
-		ret = init_platform_device(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-			return ret;
-		}
-		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-		if (ret)
-			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+	ret = init_platform_device(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+		return ret;
 	}
 
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
-		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
-		hsmp_pdev.mdev.fops	= &hsmp_fops;
-		hsmp_pdev.mdev.parent	= &pdev->dev;
-		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
-		hsmp_pdev.mdev.mode	= 0644;
-
-		ret = misc_register(&hsmp_pdev.mdev);
-		if (ret)
-			return ret;
+	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 
-		hsmp_pdev.is_probed = true;
-	}
+	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
+	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
+	hsmp_pdev.mdev.fops	= &hsmp_fops;
+	hsmp_pdev.mdev.parent	= &pdev->dev;
+	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
+	hsmp_pdev.mdev.mode	= 0644;
 
-	return 0;
+	return misc_register(&hsmp_pdev.mdev);
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
-	/*
-	 * We register only one misc_device even on multi socket system.
-	 * So, deregister should happen only once.
-	 */
-	if (hsmp_pdev.is_probed) {
-		misc_deregister(&hsmp_pdev.mdev);
-		hsmp_pdev.is_probed = false;
-	}
+	misc_deregister(&hsmp_pdev.mdev);
 }
 
 static struct platform_driver amd_hsmp_driver = {
@@ -236,7 +185,6 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.acpi_match_table = amd_hsmp_acpi_ids,
 	},
 };
 
@@ -295,6 +243,12 @@ static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
 
+	if (!legacy_hsmp_support()) {
+		pr_info("HSMP is not supported on Family:%x model:%x\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+		return ret;
+	}
+
 	/*
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
@@ -307,19 +261,9 @@ static int __init hsmp_plt_init(void)
 	if (ret)
 		return ret;
 
-	if (!hsmp_pdev.is_acpi_device) {
-		if (legacy_hsmp_support()) {
-			/* Not ACPI device, but supports HSMP, register a plat_dev */
-			ret = hsmp_plat_dev_register();
-		} else {
-			/* Not ACPI, Does not support HSMP */
-			pr_info("HSMP is not supported on Family:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			ret = -ENODEV;
-		}
-		if (ret)
-			platform_driver_unregister(&amd_hsmp_driver);
-	}
+	ret = hsmp_plat_dev_register();
+	if (ret)
+		platform_driver_unregister(&amd_hsmp_driver);
 
 	return ret;
 }
-- 
2.25.1



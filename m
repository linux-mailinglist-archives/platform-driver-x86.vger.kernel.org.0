Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7200584519
	for <lists+platform-driver-x86@lfdr.de>; Thu, 28 Jul 2022 19:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbiG1RnF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 28 Jul 2022 13:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbiG1RnD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:43:03 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2050.outbound.protection.outlook.com [40.107.96.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2E6747AA
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6NZeQ2ji5zPaxXGbDXFDMkKKOIXHGBIORrDF9/xRTgPGbZjTOw+7+qANskHLX2gUAkkUTjpu24FJVCadBHnQl9qCCxU+DHcOPHHZLrrLfV4xrBK35vvYz+yMR0PbhXtzWr2SlRgmXehnVHGyuahW+DoY03xFruew3mNGeASyjWWdf+MopHEQE/GVVGj0ENhfS9ukupDW9Dtx/bgzA7vaAnQ6vw1KAHNm6EPuBsaEcZz75Zd+LYgtA8PiB2vblZTxNcMDGb8/076vqRp2tJ+W+WTNBp/GEjtBG9iVNW/fQq+ujXksn945sUeVTwgHBc0DWT5RBm2pt5hDtO3UF+WRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GECUlqBja9sIlbZtgOcckdcdO7XXEbdw8DtlpFRcf3w=;
 b=UPxNo54/AfdvpEZ57m3bvPC9T4m3F0tzlmXzOBm7aB8FgOvhGk0ajK1eAEL+2IR0+vhHgJHkXLKarBwtfxNqwNUmYosw5mirY+nSx7RU7IFdqVg0EhI5U1hb74Kwg0InYFgBYHIuMCWbKPIB7VgstSmG4WVU5XhxA3dv0HjfkFyu57t13PUZuQ4SAW9uJsLoKS9bNnIvrel8GZPGIzczH+JyIJM7GLFMBelcbsq6RDgh50Z1Yjx9JM0YIMKViZKq6HEUCqnbIwThcl+dm18t7vpOaRpbyjwzVjJgzmKiKdsqoRhBQ4I+q9VIFHSbjneVGCWY97VXSerwUIQQrtzr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GECUlqBja9sIlbZtgOcckdcdO7XXEbdw8DtlpFRcf3w=;
 b=ZCVTKbPP4OSh66l8gPUrWTgVAgff2+u6YnhJdrR3BwTcqo5YCzISI0NjuqOmee079F+INO/qhTUUswbeZlhhXFe/uwmFOQUqwqN/7x6QPNs4puSKUvjTORZSklHcE4qkEJg29Wxou+cLtfUiGBOxo8qClxJYRl7+3QsghzD34vc=
Received: from MW4PR04CA0253.namprd04.prod.outlook.com (2603:10b6:303:88::18)
 by SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Thu, 28 Jul
 2022 17:42:57 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::63) by MW4PR04CA0253.outlook.office365.com
 (2603:10b6:303:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:54 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 08/11] platform/x86/amd/pmf: Add support for Auto mode feature
Date:   Thu, 28 Jul 2022 23:12:05 +0530
Message-ID: <20220728174208.2081453-9-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d90b8ff-2894-4588-5207-08da70c09b84
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53E2OptMsfqEDsH5Zog1O98+ePOy5e+1l+3eqAwZNRYa6vvZUYaHLmTIzX2M1WN0AaX9xZyBBRi4/t8NcXRwI8HPVi5FJ9ToEgHWmUwMFSpaSK1uyTuilz9HxpgAMmb2ixjoSqo2yKwi2ZQ9SyVDt75SRQ0f/7BqulFw9K1wc3W8LtexZYv6gr3LLJf8DhWY7c6MFDa0/YdbANXy4VVsumMgGOtqz443PXfGtIA8Ib9rcGnLlX8VMN98IMFSLCH/ONqMjqHK9abo7p1kAyONlaht1sfrBr9Mzqsv7V+jUgxWoDC2YdIwffKnMIyVVmW4Sb/ei/kRy0Y7u/XgceUe74NOwpzIWN04aHV5BkpTpGZ8QIeTamV2QRLvdxfTBoVIyCK41RT3ZPbE66+UmXM2jjsQ6UXkpGrsRI8WtO4FS/arc/9iBNFESEAudJ64cprvmcYey1HzhAsjxnaBhVfw6b5AryuqTAsgjXMUV0FNd/3maLrV+VHYiWznHpe+Ue16sQsHbbg5MzFpyqf7c4WfWembXCASqWFkVC0mlVGmwUSTE9rRXAEspFWxoyqqEzbumvALGhnIHHBCk3G/ArX4quqlAh4YVlnrbH3DkMSymImigR+nsAK3mBcI8eLlREUWyGJ6/oBJajix1Hp8Cjjl9SnbqCqxMMxIvjUyTEiHuDYv2szuf3vDXgVz8Bnkkq0ixjw6DVyWWfooSgezcgWe4NL0X1H4usqdYgT3DvLOeErlGrcAkoEBuUt3ND4b3sdzXNjCEpvzFJbHU4KbABl6nYg3zdYccI0RcaZmabEs+z2wV5jVCXYs3AYODjqk9hqmSExQ1Sjgm2Fv1HJdPc0B4w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(40470700004)(36840700001)(46966006)(478600001)(86362001)(30864003)(83380400001)(6666004)(82310400005)(2616005)(7696005)(4326008)(5660300002)(8936002)(1076003)(16526019)(70586007)(336012)(8676002)(186003)(47076005)(70206006)(426003)(36756003)(316002)(356005)(82740400003)(26005)(81166007)(110136005)(54906003)(41300700001)(36860700001)(2906002)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:56.9643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d90b8ff-2894-4588-5207-08da70c09b84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This feature has 3 modes quiet, balanced, performance

The objective of this feature is to track the moving average of system
power over the time period specified and switch to the subsequent mode.

In order to do this, PMF driver will get the moving average of APU power
from PMFW and power threshold, time constants, system config parameters
from OEM inputs.

System power as read by PMF driver from PMFW is the filtered value over
the sampling window. Every sampling window, moving average of system power
is computed. At the end of the monitoring window, the moving average is
compared against the threshold for mode switch for decision making.

With AMD managing the system config limits, any mode switch within
auto-mode will result in limits of fPPT/sPPT/STAPM or STT being scaled
down.

When "auto mode" is enabled, the static slider control remains out of
the PMF driver, so the platform_profile registration would not
happen in PMF driver.

The transition to auto-mode only happens when the APMF fn5 is enabled
in BIOS, platform_profile set to "balanced" and a AMT
(Auto Mode transition) is received.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile    |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c      |   7 +
 drivers/platform/x86/amd/pmf/auto-mode.c | 317 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      |   9 +
 drivers/platform/x86/amd/pmf/pmf.h       | 115 ++++++++
 5 files changed, 450 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 557521a80427..ef2b08c9174d 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -5,4 +5,5 @@
 #
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
-amd-pmf-objs := core.o acpi.o sps.o
+amd-pmf-objs := core.o acpi.o sps.o \
+		auto-mode.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1814d48f8e44..724150ec58fb 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -99,6 +99,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
 	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
+	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
 	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
 }
 
@@ -160,6 +161,12 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
 	return err;
 }
 
+int apmf_get_auto_mode_def(struct apmf_if *apmf_if, struct apmf_auto_mode *data)
+{
+	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_AUTO_MODE,
+					 data, sizeof(*data));
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
 {
 	struct apmf_verify_interface output;
diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
new file mode 100644
index 000000000000..954fde25e71e
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/list.h>
+#include <linux/workqueue.h>
+#include "pmf.h"
+
+#define AVG_SAMPLE_SIZE 3
+
+struct power_history {
+	int socket_power;
+	struct list_head list;
+	int avg;
+	int total;
+};
+
+struct list_pdata {
+	int total;
+	int avg;
+};
+
+static struct power_history power_list;
+static struct list_pdata pdata;
+
+static struct auto_mode_mode_config config_store;
+static const char *state_as_str(unsigned int state);
+
+static void amd_pmf_handle_automode(struct amd_pmf_dev *dev, bool op, int idx,
+				    struct auto_mode_mode_config *table)
+{
+	if (op == SLIDER_OP_SET) {
+		struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
+
+		amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
+		amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+				 pwr_ctrl->stt_skin_temp[STT_TEMP_APU], NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+				 pwr_ctrl->stt_skin_temp[STT_TEMP_HS2], NULL);
+	} else if (op == SLIDER_OP_GET) {
+		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.spl);
+		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.fppt);
+		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.sppt);
+		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.sppt_apu_only);
+		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.stt_min);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_APU]);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_HS2]);
+	}
+
+	if (dev->apmf_if->func.fan_table_idx)
+		apmf_update_fan_idx(dev->apmf_if, config_store.mode_set[idx].fan_control.manual,
+				    config_store.mode_set[idx].fan_control.fan_id);
+}
+
+static int amd_pmf_get_moving_avg(int socket_power)
+{
+	struct power_history *tmp;
+	struct list_head *pos, *q;
+	static int count;
+
+	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
+	tmp->socket_power = socket_power;
+	list_add_tail(&tmp->list, &power_list.list);
+
+	list_for_each_safe(pos, q, &power_list.list) {
+		if (count >= AVG_SAMPLE_SIZE) {
+			tmp = list_first_entry(pos, struct power_history, list);
+			list_del_init(pos);
+			goto next;
+		}
+	}
+
+next:
+	pdata.total = 0;
+	pdata.avg = 0;
+
+	list_for_each(pos, &power_list.list) {
+		tmp = list_entry(pos, struct power_history, list);
+		pdata.total += tmp->socket_power;
+		pdata.avg = pdata.total / AVG_SAMPLE_SIZE;
+	}
+
+	count++;
+	if (count >= AVG_SAMPLE_SIZE)
+		return pdata.avg;
+
+	return 0;
+}
+
+void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
+{
+	int avg_power = 0;
+	bool update = false;
+	int i, j;
+
+	/* Get the average moving average computed by auto mode algorithm */
+	avg_power = amd_pmf_get_moving_avg(socket_power);
+
+	for (i = 0; i < AUTO_TRANSITION_MAX; i++) {
+		if ((config_store.transition[i].shifting_up && avg_power >=
+		     config_store.transition[i].power_threshold) ||
+		    (!config_store.transition[i].shifting_up && avg_power <=
+		     config_store.transition[i].power_threshold)) {
+			if (config_store.transition[i].timer <
+			    config_store.transition[i].time_constant)
+				config_store.transition[i].timer += time_elapsed_ms;
+		} else {
+			config_store.transition[i].timer = 0;
+		}
+
+		if (config_store.transition[i].timer >=
+		    config_store.transition[i].time_constant &&
+		    !config_store.transition[i].applied) {
+			config_store.transition[i].applied = true;
+			update = true;
+		} else if (config_store.transition[i].timer <=
+			   config_store.transition[i].time_constant &&
+			   config_store.transition[i].applied) {
+			config_store.transition[i].applied = false;
+			update = true;
+		}
+	}
+
+	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
+		state_as_str(config_store.current_mode));
+
+	if (update) {
+		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
+			/* Apply the mode with highest priority indentified */
+			if (config_store.transition[j].applied) {
+				if (config_store.current_mode !=
+				    config_store.transition[j].target_mode) {
+					config_store.current_mode =
+							config_store.transition[j].target_mode;
+					dev_dbg(dev->dev, "[AUTO_MODE] moving to mode:%s\n",
+						state_as_str(config_store.current_mode));
+					amd_pmf_handle_automode(dev, SLIDER_OP_SET,
+								config_store.current_mode, NULL);
+				}
+				break;
+			}
+		}
+	}
+}
+
+static void amd_pmf_get_power_threshold(void)
+{
+	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
+				config_store.mode_set[AUTO_BALANCE].power_floor -
+				config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta;
+
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold =
+				config_store.mode_set[AUTO_BALANCE].power_floor -
+				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta;
+
+	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_threshold =
+			config_store.mode_set[AUTO_QUIET].power_floor -
+			config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta;
+
+	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
+		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
+}
+
+static const char *state_as_str(unsigned int state)
+{
+	switch (state) {
+	case AUTO_QUIET:
+		return "QUIET";
+	case AUTO_BALANCE:
+		return "BALANCED";
+	case AUTO_PERFORMANCE_ON_LAP:
+		return "ON_LAP";
+	case AUTO_PERFORMANCE:
+		return "PERFORMANCE";
+	default:
+		return "Unknown Auto Mode State";
+	}
+}
+
+void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
+{
+	struct apmf_auto_mode output;
+	struct power_table_control *pwr_ctrl;
+	int i;
+
+	if (dev->apmf_if->func.auto_mode_def) {
+		apmf_get_auto_mode_def(dev->apmf_if, &output);
+		/* time constant */
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant =
+									output.balanced_to_quiet;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant =
+									output.balanced_to_perf;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant =
+									output.quiet_to_balanced;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant =
+									output.perf_to_balanced;
+
+		/* power floor */
+		config_store.mode_set[AUTO_QUIET].power_floor = output.pfloor_quiet;
+		config_store.mode_set[AUTO_BALANCE].power_floor = output.pfloor_balanced;
+		config_store.mode_set[AUTO_PERFORMANCE].power_floor = output.pfloor_perf;
+		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_floor = output.pfloor_perf;
+
+		/* Power delta for mode change */
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta =
+									output.pd_balanced_to_quiet;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta =
+									output.pd_balanced_to_perf;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta =
+									output.pd_quiet_to_balanced;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta =
+									output.pd_perf_to_balanced;
+
+		/* Power threshold */
+		amd_pmf_get_power_threshold();
+
+		/* skin temperature limits */
+		pwr_ctrl = &config_store.mode_set[AUTO_QUIET].power_control;
+		pwr_ctrl->spl = output.spl_quiet;
+		pwr_ctrl->sppt = output.sppt_quiet;
+		pwr_ctrl->fppt = output.fppt_quiet;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_quiet;
+		pwr_ctrl->stt_min = output.stt_min_limit_quiet;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_quiet;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_quiet;
+
+		pwr_ctrl = &config_store.mode_set[AUTO_BALANCE].power_control;
+		pwr_ctrl->spl = output.spl_balanced;
+		pwr_ctrl->sppt = output.sppt_balanced;
+		pwr_ctrl->fppt = output.fppt_balanced;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_balanced;
+		pwr_ctrl->stt_min = output.stt_min_limit_balanced;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_balanced;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_balanced;
+
+		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE].power_control;
+		pwr_ctrl->spl = output.spl_perf;
+		pwr_ctrl->sppt = output.sppt_perf;
+		pwr_ctrl->fppt = output.fppt_perf;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf;
+		pwr_ctrl->stt_min = output.stt_min_limit_perf;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf;
+
+		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_control;
+		pwr_ctrl->spl = output.spl_perf_on_lap;
+		pwr_ctrl->sppt = output.sppt_perf_on_lap;
+		pwr_ctrl->fppt = output.fppt_perf_on_lap;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf_on_lap;
+		pwr_ctrl->stt_min = output.stt_min_limit_perf_on_lap;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf_on_lap;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf_on_lap;
+
+		/* Fan ID */
+		config_store.mode_set[AUTO_QUIET].fan_control.fan_id = output.fan_id_quiet;
+		config_store.mode_set[AUTO_BALANCE].fan_control.fan_id = output.fan_id_balanced;
+		config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id = output.fan_id_perf;
+		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].fan_control.fan_id =
+										output.fan_id_perf;
+
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].target_mode = AUTO_QUIET;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
+									AUTO_PERFORMANCE;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].target_mode =
+										AUTO_BALANCE;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].target_mode =
+										AUTO_BALANCE;
+
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].shifting_up = false;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].shifting_up = true;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].shifting_up = true;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].shifting_up =
+											false;
+
+		for (i = 0 ; i < AUTO_MODE_MAX ; i++) {
+			if (config_store.mode_set[i].fan_control.fan_id == FAN_INDEX_AUTO)
+				config_store.mode_set[i].fan_control.manual = false;
+			else
+				config_store.mode_set[i].fan_control.manual = true;
+		}
+	}
+}
+
+void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
+{
+	cancel_delayed_work_sync(&dev->work_buffer);
+}
+
+void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
+{
+	INIT_LIST_HEAD(&power_list.list);
+
+	amd_pmf_init_metrics_table(dev);
+	amd_pmf_load_defaults_auto_mode(dev);
+
+	/* update the thermal for Automode */
+	amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
+}
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ede4eefc33a4..ef71f8326248 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -244,12 +244,21 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		amd_pmf_init_sps(dev);
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
+
+	/* Enable Auto Mode */
+	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
+		amd_pmf_init_auto_mode(dev);
+		dev_dbg(dev->dev, "Auto Mode Init done\n");
+	}
 }
 
 static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 {
 	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
 		amd_pmf_deinit_sps(dev);
+
+	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
+		amd_pmf_deinit_auto_mode(dev);
 }
 
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 49d3232ee2e0..4618ddc5a662 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -18,6 +18,7 @@
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
+#define APMF_FUNC_AUTO_MODE					5
 #define APMF_FUNC_SET_FAN_IDX				7
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
@@ -49,6 +50,7 @@
 struct apmf_if_functions {
 	bool system_params;
 	bool sbios_heartbeat;
+	bool auto_mode_def;
 	bool fan_table_idx;
 	bool static_slider_granular;
 };
@@ -187,6 +189,111 @@ struct fan_table_control {
 	unsigned long fan_id;
 };
 
+struct power_table_control {
+	u32 spl;
+	u32 sppt;
+	u32 fppt;
+	u32 sppt_apu_only;
+	u32 stt_min;
+	u32 stt_skin_temp[STT_TEMP_COUNT];
+	u32 reserved[16];
+};
+
+/* Auto Mode Layer */
+enum auto_mode_transition_priority {
+	AUTO_TRANSITION_TO_PERFORMANCE, /* Any other mode to Performance Mode */
+	AUTO_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
+	AUTO_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
+	AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance Mode to Balance Mode */
+	AUTO_TRANSITION_MAX,
+};
+
+enum auto_mode_mode {
+	AUTO_QUIET,
+	AUTO_BALANCE,
+	AUTO_PERFORMANCE_ON_LAP,
+	AUTO_PERFORMANCE,
+	AUTO_MODE_MAX,
+};
+
+struct auto_mode_trans_params {
+	u32 time_constant; /* minimum time required to switch to next mode */
+	u32 power_delta; /* delta power to shift mode */
+	u32 power_threshold;
+	u32 timer; /* elapsed time. if timer > TimeThreshold, it will move to next mode */
+	u32 applied;
+	enum auto_mode_mode target_mode;
+	u32 shifting_up;
+};
+
+struct auto_mode_mode_settings {
+	struct power_table_control power_control;
+	struct fan_table_control fan_control;
+	u32 power_floor;
+};
+
+struct auto_mode_mode_config {
+	struct auto_mode_trans_params transition[AUTO_TRANSITION_MAX];
+	struct auto_mode_mode_settings mode_set[AUTO_MODE_MAX];
+	enum auto_mode_mode current_mode;
+	bool on_lap;
+	bool better_perf;
+	u32 amt_enabled; /* Auto Mode Transition */
+	u32 avg_power;
+};
+
+struct apmf_auto_mode {
+	u16 size;
+	/* time constant */
+	u32 balanced_to_perf;
+	u32 perf_to_balanced;
+	u32 quiet_to_balanced;
+	u32 balanced_to_quiet;
+	/* power floor */
+	u32 pfloor_perf;
+	u32 pfloor_balanced;
+	u32 pfloor_quiet;
+	/* Power delta for mode change */
+	u32 pd_balanced_to_perf;
+	u32 pd_perf_to_balanced;
+	u32 pd_quiet_to_balanced;
+	u32 pd_balanced_to_quiet;
+	/* skin temperature limits */
+	u8 stt_apu_perf_on_lap; /* CQL ON */
+	u8 stt_hs2_perf_on_lap; /* CQL ON */
+	u8 stt_apu_perf;
+	u8 stt_hs2_perf;
+	u8 stt_apu_balanced;
+	u8 stt_hs2_balanced;
+	u8 stt_apu_quiet;
+	u8 stt_hs2_quiet;
+	u32 stt_min_limit_perf_on_lap; /* CQL ON */
+	u32 stt_min_limit_perf;
+	u32 stt_min_limit_balanced;
+	u32 stt_min_limit_quiet;
+	/* SPL based */
+	u32 fppt_perf_on_lap; /* CQL ON */
+	u32 sppt_perf_on_lap; /* CQL ON */
+	u32 spl_perf_on_lap; /* CQL ON */
+	u32 sppt_apu_only_perf_on_lap; /* CQL ON */
+	u32 fppt_perf;
+	u32 sppt_perf;
+	u32 spl_perf;
+	u32 sppt_apu_only_perf;
+	u32 fppt_balanced;
+	u32 sppt_balanced;
+	u32 spl_balanced;
+	u32 sppt_apu_only_balanced;
+	u32 fppt_quiet;
+	u32 sppt_quiet;
+	u32 spl_quiet;
+	u32 sppt_apu_only_quiet;
+	/* Fan ID */
+	u32 fan_id_perf;
+	u32 fan_id_balanced;
+	u32 fan_id_quiet;
+} __packed;
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
@@ -206,4 +313,12 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
 void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
 int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
+
+/* Auto Mode Layer */
+void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
+int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
+void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
+void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
+
 #endif /* PMF_H */
-- 
2.25.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0E6515C99
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Apr 2022 13:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238146AbiD3MBs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Apr 2022 08:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbiD3MBs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Apr 2022 08:01:48 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4CE88B1D
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Apr 2022 04:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az5LQnK8Soa/H9+inrxnHbTetABWWd1aDdpY4hDckwfAyQkOafaKmK7TP8dq5sU4+ZL2n1SyJaYFcajvPNsuj/lTqcRsan2ht5zkvWOvbZv0eWbNoqIJq+uu5+q/8N5yHVPPOdG4T9Wa/rV1L+MRk/hGkDid3gIBIL2UrUH80RorKcTYOB9Czd5gw0NwneQdslENJhEc1RYEPlDbm3uPTpRI5Wp1OMijD3TTG7+vfEQChNvBHwQJbxUc1DTuo2jm2EuZQ9zVP/615NPcOS66EBUFZQX7QDGJqE/pWp+VoeHD8I80CS1E/3VNSYLPrPRfi0UyEPI016yvbASxMnAisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8JnY95QAEJWfwEdIICJpzGQiGKztWCSVr8yM9oJqfg=;
 b=ZLo2u5YDTmHIvfB+rcAP5vS+akESzJBp3fLPSvxMOH3MjBh2KZDLzuhJjs0KpDwUbV9FcfxJxBNOmOMyTfGl77B/Wl7cfNHvc59Da9Iam5eohtIjq+Yq4jtU2c6rzkOuxAUgWCQF+SDlzFGBg94qppA07p6gkpFLfqL7CNHZTFDX/bsTUl4NuFNn+5zZTlPVN7KjJpc7VS0i5ej7NU7D0Rhfjn8QyGbdH8tzGN/NzNIvdqSByw6gbgw2+MhkI871dHsevMXZM5Ivqkg8FHVCCOdY/n7rUcfH/ak3lnvR56s7d4n6+H4XK5iD4oEjAP7FLgqr7ZxEmcL4rsPMfl75lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8JnY95QAEJWfwEdIICJpzGQiGKztWCSVr8yM9oJqfg=;
 b=efoP+tUI/O0a3fyEoaYTqTNSfmClNT/iAvTQrlf92kHroVaGRGqqj7euzmD6u37HhB1jo4iMhqdLwuoqaEg9SUtDmL6hWbe9u7acMHgb+MjtqlJcU1yZgHE2I5Kfdf/pL9tLWn+1Yzjqw6BAoYeNkrzSfYQClOoS+WPDFRoV7fMADsugxiUype1wSUqfEX5zAHRTRhHXOUShiPZsOi8Qd8XiHuz+xcqPJsnYm/DizF6nZYbFq+hX+BjKRu9SetNNJQ9bfZWslgWeQCWZdMtWpToyYX3u/77E+lJkfo08EJHYeOP9J0GDqqFuyxDKY5jt+E7TG5SHU5pewkF68+H02Q==
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by MWHPR12MB1711.namprd12.prod.outlook.com (2603:10b6:300:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sat, 30 Apr
 2022 11:58:20 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::d3) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Sat, 30 Apr 2022 11:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5206.12 via Frontend Transport; Sat, 30 Apr 2022 11:58:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sat, 30 Apr
 2022 11:58:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 30 Apr
 2022 04:58:18 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sat, 30 Apr 2022 04:58:17 -0700
From:   <michaelsh@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 3/3] Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
Date:   Sat, 30 Apr 2022 14:58:09 +0300
Message-ID: <20220430115809.54565-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220430115809.54565-1-michaelsh@nvidia.com>
References: <20220430115809.54565-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf571237-a3fb-4454-7db0-08da2aa0b813
X-MS-TrafficTypeDiagnostic: MWHPR12MB1711:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1711B8563F139F9E56A4EF34D4FF9@MWHPR12MB1711.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVADl+vc2ZFllp1iup1tb9x0xnvQCgvvBWnI0RaEpThjSFYOByyiBFP2MDqZXXiPzKwICgEKxKKLP6vf+dB9K9b8You7Sdb6ohWAl4Q8SeC7O6HG4b/LC93Mybk/2QWoVw0ZhEEWxUiQr9Rc55V3WlCWDhcWT0O0f9pWSt3x43n6CJBOoluO1YONHNUgxxa2xjNY7FB3PEepstFi/7QKbThBk9JGYZ+vjXmbT7b6jF8CQXqS8YMFuqFcl309gCmjUlxlC/wx1d6DbGdBbf93XfDcs+wRTuy2cy8qzfZvLk3sAREcUYRk0temKsgjUO5vNxmqBLQzvdut+lpjsrS/Pi77b8KY1aLxnrvpkOFbUsvYE+ZhBAveYp24y5rKT67eor18KkIIooObXqATArrcRGhSHbjHrENCzEHt96mN+N7Xs11eW9A0rk7vv6nszLmdbZT9XG35yoC900JE7bBvlsUUW8mFgcuKp7cNwWaF2ZajskvO8HTvU9S2b/w8CmgN6BsMAf8fTwRemxkb92t0vV8vtr3SNbdWQIUeIClFtKLrMSpwZHljcvWqFr2wRgHw0n128zp1S//YrdM36ZnBf2I3M/1d02j88u7SzYlpqX2QjOvdXvY3hOvGyQFMS54N3ghOTXLzD6hKoSPvYvoxRLGwtri2gTSUmHO28PTWIe8NWzmS7q5TGIiAiXvWX6oKvDPMEKw8eSk/G8JmAB82tA==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(336012)(30864003)(36860700001)(426003)(83380400001)(2906002)(47076005)(316002)(6916009)(2876002)(6666004)(54906003)(508600001)(107886003)(2616005)(1076003)(26005)(186003)(8676002)(4326008)(70586007)(70206006)(356005)(40460700003)(81166007)(36756003)(82310400005)(86362001)(36900700001)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 11:58:19.5890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf571237-a3fb-4454-7db0-08da2aa0b813
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1711
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add documentation for the new attributes:
- "phy_reset" - Reset PHY.
- "mac_reset" - Reset MAC.
- "qsfp_pwr_good" - The power status of QSFP ports.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 1766 +++++++++----------------------
 1 file changed, 505 insertions(+), 1261 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index e1ebd871da04..9e397c54dd85 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -1,1261 +1,505 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Nvidia sn2201 driver
- *
- * Copyright (C) 2022 Nvidia Technologies Ltd.
- */
-
-#include <linux/device.h>
-#include <linux/i2c.h>
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/gpio.h>
-#include <linux/module.h>
-#include <linux/platform_data/mlxcpld.h>
-#include <linux/platform_data/mlxreg.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-/* SN2201 CPLD register offset. */
-#define NVSW_SN2201_CPLD_LPC_I2C_BASE_ADRR          0x2000
-#define NVSW_SN2201_CPLD_LPC_IO_RANGE               0x100
-#define NVSW_SN2201_HW_VER_ID_OFFSET                0x00
-#define NVSW_SN2201_BOARD_ID_OFFSET                 0x01
-#define NVSW_SN2201_CPLD_VER_OFFSET                 0x02
-#define NVSW_SN2201_CPLD_MVER_OFFSET                0x03
-#define NVSW_SN2201_CPLD_ID_OFFSET                  0x04
-#define NVSW_SN2201_CPLD_PN_OFFSET                  0x05
-#define NVSW_SN2201_CPLD_PN1_OFFSET                 0x06
-#define NVSW_SN2201_PSU_CTRL_OFFSET                 0x0a
-#define NVSW_SN2201_QSFP28_STATUS_OFFSET            0x0b
-#define NVSW_SN2201_QSFP28_INT_STATUS_OFFSET        0x0c
-#define NVSW_SN2201_QSFP28_LP_STATUS_OFFSET         0x0d
-#define NVSW_SN2201_QSFP28_RST_STATUS_OFFSET        0x0e
-#define NVSW_SN2201_SYS_STATUS_OFFSET               0x0f
-#define NVSW_SN2201_FRONT_SYS_LED_CTRL_OFFSET       0x10
-#define NVSW_SN2201_FRONT_PSU_LED_CTRL_OFFSET       0x12
-#define NVSW_SN2201_FRONT_UID_LED_CTRL_OFFSET       0x13
-#define NVSW_SN2201_QSFP28_LED_TEST_STATUS_OFFSET   0x14
-#define NVSW_SN2201_SYS_RST_STATUS_OFFSET           0x15
-#define NVSW_SN2201_SYS_INT_STATUS_OFFSET           0x21
-#define NVSW_SN2201_SYS_INT_MASK_OFFSET             0x22
-#define NVSW_SN2201_ASIC_STATUS_OFFSET              0x24
-#define NVSW_SN2201_ASIC_EVENT_OFFSET               0x25
-#define NVSW_SN2201_ASIC_MAKS_OFFSET                0x26
-#define NVSW_SN2201_THML_STATUS_OFFSET              0x27
-#define NVSW_SN2201_THML_EVENT_OFFSET               0x28
-#define NVSW_SN2201_THML_MASK_OFFSET                0x29
-#define NVSW_SN2201_PS_ALT_STATUS_OFFSET            0x2a
-#define NVSW_SN2201_PS_ALT_EVENT_OFFSET             0x2b
-#define NVSW_SN2201_PS_ALT_MASK_OFFSET              0x2c
-#define NVSW_SN2201_PS_PRSNT_STATUS_OFFSET          0x30
-#define NVSW_SN2201_PS_PRSNT_EVENT_OFFSET           0x31
-#define NVSW_SN2201_PS_PRSNT_MASK_OFFSET            0x32
-#define NVSW_SN2201_PS_DC_OK_STATUS_OFFSET          0x33
-#define NVSW_SN2201_PS_DC_OK_EVENT_OFFSET           0x34
-#define NVSW_SN2201_PS_DC_OK_MASK_OFFSET            0x35
-#define NVSW_SN2201_RST_CAUSE1_OFFSET               0x36
-#define NVSW_SN2201_RST_CAUSE2_OFFSET               0x37
-#define NVSW_SN2201_RST_SW_CTRL_OFFSET              0x38
-#define NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET         0x3a
-#define NVSW_SN2201_FAN_PRSNT_EVENT_OFFSET          0x3b
-#define NVSW_SN2201_FAN_PRSNT_MASK_OFFSET           0x3c
-#define NVSW_SN2201_WD_TMR_OFFSET_LSB               0x40
-#define NVSW_SN2201_WD_TMR_OFFSET_MSB               0x41
-#define NVSW_SN2201_WD_ACT_OFFSET                   0x42
-#define NVSW_SN2201_FAN_LED1_CTRL_OFFSET            0x50
-#define NVSW_SN2201_FAN_LED2_CTRL_OFFSET            0x51
-#define NVSW_SN2201_REG_MAX                         0x52
-
-/* Number of physical I2C busses. */
-#define NVSW_SN2201_PHY_I2C_BUS_NUM		2
-/* Number of main mux channels. */
-#define NVSW_SN2201_MAIN_MUX_CHNL_NUM		8
-
-#define NVSW_SN2201_MAIN_NR			0
-#define NVSW_SN2201_MAIN_MUX_NR			1
-#define NVSW_SN2201_MAIN_MUX_DEFER_NR		(NVSW_SN2201_PHY_I2C_BUS_NUM + \
-						 NVSW_SN2201_MAIN_MUX_CHNL_NUM - 1)
-
-#define NVSW_SN2201_MAIN_MUX_CH0_NR	NVSW_SN2201_PHY_I2C_BUS_NUM
-#define NVSW_SN2201_MAIN_MUX_CH1_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 1)
-#define NVSW_SN2201_MAIN_MUX_CH2_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 2)
-#define NVSW_SN2201_MAIN_MUX_CH3_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 3)
-#define NVSW_SN2201_MAIN_MUX_CH5_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 5)
-#define NVSW_SN2201_MAIN_MUX_CH6_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 6)
-#define NVSW_SN2201_MAIN_MUX_CH7_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 7)
-
-#define NVSW_SN2201_CPLD_NR		NVSW_SN2201_MAIN_MUX_CH0_NR
-#define NVSW_SN2201_NR_NONE		-1
-
-/* Masks for aggregation, PSU presence and power, ASIC events
- * in CPLD related registers.
- */
-#define NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF	0xe0
-#define NVSW_SN2201_CPLD_AGGR_PSU_MASK_DEF	0x04
-#define NVSW_SN2201_CPLD_AGGR_PWR_MASK_DEF	0x02
-#define NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF	0x10
-#define NVSW_SN2201_CPLD_AGGR_MASK_DEF      \
-	(NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF \
-	| NVSW_SN2201_CPLD_AGGR_PSU_MASK_DEF \
-	| NVSW_SN2201_CPLD_AGGR_PWR_MASK_DEF \
-	| NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF)
-
-#define NVSW_SN2201_CPLD_ASIC_MASK		GENMASK(3, 1)
-#define NVSW_SN2201_CPLD_PSU_MASK		GENMASK(1, 0)
-#define NVSW_SN2201_CPLD_PWR_MASK		GENMASK(1, 0)
-#define NVSW_SN2201_CPLD_FAN_MASK		GENMASK(3, 0)
-
-#define NVSW_SN2201_CPLD_SYSIRQ			26
-#define NVSW_SN2201_LPC_SYSIRQ			28
-#define NVSW_SN2201_CPLD_I2CADDR		0x41
-
-#define NVSW_SN2201_WD_DFLT_TIMEOUT		600
-
-/* nvsw_sn2201 - device private data
- * @dev: platform device;
- * @io_data: register access platform data;
- * @led_data: LED platform data;
- * @hotplug_data: hotplug platform data;
- * @i2c_data: I2C controller platform data;
- * @led: LED device;
- * @io_regs: register access device;
- * @pdev_hotplug: hotplug device;
- * @sn2201_devs: I2C devices for sn2201 devices;
- * @sn2201_devs_num: number of I2C devices for sn2201 device;
- * @main_mux_devs: I2C devices for main mux;
- * @main_mux_devs_num: number of I2C devices for main mux;
- * @cpld_devs: I2C devices for cpld;
- * @cpld_devs_num: number of I2C devices for cpld;
- * @main_mux_deferred_nr: I2C adapter number must be exist prior creating devices execution;
- */
-struct nvsw_sn2201 {
-	struct device *dev;
-	struct mlxreg_core_platform_data *io_data;
-	struct mlxreg_core_platform_data *led_data;
-	struct mlxreg_core_platform_data *wd_data;
-	struct mlxreg_core_hotplug_platform_data *hotplug_data;
-	struct mlxreg_core_hotplug_platform_data *i2c_data;
-	struct platform_device *led;
-	struct platform_device *wd;
-	struct platform_device *io_regs;
-	struct platform_device *pdev_hotplug;
-	struct platform_device *pdev_i2c;
-	struct mlxreg_hotplug_device *sn2201_devs;
-	int sn2201_devs_num;
-	struct mlxreg_hotplug_device *main_mux_devs;
-	int main_mux_devs_num;
-	struct mlxreg_hotplug_device *cpld_devs;
-	int cpld_devs_num;
-	int main_mux_deferred_nr;
-};
-
-static bool nvsw_sn2201_writeable_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case NVSW_SN2201_PSU_CTRL_OFFSET:
-	case NVSW_SN2201_QSFP28_LP_STATUS_OFFSET:
-	case NVSW_SN2201_QSFP28_RST_STATUS_OFFSET:
-	case NVSW_SN2201_FRONT_SYS_LED_CTRL_OFFSET:
-	case NVSW_SN2201_FRONT_PSU_LED_CTRL_OFFSET:
-	case NVSW_SN2201_FRONT_UID_LED_CTRL_OFFSET:
-	case NVSW_SN2201_QSFP28_LED_TEST_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_RST_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_INT_MASK_OFFSET:
-	case NVSW_SN2201_ASIC_EVENT_OFFSET:
-	case NVSW_SN2201_ASIC_MAKS_OFFSET:
-	case NVSW_SN2201_THML_EVENT_OFFSET:
-	case NVSW_SN2201_THML_MASK_OFFSET:
-	case NVSW_SN2201_PS_ALT_EVENT_OFFSET:
-	case NVSW_SN2201_PS_ALT_MASK_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_EVENT_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_MASK_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_EVENT_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_MASK_OFFSET:
-	case NVSW_SN2201_RST_SW_CTRL_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_EVENT_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_MASK_OFFSET:
-	case NVSW_SN2201_WD_TMR_OFFSET_LSB:
-	case NVSW_SN2201_WD_TMR_OFFSET_MSB:
-	case NVSW_SN2201_WD_ACT_OFFSET:
-	case NVSW_SN2201_FAN_LED1_CTRL_OFFSET:
-	case NVSW_SN2201_FAN_LED2_CTRL_OFFSET:
-		return true;
-	}
-	return false;
-}
-
-static bool nvsw_sn2201_readable_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case NVSW_SN2201_HW_VER_ID_OFFSET:
-	case NVSW_SN2201_BOARD_ID_OFFSET:
-	case NVSW_SN2201_CPLD_VER_OFFSET:
-	case NVSW_SN2201_CPLD_MVER_OFFSET:
-	case NVSW_SN2201_CPLD_ID_OFFSET:
-	case NVSW_SN2201_CPLD_PN_OFFSET:
-	case NVSW_SN2201_CPLD_PN1_OFFSET:
-	case NVSW_SN2201_PSU_CTRL_OFFSET:
-	case NVSW_SN2201_QSFP28_STATUS_OFFSET:
-	case NVSW_SN2201_QSFP28_INT_STATUS_OFFSET:
-	case NVSW_SN2201_QSFP28_LP_STATUS_OFFSET:
-	case NVSW_SN2201_QSFP28_RST_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_STATUS_OFFSET:
-	case NVSW_SN2201_FRONT_SYS_LED_CTRL_OFFSET:
-	case NVSW_SN2201_FRONT_PSU_LED_CTRL_OFFSET:
-	case NVSW_SN2201_FRONT_UID_LED_CTRL_OFFSET:
-	case NVSW_SN2201_QSFP28_LED_TEST_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_RST_STATUS_OFFSET:
-	case NVSW_SN2201_RST_CAUSE1_OFFSET:
-	case NVSW_SN2201_RST_CAUSE2_OFFSET:
-	case NVSW_SN2201_SYS_INT_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_INT_MASK_OFFSET:
-	case NVSW_SN2201_ASIC_STATUS_OFFSET:
-	case NVSW_SN2201_ASIC_EVENT_OFFSET:
-	case NVSW_SN2201_ASIC_MAKS_OFFSET:
-	case NVSW_SN2201_THML_STATUS_OFFSET:
-	case NVSW_SN2201_THML_EVENT_OFFSET:
-	case NVSW_SN2201_THML_MASK_OFFSET:
-	case NVSW_SN2201_PS_ALT_STATUS_OFFSET:
-	case NVSW_SN2201_PS_ALT_EVENT_OFFSET:
-	case NVSW_SN2201_PS_ALT_MASK_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_STATUS_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_EVENT_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_MASK_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_STATUS_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_EVENT_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_MASK_OFFSET:
-	case NVSW_SN2201_RST_SW_CTRL_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_EVENT_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_MASK_OFFSET:
-	case NVSW_SN2201_WD_TMR_OFFSET_LSB:
-	case NVSW_SN2201_WD_TMR_OFFSET_MSB:
-	case NVSW_SN2201_WD_ACT_OFFSET:
-	case NVSW_SN2201_FAN_LED1_CTRL_OFFSET:
-	case NVSW_SN2201_FAN_LED2_CTRL_OFFSET:
-		return true;
-	}
-	return false;
-}
-
-static bool nvsw_sn2201_volatile_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case NVSW_SN2201_HW_VER_ID_OFFSET:
-	case NVSW_SN2201_BOARD_ID_OFFSET:
-	case NVSW_SN2201_CPLD_VER_OFFSET:
-	case NVSW_SN2201_CPLD_MVER_OFFSET:
-	case NVSW_SN2201_CPLD_ID_OFFSET:
-	case NVSW_SN2201_CPLD_PN_OFFSET:
-	case NVSW_SN2201_CPLD_PN1_OFFSET:
-	case NVSW_SN2201_PSU_CTRL_OFFSET:
-	case NVSW_SN2201_QSFP28_STATUS_OFFSET:
-	case NVSW_SN2201_QSFP28_INT_STATUS_OFFSET:
-	case NVSW_SN2201_QSFP28_LP_STATUS_OFFSET:
-	case NVSW_SN2201_QSFP28_RST_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_STATUS_OFFSET:
-	case NVSW_SN2201_FRONT_SYS_LED_CTRL_OFFSET:
-	case NVSW_SN2201_FRONT_PSU_LED_CTRL_OFFSET:
-	case NVSW_SN2201_FRONT_UID_LED_CTRL_OFFSET:
-	case NVSW_SN2201_QSFP28_LED_TEST_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_RST_STATUS_OFFSET:
-	case NVSW_SN2201_RST_CAUSE1_OFFSET:
-	case NVSW_SN2201_RST_CAUSE2_OFFSET:
-	case NVSW_SN2201_SYS_INT_STATUS_OFFSET:
-	case NVSW_SN2201_SYS_INT_MASK_OFFSET:
-	case NVSW_SN2201_ASIC_STATUS_OFFSET:
-	case NVSW_SN2201_ASIC_EVENT_OFFSET:
-	case NVSW_SN2201_ASIC_MAKS_OFFSET:
-	case NVSW_SN2201_THML_STATUS_OFFSET:
-	case NVSW_SN2201_THML_EVENT_OFFSET:
-	case NVSW_SN2201_THML_MASK_OFFSET:
-	case NVSW_SN2201_PS_ALT_STATUS_OFFSET:
-	case NVSW_SN2201_PS_ALT_EVENT_OFFSET:
-	case NVSW_SN2201_PS_ALT_MASK_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_STATUS_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_EVENT_OFFSET:
-	case NVSW_SN2201_PS_PRSNT_MASK_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_STATUS_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_EVENT_OFFSET:
-	case NVSW_SN2201_PS_DC_OK_MASK_OFFSET:
-	case NVSW_SN2201_RST_SW_CTRL_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_EVENT_OFFSET:
-	case NVSW_SN2201_FAN_PRSNT_MASK_OFFSET:
-	case NVSW_SN2201_WD_TMR_OFFSET_LSB:
-	case NVSW_SN2201_WD_TMR_OFFSET_MSB:
-	case NVSW_SN2201_FAN_LED1_CTRL_OFFSET:
-	case NVSW_SN2201_FAN_LED2_CTRL_OFFSET:
-		return true;
-	}
-	return false;
-}
-
-static const struct reg_default nvsw_sn2201_regmap_default[] = {
-	{ NVSW_SN2201_QSFP28_LED_TEST_STATUS_OFFSET, 0x00 },
-	{ NVSW_SN2201_WD_ACT_OFFSET, 0x00 },
-};
-
-/* Configuration for the register map of a device with 1 bytes address space. */
-static const struct regmap_config nvsw_sn2201_regmap_conf = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = NVSW_SN2201_REG_MAX,
-	.cache_type = REGCACHE_FLAT,
-	.writeable_reg = nvsw_sn2201_writeable_reg,
-	.readable_reg = nvsw_sn2201_readable_reg,
-	.volatile_reg = nvsw_sn2201_volatile_reg,
-	.reg_defaults = nvsw_sn2201_regmap_default,
-	.num_reg_defaults = ARRAY_SIZE(nvsw_sn2201_regmap_default),
-};
-
-/* Regions for LPC I2C controller and LPC base register space. */
-static const struct resource nvsw_sn2201_lpc_io_resources[] = {
-	[0] = DEFINE_RES_NAMED(NVSW_SN2201_CPLD_LPC_I2C_BASE_ADRR,
-			       NVSW_SN2201_CPLD_LPC_IO_RANGE,
-			       "mlxplat_cpld_lpc_i2c_ctrl", IORESOURCE_IO),
-};
-
-static struct resource nvsw_sn2201_cpld_res[] = {
-	[0] = DEFINE_RES_IRQ_NAMED(NVSW_SN2201_CPLD_SYSIRQ, "mlxreg-hotplug"),
-};
-
-static struct resource nvsw_sn2201_lpc_res[] = {
-	[0] = DEFINE_RES_IRQ_NAMED(NVSW_SN2201_LPC_SYSIRQ, "i2c-mlxcpld"),
-};
-
-/* SN2201 I2C platform data. */
-struct mlxreg_core_hotplug_platform_data nvsw_sn2201_i2c_data = {
-	.irq = NVSW_SN2201_CPLD_SYSIRQ,
-};
-
-/* SN2201 CPLD device. */
-static struct i2c_board_info nvsw_sn2201_cpld_devices[] = {
-	{
-		I2C_BOARD_INFO("nvsw-sn2201", 0x41),
-	},
-};
-
-/* SN2201 CPLD board info. */
-static struct mlxreg_hotplug_device nvsw_sn2201_cpld_brdinfo[] = {
-	{
-		.brdinfo = &nvsw_sn2201_cpld_devices[0],
-		.nr = NVSW_SN2201_CPLD_NR,
-	},
-};
-
-/* SN2201 main mux device. */
-static struct i2c_board_info nvsw_sn2201_main_mux_devices[] = {
-	{
-		I2C_BOARD_INFO("pca9548", 0x70),
-	},
-};
-
-/* SN2201 main mux board info. */
-static struct mlxreg_hotplug_device nvsw_sn2201_main_mux_brdinfo[] = {
-	{
-		.brdinfo = &nvsw_sn2201_main_mux_devices[0],
-		.nr = NVSW_SN2201_MAIN_MUX_NR,
-	},
-};
-
-/* SN2201 power devices. */
-static struct i2c_board_info nvsw_sn2201_pwr_devices[] = {
-	{
-		I2C_BOARD_INFO("pmbus", 0x58),
-	},
-	{
-		I2C_BOARD_INFO("pmbus", 0x58),
-	},
-};
-
-/* SN2201 fan devices. */
-static struct i2c_board_info nvsw_sn2201_fan_devices[] = {
-	{
-		I2C_BOARD_INFO("24c02", 0x50),
-	},
-	{
-		I2C_BOARD_INFO("24c02", 0x51),
-	},
-	{
-		I2C_BOARD_INFO("24c02", 0x52),
-	},
-	{
-		I2C_BOARD_INFO("24c02", 0x53),
-	},
-};
-
-/* SN2201 hotplug default data. */
-static struct mlxreg_core_data nvsw_sn2201_psu_items_data[] = {
-	{
-		.label = "psu1",
-		.reg = NVSW_SN2201_PS_PRSNT_STATUS_OFFSET,
-		.mask = BIT(0),
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-	{
-		.label = "psu2",
-		.reg = NVSW_SN2201_PS_PRSNT_STATUS_OFFSET,
-		.mask = BIT(1),
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-};
-
-static struct mlxreg_core_data nvsw_sn2201_pwr_items_data[] = {
-	{
-		.label = "pwr1",
-		.reg = NVSW_SN2201_PS_DC_OK_STATUS_OFFSET,
-		.mask = BIT(0),
-		.hpdev.brdinfo = &nvsw_sn2201_pwr_devices[0],
-		.hpdev.nr = NVSW_SN2201_MAIN_MUX_CH1_NR,
-	},
-	{
-		.label = "pwr2",
-		.reg = NVSW_SN2201_PS_DC_OK_STATUS_OFFSET,
-		.mask = BIT(1),
-		.hpdev.brdinfo = &nvsw_sn2201_pwr_devices[1],
-		.hpdev.nr = NVSW_SN2201_MAIN_MUX_CH2_NR,
-	},
-};
-
-static struct mlxreg_core_data nvsw_sn2201_fan_items_data[] = {
-	{
-		.label = "fan1",
-		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
-		.mask = BIT(0),
-		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[0],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-	{
-		.label = "fan2",
-		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
-		.mask = BIT(1),
-		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[1],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-	{
-		.label = "fan3",
-		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
-		.mask = BIT(2),
-		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[2],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-	{
-		.label = "fan4",
-		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
-		.mask = BIT(3),
-		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[3],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-};
-
-static struct mlxreg_core_data nvsw_sn2201_sys_items_data[] = {
-	{
-		.label = "nic_smb_alert",
-		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
-		.mask = BIT(1),
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-	{
-		.label = "cpu_sd",
-		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
-		.mask = BIT(2),
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-	{
-		.label = "mac_health",
-		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
-		.mask = BIT(3),
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
-	},
-};
-
-static struct mlxreg_core_item nvsw_sn2201_items[] = {
-	{
-		.data = nvsw_sn2201_psu_items_data,
-		.aggr_mask = NVSW_SN2201_CPLD_AGGR_PSU_MASK_DEF,
-		.reg = NVSW_SN2201_PS_PRSNT_STATUS_OFFSET,
-		.mask = NVSW_SN2201_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_psu_items_data),
-		.inversed = 1,
-		.health = false,
-	},
-	{
-		.data = nvsw_sn2201_pwr_items_data,
-		.aggr_mask = NVSW_SN2201_CPLD_AGGR_PWR_MASK_DEF,
-		.reg = NVSW_SN2201_PS_DC_OK_STATUS_OFFSET,
-		.mask = NVSW_SN2201_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_pwr_items_data),
-		.inversed = 0,
-		.health = false,
-	},
-	{
-		.data = nvsw_sn2201_fan_items_data,
-		.aggr_mask = NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF,
-		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
-		.mask = NVSW_SN2201_CPLD_FAN_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
-		.inversed = 1,
-		.health = false,
-	},
-	{
-		.data = nvsw_sn2201_sys_items_data,
-		.aggr_mask = NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF,
-		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
-		.mask = NVSW_SN2201_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
-		.inversed = 1,
-		.health = false,
-	},
-};
-
-static
-struct mlxreg_core_hotplug_platform_data nvsw_sn2201_hotplug = {
-	.items = nvsw_sn2201_items,
-	.counter = ARRAY_SIZE(nvsw_sn2201_items),
-	.cell = NVSW_SN2201_SYS_INT_STATUS_OFFSET,
-	.mask = NVSW_SN2201_CPLD_AGGR_MASK_DEF,
-};
-
-/* SN2201 static devices. */
-static struct i2c_board_info nvsw_sn2201_static_devices[] = {
-	{
-		I2C_BOARD_INFO("24c02", 0x57),
-	},
-	{
-		I2C_BOARD_INFO("lm75", 0x4b),
-	},
-	{
-		I2C_BOARD_INFO("24c64", 0x56),
-	},
-	{
-		I2C_BOARD_INFO("ads1015", 0x49),
-	},
-	{
-		I2C_BOARD_INFO("pca9546", 0x71),
-	},
-	{
-		I2C_BOARD_INFO("emc2305", 0x4d),
-	},
-	{
-		I2C_BOARD_INFO("lm75", 0x49),
-	},
-	{
-		I2C_BOARD_INFO("pca9555", 0x27),
-	},
-	{
-		I2C_BOARD_INFO("powr1014", 0x37),
-	},
-	{
-		I2C_BOARD_INFO("lm75", 0x4f),
-	},
-	{
-		I2C_BOARD_INFO("pmbus", 0x40),
-	},
-};
-
-/* SN2201 default static board info. */
-static struct mlxreg_hotplug_device nvsw_sn2201_static_brdinfo[] = {
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[0],
-		.nr = NVSW_SN2201_MAIN_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[1],
-		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[2],
-		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[3],
-		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[4],
-		.nr = NVSW_SN2201_MAIN_MUX_CH3_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[5],
-		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[6],
-		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[7],
-		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[8],
-		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[9],
-		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
-	},
-	{
-		.brdinfo = &nvsw_sn2201_static_devices[10],
-		.nr = NVSW_SN2201_MAIN_MUX_CH7_NR,
-	},
-};
-
-/* LED default data. */
-static struct mlxreg_core_data nvsw_sn2201_led_data[] = {
-	{
-		.label = "status:green",
-		.reg = NVSW_SN2201_FRONT_SYS_LED_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "status:orange",
-		.reg = NVSW_SN2201_FRONT_SYS_LED_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "psu:green",
-		.reg = NVSW_SN2201_FRONT_PSU_LED_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "psu:orange",
-		.reg = NVSW_SN2201_FRONT_PSU_LED_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "uid:blue",
-		.reg = NVSW_SN2201_FRONT_UID_LED_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "fan1:green",
-		.reg = NVSW_SN2201_FAN_LED1_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "fan1:orange",
-		.reg = NVSW_SN2201_FAN_LED1_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "fan2:green",
-		.reg = NVSW_SN2201_FAN_LED1_CTRL_OFFSET,
-		.mask = GENMASK(3, 0),
-	},
-	{
-		.label = "fan2:orange",
-		.reg = NVSW_SN2201_FAN_LED1_CTRL_OFFSET,
-		.mask = GENMASK(3, 0),
-	},
-	{
-		.label = "fan3:green",
-		.reg = NVSW_SN2201_FAN_LED2_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "fan3:orange",
-		.reg = NVSW_SN2201_FAN_LED2_CTRL_OFFSET,
-		.mask = GENMASK(7, 4),
-	},
-	{
-		.label = "fan4:green",
-		.reg = NVSW_SN2201_FAN_LED2_CTRL_OFFSET,
-		.mask = GENMASK(3, 0),
-	},
-	{
-		.label = "fan4:orange",
-		.reg = NVSW_SN2201_FAN_LED2_CTRL_OFFSET,
-		.mask = GENMASK(3, 0),
-	},
-};
-
-static struct mlxreg_core_platform_data nvsw_sn2201_led = {
-	.data = nvsw_sn2201_led_data,
-	.counter = ARRAY_SIZE(nvsw_sn2201_led_data),
-};
-
-/* Default register access data. */
-static struct mlxreg_core_data nvsw_sn2201_io_data[] = {
-	{
-		.label = "cpld1_version",
-		.reg = NVSW_SN2201_CPLD_VER_OFFSET,
-		.bit = GENMASK(7, 0),
-		.mode = 0444,
-	},
-	{
-		.label = "cpld1_version_min",
-		.reg = NVSW_SN2201_CPLD_MVER_OFFSET,
-		.bit = GENMASK(7, 0),
-		.mode = 0444,
-	},
-	{
-		.label = "cpld1_pn",
-		.reg = NVSW_SN2201_CPLD_PN_OFFSET,
-		.bit = GENMASK(15, 0),
-		.mode = 0444,
-		.regnum = 2,
-	},
-	{
-		.label = "psu1_on",
-		.reg = NVSW_SN2201_PSU_CTRL_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(0),
-		.mode = 0644,
-	},
-	{
-		.label = "psu2_on",
-		.reg = NVSW_SN2201_PSU_CTRL_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(1),
-		.mode = 0644,
-	},
-	{
-		.label = "pwr_cycle",
-		.reg = NVSW_SN2201_PSU_CTRL_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(2),
-		.mode = 0644,
-	},
-	{
-		.label = "asic_health",
-		.reg = NVSW_SN2201_SYS_STATUS_OFFSET,
-		.mask = GENMASK(4, 3),
-		.bit = 4,
-		.mode = 0444,
-	},
-	{
-		.label = "qsfp_pwr_good",
-		.reg = NVSW_SN2201_SYS_STATUS_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(0),
-		.mode = 0444,
-	},
-	{
-		.label = "phy_reset",
-		.reg = NVSW_SN2201_SYS_RST_STATUS_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(3),
-		.mode = 0644,
-	},
-	{
-		.label = "mac_reset",
-		.reg = NVSW_SN2201_SYS_RST_STATUS_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(2),
-		.mode = 0644,
-	},
-	{
-		.label = "pwr_down",
-		.reg = NVSW_SN2201_RST_SW_CTRL_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(0),
-		.mode = 0644,
-	},
-	{
-		.label = "reset_long_pb",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(0),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_short_pb",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(1),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_aux_pwr_or_fu",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(2),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_swb_dc_dc_pwr_fail",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(3),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_sw_reset",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(4),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_fw_reset",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(5),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_swb_wd",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(6),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_asic_thermal",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(7),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_system",
-		.reg = NVSW_SN2201_RST_CAUSE2_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(1),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_sw_pwr_off",
-		.reg = NVSW_SN2201_RST_CAUSE2_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(2),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_cpu_pwr_fail_thermal",
-		.reg = NVSW_SN2201_RST_CAUSE2_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(4),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_reload_bios",
-		.reg = NVSW_SN2201_RST_CAUSE2_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(5),
-		.mode = 0444,
-	},
-	{
-		.label = "reset_ac_pwr_fail",
-		.reg = NVSW_SN2201_RST_CAUSE2_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(6),
-		.mode = 0444,
-	},
-	{
-		.label = "psu1",
-		.reg = NVSW_SN2201_PS_PRSNT_STATUS_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(0),
-		.mode = 0444,
-	},
-	{
-		.label = "psu2",
-		.reg = NVSW_SN2201_PS_PRSNT_STATUS_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(1),
-		.mode = 0444,
-	},
-};
-
-static struct mlxreg_core_platform_data nvsw_sn2201_regs_io = {
-	.data = nvsw_sn2201_io_data,
-	.counter = ARRAY_SIZE(nvsw_sn2201_io_data),
-};
-
-/* Default watchdog data. */
-static struct mlxreg_core_data nvsw_sn2201_wd_data[] = {
-	{
-		.label = "action",
-		.reg = NVSW_SN2201_WD_ACT_OFFSET,
-		.mask = GENMASK(7, 1),
-		.bit = 0,
-	},
-	{
-		.label = "timeout",
-		.reg = NVSW_SN2201_WD_TMR_OFFSET_LSB,
-		.mask = 0,
-		.health_cntr = NVSW_SN2201_WD_DFLT_TIMEOUT,
-	},
-	{
-		.label = "timeleft",
-		.reg = NVSW_SN2201_WD_TMR_OFFSET_LSB,
-		.mask = 0,
-	},
-	{
-		.label = "ping",
-		.reg = NVSW_SN2201_WD_ACT_OFFSET,
-		.mask = GENMASK(7, 1),
-		.bit = 0,
-	},
-	{
-		.label = "reset",
-		.reg = NVSW_SN2201_RST_CAUSE1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(6),
-		.bit = 6,
-	},
-};
-
-static struct mlxreg_core_platform_data nvsw_sn2201_wd = {
-	.data = nvsw_sn2201_wd_data,
-	.counter = ARRAY_SIZE(nvsw_sn2201_wd_data),
-	.version = MLX_WDT_TYPE3,
-	.identity = "mlx-wdt-main",
-};
-
-static int
-nvsw_sn2201_create_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
-				  struct mlxreg_hotplug_device *devs,
-				  int size)
-{
-	struct mlxreg_hotplug_device *dev = devs;
-	int i;
-
-	/* Create I2C static devices. */
-	for (i = 0; i < size; i++, dev++) {
-		dev->client = i2c_new_client_device(dev->adapter, dev->brdinfo);
-		if (IS_ERR(dev->client)) {
-			dev_err(nvsw_sn2201->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
-				dev->brdinfo->type,
-				dev->nr, dev->brdinfo->addr);
-
-			dev->adapter = NULL;
-			goto fail_create_static_devices;
-		}
-	}
-
-	return 0;
-
-fail_create_static_devices:
-	while (--i >= 0) {
-		dev = devs + i;
-		i2c_unregister_device(dev->client);
-		dev->client = NULL;
-		dev->adapter = NULL;
-	}
-	return IS_ERR(dev->client);
-}
-
-static void nvsw_sn2201_destroy_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
-					       struct mlxreg_hotplug_device *devs, int size)
-{
-	struct mlxreg_hotplug_device *dev = devs;
-	int i;
-
-	/* Destroy static I2C device for SN2201 static devices. */
-	for (i = 0; i < size; i++, dev++) {
-		if (dev->client) {
-			i2c_unregister_device(dev->client);
-			dev->client = NULL;
-			i2c_put_adapter(dev->adapter);
-			dev->adapter = NULL;
-		}
-	}
-}
-
-static int nvsw_sn2201_config_post_init(struct nvsw_sn2201 *nvsw_sn2201)
-{
-	struct mlxreg_hotplug_device *sn2201_dev;
-	struct i2c_adapter *adap;
-	struct device *dev;
-	int i, j, err;
-
-	dev = nvsw_sn2201->dev;
-	adap = i2c_get_adapter(nvsw_sn2201->main_mux_deferred_nr);
-	if (!adap) {
-		dev_err(dev, "Failed to get adapter for bus %d\n",
-			nvsw_sn2201->main_mux_deferred_nr);
-		return -ENODEV;
-	}
-	i2c_put_adapter(adap);
-
-	/* Update board info. */
-	sn2201_dev = nvsw_sn2201->sn2201_devs;
-	for (i = 0, j = 0; i < nvsw_sn2201->sn2201_devs_num; i++, sn2201_dev++) {
-		sn2201_dev->adapter = i2c_get_adapter(sn2201_dev->nr);
-		if (!sn2201_dev->adapter)
-			return -ENODEV;
-		i2c_put_adapter(sn2201_dev->adapter);
-	}
-
-	err = nvsw_sn2201_create_static_devices(nvsw_sn2201, nvsw_sn2201->sn2201_devs,
-						nvsw_sn2201->sn2201_devs_num);
-	if (err)
-		dev_err(dev, "Failed to create static devices\n");
-
-	return err;
-}
-
-static int nvsw_sn2201_config_init(struct nvsw_sn2201 *nvsw_sn2201, void *regmap)
-{
-	struct device *dev = nvsw_sn2201->dev;
-	int err;
-
-	nvsw_sn2201->io_data = &nvsw_sn2201_regs_io;
-	nvsw_sn2201->led_data = &nvsw_sn2201_led;
-	nvsw_sn2201->wd_data = &nvsw_sn2201_wd;
-	nvsw_sn2201->hotplug_data = &nvsw_sn2201_hotplug;
-
-	/* Register IO access driver. */
-	if (nvsw_sn2201->io_data) {
-		nvsw_sn2201->io_data->regmap = regmap;
-		nvsw_sn2201->io_regs =
-		platform_device_register_resndata(dev, "mlxreg-io", PLATFORM_DEVID_NONE, NULL, 0,
-						  nvsw_sn2201->io_data,
-						  sizeof(*nvsw_sn2201->io_data));
-		if (IS_ERR(nvsw_sn2201->io_regs)) {
-			err = PTR_ERR(nvsw_sn2201->io_regs);
-			goto fail_register_io;
-		}
-	}
-
-	/* Register LED driver. */
-	if (nvsw_sn2201->led_data) {
-		nvsw_sn2201->led_data->regmap = regmap;
-		nvsw_sn2201->led =
-		platform_device_register_resndata(dev, "leds-mlxreg", PLATFORM_DEVID_NONE, NULL, 0,
-						  nvsw_sn2201->led_data,
-						  sizeof(*nvsw_sn2201->led_data));
-		if (IS_ERR(nvsw_sn2201->led)) {
-			err = PTR_ERR(nvsw_sn2201->led);
-			goto fail_register_led;
-		}
-	}
-
-	/* Register WD driver. */
-	if (nvsw_sn2201->wd_data) {
-		nvsw_sn2201->wd_data->regmap = regmap;
-		nvsw_sn2201->wd =
-		platform_device_register_resndata(dev, "mlx-wdt", PLATFORM_DEVID_NONE, NULL, 0,
-						  nvsw_sn2201->wd_data,
-						  sizeof(*nvsw_sn2201->wd_data));
-		if (IS_ERR(nvsw_sn2201->wd)) {
-			err = PTR_ERR(nvsw_sn2201->wd);
-			goto fail_register_wd;
-		}
-	}
-
-	/* Register hotplug driver. */
-	if (nvsw_sn2201->hotplug_data) {
-		nvsw_sn2201->hotplug_data->regmap = regmap;
-		nvsw_sn2201->pdev_hotplug =
-		platform_device_register_resndata(dev, "mlxreg-hotplug", PLATFORM_DEVID_NONE,
-						  nvsw_sn2201_cpld_res,
-						  ARRAY_SIZE(nvsw_sn2201_cpld_res),
-						  nvsw_sn2201->hotplug_data,
-						  sizeof(*nvsw_sn2201->hotplug_data));
-		if (IS_ERR(nvsw_sn2201->pdev_hotplug)) {
-			err = PTR_ERR(nvsw_sn2201->pdev_hotplug);
-			goto fail_register_hotplug;
-		}
-	}
-
-	return nvsw_sn2201_config_post_init(nvsw_sn2201);
-
-fail_register_hotplug:
-	if (nvsw_sn2201->wd)
-		platform_device_unregister(nvsw_sn2201->wd);
-fail_register_wd:
-	if (nvsw_sn2201->led)
-		platform_device_unregister(nvsw_sn2201->led);
-fail_register_led:
-	if (nvsw_sn2201->io_regs)
-		platform_device_unregister(nvsw_sn2201->io_regs);
-fail_register_io:
-
-	return err;
-}
-
-static void nvsw_sn2201_config_exit(struct nvsw_sn2201 *nvsw_sn2201)
-{
-	/* Unregister hotplug driver. */
-	if (nvsw_sn2201->pdev_hotplug)
-		platform_device_unregister(nvsw_sn2201->pdev_hotplug);
-	/* Unregister WD driver. */
-	if (nvsw_sn2201->wd)
-		platform_device_unregister(nvsw_sn2201->wd);
-	/* Unregister LED driver. */
-	if (nvsw_sn2201->led)
-		platform_device_unregister(nvsw_sn2201->led);
-	/* Unregister IO access driver. */
-	if (nvsw_sn2201->io_regs)
-		platform_device_unregister(nvsw_sn2201->io_regs);
-}
-
-/* 
- * Initialization is divided into two parts:
- * - I2C main bus init.
- * - Mux creation and attaching devices to the mux, 
- *   which assumes that the main bus is already created.
- * This separation is required for synchronization between these two parts. 
- * Completion notify callback is used to make this flow synchronized.
- */ 
-static int nvsw_sn2201_i2c_completion_notify(void *handle, int id)
-{
-	struct nvsw_sn2201 *nvsw_sn2201 = handle;
-	void *regmap;
-	int i, err;
-
-	/* Create main mux. */
-	nvsw_sn2201->main_mux_devs->adapter = i2c_get_adapter(nvsw_sn2201->main_mux_devs->nr);
-	if (!nvsw_sn2201->main_mux_devs->adapter) {
-		err = -ENODEV;
-		dev_err(nvsw_sn2201->dev, "Failed to get adapter for bus %d\n",
-			nvsw_sn2201->cpld_devs->nr);
-		goto i2c_get_adapter_main_fail;
-	}
-
-	nvsw_sn2201->main_mux_devs_num = ARRAY_SIZE(nvsw_sn2201_main_mux_brdinfo);
-	err = nvsw_sn2201_create_static_devices(nvsw_sn2201, nvsw_sn2201->main_mux_devs,
-						nvsw_sn2201->main_mux_devs_num);
-	if (err) {
-		dev_err(nvsw_sn2201->dev, "Failed to create main mux devices\n");
-		goto nvsw_sn2201_create_static_devices_fail;
-	}
-
-	nvsw_sn2201->cpld_devs->adapter = i2c_get_adapter(nvsw_sn2201->cpld_devs->nr);
-	if (!nvsw_sn2201->cpld_devs->adapter) {
-		err = -ENODEV;
-		dev_err(nvsw_sn2201->dev, "Failed to get adapter for bus %d\n",
-			nvsw_sn2201->cpld_devs->nr);
-		goto i2c_get_adapter_fail;
-	}
-
-	/* Create CPLD device. */
-	nvsw_sn2201->cpld_devs->client = i2c_new_dummy_device(nvsw_sn2201->cpld_devs->adapter,
-							      NVSW_SN2201_CPLD_I2CADDR);
-	if (IS_ERR(nvsw_sn2201->cpld_devs->client)) {
-		err = PTR_ERR(nvsw_sn2201->cpld_devs->client);
-		dev_err(nvsw_sn2201->dev, "Failed to create %s cpld device at bus %d at addr 0x%02x\n",
-			nvsw_sn2201->cpld_devs->brdinfo->type, nvsw_sn2201->cpld_devs->nr,
-			nvsw_sn2201->cpld_devs->brdinfo->addr);
-		goto i2c_new_dummy_fail;
-	}
-
-	regmap = devm_regmap_init_i2c(nvsw_sn2201->cpld_devs->client, &nvsw_sn2201_regmap_conf);
-	if (IS_ERR(regmap)) {
-		err = PTR_ERR(regmap);
-		dev_err(nvsw_sn2201->dev, "Failed to initialise managed register map\n");
-		goto devm_regmap_init_i2c_fail;
-	}
-
-	/* Set default registers. */
-	for (i = 0; i < nvsw_sn2201_regmap_conf.num_reg_defaults; i++) {
-		err = regmap_write(regmap, nvsw_sn2201_regmap_default[i].reg,
-				   nvsw_sn2201_regmap_default[i].def);
-		if (err) {
-			dev_err(nvsw_sn2201->dev, "Failed to set register at offset 0x%02x to default value: 0x%02x\n",
-				nvsw_sn2201_regmap_default[i].reg,
-				nvsw_sn2201_regmap_default[i].def);
-			goto regmap_write_fail;
-		}
-	}
-
-	/* Sync registers with hardware. */
-	regcache_mark_dirty(regmap);
-	err = regcache_sync(regmap);
-	if (err) {
-		dev_err(nvsw_sn2201->dev, "Failed to Sync registers with hardware\n");
-		goto regcache_sync_fail;
-	}
-
-	/* Configure SN2201 board. */
-	err = nvsw_sn2201_config_init(nvsw_sn2201, regmap);
-	if (err) {
-		dev_err(nvsw_sn2201->dev, "Failed to configure board\n");
-		goto nvsw_sn2201_config_init_fail;
-	}
-
-	return 0;
-
-nvsw_sn2201_config_init_fail:
-	nvsw_sn2201_config_exit(nvsw_sn2201);
-regcache_sync_fail:
-regmap_write_fail:
-devm_regmap_init_i2c_fail:
-i2c_new_dummy_fail:
-	i2c_put_adapter(nvsw_sn2201->cpld_devs->adapter);
-	nvsw_sn2201->cpld_devs->adapter = NULL;
-i2c_get_adapter_fail:
-	/* Destroy SN2201 static I2C devices. */
-	nvsw_sn2201_destroy_static_devices(nvsw_sn2201, nvsw_sn2201->sn2201_devs,
-					   nvsw_sn2201->sn2201_devs_num);
-	/* Destroy main mux device. */
-	nvsw_sn2201_destroy_static_devices(nvsw_sn2201, nvsw_sn2201->main_mux_devs,
-					   nvsw_sn2201->main_mux_devs_num);
-nvsw_sn2201_create_static_devices_fail:
-	i2c_put_adapter(nvsw_sn2201->main_mux_devs->adapter);
-i2c_get_adapter_main_fail:
-	return err;
-}
-
-static int nvsw_sn2201_config_pre_init(struct nvsw_sn2201 *nvsw_sn2201)
-{
-	nvsw_sn2201->i2c_data = &nvsw_sn2201_i2c_data;
-
-	/* Register I2C controller. */
-	nvsw_sn2201->i2c_data->handle = nvsw_sn2201;
-	nvsw_sn2201->i2c_data->completion_notify = nvsw_sn2201_i2c_completion_notify;
-	nvsw_sn2201->pdev_i2c = platform_device_register_resndata(nvsw_sn2201->dev, "i2c_mlxcpld",
-								  NVSW_SN2201_MAIN_MUX_NR,
-								  nvsw_sn2201_lpc_res,
-								  ARRAY_SIZE(nvsw_sn2201_lpc_res),
-								  nvsw_sn2201->i2c_data,
-								  sizeof(*nvsw_sn2201->i2c_data));
-	if (IS_ERR(nvsw_sn2201->pdev_i2c))
-		return PTR_ERR(nvsw_sn2201->pdev_i2c);
-
-	return 0;
-}
-
-static int nvsw_sn2201_probe(struct platform_device *pdev)
-{
-	struct nvsw_sn2201 *nvsw_sn2201;
-
-	nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
-	if (!nvsw_sn2201)
-		return -ENOMEM;
-
-	nvsw_sn2201->dev = &pdev->dev;
-	platform_set_drvdata(pdev, nvsw_sn2201);
-	platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
-				      ARRAY_SIZE(nvsw_sn2201_lpc_io_resources));
-
-	nvsw_sn2201->main_mux_deferred_nr = NVSW_SN2201_MAIN_MUX_DEFER_NR;
-	nvsw_sn2201->main_mux_devs = nvsw_sn2201_main_mux_brdinfo;
-	nvsw_sn2201->cpld_devs = nvsw_sn2201_cpld_brdinfo;
-	nvsw_sn2201->sn2201_devs = nvsw_sn2201_static_brdinfo;
-	nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_static_brdinfo);
-
-	return nvsw_sn2201_config_pre_init(nvsw_sn2201);
-}
-
-static int nvsw_sn2201_remove(struct platform_device *pdev)
-{
-	struct nvsw_sn2201 *nvsw_sn2201 = platform_get_drvdata(pdev);
-
-	/* Unregister underlying drivers. */
-	nvsw_sn2201_config_exit(nvsw_sn2201);
-
-	/* Destroy SN2201 static I2C devices. */
-	nvsw_sn2201_destroy_static_devices(nvsw_sn2201,
-					   nvsw_sn2201->sn2201_devs,
-					   nvsw_sn2201->sn2201_devs_num);
-
-	i2c_put_adapter(nvsw_sn2201->cpld_devs->adapter);
-	nvsw_sn2201->cpld_devs->adapter = NULL;
-	/* Destroy main mux device. */
-	nvsw_sn2201_destroy_static_devices(nvsw_sn2201,
-					   nvsw_sn2201->main_mux_devs,
-					   nvsw_sn2201->main_mux_devs_num);
-
-	/* Unregister I2C controller. */
-	if (nvsw_sn2201->pdev_i2c)
-		platform_device_unregister(nvsw_sn2201->pdev_i2c);
-
-	return 0;
-}
-
-static const struct acpi_device_id nvsw_sn2201_acpi_ids[] = {
-	{"NVSN2201", 0},
-	{}
-};
-
-MODULE_DEVICE_TABLE(acpi, nvsw_sn2201_acpi_ids);
-
-static struct platform_driver nvsw_sn2201_driver = {
-	.probe = nvsw_sn2201_probe,
-	.remove = nvsw_sn2201_remove,
-	.driver = {
-		.name = "nvsw-sn2201",
-	.acpi_match_table = nvsw_sn2201_acpi_ids,
-	},
-};
-
-module_platform_driver(nvsw_sn2201_driver);
-
-MODULE_AUTHOR("Nvidia");
-MODULE_DESCRIPTION("Nvidia sn2201 platform driver");
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("platform:nvsw-sn2201");
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic_health
+Date:		June 2018
+KernelVersion:	4.19
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file shows ASIC health status. The possible values are:
+		0 - health failed, 2 - health OK, 3 - ASIC in booting state.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld1_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld2_version
+Date:		June 2018
+KernelVersion:	4.19
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show with which CPLD versions have been burned
+		on carrier and switch boards.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_dir
+Date:		December 2018
+KernelVersion:	5.0
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file shows the system fans direction:
+		forward direction - relevant bit is set 0;
+		reversed direction - relevant bit is set 1.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version
+Date:		November 2018
+KernelVersion:	5.0
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show with which CPLD versions have been burned
+		on LED or Gearbox board.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_enable
+Date:		November 2018
+KernelVersion:	5.0
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files enable and disable the access to the JTAG domain.
+		By default access to the JTAG domain is disabled.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/select_iio
+Date:		June 2018
+KernelVersion:	4.19
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file allows iio devices selection.
+
+		Attribute select_iio can be written with 0 or with 1. It
+		selects which one of iio devices can be accessed.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu1_on
+		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu2_on
+		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pwr_cycle
+		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pwr_down
+Date:		June 2018
+KernelVersion:	4.19
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files allow asserting system power cycling, switching
+		power supply units on and off and system's main power domain
+		shutdown.
+		Expected behavior:
+		When pwr_cycle is written 1: auxiliary power domain will go
+		down and after short period (about 1 second) up.
+		When  psu1_on or psu2_on is written 1, related unit will be
+		disconnected from the power source, when written 0 - connected.
+		If both are written 1 - power supplies main power domain will
+		go down.
+		When pwr_down is written 1, system's main power domain will go
+		down.
+
+		The files are write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_aux_pwr_or_ref
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_asic_thermal
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_hotswap_or_halt
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_hotswap_or_wd
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_fw_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_long_pb
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_main_pwr_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_short_pb
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sw_reset
+Date:		June 2018
+KernelVersion:	4.19
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show the system reset cause, as following: power
+		auxiliary outage or power refresh, ASIC thermal shutdown, halt,
+		hotswap, watchdog, firmware reset, long press power button,
+		short press power button, software reset. Value 1 in file means
+		this is reset cause, 0 - otherwise. Only one of the above
+		causes could be 1 at the same time, representing only last
+		reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_pwr_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_from_comex
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_system
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_voltmon_upgrade_fail
+Date:		November 2018
+KernelVersion:	5.0
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show the system reset cause, as following: ComEx
+		power fail, reset from ComEx, system platform reset, reset
+		due to voltage monitor devices upgrade failure,
+		Value 1 in file means this is reset cause, 0 - otherwise.
+		Only one bit could be 1 at the same time, representing only
+		the last reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version
+Date:		November 2018
+KernelVersion:	5.0
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show with which CPLD versions have been burned
+		on LED board.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_thermal
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_wd
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_from_asic
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_reload_bios
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sff_wd
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_wd
+Date:		June 2019
+KernelVersion:	5.3
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show the system reset cause, as following:
+		COMEX thermal shutdown; wathchdog power off or reset was derived
+		by one of the next components: COMEX, switch board or by Small Form
+		Factor mezzanine, reset requested from ASIC, reset caused by BIOS
+		reload. Value 1 in file means this is reset cause, 0 - otherwise.
+		Only one of the above causes could be 1 at the same time, representing
+		only last reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config1
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config2
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show system static topology identification
+		like system's static I2C topology, number and type of FPGA
+		devices within the system and so on.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_ac_pwr_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_platform
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_soc
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sw_pwr_off
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show the system reset causes, as following: reset
+		due to AC power failure, reset invoked from software by
+		assertion reset signal through CPLD. reset caused by signal
+		asserted by SOC through ACPI register, reset invoked from
+		software by assertion power off signal through CPLD.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pcie_asic_reset_dis
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file allows to retain ASIC up during PCIe root complex
+		reset, when attribute is set 1.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/vpd_wp
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file allows to overwrite system VPD hardware write
+		protection when attribute is set 1.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/voltreg_update_status
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file exposes the configuration update status of burnable
+		voltage regulator devices. The status values are as following:
+		0 - OK; 1 - CRC failure; 2 = I2C failure; 3 - in progress.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/ufm_version
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file exposes the firmware version of burnable voltage
+		regulator devices.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld1_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld2_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld1_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld2_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version_min
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show with which CPLD part numbers and minor
+		versions have been burned CPLD devices equipped on a
+		system.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_active_image
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_auth_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_upgrade_fail
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	The files represent BIOS statuses:
+
+		bios_active_image: location of current active BIOS image:
+		0: Top, 1: Bottom.
+		The reported value should correspond to value expected by OS
+		in case of BIOS safe mode is 0. This bit is related to Intel
+		top-swap feature of DualBios on the same flash.
+
+		bios_auth_fail: BIOS upgrade is failed because provided BIOS
+		image is not signed correctly.
+
+		bios_upgrade_fail: BIOS upgrade is failed by some other
+		reason not because authentication. For example due to
+		physical SPI flash problem.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_enable
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow line cards enable state control.
+		Expected behavior:
+		When  lc{n}_enable is written 1, related line card is released
+		from the reset state, when 0 - is hold in reset state.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_pwr
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files switching line cards power on and off.
+		Expected behavior:
+		When  lc{n}_pwr is written 1, related line card is powered
+		on, when written 0 - powered off.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_rst_mask
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files clear line card reset bit enforced by ASIC, when it
+		sets it due to some abnormal ASIC behavior.
+		Expected behavior:
+		When lc{n}_rst_mask is written 1, related line card reset bit
+		is cleared, when written 0 - no effect.
+
+		The files are write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/os_started
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file, when written 1, indicates to programmable devices
+		that OS is taking control over it.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pm_mgmt_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file assigns power management control ownership.
+		When power management control is provided by hardware, hardware
+		will automatically power off one or more line previously
+		powered line cards in case system power budget is getting
+		insufficient. It could be in case when some of power units lost
+		power good state.
+		When pm_mgmt_en is written 1, power management control by
+		software is enabled, 0 - power management control by hardware.
+		Note that for any setting of pm_mgmt_en attribute hardware will
+		not allow to power on any new line card in case system power
+		budget is insufficient.
+		Same in case software will try to power on several line cards
+		at once - hardware will power line cards while system has
+		enough power budget.
+		Default is 0.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu3_on
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu4_on
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files switching power supply units on and off.
+		Expected behavior:
+		When  psu3_on or psu4_on is written 1, related unit will be
+		disconnected from the power source, when written 0 - connected.
+
+		The files are write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file allows to unlock ASIC after thermal shutdown event.
+		When system thermal shutdown is enforced by ASIC, ASIC is
+		getting locked and after system boot it will not be available.
+		Software can decide to unlock it by setting this attribute to
+		1 and then perform system power cycle by setting pwr_cycle
+		attribute to 1 (power cycle of main power domain).
+		Before setting shutdown_unlock to 1 it is recommended to
+		validate that system reboot cause is reset_asic_thermal or
+		reset_thermal_spc_or_pciesw.
+		In case shutdown_unlock is not set 1, the only way to release
+		ASIC from locking - is full system power cycle through the
+		external power distribution unit.
+		Default is 1.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_pn
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version_min
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which CPLD major and minor versions
+		and part number has been burned CPLD device on line card.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_pn
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version_min
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which FPGA major and minor versions
+		and part number has been burned FPGA device on line card.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/vpd_wp
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file allow to overwrite line card VPD hardware write
+		protection mode. When attribute is set 1 - write protection is
+		disabled, when 0 - enabled.
+		Default is 0.
+		If the system is in locked-down mode writing this file will not
+		be allowed.
+		The purpose if this file is to allow line card VPD burning
+		during production flow.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_ref
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_dc_dc_pwr_fail
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_fpga_not_done
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_from_chassis
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_line_card
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_pwr_off_from_chassis
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show the line reset cause, as following: power
+		auxiliary outage or power refresh, DC-to-DC power failure, FPGA reset
+		failed, line card reset failed, power off from chassis.
+		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
+		the above causes could be 1 at the same time, representing only last
+		reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld_upgrade_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_upgrade_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow CPLD and FPGA burning. Value 1 in file means burning
+		is enabled, 0 - otherwise.
+		If the system is in locked-down mode writing these files will
+		not be allowed.
+		The purpose of these files to allow line card CPLD and FPGA
+		upgrade through the JTAG daisy-chain.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/qsfp_pwr_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/pwr_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow to power on/off all QSFP ports and whole line card.
+		The attributes are set 1 for power on, 0 - for power off.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/agb_spi_burn_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_spi_burn_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow gearboxes and FPGA SPI flash burning.
+		The attributes are set 1 to enable burning, 0 - to disable.
+		If the system is in locked-down mode writing these files will
+		not be allowed.
+		The purpose of these files to allow line card Gearboxes and FPGA
+		burning during production flow.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/max_power
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/config
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files provide the maximum powered required for line card
+		feeding and line card configuration Id.
+
+		The files are read only.
+
+What:           /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/phy_reset
+Date:           May 2022
+KernelVersion:  5.19
+Contact:        Vadim Pasternak <vadimpmellanox.com>
+Description:    This file allows to reset PHY 88E1548 when attribute is set 0
+                due to some abnormal PHY behavior.
+                Expected behavior:
+                When phy_reset is written 1, all PHY 88E1548 are released
+                from the reset state, when 0 - are hold in reset state.
+
+                The files are read/write.
+
+What:           /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/mac_reset
+Date:           May 2022
+KernelVersion:  5.19
+Contact:        Vadim Pasternak <vadimpmellanox.com>
+Description:    This file allows to reset ASIC MT52132 when attribute is set 0
+                due to some abnormal ASIC behavior.
+                Expected behavior:
+                When mac_reset is written 1, the ASIC MT52132 is released
+                from the reset state, when 0 - is hold in reset state.
+
+                The files are read/write.
+
+What:           /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/qsfp_pwr_good
+Date:           May 2022
+KernelVersion:  5.19
+Contact:        Vadim Pasternak <vadimpmellanox.com>
+Description:    This file shows QSFP ports power status. The value is set to 0
+                when one of any QSFP ports is plugged. The value is set to 1 when
+                there are no any QSFP ports are plugged.
+                The possible values are:
+                0 - Power good, 1 - Not power good.
+
+                The files are read only.
-- 
2.14.1


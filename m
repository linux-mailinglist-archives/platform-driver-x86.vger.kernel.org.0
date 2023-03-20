Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474876C24F5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Mar 2023 23:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjCTWzm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Mar 2023 18:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCTWzl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 18:55:41 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768AB12F14
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 15:55:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi9so16877974lfb.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679352938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg674+CwdF1DWaodNRKlpUhiwO6jz1ZylfHw+Sev8pY=;
        b=lgZX7eqwYgEg3+Ucj9fCTiOAnEuJuxkqiTMJoiIUi8dLrM8pbjU+Gxa793nofSZHTv
         duJcl2gWb+nVmZ1aD0WL194h0bWcoZSfPzvxspZd2rw4CmavmimeY98Ei0XV9Tu5pSFl
         X8TFJLoAVAiCi9aGFAlQl1p8AdL0xbsBIYMcS6RskYXXB2nDWWwlvpJiMK2oztPy6MFi
         IpGLDNdzKXzgjAS8xhiz1herpjnz3t/iegBHfwu2dPLSZyq3wPbeTdb5IWioHsl8lHTi
         nTN5W1B3qqklI88UIx51b1ThKzGWENVNY2B0uMN3r8FV/wXDO51X6goah/0a6XxS1KaJ
         Wgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679352938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg674+CwdF1DWaodNRKlpUhiwO6jz1ZylfHw+Sev8pY=;
        b=pEHUZvqcDgVes1m88Gk9NlYXtAOaBCGqzStojD5zLzabprR2fHblEByddG5LdYtSU8
         wJEHTbwFIGkmNo1Z2vQ6ztkbEAtNdTh9yJs+HkWonVLW9m0nSS82ICiic8JLkal0f3LL
         5GKPTv8+i6hCQdjciP780vzlebvl0FGY0izHJC29tQwX3hndMCrnGRH9+8/SxH1vwFcp
         xpOj10/cQjFp6Oh7yxyd/nacFQaft6KSE5mKvkcC4CWHhD030fRFjXC/gx8hW3uDTOYt
         caO9LmccUKq8+/IGX8OuZ4JC0PhhKf6ypT2R3SJbLTZR8LCf7FZQ8EV2WLjExjP7ATnA
         ZLTw==
X-Gm-Message-State: AO0yUKUDRZ3YEkmwqvFRhOCuypxLWmWBiaZeHe09EhetU2O5U7vS69h/
        c1TqU5Pe3G/cNcnM5dO7DeQ=
X-Google-Smtp-Source: AK7set9O67qbY55Uv7KQNIF5ltEkg8d9a2Xnw4zELgEfwAqP65IR6vIjsgw66ZYB3vhmvn3FthtNBw==
X-Received: by 2002:a19:f513:0:b0:4d1:3d1d:4914 with SMTP id j19-20020a19f513000000b004d13d1d4914mr146414lfb.33.1679352937573;
        Mon, 20 Mar 2023 15:55:37 -0700 (PDT)
Received: from localhost.localdomain ([217.107.126.146])
        by smtp.gmail.com with ESMTPSA id d27-20020ac2545b000000b004ab52b0bcf9sm1866780lfn.207.2023.03.20.15.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:55:37 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH v3] platform/x86: Add new msi-ec driver
Date:   Tue, 21 Mar 2023 01:55:09 +0300
Message-Id: <20230320225509.3559-1-teackot@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new driver to allow various MSI laptops' functionalities to be
controlled from userspace. This includes such features as power
profiles (aka shift modes), fan speed, charge thresholds, LEDs, etc.

This driver contains EC memory configurations for different firmware
versions and exports battery charge thresholds to userspace (note,
that start and end thresholds control the same EC parameter
and are always 10% apart).

Link: https://github.com/BeardOverflow/msi-ec/
Discussion: https://github.com/BeardOverflow/msi-ec/pull/13
Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
Changes in v2:
- fix checkpatch issues:
  - update MAINTAINERS
  - fix SPDX license identifier
  - use __initconst for const init definitions
  - minor formatting
- omit commas after sentinel entries
- use pr_fmt macro to automatically prefix messages
- remove a redundant ACPI check
- in ec_read_seq(): define the counter in the for loop header,
  make i and len the same type
- better error handling in msi_battery_add()
- use sysfs_emit() instead of sprintf()
- catch up with the main driver repo:
  - add new configurations
  - add compatible EC FW versions to existing configurations
  - allow fan_mode parameter to have a custom set of modes
  - add MSI_EC_ADDR_UNKNOWN and MSI_EC_ADDR_UNSUPP = 0xff01 to specify
    unknown addresses and unsupported parameters. When converted to u8,
    they evaluate to 0x01, which is a readonly address in MSI EC,
    so in case of bugs writing to them should be safe
  - use sentinel entries for modes arrays

Changes in v3:
- function style consistency
- change comments style
- simplify searching for a suitable conf
- log the not supported version with pr_warn
- add modaliases

 MAINTAINERS                   |   7 +
 drivers/platform/x86/Kconfig  |   7 +
 drivers/platform/x86/Makefile |   1 +
 drivers/platform/x86/msi-ec.c | 913 ++++++++++++++++++++++++++++++++++
 drivers/platform/x86/msi-ec.h | 122 +++++
 5 files changed, 1050 insertions(+)
 create mode 100644 drivers/platform/x86/msi-ec.c
 create mode 100644 drivers/platform/x86/msi-ec.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fb1471cb5ed3..651578a14360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14191,6 +14191,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/ieee802154/mrf24j40.txt
 F:	drivers/net/ieee802154/mrf24j40.c
 
+MSI EC DRIVER
+M:	Nikita Kravets <teackot@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+W:	https://github.com/BeardOverflow/msi-ec
+F:	drivers/platform/x86/msi-ec.*
+
 MSI LAPTOP SUPPORT
 M:	"Lee, Chun-Yi" <jlee@suse.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2d26..4534d11f9ca5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -644,6 +644,13 @@ config THINKPAD_LMI
 
 source "drivers/platform/x86/intel/Kconfig"
 
+config MSI_EC
+	tristate "MSI EC Extras"
+	depends on ACPI
+	help
+	  This driver allows various MSI laptops' functionalities to be
+	  controlled from userspace, including battery charge threshold.
+
 config MSI_LAPTOP
 	tristate "MSI Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1d3d1b02541b..7cc2beca8208 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-y				+= intel/
 
 # MSI
+obj-$(CONFIG_MSI_EC)		+= msi-ec.o
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
 obj-$(CONFIG_MSI_WMI)		+= msi-wmi.o
 
diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
new file mode 100644
index 000000000000..76450d9c6a22
--- /dev/null
+++ b/drivers/platform/x86/msi-ec.c
@@ -0,0 +1,913 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * msi-ec: MSI laptops' embedded controller driver.
+ *
+ * This driver allows various MSI laptops' functionalities to be
+ * controlled from userspace.
+ *
+ * It contains EC memory configurations for different firmware versions
+ * and exports battery charge thresholds to userspace.
+ *
+ * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es>
+ * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev>
+ * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include "msi-ec.h"
+
+#include <acpi/battery.h>
+#include <linux/acpi.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/string.h>
+
+static const char *const SM_ECO_NAME       = "eco";
+static const char *const SM_COMFORT_NAME   = "comfort";
+static const char *const SM_SPORT_NAME     = "sport";
+static const char *const SM_TURBO_NAME     = "turbo";
+
+static const char *const FM_AUTO_NAME     = "auto";
+static const char *const FM_SILENT_NAME   = "silent";
+static const char *const FM_BASIC_NAME    = "basic";
+static const char *const FM_ADVANCED_NAME = "advanced";
+
+static const char * const ALLOWED_FW_0[] __initconst = {
+	"14C1EMS1.012",
+	"14C1EMS1.101",
+	"14C1EMS1.102",
+	NULL
+};
+
+static struct msi_ec_conf CONF0 __initdata = {
+	.allowed_fw = ALLOWED_FW_0,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xbf,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = MSI_EC_ADDR_UNKNOWN, // 0xd5 needs testing
+	},
+	.fan_mode = {
+		.address = 0xf4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_BASIC_NAME,    0x4d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xf3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_1[] __initconst = {
+	"17F2EMS1.103",
+	"17F2EMS1.104",
+	"17F2EMS1.106",
+	"17F2EMS1.107",
+	NULL
+};
+
+static struct msi_ec_conf CONF1 __initdata = {
+	.allowed_fw = ALLOWED_FW_1,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xbf,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			{ SM_TURBO_NAME,   0xc4 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = MSI_EC_ADDR_UNKNOWN,
+	},
+	.fan_mode = {
+		.address = 0xf4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_BASIC_NAME,    0x4d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xf3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_2[] __initconst = {
+	"1552EMS1.118",
+	NULL
+};
+
+static struct msi_ec_conf CONF2 __initdata = {
+	.allowed_fw = ALLOWED_FW_2,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = 0xeb,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_BASIC_NAME,    0x4d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2c,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_3[] __initconst = {
+	"1592EMS1.111",
+	"E1592IMS.10C",
+	NULL
+};
+
+static struct msi_ec_conf CONF3 __initdata = {
+	.allowed_fw = ALLOWED_FW_3,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = 0xeb,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_BASIC_NAME,    0x4d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0xc9,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89, // ?
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_4[] __initconst = {
+	"16V4EMS1.114",
+	NULL
+};
+
+static struct msi_ec_conf CONF4 __initdata = {
+	.allowed_fw = ALLOWED_FW_4,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = MSI_EC_ADDR_UNKNOWN, // supported, but unknown
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = { // may be supported, but address is unknown
+		.address = MSI_EC_ADDR_UNKNOWN,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68, // needs testing
+		.rt_fan_speed_address  = 0x71, // needs testing
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNKNOWN,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
+	},
+	.leds = {
+		.micmute_led_address = MSI_EC_ADDR_UNKNOWN,
+		.mute_led_address    = MSI_EC_ADDR_UNKNOWN,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = MSI_EC_ADDR_UNSUPP, // 0xd3, not functional
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_5[] __initconst = {
+	"158LEMS1.103",
+	"158LEMS1.105",
+	"158LEMS1.106",
+	NULL
+};
+
+static struct msi_ec_conf CONF5 __initdata = {
+	.allowed_fw = ALLOWED_FW_5,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = { // todo: reverse
+		.address = 0xbf,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_TURBO_NAME,   0xc4 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = { // unsupported?
+		.address = MSI_EC_ADDR_UNKNOWN,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xf4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68, // needs testing
+		.rt_fan_speed_address  = 0x71, // needs testing
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = MSI_EC_ADDR_UNKNOWN,
+		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = MSI_EC_ADDR_UNSUPP, // 0xf3, not functional
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_6[] __initconst = {
+	"1542EMS1.102",
+	"1542EMS1.104",
+	NULL
+};
+
+static struct msi_ec_conf CONF6 __initdata = {
+	.allowed_fw = ALLOWED_FW_6,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = MSI_EC_ADDR_UNSUPP,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xbf, // todo: reverse
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			{ SM_TURBO_NAME,   0xc4 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = 0xd5,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xf4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0xc9,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
+	},
+	.leds = {
+		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
+		.mute_led_address    = MSI_EC_ADDR_UNSUPP,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = MSI_EC_ADDR_UNSUPP, // 0xf3, not functional
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_7[] __initconst = {
+	"17FKEMS1.108",
+	"17FKEMS1.109",
+	"17FKEMS1.10A",
+	NULL
+};
+
+static struct msi_ec_conf CONF7 __initdata = {
+	.allowed_fw = ALLOWED_FW_7,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = MSI_EC_ADDR_UNSUPP,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xbf, // needs testing
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			{ SM_TURBO_NAME,   0xc4 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = MSI_EC_ADDR_UNKNOWN, // 0xd5 but has its own wet of modes
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xf4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d }, // d may not be relevant
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0xc9, // needs testing
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = MSI_EC_ADDR_UNKNOWN,
+		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
+	},
+	.leds = {
+		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
+		.mute_led_address    = 0x2c,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xf3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static struct msi_ec_conf *CONFIGS[] __initdata = {
+	&CONF0,
+	&CONF1,
+	&CONF2,
+	&CONF3,
+	&CONF4,
+	&CONF5,
+	&CONF6,
+	&CONF7,
+	NULL
+};
+
+static struct msi_ec_conf conf; // current configuration
+
+/*
+ * Helper functions
+ */
+
+static int ec_read_seq(u8 addr, u8 *buf, u8 len)
+{
+	int result;
+
+	for (u8 i = 0; i < len; i++) {
+		result = ec_read(addr + i, buf + i);
+		if (result < 0)
+			return result;
+	}
+
+	return 0;
+}
+
+static int ec_get_firmware_version(u8 buf[MSI_EC_FW_VERSION_LENGTH + 1])
+{
+	int result;
+
+	memset(buf, 0, MSI_EC_FW_VERSION_LENGTH + 1);
+	result = ec_read_seq(MSI_EC_FW_VERSION_ADDRESS,
+			     buf,
+			     MSI_EC_FW_VERSION_LENGTH);
+	if (result < 0)
+		return result;
+
+	return MSI_EC_FW_VERSION_LENGTH + 1;
+}
+
+/*
+ * Sysfs power_supply subsystem
+ */
+
+static ssize_t charge_control_threshold_show(u8 offset,
+					     struct device *device,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	u8 rdata;
+	int result;
+
+	result = ec_read(conf.charge_control.address, &rdata);
+	if (result < 0)
+		return result;
+
+	return sysfs_emit(buf, "%i\n", rdata - offset);
+}
+
+static ssize_t charge_control_threshold_store(u8 offset,
+					      struct device *dev,
+					      struct device_attribute *attr,
+					      const char *buf, size_t count)
+{
+	u8 wdata;
+	int result;
+
+	result = kstrtou8(buf, 10, &wdata);
+	if (result < 0)
+		return result;
+
+	wdata += offset;
+	if (wdata < conf.charge_control.range_min ||
+	    wdata > conf.charge_control.range_max)
+		return -EINVAL;
+
+	result = ec_write(conf.charge_control.address, wdata);
+	if (result < 0)
+		return result;
+
+	return count;
+}
+
+static ssize_t charge_control_start_threshold_show(struct device *device,
+						   struct device_attribute *attr,
+						   char *buf)
+{
+	return charge_control_threshold_show(conf.charge_control.offset_start,
+					     device, attr, buf);
+}
+
+static ssize_t charge_control_start_threshold_store(struct device *dev,
+						    struct device_attribute *attr,
+						    const char *buf, size_t count)
+{
+	return charge_control_threshold_store(conf.charge_control.offset_start,
+					      dev, attr, buf, count);
+}
+
+static ssize_t charge_control_end_threshold_show(struct device *device,
+						 struct device_attribute *attr,
+						 char *buf)
+{
+	return charge_control_threshold_show(conf.charge_control.offset_end,
+					     device, attr, buf);
+}
+
+static ssize_t charge_control_end_threshold_store(struct device *dev,
+						  struct device_attribute *attr,
+						  const char *buf, size_t count)
+{
+	return charge_control_threshold_store(conf.charge_control.offset_end,
+					      dev, attr, buf, count);
+}
+
+static DEVICE_ATTR_RW(charge_control_start_threshold);
+static DEVICE_ATTR_RW(charge_control_end_threshold);
+
+static struct attribute *msi_battery_attrs[] = {
+	&dev_attr_charge_control_start_threshold.attr,
+	&dev_attr_charge_control_end_threshold.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(msi_battery);
+
+static int msi_battery_add(struct power_supply *battery,
+			   struct acpi_battery_hook *hook)
+{
+	return device_add_groups(&battery->dev, msi_battery_groups);
+}
+
+static int msi_battery_remove(struct power_supply *battery,
+			      struct acpi_battery_hook *hook)
+{
+	device_remove_groups(&battery->dev, msi_battery_groups);
+	return 0;
+}
+
+static struct acpi_battery_hook battery_hook = {
+	.add_battery = msi_battery_add,
+	.remove_battery = msi_battery_remove,
+	.name = MSI_EC_DRIVER_NAME,
+};
+
+/*
+ * Module load/unload
+ */
+
+static const struct dmi_system_id msi_dmi_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "Micro-Star International Co., Ltd."),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				  "MICRO-STAR INTERNATIONAL CO., LTD"),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, msi_dmi_table);
+
+static int __init load_configuration(void)
+{
+	int result;
+
+	u8 fw_version[MSI_EC_FW_VERSION_LENGTH + 1];
+
+	// get firmware version
+	result = ec_get_firmware_version(fw_version);
+	if (result < 0)
+		return result;
+
+	// load the suitable configuration, if exists
+	for (int i = 0; CONFIGS[i]; i++) {
+		if (match_string(CONFIGS[i]->allowed_fw, -1, fw_version) != -EINVAL) {
+			conf = *CONFIGS[i];
+			conf.allowed_fw = NULL;
+			return 0;
+		}
+	}
+
+	// config not found
+
+	for (int i = 0; i < MSI_EC_FW_VERSION_LENGTH; i++) {
+		if (!isgraph(fw_version[i])) {
+			pr_warn("Unable to find a valid firmware version!\n");
+			return -EOPNOTSUPP;
+		}
+	}
+
+	pr_warn("Firmware version is not supported: '%s'\n", fw_version);
+	return -EOPNOTSUPP;
+}
+
+static int __init msi_ec_init(void)
+{
+	int result;
+
+	result = load_configuration();
+	if (result < 0)
+		return result;
+
+	battery_hook_register(&battery_hook);
+
+	pr_info("module_init\n");
+	return 0;
+}
+
+static void __exit msi_ec_exit(void)
+{
+	battery_hook_unregister(&battery_hook);
+
+	pr_info("module_exit\n");
+}
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jose Angel Pastrana <japp0005@red.ujaen.es>");
+MODULE_AUTHOR("Aakash Singh <mail@singhaakash.dev>");
+MODULE_AUTHOR("Nikita Kravets <teackot@gmail.com>");
+MODULE_DESCRIPTION("MSI Embedded Controller");
+
+module_init(msi_ec_init);
+module_exit(msi_ec_exit);
diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.h
new file mode 100644
index 000000000000..be3533dc9cc6
--- /dev/null
+++ b/drivers/platform/x86/msi-ec.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * msi-ec: MSI laptops' embedded controller driver.
+ *
+ * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es>
+ * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev>
+ * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com>
+ */
+
+#ifndef _MSI_EC_H_
+#define _MSI_EC_H_
+
+#include <linux/types.h>
+
+#define MSI_EC_DRIVER_NAME "msi-ec"
+
+#define MSI_EC_ADDR_UNKNOWN 0xff01 // unknown address
+#define MSI_EC_ADDR_UNSUPP  0xff01 // unsupported parameter
+
+// Firmware info addresses are universal
+#define MSI_EC_FW_VERSION_ADDRESS 0xa0
+#define MSI_EC_FW_DATE_ADDRESS    0xac
+#define MSI_EC_FW_TIME_ADDRESS    0xb4
+#define MSI_EC_FW_VERSION_LENGTH  12
+#define MSI_EC_FW_DATE_LENGTH     8
+#define MSI_EC_FW_TIME_LENGTH     8
+
+struct msi_ec_charge_control_conf {
+	int address;
+	int offset_start;
+	int offset_end;
+	int range_min;
+	int range_max;
+};
+
+struct msi_ec_webcam_conf {
+	int address;
+	int block_address;
+	int bit;
+};
+
+struct msi_ec_fn_super_swap_conf {
+	int address;
+	int bit;
+};
+
+struct msi_ec_cooler_boost_conf {
+	int address;
+	int bit;
+};
+
+#define MSI_EC_MODE_NULL { NULL, 0 }
+struct msi_ec_mode {
+	const char *name;
+	int value;
+};
+
+struct msi_ec_shift_mode_conf {
+	int address;
+	struct msi_ec_mode modes[5]; // fixed size for easier hard coding
+};
+
+struct msi_ec_super_battery_conf {
+	int address;
+	int mask;
+};
+
+struct msi_ec_fan_mode_conf {
+	int address;
+	struct msi_ec_mode modes[5]; // fixed size for easier hard coding
+};
+
+struct msi_ec_cpu_conf {
+	int rt_temp_address;
+	int rt_fan_speed_address; // realtime
+	int rt_fan_speed_base_min;
+	int rt_fan_speed_base_max;
+	int bs_fan_speed_address; // basic
+	int bs_fan_speed_base_min;
+	int bs_fan_speed_base_max;
+};
+
+struct msi_ec_gpu_conf {
+	int rt_temp_address;
+	int rt_fan_speed_address; // realtime
+};
+
+struct msi_ec_led_conf {
+	int micmute_led_address;
+	int mute_led_address;
+	int bit;
+};
+
+#define MSI_EC_KBD_BL_STATE_MASK 0x3
+struct msi_ec_kbd_bl_conf {
+	int bl_mode_address;
+	int bl_modes[2];
+	int max_mode;
+
+	int bl_state_address;
+	int state_base_value;
+	int max_state;
+};
+
+struct msi_ec_conf {
+	const char * const *allowed_fw;
+
+	struct msi_ec_charge_control_conf charge_control;
+	struct msi_ec_webcam_conf         webcam;
+	struct msi_ec_fn_super_swap_conf  fn_super_swap;
+	struct msi_ec_cooler_boost_conf   cooler_boost;
+	struct msi_ec_shift_mode_conf     shift_mode;
+	struct msi_ec_super_battery_conf  super_battery;
+	struct msi_ec_fan_mode_conf       fan_mode;
+	struct msi_ec_cpu_conf            cpu;
+	struct msi_ec_gpu_conf            gpu;
+	struct msi_ec_led_conf            leds;
+	struct msi_ec_kbd_bl_conf         kbd_bl;
+};
+
+#endif // _MSI_EC_H_
-- 
2.39.2


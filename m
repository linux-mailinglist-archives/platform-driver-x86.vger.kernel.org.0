Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4451B6158
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Apr 2020 18:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbgDWQzH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Apr 2020 12:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729685AbgDWQzG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Apr 2020 12:55:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A208CC09B042
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2020 09:55:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t40so2752162pjb.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2020 09:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P9YF2t0kIlCz7NBMKBCJWsyoVOkVah3E6+qynGVS3ag=;
        b=YRCsweH0fhYnFbIEUMoPpdcHBYsWmKHHCwUbQ+rhSE5sosb4iyG9Rm1Zyt5uZFxicQ
         /dQUGAwI/VV0m0UebDGkCQSfDN1jAEneCnt4dKBVYMnIXYzeEUdTB5XcZFUsUFG3zHmU
         4keOMsOHo8fIqRcVZKQw7+68nwpoN3Rm8KHiUxt/wYgdlzhnTwyCtwjGtvi6UM3/2E9/
         ksIA8lR6idwMq2vvq1iYvFpbKMkttKAx6ul0SbneoRPwhGGzY7nvERqpCjOAAwqUcFvH
         2B/b6hqMIZgR1alMNs/9lFUb5R7WWfnq+jZ5VCRofykhGkuwmTv5m7OJiMO84GriV31T
         DDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=P9YF2t0kIlCz7NBMKBCJWsyoVOkVah3E6+qynGVS3ag=;
        b=A777DWZeIjx6YJX2dIuDQkaPKSIIXXNlv4mNw6kXE+Ompv0sfv94NSl9GSNmtB14ts
         sQvR4myxyG1l21JtSu/7VRSzHemVFNrzkwEdK9gcc6glrPOr0aCslPTEuxoC+B119cqI
         v7BNqXWwLDuj5Q/y9gWMKcszj3trIxDlgCB0TQt0zyFxoCEFHmdy4ZQSeYzRulBdrUTr
         p1sBEDHN061I+Chqaubvxz0g178RTNidkuus/69zPAmYxZnER5SZlwdyuWFNY7uOERCb
         tbakNVin7U04iHMhn8j/e0lEfgoOjC0uD9cq35v/ptWPrtD9URlMbz3wvBGxO7h60/V7
         yyjg==
X-Gm-Message-State: AGi0PuaOOI495cHcVhduxwAS3kAWOAkBBw7CtCBXwmL5KlEdEkDtmrEf
        CWHxuf5JHkqYbXdzADxH5knsfVztqr52qw==
X-Google-Smtp-Source: APiQypLT7HvI39XkWltwiHo1tumJ85/DgS/0haPciHKkjx/QNiQKe5wkDrC4Pj9IXEx6a7mfEGoHfA==
X-Received: by 2002:a17:902:6b07:: with SMTP id o7mr4449179plk.141.1587660906134;
        Thu, 23 Apr 2020 09:55:06 -0700 (PDT)
Received: from think ([2601:648:8200:13:3a44:3696:7ccb:e317])
        by smtp.gmail.com with ESMTPSA id o21sm2524502pgk.16.2020.04.23.09.55.05
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 23 Apr 2020 09:55:05 -0700 (PDT)
From:   Lars <larsh@apache.org>
To:     ibm-acpi@hmh.eng.br
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, kjslag@gmail.com,
        bastidoerner@gmail.com, nanodario@gmail.com, sassmann@kpanic.de,
        agk@godking.net, arc@osknowledge.org, Lars <larsh@apache.org>
Subject: [PATCH v3] thinkpad_acpi: Add support for dual fan control on select models
Date:   Thu, 23 Apr 2020 09:52:38 -0700
Message-Id: <20200423165238.54109-1-larsh@apache.org>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200417194344.22597-1-larsh@apache.org>
References: <20200417194344.22597-1-larsh@apache.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch allows controlling multiple fans as if they were a single fan.

This adds P52, P72, X1E, and X1E gen2 to dual fan quirks.
Both fans are controlled together.

Tested on an X1 Extreme Gen2.

The patch is defensive, it adds only specific supported machines, and falls
back to the old behavior if both fans cannot be controlled.

Background:
I tested the BIOS default behavior on my X1E gen2 and both fans are always
changed together. So rather than adding controls for each fan, this controls
both fans together as the BIOS would do.

This was inspired by a discussion on dual fan support for the thinkfan tool
[1]. Thanks to Github users voidworker and civic9.

The BIOS ids are taken from there. The X1E gen2 id is verified on my machine.

[1]: vmatare/thinkfan#58

Signed-off-by: Lars <larsh@apache.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 43 ++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index da794dcfdd92..5b2d30dba0c1 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -318,6 +318,7 @@ static struct {
 	u32 uwb:1;
 	u32 fan_ctrl_status_undef:1;
 	u32 second_fan:1;
+	u32 second_fan_ctl:1;
 	u32 beep_needs_two_args:1;
 	u32 mixer_no_level_control:1;
 	u32 battery_force_primary:1;
@@ -8325,11 +8326,19 @@ static int fan_set_level(int level)
 
 	switch (fan_control_access_mode) {
 	case TPACPI_FAN_WR_ACPI_SFAN:
-		if (level >= 0 && level <= 7) {
-			if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
-				return -EIO;
-		} else
+		if (((level < 0) || (level > 7)))
 			return -EINVAL;
+
+		if (tp_features.second_fan_ctl) {
+			if (!fan_select_fan2() ||
+			    !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
+				pr_warn("Couldn't set 2nd fan level, disabling support\n");
+				tp_features.second_fan_ctl = 0;
+			}
+			fan_select_fan1();
+		}
+		if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
+			return -EIO;
 		break;
 
 	case TPACPI_FAN_WR_ACPI_FANS:
@@ -8346,6 +8355,15 @@ static int fan_set_level(int level)
 		else if (level & TP_EC_FAN_AUTO)
 			level |= 4;	/* safety min speed 4 */
 
+		if (tp_features.second_fan_ctl) {
+			if (!fan_select_fan2() ||
+			    !acpi_ec_write(fan_status_offset, level)) {
+				pr_warn("Couldn't set 2nd fan level, disabling support\n");
+				tp_features.second_fan_ctl = 0;
+			}
+			fan_select_fan1();
+
+		}
 		if (!acpi_ec_write(fan_status_offset, level))
 			return -EIO;
 		else
@@ -8764,6 +8782,7 @@ static const struct attribute_group fan_attr_group = {
 
 #define TPACPI_FAN_Q1	0x0001		/* Unitialized HFSP */
 #define TPACPI_FAN_2FAN	0x0002		/* EC 0x31 bit 0 selects fan2 */
+#define TPACPI_FAN_2CTL	0x0004		/* selects fan2 control */
 
 static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8772,6 +8791,13 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
 	TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
 	TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
+	TPACPI_Q_LNV3('N', '1', 'D', TPACPI_FAN_2CTL),	/* P70 */
+	TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2CTL),	/* P50 */
+	TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),	/* P71 */
+	TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),	/* P51 */
+	TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),	/* P52 / P72 */
+	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* X1 Extreme (1st gen) */
+	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* X1 Extreme (2nd gen) */
 };
 
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8789,6 +8815,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 	fan_watchdog_maxinterval = 0;
 	tp_features.fan_ctrl_status_undef = 0;
 	tp_features.second_fan = 0;
+	tp_features.second_fan_ctl = 0;
 	fan_control_desired_level = 7;
 
 	if (tpacpi_is_ibm()) {
@@ -8813,8 +8840,12 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 				fan_quirk1_setup();
 			if (quirks & TPACPI_FAN_2FAN) {
 				tp_features.second_fan = 1;
-				dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
-					"secondary fan support enabled\n");
+				pr_info("secondary fan support enabled\n");
+			}
+			if (quirks & TPACPI_FAN_2CTL) {
+				tp_features.second_fan = 1;
+				tp_features.second_fan_ctl = 1;
+				pr_info("secondary fan control enabled\n");
 			}
 		} else {
 			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
-- 
2.25.3


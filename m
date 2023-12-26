Return-Path: <platform-driver-x86+bounces-641-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEE81E39A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 01:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D6F51C21028
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 00:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BC72B9B0;
	Tue, 26 Dec 2023 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0CsHKSG"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73D57316;
	Tue, 26 Dec 2023 00:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDD2C433C9;
	Tue, 26 Dec 2023 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550208;
	bh=Y9Rk+ZmzIa1zYoQ7jVKm9k5LFlldlI0d7s/Lq4pfnJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k0CsHKSGG4T42sFOVD/kB+3cgK3e/GEvoGUpH47iXGimWJOeiNEpVn7OBXeuLjiae
	 /E3eCW4/qwN3wg9y0AVn0VGVN/3IEufcZP8ozeNaFeceNHQg/hv03R0yAPDwHUr59D
	 ACsZTea6ZjAbGf8KaK3j/75e9QXWbKZppMD0u8PBSn/0YAwQCAZRHkU2RvzYYxcXSM
	 EsItVB3tUy2GnXTPywA2+wVNUKeO8UkJrCq6y6pq/UajsUQQibv+W/fikdY8DiuU/y
	 d9opoVejvlM5HDwmfedjpAQIlsCh/7b334HRWvoXgDANMTGv6MTK9DAhUN2iJ+CMn2
	 PZNFeRE3ZJUfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	hmh@hmh.eng.br,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/24] platform/x86: thinkpad_acpi: fix for incorrect fan reporting on some ThinkPad systems
Date: Mon, 25 Dec 2023 19:22:05 -0500
Message-ID: <20231226002255.5730-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002255.5730-1-sashal@kernel.org>
References: <20231226002255.5730-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.69
Content-Transfer-Encoding: 8bit

From: Vishnu Sankar <vishnuocv@gmail.com>

[ Upstream commit 66e92e23a72761f5b53f970aeb1badc5fd92fc74 ]

Some ThinkPad systems ECFW use non-standard addresses for fan control
and reporting. This patch adds support for such ECFW so that it can report
the correct fan values.
Tested on Thinkpads L13 Yoga Gen 2 and X13 Yoga Gen 2.

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/r/20231214134702.166464-1-vishnuocv@gmail.com
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 98 ++++++++++++++++++++++++----
 1 file changed, 85 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 05a55bc31c796..6edd2e294750e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8149,8 +8149,19 @@ static struct ibm_struct volume_driver_data = {
  * 	TPACPI_FAN_WR_TPEC is also available and should be used to
  * 	command the fan.  The X31/X40/X41 seems to have 8 fan levels,
  * 	but the ACPI tables just mention level 7.
+ *
+ * TPACPI_FAN_RD_TPEC_NS:
+ *	This mode is used for a few ThinkPads (L13 Yoga Gen2, X13 Yoga Gen2 etc.)
+ *	that are using non-standard EC locations for reporting fan speeds.
+ *	Currently these platforms only provide fan rpm reporting.
+ *
  */
 
+#define FAN_RPM_CAL_CONST 491520	/* FAN RPM calculation offset for some non-standard ECFW */
+
+#define FAN_NS_CTRL_STATUS	BIT(2)		/* Bit which determines control is enabled or not */
+#define FAN_NS_CTRL		BIT(4)		/* Bit which determines control is by host or EC */
+
 enum {					/* Fan control constants */
 	fan_status_offset = 0x2f,	/* EC register 0x2f */
 	fan_rpm_offset = 0x84,		/* EC register 0x84: LSB, 0x85 MSB (RPM)
@@ -8158,6 +8169,11 @@ enum {					/* Fan control constants */
 	fan_select_offset = 0x31,	/* EC register 0x31 (Firmware 7M)
 					   bit 0 selects which fan is active */
 
+	fan_status_offset_ns = 0x93,	/* Special status/control offset for non-standard EC Fan1 */
+	fan2_status_offset_ns = 0x96,	/* Special status/control offset for non-standard EC Fan2 */
+	fan_rpm_status_ns = 0x95,	/* Special offset for Fan1 RPM status for non-standard EC */
+	fan2_rpm_status_ns = 0x98,	/* Special offset for Fan2 RPM status for non-standard EC */
+
 	TP_EC_FAN_FULLSPEED = 0x40,	/* EC fan mode: full speed */
 	TP_EC_FAN_AUTO	    = 0x80,	/* EC fan mode: auto fan control */
 
@@ -8168,6 +8184,7 @@ enum fan_status_access_mode {
 	TPACPI_FAN_NONE = 0,		/* No fan status or control */
 	TPACPI_FAN_RD_ACPI_GFAN,	/* Use ACPI GFAN */
 	TPACPI_FAN_RD_TPEC,		/* Use ACPI EC regs 0x2f, 0x84-0x85 */
+	TPACPI_FAN_RD_TPEC_NS,		/* Use non-standard ACPI EC regs (eg: L13 Yoga gen2 etc.) */
 };
 
 enum fan_control_access_mode {
@@ -8195,6 +8212,8 @@ static u8 fan_control_desired_level;
 static u8 fan_control_resume_level;
 static int fan_watchdog_maxinterval;
 
+static bool fan_with_ns_addr;
+
 static struct mutex fan_mutex;
 
 static void fan_watchdog_fire(struct work_struct *ignored);
@@ -8325,6 +8344,15 @@ static int fan_get_status(u8 *status)
 		}
 
 		break;
+	case TPACPI_FAN_RD_TPEC_NS:
+		/* Default mode is AUTO which means controlled by EC */
+		if (!acpi_ec_read(fan_status_offset_ns, &s))
+			return -EIO;
+
+		if (status)
+			*status = s;
+
+		break;
 
 	default:
 		return -ENXIO;
@@ -8341,7 +8369,8 @@ static int fan_get_status_safe(u8 *status)
 	if (mutex_lock_killable(&fan_mutex))
 		return -ERESTARTSYS;
 	rc = fan_get_status(&s);
-	if (!rc)
+	/* NS EC doesn't have register with level settings */
+	if (!rc && !fan_with_ns_addr)
 		fan_update_desired_level(s);
 	mutex_unlock(&fan_mutex);
 
@@ -8368,7 +8397,13 @@ static int fan_get_speed(unsigned int *speed)
 
 		if (likely(speed))
 			*speed = (hi << 8) | lo;
+		break;
+	case TPACPI_FAN_RD_TPEC_NS:
+		if (!acpi_ec_read(fan_rpm_status_ns, &lo))
+			return -EIO;
 
+		if (speed)
+			*speed = lo ? FAN_RPM_CAL_CONST / lo : 0;
 		break;
 
 	default:
@@ -8380,7 +8415,7 @@ static int fan_get_speed(unsigned int *speed)
 
 static int fan2_get_speed(unsigned int *speed)
 {
-	u8 hi, lo;
+	u8 hi, lo, status;
 	bool rc;
 
 	switch (fan_status_access_mode) {
@@ -8396,7 +8431,21 @@ static int fan2_get_speed(unsigned int *speed)
 
 		if (likely(speed))
 			*speed = (hi << 8) | lo;
+		break;
 
+	case TPACPI_FAN_RD_TPEC_NS:
+		rc = !acpi_ec_read(fan2_status_offset_ns, &status);
+		if (rc)
+			return -EIO;
+		if (!(status & FAN_NS_CTRL_STATUS)) {
+			pr_info("secondary fan control not supported\n");
+			return -EIO;
+		}
+		rc = !acpi_ec_read(fan2_rpm_status_ns, &lo);
+		if (rc)
+			return -EIO;
+		if (speed)
+			*speed = lo ? FAN_RPM_CAL_CONST / lo : 0;
 		break;
 
 	default:
@@ -8899,6 +8948,7 @@ static const struct attribute_group fan_driver_attr_group = {
 #define TPACPI_FAN_2FAN		0x0002		/* EC 0x31 bit 0 selects fan2 */
 #define TPACPI_FAN_2CTL		0x0004		/* selects fan2 control */
 #define TPACPI_FAN_NOFAN	0x0008		/* no fan available */
+#define TPACPI_FAN_NS		0x0010		/* For EC with non-Standard register addresses */
 
 static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8917,6 +8967,8 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
 	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen) */
+	TPACPI_Q_LNV3('R', '1', 'F', TPACPI_FAN_NS),	/* L13 Yoga Gen 2 */
+	TPACPI_Q_LNV3('N', '2', 'U', TPACPI_FAN_NS),	/* X13 Yoga Gen 2*/
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 };
 
@@ -8951,18 +9003,27 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
+	if (quirks & TPACPI_FAN_NS) {
+		pr_info("ECFW with non-standard fan reg control found\n");
+		fan_with_ns_addr = 1;
+		/* Fan ctrl support from host is undefined for now */
+		tp_features.fan_ctrl_status_undef = 1;
+	}
+
 	if (gfan_handle) {
 		/* 570, 600e/x, 770e, 770x */
 		fan_status_access_mode = TPACPI_FAN_RD_ACPI_GFAN;
 	} else {
 		/* all other ThinkPads: note that even old-style
 		 * ThinkPad ECs supports the fan control register */
-		if (likely(acpi_ec_read(fan_status_offset,
-					&fan_control_initial_status))) {
+		if (fan_with_ns_addr ||
+		    likely(acpi_ec_read(fan_status_offset, &fan_control_initial_status))) {
 			int res;
 			unsigned int speed;
 
-			fan_status_access_mode = TPACPI_FAN_RD_TPEC;
+			fan_status_access_mode = fan_with_ns_addr ?
+				TPACPI_FAN_RD_TPEC_NS : TPACPI_FAN_RD_TPEC;
+
 			if (quirks & TPACPI_FAN_Q1)
 				fan_quirk1_setup();
 			/* Try and probe the 2nd fan */
@@ -8971,7 +9032,8 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 			if (res >= 0 && speed != FAN_NOT_PRESENT) {
 				/* It responded - so let's assume it's there */
 				tp_features.second_fan = 1;
-				tp_features.second_fan_ctl = 1;
+				/* fan control not currently available for ns ECFW */
+				tp_features.second_fan_ctl = !fan_with_ns_addr;
 				pr_info("secondary fan control detected & enabled\n");
 			} else {
 				/* Fan not auto-detected */
@@ -9146,6 +9208,7 @@ static int fan_read(struct seq_file *m)
 			       str_enabled_disabled(status), status);
 		break;
 
+	case TPACPI_FAN_RD_TPEC_NS:
 	case TPACPI_FAN_RD_TPEC:
 		/* all except 570, 600e/x, 770e, 770x */
 		rc = fan_get_status_safe(&status);
@@ -9160,13 +9223,22 @@ static int fan_read(struct seq_file *m)
 
 		seq_printf(m, "speed:\t\t%d\n", speed);
 
-		if (status & TP_EC_FAN_FULLSPEED)
-			/* Disengaged mode takes precedence */
-			seq_printf(m, "level:\t\tdisengaged\n");
-		else if (status & TP_EC_FAN_AUTO)
-			seq_printf(m, "level:\t\tauto\n");
-		else
-			seq_printf(m, "level:\t\t%d\n", status);
+		if (fan_status_access_mode == TPACPI_FAN_RD_TPEC_NS) {
+			/*
+			 * No full speed bit in NS EC
+			 * EC Auto mode is set by default.
+			 * No other levels settings available
+			 */
+			seq_printf(m, "level:\t\t%s\n", status & FAN_NS_CTRL ? "unknown" : "auto");
+		} else {
+			if (status & TP_EC_FAN_FULLSPEED)
+				/* Disengaged mode takes precedence */
+				seq_printf(m, "level:\t\tdisengaged\n");
+			else if (status & TP_EC_FAN_AUTO)
+				seq_printf(m, "level:\t\tauto\n");
+			else
+				seq_printf(m, "level:\t\t%d\n", status);
+		}
 		break;
 
 	case TPACPI_FAN_NONE:
-- 
2.43.0



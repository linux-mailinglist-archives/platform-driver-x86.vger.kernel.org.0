Return-Path: <platform-driver-x86+bounces-6960-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D09C549E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Nov 2024 11:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2321F226CA
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Nov 2024 10:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888E021EB81;
	Tue, 12 Nov 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzBIDJ5B"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15521E13C;
	Tue, 12 Nov 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407820; cv=none; b=AmB6oSwCmWvShTgzSSN/1GMrb7pqpCa7I4EkCIgXLHQ6Q9BMP9t9fdz2wZa5NNCA0Nt7ZYdiVPZGrwiwxVvIbxnRTSbezFWjSGW9zcr1+/kiCMFpsH89+WJxRT3vG/lwHWbQijKRLRU1H3b0HvSP99m1p8/WOMzPmslLMrFXgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407820; c=relaxed/simple;
	bh=c3MJ1aN6Kh2iTXHpjGaNFSd9LjvEz5bZ9GdizTZEFZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBqnMRKihEqE33qMQIYbmD5grFNi+aNBV70OByE7fiDrTFEsqiUPlERymyIO7IJEe4mhj7qOShuioqmIDiaYHa8N+V1lC5jFbG8B7k5hivx4VGPo8ay/MAWLMtqDh+bpvc7lhlmhcJTnTjbDZZA2ElM/nmQrXy7TOm/vIjPgSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzBIDJ5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22598C4CECD;
	Tue, 12 Nov 2024 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407820;
	bh=c3MJ1aN6Kh2iTXHpjGaNFSd9LjvEz5bZ9GdizTZEFZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jzBIDJ5BdijW5DMrUkp6CuPWT6xIDAPQDHl5SPWaH5EVkkzhmRBPjAAfds6owoonP
	 bnYpvsMXraV9myLRjZ7r51yo+itLo4uzZiJFHzsQA9aEcg9KPYdSpfPAsq3AgvsyYO
	 gCKEoGNvS6o2517NMPMXj0emsM3c8kkmLIFkra72lZlPy9yOCNDXOrXH7dIZgoDLG9
	 ib5vjg2te2Zn2p9nTI5co8EC3BhAekM+5U/MudROnYcf0J0blDPKg3YfJaXm5z852e
	 AGQApcbJt9RLXl0b63LHPk8/27QWg3gPGVc3F+m2bAhgfkPR1Fcwklv0Y57iCrmdXz
	 VY4GcMKQ8AFXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	hmh@hmh.eng.br,
	ilpo.jarvinen@linux.intel.com,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 09/15] platform/x86: thinkpad_acpi: Fix for ThinkPad's with ECFW showing incorrect fan speed
Date: Tue, 12 Nov 2024 05:36:30 -0500
Message-ID: <20241112103643.1653381-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103643.1653381-1-sashal@kernel.org>
References: <20241112103643.1653381-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.60
Content-Transfer-Encoding: 8bit

From: Vishnu Sankar <vishnuocv@gmail.com>

[ Upstream commit 1be765b292577c752e0b87bf8c0e92aff6699d8e ]

Fix for Thinkpad's with ECFW showing incorrect fan speed. Some models use
decimal instead of hexadecimal for the speed stored in the EC registers.
For example the rpm register will have 0x4200 instead of 0x1068, here
the actual RPM is "4200" in decimal.

Add a quirk to handle this.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Link: https://lore.kernel.org/r/20241105235505.8493-1-vishnuocv@gmail.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5b1f08eabd923..964670d4ca1e2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8013,6 +8013,7 @@ static u8 fan_control_resume_level;
 static int fan_watchdog_maxinterval;
 
 static bool fan_with_ns_addr;
+static bool ecfw_with_fan_dec_rpm;
 
 static struct mutex fan_mutex;
 
@@ -8655,7 +8656,11 @@ static ssize_t fan_fan1_input_show(struct device *dev,
 	if (res < 0)
 		return res;
 
-	return sysfs_emit(buf, "%u\n", speed);
+	/* Check for fan speeds displayed in hexadecimal */
+	if (!ecfw_with_fan_dec_rpm)
+		return sysfs_emit(buf, "%u\n", speed);
+	else
+		return sysfs_emit(buf, "%x\n", speed);
 }
 
 static DEVICE_ATTR(fan1_input, S_IRUGO, fan_fan1_input_show, NULL);
@@ -8672,7 +8677,11 @@ static ssize_t fan_fan2_input_show(struct device *dev,
 	if (res < 0)
 		return res;
 
-	return sysfs_emit(buf, "%u\n", speed);
+	/* Check for fan speeds displayed in hexadecimal */
+	if (!ecfw_with_fan_dec_rpm)
+		return sysfs_emit(buf, "%u\n", speed);
+	else
+		return sysfs_emit(buf, "%x\n", speed);
 }
 
 static DEVICE_ATTR(fan2_input, S_IRUGO, fan_fan2_input_show, NULL);
@@ -8748,6 +8757,7 @@ static const struct attribute_group fan_driver_attr_group = {
 #define TPACPI_FAN_2CTL		0x0004		/* selects fan2 control */
 #define TPACPI_FAN_NOFAN	0x0008		/* no fan available */
 #define TPACPI_FAN_NS		0x0010		/* For EC with non-Standard register addresses */
+#define TPACPI_FAN_DECRPM	0x0020		/* For ECFW's with RPM in register as decimal */
 
 static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8769,6 +8779,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '1', 'F', TPACPI_FAN_NS),	/* L13 Yoga Gen 2 */
 	TPACPI_Q_LNV3('N', '2', 'U', TPACPI_FAN_NS),	/* X13 Yoga Gen 2*/
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
+	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
 };
 
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8809,6 +8820,13 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 		tp_features.fan_ctrl_status_undef = 1;
 	}
 
+	/* Check for the EC/BIOS with RPM reported in decimal*/
+	if (quirks & TPACPI_FAN_DECRPM) {
+		pr_info("ECFW with fan RPM as decimal in EC register\n");
+		ecfw_with_fan_dec_rpm = 1;
+		tp_features.fan_ctrl_status_undef = 1;
+	}
+
 	if (gfan_handle) {
 		/* 570, 600e/x, 770e, 770x */
 		fan_status_access_mode = TPACPI_FAN_RD_ACPI_GFAN;
@@ -9020,7 +9038,11 @@ static int fan_read(struct seq_file *m)
 		if (rc < 0)
 			return rc;
 
-		seq_printf(m, "speed:\t\t%d\n", speed);
+		/* Check for fan speeds displayed in hexadecimal */
+		if (!ecfw_with_fan_dec_rpm)
+			seq_printf(m, "speed:\t\t%d\n", speed);
+		else
+			seq_printf(m, "speed:\t\t%x\n", speed);
 
 		if (fan_status_access_mode == TPACPI_FAN_RD_TPEC_NS) {
 			/*
-- 
2.43.0



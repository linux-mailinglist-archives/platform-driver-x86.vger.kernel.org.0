Return-Path: <platform-driver-x86+bounces-9612-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7AA3A8E9
	for <lists+platform-driver-x86@lfdr.de>; Tue, 18 Feb 2025 21:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38551896CC5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 18 Feb 2025 20:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0673E1DED51;
	Tue, 18 Feb 2025 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMZb6sDn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA7A1DED48;
	Tue, 18 Feb 2025 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910327; cv=none; b=srKQybZr6P/roK7gNt16VgWQ0DwsC7W0Tfm/X7P4t5PXyiXyf7iTOw+0mv6/jMSU5rWd973UEIqAg+m6OhdqOrYf+ZU9Bm2e6xM4GkgNEzPvkwPrzVT1CMZlCUPTSGebZuZQshTboMBNIWNmRQpNk1Lgh5//arHPA5x9Xa6K+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910327; c=relaxed/simple;
	bh=W40fmn0GF/iCbSU8PYbR+qEbaLnLwXnRe7e9jdruoeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IunqpRLupgPfouf/13v+NcErbgQQW2Ju6KHzEsuZpwdNWMux1c5GyZBJv9vgtY6NSYMcdJwNpSlXr9i2Y1oQfTKmBRayVB++M7WMWFH3jchnHXHHyfRAvHZqkmTJBX+cVPBEJJZb6CsDDk2N/2ocN60/IYOI1E2BCL676b7mre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMZb6sDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD42C4CEE2;
	Tue, 18 Feb 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910327;
	bh=W40fmn0GF/iCbSU8PYbR+qEbaLnLwXnRe7e9jdruoeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lMZb6sDnL8H7R4cjwdG/lbPUVUzv5W75M6qDtkQc/4RPhjBCMm9LMFDEtLrYG7iiq
	 mPV94YxilUrlmyPVPgqPOHQ7e5DV9kAbvPYGYKL9MAGSceWzE+u7x3RqLyEJ6imjwL
	 92n1L7ZInzV5N2Vo6at940mICAspthhWM+Ww7LRxo8KNI9/MrfvYhszAtx/rphw0xg
	 jb9hGFqZ0RU48inID6mdZpbKXD32S+he6kxv/xW6wdvhSQRuN1mLxdsggNHJiCOR9u
	 0+Iow2IMrP9DpecbT0sQBNVdThovErJWsHX92JKlHZRBP19EETX57ZpokbqFNaqx5h
	 FJviz7EVvTKDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sybil Isabel Dorsett <sybdorsett@proton.me>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	hmh@hmh.eng.br,
	hdegoede@redhat.com,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 15/31] platform/x86: thinkpad_acpi: Fix invalid fan speed on ThinkPad X120e
Date: Tue, 18 Feb 2025 15:24:35 -0500
Message-Id: <20250218202455.3592096-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
Content-Transfer-Encoding: 8bit

From: Sybil Isabel Dorsett <sybdorsett@proton.me>

[ Upstream commit 1046cac109225eda0973b898e053aeb3d6c10e1d ]

On ThinkPad X120e, fan speed is reported in ticks per revolution
rather than RPM.

Recalculate the fan speed value reported for ThinkPad X120e
to RPM based on a 22.5 kHz clock.

Based on the information on
https://www.thinkwiki.org/wiki/How_to_control_fan_speed,
the same problem is highly likely to be relevant to at least Edge11,
but Edge11 is not addressed in this patch.

Signed-off-by: Sybil Isabel Dorsett <sybdorsett@proton.me>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/r/20250203163255.5525-1-sybdorsett@proton.me
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2cfb2ac3f465a..05d77f87e235e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7883,6 +7883,7 @@ static struct ibm_struct volume_driver_data = {
 
 #define FAN_NS_CTRL_STATUS	BIT(2)		/* Bit which determines control is enabled or not */
 #define FAN_NS_CTRL		BIT(4)		/* Bit which determines control is by host or EC */
+#define FAN_CLOCK_TPM		(22500*60)	/* Ticks per minute for a 22.5 kHz clock */
 
 enum {					/* Fan control constants */
 	fan_status_offset = 0x2f,	/* EC register 0x2f */
@@ -7938,6 +7939,7 @@ static int fan_watchdog_maxinterval;
 
 static bool fan_with_ns_addr;
 static bool ecfw_with_fan_dec_rpm;
+static bool fan_speed_in_tpr;
 
 static struct mutex fan_mutex;
 
@@ -8140,8 +8142,11 @@ static int fan_get_speed(unsigned int *speed)
 			     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
 			return -EIO;
 
-		if (likely(speed))
+		if (likely(speed)) {
 			*speed = (hi << 8) | lo;
+			if (fan_speed_in_tpr && *speed != 0)
+				*speed = FAN_CLOCK_TPM / *speed;
+		}
 		break;
 	case TPACPI_FAN_RD_TPEC_NS:
 		if (!acpi_ec_read(fan_rpm_status_ns, &lo))
@@ -8174,8 +8179,11 @@ static int fan2_get_speed(unsigned int *speed)
 		if (rc)
 			return -EIO;
 
-		if (likely(speed))
+		if (likely(speed)) {
 			*speed = (hi << 8) | lo;
+			if (fan_speed_in_tpr && *speed != 0)
+				*speed = FAN_CLOCK_TPM / *speed;
+		}
 		break;
 
 	case TPACPI_FAN_RD_TPEC_NS:
@@ -8786,6 +8794,7 @@ static const struct attribute_group fan_driver_attr_group = {
 #define TPACPI_FAN_NOFAN	0x0008		/* no fan available */
 #define TPACPI_FAN_NS		0x0010		/* For EC with non-Standard register addresses */
 #define TPACPI_FAN_DECRPM	0x0020		/* For ECFW's with RPM in register as decimal */
+#define TPACPI_FAN_TPR		0x0040		/* Fan speed is in Ticks Per Revolution */
 
 static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8815,6 +8824,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
+	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */
 };
 
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8885,6 +8895,8 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 
 			if (quirks & TPACPI_FAN_Q1)
 				fan_quirk1_setup();
+			if (quirks & TPACPI_FAN_TPR)
+				fan_speed_in_tpr = true;
 			/* Try and probe the 2nd fan */
 			tp_features.second_fan = 1; /* needed for get_speed to work */
 			res = fan2_get_speed(&speed);
-- 
2.39.5



Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67540370D16
	for <lists+platform-driver-x86@lfdr.de>; Sun,  2 May 2021 16:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbhEBOIg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 2 May 2021 10:08:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:51874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232445AbhEBOH7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 May 2021 10:07:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D189661628;
        Sun,  2 May 2021 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619964392;
        bh=zu3mm0nPTqYrIGZNlDndBFTgLVfcZqKXM0POpl5UXvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m5nJpCi8bFOPuv53rpy8yCMdFOdTmemGrUWxd9cSh6ZPA7aAs7EjIS9N8dRJFidmv
         bLuBWPXAVzs/igbo+82ihHcNtSZSaV0POA4HtzmoNzVUb4sn9q9PbA9T79bFrRhZct
         Aze6tY3z7XCWc4FkSy0DWdoh0mE0TApTF017V/o3NraNWGw0yzYD11Gmz79ciwePOA
         o5x6fH2qRfRkmwNF2v3Z44wAGVhR/lZVySaerOcqZfA9jC+P2TrpJqvQ6wkHUjQHg3
         pDp1rtNu6+FbCbdqQ3an60O2AH3gYTrB1HxSbpV3i4ozbafmkgXns0rQ/9Hw6pi4XV
         P15xODVYBhpGg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mark Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 07/10] platform/x86: thinkpad_acpi: Correct thermal sensor allocation
Date:   Sun,  2 May 2021 10:06:19 -0400
Message-Id: <20210502140623.2720479-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502140623.2720479-1-sashal@kernel.org>
References: <20210502140623.2720479-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mark Pearson <markpearson@lenovo.com>

[ Upstream commit 6759e18e5cd8745a5dfc5726e4a3db5281ec1639 ]

On recent Thinkpad platforms it was reported that temp sensor 11 was
always incorrectly displaying 66C. It turns out the reason for this is
that this location in EC RAM is not a temperature sensor but is the
power supply ID (offset 0xC2).

Based on feedback from the Lenovo firmware team the EC RAM version can
be determined and for the current version (3) only the 0x78 to 0x7F
range is used for temp sensors. I don't have any details for earlier
versions so I have left the implementation unaltered there.

Note - in this block only 0x78 and 0x79 are officially designated (CPU &
GPU sensors). The use of the other locations in the block will vary from
platform to platform; but the existing logic to detect a sensor presence
holds.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
Link: https://lore.kernel.org/r/20210407212015.298222-1-markpearson@lenovo.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 31 ++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9180b24ba60a..20c588af33d8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5766,6 +5766,7 @@ enum thermal_access_mode {
 enum { /* TPACPI_THERMAL_TPEC_* */
 	TP_EC_THERMAL_TMP0 = 0x78,	/* ACPI EC regs TMP 0..7 */
 	TP_EC_THERMAL_TMP8 = 0xC0,	/* ACPI EC regs TMP 8..15 */
+	TP_EC_FUNCREV      = 0xEF,      /* ACPI EC Functional revision */
 	TP_EC_THERMAL_TMP_NA = -128,	/* ACPI EC sensor not available */
 
 	TPACPI_THERMAL_SENSOR_NA = -128000, /* Sensor not available */
@@ -5964,7 +5965,7 @@ static const struct attribute_group thermal_temp_input8_group = {
 
 static int __init thermal_init(struct ibm_init_struct *iibm)
 {
-	u8 t, ta1, ta2;
+	u8 t, ta1, ta2, ver = 0;
 	int i;
 	int acpi_tmp7;
 	int res;
@@ -5979,7 +5980,14 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 		 * 0x78-0x7F, 0xC0-0xC7.  Registers return 0x00 for
 		 * non-implemented, thermal sensors return 0x80 when
 		 * not available
+		 * The above rule is unfortunately flawed. This has been seen with
+		 * 0xC2 (power supply ID) causing thermal control problems.
+		 * The EC version can be determined by offset 0xEF and at least for
+		 * version 3 the Lenovo firmware team confirmed that registers 0xC0-0xC7
+		 * are not thermal registers.
 		 */
+		if (!acpi_ec_read(TP_EC_FUNCREV, &ver))
+			pr_warn("Thinkpad ACPI EC unable to access EC version\n");
 
 		ta1 = ta2 = 0;
 		for (i = 0; i < 8; i++) {
@@ -5989,11 +5997,13 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 				ta1 = 0;
 				break;
 			}
-			if (acpi_ec_read(TP_EC_THERMAL_TMP8 + i, &t)) {
-				ta2 |= t;
-			} else {
-				ta1 = 0;
-				break;
+			if (ver < 3) {
+				if (acpi_ec_read(TP_EC_THERMAL_TMP8 + i, &t)) {
+					ta2 |= t;
+				} else {
+					ta1 = 0;
+					break;
+				}
 			}
 		}
 		if (ta1 == 0) {
@@ -6009,9 +6019,12 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 				thermal_read_mode = TPACPI_THERMAL_NONE;
 			}
 		} else {
-			thermal_read_mode =
-			    (ta2 != 0) ?
-			    TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
+			if (ver >= 3)
+				thermal_read_mode = TPACPI_THERMAL_TPEC_8;
+			else
+				thermal_read_mode =
+					(ta2 != 0) ?
+					TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
 		}
 	} else if (acpi_tmp7) {
 		if (tpacpi_is_ibm() &&
-- 
2.30.2


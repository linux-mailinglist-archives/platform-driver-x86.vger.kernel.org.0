Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2E51AE693
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Apr 2020 22:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730908AbgDQUOd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Apr 2020 16:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730904AbgDQUOd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Apr 2020 16:14:33 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0638BC061A0C
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 13:14:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h69so1616538pgc.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=blIjcRoyiqAQGDs2qoazXGhW4AV+/rYkTOuTVVWY3N0=;
        b=q3MBZWFfiKjhYsTtNc950SzexcPS5NcXYsfbDZAKLXafSMFd8vKY8ouU3JQ3zYCDVJ
         QXyT+4+nD+sMW+oRi7uUSRAUKyGiBOYgYC+Zt8/yPJBwnv0lDPgd45DCCKdzouDDXRbR
         kUE4fidBuo7lsX2BY3TuccnqPwLxedc1wPhMUL2gQfryJ3bxw57ZOKdptg4xvttD40Hl
         /cZ6JIsFwsNbM7/bUwzG71qe5ly+H/TbbR5AqfSH6wnFEVG9H+6Z8NWtaHXD66jRs+n6
         3x5y7uNjnLqF08rjGsV21vNOZ0e+Lm2prjq+zQEYJOMlLYkbGA6cAkMBKQax1wU+ZTtJ
         /0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=blIjcRoyiqAQGDs2qoazXGhW4AV+/rYkTOuTVVWY3N0=;
        b=QcInICoihCXZlEkPqJU93s53v6dRdBqrXQXZZE2Nwhg4iaIGPFbnImQEJ8TGDFPaxa
         N2IP8x2wtZDJXXsXHlk7WhS42hbZvRU2DB0qMTng3gYdyh90qS3XsJnNA1Z1oGiJv/oF
         THd1jCBkPyUAwedUrFTg3CEE+UDWrqHFoRJNpvfV5RGpEelQWFEDZ5MhdMrLik4NLDqn
         yM/CUek/fytiU8p8l9t7xjhYyTbAJUJJPsGm3q4gZc2cq/xqoX42ZkTiG+usjGqpUtfw
         BeseE8Zt4IWdwJNtDmX+RysNzhC2+XRQtm8nChfXlSPiRgGVMF9yhw+L35o/8B9DF2fv
         bCdQ==
X-Gm-Message-State: AGi0PuaifcOCXEuyLflOSrFGeGi6aJgN7SHoT2pNYWO2CPWOecMx+T+Q
        wFQMMvC1PfrE0lYxVOPYFr8=
X-Google-Smtp-Source: APiQypLJ3S/DGZIVOJrYqPbD1yttO6UJas8SseTFca7PupGxi+xpSlDOSLGmoy8ms5wGdm9D6Nv6Xg==
X-Received: by 2002:a63:5b47:: with SMTP id l7mr4698169pgm.36.1587154472359;
        Fri, 17 Apr 2020 13:14:32 -0700 (PDT)
Received: from think ([2601:648:8200:13:3a44:3696:7ccb:e317])
        by smtp.gmail.com with ESMTPSA id f6sm6604987pfn.189.2020.04.17.13.14.31
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 17 Apr 2020 13:14:31 -0700 (PDT)
From:   Lars <larsh@apache.org>
To:     ibm-acpi@hmh.eng.br
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, Lars <larsh@apache.org>
Subject: [PATCH v2] thinkpad_acpi: Add support for dual fan control on select models
Date:   Fri, 17 Apr 2020 13:14:26 -0700
Message-Id: <20200417201426.24033-1-larsh@apache.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch allows controlling multiple fans as if they were a single fan.

This adds P52, P72, X1E, and X1E gen2 to dual fan quirks. Both fans are controlled together.

Tested on an X1 Extreme Gen2.

The patch is defensive, it adds only specific supported machines, and falls back to the old behavior if both fans cannot be controlled.
However, it does attempt single fan control for all previously white-listed Thinkpads.

Background:
I tested the BIOS default behavior on my X1E gen2 and both fans are always changed together.
So rather than adding controls for each fan, this controls both fans together as the BIOS would do.

This was inspired by a discussion on dual fan support for the thinkfan tool (https://github.com/vmatare/thinkfan/issues/58).
(Thanks to Github users voidworker, and civic9.)

The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id is verified on my machine.

(In the first version my mail client botched the white-spacing - my apologies, this is my first Kernel patch. Used git send-email and gmail this time.)

Signed-off-by: Lars <larsh@apache.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 33 +++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 8eaadbaf8ffa..cbc0e85d89d2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8324,11 +8324,20 @@ static int fan_set_level(int level)
 
 	switch (fan_control_access_mode) {
 	case TPACPI_FAN_WR_ACPI_SFAN:
-		if (level >= 0 && level <= 7) {
-			if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
-				return -EIO;
-		} else
+		if (((level < 0) || (level > 7)))
 			return -EINVAL;
+
+		if (tp_features.second_fan) {
+			if (!fan_select_fan2() ||
+			    !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
+				fan_select_fan1();
+				pr_warn("Couldn't set 2nd fan level, disabling support\n");
+				tp_features.second_fan = 0;
+			}
+			fan_select_fan1();
+		}
+		if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
+			return -EIO;
 		break;
 
 	case TPACPI_FAN_WR_ACPI_FANS:
@@ -8345,6 +8354,16 @@ static int fan_set_level(int level)
 		else if (level & TP_EC_FAN_AUTO)
 			level |= 4;	/* safety min speed 4 */
 
+		if (tp_features.second_fan) {
+			if (!fan_select_fan2() ||
+			    !acpi_ec_write(fan_status_offset, level)) {
+				fan_select_fan1();
+				pr_warn("Couldn't set 2nd fan level, disabling support\n");
+				tp_features.second_fan = 0;
+			}
+			fan_select_fan1();
+
+		}
 		if (!acpi_ec_write(fan_status_offset, level))
 			return -EIO;
 		else
@@ -8771,6 +8790,9 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
 	TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
 	TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
+	TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),	/* P52 / P72 */
+	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),	/* X1 Extreme (1st gen) */
+	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),	/* X1 Extreme (2nd gen) */
 };
 
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8812,8 +8834,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 				fan_quirk1_setup();
 			if (quirks & TPACPI_FAN_2FAN) {
 				tp_features.second_fan = 1;
-				dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
-					"secondary fan support enabled\n");
+				pr_info("secondary fan support enabled\n");
 			}
 		} else {
 			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
-- 
2.25.2


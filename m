Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E3A38EAB1
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 May 2021 16:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhEXO5M (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 May 2021 10:57:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234259AbhEXOyz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 May 2021 10:54:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB2C161438;
        Mon, 24 May 2021 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621867728;
        bh=EQuL5AWD/fApjp0/wL1bMQy/0dIiryBUxf0x/fpQz9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iVcNY8JTEQw5GlWFMuCbNUjMGjNgFXz7+v18UApyBIgLcfKyeV3dlYAHyJFS1B8cB
         uYUxuzBLvmm2MKKM473s02dPW0FHH/tUtaHriNrBqnVnPv2+Nw0JEhPeJslLTMhHbL
         3i2wAkHCxC/ou/eyiwXBQ1CzO+l3SHM+LCI7L1PXrGQO905qhkpBMeUEyB6HLvAZvB
         op5dDojILE3gtjseRGONlM16VBCRvN1dvAMURRAJZRMRT9OPS265gr3tA/zNKS44Ki
         O51tjj7bJQqJvAPorgDtTf8TKiLgSXxc2dKRdNX5hK35UZInHMbYCIsF7//ZZorwFm
         pDcCSHOMxxkWA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 52/62] platform/x86: intel_punit_ipc: Append MODULE_DEVICE_TABLE for ACPI
Date:   Mon, 24 May 2021 10:47:33 -0400
Message-Id: <20210524144744.2497894-52-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit bc1eca606d8084465e6f89fd646cc71defbad490 ]

The intel_punit_ipc driver might be compiled as a module.
When udev handles the event of the devices appearing
the intel_punit_ipc module is missing.

Append MODULE_DEVICE_TABLE for ACPI case to fix the loading issue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20210519101521.79338-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel_punit_ipc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
index 05cced59e251..f58b8543f6ac 100644
--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -312,6 +312,7 @@ static const struct acpi_device_id punit_ipc_acpi_ids[] = {
 	{ "INT34D4", 0 },
 	{ }
 };
+MODULE_DEVICE_TABLE(acpi, punit_ipc_acpi_ids);
 
 static struct platform_driver intel_punit_ipc_driver = {
 	.probe = intel_punit_ipc_probe,
-- 
2.30.2


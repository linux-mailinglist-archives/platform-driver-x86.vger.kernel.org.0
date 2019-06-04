Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 129B735362
	for <lists+platform-driver-x86@lfdr.de>; Wed,  5 Jun 2019 01:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfFDXYs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Jun 2019 19:24:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:35986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbfFDXYr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jun 2019 19:24:47 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5ADEB20866;
        Tue,  4 Jun 2019 23:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559690687;
        bh=PQKiAn/pU3JjmVI+vbKfnuXII5x+eHMsSS0tcYeRR1c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H+R6drJJX2W4djoIc62f7YyaTP7Wlzg6nobGZiLhG7DQt8EuvtOlELF5j9aYVop90
         ekeBoBfO7ScEaS4azt8wJZnrGr7vgmRfXCaikMVIGc1mr7V+NAFiDycUaTOqN4kCQD
         hVYSuP+1QQsIPETtu6L00U+QFb2dCzkJXqLXhp0k=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Semyon Verchenko <semverchenko@factor-ts.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 16/24] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table
Date:   Tue,  4 Jun 2019 19:24:07 -0400
Message-Id: <20190604232416.7479-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604232416.7479-1-sashal@kernel.org>
References: <20190604232416.7479-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 3d0818f5eba80fbe4c0addbfe6ddb2d19dc82cd4 ]

The Lex 3I380D industrial PC has 4 ethernet controllers on board
which need pmc_plt_clk0 - 3 to function, add it to the critclk_systems
DMI table, so that drivers/clk/x86/clk-pmc-atom.c will mark the clocks
as CLK_CRITICAL and they will not get turned off.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Reported-and-tested-by: Semyon Verchenko <semverchenko@factor-ts.ru>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/pmc_atom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 50f2a125cd2c..e3e1f83a2dd7 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -428,12 +428,21 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
  */
 static const struct dmi_system_id critclk_systems[] = {
 	{
+		/* pmc_plt_clk0 is used for an external HSIC USB HUB */
 		.ident = "MPL CEC1x",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
 		},
 	},
+	{
+		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
+		.ident = "Lex 3I380D",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
+		},
+	},
 	{ /*sentinel*/ }
 };
 
-- 
2.20.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3EF44614F
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Nov 2021 10:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhKEJYD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Nov 2021 05:24:03 -0400
Received: from mail-m974.mail.163.com ([123.126.97.4]:54224 "EHLO
        mail-m974.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhKEJYC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 05:24:02 -0400
X-Greylist: delayed 923 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Nov 2021 05:24:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7z1K0
        sPc2NW3ADD5fllk4cazdNDAgk9u0Mox0gqXvXI=; b=I6PEZtmUNKSIVb47WP2ZC
        abrlVnNCI8qFVXRKHm6Ch/GEYcmmaJlHe16WGtFaw6th5bzXGUAH0vuDpShyDRVc
        YHYis5eov6Uu+n1nmVhwYY5+E/mSf071qtmCbAsYlZ06FOalmP0FelURtb4IS9TM
        7htvMGChvZR7pM1WQ+osJ0=
Received: from fedora.lenovo.com (unknown [103.30.235.251])
        by smtp4 (Coremail) with SMTP id HNxpCgCHLFXe84RhIsWPKQ--.3737S2;
        Fri, 05 Nov 2021 17:05:37 +0800 (CST)
From:   Jimmy Wang <jimmy221b@163.com>
Cc:     jimmy221b@163.com, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Add support for dual fan control
Date:   Fri,  5 Nov 2021 17:05:28 +0800
Message-Id: <20211105090528.39677-1-jimmy221b@163.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HNxpCgCHLFXe84RhIsWPKQ--.3737S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFykZF15KFyUXw4UCrW8tFb_yoWDAFc_C3
        Z8WFs2yF95K3909r1UKrnavry2qr9rXw1kGw47Xa43Gr95XF4xZw1jkFyfJFy3ZFnI9a4D
        Zr15XF1jkry5tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUi0etUUUUU==
X-Originating-IP: [103.30.235.251]
X-CM-SenderInfo: 5mlpz5assruqqrwthudrp/1tbiDgZCAlXl15CCBgAAs7
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

   This adds dual fan control for P1 / X1 Extreme Gen4

Signed-off-by: Jimmy Wang <jimmy221b@163.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9c632df734bb..eb201d001075 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8766,6 +8766,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
 	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
 	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
+	TPACPI_Q_LNV3('N', '4', '0', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (4nd gen) */
 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
 	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
 };
-- 
2.31.1


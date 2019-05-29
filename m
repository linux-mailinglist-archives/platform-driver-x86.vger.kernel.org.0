Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5462D7EB
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2019 10:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfE2Iec (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 May 2019 04:34:32 -0400
Received: from shell.v3.sk ([90.176.6.54]:41396 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfE2Ieb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 May 2019 04:34:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 950841049C9;
        Wed, 29 May 2019 10:34:28 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GR2ySgjGlqCT; Wed, 29 May 2019 10:34:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 8AF8F1049C3;
        Wed, 29 May 2019 10:34:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5fEFfgc9UceQ; Wed, 29 May 2019 10:34:10 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 5FE0E1049C6;
        Wed, 29 May 2019 10:34:09 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 4/4] Platform: OLPC: Add a config menu category for XO 1.75
Date:   Wed, 29 May 2019 10:34:05 +0200
Message-Id: <20190529083405.332762-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529083405.332762-1-lkundrak@v3.sk>
References: <20190529083405.332762-1-lkundrak@v3.sk>
Reply-To: "[PATCH 0/4]"@zimbra.v3.sk, "Platform:OLPC:A"@zimbra.v3.sk,
          couple@zimbra.v3.sk, of@zimbra.v3.sk, bug@zimbra.v3.sk,
          fixes@zimbra.v3.sk
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Randy Dunlap says:

  drivers/platform/olpc/Kconfig needs to use "menuconfig" like all of the
  other Kconfig files in drivers/platform/ so that its menu is listed in
  the correct place in *config interfaces.

Otherwise he's sad.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/platform/olpc/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/Kconfig b/drivers/platform/olpc/Kconfi=
g
index 6f35c01254e5..919b489e24e8 100644
--- a/drivers/platform/olpc/Kconfig
+++ b/drivers/platform/olpc/Kconfig
@@ -2,9 +2,19 @@ config OLPC_EC
 	select REGULATOR
 	bool
=20
+menuconfig OLPC_XO175
+	bool "Platform support for OLPC XO 1.75 hardware"
+	depends on ARCH_MMP || COMPILE_TEST
+	help
+	  Say Y here to get to see options for the ARM-based OLPC platform.
+	  This option alone does not add any kernel code.
+
+	  Unless you have an OLPC XO laptop, you will want to say N.
+
+if OLPC_XO175
+
 config OLPC_XO175_EC
 	tristate "OLPC XO 1.75 Embedded Controller"
-	depends on ARCH_MMP || COMPILE_TEST
 	depends on SPI_SLAVE
 	depends on INPUT
 	depends on POWER_SUPPLY
@@ -15,3 +25,5 @@ config OLPC_XO175_EC
 	  button, restart, shutdown and battery charging status.
=20
 	  Unless you have an OLPC XO laptop, you will want to say N.
+
+endif # OLPC_XO175
--=20
2.21.0


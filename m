Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 986C82D7E9
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2019 10:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfE2Ieb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 May 2019 04:34:31 -0400
Received: from shell.v3.sk ([90.176.6.54]:41391 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfE2Iea (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 May 2019 04:34:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 6CF901049C4;
        Wed, 29 May 2019 10:34:26 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Ra_3GaY-uws1; Wed, 29 May 2019 10:34:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id CE8D21049CF;
        Wed, 29 May 2019 10:34:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XxDNslYLOcYN; Wed, 29 May 2019 10:34:09 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 268681049C5;
        Wed, 29 May 2019 10:34:09 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 3/4] Platform: OLPC: Require CONFIG_POWER_SUPPLY for XO-1.75 EC
Date:   Wed, 29 May 2019 10:34:04 +0200
Message-Id: <20190529083405.332762-4-lkundrak@v3.sk>
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

  ERROR: "power_supply_put" [drivers/platform/olpc/olpc-xo175-ec.ko] unde=
fined!
  ERROR: "power_supply_changed" [drivers/platform/olpc/olpc-xo175-ec.ko] =
undefined!
  ERROR: "power_supply_get_by_name" [drivers/platform/olpc/olpc-xo175-ec.=
ko] undefined!

Adding the dependency seems like a more reasonable thing compared to
ifdef-ing the bits, as if one has an XO-1.75 they almost certainly want
a baterry and AC adapter support.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/platform/olpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/olpc/Kconfig b/drivers/platform/olpc/Kconfi=
g
index 1fa676c5e7fa..6f35c01254e5 100644
--- a/drivers/platform/olpc/Kconfig
+++ b/drivers/platform/olpc/Kconfig
@@ -7,6 +7,7 @@ config OLPC_XO175_EC
 	depends on ARCH_MMP || COMPILE_TEST
 	depends on SPI_SLAVE
 	depends on INPUT
+	depends on POWER_SUPPLY
 	select OLPC_EC
 	help
 	  Include support for the OLPC XO Embedded Controller (EC). The EC
--=20
2.21.0


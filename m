Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237CE2D7E8
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2019 10:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfE2Iea (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 May 2019 04:34:30 -0400
Received: from shell.v3.sk ([90.176.6.54]:41382 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfE2Iea (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 May 2019 04:34:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 106A01049C5;
        Wed, 29 May 2019 10:34:25 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id QJSnMOpAVH2B; Wed, 29 May 2019 10:34:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 99B0A1049C7;
        Wed, 29 May 2019 10:34:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id nr8BQ_lQGUXr; Wed, 29 May 2019 10:34:09 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id AA0121049C3;
        Wed, 29 May 2019 10:34:08 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 1/4] Platform: OLPC: Make olpc_dt_compatible_match() static __init
Date:   Wed, 29 May 2019 10:34:02 +0200
Message-Id: <20190529083405.332762-2-lkundrak@v3.sk>
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

Addresses a kbuild warning:

  >> WARNING: vmlinux.o(.text+0x3b764): Section mismatch in reference fro=
m
              the function olpc_dt_compatible_match() to the function
              .init.text:olpc_dt_getproperty()

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: a7a9bacb9a32 (x86/platform/olpc: Use a correct version when making=
 up a battery node)
---
 arch/x86/platform/olpc/olpc_dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/ol=
pc_dt.c
index 0296c5b55e6f..114c52986568 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -220,7 +220,7 @@ static u32 __init olpc_dt_get_board_revision(void)
 	return be32_to_cpu(rev);
 }
=20
-int olpc_dt_compatible_match(phandle node, const char *compat)
+static int __init olpc_dt_compatible_match(phandle node, const char *com=
pat)
 {
 	char buf[64], *p;
 	int plen, len;
--=20
2.21.0


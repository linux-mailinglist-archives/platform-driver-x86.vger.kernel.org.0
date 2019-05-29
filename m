Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 192F62D7EA
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2019 10:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfE2Ieb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 May 2019 04:34:31 -0400
Received: from shell.v3.sk ([90.176.6.54]:41400 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfE2Ieb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 May 2019 04:34:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 04D3B1049C3;
        Wed, 29 May 2019 10:34:29 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id uVHCz67Ay1v9; Wed, 29 May 2019 10:34:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 8824B1049CE;
        Wed, 29 May 2019 10:34:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id TzR2w58CsTy6; Wed, 29 May 2019 10:34:09 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id E1CD91049C4;
        Wed, 29 May 2019 10:34:08 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 2/4] Platform: OLPC: Fix olpc_xo175_ec_cmd() return value
Date:   Wed, 29 May 2019 10:34:03 +0200
Message-Id: <20190529083405.332762-3-lkundrak@v3.sk>
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

Reset the ret variable to make sure it olpc_xo175_ec_cmd() ends up
returning zero on success.

Fixes: commit 0c3d931b3ab9 ("Platform: OLPC: Add XO-1.75 EC driver")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/platform/olpc/olpc-xo175-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olp=
c/olpc-xo175-ec.c
index 344d14f3da54..48d6f0d87583 100644
--- a/drivers/platform/olpc/olpc-xo175-ec.c
+++ b/drivers/platform/olpc/olpc-xo175-ec.c
@@ -507,6 +507,7 @@ static int olpc_xo175_ec_cmd(u8 cmd, u8 *inbuf, size_=
t inlen, u8 *resp,
 		nr_bytes =3D resp_len;
 	} else {
 		nr_bytes =3D (size_t)ret;
+		ret =3D 0;
 	}
 	resp_len =3D min(resp_len, nr_bytes);
=20
--=20
2.21.0


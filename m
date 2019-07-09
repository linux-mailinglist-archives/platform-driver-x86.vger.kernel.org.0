Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18B2062D71
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Jul 2019 03:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbfGIBch (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Jul 2019 21:32:37 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43136 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725886AbfGIBcg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Jul 2019 21:32:36 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 12C2C722F2C6693B8C29;
        Tue,  9 Jul 2019 09:32:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 9 Jul 2019 09:32:29 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Vadim Pasternak <vadimp@mellanox.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <platform-driver-x86@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] platform/x86: mlx-platform: Fix error handling in mlxplat_init()
Date:   Tue, 9 Jul 2019 01:38:42 +0000
Message-ID: <20190709013842.17344-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the missing platform_device_unregister() before return
from mlxplat_init() in the error handling case.

Fixes: 6b266e91a071 ("platform/x86: mlx-platform: Move regmap initialization before all drivers activation")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/x86/mlx-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 2b98f299faa4..8fe51e43f1bc 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -2111,7 +2111,7 @@ static int __init mlxplat_init(void)
 					mlxplat_regmap_config);
 	if (IS_ERR(priv->regmap)) {
 		err = PTR_ERR(priv->regmap);
-		return err;
+		goto fail_alloc;
 	}
 
 	err = mlxplat_mlxcpld_verify_bus_topology(&nr);




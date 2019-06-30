Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3275AFB6
	for <lists+platform-driver-x86@lfdr.de>; Sun, 30 Jun 2019 13:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3LXG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 Jun 2019 07:23:06 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:39658 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726500AbfF3LXG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jun 2019 07:23:06 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 30 Jun 2019 14:23:00 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5UBMxe5001195;
        Sun, 30 Jun 2019 14:22:59 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next/based on branch review-andy 1/platform/x86: mlx-platform: Fix exit point on ioport map failure
Date:   Sun, 30 Jun 2019 11:22:58 +0000
Message-Id: <20190630112258.25219-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In case of devm_ioport_map() failure go to 'fail_alloc' exit point
instead of wrong 'fail_platform_mux_register' exit point in
mlxplat_init().

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: ef58891a57d0 (platform/x86: mlx-platform: Move regmap initialization before all drivers activation)
---
 drivers/platform/x86/mlx-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 262fa6b1282b..2b98f299faa4 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -2100,7 +2100,7 @@ static int __init mlxplat_init(void)
 			       mlxplat_lpc_resources[1].start, 1);
 	if (!mlxplat_mlxcpld_regmap_ctx.base) {
 		err = -ENOMEM;
-		goto fail_platform_mux_register;
+		goto fail_alloc;
 	}
 
 	if (!mlxplat_regmap_config)
-- 
2.11.0


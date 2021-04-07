Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE23F3564AD
	for <lists+platform-driver-x86@lfdr.de>; Wed,  7 Apr 2021 09:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhDGHAr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Apr 2021 03:00:47 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16006 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbhDGHAq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 03:00:46 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFZwF3yzpzNtbd;
        Wed,  7 Apr 2021 14:57:49 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 15:00:26 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <luzmaximilian@gmail.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] platform/surface: aggregator: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 7 Apr 2021 15:00:52 +0800
Message-ID: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/platform/surface/aggregator/controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
index aa6f37b..00e3828 100644
--- a/drivers/platform/surface/aggregator/controller.c
+++ b/drivers/platform/surface/aggregator/controller.c
@@ -2483,7 +2483,8 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
 	 * interrupt, and let the SAM resume callback during the controller
 	 * resume process clear it.
 	 */
-	const int irqf = IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_RISING;
+	const int irqf = IRQF_SHARED | IRQF_ONESHOT |
+			 IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
 
 	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
 	if (IS_ERR(gpiod))
@@ -2501,7 +2502,6 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
 		return status;
 
 	ctrl->irq.num = irq;
-	disable_irq(ctrl->irq.num);
 	return 0;
 }
 
-- 
2.7.4


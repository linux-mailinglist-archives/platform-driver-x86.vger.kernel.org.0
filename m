Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B425332614
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Mar 2021 14:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhCINGr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 9 Mar 2021 08:06:47 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:13588 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhCINGU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Mar 2021 08:06:20 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DvwQm2CpRz17HZC;
        Tue,  9 Mar 2021 21:04:32 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 21:06:11 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Maximilian Luz <luzmaximilian@gmail.com>,
        "Hans de Goede" <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] platform/surface: aggregator_registry: Make symbol 'ssam_base_hub_group' static
Date:   Tue, 9 Mar 2021 13:15:00 +0000
Message-ID: <20210309131500.1885772-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

The sparse tool complains as follows:

drivers/platform/surface/surface_aggregator_registry.c:355:30: warning:
 symbol 'ssam_base_hub_group' was not declared. Should it be static?

This symbol is not used outside of surface_aggregator_registry.c, so this
commit marks it static.

Fixes: 797e78564634 ("platform/surface: aggregator_registry: Add base device hub")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 .../platform/surface/surface_aggregator_registry.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cdb4a95af3e8..86cff5fce3cd 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -352,7 +352,7 @@ static struct attribute *ssam_base_hub_attrs[] = {
 	NULL,
 };
 
-const struct attribute_group ssam_base_hub_group = {
+static const struct attribute_group ssam_base_hub_group = {
 	.attrs = ssam_base_hub_attrs,
 };
 


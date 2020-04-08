Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113B21A1A12
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Apr 2020 04:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDHCnf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Apr 2020 22:43:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12623 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726416AbgDHCnf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Apr 2020 22:43:35 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C2D748F7490C1F94BFBA;
        Wed,  8 Apr 2020 10:43:32 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 8 Apr 2020
 10:43:26 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <srinivas.pandruvada@linux.intel.com>, <dvhart@infradead.org>,
        <andy@infradead.org>, <platform-driver-x86@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] platform/x86/intel-uncore-freq: make uncore_root_kobj static
Date:   Wed, 8 Apr 2020 10:42:00 +0800
Message-ID: <20200408024200.40268-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the following sparse warning:

drivers/platform/x86/intel-uncore-frequency.c:56:16: warning: symbol
'uncore_root_kobj' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/platform/x86/intel-uncore-frequency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel-uncore-frequency.c
index b96d172eb2c1..12d5ab7e1f5d 100644
--- a/drivers/platform/x86/intel-uncore-frequency.c
+++ b/drivers/platform/x86/intel-uncore-frequency.c
@@ -53,7 +53,7 @@ static int uncore_max_entries __read_mostly;
 /* Storage for uncore data for all instances */
 static struct uncore_data *uncore_instances;
 /* Root of the all uncore sysfs kobjs */
-struct kobject *uncore_root_kobj;
+static struct kobject *uncore_root_kobj;
 /* Stores the CPU mask of the target CPUs to use during uncore read/write */
 static cpumask_t uncore_cpu_mask;
 /* CPU online callback register instance */
-- 
2.17.2


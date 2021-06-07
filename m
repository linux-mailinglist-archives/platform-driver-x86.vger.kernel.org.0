Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A7439D2A8
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Jun 2021 03:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhFGBjr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 6 Jun 2021 21:39:47 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3077 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhFGBjq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Jun 2021 21:39:46 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FywqP3gBczWsP5;
        Mon,  7 Jun 2021 09:33:05 +0800 (CST)
Received: from dggema766-chm.china.huawei.com (10.1.198.208) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 09:37:52 +0800
Received: from localhost.localdomain (10.175.127.227) by
 dggema766-chm.china.huawei.com (10.1.198.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 7 Jun 2021 09:37:52 +0800
From:   yangerkun <yangerkun@huawei.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>, <yangerkun@huawei.com>,
        <yukuai3@huawei.com>
Subject: [PATCH v2] platform/x86: intel_ips: fix set but unused warning in read_mgtv
Date:   Mon, 7 Jun 2021 09:47:02 +0800
Message-ID: <20210607014702.2981097-1-yangerkun@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema766-chm.china.huawei.com (10.1.198.208)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

drivers/platform/x86/intel_ips.c:832:6: warning: variable ‘ret’ set but
not used [-Wunused-but-set-variable]
  832 |  u16 ret;
      |      ^~~

Fix it by mark ret as '__maybe_unused'.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/platform/x86/intel_ips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index bffe548187ee..4dfdbfca6841 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -829,7 +829,7 @@ static u16 calc_avg_temp(struct ips_driver *ips, u16 *array)
 
 static u16 read_mgtv(struct ips_driver *ips)
 {
-	u16 ret;
+	u16 __maybe_unused ret;
 	u64 slope, offset;
 	u64 val;
 
-- 
2.31.1


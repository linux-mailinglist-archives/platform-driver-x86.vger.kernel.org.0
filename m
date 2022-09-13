Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E8D5B6E8F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 13 Sep 2022 15:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbiIMNqu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 13 Sep 2022 09:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbiIMNqt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Sep 2022 09:46:49 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C88B255BD;
        Tue, 13 Sep 2022 06:46:47 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRl4y2lq4zNmBD;
        Tue, 13 Sep 2022 21:42:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 21:46:45 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 21:46:44 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-hwmon@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <acpi4asus-user@lists.sourceforge.net>
CC:     <corentin.chary@gmail.com>, <hdegoede@redhat.com>
Subject: [PATCH -next] platform/x86: asus-wmi: change kbd_rgb_mode_groups to static
Date:   Tue, 13 Sep 2022 21:54:01 +0800
Message-ID: <20220913135401.1973721-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

kbd_rgb_mode_groups is only used in asus-wmi.c now, change it
to static.

Fixes: e305a71cea37 ("platform/x86: asus-wmi: Implement TUF laptop keyboard LED modes")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index d95170b7dba0..ae46af731de9 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -835,7 +835,7 @@ static const struct attribute_group kbd_rgb_state_group = {
 	.attrs = kbd_rgb_state_attrs,
 };
 
-const struct attribute_group *kbd_rgb_mode_groups[] = {
+static const struct attribute_group *kbd_rgb_mode_groups[] = {
 	NULL,
 	NULL,
 	NULL,
-- 
2.25.1


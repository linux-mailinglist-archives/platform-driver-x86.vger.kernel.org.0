Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB45629298
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Nov 2022 08:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbiKOHik (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Nov 2022 02:38:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbiKOHi3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 02:38:29 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0462C3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2022 23:38:23 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBHxk6tkQzqSPT;
        Tue, 15 Nov 2022 15:34:34 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 15 Nov
 2022 15:38:21 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <dvhart@infradead.org>, <andy@infradead.org>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
        <x86@kernel.org>, <hpa@zytor.com>, <david.e.box@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <wsa@kernel.org>,
        <hdegoede@redhat.com>, <rafael.j.wysocki@intel.com>,
        <platform-driver-x86@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] x86/platform/intel/iosf_mbi: Fix error handling in iosf_mbi_init()
Date:   Tue, 15 Nov 2022 07:36:36 +0000
Message-ID: <20221115073636.25412-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A problem about modprobe iosf_mbi failed is triggered with the following
log given:

 debugfs: Directory 'iosf_sb' with parent '/' already present!

The reason is that iosf_mbi_init() returns pci_register_driver()
directly without checking its return value, if pci_register_driver()
failed, it returns without removing debugfs, resulting the debugfs of
iosf_sb can never be created later.

 iosf_mbi_init()
   iosf_mbi_dbg_init() # create debugfs
   pci_register_driver()
     driver_register()
       bus_add_driver()
         priv = kzalloc(...) # OOM happened
   # return without remove debugfs and destroy workqueue

Fix by remove debugfs and iosf_mbi_pm_qos when pci_register_driver()
returns error.

Fixes: 8dc12f933c9d ("x86/iosf: Add debugfs support")
Fixes: e09db3d241f8 ("x86: baytrail/cherrytrail: Rework and move P-Unit PMIC bus semaphore code")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 arch/x86/platform/intel/iosf_mbi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel/iosf_mbi.c b/arch/x86/platform/intel/iosf_mbi.c
index fdd49d70b437..98632ac3db2f 100644
--- a/arch/x86/platform/intel/iosf_mbi.c
+++ b/arch/x86/platform/intel/iosf_mbi.c
@@ -545,11 +545,19 @@ static struct pci_driver iosf_mbi_pci_driver = {
 
 static int __init iosf_mbi_init(void)
 {
+	int ret;
+
 	iosf_debugfs_init();
 
 	cpu_latency_qos_add_request(&iosf_mbi_pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	return pci_register_driver(&iosf_mbi_pci_driver);
+	ret = pci_register_driver(&iosf_mbi_pci_driver);
+	if (ret) {
+		cpu_latency_qos_remove_request(&iosf_mbi_pm_qos);
+		iosf_debugfs_remove();
+	}
+
+	return ret;
 }
 
 static void __exit iosf_mbi_exit(void)
-- 
2.17.1


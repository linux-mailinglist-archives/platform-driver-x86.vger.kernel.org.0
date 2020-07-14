Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0119F21EE24
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Jul 2020 12:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgGNKmz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 Jul 2020 06:42:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:29667 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgGNKmy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Jul 2020 06:42:54 -0400
IronPort-SDR: 5HQrM9NMmsIa3Dz3uweS8RhobtbO4ATOypceAkrPWX342emwkfViyYGImq9kUyksLpaQkCx6Dt
 CExRJNxcaX+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="148866078"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="148866078"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 03:42:53 -0700
IronPort-SDR: IKbb5oTuB9riJkh8zdPfUetmQg5yrINxqRl4T/getpVVzv7DPgeIEOLnLFHgUR8Vvh2+TyMBZR
 VxbzqUNNBN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="269976501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2020 03:42:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 30BBA16B; Tue, 14 Jul 2020 13:42:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1] platform/x86: thinkpad_acpi: Limit size when call strndup_user()
Date:   Tue, 14 Jul 2020 13:42:50 +0300
Message-Id: <20200714104250.87970-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

During conversion to use strndup_user() the commit 35d13c7a0512
("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
missed the fact that buffer coming thru procfs is not immediately NULL
terminated. We have to limit size when calling strndup_user().

Fixes: 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f571d6254e7c..f411ad814cab 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -886,7 +886,7 @@ static ssize_t dispatch_proc_write(struct file *file,
 	if (!ibm || !ibm->write)
 		return -EINVAL;
 
-	kernbuf = strndup_user(userbuf, PAGE_SIZE);
+	kernbuf = strndup_user(userbuf, min_t(long, count, PAGE_SIZE));
 	if (IS_ERR(kernbuf))
 		return PTR_ERR(kernbuf);
 
-- 
2.27.0


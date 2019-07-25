Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E8D7578B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 Jul 2019 21:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfGYTF4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 25 Jul 2019 15:05:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:19125 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbfGYTFy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jul 2019 15:05:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 12:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; 
   d="scan'208";a="321764759"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 25 Jul 2019 12:05:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 22F2581; Thu, 25 Jul 2019 22:05:51 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: i2c-multi-instantiate: Use struct_size() helper
Date:   Thu, 25 Jul 2019 22:05:50 +0300
Message-Id: <20190725190550.63184-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array.

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 197d8a192721..61fe341a85aa 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -81,9 +81,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	multi = devm_kmalloc(dev,
-			offsetof(struct i2c_multi_inst_data, clients[ret]),
-			GFP_KERNEL);
+	multi = devm_kmalloc(dev, struct_size(multi, clients, ret), GFP_KERNEL);
 	if (!multi)
 		return -ENOMEM;
 
-- 
2.20.1


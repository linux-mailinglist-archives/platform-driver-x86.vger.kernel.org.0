Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB4BD61CB
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Oct 2019 13:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbfJNL5m (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Oct 2019 07:57:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:38801 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfJNL5m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Oct 2019 07:57:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 04:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="194977073"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2019 04:57:40 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iJyyp-00040q-AV; Mon, 14 Oct 2019 14:57:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org, Ammy Yi <ammy.yi@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [RESEND][PATCH v1] platform/x86: i2c-multi-instantiate: Fail the probe if no IRQ provided
Date:   Mon, 14 Oct 2019 14:57:39 +0300
Message-Id: <20191014115739.15342-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For APIC case of interrupt we don't fail a ->probe() of the driver,
which makes kernel to print a lot of warnings from the children.

We have two options here:
- switch to platform_get_irq_optional(), though it won't stop children
  to be probed and failed
- fail the ->probe() of i2c-multi-instantiate

Since the in reality we never had devices in the wild where IRQ resource
is optional, the latter solution suits the best.

Fixes: 799d3379a672 ("platform/x86: i2c-multi-instantiate: Introduce IOAPIC IRQ support")
Reported-by: Ammy Yi <ammy.yi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- Cc Ammy
 drivers/platform/x86/i2c-multi-instantiate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index ea68f6ed66ae..ffb8d5d1eb5f 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -108,6 +108,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 			if (ret < 0) {
 				dev_dbg(dev, "Error requesting irq at index %d: %d\n",
 					inst_data[i].irq_idx, ret);
+				goto error;
 			}
 			board_info.irq = ret;
 			break;
-- 
2.23.0


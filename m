Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90A0A1459A3
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jan 2020 17:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVQSq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jan 2020 11:18:46 -0500
Received: from mga14.intel.com ([192.55.52.115]:56521 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbgAVQSq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jan 2020 11:18:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jan 2020 08:18:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; 
   d="scan'208";a="222081051"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jan 2020 08:18:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id DC0061AD; Wed, 22 Jan 2020 18:18:43 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel_scu_ipcutil: Remove default y from Kconfig
Date:   Wed, 22 Jan 2020 19:18:43 +0300
Message-Id: <20200122161843.68296-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This driver is by no means essential for system to boot up so remove
default y from it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
This was part of a bigger series [1] but since this is an independent
change, I'll send it separately.

[1] https://lkml.org/lkml/2020/1/21/678

 drivers/platform/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 27d5b40fb717..dd4326736d11 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -997,7 +997,6 @@ config INTEL_SCU_IPC
 config INTEL_SCU_IPC_UTIL
 	tristate "Intel SCU IPC utility driver"
 	depends on INTEL_SCU_IPC
-	default y
 	---help---
 	  The IPC Util driver provides an interface with the SCU enabling
 	  low level access for debug work and updating the firmware. Say
-- 
2.24.1


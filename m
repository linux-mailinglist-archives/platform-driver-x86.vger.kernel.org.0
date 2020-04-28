Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B391BB92E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Apr 2020 10:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgD1IvR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Apr 2020 04:51:17 -0400
Received: from mga11.intel.com ([192.55.52.93]:48363 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgD1IvQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Apr 2020 04:51:16 -0400
IronPort-SDR: 3iJz/Jd7+MUrb/4UD1X+90CKSIS//BEXY+NWzRl0OMKCgN00P4LQmTUAGS6Kjs9pqg2W8REerO
 JMFnJNsBjMlA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 01:51:16 -0700
IronPort-SDR: 3iQZIrEwo+2BmOSlCtfGoREHTBQnNckPC6E4lvese4W8pWoReuHAzCyre7b1lkm9gM8B2FxpAe
 SHnL0YSIvl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="458715198"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2020 01:51:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2EBDD16D; Tue, 28 Apr 2020 11:51:14 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Cc:     Divya Sasidharan <divya.s.sasidharan@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] MAINTAINERS: Add me as maintainer of Intel SCU drivers
Date:   Tue, 28 Apr 2020 11:51:13 +0300
Message-Id: <20200428085113.47420-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428085113.47420-1-mika.westerberg@linux.intel.com>
References: <20200428085113.47420-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I will be helping the x86 platform driver maintainers to look after
Intel SCU drivers.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c612caec0ac..4dd1b940c728 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8765,6 +8765,12 @@ S:	Supported
 F:	drivers/infiniband/hw/i40iw/
 F:	include/uapi/rdma/i40iw-abi.h
 
+INTEL SCU DRIVERS
+M:	Mika Westerberg <mika.westerberg@linux.intel.com>
+S:	Maintained
+F:	arch/x86/include/asm/intel_scu_ipc.h
+F:	drivers/platform/x86/intel_scu_*
+
 INTEL SPEED SELECT TECHNOLOGY
 M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.26.2


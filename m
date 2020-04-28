Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334061BB92F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Apr 2020 10:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgD1IvR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Apr 2020 04:51:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:14053 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgD1IvR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Apr 2020 04:51:17 -0400
IronPort-SDR: ddU87JdS+Q2MEKxwsWjUkHpzBrlyHE634ljSU35F1STPyOr1SC6IXjPfbaGB4sZPQfdTQgLB11
 0u8HgmYawn0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 01:51:16 -0700
IronPort-SDR: 2m+rL7GZ5fq4EeZ9kOF7X3Bj6j0HknZbfyjshyrIkSUeylf5mXnq9RiNaAxRMnkUWmavA0jlQo
 zWGHKe4EUCrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="282075386"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2020 01:51:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1680015C; Tue, 28 Apr 2020 11:51:13 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Cc:     Divya Sasidharan <divya.s.sasidharan@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: Add support for Elkhart Lake SCU/PMC
Date:   Tue, 28 Apr 2020 11:51:11 +0300
Message-Id: <20200428085113.47420-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

This adds SCU/PMC support for Intel Elkart Lake and compatible hardware
(such as Tiger Lake). It also adds me as maintainer of the Intel SCU
drivers to help the platform/x86 maintainers.

This is based on pdx86/for-next which includes the SCU IPC rework patches
this depends on.

Mika Westerberg (2):
  platform/x86: Add Elkhart Lake SCU/PMC support
  MAINTAINERS: Add me as maintainer of Intel SCU drivers

 MAINTAINERS                             |  6 +++
 drivers/platform/x86/Kconfig            |  9 ++++
 drivers/platform/x86/Makefile           |  1 +
 drivers/platform/x86/intel_scu_pltdrv.c | 58 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 drivers/platform/x86/intel_scu_pltdrv.c

-- 
2.26.2


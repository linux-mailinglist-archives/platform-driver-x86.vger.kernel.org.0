Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97643B9AAA
	for <lists+platform-driver-x86@lfdr.de>; Fri,  2 Jul 2021 04:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbhGBCZW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 1 Jul 2021 22:25:22 -0400
Received: from mga03.intel.com ([134.134.136.65]:24672 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230329AbhGBCZW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Jul 2021 22:25:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208700861"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="208700861"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 19:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="426360987"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by orsmga002.jf.intel.com with ESMTP; 01 Jul 2021 19:22:50 -0700
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
Subject: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Date:   Thu,  1 Jul 2021 19:19:59 -0700
Message-Id: <cover.1625191274.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,
The patch series add Alder Lake PCH-S support to PMC core driver.

Patch 1: Add Alderlake support to pmc_core driver
Patch 2: Add Latency Tolerance Reporting (LTR) support to Alder Lake
Patch 3: Add Alder Lake low power mode support for pmc_core
Patch 4: Add GBE Package C10 fix for Alder Lake

David E. Box (1):
  platform/x86: intel_pmc_core: Add GBE Package C10 fix for Alder Lake
    PCH

Gayatri Kammela (3):
  platform/x86: intel_pmc_core: Add Alderlake support to pmc_core driver
  platform/x86: intel_pmc_core: Add Latency Tolerance Reporting (LTR)
    support to Alder Lake
  platform/x86: intel_pmc_core: Add Alder Lake low power mode support
    for pmc_core

 drivers/platform/x86/intel_pmc_core.c | 307 +++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h |  17 ++
 2 files changed, 321 insertions(+), 3 deletions(-)

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>

base-commit: 62fb9874f5da54fdb243003b386128037319b219
-- 
2.25.1


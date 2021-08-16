Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7293EDBE8
	for <lists+platform-driver-x86@lfdr.de>; Mon, 16 Aug 2021 19:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhHPRCs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 16 Aug 2021 13:02:48 -0400
Received: from mga12.intel.com ([192.55.52.136]:11939 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229587AbhHPRCq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 13:02:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="195483009"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="195483009"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 10:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="509814872"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2021 10:02:13 -0700
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com, andriy.shevchenko@linux.intel.com,
        vicamo.yang@canonical.com, srinivas.pandruvada@intel.com,
        david.e.box@intel.com, chao.qin@intel.com,
        linux-kernel@vger.kernel.org, tamar.mashiah@intel.com,
        gregkh@linuxfoundation.org, rajatja@google.com,
        Shyam-sundar.S-k@amd.com, Alexander.Deucher@amd.com,
        mlimonci@amd.com, Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v7 0/5] Add Alder Lake PCH-S support to PMC core driver
Date:   Mon, 16 Aug 2021 09:58:29 -0700
Message-Id: <cover.1629091915.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,
The patch series move intel_pmc_core* files to pmc subfolder as well as
add Alder Lake PCH-S support to PMC core driver.

Patch 1: Move intel_pmc_core* files to pmc subfolder
Patch 2: Add Alderlake support to pmc core driver
Patch 3: Add Latency Tolerance Reporting (LTR) support to Alder Lake
Patch 4: Add Alder Lake low power mode support for pmc core
Patch 5: Add GBE Package C10 fix for Alder Lake

Changes since v1:
1) Add patch 1 to v2 i.e., Move intel_pmc_core* files to pmc subfolder.
2) Modify commit message for patch 2.

Changes since v2:
1) Dropped intel_pmc_ prefix from the file names.

Changes since v3:
1) Fixed an error reported by lkp.

Changes since v4:
1) Updated MAINTAINERS.

Changes since v5:
1) Fixed an module name error reported by Chao Qin.

Changes since v6:
1) Addressed the comments received from Andy.

David E. Box (1):
  platform/x86/intel: pmc/core: Add GBE Package C10 fix for Alder Lake
    PCH

Gayatri Kammela (4):
  platform/x86/intel: intel_pmc_core: Move intel_pmc_core* files to pmc
    subfolder
  platform/x86/intel: pmc/core: Add Alderlake support to pmc core driver
  platform/x86/intel: pmc/core: Add Latency Tolerance Reporting (LTR)
    support to Alder Lake
  platform/x86/intel: pmc/core: Add Alder Lake low power mode support
    for pmc core

 MAINTAINERS                                   |   2 +-
 drivers/platform/x86/Kconfig                  |  21 --
 drivers/platform/x86/Makefile                 |   1 -
 drivers/platform/x86/intel/Kconfig            |   1 +
 drivers/platform/x86/intel/Makefile           |   1 +
 drivers/platform/x86/intel/pmc/Kconfig        |  22 ++
 drivers/platform/x86/intel/pmc/Makefile       |   6 +
 .../{intel_pmc_core.c => intel/pmc/core.c}    | 309 +++++++++++++++++-
 .../{intel_pmc_core.h => intel/pmc/core.h}    |  17 +
 .../pmc/core_platform.c}                      |   0
 10 files changed, 353 insertions(+), 27 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/Kconfig
 create mode 100644 drivers/platform/x86/intel/pmc/Makefile
 rename drivers/platform/x86/{intel_pmc_core.c => intel/pmc/core.c} (85%)
 rename drivers/platform/x86/{intel_pmc_core.h => intel/pmc/core.h} (95%)
 rename drivers/platform/x86/{intel_pmc_core_pltdrv.c => intel/pmc/core_platform.c} (100%)

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Cc: You-Sheng Yang <vicamo.yang@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: Chao Qin <chao.qin@intel.com>

base-commit: 7c60610d476766e128cc4284bb6349732cbd6606
-- 
2.25.1


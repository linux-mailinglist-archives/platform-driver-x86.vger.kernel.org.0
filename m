Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760203DC3C4
	for <lists+platform-driver-x86@lfdr.de>; Sat, 31 Jul 2021 08:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhGaGKq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 31 Jul 2021 02:10:46 -0400
Received: from mga18.intel.com ([134.134.136.126]:54747 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhGaGKp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 31 Jul 2021 02:10:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="200417325"
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="200417325"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 23:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="508566287"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2021 23:10:36 -0700
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
Subject: [PATCH v6 0/5] Add Alder Lake PCH-S support to PMC core driver
Date:   Fri, 30 Jul 2021 23:07:11 -0700
Message-Id: <cover.1627710765.git.gayatri.kammela@intel.com>
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
1) Updated MAINTAINERS

Changes since v5:
1) Fixed an module name error reported by Chao Qin

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
 .../pmc/pltdrv.c}                             |   0
 10 files changed, 353 insertions(+), 27 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmc/Kconfig
 create mode 100644 drivers/platform/x86/intel/pmc/Makefile
 rename drivers/platform/x86/{intel_pmc_core.c => intel/pmc/core.c} (85%)
 rename drivers/platform/x86/{intel_pmc_core.h => intel/pmc/core.h} (95%)
 rename drivers/platform/x86/{intel_pmc_core_pltdrv.c => intel/pmc/pltdrv.c} (100%)

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Cc: You-Sheng Yang <vicamo.yang@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: Chao Qin <chao.qin@intel.com>

base-commit: c7d102232649226a69dddd58a4942cf13cff4f7c
-- 
2.25.1


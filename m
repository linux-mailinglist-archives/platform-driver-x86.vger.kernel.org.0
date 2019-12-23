Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2056E129728
	for <lists+platform-driver-x86@lfdr.de>; Mon, 23 Dec 2019 15:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfLWOTc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 23 Dec 2019 09:19:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:58347 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbfLWORW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Dec 2019 09:17:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Dec 2019 06:17:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; 
   d="scan'208";a="219181089"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 23 Dec 2019 06:17:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2539F107; Mon, 23 Dec 2019 16:17:16 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc:     Zha Qipeng <qipeng.zha@intel.com>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/37] platform/x86: Rework intel_scu_ipc and intel_pmc_ipc drivers
Date:   Mon, 23 Dec 2019 17:16:39 +0300
Message-Id: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

Currently both intel_scu_ipc.c and intel_pmc_ipc.c implement the same SCU
IPC communications with minor differences. This duplication does not make
much sense so this series reworks the two drivers so that there is only a
single implementation of the SCU IPC. In addition to that the API will be
updated to take SCU instance pointer as an argument, and most of the
callers will be converted to this new API. The old API is left there but
the plan is to get rid the callers and then the old API as well (this is
something we are working with Andy Shevchenko).

The intel_pmc_ipc.c is then moved under MFD which suits better for this
kind of a driver that pretty much sets up the SCU IPC and then creates a
bunch of platform devices for the things sitting behind the PMC. The driver
is renamed to intel_pmc_bxt.c which should follow the existing conventions
under drivers/mfd (and it is only meant for Intel Broxton derivatives).

I would prefer this to be merged through platform/x86 or MFD trees assuming
there are no objections.

I have tested this on Intel Edison (Merrifield) and Joule (Broxton-M).

Mika Westerberg (37):
  platform/x86: intel_mid_powerbtn: Take a copy of ddata
  platform/x86: intel_scu_ipcutil: Remove default y from Kconfig
  platform/x86: intel_scu_ipc: Add constants for register offsets
  platform/x86: intel_scu_ipc: Remove Lincroft support
  platform/x86: intel_scu_ipc: Drop intel_scu_ipc_i2c_cntrl()
  platform/x86: intel_scu_ipc: Fix interrupt support
  platform/x86: intel_scu_ipc: Sleeping is fine when polling
  platform/x86: intel_scu_ipc: Drop unused prototype intel_scu_ipc_fw_update()
  platform/x86: intel_scu_ipc: Drop unused macros
  platform/x86: intel_scu_ipc: Drop intel_scu_ipc_io[read|write][8|16]()
  platform/x86: intel_scu_ipc: Drop intel_scu_ipc_raw_command()
  platform/x86: intel_scu_ipc: Split out SCU IPC functionality from the SCU driver
  platform/x86: intel_scu_ipc: Reformat kernel-doc comments of exported functions
  platform/x86: intel_scu_ipc: Introduce new SCU IPC API
  platform/x86: intel_mid_powerbtn: Convert to use new SCU IPC API
  watchdog: intel-mid_wdt: Convert to use new SCU IPC API
  platform/x86: intel_scu_ipcutil: Convert to use new SCU IPC API
  platform/x86: intel_pmc_ipc: Make intel_pmc_gcr_update() static
  platform/x86: intel_pmc_ipc: Make intel_pmc_ipc_simple_command() static
  platform/x86: intel_pmc_ipc: Make intel_pmc_ipc_raw_cmd() static
  platform/x86: intel_pmc_ipc: Drop intel_pmc_gcr_read() and intel_pmc_gcr_write()
  platform/x86: intel_pmc_ipc: Drop ipc_data_readb()
  platform/x86: intel_pmc_ipc: Get rid of unnecessary includes
  platform/x86: intel_scu_ipc: Add function to remove SCU IPC
  platform/x86: intel_pmc_ipc: Start using SCU IPC
  mfd: intel_soc_pmic: Add SCU IPC member to struct intel_soc_pmic
  mfd: intel_soc_pmic_bxtwc: Convert to use new SCU IPC API
  mfd: intel_soc_pmic_mrfld: Convert to use new SCU IPC API
  platform/x86: intel_telemetry: Convert to use new SCU IPC API
  platform/x86: intel_pmc_ipc: Drop intel_pmc_ipc_command()
  x86/platform/intel-mid: Add empty stubs for intel_scu_devices_[create|destroy]()
  platform/x86: intel_pmc_ipc: Move PCI IDs to intel_scu_pcidrv.c
  platform/x86: intel_pmc_ipc: Move under MFD
  mfd: intel_pmc_bxt: Convert to use MFD APIs
  mfd: intel_pmc_bxt: Use octal permissions in sysfs attributes
  mfd: intel_pmc_bxt: Switch to use driver->dev_groups
  MAINTAINERS: Update entry for Intel Broxton PMC driver

 MAINTAINERS                                   |   13 +-
 arch/x86/Kconfig                              |    2 +-
 arch/x86/include/asm/intel-mid.h              |    9 +-
 arch/x86/include/asm/intel_pmc_ipc.h          |   91 --
 arch/x86/include/asm/intel_scu_ipc.h          |  104 +-
 arch/x86/include/asm/intel_scu_ipc_legacy.h   |   76 ++
 arch/x86/include/asm/intel_telemetry.h        |    3 +
 drivers/mfd/Kconfig                           |   18 +-
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/intel_pmc_bxt.c                   |  539 +++++++++
 drivers/mfd/intel_soc_pmic_bxtwc.c            |   22 +-
 drivers/mfd/intel_soc_pmic_mrfld.c            |   10 +-
 drivers/platform/x86/Kconfig                  |   49 +-
 drivers/platform/x86/Makefile                 |    2 +-
 drivers/platform/x86/intel_mid_powerbtn.c     |   20 +-
 drivers/platform/x86/intel_pmc_ipc.c          | 1031 -----------------
 drivers/platform/x86/intel_scu_ipc.c          |  681 +++++------
 drivers/platform/x86/intel_scu_ipcutil.c      |   43 +-
 drivers/platform/x86/intel_scu_pcidrv.c       |   75 ++
 .../platform/x86/intel_telemetry_debugfs.c    |    2 +-
 drivers/platform/x86/intel_telemetry_pltdrv.c |  101 +-
 drivers/usb/typec/tcpm/Kconfig                |    2 +-
 drivers/watchdog/intel-mid_wdt.c              |   53 +-
 include/linux/mfd/intel_pmc_bxt.h             |   50 +
 include/linux/mfd/intel_soc_pmic.h            |    1 +
 25 files changed, 1305 insertions(+), 1693 deletions(-)
 delete mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
 create mode 100644 arch/x86/include/asm/intel_scu_ipc_legacy.h
 create mode 100644 drivers/mfd/intel_pmc_bxt.c
 delete mode 100644 drivers/platform/x86/intel_pmc_ipc.c
 create mode 100644 drivers/platform/x86/intel_scu_pcidrv.c
 create mode 100644 include/linux/mfd/intel_pmc_bxt.h

-- 
2.24.0


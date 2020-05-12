Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16A71D0329
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 May 2020 01:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgELXh1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 12 May 2020 19:37:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:46780 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgELXh1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 May 2020 19:37:27 -0400
IronPort-SDR: kvWJrqOPjV9jZFGIhu1BzDBSVOEO6j7Awbf9vbSN5FeMMEpewcMQDzE/TNNI98mUyhK3KoMg1x
 UCppgmanMf/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 16:37:26 -0700
IronPort-SDR: UTTyQ50wFXE8YAZ5Y/itY3DGPYjCb+AMptFxIf249mLUvEFFNZp0uGYTIdc6gORIzFuANsxZ6z
 jS85R7lOVshg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,385,1583222400"; 
   d="scan'208";a="251604229"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2020 16:37:24 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYeSi-000Glk-2j; Wed, 13 May 2020 07:37:24 +0800
Date:   Wed, 13 May 2020 07:37:05 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:review-andy] BUILD SUCCESS
 b10e72bd695b5224adab14dbbb0315f22ba3a529
Message-ID: <5ebb3321.glK41BorwuJnVC5R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  review-andy
branch HEAD: b10e72bd695b5224adab14dbbb0315f22ba3a529  platform/x86: thinkpad_acpi: Convert to use sysfs_match_string()

Warning in current branch:

drivers/platform/x86/thinkpad_acpi.c:9017:31: sparse: sparse: dubious: !x & y

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allmodconfig
    `-- drivers-platform-x86-thinkpad_acpi.c:sparse:sparse:dubious:x-y

elapsed time: 482m

configs tested: 115
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
m68k                             allyesconfig
arm                  colibri_pxa300_defconfig
c6x                        evmc6457_defconfig
powerpc                     powernv_defconfig
mips                 decstation_r4k_defconfig
h8300                            allyesconfig
arm                       aspeed_g4_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     ep8248e_defconfig
openrisc                    or1ksim_defconfig
h8300                     edosk2674_defconfig
sh                           se7751_defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
i386                                defconfig
arm64                            alldefconfig
arm                        vexpress_defconfig
m68k                        m5272c3_defconfig
sh                             sh03_defconfig
arm                         lpc32xx_defconfig
riscv                            allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200512
i386                 randconfig-a005-20200512
i386                 randconfig-a003-20200512
i386                 randconfig-a001-20200512
i386                 randconfig-a004-20200512
i386                 randconfig-a002-20200512
x86_64               randconfig-a016-20200512
x86_64               randconfig-a012-20200512
x86_64               randconfig-a015-20200512
x86_64               randconfig-a013-20200512
x86_64               randconfig-a014-20200512
x86_64               randconfig-a011-20200512
i386                 randconfig-a012-20200512
i386                 randconfig-a016-20200512
i386                 randconfig-a014-20200512
i386                 randconfig-a011-20200512
i386                 randconfig-a013-20200512
i386                 randconfig-a015-20200512
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
sparc                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

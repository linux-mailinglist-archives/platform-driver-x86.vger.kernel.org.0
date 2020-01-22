Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9322C144BC4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jan 2020 07:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgAVGdI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jan 2020 01:33:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:39912 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgAVGdI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jan 2020 01:33:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 22:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; 
   d="scan'208";a="275523717"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2020 22:33:05 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iu9ZZ-0007w0-Er; Wed, 22 Jan 2020 14:33:05 +0800
Date:   Wed, 22 Jan 2020 14:32:38 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:review-andy] BUILD SUCCESS
 a3e2b51ca31f56317d2b88fe226b06306aecc5b6
Message-ID: <5e27ec86.Olr/kD4a4USeIhOi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  review-andy
branch HEAD: a3e2b51ca31f56317d2b88fe226b06306aecc5b6  platform/x86: asus-nb-wmi: Support left round button on N56VB

elapsed time: 2688m

configs tested: 122
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
openrisc             randconfig-a001-20200120
xtensa               randconfig-a001-20200120
csky                 randconfig-a001-20200120
sh                   randconfig-a001-20200120
s390                 randconfig-a001-20200120
parisc                        c3000_defconfig
parisc                         b180_defconfig
parisc                              defconfig
parisc                            allnoconfig
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                              fedora-25
x86_64                                  kexec
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
h8300                     edosk2674_defconfig
m68k                           sun3_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
s390                              allnoconfig
s390                             alldefconfig
s390                          debug_defconfig
s390                             allmodconfig
s390                                defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
arc                  randconfig-a001-20200122
arm                  randconfig-a001-20200122
arm64                randconfig-a001-20200122
ia64                 randconfig-a001-20200122
powerpc              randconfig-a001-20200122
sparc                randconfig-a001-20200122
openrisc             randconfig-a001-20200121
csky                 randconfig-a001-20200121
xtensa               randconfig-a001-20200121
sh                   randconfig-a001-20200121
s390                 randconfig-a001-20200121
sparc64                          allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
ia64                             alldefconfig
mips                             allmodconfig
mips                           32r2_defconfig
mips                             allyesconfig
mips                              allnoconfig
arm                              allmodconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig
i386                              allnoconfig
nds32                               defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
xtensa                       common_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
xtensa                          iss_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
i386                 randconfig-d002-20200121
x86_64               randconfig-d003-20200121
x86_64               randconfig-d002-20200121
i386                 randconfig-d001-20200121
riscv                randconfig-a001-20200121
alpha                randconfig-a001-20200121
parisc               randconfig-a001-20200121
m68k                 randconfig-a001-20200121
nds32                randconfig-a001-20200121
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
h8300                randconfig-a001-20200122
nios2                randconfig-a001-20200122
c6x                  randconfig-a001-20200122
sparc64              randconfig-a001-20200122
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
h8300                randconfig-a001-20200121
nios2                randconfig-a001-20200121
c6x                  randconfig-a001-20200121
microblaze           randconfig-a001-20200121
sparc64              randconfig-a001-20200121
arc                              allyesconfig
microblaze                    nommu_defconfig
microblaze                      mmu_defconfig
arc                                 defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

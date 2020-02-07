Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5AF1554B9
	for <lists+platform-driver-x86@lfdr.de>; Fri,  7 Feb 2020 10:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgBGJcO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 7 Feb 2020 04:32:14 -0500
Received: from mga09.intel.com ([134.134.136.24]:14185 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgBGJcO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Feb 2020 04:32:14 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Feb 2020 01:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,412,1574150400"; 
   d="scan'208";a="279932536"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2020 01:32:11 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1izzzf-000Dth-Dq; Fri, 07 Feb 2020 17:32:11 +0800
Date:   Fri, 07 Feb 2020 17:31:37 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:review-andy] BUILD SUCCESS
 2bb2e04fe0251bb4bb18478bc5f85457421e02cd
Message-ID: <5e3d2e79.9df9mxJXR9vjScNa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  review-andy
branch HEAD: 2bb2e04fe0251bb4bb18478bc5f85457421e02cd  platform/x86: intel_pmc_core: Add debugfs support to access live status registers

elapsed time: 2883m

configs tested: 315
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
s390                             alldefconfig
s390                                defconfig
riscv                               defconfig
sparc64                             defconfig
h8300                       h8s-sim_defconfig
nds32                             allnoconfig
sparc64                          allmodconfig
nds32                               defconfig
sh                          rsk7269_defconfig
powerpc                       ppc64_defconfig
ia64                             allyesconfig
m68k                          multi_defconfig
alpha                               defconfig
parisc                              defconfig
um                             i386_defconfig
arc                                 defconfig
ia64                                defconfig
sparc64                          allyesconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
microblaze                    nommu_defconfig
i386                             alldefconfig
sh                                allnoconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
csky                                defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
x86_64               randconfig-a001-20200207
x86_64               randconfig-a002-20200207
x86_64               randconfig-a003-20200207
i386                 randconfig-a001-20200207
i386                 randconfig-a002-20200207
i386                 randconfig-a003-20200207
x86_64               randconfig-a001-20200206
x86_64               randconfig-a002-20200206
x86_64               randconfig-a003-20200206
i386                 randconfig-a001-20200206
i386                 randconfig-a002-20200206
i386                 randconfig-a003-20200206
i386                 randconfig-a003-20200205
i386                 randconfig-a002-20200205
x86_64               randconfig-a003-20200205
x86_64               randconfig-a002-20200205
i386                 randconfig-a001-20200205
x86_64               randconfig-a001-20200205
i386                 randconfig-a003-20200204
i386                 randconfig-a002-20200204
x86_64               randconfig-a003-20200204
x86_64               randconfig-a002-20200204
i386                 randconfig-a001-20200204
x86_64               randconfig-a001-20200204
alpha                randconfig-a001-20200206
m68k                 randconfig-a001-20200206
mips                 randconfig-a001-20200206
nds32                randconfig-a001-20200206
parisc               randconfig-a001-20200206
riscv                randconfig-a001-20200206
alpha                randconfig-a001-20200207
m68k                 randconfig-a001-20200207
mips                 randconfig-a001-20200207
nds32                randconfig-a001-20200207
parisc               randconfig-a001-20200207
alpha                randconfig-a001-20200204
parisc               randconfig-a001-20200204
m68k                 randconfig-a001-20200204
nds32                randconfig-a001-20200204
mips                 randconfig-a001-20200204
riscv                randconfig-a001-20200204
c6x                  randconfig-a001-20200206
h8300                randconfig-a001-20200206
microblaze           randconfig-a001-20200206
nios2                randconfig-a001-20200206
sparc64              randconfig-a001-20200206
c6x                  randconfig-a001-20200205
h8300                randconfig-a001-20200205
microblaze           randconfig-a001-20200205
nios2                randconfig-a001-20200205
sparc64              randconfig-a001-20200205
csky                 randconfig-a001-20200205
openrisc             randconfig-a001-20200205
s390                 randconfig-a001-20200205
sh                   randconfig-a001-20200205
xtensa               randconfig-a001-20200205
csky                 randconfig-a001-20200206
openrisc             randconfig-a001-20200206
s390                 randconfig-a001-20200206
sh                   randconfig-a001-20200206
xtensa               randconfig-a001-20200206
csky                 randconfig-a001-20200207
openrisc             randconfig-a001-20200207
s390                 randconfig-a001-20200207
xtensa               randconfig-a001-20200207
x86_64               randconfig-b001-20200206
x86_64               randconfig-b002-20200206
x86_64               randconfig-b003-20200206
i386                 randconfig-b001-20200206
i386                 randconfig-b002-20200206
i386                 randconfig-b003-20200206
x86_64               randconfig-b001-20200205
x86_64               randconfig-b002-20200205
x86_64               randconfig-b003-20200205
i386                 randconfig-b001-20200205
i386                 randconfig-b002-20200205
i386                 randconfig-b003-20200205
x86_64               randconfig-b001-20200207
x86_64               randconfig-b002-20200207
x86_64               randconfig-b003-20200207
i386                 randconfig-b001-20200207
i386                 randconfig-b002-20200207
i386                 randconfig-b003-20200207
x86_64               randconfig-c001-20200207
x86_64               randconfig-c002-20200207
x86_64               randconfig-c003-20200207
i386                 randconfig-c001-20200207
i386                 randconfig-c002-20200207
i386                 randconfig-c003-20200207
x86_64               randconfig-c001-20200204
x86_64               randconfig-c002-20200204
x86_64               randconfig-c003-20200204
i386                 randconfig-c001-20200204
i386                 randconfig-c002-20200204
i386                 randconfig-c003-20200204
x86_64               randconfig-d001-20200205
x86_64               randconfig-d002-20200205
x86_64               randconfig-d003-20200205
i386                 randconfig-d001-20200205
i386                 randconfig-d002-20200205
i386                 randconfig-d003-20200205
x86_64               randconfig-d001-20200206
x86_64               randconfig-d002-20200206
x86_64               randconfig-d003-20200206
i386                 randconfig-d001-20200206
i386                 randconfig-d002-20200206
i386                 randconfig-d003-20200206
x86_64               randconfig-d001-20200207
x86_64               randconfig-d002-20200207
x86_64               randconfig-d003-20200207
i386                 randconfig-d001-20200207
i386                 randconfig-d002-20200207
i386                 randconfig-d003-20200207
i386                 randconfig-e003-20200205
i386                 randconfig-e002-20200205
x86_64               randconfig-e001-20200205
x86_64               randconfig-e003-20200205
i386                 randconfig-e001-20200205
x86_64               randconfig-e002-20200205
x86_64               randconfig-e001-20200206
x86_64               randconfig-e002-20200206
x86_64               randconfig-e003-20200206
i386                 randconfig-e001-20200206
i386                 randconfig-e002-20200206
i386                 randconfig-e003-20200206
x86_64               randconfig-e001-20200207
x86_64               randconfig-e002-20200207
x86_64               randconfig-e003-20200207
i386                 randconfig-e001-20200207
i386                 randconfig-e002-20200207
i386                 randconfig-e003-20200207
x86_64               randconfig-e001-20200204
x86_64               randconfig-e002-20200204
x86_64               randconfig-e003-20200204
i386                 randconfig-e001-20200204
i386                 randconfig-e002-20200204
i386                 randconfig-e003-20200204
x86_64               randconfig-f001-20200207
x86_64               randconfig-f002-20200207
x86_64               randconfig-f003-20200207
i386                 randconfig-f001-20200207
i386                 randconfig-f002-20200207
i386                 randconfig-f003-20200207
x86_64               randconfig-f001-20200204
x86_64               randconfig-f002-20200204
x86_64               randconfig-f003-20200204
i386                 randconfig-f001-20200204
i386                 randconfig-f002-20200204
i386                 randconfig-f003-20200204
x86_64               randconfig-f001-20200206
x86_64               randconfig-f002-20200206
x86_64               randconfig-f003-20200206
i386                 randconfig-f001-20200206
i386                 randconfig-f002-20200206
i386                 randconfig-f003-20200206
x86_64               randconfig-g001-20200205
x86_64               randconfig-g002-20200205
x86_64               randconfig-g003-20200205
i386                 randconfig-g001-20200205
i386                 randconfig-g002-20200205
i386                 randconfig-g003-20200205
x86_64               randconfig-g001-20200206
x86_64               randconfig-g002-20200206
x86_64               randconfig-g003-20200206
i386                 randconfig-g001-20200206
i386                 randconfig-g002-20200206
i386                 randconfig-g003-20200206
x86_64               randconfig-g001-20200207
x86_64               randconfig-g002-20200207
x86_64               randconfig-g003-20200207
i386                 randconfig-g001-20200207
i386                 randconfig-g002-20200207
i386                 randconfig-g003-20200207
x86_64               randconfig-h001-20200206
x86_64               randconfig-h002-20200206
x86_64               randconfig-h003-20200206
i386                 randconfig-h001-20200206
i386                 randconfig-h002-20200206
i386                 randconfig-h003-20200206
x86_64               randconfig-h001-20200204
i386                 randconfig-h002-20200204
x86_64               randconfig-h002-20200204
i386                 randconfig-h003-20200204
x86_64               randconfig-h003-20200204
i386                 randconfig-h001-20200204
x86_64               randconfig-h001-20200207
x86_64               randconfig-h002-20200207
x86_64               randconfig-h003-20200207
i386                 randconfig-h001-20200207
i386                 randconfig-h002-20200207
i386                 randconfig-h003-20200207
x86_64               randconfig-h001-20200205
x86_64               randconfig-h002-20200205
x86_64               randconfig-h003-20200205
i386                 randconfig-h001-20200205
i386                 randconfig-h002-20200205
i386                 randconfig-h003-20200205
arc                  randconfig-a001-20200206
arm                  randconfig-a001-20200206
arm64                randconfig-a001-20200206
ia64                 randconfig-a001-20200206
powerpc              randconfig-a001-20200206
sparc                randconfig-a001-20200206
arc                  randconfig-a001-20200204
arm                  randconfig-a001-20200204
arm64                randconfig-a001-20200204
ia64                 randconfig-a001-20200204
powerpc              randconfig-a001-20200204
sparc                randconfig-a001-20200204
arc                  randconfig-a001-20200205
ia64                 randconfig-a001-20200205
sparc                randconfig-a001-20200205
arm64                randconfig-a001-20200205
arm                  randconfig-a001-20200205
arc                  randconfig-a001-20200207
arm                  randconfig-a001-20200207
arm64                randconfig-a001-20200207
ia64                 randconfig-a001-20200207
powerpc              randconfig-a001-20200207
sparc                randconfig-a001-20200207
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                           allnoconfig
um                                  defconfig
um                           x86_64_defconfig
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                              fedora-25
x86_64                                  kexec
x86_64                         rhel-7.2-clear

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

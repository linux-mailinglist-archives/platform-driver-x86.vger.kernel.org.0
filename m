Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8248713B8C2
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Jan 2020 06:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgAOFDN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 15 Jan 2020 00:03:13 -0500
Received: from mga12.intel.com ([192.55.52.136]:59373 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgAOFDN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jan 2020 00:03:13 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jan 2020 21:03:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; 
   d="scan'208";a="242734949"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Jan 2020 21:03:11 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1irapj-0004qF-5b; Wed, 15 Jan 2020 13:03:11 +0800
Date:   Wed, 15 Jan 2020 13:02:21 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:review-andy] BUILD SUCCESS
 d04a9d22fb759e98c5d22e1419e30870f3502f3d
Message-ID: <5e1e9cdd./Jj+6aPA70WUrm28%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  review-andy
branch HEAD: d04a9d22fb759e98c5d22e1419e30870f3502f3d  MAINTAINERS: Update for the intel uncore frequency control

elapsed time: 1564m

configs tested: 140
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

x86_64               randconfig-b001-20200114
x86_64               randconfig-b002-20200114
x86_64               randconfig-b003-20200114
i386                 randconfig-b001-20200114
i386                 randconfig-b002-20200114
i386                 randconfig-b003-20200114
c6x                  randconfig-a001-20200114
h8300                randconfig-a001-20200114
microblaze           randconfig-a001-20200114
nios2                randconfig-a001-20200114
sparc64              randconfig-a001-20200114
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
ia64                                defconfig
powerpc                             defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                         b180_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64               randconfig-h001-20200115
x86_64               randconfig-h002-20200115
x86_64               randconfig-h003-20200115
i386                 randconfig-h001-20200115
i386                 randconfig-h002-20200115
i386                 randconfig-h003-20200115
alpha                randconfig-a001-20200114
m68k                 randconfig-a001-20200114
mips                 randconfig-a001-20200114
nds32                randconfig-a001-20200114
parisc               randconfig-a001-20200114
riscv                randconfig-a001-20200114
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-a001-20200114
arm                  randconfig-a001-20200114
arm64                randconfig-a001-20200114
ia64                 randconfig-a001-20200114
powerpc              randconfig-a001-20200114
sparc                randconfig-a001-20200114
x86_64               randconfig-a001-20200114
x86_64               randconfig-a002-20200114
x86_64               randconfig-a003-20200114
i386                 randconfig-a001-20200114
i386                 randconfig-a002-20200114
i386                 randconfig-a003-20200114
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
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
csky                 randconfig-a001-20200114
openrisc             randconfig-a001-20200114
s390                 randconfig-a001-20200114
sh                   randconfig-a001-20200114
xtensa               randconfig-a001-20200114
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
x86_64               randconfig-f001-20200115
x86_64               randconfig-f002-20200115
x86_64               randconfig-f003-20200115
i386                 randconfig-f001-20200115
i386                 randconfig-f002-20200115
i386                 randconfig-f003-20200115

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

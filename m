Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5344A14F814
	for <lists+platform-driver-x86@lfdr.de>; Sat,  1 Feb 2020 15:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgBAOli (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 1 Feb 2020 09:41:38 -0500
Received: from mga11.intel.com ([192.55.52.93]:33938 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgBAOli (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Feb 2020 09:41:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Feb 2020 06:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,390,1574150400"; 
   d="scan'208";a="223443423"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Feb 2020 06:41:34 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ixtxl-0006ry-V8; Sat, 01 Feb 2020 22:41:33 +0800
Date:   Sat, 01 Feb 2020 22:41:04 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:review-andy] BUILD SUCCESS
 407d14e619b1249eef142163b078312ed7c821cb
Message-ID: <5e358e00.dfOY6KdcwR74fhgJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  review-andy
branch HEAD: 407d14e619b1249eef142163b078312ed7c821cb  platform/x86: thinkpad_acpi: remove unused defines

elapsed time: 2889m

configs tested: 235
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
parisc                              defconfig
arc                              allyesconfig
parisc                         b180_defconfig
m68k                           sun3_defconfig
c6x                        evmc6678_defconfig
microblaze                    nommu_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
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
parisc                        c3000_defconfig
x86_64               randconfig-a001-20200130
x86_64               randconfig-a002-20200130
x86_64               randconfig-a003-20200130
i386                 randconfig-a001-20200130
i386                 randconfig-a002-20200130
i386                 randconfig-a003-20200130
x86_64               randconfig-a001-20200129
x86_64               randconfig-a002-20200129
x86_64               randconfig-a003-20200129
i386                 randconfig-a001-20200129
i386                 randconfig-a002-20200129
i386                 randconfig-a003-20200129
x86_64               randconfig-a001-20200131
x86_64               randconfig-a002-20200131
x86_64               randconfig-a003-20200131
i386                 randconfig-a001-20200131
i386                 randconfig-a002-20200131
i386                 randconfig-a003-20200131
alpha                randconfig-a001-20200130
m68k                 randconfig-a001-20200130
mips                 randconfig-a001-20200130
nds32                randconfig-a001-20200130
parisc               randconfig-a001-20200130
riscv                randconfig-a001-20200130
alpha                randconfig-a001-20200131
m68k                 randconfig-a001-20200131
mips                 randconfig-a001-20200131
nds32                randconfig-a001-20200131
parisc               randconfig-a001-20200131
c6x                  randconfig-a001-20200130
h8300                randconfig-a001-20200130
microblaze           randconfig-a001-20200130
nios2                randconfig-a001-20200130
sparc64              randconfig-a001-20200130
c6x                  randconfig-a001-20200131
h8300                randconfig-a001-20200131
microblaze           randconfig-a001-20200131
nios2                randconfig-a001-20200131
sparc64              randconfig-a001-20200131
csky                 randconfig-a001-20200130
openrisc             randconfig-a001-20200130
s390                 randconfig-a001-20200130
sh                   randconfig-a001-20200130
xtensa               randconfig-a001-20200130
x86_64               randconfig-b001-20200131
x86_64               randconfig-b002-20200131
x86_64               randconfig-b003-20200131
i386                 randconfig-b001-20200131
i386                 randconfig-b002-20200131
i386                 randconfig-b003-20200131
x86_64               randconfig-b001-20200129
x86_64               randconfig-b002-20200129
x86_64               randconfig-b003-20200129
i386                 randconfig-b001-20200129
i386                 randconfig-b002-20200129
i386                 randconfig-b003-20200129
x86_64               randconfig-c001-20200131
x86_64               randconfig-c002-20200131
x86_64               randconfig-c003-20200131
i386                 randconfig-c001-20200131
i386                 randconfig-c002-20200131
i386                 randconfig-c003-20200131
x86_64               randconfig-c001-20200129
x86_64               randconfig-c002-20200129
x86_64               randconfig-c003-20200129
i386                 randconfig-c001-20200129
i386                 randconfig-c002-20200129
i386                 randconfig-c003-20200129
x86_64               randconfig-d001-20200129
x86_64               randconfig-d002-20200129
x86_64               randconfig-d003-20200129
i386                 randconfig-d001-20200129
i386                 randconfig-d002-20200129
i386                 randconfig-d003-20200129
x86_64               randconfig-d001-20200130
x86_64               randconfig-d002-20200130
x86_64               randconfig-d003-20200130
i386                 randconfig-d001-20200130
i386                 randconfig-d002-20200130
i386                 randconfig-d003-20200130
x86_64               randconfig-d001-20200131
x86_64               randconfig-d002-20200131
x86_64               randconfig-d003-20200131
i386                 randconfig-d001-20200131
i386                 randconfig-d002-20200131
i386                 randconfig-d003-20200131
i386                 randconfig-e002-20200129
x86_64               randconfig-e002-20200129
i386                 randconfig-e001-20200129
i386                 randconfig-e003-20200129
x86_64               randconfig-e003-20200129
x86_64               randconfig-e001-20200129
x86_64               randconfig-f001-20200130
x86_64               randconfig-f002-20200130
x86_64               randconfig-f003-20200130
i386                 randconfig-f001-20200130
i386                 randconfig-f002-20200130
i386                 randconfig-f003-20200130
x86_64               randconfig-f001-20200129
x86_64               randconfig-f002-20200129
x86_64               randconfig-f003-20200129
i386                 randconfig-f001-20200129
i386                 randconfig-f002-20200129
i386                 randconfig-f003-20200129
x86_64               randconfig-g001-20200129
x86_64               randconfig-g002-20200129
x86_64               randconfig-g003-20200129
i386                 randconfig-g001-20200129
i386                 randconfig-g002-20200129
i386                 randconfig-g003-20200129
x86_64               randconfig-g001-20200130
x86_64               randconfig-g002-20200130
x86_64               randconfig-g003-20200130
i386                 randconfig-g001-20200130
i386                 randconfig-g002-20200130
i386                 randconfig-g003-20200130
x86_64               randconfig-h001-20200129
x86_64               randconfig-h002-20200129
x86_64               randconfig-h003-20200129
i386                 randconfig-h001-20200129
i386                 randconfig-h002-20200129
i386                 randconfig-h003-20200129
arc                  randconfig-a001-20200131
arm                  randconfig-a001-20200131
arm64                randconfig-a001-20200131
ia64                 randconfig-a001-20200131
powerpc              randconfig-a001-20200131
sparc                randconfig-a001-20200131
arc                  randconfig-a001-20200130
arm                  randconfig-a001-20200130
arm64                randconfig-a001-20200130
ia64                 randconfig-a001-20200130
powerpc              randconfig-a001-20200130
sparc                randconfig-a001-20200130
arc                  randconfig-a001-20200129
arm                  randconfig-a001-20200129
arm64                randconfig-a001-20200129
ia64                 randconfig-a001-20200129
powerpc              randconfig-a001-20200129
sparc                randconfig-a001-20200129
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

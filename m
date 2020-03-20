Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE72F18DAA6
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Mar 2020 23:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgCTWBa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Mar 2020 18:01:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:57876 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbgCTWB3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Mar 2020 18:01:29 -0400
IronPort-SDR: lFzwJw2tjdbTYGbwTFVWMNXwTon7SjHFYsw/SbFdBuyj/u8fOHArnc68hU8ZxpjyEmoM2HOa6E
 WCKwaHqp1pFw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 15:01:29 -0700
IronPort-SDR: Dpi8dURFJGEGkTXK3y9Mf14BM/x6pMcZW1tlWR5e3hau831sB7ZkykTt8375zLV2vRjH6K2V0B
 tm69gdekTZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; 
   d="scan'208";a="324991155"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Mar 2020 15:01:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jFPhm-0000K6-No; Sat, 21 Mar 2020 06:01:26 +0800
Date:   Sat, 21 Mar 2020 06:00:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:review-andy] BUILD SUCCESS
 81998278bb6e65e0bac70ee422910b1981277a48
Message-ID: <5e753d12.4jZR/3/QNVFYWL7+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  review-andy
branch HEAD: 81998278bb6e65e0bac70ee422910b1981277a48  MAINTAINERS: Update entry for Intel Broxton PMC driver

elapsed time: 482m

configs tested: 180
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
ia64                             allyesconfig
nds32                             allnoconfig
parisc                generic-64bit_defconfig
nios2                         3c120_defconfig
xtensa                          iss_defconfig
ia64                                defconfig
powerpc                             defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
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
parisc                           allyesconfig
parisc                generic-32bit_defconfig
i386                 randconfig-a002-20200320
i386                 randconfig-a003-20200320
x86_64               randconfig-a002-20200320
i386                 randconfig-a001-20200320
x86_64               randconfig-a001-20200320
x86_64               randconfig-a003-20200320
mips                 randconfig-a001-20200320
nds32                randconfig-a001-20200320
m68k                 randconfig-a001-20200320
parisc               randconfig-a001-20200320
alpha                randconfig-a001-20200320
riscv                randconfig-a001-20200320
alpha                randconfig-a001-20200321
m68k                 randconfig-a001-20200321
mips                 randconfig-a001-20200321
nds32                randconfig-a001-20200321
parisc               randconfig-a001-20200321
riscv                randconfig-a001-20200321
c6x                  randconfig-a001-20200320
h8300                randconfig-a001-20200320
microblaze           randconfig-a001-20200320
nios2                randconfig-a001-20200320
sparc64              randconfig-a001-20200320
csky                 randconfig-a001-20200320
openrisc             randconfig-a001-20200320
s390                 randconfig-a001-20200320
sh                   randconfig-a001-20200320
xtensa               randconfig-a001-20200320
x86_64               randconfig-b001-20200320
x86_64               randconfig-b002-20200320
x86_64               randconfig-b003-20200320
i386                 randconfig-b001-20200320
i386                 randconfig-b002-20200320
i386                 randconfig-b003-20200320
x86_64               randconfig-c003-20200320
i386                 randconfig-c002-20200320
x86_64               randconfig-c001-20200320
i386                 randconfig-c003-20200320
i386                 randconfig-c001-20200320
x86_64               randconfig-c002-20200320
x86_64               randconfig-d001-20200320
x86_64               randconfig-d002-20200320
x86_64               randconfig-d003-20200320
i386                 randconfig-d001-20200320
i386                 randconfig-d002-20200320
i386                 randconfig-d003-20200320
x86_64               randconfig-e001-20200320
x86_64               randconfig-e002-20200320
x86_64               randconfig-e003-20200320
i386                 randconfig-e001-20200320
i386                 randconfig-e002-20200320
i386                 randconfig-e003-20200320
x86_64               randconfig-e001-20200321
x86_64               randconfig-e002-20200321
x86_64               randconfig-e003-20200321
i386                 randconfig-e001-20200321
i386                 randconfig-e002-20200321
i386                 randconfig-e003-20200321
x86_64               randconfig-f001-20200320
x86_64               randconfig-f002-20200320
x86_64               randconfig-f003-20200320
i386                 randconfig-f001-20200320
i386                 randconfig-f002-20200320
i386                 randconfig-f003-20200320
x86_64               randconfig-g001-20200320
x86_64               randconfig-g002-20200320
x86_64               randconfig-g003-20200320
i386                 randconfig-g001-20200320
i386                 randconfig-g002-20200320
i386                 randconfig-g003-20200320
x86_64               randconfig-h001-20200320
x86_64               randconfig-h002-20200320
x86_64               randconfig-h003-20200320
i386                 randconfig-h001-20200320
i386                 randconfig-h002-20200320
i386                 randconfig-h003-20200320
arc                  randconfig-a001-20200320
arm                  randconfig-a001-20200320
arm64                randconfig-a001-20200320
ia64                 randconfig-a001-20200320
powerpc              randconfig-a001-20200320
sparc                randconfig-a001-20200320
arm                  randconfig-a001-20200321
arm64                randconfig-a001-20200321
ia64                 randconfig-a001-20200321
powerpc              randconfig-a001-20200321
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

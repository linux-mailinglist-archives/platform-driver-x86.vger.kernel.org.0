Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE741BCCD3
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Apr 2020 21:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgD1T6s (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Apr 2020 15:58:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:27871 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728474AbgD1T6r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Apr 2020 15:58:47 -0400
IronPort-SDR: 568DBaFUCx6pp1gEOlwFPqwQibLy0sDls6dQiqeKPMHN8fGqpUP44BgjD/ev/CyNfbTSAuDn+3
 YYXNQ8BxwxWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 12:58:43 -0700
IronPort-SDR: dMa594NEWk4EAbavvofQikpGIV70YHHXR/+6sPaYvIRn1ZqyK3TIZHpKge5ota4QbA4MnKQGX5
 b1bp6vh/pWww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
   d="scan'208";a="249264106"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2020 12:58:42 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTWNN-0005wb-Di; Wed, 29 Apr 2020 03:58:41 +0800
Date:   Wed, 29 Apr 2020 03:57:49 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:review-andy] BUILD SUCCESS
 6f2bf93ff685364f833c8a977925cb3134fb8108
Message-ID: <5ea88abd.w9+YdhswI0itedwa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  review-andy
branch HEAD: 6f2bf93ff685364f833c8a977925cb3134fb8108  platform/x86: Add Slim Bootloader firmware update signaling driver

elapsed time: 480m

configs tested: 163
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
sparc                            allyesconfig
csky                                defconfig
sparc64                          allyesconfig
um                             i386_defconfig
m68k                             allmodconfig
sparc64                          allmodconfig
powerpc                             defconfig
ia64                                defconfig
h8300                       h8s-sim_defconfig
mips                         tb0287_defconfig
openrisc                    or1ksim_defconfig
microblaze                      mmu_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
xtensa                          iss_defconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
nds32                               defconfig
nds32                             allnoconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                malta_kvm_guest_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc               randconfig-a001-20200428
m68k                 randconfig-a001-20200428
alpha                randconfig-a001-20200428
nds32                randconfig-a001-20200428
riscv                randconfig-a001-20200428
nios2                randconfig-a001-20200428
h8300                randconfig-a001-20200428
c6x                  randconfig-a001-20200428
sparc64              randconfig-a001-20200428
microblaze           randconfig-a001-20200428
sh                   randconfig-a001-20200428
csky                 randconfig-a001-20200428
s390                 randconfig-a001-20200428
xtensa               randconfig-a001-20200428
openrisc             randconfig-a001-20200428
x86_64               randconfig-a001-20200428
i386                 randconfig-a003-20200428
x86_64               randconfig-a003-20200428
i386                 randconfig-a002-20200428
i386                 randconfig-a001-20200428
x86_64               randconfig-a002-20200428
i386                 randconfig-c002-20200428
i386                 randconfig-c001-20200428
x86_64               randconfig-c001-20200428
i386                 randconfig-c003-20200428
x86_64               randconfig-c003-20200428
x86_64               randconfig-d001-20200428
i386                 randconfig-d002-20200428
i386                 randconfig-d001-20200428
x86_64               randconfig-d003-20200428
i386                 randconfig-d003-20200428
x86_64               randconfig-f002-20200428
i386                 randconfig-f002-20200428
i386                 randconfig-f003-20200428
x86_64               randconfig-f003-20200428
i386                 randconfig-f001-20200428
x86_64               randconfig-f001-20200428
i386                 randconfig-g003-20200428
x86_64               randconfig-g001-20200428
i386                 randconfig-g001-20200428
x86_64               randconfig-g002-20200428
i386                 randconfig-g002-20200428
x86_64               randconfig-g003-20200428
x86_64               randconfig-h001-20200428
i386                 randconfig-h003-20200428
x86_64               randconfig-h003-20200428
x86_64               randconfig-h002-20200428
i386                 randconfig-h001-20200428
i386                 randconfig-h002-20200428
sparc                randconfig-a001-20200428
ia64                 randconfig-a001-20200428
powerpc              randconfig-a001-20200428
arm64                randconfig-a001-20200428
arc                  randconfig-a001-20200428
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
um                           x86_64_defconfig
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

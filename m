Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BF719A004
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Mar 2020 22:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgCaUiX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Mar 2020 16:38:23 -0400
Received: from mga05.intel.com ([192.55.52.43]:34230 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727852AbgCaUiX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Mar 2020 16:38:23 -0400
IronPort-SDR: CkOIhIscgpAvLv6wnee574678EHbj1Hlwj9LllRnBdEk6GS9UZuDR8bXOK9W+3gvZLceYAceUv
 YtWrOP9Sr7Hw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 13:38:23 -0700
IronPort-SDR: bVXpRLwR/cLlxlrGDhFLh5gXjD+OMHuS1WmN/m9ilA0Nu63kb9k8IOmG3N4E9LMDRzxkPyflvF
 TPOPSDkyAL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="272888851"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2020 13:38:21 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJNeP-000A9j-3k; Wed, 01 Apr 2020 04:38:21 +0800
Date:   Wed, 01 Apr 2020 04:37:54 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:test-pr-5.7-1] BUILD SUCCESS
 d3651854e6c7f694fea2626041225752c57fa5ee
Message-ID: <5e83aa22.hWQoovQAjoMpIDJM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git  test-pr-5.7-1
branch HEAD: d3651854e6c7f694fea2626041225752c57fa5ee  Merge tag 'platform-drivers-x86-v5.7-1' into test-pr-5.7-1

elapsed time: 481m

configs tested: 149
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
nios2                         3c120_defconfig
i386                                defconfig
m68k                             allmodconfig
mips                      malta_kvm_defconfig
s390                                defconfig
ia64                                defconfig
powerpc                             defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200331
x86_64               randconfig-a002-20200331
x86_64               randconfig-a003-20200331
i386                 randconfig-a001-20200331
i386                 randconfig-a002-20200331
i386                 randconfig-a003-20200331
alpha                randconfig-a001-20200331
m68k                 randconfig-a001-20200331
mips                 randconfig-a001-20200331
nds32                randconfig-a001-20200331
parisc               randconfig-a001-20200331
riscv                randconfig-a001-20200331
c6x                  randconfig-a001-20200331
h8300                randconfig-a001-20200331
microblaze           randconfig-a001-20200331
nios2                randconfig-a001-20200331
sparc64              randconfig-a001-20200331
csky                 randconfig-a001-20200331
openrisc             randconfig-a001-20200331
s390                 randconfig-a001-20200331
sh                   randconfig-a001-20200331
xtensa               randconfig-a001-20200331
i386                 randconfig-c003-20200331
i386                 randconfig-c002-20200331
i386                 randconfig-c001-20200331
x86_64               randconfig-e001-20200331
i386                 randconfig-e002-20200331
x86_64               randconfig-e003-20200331
i386                 randconfig-e003-20200331
x86_64               randconfig-e002-20200331
i386                 randconfig-e001-20200331
i386                 randconfig-f001-20200331
i386                 randconfig-f003-20200331
i386                 randconfig-f002-20200331
x86_64               randconfig-f002-20200331
x86_64               randconfig-f003-20200331
x86_64               randconfig-f001-20200331
x86_64               randconfig-g002-20200331
x86_64               randconfig-g003-20200331
i386                 randconfig-g001-20200331
i386                 randconfig-g002-20200331
x86_64               randconfig-g001-20200331
i386                 randconfig-g003-20200331
x86_64               randconfig-h001-20200331
x86_64               randconfig-h002-20200331
x86_64               randconfig-h003-20200331
i386                 randconfig-h001-20200331
i386                 randconfig-h002-20200331
i386                 randconfig-h003-20200331
sparc                randconfig-a001-20200331
arm64                randconfig-a001-20200331
ia64                 randconfig-a001-20200331
arc                  randconfig-a001-20200331
arm                  randconfig-a001-20200331
arc                  randconfig-a001-20200401
arm                  randconfig-a001-20200401
arm64                randconfig-a001-20200401
ia64                 randconfig-a001-20200401
powerpc              randconfig-a001-20200401
sparc                randconfig-a001-20200401
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
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
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

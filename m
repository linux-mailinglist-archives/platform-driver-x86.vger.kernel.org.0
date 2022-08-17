Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7AC7597467
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Aug 2022 18:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbiHQQpa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 17 Aug 2022 12:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238130AbiHQQpY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Aug 2022 12:45:24 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A7C5AA0E;
        Wed, 17 Aug 2022 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660754723; x=1692290723;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Nx5mmk70MR2vvj7Oyc43IjGFrUEvYIAc0Um7u/GzS9I=;
  b=ennEyulHvTzvP0HyywD9PdWVtPcToECcgxCm7hiH+oR4RgVkQdJ8Mo0t
   JtPTB3CqnqcO3qJVUDsRSGGwCF2X1F/pkT4NC7Lf74XICE1zrWSIc724H
   pKZc0hGJ7via0AWpglvTOBT29f1obqHqD52VBbQSOsySWxgOG5lxVMhiV
   5Oezl3/BGUKn4ICi1hQdDMcF/LHrjA4jqLFOCCgkx4AUWiP1AJbvbV63u
   M3fO6UMfDhSuSXGiEhMzcbj726WeF8sX8PheT8RT2KKLkjHaN1pKg9g7l
   IAoX+IQ1qkTlAJ6VybO62b+JxMNInTn0mNVzcFcKEZYRYt1jEzg0S0v6z
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="378839391"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; 
   d="scan'208";a="378839391"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 09:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; 
   d="scan'208";a="696844257"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2022 09:44:25 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOM9Y-00018A-2W;
        Wed, 17 Aug 2022 16:44:24 +0000
Date:   Thu, 18 Aug 2022 00:43:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 95d10484d66e54d5c01e36389e9318221fb8f60b
Message-ID: <62fd1ab9.SkkTg97b0fVLQyM+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 95d10484d66e54d5c01e36389e9318221fb8f60b  Add linux-next specific files for 20220817

Warning reports:

https://lore.kernel.org/linux-doc/202208162058.7apPivKL-lkp@intel.com
https://lore.kernel.org/llvm/202207251313.gKhpElEq-lkp@intel.com

Warning: (recently discovered and may have been fixed)

Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1046:5: warning: no previous prototype for 'fill_dc_scaling_info' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1222:6: warning: no previous prototype for 'handle_cursor_update' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:152:6: warning: no previous prototype for 'modifier_has_dcc' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1576:5: warning: no previous prototype for 'amdgpu_dm_plane_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:157:10: warning: no previous prototype for 'modifier_gfx9_swizzle_mode' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:752:5: warning: no previous prototype for 'fill_plane_buffer_attributes' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31: warning: no previous prototype for 'amd_get_format_info' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:88:6: warning: no previous prototype for 'fill_blending_from_plane_state' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:992:5: warning: no previous prototype for 'dm_plane_helper_check_state' [-Wmissing-prototypes]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:905:28: warning: variable 'top' set but not used [-Wunused-but-set-variable]
drivers/iio/accel/bma400_core.c:1091 bma400_activity_event_en() error: uninitialized symbol 'field_value'.
drivers/iio/cdc/ad7746.c:336:14: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
drivers/platform/mellanox/mlxreg-lc.c:866 mlxreg_lc_probe() warn: passing zero to 'PTR_ERR'
mm/memory_hotplug.c:343 __add_pages() error: uninitialized symbol 'err'.

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- alpha-randconfig-c023-20220815
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm-randconfig-c002-20220817
|   `-- drivers-iio-cdc-ad7746.c:warning:use-of-uninitialized-value-unknown-CWE
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
clang_recent_errors
`-- mips-omega2p_defconfig
    `-- lib-crypto-blake2s-selftest.c:warning:stack-frame-size-()-exceeds-limit-()-in-blake2s_selftest

elapsed time: 727m

configs tested: 81
configs skipped: 2

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
m68k                        stmark2_defconfig
microblaze                      mmu_defconfig
i386                                defconfig
arm                         nhk8815_defconfig
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220815
x86_64               randconfig-a001-20220815
x86_64                              defconfig
arc                               allnoconfig
i386                 randconfig-a003-20220815
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
sh                        sh7757lcr_defconfig
x86_64               randconfig-a003-20220815
x86_64                               rhel-8.3
alpha                             allnoconfig
i386                 randconfig-a004-20220815
mips                             allyesconfig
csky                              allnoconfig
riscv                             allnoconfig
x86_64               randconfig-a002-20220815
i386                 randconfig-a002-20220815
powerpc                           allnoconfig
x86_64               randconfig-a004-20220815
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a006-20220815
mips                            gpr_defconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20220815
i386                 randconfig-a001-20220815
sh                               allmodconfig
i386                 randconfig-a006-20220815
i386                 randconfig-a005-20220815
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
i386                             allyesconfig
i386                 randconfig-c001-20220815
arm                              allyesconfig
arm                         vf610m4_defconfig
ia64                      gensparse_defconfig
parisc64                         alldefconfig
sh                          landisk_defconfig
ia64                                defconfig
powerpc                         wii_defconfig
sh                                  defconfig
arm64                            allyesconfig
ia64                             allmodconfig
arm                          simpad_defconfig
sh                           se7750_defconfig
powerpc                        cell_defconfig

clang tested configs:
x86_64               randconfig-a013-20220815
x86_64               randconfig-a012-20220815
x86_64               randconfig-a011-20220815
x86_64               randconfig-a014-20220815
hexagon              randconfig-r041-20220815
powerpc                     ksi8560_defconfig
s390                             alldefconfig
x86_64               randconfig-a016-20220815
arm                    vt8500_v6_v7_defconfig
mips                          ath79_defconfig
s390                 randconfig-r044-20220815
x86_64               randconfig-a015-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a013-20220815
hexagon              randconfig-r045-20220815
i386                 randconfig-a011-20220815
riscv                randconfig-r042-20220815
i386                 randconfig-a015-20220815
i386                 randconfig-a016-20220815
i386                 randconfig-a014-20220815
mips                        omega2p_defconfig
x86_64                          rhel-8.3-rust
powerpc                 mpc832x_mds_defconfig
powerpc                      ppc64e_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

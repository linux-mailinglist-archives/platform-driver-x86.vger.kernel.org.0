Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8C17E0CBE
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Nov 2023 01:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjKDAi3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Nov 2023 20:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjKDAi2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 20:38:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A39D45;
        Fri,  3 Nov 2023 17:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699058299; x=1730594299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lgdwiAyPRysKtnT+0nfDxaf8k2i2tuiMEm+OGHK/8NQ=;
  b=dyKNqf0KjUWdxcLnEF6dEat40PVvphPZaY+pHG7iXbkNMzELgriU42o5
   VJxc+wz6xKHCcYfwgRVVYKCeafktags6VSsQL7eRm96A2tdy3YQo4LytY
   4iAA+9LaOnsSR6/t52umMuW9e0aHBv25GXolYMED3Ju23yGQvZ6VhxB1r
   PvyRvjg9X5mhJlURTv7wP9/dW74NdpBdsMyrM/4ZPyrYbRPgS8xfMDsb5
   te2qMkLOuMskSFPs/eEZBtF0SZfV4rNPjrSJd1i/cHnRNS3eIploRqxNu
   BbY+aRBeThJ+QKJf5UD4RC+nDDPXSS+FAk7zDHwB+s801AcafBGTLV7Tz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369252348"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="369252348"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 17:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="755313891"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="755313891"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2023 17:38:11 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qz4fx-00038N-1g;
        Sat, 04 Nov 2023 00:38:09 +0000
Date:   Sat, 4 Nov 2023 08:37:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>
Cc:     oe-kbuild-all@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Xinhui Pan <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:RADEON and AMDGPU DRM DRIVERS" 
        <amd-gfx@lists.freedesktop.org>,
        "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
        "open list:ACPI" <linux-acpi@vger.kernel.org>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 3/9] PCI: Drop pci_is_thunderbolt_attached()
Message-ID: <202311040800.zpVIwNrB-lkp@intel.com>
References: <20231103190758.82911-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103190758.82911-4-mario.limonciello@amd.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/for-linus]
[also build test ERROR on drm-misc/drm-misc-next westeri-thunderbolt/next rafael-pm/linux-next rafael-pm/acpi-bus linus/master rafael-pm/devprop v6.6 next-20231103]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-nouveau-Switch-from-pci_is_thunderbolt_attached-to-dev_is_removable/20231104-030945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20231103190758.82911-4-mario.limonciello%40amd.com
patch subject: [PATCH v2 3/9] PCI: Drop pci_is_thunderbolt_attached()
config: loongarch-randconfig-002-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040800.zpVIwNrB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040800.zpVIwNrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040800.zpVIwNrB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c: In function 'nbio_v2_3_enable_aspm':
>> drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c:364:21: error: implicit declaration of function 'pci_is_thunderbolt_attached' [-Werror=implicit-function-declaration]
     364 |                 if (pci_is_thunderbolt_attached(adev->pdev))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function 'amdgpu_device_ip_early_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2118:14: error: implicit declaration of function 'pci_is_thunderbolt_attached' [-Werror=implicit-function-declaration]
    2118 |             !pci_is_thunderbolt_attached(to_pci_dev(dev->dev)))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pci_is_thunderbolt_attached +364 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c

f1213b15976881d Evan Quan 2020-08-18  350  
f1213b15976881d Evan Quan 2020-08-18  351  static void nbio_v2_3_enable_aspm(struct amdgpu_device *adev,
f1213b15976881d Evan Quan 2020-08-18  352  				  bool enable)
f1213b15976881d Evan Quan 2020-08-18  353  {
f1213b15976881d Evan Quan 2020-08-18  354  	uint32_t def, data;
f1213b15976881d Evan Quan 2020-08-18  355  
f1213b15976881d Evan Quan 2020-08-18  356  	def = data = RREG32_PCIE(smnPCIE_LC_CNTL);
f1213b15976881d Evan Quan 2020-08-18  357  
f1213b15976881d Evan Quan 2020-08-18  358  	if (enable) {
f1213b15976881d Evan Quan 2020-08-18  359  		/* Disable ASPM L0s/L1 first */
f1213b15976881d Evan Quan 2020-08-18  360  		data &= ~(PCIE_LC_CNTL__LC_L0S_INACTIVITY_MASK | PCIE_LC_CNTL__LC_L1_INACTIVITY_MASK);
f1213b15976881d Evan Quan 2020-08-18  361  
f1213b15976881d Evan Quan 2020-08-18  362  		data |= NAVI10_PCIE__LC_L0S_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L0S_INACTIVITY__SHIFT;
f1213b15976881d Evan Quan 2020-08-18  363  
f1213b15976881d Evan Quan 2020-08-18 @364  		if (pci_is_thunderbolt_attached(adev->pdev))
f1213b15976881d Evan Quan 2020-08-18  365  			data |= NAVI10_PCIE__LC_L1_INACTIVITY_TBT_DEFAULT  << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
f1213b15976881d Evan Quan 2020-08-18  366  		else
f1213b15976881d Evan Quan 2020-08-18  367  			data |= NAVI10_PCIE__LC_L1_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
f1213b15976881d Evan Quan 2020-08-18  368  
f1213b15976881d Evan Quan 2020-08-18  369  		data &= ~PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
f1213b15976881d Evan Quan 2020-08-18  370  	} else {
f1213b15976881d Evan Quan 2020-08-18  371  		/* Disbale ASPM L1 */
f1213b15976881d Evan Quan 2020-08-18  372  		data &= ~PCIE_LC_CNTL__LC_L1_INACTIVITY_MASK;
f1213b15976881d Evan Quan 2020-08-18  373  		/* Disable ASPM TxL0s */
f1213b15976881d Evan Quan 2020-08-18  374  		data &= ~PCIE_LC_CNTL__LC_L0S_INACTIVITY_MASK;
f1213b15976881d Evan Quan 2020-08-18  375  		/* Disable ACPI L1 */
f1213b15976881d Evan Quan 2020-08-18  376  		data |= PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
f1213b15976881d Evan Quan 2020-08-18  377  	}
f1213b15976881d Evan Quan 2020-08-18  378  
f1213b15976881d Evan Quan 2020-08-18  379  	if (def != data)
f1213b15976881d Evan Quan 2020-08-18  380  		WREG32_PCIE(smnPCIE_LC_CNTL, data);
f1213b15976881d Evan Quan 2020-08-18  381  }
f1213b15976881d Evan Quan 2020-08-18  382  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

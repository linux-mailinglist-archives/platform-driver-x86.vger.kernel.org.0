Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F71E5F35
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Oct 2019 21:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfJZT2y (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 26 Oct 2019 15:28:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:53620 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbfJZT2y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Oct 2019 15:28:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Oct 2019 12:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,233,1569308400"; 
   d="scan'208";a="399080893"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2019 12:28:52 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iORk4-000AXf-53; Sun, 27 Oct 2019 03:28:52 +0800
Date:   Sun, 27 Oct 2019 03:27:52 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     kbuild-all@lists.01.org, platform-driver-x86@vger.kernel.org,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [platform-drivers-x86:review-andy 38/41]
 drivers/platform/x86/intel_punit_ipc.c:234:48: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <201910270351.Sa2GNcK6%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git review-andy
head:   c7c0524e842aa9d699aa222388f767a6e5b57aba
commit: ab3317e5cc7e68bda2c666babad3d9835f1a03bb [38/41] platform/x86: intel_punit_ipc: use devm_platform_ioremap_resource() to simplify code
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        git checkout ab3317e5cc7e68bda2c666babad3d9835f1a03bb
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/platform/x86/intel_punit_ipc.c:234:48: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected struct platform_device *pdev @@    got atform_device *pdev @@
>> drivers/platform/x86/intel_punit_ipc.c:234:48: sparse:    expected struct platform_device *pdev
>> drivers/platform/x86/intel_punit_ipc.c:234:48: sparse:    got struct device *
   drivers/platform/x86/intel_punit_ipc.c:239:48: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected struct platform_device *pdev @@    got atform_device *pdev @@
   drivers/platform/x86/intel_punit_ipc.c:239:48: sparse:    expected struct platform_device *pdev
   drivers/platform/x86/intel_punit_ipc.c:239:48: sparse:    got struct device *
   drivers/platform/x86/intel_punit_ipc.c:251:48: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected struct platform_device *pdev @@    got atform_device *pdev @@
   drivers/platform/x86/intel_punit_ipc.c:251:48: sparse:    expected struct platform_device *pdev
   drivers/platform/x86/intel_punit_ipc.c:251:48: sparse:    got struct device *
   drivers/platform/x86/intel_punit_ipc.c:255:48: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected struct platform_device *pdev @@    got atform_device *pdev @@
   drivers/platform/x86/intel_punit_ipc.c:255:48: sparse:    expected struct platform_device *pdev
   drivers/platform/x86/intel_punit_ipc.c:255:48: sparse:    got struct device *
   drivers/platform/x86/intel_punit_ipc.c:259:48: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected struct platform_device *pdev @@    got atform_device *pdev @@
   drivers/platform/x86/intel_punit_ipc.c:259:48: sparse:    expected struct platform_device *pdev
   drivers/platform/x86/intel_punit_ipc.c:259:48: sparse:    got struct device *
   drivers/platform/x86/intel_punit_ipc.c:263:48: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected struct platform_device *pdev @@    got atform_device *pdev @@
   drivers/platform/x86/intel_punit_ipc.c:263:48: sparse:    expected struct platform_device *pdev
   drivers/platform/x86/intel_punit_ipc.c:263:48: sparse:    got struct device *

vim +234 drivers/platform/x86/intel_punit_ipc.c

   224	
   225	static int intel_punit_get_bars(struct platform_device *pdev)
   226	{
   227		void __iomem *addr;
   228	
   229		/*
   230		 * The following resources are required
   231		 * - BIOS_IPC BASE_DATA
   232		 * - BIOS_IPC BASE_IFACE
   233		 */
 > 234		addr = devm_platform_ioremap_resource(&pdev->dev, 0);
   235		if (IS_ERR(addr))
   236			return PTR_ERR(addr);
   237		punit_ipcdev->base[BIOS_IPC][BASE_DATA] = addr;
   238	
   239		addr = devm_platform_ioremap_resource(&pdev->dev, 1);
   240		if (IS_ERR(addr))
   241			return PTR_ERR(addr);
   242		punit_ipcdev->base[BIOS_IPC][BASE_IFACE] = addr;
   243	
   244		/*
   245		 * The following resources are optional
   246		 * - ISPDRIVER_IPC BASE_DATA
   247		 * - ISPDRIVER_IPC BASE_IFACE
   248		 * - GTDRIVER_IPC BASE_DATA
   249		 * - GTDRIVER_IPC BASE_IFACE
   250		 */
   251		addr = devm_platform_ioremap_resource(&pdev->dev, 2);
   252		if (!IS_ERR(addr))
   253			punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
   254	
   255		addr = devm_platform_ioremap_resource(&pdev->dev, 3);
   256		if (!IS_ERR(addr))
   257			punit_ipcdev->base[ISPDRIVER_IPC][BASE_IFACE] = addr;
   258	
   259		addr = devm_platform_ioremap_resource(&pdev->dev, 4);
   260		if (!IS_ERR(addr))
   261			punit_ipcdev->base[GTDRIVER_IPC][BASE_DATA] = addr;
   262	
   263		addr = devm_platform_ioremap_resource(&pdev->dev, 5);
   264		if (!IS_ERR(addr))
   265			punit_ipcdev->base[GTDRIVER_IPC][BASE_IFACE] = addr;
   266	
   267		return 0;
   268	}
   269	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

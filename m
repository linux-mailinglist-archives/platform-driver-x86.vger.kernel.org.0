Return-Path: <platform-driver-x86+bounces-5348-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DFD9743C9
	for <lists+platform-driver-x86@lfdr.de>; Tue, 10 Sep 2024 21:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 340B31F27109
	for <lists+platform-driver-x86@lfdr.de>; Tue, 10 Sep 2024 19:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D921F1A76C9;
	Tue, 10 Sep 2024 19:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF3vHMll"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632481A38F4;
	Tue, 10 Sep 2024 19:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725998280; cv=none; b=M1a+35DAt2tupTvRXHshsbuGGow74ylLfDaaHd6SB7i7+I63KuWpONBMnm9htxwmfmIzVxMppbtFPixxwRaAWg1HbVkTxh0m50GQaxd8vUv99BA8pnGEar3R/c1TFaHhsqP7CfolmmNgBlMqjX9PH/GuMR6E0bQYGJn7o7HEu+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725998280; c=relaxed/simple;
	bh=iJe1/Si3SkM51pTI7ztDnB4gnFqh3ZwoYgPIQidg9kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcl2+zBs2xRIeR+X6UsTBPCpfN2rEjwWdQdihfgkL+6W4GThXsgXvuZiHFUqpDtXrZ+/MjG1knsuf77+/47s9SvNV0Z9HisugEKIaEJ100HZNFQIs6ivCkze9fEwWcLjknbid+jJvQ1TXLYCB3jUNDGKD4aAOq7pGkpKTS96o8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF3vHMll; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725998279; x=1757534279;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iJe1/Si3SkM51pTI7ztDnB4gnFqh3ZwoYgPIQidg9kg=;
  b=VF3vHMllwgnRe+Fzrb1ggqgUo4erU3tfhy1UhCsn6KwLdbu9DNKXiXN3
   zB6Rnk/9f1VJQLGvEA7tiFd+8yqGckNSU420WuyxIY7VXQTYIB6FsibDY
   1mv/rMWaHwyODLP1+6fiu48LlXu944pfwws9xwCJO9ocdnoXJQq7kCx+N
   0Og7gkeCBcxZwIna8wOBLJAQqCAIXKFOPN0HgpkNCVzTAK/MYmlxw4qOg
   +CJuDw5CjaZlPZI4IDD0hbSEz00S2FdP+msk1jiKnfY243OC1RaP4/7Yo
   6PPSDEmepspsQqdsVVIHJx4+OwlSC+UlG3z32O2KWPSQR1mim3P7dA/Aj
   Q==;
X-CSE-ConnectionGUID: wXRLnzDMQCu15/++/AHI9A==
X-CSE-MsgGUID: fJVQDGw/THapJ/9LZ9Jbnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28508828"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="28508828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 12:57:58 -0700
X-CSE-ConnectionGUID: pJnIaCcLSKKjh2tI9/Vg0A==
X-CSE-MsgGUID: ZQipq+YdTNaQv18v4t9P0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="90418046"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.125.130.166]) ([10.125.130.166])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 12:57:57 -0700
Message-ID: <033e449f-da34-47ee-8985-d25ef539d836@linux.intel.com>
Date: Tue, 10 Sep 2024 12:57:56 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] platform/x86:intel/pmc: Create Intel PMC SSRAM
 Telemetry driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: irenic.rajneesh@gmail.com, david.e.box@linux.intel.com,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org
References: <20240828222932.1279508-1-xi.pardee@linux.intel.com>
 <20240828222932.1279508-9-xi.pardee@linux.intel.com>
 <42aee315-7c15-5fac-6141-b87bdb83a9c7@linux.intel.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <42aee315-7c15-5fac-6141-b87bdb83a9c7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, this email is resent because the last email was not delivered due to 
some HTML error.

Sorry for the inconvenience. My response is in line.

On 8/29/2024 5:02 AM, Ilpo Järvinen wrote:
> On Wed, 28 Aug 2024, Xi Pardee wrote:
>
>> Convert ssram device related functionalities to a new driver named Intel
>> PMC SSRAM Telemetry driver. Modify PMC Core driver to use API exported by
>> the driver to discover and achieve devid and PWRMBASE address information
>> for each available PMC. PMC Core driver needs to get PCI device when
>> reading from telemetry regions.
>>
>> The new SSRAM driver binds to the SSRAM device and provides the following
>> functionalities:
>> 1. Look for and register telemetry regions available in SSRAM device.
>> 2. Provide devid and PWRMBASE address information for the corresponding
>>     PMCs.
>>
>> Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
>> ---
>>   drivers/platform/x86/intel/pmc/Kconfig        |  11 ++
>>   drivers/platform/x86/intel/pmc/Makefile       |   8 +-
>>   drivers/platform/x86/intel/pmc/arl.c          |  14 ++-
>>   drivers/platform/x86/intel/pmc/core.c         |  59 ++++++---
>>   drivers/platform/x86/intel/pmc/core.h         |   6 +-
>>   drivers/platform/x86/intel/pmc/mtl.c          |  14 ++-
>>   .../platform/x86/intel/pmc/ssram_telemetry.c  | 118 +++++++++++-------
>>   .../platform/x86/intel/pmc/ssram_telemetry.h  |  45 +++++++
>>   8 files changed, 200 insertions(+), 75 deletions(-)
>>   create mode 100644 drivers/platform/x86/intel/pmc/ssram_telemetry.h
>>
>> diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/intel/pmc/Kconfig
>> index d2f651fbec2c..c2ccd48fe266 100644
>> --- a/drivers/platform/x86/intel/pmc/Kconfig
>> +++ b/drivers/platform/x86/intel/pmc/Kconfig
>> @@ -8,6 +8,7 @@ config INTEL_PMC_CORE
>>   	depends on PCI
>>   	depends on ACPI
>>   	depends on INTEL_PMT_TELEMETRY
>> +	depends on INTEL_PMC_SSRAM_TELEMETRY || !INTEL_PMC_SSRAM_TELEMETRY
>>   	help
>>   	  The Intel Platform Controller Hub for Intel Core SoCs provides access
>>   	  to Power Management Controller registers via various interfaces. This
>> @@ -24,3 +25,13 @@ config INTEL_PMC_CORE
>>   		- SLPS0 Debug registers (Cannonlake/Icelake PCH)
>>   		- Low Power Mode registers (Tigerlake and beyond)
>>   		- PMC quirks as needed to enable SLPS0/S0ix
>> +
>> +config INTEL_PMC_SSRAM_TELEMETRY
>> +	tristate "Intel PMC SSRAM Telemetry driver"
>> +	depends on INTEL_VSEC
>> +	help
>> +	  The PMC SSRAM device contains counters structured in Intel Platform
>> +	  Monitoring Techology (PMT) telemetry regions. This driver looks for
>> +	  and register these telemetry regions so they would be available for
>> +	  read through sysfs and Intel PMT API. The driver also provides API to
>> +	  expose information of PMCs available in the platform.
>> \ No newline at end of file
>> diff --git a/drivers/platform/x86/intel/pmc/Makefile b/drivers/platform/x86/intel/pmc/Makefile
>> index 4dd9fa93f873..e935602af2a3 100644
>> --- a/drivers/platform/x86/intel/pmc/Makefile
>> +++ b/drivers/platform/x86/intel/pmc/Makefile
>> @@ -3,8 +3,12 @@
>>   # Intel x86 Platform-Specific Drivers
>>   #
>>   
>> -intel_pmc_core-y			:= core.o ssram_telemetry.o spt.o cnp.o \
>> -					   icl.o tgl.o adl.o mtl.o arl.o lnl.o
>> +intel_pmc_core-y			:= core.o spt.o cnp.o icl.o \
>> +					   tgl.o adl.o mtl.o arl.o lnl.o
>>   obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o
>>   intel_pmc_core_pltdrv-y			:= pltdrv.o
>>   obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core_pltdrv.o
>> +
>> +# Intel PMC SSRAM driver
>> +intel_pmc_ssram_telemetry-y		+= ssram_telemetry.o
>> +obj-$(CONFIG_INTEL_PMC_SSRAM_TELEMETRY)	+= intel_pmc_ssram_telemetry.o
>> \ No newline at end of file
> Two files above are missing the last newline.
New line will be added in the next version.
>
>> diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
>> index 0460715c58f4..25268b1fdf97 100644
>> --- a/drivers/platform/x86/intel/pmc/arl.c
>> +++ b/drivers/platform/x86/intel/pmc/arl.c
>> @@ -700,11 +700,13 @@ int arl_core_init(struct pmc_dev *pmcdev)
>>   	pmcdev->resume = arl_resume;
>>   	pmcdev->regmap_list = arl_pmc_info_list;
>>   
>> -	/*
>> -	 * If ssram init fails use legacy method to at least get the
>> -	 * primary PMC
>> -	 */
>> -	ret = pmc_core_ssram_init(pmcdev, func);
>> +	ret = pmc_core_ssram_get_reg_base(pmcdev);
>> +
>> +	/* Try again later after Intel PMC SSRAM Telemetry driver finishes probe */
>> +	if (ret == -EAGAIN)
>> +		return -EPROBE_DEFER;
>> +
>> +	/* If regbase not assigned, set map and discover using legacy method */
>>   	if (ret) {
>>   		ssram_init = false;
>>   		pmc->map = &arl_socs_reg_map;
>> @@ -718,7 +720,7 @@ int arl_core_init(struct pmc_dev *pmcdev)
>>   	pmc_core_punit_pmt_init(pmcdev, ARL_PMT_DMU_GUID);
>>   
>>   	if (ssram_init)	{
>> -		ret = pmc_core_ssram_get_lpm_reqs(pmcdev);
>> +		ret = pmc_core_ssram_get_lpm_reqs(pmcdev, func);
>>   		if (ret)
>>   			return ret;
>>   	}
>> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
>> index 8984041f35f4..19256c5570ab 100644
>> --- a/drivers/platform/x86/intel/pmc/core.c
>> +++ b/drivers/platform/x86/intel/pmc/core.c
>> @@ -28,6 +28,7 @@
>>   #include <asm/tsc.h>
>>   
>>   #include "core.h"
>> +#include "ssram_telemetry.h"
>>   #include "../pmt/telemetry.h"
>>   
>>   /* Maximum number of modes supported by platfoms that has low power mode capability */
>> @@ -1613,11 +1614,12 @@ static u32 pmc_core_find_guid(struct pmc_info *list, const struct pmc_reg_map *m
>>   	return 0;
>>   }
>>   
>> -static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc)
>> +static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc, int func)
>>   {
>>   	struct telem_endpoint *ep;
>>   	const u8 *lpm_indices;
>>   	int num_maps, mode_offset = 0;
>> +	struct pci_dev *pcidev;
>>   	int ret, mode, i;
>>   	int lpm_size;
>>   	u32 guid;
>> @@ -1630,11 +1632,16 @@ static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc)
>>   	if (!guid)
>>   		return -ENXIO;
>>   
>> -	ep = pmt_telem_find_and_register_endpoint(pmcdev->ssram_pcidev, guid, 0);
>> +	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(20, func));
>> +	if (!pcidev)
>> +		return -ENODEV;
>> +
>> +	ep = pmt_telem_find_and_register_endpoint(pcidev, guid, 0);
>>   	if (IS_ERR(ep)) {
>>   		dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %ld",
>>   			PTR_ERR(ep));
>> -		return -EPROBE_DEFER;
>> +		ret = -EPROBE_DEFER;
>> +		goto release_dev;
>>   	}
>>   
>>   	pmc->lpm_req_regs = devm_kzalloc(&pmcdev->pdev->dev,
>> @@ -1710,23 +1717,22 @@ static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc)
>>   
>>   unregister_ep:
>>   	pmt_telem_unregister_endpoint(ep);
>> +release_dev:
>> +	pci_dev_put(pcidev);
>>   
>>   	return ret;
>>   }
>>   
>> -int pmc_core_ssram_get_lpm_reqs(struct pmc_dev *pmcdev)
>> +int pmc_core_ssram_get_lpm_reqs(struct pmc_dev *pmcdev, int func)
>>   {
>>   	unsigned int i;
>>   	int ret;
>>   
>> -	if (!pmcdev->ssram_pcidev)
>> -		return -ENODEV;
>> -
>>   	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); ++i) {
>>   		if (!pmcdev->pmcs[i])
>>   			continue;
>>   
>> -		ret = pmc_core_get_lpm_req(pmcdev, pmcdev->pmcs[i]);
>> +		ret = pmc_core_get_lpm_req(pmcdev, pmcdev->pmcs[i], func);
>>   		if (ret)
>>   			return ret;
>>   	}
>> @@ -1743,14 +1749,22 @@ const struct pmc_reg_map *pmc_core_find_regmap(struct pmc_info *list, u16 devid)
>>   	return NULL;
>>   }
>>   
>> -int pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
>> -		     const struct pmc_reg_map *reg_map, unsigned int pmc_index)
>> +static int pmc_core_pmc_add(struct pmc_dev *pmcdev, unsigned int pmc_index)
>>   {
>> -	struct pmc *pmc = pmcdev->pmcs[pmc_index];
>> +	struct pmc_ssram_telemetry pmc_ssram_telemetry;
>> +	const struct pmc_reg_map *map;
>> +	struct pmc *pmc;
>> +	int ret;
>> +
>> +	ret = pmc_ssram_telemetry_get_pmc_info(pmc_index, &pmc_ssram_telemetry);
>> +	if (ret)
>> +		return ret;
>>   
>> -	if (!pwrm_base)
>> +	map = pmc_core_find_regmap(pmcdev->regmap_list, pmc_ssram_telemetry.devid);
>> +	if (!map)
>>   		return -ENODEV;
>>   
>> +	pmc = pmcdev->pmcs[pmc_index];
>>   	/* Memory for primary PMC has been allocated in core.c */
>>   	if (!pmc) {
>>   		pmc = devm_kzalloc(&pmcdev->pdev->dev, sizeof(*pmc), GFP_KERNEL);
>> @@ -1758,8 +1772,8 @@ int pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
>>   			return -ENOMEM;
>>   	}
>>   
>> -	pmc->map = reg_map;
>> -	pmc->base_addr = pwrm_base;
>> +	pmc->map = map;
>> +	pmc->base_addr = pmc_ssram_telemetry.base_addr;
>>   	pmc->regbase = ioremap(pmc->base_addr, pmc->map->regmap_length);
>>   
>>   	if (!pmc->regbase) {
>> @@ -1772,6 +1786,23 @@ int pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
>>   	return 0;
>>   }
>>   
>> +int pmc_core_ssram_get_reg_base(struct pmc_dev *pmcdev)
>> +{
>> +	int ret;
>> +
>> +	if (!pmcdev->regmap_list)
>> +		return -ENOENT;
>> +
>> +	ret = pmc_core_pmc_add(pmcdev, PMC_IDX_MAIN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pmc_core_pmc_add(pmcdev, PMC_IDX_IOE);
>> +	pmc_core_pmc_add(pmcdev, PMC_IDX_PCH);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct acpi_device_id pmc_core_acpi_ids[] = {
>>   	{"INT33A1", 0}, /* _HID for Intel Power Engine, _CID PNP0D80*/
>>   	{ }
>> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
>> index 5af1d41a83f7..2d62a71ec100 100644
>> --- a/drivers/platform/x86/intel/pmc/core.h
>> +++ b/drivers/platform/x86/intel/pmc/core.h
>> @@ -594,7 +594,7 @@ extern const struct pmc_bit_map *arl_pchs_lpm_maps[];
>>   extern const struct pmc_reg_map arl_pchs_reg_map;
>>   
>>   extern void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev);
>> -extern int pmc_core_ssram_get_lpm_reqs(struct pmc_dev *pmcdev);
>> +extern int pmc_core_ssram_get_lpm_reqs(struct pmc_dev *pmcdev, int func);
>>   int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore);
>>   
>>   int pmc_core_resume_common(struct pmc_dev *pmcdev);
>> @@ -603,10 +603,8 @@ extern void pmc_core_get_low_power_modes(struct pmc_dev *pmcdev);
>>   extern void pmc_core_punit_pmt_init(struct pmc_dev *pmcdev, u32 guid);
>>   extern void pmc_core_set_device_d3(unsigned int device);
>>   
>> -extern int pmc_core_ssram_init(struct pmc_dev *pmcdev, int func);
>>   extern const struct pmc_reg_map *pmc_core_find_regmap(struct pmc_info *list, u16 devid);
>> -extern int pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
>> -			    const struct pmc_reg_map *reg_map, unsigned int pmc_index);
>> +extern int pmc_core_ssram_get_reg_base(struct pmc_dev *pmcdev);
>>   
>>   int spt_core_init(struct pmc_dev *pmcdev);
>>   int cnp_core_init(struct pmc_dev *pmcdev);
>> diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
>> index e7f5b650902d..6ac52625a029 100644
>> --- a/drivers/platform/x86/intel/pmc/mtl.c
>> +++ b/drivers/platform/x86/intel/pmc/mtl.c
>> @@ -1000,11 +1000,13 @@ int mtl_core_init(struct pmc_dev *pmcdev)
>>   	pmcdev->resume = mtl_resume;
>>   	pmcdev->regmap_list = mtl_pmc_info_list;
>>   
>> -	/*
>> -	 * If ssram init fails use legacy method to at least get the
>> -	 * primary PMC
>> -	 */
>> -	ret = pmc_core_ssram_init(pmcdev, func);
>> +	ret = pmc_core_ssram_get_reg_base(pmcdev);
>> +
>> +	/* Try again later after Intel PMC SSRAM Telemetry driver finishes probe */
>> +	if (ret == -EAGAIN)
>> +		return -EPROBE_DEFER;
>> +
>> +	/* If regbase not assigned, set map and discover using legacy method */
>>   	if (ret) {
>>   		ssram_init = false;
>>   		dev_warn(&pmcdev->pdev->dev,
>> @@ -1019,7 +1021,7 @@ int mtl_core_init(struct pmc_dev *pmcdev)
>>   	pmc_core_punit_pmt_init(pmcdev, MTL_PMT_DMU_GUID);
>>   
>>   	if (ssram_init)
>> -		return pmc_core_ssram_get_lpm_reqs(pmcdev);
>> +		return pmc_core_ssram_get_lpm_reqs(pmcdev, func);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
>> index f625d39d1aa3..1c6cc95bfefa 100644
>> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
>> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
>> @@ -1,20 +1,19 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * This file contains functions to handle discovery of PMC metrics located
>> - * in the PMC SSRAM PCI device.
>> + * Intel PMC SSRAM TELEMETRY PCI Driver
>>    *
>>    * Copyright (c) 2023, Intel Corporation.
>>    * All Rights Reserved.
>>    *
>>    */
>>   
>> -#include <linux/cleanup.h>
>>   #include <linux/pci.h>
>> +#include <linux/types.h>
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>>   
>>   #include "core.h"
>> +#include "ssram_telemetry.h"
>>   #include "../vsec.h"
>> -#include "../pmt/telemetry.h"
>>   
>>   #define SSRAM_HDR_SIZE		0x100
>>   #define SSRAM_PWRM_OFFSET	0x14
>> @@ -24,12 +23,14 @@
>>   #define SSRAM_IOE_OFFSET	0x68
>>   #define SSRAM_DEVID_OFFSET	0x70
>>   
>> -DEFINE_FREE(pmc_core_iounmap, void __iomem *, iounmap(_T));
>> +static struct pmc_ssram_telemetry *pmc_ssram_telems;
>> +static bool device_probed;
>> +
>> +DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, iounmap(_T));
>>   
>>   static void
>> -pmc_add_pmt(struct pmc_dev *pmcdev, u64 ssram_base, void __iomem *ssram)
>> +pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void __iomem *ssram)
>>   {
>> -	struct pci_dev *pcidev = pmcdev->ssram_pcidev;
>>   	struct intel_vsec_platform_info info = {};
>>   	struct intel_vsec_header *headers[2] = {};
>>   	struct intel_vsec_header header;
>> @@ -58,7 +59,7 @@ pmc_add_pmt(struct pmc_dev *pmcdev, u64 ssram_base, void __iomem *ssram)
>>   	info.caps = VSEC_CAP_TELEMETRY;
>>   	info.headers = headers;
>>   	info.base_addr = ssram_base;
>> -	info.parent = &pmcdev->pdev->dev;
>> +	info.parent = &pcidev->dev;
>>   
>>   	intel_vsec_register(pcidev, &info);
>>   }
>> @@ -69,19 +70,14 @@ static inline u64 get_base(void __iomem *addr, u32 offset)
>>   }
>>   
>>   static int
>> -pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, unsigned int pmc_idx, u32 offset)
>> +pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, unsigned int pmc_idx, u32 offset)
>>   {
>> -	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
>> -	void __iomem __free(pmc_core_iounmap) *tmp_ssram = NULL;
>> -	void __iomem __free(pmc_core_iounmap) *ssram = NULL;
>> -	const struct pmc_reg_map *map;
>> +	void __iomem __free(pmc_ssram_telemetry_iounmap) * tmp_ssram = NULL;
>> +	void __iomem __free(pmc_ssram_telemetry_iounmap) * ssram = NULL;
>>   	u64 ssram_base, pwrm_base;
>>   	u16 devid;
>>   
>> -	if (!pmcdev->regmap_list)
>> -		return -ENOENT;
>> -
>> -	ssram_base = ssram_pcidev->resource[0].start;
>> +	ssram_base = pcidev->resource[0].start;
>>   	tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
>>   
>>   	if (!tmp_ssram)
>> @@ -105,46 +101,82 @@ pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, unsigned int pmc_idx, u32 offset)
>>   	devid = readw(ssram + SSRAM_DEVID_OFFSET);
>>   
>>   	/* Find and register and PMC telemetry entries */
>> -	pmc_add_pmt(pmcdev, ssram_base, ssram);
>> +	pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
>> +
>> +	pmc_ssram_telems[pmc_idx].devid = devid;
>> +	pmc_ssram_telems[pmc_idx].base_addr = pwrm_base;
>> +
>> +	return 0;
>> +}
>>   
>> -	map = pmc_core_find_regmap(pmcdev->regmap_list, devid);
>> -	if (!map)
>> +int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
>> +				     struct pmc_ssram_telemetry *pmc_ssram_telemetry)
>> +{
>> +	/*
>> +	 * PMCs are discovered in probe function. If this function is called before
>> +	 * probe function complete, the result would be invalid. Use device_probed
>> +	 * variable to avoid this case. Return -EAGAIN to inform the user to call
>> +	 * again later.
>> +	 */
>> +	if (!device_probed)
>> +		return -EAGAIN;
> I'm very very skeptical this is safe. Without barriers, nothing guarantees
> you'll get the desired ordering. As is, device_probed could appear set
> before something else you depend on below this.

Thanks for the comments. Memory barrier should be added to ensure the 
correct order of
load/store operation of device_probed variable.

Here is my proposed solution:
Add a write memory barrier smp_wmb right before setting device_probed to 
true in the
intel_pmc_ssram_telemetry_probe function to ensure the store operation 
order.
Add a read memory barrier smp_rmd after the check of device_probed in the
pmc_ssram_telemetry_get_pmc_info function to ensure the load operation 
order.

These two barriers will ensure that the correct order of events being 
perceived by the
consumers of this driver.

>
>> +
>> +	if (pmc_idx >= MAX_NUM_PMC)
>> +		return -EINVAL;
>> +
>> +	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
>>   		return -ENODEV;
>>   
>> -	return pmc_core_pmc_add(pmcdev, pwrm_base, map, pmc_idx);
>> +	pmc_ssram_telemetry->devid = pmc_ssram_telems[pmc_idx].devid;
>> +	pmc_ssram_telemetry->base_addr = pmc_ssram_telems[pmc_idx].base_addr;
>> +	return 0;
>>   }
>> +EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
>>   
>> -int pmc_core_ssram_init(struct pmc_dev *pmcdev, int func)
>> +static int intel_pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_device_id *id)
>>   {
>> -	struct pci_dev *pcidev;
>>   	int ret;
>>   
>> -	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(20, func));
>> -	if (!pcidev)
>> -		return -ENODEV;
>> +	pmc_ssram_telems = devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems) * MAX_NUM_PMC,
>> +					GFP_KERNEL);
>> +	if (!pmc_ssram_telems) {
>> +		ret = -ENOMEM;
>> +		goto probe_finish;
>> +	}
>>   
>>   	ret = pcim_enable_device(pcidev);
>> -	if (ret)
>> -		goto release_dev;
>> -
>> -	pmcdev->ssram_pcidev = pcidev;
>> +	if (ret) {
>> +		dev_dbg(&pcidev->dev, "failed to enable PMC SSRAM device\n");
>> +		goto probe_finish;
>> +	}
>>   
>> -	ret = pmc_core_ssram_get_pmc(pmcdev, PMC_IDX_MAIN, 0);
>> +	ret = pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_MAIN, 0);
>>   	if (ret)
>> -		goto disable_dev;
>> +		goto probe_finish;
>>   
>> -	pmc_core_ssram_get_pmc(pmcdev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
>> -	pmc_core_ssram_get_pmc(pmcdev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
>> -
>> -	return 0;
>> -
>> -disable_dev:
>> -	pmcdev->ssram_pcidev = NULL;
>> -	pci_disable_device(pcidev);
>> -release_dev:
>> -	pci_dev_put(pcidev);
>> +	pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
>> +	pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
>>   
>> +probe_finish:
>> +	device_probed = true;
>>   	return ret;
>>   }
>> +
>> +static const struct pci_device_id intel_pmc_ssram_telemetry_pci_ids[] = {
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM) },
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS) },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(pci, intel_pmc_ssram_telemetry_pci_ids);
>> +
>> +static struct pci_driver intel_pmc_ssram_telemetry_driver = {
>> +	.name = "intel_pmc_ssram_telemetry",
>> +	.id_table = intel_pmc_ssram_telemetry_pci_ids,
>> +	.probe = intel_pmc_ssram_telemetry_probe,
>> +};
>> +module_pci_driver(intel_pmc_ssram_telemetry_driver);
>> +
>>   MODULE_IMPORT_NS(INTEL_VSEC);
>> -MODULE_IMPORT_NS(INTEL_PMT_TELEMETRY);
>> +MODULE_AUTHOR("Xi Pardee <xi.pardee@intel.com>");
>> +MODULE_DESCRIPTION("Intel PMC SSRAM TELEMETRY driver");
> Telemetry ?
Will change in next version.
>
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.h b/drivers/platform/x86/intel/pmc/ssram_telemetry.h
>> new file mode 100644
>> index 000000000000..938d0baf50be
>> --- /dev/null
>> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.h
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Intel PMC SSRAM TELEMETRY PCI Driver Header File
> Telemetry ?
Will change in next version.
>
>> + *
>> + * Copyright (c) 2024, Intel Corporation.
>> + * All Rights Reserved.
>> + *
> Extra new line.

Will remove in next version.


Thanks!

Xi

>


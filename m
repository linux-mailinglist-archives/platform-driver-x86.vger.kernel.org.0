Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CE21B2619
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Apr 2020 14:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgDUMch (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Apr 2020 08:32:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:58664 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728316AbgDUMcg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Apr 2020 08:32:36 -0400
IronPort-SDR: 6kP6w0kHnS33wTHrs88Mn2uHA/GBOgy1SpVU/9jyHbgrP8/wy42uGEIbFn36RkrxWSWaZ95BLu
 paVUeWUxtfvQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 05:32:35 -0700
IronPort-SDR: jy+wsSEoEYq+z5Muv/KF4ACuE3brH1/K4JyvrvOa23Scyb8QUIAst+A/JNUtQryht3ZRRpH5Is
 WjkPYP1hDs+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; 
   d="scan'208";a="456744301"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 21 Apr 2020 05:32:33 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jQs4q-002Ej9-CL; Tue, 21 Apr 2020 15:32:36 +0300
Date:   Tue, 21 Apr 2020 15:32:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Archana Patni <archana.patni@intel.com>
Cc:     platform-driver-x86@vger.kernel.org, david.e.box@intel.com,
        srinivas.pandruvada@intel.com, subramony.sesha@intel.com,
        divagar.mohandass@intel.com
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Change Jasper Lake S0ix
 debug reg map back to ICL
Message-ID: <20200421123236.GI185537@smile.fi.intel.com>
References: <1587458419-23308-1-git-send-email-archana.patni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587458419-23308-1-git-send-email-archana.patni@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 21, 2020 at 02:10:19PM +0530, Archana Patni wrote:
> Jasper Lake uses Icelake PCH IPs and the S0ix debug interfaces are same as
> Icelake. It uses SLP_S0_DBG register latch/read interface from Icelake
> generation. It doesn't use Tiger Lake LPM debug registers. Change the
> Jasper Lake S0ix debug interface to use the ICL reg map.

LGTM!

> Fixes: 16292bed9c ("platform/x86: intel_pmc_core: Add Atom based Jasper Lake (JSL) platform support")
> Signed-off-by: Archana Patni <archana.patni@intel.com>
> Acked-by: David E. Box <david.e.box@intel.com>
> Tested-by: Divagar Mohandass <divagar.mohandass@intel.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index d2a5d4c..a130859 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -255,7 +255,7 @@
>  };
>  
>  static const struct pmc_bit_map icl_pfear_map[] = {
> -	/* Ice Lake generation onwards only */
> +	/* Ice Lake and Jasper Lake generation onwards only */
>  	{"RES_65",		BIT(0)},
>  	{"RES_66",		BIT(1)},
>  	{"RES_67",		BIT(2)},
> @@ -274,7 +274,7 @@
>  };
>  
>  static const struct pmc_bit_map tgl_pfear_map[] = {
> -	/* Tiger Lake, Elkhart Lake and Jasper Lake generation onwards only */
> +	/* Tiger Lake and Elkhart Lake generation onwards only */
>  	{"PSF9",		BIT(0)},
>  	{"RES_66",		BIT(1)},
>  	{"RES_67",		BIT(2)},
> @@ -1156,7 +1156,7 @@ static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
>  	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT,	&tgl_reg_map),
> -	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&tgl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&icl_reg_map),
>  	{}
>  };
>  
> -- 
> 1.9.1
> 

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <platform-driver-x86+bounces-40-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5447F62AF
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 16:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5901C2086B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 15:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A1B33CFC;
	Thu, 23 Nov 2023 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFDMxy4X"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B721410C4;
	Thu, 23 Nov 2023 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700753060; x=1732289060;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Gdj3IGAs2hjIQ1Amnl+R7syRNk6HRK2epPtT62bfX/8=;
  b=DFDMxy4XELpGl+FrKLJAc/7ovu8SNDauPIOg95NUlSszQEHmtdLzn/29
   4Vvu4R8PlMU9gUjv24qs82wD3phBZUphGPxtOffczmnZPfglrS6QwFM91
   MCyDVdFX48XiA/zatm/U13oHnKwQ+ej+ARlEnfdZNp/KMgUYc8x2xn0H0
   sdSGVjEnUQXnFxvvV4O11RuO+7DPWzpCrfsekdmqeQ8IHYR77EGlZF+YY
   UaDkDMLNgHbTfw3wImBLcT8NPUov5uWnU5pCd08aU/sbHxRQ9BoExKE8s
   MO/Hjcc5/cIwaePKQN6gBcmQvPqsRitZm0nkMw+XQCSCWgOWiSigA8mNt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13836876"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="13836876"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 07:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833448254"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="833448254"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 07:24:17 -0800
Date: Thu, 23 Nov 2023 17:24:10 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V5 06/20] platform/x86/intel/vsec: Add
 intel_vsec_register
In-Reply-To: <20231123040355.82139-7-david.e.box@linux.intel.com>
Message-ID: <7efeca6-6164-99e2-52d2-2b247d2698d4@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com> <20231123040355.82139-7-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, David E. Box wrote:

> From: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> 
> Add and export intel_vsec_register() to allow the registration of Intel
> extended capabilities from other drivers. Add check to look for memory
> conflicts before registering a new capability. Add a parent field to
> intel_vsec_platform_info to allow specifying the parent device for
> device managed cleanup.

Please also explain here why the usual parent relationships are not enough
in this case and you need to store it.

> diff --git a/drivers/platform/x86/intel/vsec.h b/drivers/platform/x86/intel/vsec.h
> index 8b9fad170503..bb8b6452df70 100644
> --- a/drivers/platform/x86/intel/vsec.h
> +++ b/drivers/platform/x86/intel/vsec.h
> @@ -69,6 +69,7 @@ enum intel_vsec_quirks {
>  
>  /* Platform specific data */
>  struct intel_vsec_platform_info {
> +	struct device *parent;
>  	struct intel_vsec_header **headers;
>  	unsigned long caps;
>  	unsigned long quirks;

-- 
 i.



Return-Path: <platform-driver-x86+bounces-11632-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F95AA0EA5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Apr 2025 16:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52E56842752
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Apr 2025 14:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EB22D3A6B;
	Tue, 29 Apr 2025 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcOyaLHe"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4F2D3235;
	Tue, 29 Apr 2025 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936614; cv=none; b=fWXS5t3exymAqxmPKcX+ahg3yDmCJs3FLFXgOle93+gZx6yNmtnZEkYUHsGxhR5DvkIDH+ZMq2uEeufBY9BYlJwSFPZyGVwDo6H7Zx0/Ne6e37Ux+NhnzrbolPzkVcSH6Fn2s7ZQRsMP5aouzG0AcEkM6HJm1+7gjvY2glVpYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936614; c=relaxed/simple;
	bh=4rQxUoxKuu+56BJG7SzR0/ZoLqjcsLo/z8yR4s+SP8s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IgqINaAuXWUpxBTUll5dcO1G9/ERpyXPyLGLJ819H0IR62k/B53mDxybZrYdAa9rHNQ291wcz68fI4WkM7T8s7i/k8jWyIDZP4W/TsCFOvHJdqiEapAOnrchr47RmAvGSsTC1MXsjpP2Jgjs9Zzn0epqF4nNHyA8S7vtqQ6p4jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcOyaLHe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745936613; x=1777472613;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4rQxUoxKuu+56BJG7SzR0/ZoLqjcsLo/z8yR4s+SP8s=;
  b=JcOyaLHecrgjIpYLiar4vmDyWv7PNVhGrV64QNbPNz362BVUGjFUbU/r
   0wwS8dHgdIdEYr+8fkmDRU/V5WGCHlpge1rysPV0T7xLoA0b3SUQYz3re
   w7g/HdBtrvuK128vS3aJbOubRtOHei7dr9Ew8kE2VJUIl9givXPry2qok
   c37F2w+1BG4qPERbaaElhYcF7DOCd98i0mUOX+zU5aClc4x4ZRCg6+3DB
   W7+aM1djTDjiQimVJvTQdTpgiU6iqLsbbsRVvHatYFP0VUzBspbRUevl0
   1ESunme0d8/IoLHI1wmMhLaVhk/Z8l1r69n1krDJ9SblgplkaIjubY7w5
   Q==;
X-CSE-ConnectionGUID: Bsh/7af5R0iaV/E5fuu89w==
X-CSE-MsgGUID: 3/sENpA4Q1+y91AVyEq73w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58218049"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="58218049"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:23:31 -0700
X-CSE-ConnectionGUID: ax2QDGinS/qOUYzwA81gHA==
X-CSE-MsgGUID: lZbQtOp6Rp6ysVkaDNUWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="171079910"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:23:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Apr 2025 17:23:25 +0300 (EEST)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: ISST: Support SST-TF revision 2
In-Reply-To: <20250417170011.1243858-2-srinivas.pandruvada@linux.intel.com>
Message-ID: <f45da867-1090-51cc-b405-c4a639adb5ab@linux.intel.com>
References: <20250417170011.1243858-1-srinivas.pandruvada@linux.intel.com> <20250417170011.1243858-2-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, Srinivas Pandruvada wrote:

> SST-TF revision 2 supports a higher number of cores per bucket, as the
> current limit of 256 cores may be insufficient. To accommodate this, a
> new offset, "SST_TF_INFO-8," is introduced, allowing for a higher core
> count. Utilize this offset instead of the current "SST_TF_INFO-1" offset,
> based on SST-TF revision 2 or higher, and if there is a non-zero core
> count in any bucket.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../intel/speed_select_if/isst_tpmi_core.c    | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 9978cdd19851..bc4089d3d421 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -1328,9 +1328,14 @@ static int isst_if_get_tpmi_instance_count(void __user *argp)
>  #define SST_TF_INFO_0_OFFSET	0
>  #define SST_TF_INFO_1_OFFSET	8
>  #define SST_TF_INFO_2_OFFSET	16
> +#define SST_TF_INFO_8_OFFSET	64
> +#define SST_TF_INFO_8_BUCKETS	3
>  
>  #define SST_TF_MAX_LP_CLIP_RATIOS	TRL_MAX_LEVELS
>  
> +#define SST_TF_FEATURE_REV_START	4
> +#define SST_TF_FEATURE_REV_WIDTH	8
> +
>  #define SST_TF_LP_CLIP_RATIO_0_START	16
>  #define SST_TF_LP_CLIP_RATIO_0_WIDTH	8
>  
> @@ -1340,10 +1345,14 @@ static int isst_if_get_tpmi_instance_count(void __user *argp)
>  #define SST_TF_NUM_CORE_0_START 0
>  #define SST_TF_NUM_CORE_0_WIDTH 8
>  
> +#define SST_TF_NUM_MOD_0_START	0
> +#define SST_TF_NUM_MOD_0_WIDTH	16
> +
>  static int isst_if_get_turbo_freq_info(void __user *argp)
>  {
>  	static struct isst_turbo_freq_info turbo_freq;
>  	struct tpmi_per_power_domain_info *power_domain_info;
> +	u8 feature_rev;
>  	int i, j;
>  
>  	if (copy_from_user(&turbo_freq, argp, sizeof(turbo_freq)))
> @@ -1360,6 +1369,10 @@ static int isst_if_get_turbo_freq_info(void __user *argp)
>  	turbo_freq.max_trl_levels = TRL_MAX_LEVELS;
>  	turbo_freq.max_clip_freqs = SST_TF_MAX_LP_CLIP_RATIOS;
>  
> +	_read_tf_level_info("feature_rev", feature_rev, turbo_freq.level,
> +			    SST_TF_INFO_0_OFFSET, SST_TF_FEATURE_REV_START,
> +			    SST_TF_FEATURE_REV_WIDTH, SST_MUL_FACTOR_NONE);
> +
>  	for (i = 0; i < turbo_freq.max_clip_freqs; ++i)
>  		_read_tf_level_info("lp_clip*", turbo_freq.lp_clip_freq_mhz[i],
>  				    turbo_freq.level, SST_TF_INFO_0_OFFSET,
> @@ -1376,12 +1389,32 @@ static int isst_if_get_turbo_freq_info(void __user *argp)
>  					    SST_MUL_FACTOR_FREQ)
>  	}
>  
> +	if (feature_rev >= 2) {
> +		bool valid = false;
> +
> +		for (i = 0; i < SST_TF_INFO_8_BUCKETS; ++i) {
> +			_read_tf_level_info("bucket_*_mod_count", turbo_freq.bucket_core_counts[i],
> +					    turbo_freq.level, SST_TF_INFO_8_OFFSET,
> +					    SST_TF_NUM_MOD_0_WIDTH * i, SST_TF_NUM_MOD_0_WIDTH,
> +					    SST_MUL_FACTOR_NONE)
> +
> +			if (!valid && turbo_freq.bucket_core_counts[i])

I'd just drop !valid from this check.

> +				valid = true;
> +		}
> +
> +		if (valid)


Should this be named instead to something like has_tf_info_8 ? (As this is 
not really valid/invalid check but whether this new info exists or not.)

> +			goto done_core_count;
> +	}
> +
>  	for (i = 0; i < TRL_MAX_BUCKETS; ++i)
>  		_read_tf_level_info("bucket_*_core_count", turbo_freq.bucket_core_counts[i],
>  				    turbo_freq.level, SST_TF_INFO_1_OFFSET,
>  				    SST_TF_NUM_CORE_0_WIDTH * i, SST_TF_NUM_CORE_0_WIDTH,
>  				    SST_MUL_FACTOR_NONE)
>  
> +
> +done_core_count:
> +
>  	if (copy_to_user(argp, &turbo_freq, sizeof(turbo_freq)))
>  		return -EFAULT;
>  
> 

-- 
 i.



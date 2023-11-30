Return-Path: <platform-driver-x86+bounces-182-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE217FEF02
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 13:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A10771C20CAD
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 12:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5558C46BBC;
	Thu, 30 Nov 2023 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xv3KtM6G"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39E41AD;
	Thu, 30 Nov 2023 04:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701347100; x=1732883100;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4zM850+IDu5hgcsYtxWNOh0QEqOrEVkyt4Uzmx6wLPQ=;
  b=Xv3KtM6G/sQjwXXAxqPN4pqHeSI2SQjFcJbezlVuW8Vt7hFxJ4C6QOyc
   XLEC281EGImd6gaAkryPDUxfNgdqccpK9HnMY4xx8T7N5n1FxCqAun9OO
   TnnCsNcC4/bNRLBztamtVjJGjG5pEfo2rdQPPFXt/Zh01ZyBa6WlG0Lpd
   d7AMqcXVAM0fZeTIQqhuHz30v86yjoUv5BD2El+Pq45GxcpSMMCcgjImg
   ub+SOXIJapo6elUSavcK9u8ORX374SKRcJJCpxFsLbhHRXAdEm6qglgd2
   gbYQPyvs2KN0TgkuhYOt9qBS/cSq5jPm3ZFi1Nr+zlRPGpdhufaZMtd1N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="396122814"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="396122814"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745618835"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="745618835"
Received: from bergler-mobl.ger.corp.intel.com ([10.249.33.30])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:24:58 -0800
Date: Thu, 30 Nov 2023 14:24:55 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] platform/x86/intel-uncore-freq: Process read/write
 blocked feature status
In-Reply-To: <20231128185605.3027653-7-srinivas.pandruvada@linux.intel.com>
Message-ID: <80b89411-4633-4b8f-72b1-bf262174566e@linux.intel.com>
References: <20231128185605.3027653-1-srinivas.pandruvada@linux.intel.com> <20231128185605.3027653-7-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1161852847-1701347099=:1808"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1161852847-1701347099=:1808
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 28 Nov 2023, Srinivas Pandruvada wrote:

> When a feature is read blocked, don't continue to read uncore information
> and register with uncore core.
> 
> When the feature is write blocked, continue to offer read interface but
> block setting uncore limits.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../uncore-frequency/uncore-frequency-tpmi.c      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> index 4fb790552c47..de5db49a9afe 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> @@ -66,6 +66,7 @@ struct tpmi_uncore_struct {
>  	int min_ratio;
>  	struct tpmi_uncore_power_domain_info *pd_info;
>  	struct tpmi_uncore_cluster_info root_cluster;
> +	bool write_blocked;
>  };
>  
>  #define UNCORE_GENMASK_MIN_RATIO	GENMASK_ULL(21, 15)
> @@ -157,6 +158,9 @@ static int uncore_write_control_freq(struct uncore_data *data, unsigned int inpu
>  	cluster_info = container_of(data, struct tpmi_uncore_cluster_info, uncore_data);
>  	uncore_root = cluster_info->uncore_root;
>  
> +	if (uncore_root->write_blocked)
> +		return -EPERM;
> +
>  	/* Update each cluster in a package */
>  	if (cluster_info->root_domain) {
>  		struct tpmi_uncore_struct *uncore_root = cluster_info->uncore_root;
> @@ -233,11 +237,21 @@ static void remove_cluster_entries(struct tpmi_uncore_struct *tpmi_uncore)
>  
>  static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
>  {
> +	int read_blocked = 0, write_blocked = 0;
>  	struct intel_tpmi_plat_info *plat_info;
>  	struct tpmi_uncore_struct *tpmi_uncore;
>  	int ret, i, pkg = 0;
>  	int num_resources;
>  
> +	ret = tpmi_get_feature_status(auxdev, TPMI_ID_UNCORE, &read_blocked, &write_blocked);
> +	if (ret)
> +		dev_info(&auxdev->dev, "Can't read feature status: ignoring blocked status\n");
> +
> +	if (read_blocked) {
> +		dev_info(&auxdev->dev, "Firmware has blocked reads, exiting\n");
> +		return -ENODEV;
> +	}
> +
>  	/* Get number of power domains, which is equal to number of resources */
>  	num_resources = tpmi_get_resource_count(auxdev);
>  	if (!num_resources)
> @@ -266,6 +280,7 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
>  	}
>  
>  	tpmi_uncore->power_domain_count = num_resources;
> +	tpmi_uncore->write_blocked = write_blocked;
>  
>  	/* Get the package ID from the TPMI core */
>  	plat_info = tpmi_get_platform_data(auxdev);

Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>

While reviewing this, I begun to wonder why's the 
tpmi_get_feature_status() interface using int * as in practice these will 
always be converted to bool by the users?

-- 
 i.

--8323329-1161852847-1701347099=:1808--


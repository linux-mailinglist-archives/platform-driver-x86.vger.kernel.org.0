Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B417F2CEF
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Nov 2023 13:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjKUMSD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Nov 2023 07:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjKUMSC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2023 07:18:02 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81586183;
        Tue, 21 Nov 2023 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700569079; x=1732105079;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wnnuzNNdLOIeEWvUOcIzsIsORKSmmKYc9vDtsELq71Y=;
  b=TS1AQg/boJ/143rUPLpyRfgVFwTHm7GCbUYu6pbmq+afIHNOHlP/vqtN
   PyMHNjqvuJb68zMdQSB9NHlpdMEPXDl+VxlVSHH1pVADV+3S/yyx4mrfe
   1KkAvPGpW5I0BU+oX5FsXbsB7f8FOyHt5rPo02ab699iijf8GdRe9Ekmn
   S6xLJaLW61gF2pppyI8sYGoykpBKEuK63m0syttcX20m6ILYMaFV7zv5w
   WB0UXSv4QpX1Fiz8Ip64qhKebbNcopzSjYVE0V0mvIs10JtNZIBwUIeHj
   lMq/Tvma8qXLHuUdVIct4JcrZSwNE4SWJivDNuH7m59+1Cfg+gBNzLU/s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458325614"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="458325614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="14897973"
Received: from sbouradx-mobl.ger.corp.intel.com ([10.252.58.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:17:56 -0800
Date:   Tue, 21 Nov 2023 14:17:53 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, Patil.Reddy@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v5 11/17] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
In-Reply-To: <20231117080747.3643990-12-Shyam-sundar.S-k@amd.com>
Message-ID: <58ccd66-7229-4c83-fa86-ea7d7ff96068@linux.intel.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com> <20231117080747.3643990-12-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 17 Nov 2023, Shyam Sundar S K wrote:

> A policy binary is OS agnostic, and the same policies are expected to work
> across the OSes.  At times it becomes difficult to debug when the policies
> inside the policy binaries starts to misbehave. Add a way to sideload such
> policies independently to debug them via a debugfs entry.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 5f10e5c6335e..f73663c629fe 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c

> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> +				   size_t length, loff_t *pos)
> +{
> +	struct amd_pmf_dev *dev = filp->private_data;
> +	int ret;
> +
> +	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> +	if (length > POLICY_BUF_MAX_SZ || length == 0)
> +		return -EINVAL;
> +
> +	dev->policy_sz = length;
> +	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
> +		return -EFAULT;
> +
> +	ret = amd_pmf_start_policy_engine(dev);

Is this call safe against concurrent invocations from two racing writes?

Other than that, this change looked fine.

> +	if (ret)
> +		return -EINVAL;
> +
> +	return length;
> +}


-- 
 i.


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED1470D6F2
	for <lists+platform-driver-x86@lfdr.de>; Tue, 23 May 2023 10:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235434AbjEWIPi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 23 May 2023 04:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236200AbjEWIPG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 04:15:06 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F461BE5
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684829593; x=1716365593;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oXEcxpJQ224xYJH7SJhGlGAtbGvGTvyDp6JuhVn4cSk=;
  b=WTc9G26544erbtWn9Ku3rqU7FvevPcCU8qlaSHqOqfogywERE051ntEd
   zgwl1gOaoRYGYr5Q3iDmJfamAawKzkwPc6B7vu8eadWVnVCqAIMOTK3Ga
   q9s9Jh7MgZK9bXFmcmdoy1BOCYxynr2OADpl3/T1R2tcclGK34ZfzDNKc
   IXwJFxoim4r2VbN+nTMHBgWmYezepHrkAM+2sMGHlVsHOH2zLcatAxHph
   WXeWmqU2FEnXMbEBRfhnwK13e/qV5orrIDMKpHND0sgtYGmOBJv60cHuw
   6eVesddxyJyPzdT89mDprKy3p74Hi407Co1gvEVcGTXJO7gH4iTAgmq9K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333535545"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="333535545"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="681301110"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="681301110"
Received: from oodnolex-mobl1.ccr.corp.intel.com ([10.252.55.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:10:58 -0700
Date:   Tue, 23 May 2023 11:10:53 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 1/4] platform/x86/amd: pmc: Pass true/false to bool
 argument
In-Reply-To: <20230516091308.3905113-2-Shyam-sundar.S-k@amd.com>
Message-ID: <203c7f14-912-e5e0-f459-3c1f877fbe61@linux.intel.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com> <20230516091308.3905113-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-809115856-1684829460=:3565"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-809115856-1684829460=:3565
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 16 May 2023, Shyam Sundar S K wrote:

> Pass true/false to the bool argument of the amd_pmc_send_cmd() function,
> instead of 1/0 to match the function signature.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.


> ---
>  drivers/platform/x86/amd/pmc.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 427905714f79..f28c295b47dd 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -261,7 +261,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 1;
>  
>  	/* Get the num_samples to calculate the last push location */
> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, true);
>  	/* Clear msg_port for other SMU operation */
>  	dev->msg_port = 0;
>  	if (ret) {
> @@ -317,15 +317,15 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>  
>  	/* Get Active devices list from SMU */
>  	if (!dev->active_ips)
> -		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
> +		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, true);
>  
>  	/* Get dram address */
>  	if (!dev->smu_virt_addr) {
>  		u32 phys_addr_low, phys_addr_hi;
>  		u64 smu_phys_addr;
>  
> -		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
> -		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
> +		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, true);
> +		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, true);
>  		smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>  		dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr,
> @@ -335,8 +335,8 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>  	}
>  
>  	/* Start the logging */
> -	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> -	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
> +	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, false);
> +	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, false);
>  
>  	return 0;
>  }
> @@ -377,7 +377,7 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>  	if (dev->cpu_id == AMD_CPU_ID_PCO)
>  		return -ENODEV;
>  
> -	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
> +	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, true);
>  	if (rc)
>  		return rc;
>  
> @@ -794,7 +794,7 @@ static void amd_pmc_s2idle_prepare(void)
>  	}
>  
>  	msg = amd_pmc_get_os_hint(pdev);
> -	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
> +	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, false);
>  	if (rc) {
>  		dev_err(pdev->dev, "suspend failed: %d\n", rc);
>  		return;
> @@ -829,7 +829,7 @@ static int amd_pmc_dump_data(struct amd_pmc_dev *pdev)
>  	if (pdev->cpu_id == AMD_CPU_ID_PCO)
>  		return -ENODEV;
>  
> -	return amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
> +	return amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, false);
>  }
>  
>  static void amd_pmc_s2idle_restore(void)
> @@ -839,7 +839,7 @@ static void amd_pmc_s2idle_restore(void)
>  	u8 msg;
>  
>  	msg = amd_pmc_get_os_hint(pdev);
> -	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
> +	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, false);
>  	if (rc)
>  		dev_err(pdev->dev, "resume failed: %d\n", rc);
>  
> @@ -899,13 +899,13 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;
>  
> -	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, true);
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>  		return -EIO;
>  
>  	/* Get STB DRAM address */
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, true);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, true);
>  
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);

--8323329-809115856-1684829460=:3565--

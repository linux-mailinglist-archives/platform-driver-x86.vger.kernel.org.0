Return-Path: <platform-driver-x86+bounces-4163-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F691F0B3
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Jul 2024 10:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF67E1F22D84
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Jul 2024 08:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5090F14B950;
	Tue,  2 Jul 2024 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SlffUMmT"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8BB14885D
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907338; cv=none; b=N6/ZsKisBR/KVsvvD6G6F/nbDaAYc/WwhqCGpqswLerqf51K/7AJaoQMdeFbmggOBS8403IDXJoSfP3IirRMt/+qhAQmnvxetaKI+NPNuumyJ6EWSDd0KIGgT0W92BlkGfzQzI1qzr5aK4pye7YzKExfh6qEL4Mf2YXEsBbhMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907338; c=relaxed/simple;
	bh=1a3mQn+a3ZNHqAHP5bLU59t/TTsim9mi3m3ENzny7Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdVxmV+S+bSnycLZ20c4ezApgVA1WYx+LM1LBl+IfLjiVutkngHQBhXWyC9/AakotiExkKCRPigl2mC4nP5SwPk06irY/jfKTJJ3pv6bVS+HcPK8e231Tnl1DP7Kfda02iGtUvI+KGtQQJXP468iwMCWTRmMy25o//pHY+6F0r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SlffUMmT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719907335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVoYN59vTDrQa1C1UzEOGTsULL6beRfTFki0TsL/jCE=;
	b=SlffUMmTKVCqieNMmnMXtRrB/vyrHQpo8pD7BMeTEvK1pMszTc5ava2YUkvEF8i6mJytVz
	NhZte2YWQNewE0wMxS6KBw8x1KRqh6YmkVG/U7VKfQvWxCmoonxB+CGcQKLLHilYzfYii7
	VDiZzm6/MatroDsrbpr7lK2nq65gPV8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-u8g6-1ZtPk2ThHL0IVUROQ-1; Tue, 02 Jul 2024 04:02:09 -0400
X-MC-Unique: u8g6-1ZtPk2ThHL0IVUROQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a75101512aeso199990866b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jul 2024 01:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719907328; x=1720512128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVoYN59vTDrQa1C1UzEOGTsULL6beRfTFki0TsL/jCE=;
        b=UOZLS+RklWueuV3loadvEwL07OkpYuBbXYx5ywrMnQ8lXCh0iLE8NHSBLHAI84mq2r
         mjryxz23B0uOKtclBWPOtAQP+UOOm2vMugr6Uy5N+iGsr4bdV3+WOJzkQwHTALO4Wzp5
         i5Z0oF7pCYWGBlkQ3MWZUSZKw5KPdHk3EcTm1m40QRE9w8SVKc5xaUyF1HqTHxHreGaj
         GM/Bg4VXXfO10HaK1L7fdwIhYbovAHoeIyK8QqVkYeXN5GCyizygdvACo6uGd76TaID2
         tUOh90PoeE94ljuXnjvywekG+XD2F26Wl9XiG/Cl9SSaQt9Wk2xhHYjzEBXhQesS1JP3
         XZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXtrxhzVi3glZa6/62CcZNKvjEUR9PneqhDR7YfCvZDpkt7oozcKJdIxGo4uyEdN8hGeNmssXOLpY02Q067rk74wV44GkbKIZChSzkHrvkx0yQNpQ==
X-Gm-Message-State: AOJu0Yzv2LPFJGD+t9/24y1sDAoeKVSPVognOfSG0GNBtgYsbXI4j3Io
	QNXC83Vl/T0Iay82A8T5nm/vggvRjd9obZz/ffDR18tXrU3gIefyF3VuBTagzh2cl0hK5HOQrvZ
	u/iH4100WIXzmdmiatf3qv13bq/86Fz2sOghOWjByw9xsPzrk6qtqu/aQACqVytYh/0SCMTM=
X-Received: by 2002:a17:907:7211:b0:a6f:e456:4207 with SMTP id a640c23a62f3a-a75144a2799mr675472666b.61.1719907328439;
        Tue, 02 Jul 2024 01:02:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHppy5meknVw2v17i0GvHYjTex6nZS94cmfpNA2gHsI3SwkJuxYbfijT8/K4FbkBJ0+UzEwrA==
X-Received: by 2002:a17:907:7211:b0:a6f:e456:4207 with SMTP id a640c23a62f3a-a75144a2799mr675468966b.61.1719907327896;
        Tue, 02 Jul 2024 01:02:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf1bbcbsm396641966b.36.2024.07.02.01.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 01:02:07 -0700 (PDT)
Message-ID: <6c4a7fab-6ee8-4a61-b790-7402cc107807@redhat.com>
Date: Tue, 2 Jul 2024 10:02:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: Enable the ACPI PM Timer to be
 turned off when suspended
To: Marek Maslanka <mmaslanka@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: David E Box <david.e.box@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <20240701222508.1.I872f9412fdb7cdc20d7c6e98b93daa014f3616dc@changeid>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240701222508.1.I872f9412fdb7cdc20d7c6e98b93daa014f3616dc@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Marek,

On 7/2/24 12:25 AM, Marek Maslanka wrote:
> Allow to disable ACPI PM Timer on suspend and enable on resume. A
> disabled timer helps optimise power consumption when the system is
> suspended. On resume the timer is only reactivated if it was activated
> prior to suspend, so unless the ACPI PM timer is enabled in the BIOS,
> this won't change anything.
> 
> Signed-off-by: Marek Maslanka <mmaslanka@google.com>

Thank you for your patch. I have not looked into it into too much
detail (I expect the Intel maintainers of the driver will do that)
but why is there a Kconfig option for this ?

It seems to me that this is something which we simply always want
to do and we don't need all the #ifdef-s ?

Regards,

Hans



> ---
> 
>  drivers/platform/x86/intel/pmc/Kconfig | 13 ++++++++
>  drivers/platform/x86/intel/pmc/adl.c   |  4 +++
>  drivers/platform/x86/intel/pmc/cnp.c   |  4 +++
>  drivers/platform/x86/intel/pmc/core.c  | 43 ++++++++++++++++++++++++++
>  drivers/platform/x86/intel/pmc/core.h  | 14 +++++++++
>  drivers/platform/x86/intel/pmc/icl.c   |  4 +++
>  drivers/platform/x86/intel/pmc/mtl.c   |  4 +++
>  drivers/platform/x86/intel/pmc/spt.c   |  4 +++
>  drivers/platform/x86/intel/pmc/tgl.c   |  4 +++
>  9 files changed, 94 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/intel/pmc/Kconfig
> index d2f651fbec2cf..3a563db8eba6a 100644
> --- a/drivers/platform/x86/intel/pmc/Kconfig
> +++ b/drivers/platform/x86/intel/pmc/Kconfig
> @@ -24,3 +24,16 @@ config INTEL_PMC_CORE
>  		- SLPS0 Debug registers (Cannonlake/Icelake PCH)
>  		- Low Power Mode registers (Tigerlake and beyond)
>  		- PMC quirks as needed to enable SLPS0/S0ix
> +
> +config DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	bool "Disable ACPI PM Timer on suspend"
> +	default n
> +	depends on INTEL_PMC_CORE
> +	help
> +	  Disable ACPI Power Management Timer on entering to suspend and enable it
> +	  on resume. This helps optimize energy consumption while the system is
> +	  suspend.
> +
> +	  This is only applicable if the ACPI PM timer is enabled by the BIOS.
> +
> +	  Say N if unsure.
> diff --git a/drivers/platform/x86/intel/pmc/adl.c b/drivers/platform/x86/intel/pmc/adl.c
> index e7878558fd909..8859e0d275288 100644
> --- a/drivers/platform/x86/intel/pmc/adl.c
> +++ b/drivers/platform/x86/intel/pmc/adl.c
> @@ -295,6 +295,10 @@ const struct pmc_reg_map adl_reg_map = {
>  	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
>  	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
>  	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> +	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
>  	.lpm_num_modes = ADL_LPM_NUM_MODES,
>  	.lpm_num_maps = ADL_LPM_NUM_MAPS,
> diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
> index dd72974bf71e2..e92157aa3c9f1 100644
> --- a/drivers/platform/x86/intel/pmc/cnp.c
> +++ b/drivers/platform/x86/intel/pmc/cnp.c
> @@ -200,6 +200,10 @@ const struct pmc_reg_map cnp_reg_map = {
>  	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
>  	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
>  	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> +	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  	.ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
>  	.etr3_offset = ETR3_OFFSET,
>  };
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 10c96c1a850af..a3e56c524308f 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1171,6 +1171,37 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
>  	return val == 1;
>  }
>  
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +/*
> + * Enable or disable APCI PM Timer
> + *
> + * @return: Previous APCI PM Timer enabled state
> + */
> +static bool pmc_core_enable_apci_pm_timer(struct pmc_dev *pmcdev, bool enable)
> +{
> +	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
> +	const struct pmc_reg_map *map = pmc->map;
> +	bool state;
> +	u32 reg;
> +
> +	if (!map->acpi_pm_tmr_ctl_offset)
> +		return false;
> +
> +	mutex_lock(&pmcdev->lock);
> +
> +	reg = pmc_core_reg_read(pmc, map->acpi_pm_tmr_ctl_offset);
> +	state = !(reg & map->acpi_pm_tmr_disable_bit);
> +	if (enable)
> +		reg &= ~map->acpi_pm_tmr_disable_bit;
> +	else
> +		reg |= map->acpi_pm_tmr_disable_bit;
> +	pmc_core_reg_write(pmc, map->acpi_pm_tmr_ctl_offset, reg);
> +
> +	mutex_unlock(&pmcdev->lock);
> +
> +	return state;
> +}
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  
>  static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
>  {
> @@ -1446,6 +1477,12 @@ static __maybe_unused int pmc_core_suspend(struct device *dev)
>  	if (pmcdev->suspend)
>  		pmcdev->suspend(pmcdev);
>  
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	/* Disable APCI PM Timer */
> +	pmcdev->enable_acpi_pm_timer_on_resume =
> +		pmc_core_enable_apci_pm_timer(pmcdev, false);
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
> +
>  	/* Check if the syspend will actually use S0ix */
>  	if (pm_suspend_via_firmware())
>  		return 0;
> @@ -1500,6 +1537,12 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
>  	int offset = pmc->map->lpm_status_offset;
>  	int i;
>  
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	/* Enable APCI PM Timer */
> +	if (pmcdev->enable_acpi_pm_timer_on_resume)
> +		pmc_core_enable_apci_pm_timer(pmcdev, true);
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
> +
>  	/* Check if the syspend used S0ix */
>  	if (pm_suspend_via_firmware())
>  		return 0;
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index 83504c49a0e31..4d5983d741433 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -67,6 +67,10 @@ struct telem_endpoint;
>  #define SPT_PMC_LTR_SCC				0x3A0
>  #define SPT_PMC_LTR_ISH				0x3A4
>  
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +#define SPT_PMC_ACPI_PM_TMR_CTL_OFFSET		0x18FC
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
> +
>  /* Sunrise Point: PGD PFET Enable Ack Status Registers */
>  enum ppfear_regs {
>  	SPT_PMC_XRAM_PPFEAR0A = 0x590,
> @@ -147,6 +151,10 @@ enum ppfear_regs {
>  #define SPT_PMC_VRIC1_SLPS0LVEN			BIT(13)
>  #define SPT_PMC_VRIC1_XTALSDQDIS		BIT(22)
>  
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +#define SPT_PMC_BIT_ACPI_PM_TMR_DISABLE		BIT(1)
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
> +
>  /* Cannonlake Power Management Controller register offsets */
>  #define CNP_PMC_SLPS0_DBG_OFFSET		0x10B4
>  #define CNP_PMC_PM_CFG_OFFSET			0x1818
> @@ -344,6 +352,8 @@ struct pmc_reg_map {
>  	const u8  *lpm_reg_index;
>  	const u32 pson_residency_offset;
>  	const u32 pson_residency_counter_step;
> +	const u32 acpi_pm_tmr_ctl_offset;
> +	const u32 acpi_pm_tmr_disable_bit;
>  };
>  
>  /**
> @@ -417,6 +427,10 @@ struct pmc_dev {
>  	u32 die_c6_offset;
>  	struct telem_endpoint *punit_ep;
>  	struct pmc_info *regmap_list;
> +
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	bool enable_acpi_pm_timer_on_resume;
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  };
>  
>  enum pmc_index {
> diff --git a/drivers/platform/x86/intel/pmc/icl.c b/drivers/platform/x86/intel/pmc/icl.c
> index 71b0fd6cb7d84..8b5c782e71ebd 100644
> --- a/drivers/platform/x86/intel/pmc/icl.c
> +++ b/drivers/platform/x86/intel/pmc/icl.c
> @@ -46,6 +46,10 @@ const struct pmc_reg_map icl_reg_map = {
>  	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
>  	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
>  	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> +	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  	.ltr_ignore_max = ICL_NUM_IP_IGN_ALLOWED,
>  	.etr3_offset = ETR3_OFFSET,
>  };
> diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
> index c7d15d864039d..c726ef8f1d5a9 100644
> --- a/drivers/platform/x86/intel/pmc/mtl.c
> +++ b/drivers/platform/x86/intel/pmc/mtl.c
> @@ -462,6 +462,10 @@ const struct pmc_reg_map mtl_socm_reg_map = {
>  	.ppfear_buckets = MTL_SOCM_PPFEAR_NUM_ENTRIES,
>  	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
>  	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> +	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  	.lpm_num_maps = ADL_LPM_NUM_MAPS,
>  	.ltr_ignore_max = MTL_SOCM_NUM_IP_IGN_ALLOWED,
>  	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
> diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
> index ab993a69e33ee..4832e953d0403 100644
> --- a/drivers/platform/x86/intel/pmc/spt.c
> +++ b/drivers/platform/x86/intel/pmc/spt.c
> @@ -130,6 +130,10 @@ const struct pmc_reg_map spt_reg_map = {
>  	.ppfear_buckets = SPT_PPFEAR_NUM_ENTRIES,
>  	.pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
>  	.pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> +	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  	.ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
>  	.pm_vric1_offset = SPT_PMC_VRIC1_OFFSET,
>  };
> diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
> index e0580de180773..4742b84fe226e 100644
> --- a/drivers/platform/x86/intel/pmc/tgl.c
> +++ b/drivers/platform/x86/intel/pmc/tgl.c
> @@ -197,6 +197,10 @@ const struct pmc_reg_map tgl_reg_map = {
>  	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
>  	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
>  	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
> +#ifdef CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND
> +	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> +	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> +#endif /* CONFIG_DISABLE_ACPI_PM_TIMER_ON_SUSPEND */
>  	.ltr_ignore_max = TGL_NUM_IP_IGN_ALLOWED,
>  	.lpm_num_maps = TGL_LPM_NUM_MAPS,
>  	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,



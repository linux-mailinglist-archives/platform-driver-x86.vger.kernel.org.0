Return-Path: <platform-driver-x86+bounces-5354-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F89751BA
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Sep 2024 14:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9461E2819AE
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Sep 2024 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701FC18785F;
	Wed, 11 Sep 2024 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hCk/s8yV"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB518732C
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057004; cv=none; b=pJGhyVSKosgYNawMycGEHQSmh1HZHPIQJRFSfDYLzHpkTScfLDQ/Salyji76iIQtzCIuunPWcYLso+0Ht6GxXtQx8n2PNy8AwKRe7Ig/GC1OwIPfHvxV4GhPv7rbk5RZSkUUcfpGUBD4C+FKqkKq9ZIxk5Mh1o6XpO3gx+tyQ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057004; c=relaxed/simple;
	bh=y+RXBxHW/fG6dmqBGlPAQwmnNgp07f4Kl7fIHvXNDYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bnB8ZfWAgul5HTTddZu1b2UOUD8qwYyQhy9o/B/uvNx6sxY/hPz8PgeW0oZfScyVm/E8s9g5qxZYwSy+uI7QFD+QLWRLTDsdzyxeQaJ5AT51gKyvomZzsECMvwn4QdtAc7sw3FbQFgDVY27KlvI5mVrC037DQVC3NCU9a5aQCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hCk/s8yV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726057001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jar5EI9omcqYVQEDUhE+fTZ/7hHoS8oVmR3xs0BHXyo=;
	b=hCk/s8yVlmSWcxa1F/yF9LP0ChHWXyTKF5laaqydaZ70bmv8drHTk+LN3VmTxgm9alTba7
	tv00EVUajtbbjq00qFdQaRpKBbLW9KcSbwwB5VGwcnwagm63RvA6XCa2ga1VlSpGUdS6+W
	SxI/zPVihlM4WxYTnEVgds2YvCzYQgM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-3riZLbxXNI2mCtShVYJuIg-1; Wed, 11 Sep 2024 08:16:40 -0400
X-MC-Unique: 3riZLbxXNI2mCtShVYJuIg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8d2e6a6989so245421466b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 05:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726056998; x=1726661798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jar5EI9omcqYVQEDUhE+fTZ/7hHoS8oVmR3xs0BHXyo=;
        b=jE+butne6OuukiltUCmdI0jmgsyVBfsa2SM18BdEEQKNFYXmMtb0PsonHdWfKmtBEO
         loh5H4lcEPHNyi/BZ25bM3OMp6upy+0SqPtAPnPj+oHkkZB6zf1AO7IPahfapyqIkJX6
         A/2pIoA2mT0fgAHQQa5onIgM4nE4VFyLOwGrh8l8oLbkrXxxpbUvwM9uGsOdamPP0YEk
         F4hQOk6YP7SZUAiRa3OqTfLPvG4vb0F8tsUH4RzJi6IDuMWWcUH/Ez+64XvcEoyspMSH
         i3XUWjkdk3cERF2pLJXo01vqg3sFFsmJH1avYvU5/OZFA7sMSSS7XtPdtPA0zEySTti8
         x82A==
X-Forwarded-Encrypted: i=1; AJvYcCXXoHrFESGRPakU5SXvhvErhnc48C8fA5YDWQ3CbQQ2iVJXNkEdqJNOJojrgdz8N0dcww6VN/cJusE2A0BIvHXvb4T0@vger.kernel.org
X-Gm-Message-State: AOJu0YyHM+ApmbrqNpG1UBtWHjUdG1zikmXYXP3imqPJV+R/xYvmOOkL
	ka94a79QytjxrtRMoZRZUz12vVat1ct7aS5i62PS74UehdbyMsmOIq64roi2qX/0J+rJrFeqrWE
	JFzchG44dCbsobBBwzQy/RnKxPdf5dAxdElDevZyjtJPGHWt3OapmNQguJ4ZNEqUx7RBHw3PjF1
	Thlgw=
X-Received: by 2002:a17:906:4fd6:b0:a86:8a18:1da0 with SMTP id a640c23a62f3a-a8ffaa979damr435950366b.5.1726056997951;
        Wed, 11 Sep 2024 05:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSAcNYDwvGEAKNumEEzE7Ab0XbdT66tjBaKUNiGnTTHHOQNkLYXXkujZLzoc/QacmN0QZDCQ==
X-Received: by 2002:a17:906:4fd6:b0:a86:8a18:1da0 with SMTP id a640c23a62f3a-a8ffaa979damr435947466b.5.1726056997409;
        Wed, 11 Sep 2024 05:16:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25951020sm607845866b.66.2024.09.11.05.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 05:16:36 -0700 (PDT)
Message-ID: <edaa23e8-4b15-479c-a4bb-0f8276c8b862@redhat.com>
Date: Wed, 11 Sep 2024 14:16:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86:intel/pmc: Ignore all LTRs during suspend
To: Xi Pardee <xi.pardee@linux.intel.com>, irenic.rajneesh@gmail.com,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240906184016.268153-1-xi.pardee@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240906184016.268153-1-xi.pardee@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/6/24 8:40 PM, Xi Pardee wrote:
> From: Xi Pardee <xi.pardee@intel.com>
> 
> Add support to ignore all LTRs before suspend and restore the previous
> LTR values after suspend. This feature could be turned off with module
> parameter ltr_ignore_all_suspend.
> 
> LTR value is a mechanism for a device to indicate tolerance to access
> the corresponding resource. When system suspends, the resource is not
> available and therefore the LTR value could be ignored. Ignoring all
> LTR values prevents problematic device from blocking the system to get
> to the deepest package state during suspend.
> 
> Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Xi Pardee <xi.pardee@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> v2:
> - Add more details to commit message
> - Fix format: ltr->LTR, S0IX->S0ix, space between name and email
> 
> ---
>  drivers/platform/x86/intel/pmc/core.c | 53 +++++++++++++++++++++++++++
>  drivers/platform/x86/intel/pmc/core.h |  2 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 01ae71c6df59..0ec703af16a4 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -714,6 +714,49 @@ static int pmc_core_s0ix_blocker_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_s0ix_blocker);
>  
> +static void pmc_core_ltr_ignore_all(struct pmc_dev *pmcdev)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); i++) {
> +		struct pmc *pmc;
> +		u32 ltr_ign;
> +
> +		pmc = pmcdev->pmcs[i];
> +		if (!pmc)
> +			continue;
> +
> +		guard(mutex)(&pmcdev->lock);
> +		pmc->ltr_ign = pmc_core_reg_read(pmc, pmc->map->ltr_ignore_offset);
> +
> +		/* ltr_ignore_max is the max index value for LTR ignore register */
> +		ltr_ign = pmc->ltr_ign | GENMASK(pmc->map->ltr_ignore_max, 0);
> +		pmc_core_reg_write(pmc, pmc->map->ltr_ignore_offset, ltr_ign);
> +	}
> +
> +	/*
> +	 * Ignoring ME during suspend is blocking platforms with ADL PCH to get to
> +	 * deeper S0ix substate.
> +	 */
> +	pmc_core_send_ltr_ignore(pmcdev, 6, 0);
> +}
> +
> +static void pmc_core_ltr_restore_all(struct pmc_dev *pmcdev)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); i++) {
> +		struct pmc *pmc;
> +
> +		pmc = pmcdev->pmcs[i];
> +		if (!pmc)
> +			continue;
> +
> +		guard(mutex)(&pmcdev->lock);
> +		pmc_core_reg_write(pmc, pmc->map->ltr_ignore_offset, pmc->ltr_ign);
> +	}
> +}
> +
>  static inline u64 adjust_lpm_residency(struct pmc *pmc, u32 offset,
>  				       const int lpm_adj_x2)
>  {
> @@ -1479,6 +1522,10 @@ static bool warn_on_s0ix_failures;
>  module_param(warn_on_s0ix_failures, bool, 0644);
>  MODULE_PARM_DESC(warn_on_s0ix_failures, "Check and warn for S0ix failures");
>  
> +static bool ltr_ignore_all_suspend = true;
> +module_param(ltr_ignore_all_suspend, bool, 0644);
> +MODULE_PARM_DESC(ltr_ignore_all_suspend, "Ignore all LTRs during suspend");
> +
>  static __maybe_unused int pmc_core_suspend(struct device *dev)
>  {
>  	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> @@ -1488,6 +1535,9 @@ static __maybe_unused int pmc_core_suspend(struct device *dev)
>  	if (pmcdev->suspend)
>  		pmcdev->suspend(pmcdev);
>  
> +	if (ltr_ignore_all_suspend)
> +		pmc_core_ltr_ignore_all(pmcdev);
> +
>  	/* Check if the syspend will actually use S0ix */
>  	if (pm_suspend_via_firmware())
>  		return 0;
> @@ -1594,6 +1644,9 @@ static __maybe_unused int pmc_core_resume(struct device *dev)
>  {
>  	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
>  
> +	if (ltr_ignore_all_suspend)
> +		pmc_core_ltr_restore_all(pmcdev);
> +
>  	if (pmcdev->resume)
>  		return pmcdev->resume(pmcdev);
>  
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index ea04de7eb9e8..e862ea88b816 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -372,6 +372,7 @@ struct pmc_info {
>   * @map:		pointer to pmc_reg_map struct that contains platform
>   *			specific attributes
>   * @lpm_req_regs:	List of substate requirements
> + * @ltr_ign:		Holds LTR ignore data while suspended
>   *
>   * pmc contains info about one power management controller device.
>   */
> @@ -380,6 +381,7 @@ struct pmc {
>  	void __iomem *regbase;
>  	const struct pmc_reg_map *map;
>  	u32 *lpm_req_regs;
> +	u32 ltr_ign;
>  };
>  
>  /**



Return-Path: <platform-driver-x86+bounces-2234-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C94E88A582
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 15:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EE9A307B6D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 14:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA8C1272A5;
	Mon, 25 Mar 2024 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQM2tstv"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3861CB33C
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711367965; cv=none; b=eTLikUVsKDRKOGVC7vzaJ/ps74AVx6f4mTpp7dmjille1iCMax/ajhvsZnQj9rSQfL0Ylt0OeHmjESxzacJvawX/W+S8FtAxVAQtdqpomWOVkQb2qIJt9ohkdK+/zgo1VXh0HnJ+qkilbj3allti3oCjauJGho8KaOO1z0NedtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711367965; c=relaxed/simple;
	bh=C1qx5hgoVB9NFh9YNiqXj4e+WyKVuxXUrRnICwRAIE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skp54NoXoq4lk3UiaFFWfNtlRE2jhXWtVeXhm5mD7eScEvzFSmTRmK65OFW/3x8GgBFs2pjCt9t3VxRic6d9Teotf5nz7LTusizOUkdNbUEoxBKd+/j4Yx7dei+HJCMU1L4REnXZ2vP5okSd/Xg0oN5D/D1YtIFkDtDl4HS9LI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQM2tstv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711367962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bbz3jiucNyMXduDVlP9P1EsjIAGYUUTZQT8cWedqicE=;
	b=eQM2tstvpzc+cO4m2xwQrG0+vZjtOdqSjhNtxZDF2C8lqV24i+sJgrJXfnxHsjVSMg+QGE
	U+I7vTfFlRdAjMMK7cdcsATrNliLdqoZl0+iHPq//74cBQ+K5ozAAHlSobp9cyxTM/URW5
	yuLvJ48LDuMCdgvVNUKF7jVxTeRMePk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-NJ4jCLd3PVS9PLghHUUnOA-1; Mon, 25 Mar 2024 07:59:20 -0400
X-MC-Unique: NJ4jCLd3PVS9PLghHUUnOA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56bf83551cfso403882a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 04:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711367959; x=1711972759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbz3jiucNyMXduDVlP9P1EsjIAGYUUTZQT8cWedqicE=;
        b=sNW/x4SSeITgdMo4OZ9KYw6WUaWK7WRtbDeoTRTpmtRTx9+wB0Vv6o8RPxoUSR1mr1
         zTdM1CBVC8dmgXPvgLWbwE54rAGzw0MjWHfhkiFCNyx7aBWr66DdA7S67O1wb4ufhXod
         Akg2Ht8GhhCVioLq4zCZKxK6vlA5oQ53W54OQFmQ/bYkqcjDXoE1u4xE0rS2Miy3n182
         +cnN/wMF4PV/f5e7Y0+U4QDBO/HGA67pleNKPhkxz2Ap6AZrnbzqZEm1F9HilQ2iD7RP
         pIayISepfPvjTmVvcfahh5XDSRChNdTQRXYY3ubz/JDb71dRshjq8z1Oo9CqgZa+11U5
         1Wxw==
X-Gm-Message-State: AOJu0YzHHqxtt07BF3/aHbS4YRheisAwVk8TQH1AFZjQBeY5s6LPid2H
	pqNvY6ihWt5nBuR7mbiiyCplQcNhPtrtm9Vj3R/P6u9yVTbzD32bP3z69O5BgRPDZ+saDNAUGWZ
	/y+B/VEmbKdebCrrAh892w6ZorgILKODwwJU7XdGhot3kNCdtykd4tHh8PR8o7lC/XES4RSY=
X-Received: by 2002:a50:d4d1:0:b0:56b:d9b0:f1c3 with SMTP id e17-20020a50d4d1000000b0056bd9b0f1c3mr4456508edj.39.1711367959558;
        Mon, 25 Mar 2024 04:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv1DSeWsu1M8fhjno8zQZ9QXDWMhXp1S6Ana+WyHe08r1RoBdP6zJRRUUfiot+SDQXuVCWpA==
X-Received: by 2002:a50:d4d1:0:b0:56b:d9b0:f1c3 with SMTP id e17-20020a50d4d1000000b0056bd9b0f1c3mr4456499edj.39.1711367959239;
        Mon, 25 Mar 2024 04:59:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ek25-20020a056402371900b0056bf60cac59sm2798564edb.60.2024.03.25.04.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 04:59:18 -0700 (PDT)
Message-ID: <19291c0b-bf93-4903-9dc0-2fb1e1421103@redhat.com>
Date: Mon, 25 Mar 2024 12:59:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] platform/mellanox: mlxbf-pmc: Add support for
 64-bit counters and cycle count
Content-Language: en-US, nl
To: Shravan Kumar Ramani <shravankr@nvidia.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Vadim Pasternak <vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1707808180.git.shravankr@nvidia.com>
 <ce1140840b09df3fe2b85e3f87089f2e0d0877d0.1707808180.git.shravankr@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ce1140840b09df3fe2b85e3f87089f2e0d0877d0.1707808180.git.shravankr@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shravan,

On 2/13/24 12:15 PM, Shravan Kumar Ramani wrote:
> Add support for programming any counter to monitor the cycle count.
> Since counting of cycles using 32-bit ocunters would result in frequent
> wraparounds, add the ability to combine 2 adjacent 32-bit counters to
> form 1 64-bit counter.
> Both these features are supported by BlueField-3 PMC hardware, hence
> the required bit-fields are exposed by the driver via sysfs to allow
> the user to configure as needed.
> 
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

As Ilpo already mentioned when adding new sysfs attributes these
really should be documented, see:

Documentation/ABI/testing/sysfs-platform-mellanox-bootctl

for an example.

It seems that the attributes used by mlxbf-pmc.c are not documented
at all yet.

Please start a new documentation file, e.g.:

Documentation/ABI/testing/sysfs-platform-mellanox-pmc

for this and at a minimum document the new sysfs attributes there.

Ideally start with a seperate preparation patch documenting the
existing attributes and then in v2 of this patch extend the docs
with info on the new sysfs attributes,

Regards,

Hans




> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 134 ++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 250405bb59a7..e2f11c0c63e9 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -88,6 +88,8 @@
>  #define MLXBF_PMC_CRSPACE_PERFMON_CTL(n) (n * MLXBF_PMC_CRSPACE_PERFMON_REG0_SZ)
>  #define MLXBF_PMC_CRSPACE_PERFMON_EN BIT(30)
>  #define MLXBF_PMC_CRSPACE_PERFMON_CLR BIT(28)
> +#define MLXBF_PMC_CRSPACE_PERFMON_UOC GENMASK(15, 0)
> +#define MLXBF_PMC_CRSPACE_PERFMON_COUNT_CLOCK(n) (MLXBF_PMC_CRSPACE_PERFMON_CTL(n) + 0x4)
>  #define MLXBF_PMC_CRSPACE_PERFMON_VAL0(n) (MLXBF_PMC_CRSPACE_PERFMON_CTL(n) + 0xc)
>  
>  /**
> @@ -114,6 +116,8 @@ struct mlxbf_pmc_attribute {
>   * @attr_event: Attributes for "event" sysfs files
>   * @attr_event_list: Attributes for "event_list" sysfs files
>   * @attr_enable: Attributes for "enable" sysfs files
> + * @attr_use_odd_counter: Attributes for "use_odd_counter" sysfs files
> + * @attr_count_clock: Attributes for "count_clock" sysfs files
>   * @block_attr: All attributes needed for the block
>   * @block_attr_grp: Attribute group for the block
>   */
> @@ -126,6 +130,8 @@ struct mlxbf_pmc_block_info {
>  	struct mlxbf_pmc_attribute *attr_event;
>  	struct mlxbf_pmc_attribute attr_event_list;
>  	struct mlxbf_pmc_attribute attr_enable;
> +	struct mlxbf_pmc_attribute attr_use_odd_counter;
> +	struct mlxbf_pmc_attribute attr_count_clock;
>  	struct attribute *block_attr[MLXBF_PMC_MAX_ATTRS];
>  	struct attribute_group block_attr_grp;
>  };
> @@ -1751,6 +1757,103 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
>  	return count;
>  }
>  
> +/* Show function for "use_odd_counter" sysfs files - only for crspace */
> +static ssize_t mlxbf_pmc_use_odd_counter_show(struct device *dev,
> +					      struct device_attribute *attr, char *buf)
> +{
> +	struct mlxbf_pmc_attribute *attr_use_odd_counter = container_of(
> +		attr, struct mlxbf_pmc_attribute, dev_attr);
> +	unsigned int blk_num;
> +	u32 value, reg;
> +
> +	blk_num = attr_use_odd_counter->nr;
> +
> +	if (mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> +			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
> +			&reg))
> +		return -EINVAL;
> +
> +	value = FIELD_GET(MLXBF_PMC_CRSPACE_PERFMON_UOC, reg);
> +
> +	return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +/* Store function for "use_odd_counter" sysfs files - only for crspace */
> +static ssize_t mlxbf_pmc_use_odd_counter_store(struct device *dev,
> +					       struct device_attribute *attr,
> +					       const char *buf, size_t count)
> +{
> +	struct mlxbf_pmc_attribute *attr_use_odd_counter = container_of(
> +		attr, struct mlxbf_pmc_attribute, dev_attr);
> +	unsigned int blk_num;
> +	u32 uoc, reg;
> +	int err;
> +
> +	blk_num = attr_use_odd_counter->nr;
> +
> +	err = kstrtouint(buf, 0, &uoc);
> +	if (err < 0)
> +		return err;
> +
> +	err = mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> +		MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
> +		&reg);
> +	if (err)
> +		return -EINVAL;
> +
> +	reg &= ~MLXBF_PMC_CRSPACE_PERFMON_UOC;
> +	reg |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFMON_UOC, uoc);
> +
> +	mlxbf_pmc_write(pmc->block[blk_num].mmio_base +
> +		MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
> +		MLXBF_PMC_WRITE_REG_32, reg);
> +
> +	return count;
> +}
> +
> +/* Show function for "count_clock" sysfs files - only for crspace */
> +static ssize_t mlxbf_pmc_count_clock_show(struct device *dev,
> +					  struct device_attribute *attr, char *buf)
> +{
> +	struct mlxbf_pmc_attribute *attr_count_clock = container_of(
> +		attr, struct mlxbf_pmc_attribute, dev_attr);
> +	unsigned int blk_num;
> +	u32 reg;
> +
> +	blk_num = attr_count_clock->nr;
> +
> +	if (mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> +			MLXBF_PMC_CRSPACE_PERFMON_COUNT_CLOCK(pmc->block[blk_num].counters),
> +			&reg))
> +		return -EINVAL;
> +
> +	return sysfs_emit(buf, "%u\n", reg);
> +}
> +
> +/* Store function for "count_clock" sysfs files - only for crspace */
> +static ssize_t mlxbf_pmc_count_clock_store(struct device *dev,
> +					   struct device_attribute *attr,
> +					   const char *buf, size_t count)
> +{
> +	struct mlxbf_pmc_attribute *attr_count_clock = container_of(
> +		attr, struct mlxbf_pmc_attribute, dev_attr);
> +	unsigned int blk_num;
> +	u32 reg;
> +	int err;
> +
> +	blk_num = attr_count_clock->nr;
> +
> +	err = kstrtouint(buf, 0, &reg);
> +	if (err < 0)
> +		return err;
> +
> +	mlxbf_pmc_write(pmc->block[blk_num].mmio_base +
> +		MLXBF_PMC_CRSPACE_PERFMON_COUNT_CLOCK(pmc->block[blk_num].counters),
> +		MLXBF_PMC_WRITE_REG_32, reg);
> +
> +	return count;
> +}
> +
>  /* Populate attributes for blocks with counters to monitor performance */
>  static int mlxbf_pmc_init_perftype_counter(struct device *dev, unsigned int blk_num)
>  {
> @@ -1784,6 +1887,37 @@ static int mlxbf_pmc_init_perftype_counter(struct device *dev, unsigned int blk_
>  		attr = NULL;
>  	}
>  
> +	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE) {
> +		/*
> +		 * Couple adjacent odd and even 32-bit counters to form 64-bit counters
> +		 * using "use_odd_counter" sysfs which has one bit per even counter.
> +		 */
> +		attr = &pmc->block[blk_num].attr_use_odd_counter;
> +		attr->dev_attr.attr.mode = 0644;
> +		attr->dev_attr.show = mlxbf_pmc_use_odd_counter_show;
> +		attr->dev_attr.store = mlxbf_pmc_use_odd_counter_store;
> +		attr->nr = blk_num;
> +		attr->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
> +							  "use_odd_counter");
> +		if (!attr->dev_attr.attr.name)
> +			return -ENOMEM;
> +		pmc->block[blk_num].block_attr[++i] = &attr->dev_attr.attr;
> +		attr = NULL;
> +
> +		/* Program crspace counters to count clock cycles using "count_clock" sysfs */
> +		attr = &pmc->block[blk_num].attr_count_clock;
> +		attr->dev_attr.attr.mode = 0644;
> +		attr->dev_attr.show = mlxbf_pmc_count_clock_show;
> +		attr->dev_attr.store = mlxbf_pmc_count_clock_store;
> +		attr->nr = blk_num;
> +		attr->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
> +							  "count_clock");
> +		if (!attr->dev_attr.attr.name)
> +			return -ENOMEM;
> +		pmc->block[blk_num].block_attr[++i] = &attr->dev_attr.attr;
> +		attr = NULL;
> +	}
> +
>  	pmc->block[blk_num].attr_counter = devm_kcalloc(
>  		dev, pmc->block[blk_num].counters,
>  		sizeof(struct mlxbf_pmc_attribute), GFP_KERNEL);



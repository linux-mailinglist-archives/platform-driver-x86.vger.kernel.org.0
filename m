Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DF079EBB1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Sep 2023 16:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241527AbjIMOzB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Sep 2023 10:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbjIMOzA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 10:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 256D4AF
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694616849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=awAfHluUJ/k6yFdVNiWXCXLvBkhKef6GriWdlSMOsR0=;
        b=PiK/NCcZy29EB36Q9g0m7CVCVWc6KeWIJWR2cQ+8wewLeuaqXqv2UnxRJLkzENpY9siw4m
        kqFqBciwSTGxTLFb8YAa1a2f+5XW5TuYwMNTyYum6hnvLoVZf20q/FUA3Jcp7VmbHcNTMQ
        gDb87vQCVMEq3Um1C4/NH0h4ijZBn8U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-qS4DtDbSNcSVmKSi7v7-BQ-1; Wed, 13 Sep 2023 10:54:07 -0400
X-MC-Unique: qS4DtDbSNcSVmKSi7v7-BQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-52a38baa269so4802569a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 07:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694616846; x=1695221646;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awAfHluUJ/k6yFdVNiWXCXLvBkhKef6GriWdlSMOsR0=;
        b=vOrrOyH8Ue5pxI8ILIoPUzja4pkRdFkFH/LHYkpTufcDzlS6/CnM70kRqbUByyd9WL
         Jw9gNtTcc6jF80Lrtvy5PHthyXV762NL+/OGTYofx27A/+dr+j1vcGUo427Nvbb3zVZt
         SR2Ly+Z0Z731ZZe04eTSUTf/kBZTJ2+fGiN6AdZUTssLP6StukfFQG7uZDl0XntV7WyU
         mRT3w0zBfrDDpVIIYR5YuSgKysnJVNzERbLT4qNKmwUA+jnzOeR4stpNMHGBspBkpCT6
         CUD14QxBO/m6Worg2WcALScRjIbW18E+/gd7/XwOx+BmFj3ypkPs5kExRNo3Lm2buAtD
         vTNA==
X-Gm-Message-State: AOJu0Yx8zDzSUekYsRlaRKle/QvQhGkpDyK7FbtL4H8x2r5vzPKMp88k
        Yl8xGyZbtY+SoB9TpqoggOpXohz+jzhlzNDppntxC2u3OIvvW/HE/kFlAHg8JoUDhtNIqDR2kpx
        rhPinTT+2SzzujeEI8itT7onc19f9Y6KVvg==
X-Received: by 2002:aa7:cf02:0:b0:523:18db:e3ab with SMTP id a2-20020aa7cf02000000b0052318dbe3abmr2123835edy.39.1694616846195;
        Wed, 13 Sep 2023 07:54:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH72sgYnKshZWVxM5S47u4VyKwnw7uXmvuczU5tVai3xUpXMF2DS1wHrja8TZoOKX9io1onew==
X-Received: by 2002:aa7:cf02:0:b0:523:18db:e3ab with SMTP id a2-20020aa7cf02000000b0052318dbe3abmr2123811edy.39.1694616845660;
        Wed, 13 Sep 2023 07:54:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c18-20020aa7d612000000b005254b41f507sm7515669edr.32.2023.09.13.07.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 07:54:04 -0700 (PDT)
Message-ID: <3ceebe97-6274-bec7-07d9-7a53275a2382@redhat.com>
Date:   Wed, 13 Sep 2023 16:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/3] platform/mellanox: mlxbf-pmc: Add support for
 BlueField-3
Content-Language: en-US, nl
To:     Shravan Kumar Ramani <shravankr@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1693917738.git.shravankr@nvidia.com>
 <d5feee745f6bfd163e0c361e300d4b2ef1d72e00.1693917738.git.shravankr@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d5feee745f6bfd163e0c361e300d4b2ef1d72e00.1693917738.git.shravankr@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/5/23 14:49, Shravan Kumar Ramani wrote:
> Add new access mechanism and list of supported events to program
> and read the counters in BlueField-3.
> Performance counter blocks being added for BlueField-3 include:
>   - Memory Sub-system (mss) which has counters for monitoring
> various DRAM and related skylib events
>   - Last level Tile, which has 2 sets of counters (llt, llt_miss)
> for monitoring Tile and cache metrics
> 
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 686 ++++++++++++++++++++++++--
>  1 file changed, 654 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 2d4bbe99959e..0b427fc24a96 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -30,14 +30,16 @@
>  
>  #define MLXBF_PMC_EVENT_SET_BF1 0
>  #define MLXBF_PMC_EVENT_SET_BF2 1
> +#define MLXBF_PMC_EVENT_SET_BF3 2
>  #define MLXBF_PMC_EVENT_INFO_LEN 100
>  
>  #define MLXBF_PMC_MAX_BLOCKS 30
> -#define MLXBF_PMC_MAX_ATTRS 30
> +#define MLXBF_PMC_MAX_ATTRS 70
>  #define MLXBF_PMC_INFO_SZ 4
>  #define MLXBF_PMC_REG_SIZE 8
>  #define MLXBF_PMC_L3C_REG_SIZE 4
>  
> +#define MLXBF_PMC_TYPE_CRSPACE 2
>  #define MLXBF_PMC_TYPE_COUNTER 1
>  #define MLXBF_PMC_TYPE_REGISTER 0
>  
> @@ -78,6 +80,16 @@
>  #define MLXBF_PMC_L3C_PERF_CNT_LOW_VAL GENMASK(31, 0)
>  #define MLXBF_PMC_L3C_PERF_CNT_HIGH_VAL GENMASK(24, 0)
>  
> +#define MLXBF_PMC_CRSPACE_PERFMON_REG0 0x0
> +#define MLXBF_PMC_CRSPACE_PERFSEL_SZ 4
> +#define MLXBF_PMC_CRSPACE_PERFSEL0 GENMASK(23, 16)
> +#define MLXBF_PMC_CRSPACE_PERFSEL1 GENMASK(7, 0)
> +#define MLXBF_PMC_CRSPACE_PERFMON_REG0_SZ 0x2
> +#define MLXBF_PMC_CRSPACE_PERFMON_CTL(n) (n * MLXBF_PMC_CRSPACE_PERFMON_REG0_SZ)
> +#define MLXBF_PMC_CRSPACE_PERFMON_EN BIT(30)
> +#define MLXBF_PMC_CRSPACE_PERFMON_CLR BIT(28)
> +#define MLXBF_PMC_CRSPACE_PERFMON_VAL0(n) (MLXBF_PMC_CRSPACE_PERFMON_CTL(n) + 0xc)
> +
>  /**
>   * struct mlxbf_pmc_attribute - Structure to hold attribute and block info
>   * for each sysfs entry
> @@ -124,6 +136,9 @@ struct mlxbf_pmc_block_info {
>   * @pdev: The kernel structure representing the device
>   * @total_blocks: Total number of blocks
>   * @tile_count: Number of tiles in the system
> + * @llt_enable: Info on enabled LLTs
> + * @mss_enable: Info on enabled MSSs
> + * @group_num: Group number assigned to each valid block
>   * @hwmon_dev: Hwmon device for bfperf
>   * @block_name: Block name
>   * @block:  Block info
> @@ -136,6 +151,9 @@ struct mlxbf_pmc_context {
>  	struct platform_device *pdev;
>  	uint32_t total_blocks;
>  	uint32_t tile_count;
> +	uint8_t llt_enable;
> +	uint8_t mss_enable;
> +	uint32_t group_num;
>  	struct device *hwmon_dev;
>  	const char *block_name[MLXBF_PMC_MAX_BLOCKS];
>  	struct mlxbf_pmc_block_info block[MLXBF_PMC_MAX_BLOCKS];
> @@ -260,7 +278,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_ecc_events[] = {
>  	{ 0x348, "DRAM_ECC_ERROR" },
>  };
>  
> -static const struct mlxbf_pmc_events mlxbf_pmc_mss_events[] = {
> +static const struct mlxbf_pmc_events mlxbf_pmc_mss_events_1[] = {
>  	{ 0x0, "DISABLE" },
>  	{ 0xc0, "RXREQ_MSS" },
>  	{ 0xc1, "RXDAT_MSS" },
> @@ -268,6 +286,164 @@ static const struct mlxbf_pmc_events mlxbf_pmc_mss_events[] = {
>  	{ 0xc3, "TXDAT_MSS" },
>  };
>  
> +static const struct mlxbf_pmc_events mlxbf_pmc_mss_events_3[] = {
> +	{0, "SKYLIB_CDN_TX_FLITS"},
> +	{1, "SKYLIB_DDN_TX_FLITS"},
> +	{2, "SKYLIB_NDN_TX_FLITS"},
> +	{3, "SKYLIB_SDN_TX_FLITS"},
> +	{4, "SKYLIB_UDN_TX_FLITS"},
> +	{5, "SKYLIB_CDN_RX_FLITS"},
> +	{6, "SKYLIB_DDN_RX_FLITS"},
> +	{7, "SKYLIB_NDN_RX_FLITS"},
> +	{8, "SKYLIB_SDN_RX_FLITS"},
> +	{9, "SKYLIB_UDN_RX_FLITS"},
> +	{10, "SKYLIB_CDN_TX_STALL"},
> +	{11, "SKYLIB_DDN_TX_STALL"},
> +	{12, "SKYLIB_NDN_TX_STALL"},
> +	{13, "SKYLIB_SDN_TX_STALL"},
> +	{14, "SKYLIB_UDN_TX_STALL"},
> +	{15, "SKYLIB_CDN_RX_STALL"},
> +	{16, "SKYLIB_DDN_RX_STALL"},
> +	{17, "SKYLIB_NDN_RX_STALL"},
> +	{18, "SKYLIB_SDN_RX_STALL"},
> +	{19, "SKYLIB_UDN_RX_STALL"},
> +	{20, "SKYLIB_CHI_REQ0_TX_FLITS"},
> +	{21, "SKYLIB_CHI_DATA0_TX_FLITS"},
> +	{22, "SKYLIB_CHI_RESP0_TX_FLITS"},
> +	{23, "SKYLIB_CHI_SNP0_TX_FLITS"},
> +	{24, "SKYLIB_CHI_REQ1_TX_FLITS"},
> +	{25, "SKYLIB_CHI_DATA1_TX_FLITS"},
> +	{26, "SKYLIB_CHI_RESP1_TX_FLITS"},
> +	{27, "SKYLIB_CHI_SNP1_TX_FLITS"},
> +	{28, "SKYLIB_CHI_REQ2_TX_FLITS"},
> +	{29, "SKYLIB_CHI_DATA2_TX_FLITS"},
> +	{30, "SKYLIB_CHI_RESP2_TX_FLITS"},
> +	{31, "SKYLIB_CHI_SNP2_TX_FLITS"},
> +	{32, "SKYLIB_CHI_REQ3_TX_FLITS"},
> +	{33, "SKYLIB_CHI_DATA3_TX_FLITS"},
> +	{34, "SKYLIB_CHI_RESP3_TX_FLITS"},
> +	{35, "SKYLIB_CHI_SNP3_TX_FLITS"},
> +	{36, "SKYLIB_TLP_REQ_TX_FLITS"},
> +	{37, "SKYLIB_TLP_RESP_TX_FLITS"},
> +	{38, "SKYLIB_TLP_META_TX_FLITS"},
> +	{39, "SKYLIB_AXIS_DATA_TX_FLITS"},
> +	{40, "SKYLIB_AXIS_CRED_TX_FLITS"},
> +	{41, "SKYLIB_APB_TX_FLITS"},
> +	{42, "SKYLIB_VW_TX_FLITS"},
> +	{43, "SKYLIB_GGA_MSN_W_TX_FLITS"},
> +	{44, "SKYLIB_GGA_MSN_N_TX_FLITS"},
> +	{45, "SKYLIB_CR_REQ_TX_FLITS"},
> +	{46, "SKYLIB_CR_RESP_TX_FLITS"},
> +	{47, "SKYLIB_MSN_PRNF_TX_FLITS"},
> +	{48, "SKYLIB_DBG_DATA_TX_FLITS"},
> +	{49, "SKYLIB_DBG_CRED_TX_FLITS"},
> +	{50, "SKYLIB_CHI_REQ0_RX_FLITS"},
> +	{51, "SKYLIB_CHI_DATA0_RX_FLITS"},
> +	{52, "SKYLIB_CHI_RESP0_RX_FLITS"},
> +	{53, "SKYLIB_CHI_SNP0_RX_FLITS"},
> +	{54, "SKYLIB_CHI_REQ1_RX_FLITS"},
> +	{55, "SKYLIB_CHI_DATA1_RX_FLITS"},
> +	{56, "SKYLIB_CHI_RESP1_RX_FLITS"},
> +	{57, "SKYLIB_CHI_SNP1_RX_FLITS"},
> +	{58, "SKYLIB_CHI_REQ2_RX_FLITS"},
> +	{59, "SKYLIB_CHI_DATA2_RX_FLITS"},
> +	{60, "SKYLIB_CHI_RESP2_RX_FLITS"},
> +	{61, "SKYLIB_CHI_SNP2_RX_FLITS"},
> +	{62, "SKYLIB_CHI_REQ3_RX_FLITS"},
> +	{63, "SKYLIB_CHI_DATA3_RX_FLITS"},
> +	{64, "SKYLIB_CHI_RESP3_RX_FLITS"},
> +	{65, "SKYLIB_CHI_SNP3_RX_FLITS"},
> +	{66, "SKYLIB_TLP_REQ_RX_FLITS"},
> +	{67, "SKYLIB_TLP_RESP_RX_FLITS"},
> +	{68, "SKYLIB_TLP_META_RX_FLITS"},
> +	{69, "SKYLIB_AXIS_DATA_RX_FLITS"},
> +	{70, "SKYLIB_AXIS_CRED_RX_FLITS"},
> +	{71, "SKYLIB_APB_RX_FLITS"},
> +	{72, "SKYLIB_VW_RX_FLITS"},
> +	{73, "SKYLIB_GGA_MSN_W_RX_FLITS"},
> +	{74, "SKYLIB_GGA_MSN_N_RX_FLITS"},
> +	{75, "SKYLIB_CR_REQ_RX_FLITS"},
> +	{76, "SKYLIB_CR_RESP_RX_FLITS"},
> +	{77, "SKYLIB_MSN_PRNF_RX_FLITS"},
> +	{78, "SKYLIB_DBG_DATA_RX_FLITS"},
> +	{79, "SKYLIB_DBG_CRED_RX_FLITS"},
> +	{80, "SKYLIB_CHI_REQ0_TX_STALL"},
> +	{81, "SKYLIB_CHI_DATA0_TX_STALL"},
> +	{82, "SKYLIB_CHI_RESP0_TX_STALL"},
> +	{83, "SKYLIB_CHI_SNP0_TX_STALL"},
> +	{84, "SKYLIB_CHI_REQ1_TX_STALL"},
> +	{85, "SKYLIB_CHI_DATA1_TX_STALL"},
> +	{86, "SKYLIB_CHI_RESP1_TX_STALL"},
> +	{87, "SKYLIB_CHI_SNP1_TX_STALL"},
> +	{88, "SKYLIB_CHI_REQ2_TX_STALL"},
> +	{89, "SKYLIB_CHI_DATA2_TX_STALL"},
> +	{90, "SKYLIB_CHI_RESP2_TX_STALL"},
> +	{91, "SKYLIB_CHI_SNP2_TX_STALL"},
> +	{92, "SKYLIB_CHI_REQ3_TX_STALL"},
> +	{93, "SKYLIB_CHI_DATA3_TX_STALL"},
> +	{94, "SKYLIB_CHI_RESP3_TX_STALL"},
> +	{95, "SKYLIB_CHI_SNP3_TX_STALL"},
> +	{96, "SKYLIB_TLP_REQ_TX_STALL"},
> +	{97, "SKYLIB_TLP_RESP_TX_STALL"},
> +	{98, "SKYLIB_TLP_META_TX_STALL"},
> +	{99, "SKYLIB_AXIS_DATA_TX_STALL"},
> +	{100, "SKYLIB_AXIS_CRED_TX_STALL"},
> +	{101, "SKYLIB_APB_TX_STALL"},
> +	{102, "SKYLIB_VW_TX_STALL"},
> +	{103, "SKYLIB_GGA_MSN_W_TX_STALL"},
> +	{104, "SKYLIB_GGA_MSN_N_TX_STALL"},
> +	{105, "SKYLIB_CR_REQ_TX_STALL"},
> +	{106, "SKYLIB_CR_RESP_TX_STALL"},
> +	{107, "SKYLIB_MSN_PRNF_TX_STALL"},
> +	{108, "SKYLIB_DBG_DATA_TX_STALL"},
> +	{109, "SKYLIB_DBG_CRED_TX_STALL"},
> +	{110, "SKYLIB_CHI_REQ0_RX_STALL"},
> +	{111, "SKYLIB_CHI_DATA0_RX_STALL"},
> +	{112, "SKYLIB_CHI_RESP0_RX_STALL"},
> +	{113, "SKYLIB_CHI_SNP0_RX_STALL"},
> +	{114, "SKYLIB_CHI_REQ1_RX_STALL"},
> +	{115, "SKYLIB_CHI_DATA1_RX_STALL"},
> +	{116, "SKYLIB_CHI_RESP1_RX_STALL"},
> +	{117, "SKYLIB_CHI_SNP1_RX_STALL"},
> +	{118, "SKYLIB_CHI_REQ2_RX_STALL"},
> +	{119, "SKYLIB_CHI_DATA2_RX_STALL"},
> +	{120, "SKYLIB_CHI_RESP2_RX_STALL"},
> +	{121, "SKYLIB_CHI_SNP2_RX_STALL"},
> +	{122, "SKYLIB_CHI_REQ3_RX_STALL"},
> +	{123, "SKYLIB_CHI_DATA3_RX_STALL"},
> +	{124, "SKYLIB_CHI_RESP3_RX_STALL"},
> +	{125, "SKYLIB_CHI_SNP3_RX_STALL"},
> +	{126, "SKYLIB_TLP_REQ_RX_STALL"},
> +	{127, "SKYLIB_TLP_RESP_RX_STALL"},
> +	{128, "SKYLIB_TLP_META_RX_STALL"},
> +	{129, "SKYLIB_AXIS_DATA_RX_STALL"},
> +	{130, "SKYLIB_AXIS_CRED_RX_STALL"},
> +	{131, "SKYLIB_APB_RX_STALL"},
> +	{132, "SKYLIB_VW_RX_STALL"},
> +	{133, "SKYLIB_GGA_MSN_W_RX_STALL"},
> +	{134, "SKYLIB_GGA_MSN_N_RX_STALL"},
> +	{135, "SKYLIB_CR_REQ_RX_STALL"},
> +	{136, "SKYLIB_CR_RESP_RX_STALL"},
> +	{137, "SKYLIB_MSN_PRNF_RX_STALL"},
> +	{138, "SKYLIB_DBG_DATA_RX_STALL"},
> +	{139, "SKYLIB_DBG_CRED_RX_STALL"},
> +	{140, "SKYLIB_CDN_LOOPBACK_FLITS"},
> +	{141, "SKYLIB_DDN_LOOPBACK_FLITS"},
> +	{142, "SKYLIB_NDN_LOOPBACK_FLITS"},
> +	{143, "SKYLIB_SDN_LOOPBACK_FLITS"},
> +	{144, "SKYLIB_UDN_LOOPBACK_FLITS"},
> +	{145, "HISTOGRAM_HISTOGRAM_BIN0"},
> +	{146, "HISTOGRAM_HISTOGRAM_BIN1"},
> +	{147, "HISTOGRAM_HISTOGRAM_BIN2"},
> +	{148, "HISTOGRAM_HISTOGRAM_BIN3"},
> +	{149, "HISTOGRAM_HISTOGRAM_BIN4"},
> +	{150, "HISTOGRAM_HISTOGRAM_BIN5"},
> +	{151, "HISTOGRAM_HISTOGRAM_BIN6"},
> +	{152, "HISTOGRAM_HISTOGRAM_BIN7"},
> +	{153, "HISTOGRAM_HISTOGRAM_BIN8"},
> +	{154, "HISTOGRAM_HISTOGRAM_BIN9"},
> +};
> +
>  static const struct mlxbf_pmc_events mlxbf_pmc_hnf_events[] = {
>  	{ 0x0, "DISABLE" },
>  	{ 0x45, "HNF_REQUESTS" },
> @@ -429,6 +605,260 @@ static const struct mlxbf_pmc_events mlxbf_pmc_l3c_events[] = {
>  	{ 0x2b, "ANY_REJECT_BANK1" },
>  };
>  
> +static const struct mlxbf_pmc_events mlxbf_pmc_llt_events[] = {
> +	{0, "HNF0_CYCLES"},
> +	{1, "HNF0_REQS_RECEIVED"},
> +	{2, "HNF0_REQS_PROCESSED"},
> +	{3, "HNF0_DIR_HIT"},
> +	{4, "HNF0_DIR_MISS"},
> +	{5, "HNF0_DIR_RD_ALLOC"},
> +	{6, "HNF0_DIR_WR_ALLOC"},
> +	{7, "HNF0_DIR_VICTIM"},
> +	{8, "HNF0_CL_HAZARD"},
> +	{9, "HNF0_ALL_HAZARD"},
> +	{10, "HNF0_PIPE_STALLS"},
> +	{11, "HNF0_MEM_READS"},
> +	{12, "HNF0_MEM_WRITES"},
> +	{13, "HNF0_MEM_ACCESS"},
> +	{14, "HNF0_DCL_READ"},
> +	{15, "HNF0_DCL_INVAL"},
> +	{16, "HNF0_CHI_RXDAT"},
> +	{17, "HNF0_CHI_RXRSP"},
> +	{18, "HNF0_CHI_TXDAT"},
> +	{19, "HNF0_CHI_TXRSP"},
> +	{20, "HNF0_CHI_TXSNP"},
> +	{21, "HNF0_DCT_SNP"},
> +	{22, "HNF0_SNP_FWD_DATA"},
> +	{23, "HNF0_SNP_FWD_RSP"},
> +	{24, "HNF0_SNP_RSP"},
> +	{25, "HNF0_EXCL_FULL"},
> +	{26, "HNF0_EXCL_WRITE_F"},
> +	{27, "HNF0_EXCL_WRITE_S"},
> +	{28, "HNF0_EXCL_WRITE"},
> +	{29, "HNF0_EXCL_READ"},
> +	{30, "HNF0_REQ_BUF_EMPTY"},
> +	{31, "HNF0_ALL_MAFS_BUSY"},
> +	{32, "HNF0_TXDAT_NO_LCRD"},
> +	{33, "HNF0_TXSNP_NO_LCRD"},
> +	{34, "HNF0_TXRSP_NO_LCRD"},
> +	{35, "HNF0_TXREQ_NO_LCRD"},
> +	{36, "HNF0_WRITE"},
> +	{37, "HNF0_READ"},
> +	{38, "HNF0_ACCESS"},
> +	{39, "HNF0_MAF_N_BUSY"},
> +	{40, "HNF0_MAF_N_REQS"},
> +	{41, "HNF0_SEL_OPCODE"},
> +	{42, "HNF1_CYCLES"},
> +	{43, "HNF1_REQS_RECEIVED"},
> +	{44, "HNF1_REQS_PROCESSED"},
> +	{45, "HNF1_DIR_HIT"},
> +	{46, "HNF1_DIR_MISS"},
> +	{47, "HNF1_DIR_RD_ALLOC"},
> +	{48, "HNF1_DIR_WR_ALLOC"},
> +	{49, "HNF1_DIR_VICTIM"},
> +	{50, "HNF1_CL_HAZARD"},
> +	{51, "HNF1_ALL_HAZARD"},
> +	{52, "HNF1_PIPE_STALLS"},
> +	{53, "HNF1_MEM_READS"},
> +	{54, "HNF1_MEM_WRITES"},
> +	{55, "HNF1_MEM_ACCESS"},
> +	{56, "HNF1_DCL_READ"},
> +	{57, "HNF1_DCL_INVAL"},
> +	{58, "HNF1_CHI_RXDAT"},
> +	{59, "HNF1_CHI_RXRSP"},
> +	{60, "HNF1_CHI_TXDAT"},
> +	{61, "HNF1_CHI_TXRSP"},
> +	{62, "HNF1_CHI_TXSNP"},
> +	{63, "HNF1_DCT_SNP"},
> +	{64, "HNF1_SNP_FWD_DATA"},
> +	{65, "HNF1_SNP_FWD_RSP"},
> +	{66, "HNF1_SNP_RSP"},
> +	{67, "HNF1_EXCL_FULL"},
> +	{68, "HNF1_EXCL_WRITE_F"},
> +	{69, "HNF1_EXCL_WRITE_S"},
> +	{70, "HNF1_EXCL_WRITE"},
> +	{71, "HNF1_EXCL_READ"},
> +	{72, "HNF1_REQ_BUF_EMPTY"},
> +	{73, "HNF1_ALL_MAFS_BUSY"},
> +	{74, "HNF1_TXDAT_NO_LCRD"},
> +	{75, "HNF1_TXSNP_NO_LCRD"},
> +	{76, "HNF1_TXRSP_NO_LCRD"},
> +	{77, "HNF1_TXREQ_NO_LCRD"},
> +	{78, "HNF1_WRITE"},
> +	{79, "HNF1_READ"},
> +	{80, "HNF1_ACCESS"},
> +	{81, "HNF1_MAF_N_BUSY"},
> +	{82, "HNF1_MAF_N_REQS"},
> +	{83, "HNF1_SEL_OPCODE"},
> +	{84, "GDC_BANK0_RD_REQ"},
> +	{85, "GDC_BANK0_WR_REQ"},
> +	{86, "GDC_BANK0_ALLOCATE"},
> +	{87, "GDC_BANK0_HIT"},
> +	{88, "GDC_BANK0_MISS"},
> +	{89, "GDC_BANK0_INVALIDATE"},
> +	{90, "GDC_BANK0_EVICT"},
> +	{91, "GDC_BANK0_RD_RESP"},
> +	{92, "GDC_BANK0_WR_ACK"},
> +	{93, "GDC_BANK0_SNOOP"},
> +	{94, "GDC_BANK0_SNOOP_NORMAL"},
> +	{95, "GDC_BANK0_SNOOP_FWD"},
> +	{96, "GDC_BANK0_SNOOP_STASH"},
> +	{97, "GDC_BANK0_SNOOP_STASH_INDPND_RD"},
> +	{98, "GDC_BANK0_FOLLOWER"},
> +	{99, "GDC_BANK0_FW"},
> +	{100, "GDC_BANK0_HIT_DCL_BOTH"},
> +	{101, "GDC_BANK0_HIT_DCL_PARTIAL"},
> +	{102, "GDC_BANK0_EVICT_DCL"},
> +	{103, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA0"},
> +	{103, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA1"},
> +	{105, "GDC_BANK0_ARB_STRB"},
> +	{106, "GDC_BANK0_ARB_WAIT"},
> +	{107, "GDC_BANK0_GGA_STRB"},
> +	{108, "GDC_BANK0_GGA_WAIT"},
> +	{109, "GDC_BANK0_FW_STRB"},
> +	{110, "GDC_BANK0_FW_WAIT"},
> +	{111, "GDC_BANK0_SNP_STRB"},
> +	{112, "GDC_BANK0_SNP_WAIT"},
> +	{113, "GDC_BANK0_MISS_INARB_STRB"},
> +	{114, "GDC_BANK0_MISS_INARB_WAIT"},
> +	{115, "GDC_BANK0_G_FIFO_FF_GGA_RSP_RD0"},
> +	{116, "GDC_BANK0_G_FIFO_FF_GGA_RSP_RD1"},
> +	{117, "GDC_BANK0_G_FIFO_FF_GGA_RSP_RD2"},
> +	{118, "GDC_BANK0_G_FIFO_FF_GGA_RSP_RD3"},
> +	{119, "GDC_BANK0_G_FIFO_FF_GGA_RSP_WR0"},
> +	{120, "GDC_BANK0_G_FIFO_FF_GGA_RSP_WR1"},
> +	{121, "GDC_BANK0_G_FIFO_FF_GGA_RSP_WR2"},
> +	{122, "GDC_BANK0_G_FIFO_FF_GGA_RSP_WR3"},
> +	{123, "GDC_BANK1_RD_REQ"},
> +	{124, "GDC_BANK1_WR_REQ"},
> +	{125, "GDC_BANK1_ALLOCATE"},
> +	{126, "GDC_BANK1_HIT"},
> +	{127, "GDC_BANK1_MISS"},
> +	{128, "GDC_BANK1_INVALIDATE"},
> +	{129, "GDC_BANK1_EVICT"},
> +	{130, "GDC_BANK1_RD_RESP"},
> +	{131, "GDC_BANK1_WR_ACK"},
> +	{132, "GDC_BANK1_SNOOP"},
> +	{133, "GDC_BANK1_SNOOP_NORMAL"},
> +	{134, "GDC_BANK1_SNOOP_FWD"},
> +	{135, "GDC_BANK1_SNOOP_STASH"},
> +	{136, "GDC_BANK1_SNOOP_STASH_INDPND_RD"},
> +	{137, "GDC_BANK1_FOLLOWER"},
> +	{138, "GDC_BANK1_FW"},
> +	{139, "GDC_BANK1_HIT_DCL_BOTH"},
> +	{140, "GDC_BANK1_HIT_DCL_PARTIAL"},
> +	{141, "GDC_BANK1_EVICT_DCL"},
> +	{142, "GDC_BANK1_G_RSE_PIPE_CACHE_DATA0"},
> +	{143, "GDC_BANK1_G_RSE_PIPE_CACHE_DATA1"},
> +	{144, "GDC_BANK1_ARB_STRB"},
> +	{145, "GDC_BANK1_ARB_WAIT"},
> +	{146, "GDC_BANK1_GGA_STRB"},
> +	{147, "GDC_BANK1_GGA_WAIT"},
> +	{148, "GDC_BANK1_FW_STRB"},
> +	{149, "GDC_BANK1_FW_WAIT"},
> +	{150, "GDC_BANK1_SNP_STRB"},
> +	{151, "GDC_BANK1_SNP_WAIT"},
> +	{152, "GDC_BANK1_MISS_INARB_STRB"},
> +	{153, "GDC_BANK1_MISS_INARB_WAIT"},
> +	{154, "GDC_BANK1_G_FIFO_FF_GGA_RSP_RD0"},
> +	{155, "GDC_BANK1_G_FIFO_FF_GGA_RSP_RD1"},
> +	{156, "GDC_BANK1_G_FIFO_FF_GGA_RSP_RD2"},
> +	{157, "GDC_BANK1_G_FIFO_FF_GGA_RSP_RD3"},
> +	{158, "GDC_BANK1_G_FIFO_FF_GGA_RSP_WR0"},
> +	{159, "GDC_BANK1_G_FIFO_FF_GGA_RSP_WR1"},
> +	{160, "GDC_BANK1_G_FIFO_FF_GGA_RSP_WR2"},
> +	{161, "GDC_BANK1_G_FIFO_FF_GGA_RSP_WR3"},
> +	{162, "HISTOGRAM_HISTOGRAM_BIN0"},
> +	{163, "HISTOGRAM_HISTOGRAM_BIN1"},
> +	{164, "HISTOGRAM_HISTOGRAM_BIN2"},
> +	{165, "HISTOGRAM_HISTOGRAM_BIN3"},
> +	{166, "HISTOGRAM_HISTOGRAM_BIN4"},
> +	{167, "HISTOGRAM_HISTOGRAM_BIN5"},
> +	{168, "HISTOGRAM_HISTOGRAM_BIN6"},
> +	{169, "HISTOGRAM_HISTOGRAM_BIN7"},
> +	{170, "HISTOGRAM_HISTOGRAM_BIN8"},
> +	{171, "HISTOGRAM_HISTOGRAM_BIN9"},
> +};
> +
> +static const struct mlxbf_pmc_events mlxbf_pmc_llt_miss_events[] = {
> +	{0, "GDC_MISS_MACHINE_RD_REQ"},
> +	{1, "GDC_MISS_MACHINE_WR_REQ"},
> +	{2, "GDC_MISS_MACHINE_SNP_REQ"},
> +	{3, "GDC_MISS_MACHINE_EVICT_REQ"},
> +	{4, "GDC_MISS_MACHINE_FW_REQ"},
> +	{5, "GDC_MISS_MACHINE_RD_RESP"},
> +	{6, "GDC_MISS_MACHINE_WR_RESP"},
> +	{7, "GDC_MISS_MACHINE_SNP_STASH_DATAPULL_DROP"},
> +	{8, "GDC_MISS_MACHINE_SNP_STASH_DATAPULL_DROP_TXDAT"},
> +	{9, "GDC_MISS_MACHINE_CHI_TXREQ"},
> +	{10, "GDC_MISS_MACHINE_CHI_RXRSP"},
> +	{11, "GDC_MISS_MACHINE_CHI_TXDAT"},
> +	{12, "GDC_MISS_MACHINE_CHI_RXDAT"},
> +	{13, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_0"},
> +	{14, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_1 "},
> +	{15, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_2"},
> +	{16, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_3 "},
> +	{17, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_0 "},
> +	{18, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_1 "},
> +	{19, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_2 "},
> +	{20, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_3 "},
> +	{21, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_0"},
> +	{22, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_1"},
> +	{23, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_2"},
> +	{24, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_3"},
> +	{25, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_0 "},
> +	{26, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_1"},
> +	{27, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_2"},
> +	{28, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_3"},
> +	{29, "GDC_MISS_MACHINE_GDC_LINK_LIST_FF_0"},
> +	{30, "GDC_MISS_MACHINE_GDC_LINK_LIST_FF_1"},
> +	{31, "GDC_MISS_MACHINE_GDC_LINK_LIST_FF_2"},
> +	{32, "GDC_MISS_MACHINE_GDC_LINK_LIST_FF_3"},
> +	{33, "GDC_MISS_MACHINE_GDC_LINK_LIST_FF_4"},
> +	{34, "GDC_MISS_MACHINE_GDC_LINK_LIST_FF_5"},
> +	{35, "GDC_MISS_MACHINE_GDC_LINK_LIST_FF_6"},
> +	{36, "GDC_MISS_MACHINE_G_RSE_PIPE_TXREQ_0"},
> +	{37, "GDC_MISS_MACHINE_G_RSE_PIPE_TXREQ_1"},
> +	{38, "GDC_MISS_MACHINE_G_CREDIT_TXREQ_0"},
> +	{39, "GDC_MISS_MACHINE_G_CREDIT_TXREQ_1"},
> +	{40, "GDC_MISS_MACHINE_G_RSE_PIPE_TXDAT_0"},
> +	{41, "GDC_MISS_MACHINE_G_RSE_PIPE_TXDAT_1"},
> +	{42, "GDC_MISS_MACHINE_G_CREDIT_TXDAT_0"},
> +	{43, "GDC_MISS_MACHINE_G_CREDIT_TXDAT_1"},
> +	{44, "GDC_MISS_MACHINE_G_FIFO_FF_COMPACK_0"},
> +	{45, "GDC_MISS_MACHINE_G_FIFO_FF_COMPACK_1"},
> +	{46, "GDC_MISS_MACHINE_G_FIFO_FF_COMPACK_2"},
> +	{47, "GDC_MISS_MACHINE_G_FIFO_FF_COMPACK_3"},
> +	{48, "GDC_MISS_MACHINE_G_RSE_PIPE_TXRSP_0"},
> +	{49, "GDC_MISS_MACHINE_G_RSE_PIPE_TXRSP_1"},
> +	{50, "GDC_MISS_MACHINE_G_CREDIT_TXRSP_0"},
> +	{51, "GDC_MISS_MACHINE_G_CREDIT_TXRSP_1"},
> +	{52, "GDC_MISS_MACHINE_G_RSE_PIPE_INARB_0"},
> +	{53, "GDC_MISS_MACHINE_G_RSE_PIPE_INARB_1"},
> +	{54, "GDC_MISS_MACHINE_G_FIFO_FF_SNOOP_IN_0"},
> +	{55, "GDC_MISS_MACHINE_G_FIFO_FF_SNOOP_IN_1"},
> +	{56, "GDC_MISS_MACHINE_G_FIFO_FF_SNOOP_IN_2"},
> +	{57, "GDC_MISS_MACHINE_G_FIFO_FF_SNOOP_IN_3"},
> +	{58, "GDC_MISS_MACHINE_G_FIFO_FF_TXRSP_SNOOP_DATAPULL_0"},
> +	{59, "GDC_MISS_MACHINE_G_FIFO_FF_TXRSP_SNOOP_DATAPULL_1"},
> +	{60, "GDC_MISS_MACHINE_G_FIFO_FF_TXRSP_SNOOP_DATAPULL_2"},
> +	{61, "GDC_MISS_MACHINE_G_FIFO_FF_TXRSP_SNOOP_DATAPULL_3"},
> +	{62, "GDC_MISS_MACHINE_G_FIFO_FF_TXDAT_SNOOP_DATAPULL_4"},
> +	{63, "GDC_MISS_MACHINE_G_FIFO_FF_TXDAT_SNOOP_DATAPULL_5"},
> +	{64, "GDC_MISS_MACHINE_G_FIFO_FF_TXDAT_SNOOP_DATAPULL_6"},
> +	{65, "GDC_MISS_MACHINE_G_FIFO_FF_TXDAT_SNOOP_DATAPULL_7"},
> +	{66, "HISTOGRAM_HISTOGRAM_BIN0"},
> +	{67, "HISTOGRAM_HISTOGRAM_BIN1"},
> +	{68, "HISTOGRAM_HISTOGRAM_BIN2"},
> +	{69, "HISTOGRAM_HISTOGRAM_BIN3"},
> +	{70, "HISTOGRAM_HISTOGRAM_BIN4"},
> +	{71, "HISTOGRAM_HISTOGRAM_BIN5"},
> +	{72, "HISTOGRAM_HISTOGRAM_BIN6"},
> +	{73, "HISTOGRAM_HISTOGRAM_BIN7"},
> +	{74, "HISTOGRAM_HISTOGRAM_BIN8"},
> +	{75, "HISTOGRAM_HISTOGRAM_BIN9"},
> +};
> +
>  static struct mlxbf_pmc_context *pmc;
>  
>  /* UUID used to probe ATF service. */
> @@ -569,8 +999,21 @@ static const struct mlxbf_pmc_events *mlxbf_pmc_event_list(const char *blk,
>  			break;
>  		}
>  	} else if (strstr(blk, "mss")) {
> -		events = mlxbf_pmc_mss_events;
> -		*size = ARRAY_SIZE(mlxbf_pmc_mss_events);
> +		switch (pmc->event_set) {
> +		case MLXBF_PMC_EVENT_SET_BF1:
> +		case MLXBF_PMC_EVENT_SET_BF2:
> +			events = mlxbf_pmc_mss_events_1;
> +			*size = ARRAY_SIZE(mlxbf_pmc_mss_events_1);
> +			break;
> +		case MLXBF_PMC_EVENT_SET_BF3:
> +			events = mlxbf_pmc_mss_events_3;
> +			*size = ARRAY_SIZE(mlxbf_pmc_mss_events_3);
> +			break;
> +		default:
> +			events = NULL;
> +			*size = 0;
> +			break;
> +		}
>  	} else if (strstr(blk, "ecc")) {
>  		events = mlxbf_pmc_ecc_events;
>  		*size = ARRAY_SIZE(mlxbf_pmc_ecc_events);
> @@ -586,6 +1029,12 @@ static const struct mlxbf_pmc_events *mlxbf_pmc_event_list(const char *blk,
>  	} else if (strstr(blk, "smmu")) {
>  		events = mlxbf_pmc_smgen_events;
>  		*size = ARRAY_SIZE(mlxbf_pmc_smgen_events);
> +	} else if (strstr(blk, "llt_miss")) {
> +		events = mlxbf_pmc_llt_miss_events;
> +		*size = ARRAY_SIZE(mlxbf_pmc_llt_miss_events);
> +	} else if (strstr(blk, "llt")) {
> +		events = mlxbf_pmc_llt_events;
> +		*size = ARRAY_SIZE(mlxbf_pmc_llt_events);
>  	} else {
>  		events = NULL;
>  		*size = 0;
> @@ -712,6 +1161,43 @@ static int mlxbf_pmc_program_l3_counter(int blk_num, uint32_t cnt_num,
>  	return mlxbf_pmc_write(pmcaddr, MLXBF_PMC_WRITE_REG_32, *wordaddr);
>  }
>  
> +/* Method to handle crspace counter programming */
> +static int mlxbf_pmc_program_crspace_counter(int blk_num, uint32_t cnt_num,
> +					     uint32_t evt)
> +{
> +	uint32_t word;
> +	void *addr;
> +	int ret;
> +
> +	addr = pmc->block[blk_num].mmio_base +
> +		(rounddown(cnt_num, 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
> +	ret = mlxbf_pmc_readl(addr, &word);
> +	if (ret)
> +		return ret;
> +
> +	if (cnt_num % 2) {
> +		word &= ~MLXBF_PMC_CRSPACE_PERFSEL1;
> +		word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFSEL1, evt);
> +	} else {
> +		word &= ~MLXBF_PMC_CRSPACE_PERFSEL0;
> +		word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFSEL0, evt);
> +	}
> +
> +	return mlxbf_pmc_write(addr, MLXBF_PMC_WRITE_REG_32, word);
> +}
> +
> +/* Method to clear crspace counter value */
> +static int mlxbf_pmc_clear_crspace_counter(int blk_num, uint32_t cnt_num)
> +{
> +	void *addr;
> +
> +	addr = pmc->block[blk_num].mmio_base +
> +		MLXBF_PMC_CRSPACE_PERFMON_VAL0(pmc->block[blk_num].counters) +
> +		(cnt_num * 4);
> +
> +	return mlxbf_pmc_write(addr, MLXBF_PMC_WRITE_REG_32, 0x0);
> +}
> +
>  /* Method to program a counter to monitor an event */
>  static int mlxbf_pmc_program_counter(int blk_num, uint32_t cnt_num,
>  				     uint32_t evt, bool is_l3)
> @@ -724,6 +1210,10 @@ static int mlxbf_pmc_program_counter(int blk_num, uint32_t cnt_num,
>  	if (is_l3)
>  		return mlxbf_pmc_program_l3_counter(blk_num, cnt_num, evt);
>  
> +	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE)
> +		return mlxbf_pmc_program_crspace_counter(blk_num, cnt_num,
> +							 evt);
> +
>  	/* Configure the counter */
>  	perfctl = FIELD_PREP(MLXBF_PMC_PERFCTL_EN0, 1);
>  	perfctl |= FIELD_PREP(MLXBF_PMC_PERFCTL_EB0, 0);
> @@ -778,7 +1268,7 @@ static int mlxbf_pmc_read_l3_counter(int blk_num, uint32_t cnt_num,
>  {
>  	uint32_t perfcnt_low = 0, perfcnt_high = 0;
>  	uint64_t value;
> -	int status = 0;
> +	int status;
>  
>  	status = mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
>  					 MLXBF_PMC_L3C_PERF_CNT_LOW +
> @@ -804,6 +1294,24 @@ static int mlxbf_pmc_read_l3_counter(int blk_num, uint32_t cnt_num,
>  	return 0;
>  }
>  
> +/* Method to handle crspace counter reads */
> +static int mlxbf_pmc_read_crspace_counter(int blk_num, uint32_t cnt_num,
> +					  uint64_t *result)
> +{
> +	uint32_t value;
> +	int status = 0;
> +
> +	status = mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> +		MLXBF_PMC_CRSPACE_PERFMON_VAL0(pmc->block[blk_num].counters) +
> +		(cnt_num * 4), &value);
> +	if (status)
> +		return status;
> +
> +	*result = value;
> +
> +	return 0;
> +}
> +
>  /* Method to read the counter value */
>  static int mlxbf_pmc_read_counter(int blk_num, uint32_t cnt_num, bool is_l3,
>  				  uint64_t *result)
> @@ -818,6 +1326,9 @@ static int mlxbf_pmc_read_counter(int blk_num, uint32_t cnt_num, bool is_l3,
>  	if (is_l3)
>  		return mlxbf_pmc_read_l3_counter(blk_num, cnt_num, result);
>  
> +	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE)
> +		return mlxbf_pmc_read_crspace_counter(blk_num, cnt_num, result);
> +
>  	perfcfg_offset = cnt_num * MLXBF_PMC_REG_SIZE;
>  	perfval_offset = perfcfg_offset +
>  			 pmc->block[blk_num].counters * MLXBF_PMC_REG_SIZE;
> @@ -893,6 +1404,30 @@ static int mlxbf_pmc_read_l3_event(int blk_num, uint32_t cnt_num,
>  	return 0;
>  }
>  
> +/* Method to read crspace block event */
> +static int mlxbf_pmc_read_crspace_event(int blk_num, uint32_t cnt_num,
> +					uint64_t *result)
> +{
> +	uint32_t word, evt;
> +	void *addr;
> +	int ret;
> +
> +	addr = pmc->block[blk_num].mmio_base +
> +		(rounddown(cnt_num, 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
> +	ret = mlxbf_pmc_readl(addr, &word);
> +	if (ret)
> +		return ret;
> +
> +	if (cnt_num % 2)
> +		evt = FIELD_GET(MLXBF_PMC_CRSPACE_PERFSEL1, word);
> +	else
> +		evt = FIELD_GET(MLXBF_PMC_CRSPACE_PERFSEL0, word);
> +
> +	*result = evt;
> +
> +	return 0;
> +}
> +
>  /* Method to find the event currently being monitored by a counter */
>  static int mlxbf_pmc_read_event(int blk_num, uint32_t cnt_num, bool is_l3,
>  				uint64_t *result)
> @@ -906,6 +1441,9 @@ static int mlxbf_pmc_read_event(int blk_num, uint32_t cnt_num, bool is_l3,
>  	if (is_l3)
>  		return mlxbf_pmc_read_l3_event(blk_num, cnt_num, result);
>  
> +	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE)
> +		return mlxbf_pmc_read_crspace_event(blk_num, cnt_num, result);
> +
>  	perfcfg_offset = cnt_num * MLXBF_PMC_REG_SIZE;
>  	perfval_offset = perfcfg_offset +
>  			 pmc->block[blk_num].counters * MLXBF_PMC_REG_SIZE;
> @@ -982,7 +1520,8 @@ static ssize_t mlxbf_pmc_counter_show(struct device *dev,
>  	if (strstr(pmc->block_name[blk_num], "l3cache"))
>  		is_l3 = true;
>  
> -	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_COUNTER) {
> +	if ((pmc->block[blk_num].type == MLXBF_PMC_TYPE_COUNTER) ||
> +	    (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE)) {
>  		if (mlxbf_pmc_read_counter(blk_num, cnt_num, is_l3, &value))
>  			return -EINVAL;
>  	} else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_REGISTER) {
> @@ -1040,6 +1579,10 @@ static ssize_t mlxbf_pmc_counter_store(struct device *dev,
>  		err = mlxbf_pmc_write_reg(blk_num, offset, data);
>  		if (err)
>  			return err;
> +	} else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE) {
> +		if (sscanf(attr->attr.name, "counter%d", &cnt_num) != 1)
> +			return -EINVAL;
> +		err = mlxbf_pmc_clear_crspace_counter(blk_num, cnt_num);
>  	} else
>  		return -EINVAL;
>  
> @@ -1137,28 +1680,37 @@ static ssize_t mlxbf_pmc_event_list_show(struct device *dev,
>  	return ret;
>  }
>  
> -/* Show function for "enable" sysfs files - only for l3cache */
> +/* Show function for "enable" sysfs files - only for l3cache & crspace */
>  static ssize_t mlxbf_pmc_enable_show(struct device *dev,
>  				     struct device_attribute *attr, char *buf)
>  {
>  	struct mlxbf_pmc_attribute *attr_enable = container_of(
>  		attr, struct mlxbf_pmc_attribute, dev_attr);
> -	uint32_t perfcnt_cfg;
> +	uint32_t perfcnt_cfg, word;
>  	int blk_num, value;
>  
>  	blk_num = attr_enable->nr;
>  
> -	if (mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> -				    MLXBF_PMC_L3C_PERF_CNT_CFG,
> -			    &perfcnt_cfg))
> -		return -EINVAL;
> +	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE) {
> +		if (mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> +				MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
> +				&word))
> +			return -EINVAL;
>  
> -	value = FIELD_GET(MLXBF_PMC_L3C_PERF_CNT_CFG_EN, perfcnt_cfg);
> +		value = FIELD_GET(MLXBF_PMC_CRSPACE_PERFMON_EN, word);
> +	} else {
> +		if (mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> +					    MLXBF_PMC_L3C_PERF_CNT_CFG,
> +				    &perfcnt_cfg))
> +			return -EINVAL;
> +
> +		value = FIELD_GET(MLXBF_PMC_L3C_PERF_CNT_CFG_EN, perfcnt_cfg);
> +	}
>  
>  	return sysfs_emit(buf, "%d\n", value);
>  }
>  
> -/* Store function for "enable" sysfs files - only for l3cache */
> +/* Store function for "enable" sysfs files - only for l3cache & crspace */
>  static ssize_t mlxbf_pmc_enable_store(struct device *dev,
>  				      struct device_attribute *attr,
>  				      const char *buf, size_t count)
> @@ -1166,6 +1718,7 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
>  	struct mlxbf_pmc_attribute *attr_enable = container_of(
>  		attr, struct mlxbf_pmc_attribute, dev_attr);
>  	int err, en, blk_num;
> +	uint32_t word;
>  
>  	blk_num = attr_enable->nr;
>  
> @@ -1173,19 +1726,35 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
>  	if (err < 0)
>  		return err;
>  
> -	if (!en) {
> -		err = mlxbf_pmc_config_l3_counters(blk_num, false, false);
> +	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE) {
> +		err = mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
> +			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
> +			&word);
>  		if (err)
> -			return err;
> -	} else if (en == 1) {
> -		err = mlxbf_pmc_config_l3_counters(blk_num, false, true);
> -		if (err)
> -			return err;
> -		err = mlxbf_pmc_config_l3_counters(blk_num, true, false);
> +			return -EINVAL;
> +
> +		word &= ~MLXBF_PMC_CRSPACE_PERFMON_EN;
> +		word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFMON_EN, en);
> +		if (en)
> +			word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFMON_CLR, 1);
> +
> +		mlxbf_pmc_write(pmc->block[blk_num].mmio_base +
> +			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
> +			MLXBF_PMC_WRITE_REG_32, word);
> +	} else {
> +		if (en && en != 1)
> +			return -EINVAL;
> +
> +		err = mlxbf_pmc_config_l3_counters(blk_num, false, !!en);
>  		if (err)
>  			return err;
> -	} else
> -		return -EINVAL;
> +
> +		if (en == 1) {
> +			err = mlxbf_pmc_config_l3_counters(blk_num, true, false);
> +			if (err)
> +				return err;
> +		}
> +	}
>  
>  	return count;
>  }
> @@ -1206,7 +1775,8 @@ static int mlxbf_pmc_init_perftype_counter(struct device *dev, int blk_num)
>  	attr = NULL;
>  
>  	/* "enable" sysfs to start/stop the counters. Only in L3C blocks */
> -	if (strstr(pmc->block_name[blk_num], "l3cache")) {
> +	if (strstr(pmc->block_name[blk_num], "l3cache") ||
> +	    ((pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE))) {
>  		attr = &pmc->block[blk_num].attr_enable;
>  		attr->dev_attr.attr.mode = 0644;
>  		attr->dev_attr.show = mlxbf_pmc_enable_show;
> @@ -1297,7 +1867,8 @@ static int mlxbf_pmc_create_groups(struct device *dev, int blk_num)
>  	int err;
>  
>  	/* Populate attributes based on counter type */
> -	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_COUNTER)
> +	if ((pmc->block[blk_num].type == MLXBF_PMC_TYPE_COUNTER) ||
> +	    (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE))
>  		err = mlxbf_pmc_init_perftype_counter(dev, blk_num);
>  	else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_REGISTER)
>  		err = mlxbf_pmc_init_perftype_reg(dev, blk_num);
> @@ -1311,7 +1882,8 @@ static int mlxbf_pmc_create_groups(struct device *dev, int blk_num)
>  	pmc->block[blk_num].block_attr_grp.attrs = pmc->block[blk_num].block_attr;
>  	pmc->block[blk_num].block_attr_grp.name = devm_kasprintf(
>  		dev, GFP_KERNEL, pmc->block_name[blk_num]);
> -	pmc->groups[blk_num] = &pmc->block[blk_num].block_attr_grp;
> +	pmc->groups[pmc->group_num] = &pmc->block[blk_num].block_attr_grp;
> +	pmc->group_num++;
>  
>  	return 0;
>  }
> @@ -1334,13 +1906,52 @@ static int mlxbf_pmc_map_counters(struct device *dev)
>  	int i, tile_num, ret;
>  
>  	for (i = 0; i < pmc->total_blocks; ++i) {
> -		if (strstr(pmc->block_name[i], "tile")) {
> +		/* Create sysfs for tiles only if block number <  tile_count */
> +		if (strstr(pmc->block_name[i], "tilenet")) {
> +			if (sscanf(pmc->block_name[i], "tilenet%d", &tile_num) != 1)
> +				continue;
> +
> +			if (tile_num >= pmc->tile_count)
> +				continue;
> +		} else if (strstr(pmc->block_name[i], "tile")) {
>  			if (sscanf(pmc->block_name[i], "tile%d", &tile_num) != 1)
> -				return -EINVAL;
> +				continue;
>  
>  			if (tile_num >= pmc->tile_count)
>  				continue;
>  		}
> +
> +		/* Create sysfs only for enabled MSS blocks */
> +		if (strstr(pmc->block_name[i], "mss") &&
> +		    pmc->event_set == MLXBF_PMC_EVENT_SET_BF3) {
> +			int mss_num;
> +
> +			if (sscanf(pmc->block_name[i], "mss%d", &mss_num) != 1)
> +				continue;
> +
> +			if (!((pmc->mss_enable >> mss_num) & 0x1))
> +				continue;
> +		}
> +
> +		/* Create sysfs only for enabled LLT blocks */
> +		if (strstr(pmc->block_name[i], "llt_miss")) {
> +			int llt_num;
> +
> +			if (sscanf(pmc->block_name[i], "llt_miss%d", &llt_num) != 1)
> +				continue;
> +
> +			if (!((pmc->llt_enable >> llt_num) & 0x1))
> +				continue;
> +		} else if (strstr(pmc->block_name[i], "llt")) {
> +			int llt_num;
> +
> +			if (sscanf(pmc->block_name[i], "llt%d", &llt_num) != 1)
> +				continue;
> +
> +			if (!((pmc->llt_enable >> llt_num) & 0x1))
> +				continue;
> +		}
> +
>  		ret = device_property_read_u64_array(dev, pmc->block_name[i],
>  						     info, MLXBF_PMC_INFO_SZ);
>  		if (ret)
> @@ -1417,6 +2028,8 @@ static int mlxbf_pmc_probe(struct platform_device *pdev)
>  		pmc->event_set = MLXBF_PMC_EVENT_SET_BF1;
>  	else if (!strcmp(hid, "MLNXBFD1"))
>  		pmc->event_set = MLXBF_PMC_EVENT_SET_BF2;
> +	else if (!strcmp(hid, "MLNXBFD2"))
> +		pmc->event_set = MLXBF_PMC_EVENT_SET_BF3;
>  	else
>  		return -ENODEV;
>  
> @@ -1430,11 +2043,19 @@ static int mlxbf_pmc_probe(struct platform_device *pdev)
>  	if (ret != pmc->total_blocks)
>  		return -EFAULT;
>  
> -	ret = device_property_read_u32(dev, "tile_num", &pmc->tile_count);
> -	if (ret)
> -		return ret;
> +	if (device_property_read_u32(dev, "tile_num", &pmc->tile_count)) {
> +		if (device_property_read_u8(dev, "llt_enable", &pmc->llt_enable)) {
> +			dev_err(dev, "Number of tiles/LLTs undefined\n");
> +			return -EINVAL;
> +		}
> +		if (device_property_read_u8(dev, "mss_enable", &pmc->mss_enable)) {
> +			dev_err(dev, "Number of tiles/MSSs undefined\n");
> +			return -EINVAL;
> +		}
> +	}
>  
>  	pmc->pdev = pdev;
> +	pmc->group_num = 0;
>  
>  	ret = mlxbf_pmc_map_counters(dev);
>  	if (ret)
> @@ -1449,6 +2070,7 @@ static int mlxbf_pmc_probe(struct platform_device *pdev)
>  
>  static const struct acpi_device_id mlxbf_pmc_acpi_ids[] = { { "MLNXBFD0", 0 },
>  							    { "MLNXBFD1", 0 },
> +							    { "MLNXBFD2", 0 },
>  							    {}, };
>  
>  MODULE_DEVICE_TABLE(acpi, mlxbf_pmc_acpi_ids);


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D384BE5A6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 21 Feb 2022 19:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355377AbiBUKp0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 21 Feb 2022 05:45:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355414AbiBUKpB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Feb 2022 05:45:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 73C49527FB
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 02:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645437944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tEs3c0lwLFu5MFr8oPqlqgpJ1951J6bY0iE9T4+v1Lg=;
        b=hV70KaGjZUR0cm0r4/rSF23GQQl1M4ymqoeWPH59+u19QLEC3Bmo3TrYtXoDYLiepwlsTl
        Apu8W29524J6779KiVcVmFADMNRKz10Ys3ahEdB//u/Y9UwmuBZJ92PqvG/E2r9CdCFkWD
        9LKpNLbXm6gtziYzXrh1BND64/JOOjU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-gwu0DDL2PD6OBo9PW00o1A-1; Mon, 21 Feb 2022 05:05:42 -0500
X-MC-Unique: gwu0DDL2PD6OBo9PW00o1A-1
Received: by mail-ed1-f72.google.com with SMTP id r11-20020a508d8b000000b00410a4fa4768so9783761edh.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 02:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tEs3c0lwLFu5MFr8oPqlqgpJ1951J6bY0iE9T4+v1Lg=;
        b=LxcNI99BUo97YjpElmcRa5IRXgnxTfSAwhQa6zHK7fqcseoZHIuJZRLo/Cjd42AtAl
         0l+8yHggwWMRjEsdKJUODT3lhTaUGe61qtP/cu6gUkxM9W62zxbwqE2Sg6l84UIgb5J/
         JvbesItKga/JOOgWPMftL8uJZM3ZcNU9v1hL1n71J78ABUIOLX/dftQF/b910iGb1eyr
         T7UXDvqcOUX8pXzUHVya7vXChD5IUzlA916CRCcdeaAi/ZHWYUtuuRSNghG9CtSoRTxG
         2vQPKY6TC0rTRI3fPCEgFYzal3X2Ejl8WDVOxkHUMaO0eBw8l8nPdUiRiK8APtGkfgZj
         ez7Q==
X-Gm-Message-State: AOAM532hOvQnyNLGW7XoTJcSbpkJiZPIg1kX/3p5PiBWmRTjSwtRJqpo
        JCkFq50jnjzChWcHxvNpmxD96tAz/WoXOJhIfjGTsZSQFvwix3JpPjog1xbN8f2ZmDHr5/O0c7+
        QWvZnojkemTdApImuBRVVOB4tfLaPSe4JgA==
X-Received: by 2002:a50:9e2e:0:b0:410:d1b6:4d2e with SMTP id z43-20020a509e2e000000b00410d1b64d2emr20315136ede.201.1645437941699;
        Mon, 21 Feb 2022 02:05:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOVCVc23b9yOF+lrwf8TO4v3PegH4KxxSFCMMQ5Gb72ss+1TpWKLq+7F9UVnnV5KpMFPxcMg==
X-Received: by 2002:a50:9e2e:0:b0:410:d1b6:4d2e with SMTP id z43-20020a509e2e000000b00410d1b64d2emr20315116ede.201.1645437941501;
        Mon, 21 Feb 2022 02:05:41 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id dx7sm4271560ejb.23.2022.02.21.02.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 02:05:41 -0800 (PST)
Message-ID: <9aae2f06-1f3d-2dca-95c3-77f399e7b199@redhat.com>
Date:   Mon, 21 Feb 2022 11:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 6/6] platform/x86: int3472: Add board data for Surface Go2
 IR camera
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
        linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, markgross@kernel.org, robert.moore@intel.com
References: <20220216225304.53911-1-djrscally@gmail.com>
 <20220216225304.53911-7-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220216225304.53911-7-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/16/22 23:53, Daniel Scally wrote:
> Add the board data describing the regulators for the Microsoft
> Surface Go line's IR camera.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 442a8a2de224..49a3591c6d85 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -30,6 +30,15 @@ static struct regulator_consumer_supply int347a_vcm_consumer_supplies[] = {
>  static struct regulator_consumer_supply int347a_vsio_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT347A:00"),
>  	REGULATOR_SUPPLY("vsio", "i2c-INT347A:00-VCM"),
> +	REGULATOR_SUPPLY("vddd", "i2c-INT347E:00"),
> +};
> +
> +static struct regulator_consumer_supply int347a_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdda", "i2c-INT347E:00"),
> +};
> +
> +static struct regulator_consumer_supply int347a_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdddo", "i2c-INT347E:00"),
>  };
>  
>  static const struct regulator_init_data surface_go_tps68470_core_reg_init_data = {
> @@ -86,6 +95,28 @@ static const struct regulator_init_data surface_go_tps68470_vsio_reg_init_data =
>  	.consumer_supplies = int347a_vsio_consumer_supplies,
>  };
>  
> +static const struct regulator_init_data surface_go_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int347a_aux1_consumer_supplies),
> +	.consumer_supplies = int347a_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data surface_go_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int347a_aux2_consumer_supplies),
> +	.consumer_supplies = int347a_aux2_consumer_supplies,
> +};
> +
>  static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata = {
>  	.reg_init_data = {
>  		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
> @@ -93,6 +124,8 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
>  		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
>  		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
>  		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] = &surface_go_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] = &surface_go_tps68470_aux2_reg_init_data,
>  	},
>  };
>  


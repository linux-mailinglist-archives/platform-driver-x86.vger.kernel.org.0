Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E5D723DC4
	for <lists+platform-driver-x86@lfdr.de>; Tue,  6 Jun 2023 11:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236967AbjFFJgM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 6 Jun 2023 05:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237013AbjFFJfu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2023 05:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F3610E0
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jun 2023 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686044104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=czvn6qht8d+SNDHj1nJ3XRHNi7ght7JwKJF60fFVSnQ=;
        b=ePGykvI8WNqKIoCEtZ+jscay0aAh22YkWHg77Z0jWF3jdSu4k330fsasUqUSX9gnacfAQS
        tkOZGTrgt0bLljaIG3HX48NYUFQjkh3osNzjR7XOts4e6AvQpUxH4FXlBraAO7X+hD804P
        xbZh2riW18G/UiO/K9ZUqG+ZVl0+jd8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-zeAGNC74Mem1sRlhCzLOpQ-1; Tue, 06 Jun 2023 05:35:03 -0400
X-MC-Unique: zeAGNC74Mem1sRlhCzLOpQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-977eabfc3ccso185445966b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2023 02:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044102; x=1688636102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czvn6qht8d+SNDHj1nJ3XRHNi7ght7JwKJF60fFVSnQ=;
        b=NBFk22060rWBHimNwNPZx52AXaubMFvpT2jP1xfnRaLuDQudQtVui3cLV1L/d0tEX5
         U5Zc1ZCeYkzq+FO+hZ04nh5vtsmJzfRFDBEr3IJk76mbK6ESzXlsyzjQdwltT0yZfQxn
         kgnlZCMDFTjUW7wh5PGT7sfYCiA5Z0vRtsW8BwHJLgIrYSKyDFLMFQWMGwbzAh6LKRuF
         yd+/HTgrbWvI++cjjLgl+slqQ8Cg1u6UFTjTBU2dhQEIgYJJkGL2VHtV/a3bQZ0UJoFw
         YrgA3dJ/5jRQs3eyYTjfecTdV0ouaJh19gEgfDeoyCPCLuNuNsizJGkmaipM4Rd9QXup
         ++dg==
X-Gm-Message-State: AC+VfDxtsfNsrHFT/Jv1eyN0nbC26OZ81AshopSCHo+nXn4nIjbYkqJT
        lu8LsLJ3WbDuPMGihiILqa9GZ9NTFSHp9Wl8jhVfjJjiuBzRtPpY9aXuaXcxGM3o+deumaohHGN
        dqYB34C/dukCdpRb0k7ICvECfY+dbisOLYA==
X-Received: by 2002:a17:907:1c20:b0:978:666e:3bf with SMTP id nc32-20020a1709071c2000b00978666e03bfmr1605025ejc.35.1686044102091;
        Tue, 06 Jun 2023 02:35:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7J4hvKU8/d0J1npKRJdWpuES6Liy1rBeTtGAT64PROYlQ5vM7eDeKW2x/5F31w4GheAKb/Hw==
X-Received: by 2002:a17:907:1c20:b0:978:666e:3bf with SMTP id nc32-20020a1709071c2000b00978666e03bfmr1605009ejc.35.1686044101731;
        Tue, 06 Jun 2023 02:35:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c8-20020a170906924800b00977cc473b41sm3422739ejx.142.2023.06.06.02.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:35:01 -0700 (PDT)
Message-ID: <9698d2f0-9c9a-95c0-7659-d699b631afe4@redhat.com>
Date:   Tue, 6 Jun 2023 11:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Add thermal profile for Victus
 16-d1xxx
Content-Language: en-US, nl
To:     SungHwan Jung <onenowy@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230604173023.4675-1-onenowy@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230604173023.4675-1-onenowy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/4/23 19:30, SungHwan Jung wrote:
> This patch includes Platform Profile support (performance, balanced, quiet)
> for Victus 16-d1xxx (8A25).
> 
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>

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




> 
> ---
> changes in v2 : clean up code
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 96 +++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 6364ae262..04c05c6b0 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -66,6 +66,11 @@ static const char *const omen_thermal_profile_force_v0_boards[] = {
>  	"8607", "8746", "8747", "8749", "874A", "8748"
>  };
>  
> +/* DMI Board names of Victus laptops */
> +static const char * const victus_thermal_profile_boards[] = {
> +	"8A25"
> +};
> +
>  enum hp_wmi_radio {
>  	HPWMI_WIFI	= 0x0,
>  	HPWMI_BLUETOOTH	= 0x1,
> @@ -176,6 +181,12 @@ enum hp_thermal_profile_omen_v1 {
>  	HP_OMEN_V1_THERMAL_PROFILE_COOL		= 0x50,
>  };
>  
> +enum hp_thermal_profile_victus {
> +	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
> +	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> +	HP_VICTUS_THERMAL_PROFILE_QUIET			= 0x03,
> +};
> +
>  enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
>  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> @@ -1246,6 +1257,70 @@ static int hp_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> +static bool is_victus_thermal_profile(void)
> +{
> +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(victus_thermal_profile_boards,
> +			    ARRAY_SIZE(victus_thermal_profile_boards),
> +			    board_name) >= 0;
> +}
> +
> +static int platform_profile_victus_get(struct platform_profile_handler *pprof,
> +				     enum platform_profile_option *profile)
> +{
> +	int tp;
> +
> +	tp = omen_thermal_profile_get();
> +	if (tp < 0)
> +		return tp;
> +
> +	switch (tp) {
> +	case HP_VICTUS_THERMAL_PROFILE_PERFORMANCE:
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case HP_VICTUS_THERMAL_PROFILE_DEFAULT:
> +		*profile = PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case HP_VICTUS_THERMAL_PROFILE_QUIET:
> +		*profile = PLATFORM_PROFILE_QUIET;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int platform_profile_victus_set(struct platform_profile_handler *pprof,
> +				     enum platform_profile_option profile)
> +{
> +	int err, tp;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		tp = HP_VICTUS_THERMAL_PROFILE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		tp = HP_VICTUS_THERMAL_PROFILE_DEFAULT;
> +		break;
> +	case PLATFORM_PROFILE_QUIET:
> +		tp = HP_VICTUS_THERMAL_PROFILE_QUIET;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	err = omen_thermal_profile_set(tp);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
>  static int thermal_profile_setup(void)
>  {
>  	int err, tp;
> @@ -1266,6 +1341,25 @@ static int thermal_profile_setup(void)
>  
>  		platform_profile_handler.profile_get = platform_profile_omen_get;
>  		platform_profile_handler.profile_set = platform_profile_omen_set;
> +
> +		set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> +	} else if (is_victus_thermal_profile()) {
> +		tp = omen_thermal_profile_get();
> +		if (tp < 0)
> +			return tp;
> +
> +		/*
> +		 * call thermal profile write command to ensure that the
> +		 * firmware correctly sets the OEM variables
> +		 */
> +		err = omen_thermal_profile_set(tp);
> +		if (err < 0)
> +			return err;
> +
> +		platform_profile_handler.profile_get = platform_profile_victus_get;
> +		platform_profile_handler.profile_set = platform_profile_victus_set;
> +
> +		set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);
>  	} else {
>  		tp = thermal_profile_get();
>  
> @@ -1284,9 +1378,9 @@ static int thermal_profile_setup(void)
>  		platform_profile_handler.profile_set = hp_wmi_platform_profile_set;
>  
>  		set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);
> +		set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
>  	}
>  
> -	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
>  	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE, platform_profile_handler.choices);
>  


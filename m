Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCB76C5248
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Mar 2023 18:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbjCVRU1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Mar 2023 13:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjCVRUM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 13:20:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBEA66D22
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SMw6l8Y9d7rVMNxAIN1dm8nnft0HynDsRdE/l7NPZnA=;
        b=NGb0wVbxObCCdDojt/XjaL3Fc4WrwmzSQJoKLtPYwDKhbmtSGpihA8idiVchHr0bRM+iVw
        CcMb8l6CU/22vFwRc0kc+GeWxorGhdexIzpFz5kJdIJuPSy9kpjQ9JbmyBU2VNyxl7cIVH
        0RhPGf45a6SYIwVXzOj6LS+pV+uYksU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-5AhB2z5iMhes0ZI7V5aLKw-1; Wed, 22 Mar 2023 13:17:49 -0400
X-MC-Unique: 5AhB2z5iMhes0ZI7V5aLKw-1
Received: by mail-ed1-f70.google.com with SMTP id m18-20020a50d7d2000000b00501dfd867a4so8241125edj.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMw6l8Y9d7rVMNxAIN1dm8nnft0HynDsRdE/l7NPZnA=;
        b=MAjqXl4nYorJ12syxSIg7QFohPaftfnfSe12+woOrl4zr6H7QGoqtl90/ZX61CzeQY
         uFxRoJDQwRO/QXg5Dzb5kPi3cl4Ib/yjRRZFtAm8tKZabcv3rXUn6bHk7837aJYM5EbJ
         OnxSGgdplrEpW9zbjI62QkC8CeDmgrpVvq9azL862ncxEYYkL3RF7lFdRhnlAUzq4TCQ
         HmOLg8TaRA+nPhVXde0jlia4/hflK0Pne7UvA2zGIrh2+YtqxY5jzpSOk/+9p7cH81Gk
         gFyDQGIL3CdE4dPZ56tqeSNE8/cFtAuRliALmJ41QHOlM1Dmynx/3l3+/ccqjnsTh9kA
         +R+Q==
X-Gm-Message-State: AO0yUKUDqNwFZLpM+sChWWEdxJ24+d/Mh96XhwYoO5RkTxWPS3rfAIt6
        xn0ijjQ0cr+SaBTxphRiJf9L55GgwoHJZ3n0yrGB9Ayp4joGLSBKVbJ1CGsXAXUw3E6y9TlHGOh
        GcZ4jUO7rJBkM75vn72URdzrHzIuAcoeqwA==
X-Received: by 2002:a17:907:b0f:b0:930:e634:3d52 with SMTP id h15-20020a1709070b0f00b00930e6343d52mr7409596ejl.24.1679505468063;
        Wed, 22 Mar 2023 10:17:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set9UJ6fHpinSGLpYrikCXWXvZDMjiRa9RPd1G6Qo46KRj7UYH+C2D6wg7oTRZoSmf9+lH5lfwQ==
X-Received: by 2002:a17:907:b0f:b0:930:e634:3d52 with SMTP id h15-20020a1709070b0f00b00930e6343d52mr7409568ejl.24.1679505467765;
        Wed, 22 Mar 2023 10:17:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o7-20020a1709062e8700b00933356c681esm5967710eji.150.2023.03.22.10.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:17:47 -0700 (PDT)
Message-ID: <ac33109b-4dd2-02ed-8315-6d80c9e93dc1@redhat.com>
Date:   Wed, 22 Mar 2023 18:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] platform/x86: int3472: Add TPS68470 LED Board Data
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-4-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-4-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/22/23 17:09, Daniel Scally wrote:
> Add the board data for the Surface Go platforms to configure the LEDs
> provided by the TPS68470 PMIC.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

As mentioned in the review of 1/8 please squash the 
drivers/platorm/x86/intel/int3472/ of 1/8 into this, with
that fixed this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  ...ctps68470_board_data.c         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 322237e056f3..0d46a238b630 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -146,9 +146,21 @@ static struct gpiod_lookup_table surface_go_int347e_gpios = {
>  	}
>  };
>  
> +static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
> +	.iledctl_ctrlb = 0x30,
> +	.wledmaxf = 0x1f,
> +	.wledto = 0x07,
> +	.wledc1 = 0x1f,
> +	.wledc2 = 0x1f,
> +	.wledctl_mode = 0x00,
> +	.wledctl_disled1 = true,
> +	.wledctl_disled2 = false,
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> +	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
>  	.n_gpiod_lookups = 2,
>  	.tps68470_gpio_lookup_tables = {
>  		&surface_go_int347a_gpios,
> @@ -159,6 +171,7 @@ static const struct int3472_tps68470_board_data surface_go_tps68470_board_data =
>  static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:01",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> +	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
>  	.n_gpiod_lookups = 2,
>  	.tps68470_gpio_lookup_tables = {
>  		&surface_go_int347a_gpios,


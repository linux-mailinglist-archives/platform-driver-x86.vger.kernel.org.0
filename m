Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744A16C5250
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Mar 2023 18:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjCVRVZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Mar 2023 13:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjCVRVV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 13:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EFD64B27
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZfrH3cNmdRz+kg65KNKYqXw3b322J99Rm/Jrfqmb5q4=;
        b=c1jzBhzqqLEDI2UG57xj7+aIvGQtRQqB81VztSfd414ktWNTp0onDYtZ3rAVJ5jIvmBaF5
        45tEPSrhQuMKfCc90QC44flHzWkRoeKIw+9+dmOpvOz0Zd9WDR0F0nKHn4TIJxA03ty+07
        dxQ7N9Md1qqdd6w0I3cB6HL7Hy9UYfU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-iuj2BSNhO0mLsoTNZP5iUg-1; Wed, 22 Mar 2023 13:19:51 -0400
X-MC-Unique: iuj2BSNhO0mLsoTNZP5iUg-1
Received: by mail-ed1-f70.google.com with SMTP id p36-20020a056402502400b004bb926a3d54so27891727eda.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfrH3cNmdRz+kg65KNKYqXw3b322J99Rm/Jrfqmb5q4=;
        b=44DmRKTfUbzevNOI8IgdEOENmmdjW039TCZ140wfvXonHCeX2ntqMq6PDXVXf3AUJl
         R5NUpt1N7T6+grkAV4N1d59rkQs5wGfNXtXlUyigXQgmBYT1hWioezCogc+3PmoK9nyE
         OTl4vA8dUnCSWDCGjvQ6DSNNvykKwhqngpCXqGESfFgTAdVRUPKjx/FAmSiOvhgBPM4F
         0MpRoA7U57TglLUOFuBHWektsx1WLnmCxjw/be7Ysz9anAbaziF6IANdwO+bnLKlFjbc
         +iLLxUGwn0KIahDJazs6ijXXvPBOlJuIdM74LRiRQZTaKX69i6oefxVprOsRwXV1og3X
         11Zg==
X-Gm-Message-State: AO0yUKUdMtbxiwF6KLelktDHxlo8OERsLiXWSIjRNyDJW+cUNT+yvA4V
        nsH6XmDQ42sd8arYlupVs5Xa6wlR7257hGzuHQcTnkyWYz4XKG+rorr9TGSad7+rCN+A3CrD4kR
        zboIGlH9pcjlElQLrxRjozVvgzkem7rxwQQ==
X-Received: by 2002:a17:906:7102:b0:8b1:806b:7dbb with SMTP id x2-20020a170906710200b008b1806b7dbbmr8030491ejj.51.1679505590247;
        Wed, 22 Mar 2023 10:19:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set9roFBaPaz/PzuSkkNGs01P2Z5DlAbHosKfcq2HEBjcjboJI19NhHqXk4vpRzjAendoTOabbg==
X-Received: by 2002:a17:906:7102:b0:8b1:806b:7dbb with SMTP id x2-20020a170906710200b008b1806b7dbbmr8030469ejj.51.1679505589936;
        Wed, 22 Mar 2023 10:19:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g3-20020a50d5c3000000b004fb17f10326sm8090663edj.10.2023.03.22.10.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:19:49 -0700 (PDT)
Message-ID: <2d7d8ed7-0511-b30e-71a8-35f1cc76397e@redhat.com>
Date:   Wed, 22 Mar 2023 18:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/8] platform/x86: int3472: Add tps68470-led as clock
 consumer
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-5-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-5-dan.scally@ideasonboard.com>
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
> Some of the LEDs provided by the TPS68470 require the clock that it
> provides to be active in order to function. Add the platform driver
> for the leds as a consumer of the clock so that the led driver can
> discover it during .probe()
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 53b0459f278a..818f2fc5bf2a 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -105,25 +105,30 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(dev);
>  	struct acpi_device *consumer;
> -	unsigned int n_consumers = 0;
> +	unsigned int n_consumers = 1;
>  	const char *sensor_name;
> -	unsigned int i = 0;
> +	const char *led_name;
> +	unsigned int i = 1;

Nitpick: please just don't init i here at all.

>  
>  	for_each_acpi_consumer_dev(adev, consumer)
>  		n_consumers++;
>  
> -	if (!n_consumers) {
> -		dev_err(dev, "INT3472 seems to have no dependents\n");
> -		return -ENODEV;
> -	}
> -
>  	*clk_pdata = devm_kzalloc(dev, struct_size(*clk_pdata, consumers, n_consumers),
>  				  GFP_KERNEL);
>  	if (!*clk_pdata)
>  		return -ENOMEM;
>  
>  	(*clk_pdata)->n_consumers = n_consumers;
> -	i = 0;
> +
> +	/*
> +	 * The TPS68470 includes an LED driver which requires the clock be active
> +	 * to function. Add the led platform device as a consumer of the clock.
> +	 */
> +	led_name = devm_kstrdup(dev, "tps68470-led", GFP_KERNEL);
> +	if (!led_name)
> +		return -ENOMEM;
> +
> +	(*clk_pdata)->consumers[0].consumer_dev_name = led_name;
>  

And add a:

	i = 1;

here, to make it clear that after setting consumers[0] we now
start adding more consumers at index 1.

>  	for_each_acpi_consumer_dev(adev, consumer) {
>  		sensor_name = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,

With that fixed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


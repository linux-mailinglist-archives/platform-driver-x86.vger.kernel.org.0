Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C1469F90F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Feb 2023 17:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjBVQej (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Feb 2023 11:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbjBVQei (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Feb 2023 11:34:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2212BF03
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Feb 2023 08:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677083631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nfRgrG7v9e35Qkpdm4A6k1IiUUsubAbiMqnM/ML5i5c=;
        b=dZRb2unR1uosfFaKF1dQJURWm1GKNoo2xfzslPqLsC4qLY613OvAYndC5Y8wNEIp/gu1St
        5BK5uPVm0ZdnQn+6el0rc4nl9oYEY1B4n0KUUapsO6EexQD/VxwATBQXz/SDb2oJX7OsDO
        VTY+g4TWxMexwrlKidbQvfFJ8uNYCxo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-BsPmAwTlMruk4HWTgJa-nw-1; Wed, 22 Feb 2023 11:33:48 -0500
X-MC-Unique: BsPmAwTlMruk4HWTgJa-nw-1
Received: by mail-ed1-f69.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso11401030edu.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Feb 2023 08:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfRgrG7v9e35Qkpdm4A6k1IiUUsubAbiMqnM/ML5i5c=;
        b=1N2r26aVKoQfXvttUi1DL64QBNNd2OTBoPHWHfcadzzZSMayJLYRIqu4ZWwfcOcOdm
         WesvJPJTO1NWSNuEgvdFFGnJbBx1yIjNJ0rR5TKbwB0sUdceZ1J7BdIbdn++U4oFrP2n
         aNyov3xDNwftcuTYbhxIjpIkUzAuW6dbMkwzV68yQ1NNuBL1ZLscqpLCFaA+gcHwKRRe
         itSjW4ngw2mdwzxFfs9+aOWa+3LglWf1YSfbSx1kzJlTk9jZfV+0TSVPbehomnvNy8PB
         BD3ILQsa8n4SmIo0BeDvFX/7tPQlm/UfcytLui7dt6aEazMSIXwJIX/EZWxG1isFy3l3
         mxmA==
X-Gm-Message-State: AO0yUKVTeiO2sSNN3IMoAjlh1q74BlPf1LqAHshxlhsqWlXSYdgwF9W3
        +DAWh95rxw7aDuA7x9voJ75LKa2rcyAGTfHUYI/+x6HU5dxJ3xtdGjSXCojxbMb8qbZ52kvI+Xs
        g21XsT9HGOdWbV3kN1Mj1XEP75oWbD/03Rg==
X-Received: by 2002:a17:906:3b10:b0:8b1:3f5b:af5f with SMTP id g16-20020a1709063b1000b008b13f5baf5fmr14635584ejf.73.1677083626755;
        Wed, 22 Feb 2023 08:33:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8ExtIugX2Bx7fHgbatGgHjSU0zHS/J5rKk8WvwYyPa8Q1xg6GKOjxlXBUTELIQdSmnCzpnAQ==
X-Received: by 2002:a17:906:3b10:b0:8b1:3f5b:af5f with SMTP id g16-20020a1709063b1000b008b13f5baf5fmr14635565ejf.73.1677083626517;
        Wed, 22 Feb 2023 08:33:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id md1-20020a170906ae8100b008b174ef3cdesm8121626ejb.27.2023.02.22.08.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:33:45 -0800 (PST)
Message-ID: <c3d8fecc-d442-e877-e170-b72b3ffc7e18@redhat.com>
Date:   Wed, 22 Feb 2023 17:33:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH 1/3] platform: x86: int3472: Add MFD cell for
 tps68470 LED
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230213124520.1635257-1-hpa@redhat.com>
 <20230213124520.1635257-2-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230213124520.1635257-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Kate,

On 2/13/23 13:45, Kate Hsuan wrote:
> Add MFD cell for tps68470-led.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 5b8d1a9620a5..9dceb6507a01 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -17,7 +17,7 @@
>  #define DESIGNED_FOR_CHROMEOS		1
>  #define DESIGNED_FOR_WINDOWS		2
>  
> -#define TPS68470_WIN_MFD_CELL_COUNT	3
> +#define TPS68470_WIN_MFD_CELL_COUNT	4
>  
>  static const struct mfd_cell tps68470_cros[] = {
>  	{ .name = "tps68470-gpio" },
> @@ -194,6 +194,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>  		cells[2].name = "tps68470-gpio";
> +		cells[3].name = "tps68470-led";

As the comment a few lines above states, the gpio cell must be last because the GPIO
driver ends up calling acpi_dev_clear_dependencies() which will cause the ACPI code
to instantiate the i2c_client-s for the camera sensors and we want all the cells
to be instantiated before this happens, so this needs to become:

		cells[2].name = "tps68470-led";
  		cells[3].name = "tps68470-gpio";

And for the sensor to actually be able to use the LEDA output as privacy LED,
we also need to add a led lookup-table entry linking the sensor and the LEDA
LED-class-device. I'll write a patch for this and submit that upstream soonish.

For v2 of this patch-set, please include my patch with the lookup as a 4th patch.

Regards,

Hans






>  
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);


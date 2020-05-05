Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B16B1C5595
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 14:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgEEMiJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 08:38:09 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42221 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728512AbgEEMiJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 08:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588682287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aED3R13Lt3zr53KvB4yGvOGNhjfliqqy0eoHUFbYMkA=;
        b=etaJhE/ATFjYTuqOHszOBgIss70j5YIPaJoMMxVhNb1tCx3Ut1Uw+HKoa8k+iPl7lqP3jR
        A94xKaVyjvUwHMJfihIGuuDZ2UVgijMoZRYsj7mGElg5boYiMjqRAn/iMbo92CJIMWDETX
        PUhqkx5B4tlRXwLSPTRHWkk5WduoI04=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-t3RdapbKPwGXqRXKnWmpjA-1; Tue, 05 May 2020 08:38:06 -0400
X-MC-Unique: t3RdapbKPwGXqRXKnWmpjA-1
Received: by mail-wr1-f72.google.com with SMTP id j16so1115162wrw.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 05:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aED3R13Lt3zr53KvB4yGvOGNhjfliqqy0eoHUFbYMkA=;
        b=TNGe9NrJ9b3vTgl8NZPvbvD4ZBTjvHMHPJ9gAxe/Lpf51Zlp46Gwdevk49H04d5kw0
         q0GLBq9BIplh3NZ6ecSNX5tvFsmLYGAXxOqw6oZkzgewNKet0z2hSinkRvtC4u6HhwAx
         n+FqVnUvfU3F4EyvfsU31qOrdDWdmhOawQn5WhaYuK3j1uD5kIijH4GKFNeVATRe4n92
         iqWYIE4LeJday6imwFzQhd3eglw/mneV+JVQkNP35jzoeULLVa3Kk2OFaa80snRVg4p4
         my3KapjNVtLX54hThQjOqO1R5zP61HBST1W+xPJHobVSogrNDb0djRK9qnIjjyhadc9L
         4GDw==
X-Gm-Message-State: AGi0Pua9fLK1bqRJfP64u0el0ct5OLJT1p3olSjJYXJGWcshAaHt7kVC
        iDc2WGvijxPajxGw2++aYMn9szxsZmC7F7qpo7eogbsDpn1RU4KiswqiZM6kkS8rWpAvtVJiYw9
        nK8BX/3iWcPne+EflNM0+YJoe+fE5+8jD9w==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr3305539wrt.233.1588682284564;
        Tue, 05 May 2020 05:38:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypKrLSXHxg9r63YDJ7/YBF0Ti8pACVpK7p6sjVRsukW3VodUmTI5i+l+YDmoh+Xe7Q8sh0z19Q==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr3305519wrt.233.1588682284386;
        Tue, 05 May 2020 05:38:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n6sm3202671wrs.81.2020.05.05.05.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 05:38:03 -0700 (PDT)
Subject: Re: [PATCH v3] platform/x86: touchscreen_dmi: add Vinga J116
 touchscreen
To:     Andrew Dunai <a@dun.ai>, dvhart@infradead.org
Cc:     andy@infradead.org, platform-driver-x86@vger.kernel.org
References: <20200505121518.271854-1-a@dun.ai>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <996f6657-c838-fe36-53fb-70558550844e@redhat.com>
Date:   Tue, 5 May 2020 14:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200505121518.271854-1-a@dun.ai>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/20 2:15 PM, Andrew Dunai wrote:
> Add support for Vinga Twizzle J116 Silead touchscreen which uses GSL1680 chip.
> 
> Signed-off-by: Andrew Dunai <a@dun.ai>

I missed that you already send a v3, this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>   drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 93177e6e5..a3ab19ab0 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -640,6 +640,20 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
>   	.properties	= trekstor_surftab_wintron70_props,
>   };
>   
> +static const struct property_entry vinga_twizzle_j116_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data vinga_twizzle_j116_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= vinga_twizzle_j116_props,
> +};
> +
>   /* NOTE: Please keep this table sorted alphabetically */
>   static const struct dmi_system_id touchscreen_dmi_table[] = {
>   	{
> @@ -1054,6 +1068,13 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
>   		},
>   	},
> +	{
> +		/* Vinga Twizzle J116 */
> +		.driver_data = (void *)&vinga_twizzle_j116_data,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
> +		},
> +	},
>   	{ },
>   };
>   
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5D81B2A2E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Apr 2020 16:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgDUOjv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Apr 2020 10:39:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36472 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728576AbgDUOjv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Apr 2020 10:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587479989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mIeIgVETQUtabUsbQmQBUDp1oocCxeC4wUp88qyAmTU=;
        b=LxSqmlh8BJDVDOB33em27MJhEsJkji4JHYO50OJyUEqmqPGmi/2a5l1JGVddm1lLA58d4p
        x50ZW8DEl90Fs/+mSo8GI5q1WSFksX8SItEE8RLYptRkin+skDd8ndrtOvV238OBZCXHMA
        UjZw031wqjQinvHZF2NFpkSSnee1tKQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-JlSPPXUcMlSONU__pdkjTA-1; Tue, 21 Apr 2020 10:39:48 -0400
X-MC-Unique: JlSPPXUcMlSONU__pdkjTA-1
Received: by mail-wr1-f72.google.com with SMTP id 11so7608835wrc.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2020 07:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mIeIgVETQUtabUsbQmQBUDp1oocCxeC4wUp88qyAmTU=;
        b=qy2Z7o7IvdvZi5zwEe7XRM7LDzTiGG+Fh/5CAdXnQsh83cMEUnaxH9q8jxmsoobe9W
         DtYH4vQhbMKR2Vh7hWXcobdfybWQ1TJUzWPFUPRaht+ff8543BoBqutyaWOhS+igrnM0
         UwrGn+0R6su3+iLbeqR0tOgGl01Je33KgHsHaNCg37N53fR/mF7bncOxCA4EMjKyamxU
         4euRIwkZYF66RUXfew2SmrQhYubXiZse9z1iVobhB5//g+fHEDHNP47RE/qYvUiVhywQ
         a/zEBhMdtJBBwZ3MG+VLS5sCqBaMjFkmSq3Sxy50x4gCYUd4KptFde7m3H9NbkAZbpZT
         o//g==
X-Gm-Message-State: AGi0PubqOJON9QSh3vHyFLR63qTiL477GZC4qv8VyTRrr6TE5hrMriw0
        8MuErNAVX6x/LFMmA3Yt3b5AT5H6FJMXy5YCLWPYhKi17aczFtBNdEWzgvxFlCThZ6iZWwpCW9t
        En7iGhw4wB4MbopLvCinnwKDLtkzwCTiITg==
X-Received: by 2002:adf:f748:: with SMTP id z8mr14968000wrp.45.1587479987003;
        Tue, 21 Apr 2020 07:39:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypLBztjA7ImwPA8RHFjQELFA6NHZfgYt0AQ2mH++7e/YlfD7p5s4xgwiWBeRTv/9/iUJWDsLug==
X-Received: by 2002:adf:f748:: with SMTP id z8mr14967978wrp.45.1587479986775;
        Tue, 21 Apr 2020 07:39:46 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id l5sm3597863wmi.22.2020.04.21.07.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 07:39:46 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the ONDA V891
 v5 tablet
To:     Maksim Karasev <karasevm98@gmail.com>
Cc:     dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20200421132548.5627-1-karasevm98@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b93970df-86e3-4636-13e8-60675aec7137@redhat.com>
Date:   Tue, 21 Apr 2020 16:39:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200421132548.5627-1-karasevm98@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/21/20 3:25 PM, Maksim Karasev wrote:
> Add touchscreen info for the ONDA V891 v5 tablet.
> 
> Signed-off-by: Maksim Karasev <karasevm98@gmail.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 6ec8923dec1a..cc2a2e0a0585 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -448,6 +448,24 @@ static const struct ts_dmi_data onda_v820w_32g_data = {
>   	.properties	= onda_v820w_32g_props,
>   };
>   
> +static const struct property_entry onda_v891_v5_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name",
> +			      "gsl3676-onda-v891-v5.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data onda_v891_v5_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= onda_v891_v5_props,
> +};
> +
>   static const struct property_entry onda_v891w_v1_props[] = {
>   	PROPERTY_ENTRY_U32("touchscreen-min-x", 46),
>   	PROPERTY_ENTRY_U32("touchscreen-min-y",  8),
> @@ -940,6 +958,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "V820w DualOS")
>   		},
>   	},
> +	{
> +		/* ONDA V891 v5 */
> +		.driver_data = (void *)&onda_v891_v5_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ONDA"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ONDA Tablet"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "ONDA.D869CJABNRBA06"),
> +		},
> +	},
>   	{
>   		/* ONDA V891w revision P891WBEBV1B00 aka v1 */
>   		.driver_data = (void *)&onda_v891w_v1_data,
> 


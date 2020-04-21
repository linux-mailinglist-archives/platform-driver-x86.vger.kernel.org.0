Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829F91B2868
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Apr 2020 15:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgDUNuR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Apr 2020 09:50:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25245 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726018AbgDUNuR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Apr 2020 09:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587477015;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fYUyqUrhhbqGF35kWuwwdWpfOqC+MMf8X1CRN78TKMk=;
        b=bg/3ZVoW75lX3tNk/1BJE7hHUJOWxu+jSjXSV5/RPy7KrEYlzt4BjtbngD/++3AA5C9NnI
        CpMvsYtz4NbekUFUdvA3kkDDMyJkBsW5MkdvACutL75Xyo7tgCckJb7AkC4/uO8ZAxei3c
        ATEjF4uhLJPhmf+YWRDCvHezACtPWVA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-r30oW8L2MO-EYWeDqiCIGw-1; Tue, 21 Apr 2020 09:50:14 -0400
X-MC-Unique: r30oW8L2MO-EYWeDqiCIGw-1
Received: by mail-wm1-f72.google.com with SMTP id u11so1390471wmc.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2020 06:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fYUyqUrhhbqGF35kWuwwdWpfOqC+MMf8X1CRN78TKMk=;
        b=jMc03puxNNA07dlPX27i+P7HTBAl9poWxyLfjxTtWhH4imF9XsxgkW2hJheV2ZfhTQ
         B+oUBwmiCtkg1/eyl6QOp1BPsQIjxA8zJ/SlWO1kRCUZ9lNNazjC5i5CiAUM7cnaIa8J
         iI0ijZyzOZc8YIRLF0TDjeNGxKbobQ3UPsyB+ZAge57JTVaBB9srFORNnkRvbutSi8BY
         ovzrOFGeBZ3/0B71RzMfEVSCG91NbHRx5A+X1v3Q0H0upAlZN0Tc+hW5xp1J2lDhN/8x
         uuUZUHdn0Fz+Af8lQ/k+VyJfM7K3BkUdUvPzW0+U/p3fgJhL/pTIus2y07k9SoDCUN66
         E7IQ==
X-Gm-Message-State: AGi0PuYSX/TFpvIUk5WEpSUc4hURDduj70Lui4fvZZyVGjhqAFPKwG6L
        y+5/K8WN/4DoTM88JAunxfRrWc73hMQjFCKPknwKY/DzjLRdgvLkfwYy+6TCQ/zGOH74j7duvao
        cYMl7K4sMXZVIr2bNZ9ss8HUReDGUcdByzA==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr5339856wmi.83.1587477012424;
        Tue, 21 Apr 2020 06:50:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypJhXaIQkhcHPAdDUQbyLGGHq104La/5m2RWz1UDpxPs6mNMJOnsNeJfrKHfaYb95Gmj5PzIhw==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr5339838wmi.83.1587477012189;
        Tue, 21 Apr 2020 06:50:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k6sm3889340wma.19.2020.04.21.06.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 06:50:11 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the ONDA V891
 v5 tablet
To:     Maksim Karasev <karasevm98@gmail.com>
Cc:     dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20200421132548.5627-1-karasevm98@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1fd3919b-6094-9c33-64d0-e8775c4428bc@redhat.com>
Date:   Tue, 21 Apr 2020 15:50:10 +0200
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

Thank you for the patch.

Can you please replace v891 with v891w everywhere to
be consistent with the existing v891 entries; and ...

> 
> Signed-off-by: Maksim Karasev <karasevm98@gmail.com>
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

Put this after the v891w_v3 entry please so that we
have in order v1, v3 and then v5.

Thanks,

Hans


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


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318251C5589
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 14:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgEEMh2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 08:37:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46722 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728660AbgEEMh2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 08:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588682246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lBbNUFcJgrVIZqJFmFBPntEFDYLgOUjsAx4wdoNY/xQ=;
        b=cd+sURuvKY3w/jquQUnuHqsimIt/mRIJW5keApgRzUD4DqyyXtL4sL7poTX6A2ykNu9y4i
        oA/MwcWofLnMkFlM29CtFGwYCBoTdJh+I3KXVY/JR4S80EKNkk1ywb+0WMId3LWtsp2f6B
        I21ZHRdGPs+u1pezsqkUy139glWhoqo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-nfWOKD3uMwquS5DM3e931Q-1; Tue, 05 May 2020 08:37:25 -0400
X-MC-Unique: nfWOKD3uMwquS5DM3e931Q-1
Received: by mail-wr1-f72.google.com with SMTP id h12so1121512wrr.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 05:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lBbNUFcJgrVIZqJFmFBPntEFDYLgOUjsAx4wdoNY/xQ=;
        b=RVdun65Ti1dyyfoe9Waho9xn426YUtEHD68O6Nm09z5Sh2KJa0GuIrafMLY9Y6ziqm
         OXS3bceUMS4+PRlM1sSe11G9WtbNrE1FyjXzZuEIf660l++vzvDwKwEqmZ23NMeNl67U
         1BZQPUguERd+2vQeG8nHrGyYpNcT4AHlerFkdfNmBGhclMlMinMNwdh28+FIQCVhk+id
         iLSlXOFF5//YfzPZAKl6Fmy7yywWESDrs2QEccdT1g19jWBIuaDqFIcn+7pVsW0a3GaL
         lt9nfS0qp+1klpci0/oKdAGRoZJVp60yPE4tSYuAzRqXf5BtX22Aj3oZiWh32NxLdLt+
         Rdgw==
X-Gm-Message-State: AGi0PuZpol6KSSI74mPAM/aCQ/kb3LDP/YnatG16CSGqoy2gAVwhYUlP
        fulBUR/Jr4jA5DJOAAD3C5d5lrGs7rdWjTFJxwGZmDLExLjW/a6lGwkY1RvyiVwbrt3bCuL2uCr
        BgwtnfFwsXiRaxrxIOwxvVzLo67YLE2+8ug==
X-Received: by 2002:a05:6000:1048:: with SMTP id c8mr2853817wrx.1.1588682243794;
        Tue, 05 May 2020 05:37:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypKC922BGFG7A/mZUgDBFMFzeSoRpW0mXJqxUccUJ8/uf5Tc3dEJWYDDQoDKGhjm+6JK3AncsA==
X-Received: by 2002:a05:6000:1048:: with SMTP id c8mr2853802wrx.1.1588682243622;
        Tue, 05 May 2020 05:37:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n25sm3656176wmk.9.2020.05.05.05.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 05:37:22 -0700 (PDT)
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
To:     Andrew Dunai <a@dun.ai>
Cc:     platform-driver-x86@vger.kernel.org, rdunlap@infradead.org
References: <20200505092825.145092-1-a@dun.ai>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c3c47b35-670b-11e7-9565-41658af9b619@redhat.com>
Date:   Tue, 5 May 2020 14:37:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200505092825.145092-1-a@dun.ai>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/20 11:28 AM, Andrew Dunai wrote:
> Signed-off-by: Andrew Dunai <a@dun.ai>

This needs a proper subject and commit msg added,
as explained by Andy already:

It should go like this:

platform/x86: touchscreen_dmi: ...
(blank line)
...commit message is here...
(blank line)
SoB: Author Name <email@com>

With that fixed this patch is:

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


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D62EE1985D7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Mar 2020 22:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgC3UxB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 30 Mar 2020 16:53:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:35383 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727750AbgC3UxA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Mar 2020 16:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585601579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TBd/GmPSgajYDp4UOzDkkquPzl9nNnzgAdcjHj3hrZM=;
        b=Rg0/Yl1ZT/55uqH2az9aab/d1tOk8xzATOlcSUAbFoWUmM/+9679U/iYzErBUFztpfe7iX
        X7+PIXFIkBGebr9URsWYh4SmEltw0TZ5WcEjii9cXYCc3EyUmPzpvSacb6mzdbwppj+TvC
        0zxMcnjG5OdZVdKi+1Z8jKpsfzduNfo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-veWU_9YjOD6wVzgpLZbtnw-1; Mon, 30 Mar 2020 16:52:58 -0400
X-MC-Unique: veWU_9YjOD6wVzgpLZbtnw-1
Received: by mail-wr1-f70.google.com with SMTP id h14so11884845wrr.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2020 13:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TBd/GmPSgajYDp4UOzDkkquPzl9nNnzgAdcjHj3hrZM=;
        b=Gwv8BDhGk3Rclf4MniD3IGYCFu7uTOIwSgn8q0qohicDQMkcBMwCZTjOcFj9zQhqkt
         b6V5SiV0WNhYkze1Adt4FNJv3m85lmYdnQQ+4UO/NkZgUwgkZqO0sCvdiI2G26/RD+vU
         Pi+GY2dUzPT3RGtZGz0YkR3LfYgP0m73/HBBR+4PNYhdt+9CU+mddnbXlW0bQwwdmgw2
         NW4Rtl5i94DxFgtskT6OLDe2IIRyWd5FF30nJcSktYFoAtAbFqvnlAM74L1i2AnGL5zm
         ONYSp0swHIssFwSGjGwSy5XzeRoXmIaQWEZzeEZVpTX/6x4tF71ykMrmi/sLk+vbw2eG
         Pj4g==
X-Gm-Message-State: ANhLgQ1NNZwdP/kdTkJS+tec1+h5Ya1cRJ4z6N8Z45vnYS+DYiUJGWAm
        iS+juNQxIib2K/47/JMLpcfxVMt1wcZHhbHGD3/m2FlGguakBm7JCHh1nLOGg9B1mOV84XfdXC0
        DDhRuFHV4hB9aGvK+W3oqM34y2/d3MFc7Cw==
X-Received: by 2002:a1c:7e11:: with SMTP id z17mr1140454wmc.151.1585601576695;
        Mon, 30 Mar 2020 13:52:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvNnA/ud9ueXv2dxH4u2DNVuY3gnIohVgboDtPSI0VuXNdt+CW7WRko3F7mNedabXgzwTXbMQ==
X-Received: by 2002:a1c:7e11:: with SMTP id z17mr1140436wmc.151.1585601576455;
        Mon, 30 Mar 2020 13:52:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id h5sm23314544wro.83.2020.03.30.13.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 13:52:55 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add touchscreen info for
 techBite Arc 11.6.
To:     Wiktor Ciurej <wiktor.ciurej@gmail.com>
Cc:     dvhart@infradead.org, andy@infradead.org,
        platform-driver-x86@vger.kernel.org
References: <20200330204701.GA11408@zyklotron>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1eae3e6f-5334-08d0-8e37-3f536eb80429@redhat.com>
Date:   Mon, 30 Mar 2020 22:52:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330204701.GA11408@zyklotron>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/30/20 10:47 PM, Wiktor Ciurej wrote:
> Add touchscreen info for techBite Arc 11.6.
> 
> Signed-off-by: Wiktor Ciurej <wiktor.ciurej@gmail.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

p.s.

As discussed because of the touchscreen_dmi.c changes
which are coming in through the driver-core tree it is
best to merge this for 5.7.0-rc2 (rather then for rc1)


> ---
>   drivers/platform/x86/touchscreen_dmi.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 93177e6e5ecd..ba43a29f68a9 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -537,6 +537,17 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
>   	.properties	= schneider_sct101ctm_props,
>   };
>   
> +static const struct property_entry techbite_arc_11_6_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 7),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1981),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-techbite-arc-11-6.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	{ }
> +};
> +
>   static const struct property_entry teclast_x3_plus_props[] = {
>   	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>   	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -969,6 +980,15 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
>   		},
>   	},
> +	{
> +		/* Techbite Arc 11.6 */
> +		.driver_data = (void *)&techbite_arc_11_6_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "techBite Arc 11.6"),
> +			DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
> +		},
> +	},
>   	{
>   		/* Teclast X3 Plus */
>   		.driver_data = (void *)&teclast_x3_plus_data,
> 


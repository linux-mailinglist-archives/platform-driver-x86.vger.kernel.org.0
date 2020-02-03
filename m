Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA81B1511B5
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Feb 2020 22:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgBCVSA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Feb 2020 16:18:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57782 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726834AbgBCVSA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Feb 2020 16:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580764679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wdmKq+r8C34si2IoRsHi9fqIPvPKHv+jVYiBofqYidg=;
        b=O3Az2ZpEnhsGBz8SVxSaTBOShfxylvfnwob1GALqyNPslTbyXepmo6CP9a0KB8mJ6UO2Nk
        Qie+wUkxV6D6a7Pq/4H12Cz7yduHcEx4B5jkBLPlJgUlvZIQP5wo4MMW673o9jM2MeV2SM
        CubsIgCd7YrWKwFpx2Nc/wvFZZieDUk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-v4kEwapuN-SlpPCix6S4qA-1; Mon, 03 Feb 2020 16:17:56 -0500
X-MC-Unique: v4kEwapuN-SlpPCix6S4qA-1
Received: by mail-wr1-f69.google.com with SMTP id m15so4654754wrs.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Feb 2020 13:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wdmKq+r8C34si2IoRsHi9fqIPvPKHv+jVYiBofqYidg=;
        b=TLNs8nxQmEcySUE2WXEN5+pf7PG5m+gMDfDvIm+nb6Tligydn+WJ6YnLps++U5aLFN
         PCF5ozDkdR0gLmI/9KBHsvpjTj87hbulhmMcnd/Z3hBZCGX0QxdiTRshVFaTdufyPSpm
         T2IedNrQ3SZGapCdd2B88CZj0AD/jN1RGQ5TWMcqGgIKAkoxxNSUE7QOKy/+jc6BXSwT
         sB69VxI0Guftok7JW7svB9Hf+rDCBbDqMG6cjZ7MO1QEi2B3SfDfi1GZdznH6pYYWfwA
         npTet/Lb1AXzA4CXgZWvvyqvQiYcNg22gCpfDKZ9Z1hg8yNnPRPIDlJJSlY96WVQUEw+
         mufw==
X-Gm-Message-State: APjAAAXI8zGI1tBQyH5Z4X5MbhgreVSngzrPIWd+tPOn3D+P+ddh9I/p
        XiodlWk4UPM3rrHA1dE7tSCv65w7RIDqlM8L9ORUiO4kq9huJJB8eyn/J1dT5Cll6hTHui+g3N0
        BbbzGm0m+gR27xyerbKnu5jzDY7JWubDapw==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr942575wmh.94.1580764675155;
        Mon, 03 Feb 2020 13:17:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+xKpUSX7ybVFXjcCz+cUowAmvLC1AIMBE48DucQsuNnWMiuuwiasgraDHD6A5uXDQEy7TNg==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr942563wmh.94.1580764674977;
        Mon, 03 Feb 2020 13:17:54 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id y12sm809312wmj.6.2020.02.03.13.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 13:17:54 -0800 (PST)
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Lex 2I385SW to
 critclk_systems DMI table
To:     =?UTF-8?Q?Georg_M=c3=bcller?= <georgmueller@gmx.net>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20200203201105.11659-1-georgmueller@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <466fff4c-eb61-7fd5-1442-54499c3db645@redhat.com>
Date:   Mon, 3 Feb 2020 22:17:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203201105.11659-1-georgmueller@gmx.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 03-02-2020 21:11, Georg Müller wrote:
> The Lex 2I385SW board has two Intel I211 ethernet controllers. Without
> this patch, only the first port is usable. The second port fails to
> start with the following message:
> 
>      igb: probe of 0000:02:00.0 failed with error -2
> 
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Tested-by: Georg Müller <georgmueller@gmx.net>
> Signed-off-by: Georg Müller <georgmueller@gmx.net>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/platform/x86/pmc_atom.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 3e3c66dfec2e..ca684ed760d1 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -383,6 +383,14 @@ static const struct dmi_system_id critclk_systems[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
>   		},
>   	},
> +	{
> +		/* pmc_plt_clk* - are used for ethernet controllers */
> +		.ident = "Lex 2I385SW",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
> +		},
> +	},
>   	{
>   		/* pmc_plt_clk* - are used for ethernet controllers */
>   		.ident = "Beckhoff CB3163",
> --
> 2.24.1
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E148497D58
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Jan 2022 11:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbiAXKmz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Jan 2022 05:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41483 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231843AbiAXKmz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jan 2022 05:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643020974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Uf4sCvJ1T+LbSpGMNtkDRaIb2gR/OP4HOZJPpt30ec8=;
        b=QTQlclVoqL0nWPqIw9yt+f+BuItV58enml0tzcIGmzVNt4kfc1p74GjfS539NRyObqMF1R
        VAvDbcYWifEEJSnCKnZBqspHRffZ/w9EOFlYmvM2YMEt7M2muDJ1AI/AWAhaTkrfZr78wR
        K7658Bnf/yQVi14VQ9igS8wohbueAbE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-uWwEc6BBMliRYCmZqg67VA-1; Mon, 24 Jan 2022 05:42:52 -0500
X-MC-Unique: uWwEc6BBMliRYCmZqg67VA-1
Received: by mail-ej1-f69.google.com with SMTP id v2-20020a170906292200b006a94a27f903so1911070ejd.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jan 2022 02:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Uf4sCvJ1T+LbSpGMNtkDRaIb2gR/OP4HOZJPpt30ec8=;
        b=5Do85LNfeGttNK3Q0foC9WeL/53irsouSFbmnBHeJ5uNSxkN8901Qp9zEILq2R02U8
         xcUMYdRUxCSVY8Ap5GtXQJJ00hA8nYAwhCWULhtuvMlVntqHjliKnIkVMzlB2alva+Fj
         fIYe8egmrZwSL6NWrZ/5q3u5e0G9VCbc9wWexubOBaVxz54sOPGPhkpH/YjfOZzS70uB
         jDQqP7GaX6BoxSidK9wV91ovaNImBOgiobJnW0eSSywHJxnH6PWHsirt7Q8o7y0lpAPA
         7/SLHoYH5nlEgy5Whv4fKvPja69OQs+jwgAJyFWcgONJQjfbhqg6twNbV4cItSdt75XV
         CLng==
X-Gm-Message-State: AOAM530TYZU96i/KPfypaHAtyDvfEVZ/oa/15LPSWtq79GzThdmKxIDN
        qJMOm3XhIXor2U/UHlcUyk5KhMUJ6Eo1OUi6+Z3HAKdMFGyib4/byoNUygfE793yJZWFHFfBxft
        y0sv4dHzlKfq2ydEpbxBqrAUBfxs1cngQHw==
X-Received: by 2002:a17:906:a148:: with SMTP id bu8mr11770229ejb.421.1643020971586;
        Mon, 24 Jan 2022 02:42:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYKp0MdT5umF+cQOL5fdCWhKtnew5iMaCrKDpCpgE7eBkFUTYm5P7VIGF+aTmSnZvhtFkWuA==
X-Received: by 2002:a17:906:a148:: with SMTP id bu8mr11770218ejb.421.1643020971362;
        Mon, 24 Jan 2022 02:42:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id f6sm6435081edy.18.2022.01.24.02.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 02:42:50 -0800 (PST)
Message-ID: <cedb4ef6-867b-7c00-2f77-1ad7b07c5aa2@redhat.com>
Date:   Mon, 24 Jan 2022 11:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix incorrect use of
 platform profile on AMD platforms
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        mario.limonciello@amd.com
References: <markpearson@lenovo.com>
 <20220121201722.3423-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121201722.3423-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 1/21/22 21:17, Mark Pearson wrote:
> Lenovo AMD based platforms have been offering platform_profiles but they
> are not working correctly. This is because the mode we are using on the
> Intel platforms (MMC) is not available on the AMD platforms.
> 
> This commit adds checking of the functional capabilities returned by the
> BIOS to confirm if MMC is supported or not. Profiles will not be
> available if the platform is not MMC capable.
> 
> I'm investigating and working on an alternative for AMD platforms but
> that is still work-in-progress.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 9c632df734bb..42a04e44135b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10026,6 +10026,9 @@ static struct ibm_struct proxsensor_driver_data = {
>  #define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
>  #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>  
> +#define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
> +#define DYTC_FC_MMC           27 /* MMC Mode supported */
> +
>  #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
>  #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
>  
> @@ -10253,6 +10256,16 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (dytc_version >= 5) {
>  		dbg_printk(TPACPI_DBG_INIT,
>  				"DYTC version %d: thermal mode available\n", dytc_version);

This code has been refactored and this will not apply as is:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=0b0d2fba4f3302b601c429c9286e66b3af2d29cb
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=798682e236893a20e5674de02ede474373dd342d

Please rebase on top of 5.17-rc1

> +
> +		/* Check what capabilities are supported. Currently MMC is needed */
> +		err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
> +		if (err)
> +			return err;
> +		if (!test_bit(DYTC_FC_MMC, (void *)&output)) {
> +			dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
> +			return 0;

This should be return -ENODEV;

Regards,

Hans


> +		}
> +
>  		/*
>  		 * Check if MMC_GET functionality available
>  		 * Version > 6 and return success from MMC_GET command
> 


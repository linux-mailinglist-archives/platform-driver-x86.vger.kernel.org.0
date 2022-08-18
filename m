Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A568598FCF
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Aug 2022 23:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238950AbiHRV6T (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 18 Aug 2022 17:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbiHRV6R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Aug 2022 17:58:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FCE63AC;
        Thu, 18 Aug 2022 14:58:14 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gk3so5639465ejb.8;
        Thu, 18 Aug 2022 14:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ZSCTbCl1ILJxeZhoZuZXznlGbD1P63mlK8222v8FK10=;
        b=nQ9kYzaYIKBlmK1apxLjNfuidABK9cFrG/w7ZFuH+OCI/Eibdv8QC8YymUJ6I97FIV
         GFtA5BqR7lv2OoqEaKis0WX+czHahPf81CMmhJQWqMCwnWOf9HhrDO2czqcbLTa8u1VO
         mxnTUmqLhMZqnVFElCCDSRhWdDAuqJP+mQF9qcUjGOMK/0Hg3X/hAvpXaZjJRmj7o7d2
         9GfPpZeSNUTiBXbjLM2iAUvpYon9G1eObQKuULsoWf8SIekcn5tlVcy3Jw08MATJsahB
         UY34Cj5v9ivdRNIdNNTBQrI0Buzl7FetFS5wUl6wQdxQB8GSpAFW6nFqhpUgPKmS2oFM
         E5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZSCTbCl1ILJxeZhoZuZXznlGbD1P63mlK8222v8FK10=;
        b=4ANB8XlkdbJJo5kDXsmAp7oDHnKxHbR0bIRbkWLxsehEt23qwJV+WU9j11EEEP9Z2f
         FhGxdvOoQC9F8GaackfoS+5UWzpvhCua2z6iLXnY2vnyKjDxxF4pcmBXjqX74d7+RKhl
         KdHAPmVE9ZCR+qHMHJsy96YBPrdQoTqyWyom9Nkg9Ln4VFIOWsFL82WMmhMkcoJgYBCP
         nDf4U5DaHpWqwH8j4IHcTrpS4aamBSMN8mAYHLdWLUjZ/Zos9c8UfKxlTEX3NmWUyqwZ
         kSwQs+H97A/xgdxGSrZ1BBrlq+v/GqzKV8uZdcpPkdOqzM4GCqcp0CabCs8YFRNZcOWv
         P+vg==
X-Gm-Message-State: ACgBeo35WZp+VMKfkVSQvEGQMPQMFatxLjymjdMDjKbB1w+smiEwe/m3
        Fxnk1PhCYzrnyENfle7N/rU=
X-Google-Smtp-Source: AA6agR5W4F76OnrfQFjHLUBkr29Cc7uX6T1pRjg3JYmo0D4pASNNOmu5jVljingTfMfKVLB1FdKBCA==
X-Received: by 2002:a17:906:cc57:b0:73c:7015:ac39 with SMTP id mm23-20020a170906cc5700b0073c7015ac39mr1384959ejb.725.1660859892920;
        Thu, 18 Aug 2022 14:58:12 -0700 (PDT)
Received: from [10.21.0.8] ([37.120.217.82])
        by smtp.gmail.com with ESMTPSA id f19-20020a17090631d300b0073d05a03347sm12422ejf.89.2022.08.18.14.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 14:58:12 -0700 (PDT)
Message-ID: <7f149890-9442-c407-66b8-eade014c00b8@gmail.com>
Date:   Thu, 18 Aug 2022 23:58:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform: move from strlcpy with unused retval to strscpy
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
        ibm-acpi-devel@lists.sourceforge.net
References: <20220818210058.7229-1-wsa+renesas@sang-engineering.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20220818210058.7229-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/18/22 23:00, Wolfram Sang wrote:
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
> 
> Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>  # for platform/surface

> ---
>   drivers/platform/surface/surface3_power.c          | 2 +->   drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 2 +-
>   drivers/platform/x86/intel/chtwc_int33fe.c         | 6 +++---
>   drivers/platform/x86/thinkpad_acpi.c               | 4 ++--
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index 444ec81ba02d..4c53d116d59b 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -519,7 +519,7 @@ static int mshw0011_probe(struct i2c_client *client)
>   	i2c_set_clientdata(client, data);
>   
>   	memset(&board_info, 0, sizeof(board_info));
> -	strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
> +	strscpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
>   
>   	bat0 = i2c_acpi_new_device(dev, 1, &board_info);
>   	if (IS_ERR(bat0))
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 636bdfa83284..0a6411a8a104 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -270,7 +270,7 @@ void strlcpy_attr(char *dest, char *src)
>   	size_t len = strlen(src) + 1;
>   
>   	if (len > 1 && len <= MAX_BUFF)
> -		strlcpy(dest, src, len);
> +		strscpy(dest, src, len);
>   
>   	/*len can be zero because any property not-applicable to attribute can
>   	 * be empty so check only for too long buffers and log error
> diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
> index c52ac23e2331..1ea989df513c 100644
> --- a/drivers/platform/x86/intel/chtwc_int33fe.c
> +++ b/drivers/platform/x86/intel/chtwc_int33fe.c
> @@ -270,7 +270,7 @@ cht_int33fe_register_max17047(struct device *dev, struct cht_int33fe_data *data)
>   	}
>   
>   	memset(&board_info, 0, sizeof(board_info));
> -	strlcpy(board_info.type, "max17047", I2C_NAME_SIZE);
> +	strscpy(board_info.type, "max17047", I2C_NAME_SIZE);
>   	board_info.dev_name = "max17047";
>   	board_info.fwnode = fwnode;
>   	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
> @@ -361,7 +361,7 @@ static int cht_int33fe_typec_probe(struct platform_device *pdev)
>   	}
>   
>   	memset(&board_info, 0, sizeof(board_info));
> -	strlcpy(board_info.type, "typec_fusb302", I2C_NAME_SIZE);
> +	strscpy(board_info.type, "typec_fusb302", I2C_NAME_SIZE);
>   	board_info.dev_name = "fusb302";
>   	board_info.fwnode = fwnode;
>   	board_info.irq = fusb302_irq;
> @@ -381,7 +381,7 @@ static int cht_int33fe_typec_probe(struct platform_device *pdev)
>   	memset(&board_info, 0, sizeof(board_info));
>   	board_info.dev_name = "pi3usb30532";
>   	board_info.fwnode = fwnode;
> -	strlcpy(board_info.type, "pi3usb30532", I2C_NAME_SIZE);
> +	strscpy(board_info.type, "pi3usb30532", I2C_NAME_SIZE);
>   
>   	data->pi3usb30532 = i2c_acpi_new_device(dev, 3, &board_info);
>   	if (IS_ERR(data->pi3usb30532)) {
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 22d4e8633e30..8dad0428a83c 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7623,9 +7623,9 @@ static int __init volume_create_alsa_mixer(void)
>   	data = card->private_data;
>   	data->card = card;
>   
> -	strlcpy(card->driver, TPACPI_ALSA_DRVNAME,
> +	strscpy(card->driver, TPACPI_ALSA_DRVNAME,
>   		sizeof(card->driver));
> -	strlcpy(card->shortname, TPACPI_ALSA_SHRTNAME,
> +	strscpy(card->shortname, TPACPI_ALSA_SHRTNAME,
>   		sizeof(card->shortname));
>   	snprintf(card->mixername, sizeof(card->mixername), "ThinkPad EC %s",
>   		 (thinkpad_id.ec_version_str) ?

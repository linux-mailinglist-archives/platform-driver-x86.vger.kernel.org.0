Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049114A5E47
	for <lists+platform-driver-x86@lfdr.de>; Tue,  1 Feb 2022 15:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239305AbiBAO3k (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 1 Feb 2022 09:29:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28940 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239291AbiBAO3i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 09:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643725778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TODHypD7aG0BLPnolnBTqp3Mq2JcY03pG43pCd3OAwU=;
        b=Il9pRQZ6jJtJMedhHogJBGh0LJn54NDE91DPec+9hpZcV4bQr+Iq3Y2TTDX5KDmtqUeZL2
        IGZH7LEvFb5nO4vt5OZd8mKRVTZ/n791OSPUGWiqqJjrrAzQNYAlXSqlewCEI6S0UluLcM
        aS2uErK2M7peTpswVIMJUulupdKs0Q4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-WFqSKq6WNVOjKMAWMZHJ-Q-1; Tue, 01 Feb 2022 09:29:35 -0500
X-MC-Unique: WFqSKq6WNVOjKMAWMZHJ-Q-1
Received: by mail-ej1-f71.google.com with SMTP id q21-20020a17090622d500b006bb15a59a68so4692198eja.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Feb 2022 06:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TODHypD7aG0BLPnolnBTqp3Mq2JcY03pG43pCd3OAwU=;
        b=gmZXM5lRTK7w7fFU0iKE1YkrGxm9tS4KofDwJq3zCcDuo+nK/rcsBUbFCUgCIQ15xR
         vpzqGjzkcQSSXwPcIiCA0rDZ4FWZr8ATm/qeoBWnAkPFkesNcgYNA+tQPQiUba/gyt9Z
         l7KcDsAX+E18sVUv2jD4JpAukd07CXWqEMJyGSPmbbMEUjrDaMlLFstfSq6MkeyqWK2L
         dhTEenPLMBnWUOsnxdQQ2eQo8JeontPxt7I9NBqyL3gt/jWLPU8L/Kl3ckqgEAB0ROYZ
         wxPSVnN05IRYRYw2LNI7lC2S4ypf/XeekvO3sZo8YQJIv72GBG0NTPa9td4nL8OEiegF
         H2ZA==
X-Gm-Message-State: AOAM5327vHtqQ8/+8CF1ao2i0SeeNoN9eNhOiSkzaHCSVtLKEt9N5K6K
        4tRzp8fIxHezIzMlOG33iZSIyGJ7Fz900FesEXWAgK+QEmUGGNpW/AfwUI7Ay0K0XfgFL/pyy0f
        rkUlUnN+HtMwPtkQ8hXkjpV2RCRha3JvvfQ==
X-Received: by 2002:a17:907:3e8a:: with SMTP id hs10mr21320717ejc.112.1643725774681;
        Tue, 01 Feb 2022 06:29:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx41AxR9vZSMwMuewG3JWzv5v/+m/CXL2SskUIk4WHgBfEGT64NzWU3J0cWGeMv5O8Db8khPg==
X-Received: by 2002:a17:907:3e8a:: with SMTP id hs10mr21320693ejc.112.1643725774454;
        Tue, 01 Feb 2022 06:29:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id t22sm1352103edv.105.2022.02.01.06.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 06:29:33 -0800 (PST)
Message-ID: <9cc5b24d-7a4e-073e-f7a4-124f76d44d77@redhat.com>
Date:   Tue, 1 Feb 2022 15:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 3/9] spi: Support selection of the index of the ACPI
 Spi Resource before alloc
Content-Language: en-US
To:     Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-4-sbinding@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-4-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/21/22 18:24, Stefan Binding wrote:
> If a node contains more than one Spi Resources, it may be necessary to
> use an index to select which one you want to allocate a spi device for.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/spi/spi.c       | 51 +++++++++++++++++++++++++++++++++++------
>  include/linux/spi/spi.h |  3 ++-
>  2 files changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 13f4701f0694..06c0a308b38b 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2320,6 +2320,8 @@ struct acpi_spi_lookup {
>  	int			irq;
>  	u8			bits_per_word;
>  	u8			chip_select;
> +	int			n;
> +	int			index;
>  };
>  
>  static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
> @@ -2351,6 +2353,8 @@ static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
>  		lookup->mode |= SPI_CPHA;
>  }
>  
> +static struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev);
> +
>  static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>  {
>  	struct acpi_spi_lookup *lookup = data;
> @@ -2364,14 +2368,35 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>  		sb = &ares->data.spi_serial_bus;
>  		if (sb->type == ACPI_RESOURCE_SERIAL_TYPE_SPI) {
>  
> +			if (lookup->index != -1 && lookup->n++ != lookup->index)
> +				return 1;
> +
> +			if (lookup->index == -1 && !ctlr)
> +				return -ENODEV;
> +
>  			status = acpi_get_handle(NULL,
>  						 sb->resource_source.string_ptr,
>  						 &parent_handle);
>  
> -			if (ACPI_FAILURE(status) ||
> -			    ACPI_HANDLE(ctlr->dev.parent) != parent_handle)
> +			if (ACPI_FAILURE(status))
>  				return -ENODEV;
>  
> +			if (ctlr) {
> +				if (ACPI_HANDLE(ctlr->dev.parent) != parent_handle)
> +					return -ENODEV;
> +			} else {
> +				struct acpi_device *adev;
> +
> +				if (acpi_bus_get_device(parent_handle, &adev))
> +					return -ENODEV;
> +
> +				ctlr = acpi_spi_find_controller_by_adev(adev);
> +				if (!ctlr)
> +					return -ENODEV;
> +
> +				lookup->ctlr = ctlr;
> +			}
> +
>  			/*
>  			 * ACPI DeviceSelection numbering is handled by the
>  			 * host controller driver in Windows and can vary
> @@ -2414,14 +2439,21 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>   * acpi_spi_device_alloc - Allocate a spi device, and fill it in with ACPI information
>   * @ctlr: controller to which the spi device belongs
>   * @adev: ACPI Device for the spi device
> + * @index: Index of the spi resource inside the ACPI Node
>   *
>   * This should be used to allocate a new spi device from and ACPI Node.
>   * The caller is responsible for calling spi_add_device to register the spi device.
>   *
> + * If ctlr is set to NULL, the Controller for the spi device will be looked up
> + * using the resource.
> + * If index is set to -1, index is not used.
> + * Note: If index is -1, ctlr must be set.
> + *
>   * Return: a pointer to the new device, or ERR_PTR on error.
>   */
>  struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
> -					 struct acpi_device *adev)
> +					 struct acpi_device *adev,
> +					 int index)
>  {
>  	acpi_handle parent_handle = NULL;
>  	struct list_head resource_list;
> @@ -2429,8 +2461,13 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  	struct spi_device *spi;
>  	int ret;
>  
> +	if (!ctlr && index == -1)
> +		return ERR_PTR(-EINVAL);
> +
>  	lookup.ctlr		= ctlr;
>  	lookup.irq		= -1;
> +	lookup.index		= index;
> +	lookup.n		= 0;
>  
>  	INIT_LIST_HEAD(&resource_list);
>  	ret = acpi_dev_get_resources(adev, &resource_list,
> @@ -2443,7 +2480,7 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  
>  	if (!lookup.max_speed_hz &&
>  	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle)) &&
> -	    ACPI_HANDLE(ctlr->dev.parent) == parent_handle) {
> +	    ACPI_HANDLE(lookup.ctlr->dev.parent) == parent_handle) {
>  		/* Apple does not use _CRS but nested devices for SPI slaves */
>  		acpi_spi_parse_apple_properties(adev, &lookup);
>  	}
> @@ -2451,9 +2488,9 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  	if (!lookup.max_speed_hz)
>  		return ERR_PTR(-ENODEV);
>  
> -	spi = spi_alloc_device(ctlr);
> +	spi = spi_alloc_device(lookup.ctlr);
>  	if (!spi) {
> -		dev_err(&ctlr->dev, "failed to allocate SPI device for %s\n",
> +		dev_err(&lookup.ctlr->dev, "failed to allocate SPI device for %s\n",
>  			dev_name(&adev->dev));
>  		return ERR_PTR(-ENOMEM);
>  	}
> @@ -2478,7 +2515,7 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
>  	    acpi_device_enumerated(adev))
>  		return AE_OK;
>  
> -	spi = acpi_spi_device_alloc(ctlr, adev);
> +	spi = acpi_spi_device_alloc(ctlr, adev, -1);
>  	if (IS_ERR(spi)) {
>  		if (PTR_ERR(spi) == -ENOMEM)
>  			return AE_NO_MEMORY;
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index d159cef12f1a..e5bbb9cbd3d7 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -762,7 +762,8 @@ extern void spi_unregister_controller(struct spi_controller *ctlr);
>  
>  #if IS_ENABLED(CONFIG_ACPI)
>  extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
> -						struct acpi_device *adev);
> +						struct acpi_device *adev,
> +						int index);
>  #endif
>  
>  /*
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500953DFC77
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Aug 2021 10:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbhHDIIU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 4 Aug 2021 04:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29814 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236128AbhHDIIS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 04:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628064486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aZwnnJbZGmY78AaBVHz1xhD58sV1zCT+PSZcOVwS1yk=;
        b=axUs1t395RisuZ8JsBaXgvmekIJONWxGhyYkYi9QAziBLCcwz8Sv8drKiKR3CTDTw1M6sk
        HqSIwP3m4LQXDU86tTk1PO/CT7XLXhaLuzvyvZtLJl8YPEXkhihFUYDWgWa84/keEunIA0
        RmnUkSnMriag9Qxoyw8yVeapcDrSvAk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-aP0KQX6_OAyweXPoNfXoZw-1; Wed, 04 Aug 2021 04:08:05 -0400
X-MC-Unique: aP0KQX6_OAyweXPoNfXoZw-1
Received: by mail-ed1-f69.google.com with SMTP id l3-20020aa7c3030000b02903bccf1897f9so1039957edq.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Aug 2021 01:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aZwnnJbZGmY78AaBVHz1xhD58sV1zCT+PSZcOVwS1yk=;
        b=PPD3lAnPIGNj+0NPP+rraggLQe1p9Lga2b01EgrRvUd3GSzj3HucJ/4oSLBTLaHpXI
         TyoNiy9MvefiWmwmAAzJZ/Ms+fIVdjgN6f/AEyy/7VuciA1Pp7mGFyCpyeHpEVtYJiMB
         JapOfiCa/O/91jwhnlfBYzPwti7hBurVSkfB4U0knuTXTqvjeS2fEIE0IGL3XTf+2amR
         do9f2vwLSErxOKyjuD47VaTCsn+uFJmnX7F2aSO0wRay8rD8yfeYxDqhOYmcxZyZY+3E
         dpJxyKaflMxxnztU0RbczkyqdM1nAi1FV1aEQNuXqUZwyGvIOE3Hy3MF+0vIevb3RdD3
         bu7g==
X-Gm-Message-State: AOAM532eOqZTh7Um+Hyd507n8QM/CeiHihxrGbOt/rU81JlUpOuwexY1
        fvR4ME6BUQux87WRZJmcJWdHLrW6tEnzwHQU3nwtccdAyLGiaXMr/cB6WjLEigcitu4DONFIJdv
        mfUgWR9c2s/p6qiuzfmmW/Ww5W89Ldvlt4Q==
X-Received: by 2002:a17:906:2bd3:: with SMTP id n19mr25281530ejg.232.1628064482385;
        Wed, 04 Aug 2021 01:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ1+gMYBRSUkrYqo89Yv7xc5DTJIohqhaN0uH5kty9MZlm1Z33Iw3saCry50e7XHi7/2KP0g==
X-Received: by 2002:a17:906:2bd3:: with SMTP id n19mr25281504ejg.232.1628064482121;
        Wed, 04 Aug 2021 01:08:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ha26sm425362ejb.87.2021.08.04.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 01:08:01 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] serdev: Split and export
 serdev_acpi_get_uart_resource()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>
References: <20210803192905.72246-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <035d2579-f64c-b5c2-45ff-4421ad7db6ca@redhat.com>
Date:   Wed, 4 Aug 2021 10:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803192905.72246-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/3/21 9:29 PM, Andy Shevchenko wrote:
> The same as for I²C Serial Bus resource split and export
> serdev_acpi_get_uart_resource(). We have already 3 users
> one of which is converted here.
> 
> Rationale of this is to consolidate parsing UART Serial Bus
> resource in one place as it's done, e.g., for I²C Serial Bus.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

*for this patch*

We do need to talk about how to merge this series, I've
NACK-ed patches 3/5 and 4/5 (see my reply there) so that
leaves just 2/5  as depending on this one. I believe it
would be easiest to just merge 1/5 + 2/5 to the tree
which caries serdev patches, which I guess is Greg's
tty tree ?

Greg can you pick up 1/5 and 2/5 ?

Regards,

Hans



> ---
>  drivers/tty/serdev/core.c | 36 +++++++++++++++++++++++++++++-------
>  include/linux/serdev.h    | 14 ++++++++++++++
>  2 files changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index 92498961fd92..436e3d1ba92c 100644
> --- a/drivers/tty/serdev/core.c
> +++ b/drivers/tty/serdev/core.c
> @@ -562,23 +562,45 @@ struct acpi_serdev_lookup {
>  	int index;
>  };
>  
> +/**
> + * serdev_acpi_get_uart_resource - Gets UARTSerialBus resource if type matches
> + * @ares:	ACPI resource
> + * @uart:	Pointer to UARTSerialBus resource will be returned here
> + *
> + * Checks if the given ACPI resource is of type UARTSerialBus.
> + * In this case, returns a pointer to it to the caller.
> + *
> + * Returns true if resource type is of UARTSerialBus, otherwise false.
> + */
> +bool serdev_acpi_get_uart_resource(struct acpi_resource *ares,
> +				   struct acpi_resource_uart_serialbus **uart)
> +{
> +	struct acpi_resource_uart_serialbus *sb;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
> +		return false;
> +
> +	sb = &ares->data.uart_serial_bus;
> +	if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_UART)
> +		return false;
> +
> +	*uart = sb;
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(serdev_acpi_get_uart_resource);
> +
>  static int acpi_serdev_parse_resource(struct acpi_resource *ares, void *data)
>  {
>  	struct acpi_serdev_lookup *lookup = data;
>  	struct acpi_resource_uart_serialbus *sb;
>  	acpi_status status;
>  
> -	if (ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
> -		return 1;
> -
> -	if (ares->data.common_serial_bus.type != ACPI_RESOURCE_SERIAL_TYPE_UART)
> +	if (!serdev_acpi_get_uart_resource(ares, &sb))
>  		return 1;
>  
>  	if (lookup->index != -1 && lookup->n++ != lookup->index)
>  		return 1;
>  
> -	sb = &ares->data.uart_serial_bus;
> -
>  	status = acpi_get_handle(lookup->device_handle,
>  				 sb->resource_source.string_ptr,
>  				 &lookup->controller_handle);
> @@ -586,7 +608,7 @@ static int acpi_serdev_parse_resource(struct acpi_resource *ares, void *data)
>  		return 1;
>  
>  	/*
> -	 * NOTE: Ideally, we would also want to retreive other properties here,
> +	 * NOTE: Ideally, we would also want to retrieve other properties here,
>  	 * once setting them before opening the device is supported by serdev.
>  	 */
>  
> diff --git a/include/linux/serdev.h b/include/linux/serdev.h
> index 9f14f9c12ec4..3368c261ab62 100644
> --- a/include/linux/serdev.h
> +++ b/include/linux/serdev.h
> @@ -327,4 +327,18 @@ static inline int serdev_tty_port_unregister(struct tty_port *port)
>  }
>  #endif /* CONFIG_SERIAL_DEV_CTRL_TTYPORT */
>  
> +struct acpi_resource;
> +struct acpi_resource_uart_serialbus;
> +
> +#ifdef CONFIG_ACPI
> +bool serdev_acpi_get_uart_resource(struct acpi_resource *ares,
> +				   struct acpi_resource_uart_serialbus **uart);
> +#else
> +static inline bool serdev_acpi_get_uart_resource(struct acpi_resource *ares,
> +						 struct acpi_resource_uart_serialbus **uart)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_ACPI */
> +
>  #endif /*_LINUX_SERDEV_H */
> 


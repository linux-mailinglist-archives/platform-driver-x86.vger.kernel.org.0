Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800031BACB5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Apr 2020 20:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgD0SbW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Apr 2020 14:31:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54009 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726333AbgD0SbW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Apr 2020 14:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588012280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=67Uxs+jqDkywiXxN1nmtevKGJBAFvPYU5lLkyapeJkg=;
        b=G8GetS9xMrD8x/NSCT/IzCmV7H3pK5g69GONJw85xqTN2wJJMZBEE0tnfdiS1dVnoXriyL
        TNf46A2TO4IYhCRkZfG8BG4mOLhmPlJg6bjmQPtabo4Hu7zJdzEI+uBLU+t28PD8DH/92l
        cBAxmYPfyThwgoNCOeG6afFUmhpRB6s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-KGfTqulQPJuRNXkWTjLZqQ-1; Mon, 27 Apr 2020 14:31:18 -0400
X-MC-Unique: KGfTqulQPJuRNXkWTjLZqQ-1
Received: by mail-wm1-f71.google.com with SMTP id 14so216836wmo.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2020 11:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=67Uxs+jqDkywiXxN1nmtevKGJBAFvPYU5lLkyapeJkg=;
        b=fh+Uwn1/7tMTy6+OsfvuP3yiVGjuipEIERC8Qy+TZqRXko9D4OYwADjIExXt5i3Dqa
         l47PaLHkwqArgNjYZYdQhWnEXytqYUBf/YtpElTz4gRkot3idrqzxHfSqleipYjPbWW0
         GGPCRqwyEpjZEvz5tXbGvbFM480cATm1UQyK0/A1G09gjW8/7unRKGRs3sGrklX02P8J
         qM41RTsW50SPaQoeDX4as+msBnxRXaizG8U4Pwuo0sgZUecUYwxx/BcEJRBFnbj1FbKg
         WX9Rwb2j9kW53XCe/TBAO9MiCXyliX3Pdds2tL5BNyFgdAaOab7UGSZAFb92dG5jvcvq
         qMgQ==
X-Gm-Message-State: AGi0PuZMFIWnpfS1ckPV8IWcxmSmUDqA1ageFBk22fXIO0NgApkbHavt
        Lq6Zg9lU3qBiIGcPVetiTgLuTdkRzwnEHgSX3YO1NEnCRk5P/1JjmJYYfV76loC/PNDGfCE1krm
        /vObMAnqc41Buk+RyCVIHssE5jOZB0mUaMQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr11526wmc.142.1588012277605;
        Mon, 27 Apr 2020 11:31:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLDZ6UDRoixaGgcsBYLrYO4VdkGWby2stovmM2K2nsk1XEjrdC+pETwdndY4ihaTUL4Vn38vg==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr11509wmc.142.1588012277341;
        Mon, 27 Apr 2020 11:31:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id 5sm16234565wmg.34.2020.04.27.11.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 11:31:16 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/8] iio: light: cm32181: Handle ACPI instantiating a
 cm32181 client on the SMBus ARA
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200427155037.218390-1-hdegoede@redhat.com>
 <20200427155037.218390-3-hdegoede@redhat.com>
Message-ID: <2dae8c05-c84c-3caf-f84a-34615183ab01@redhat.com>
Date:   Mon, 27 Apr 2020 20:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200427155037.218390-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 4/27/20 5:50 PM, Hans de Goede wrote:
> Some ACPI systems list 2 I2C resources for the CM3218 sensor. On these
> systems the first I2cSerialBus ACPI-resource points to the SMBus Alert
> Response Address (ARA, 0x0c) and the second I2cSerialBus ACPI-resource
> points to the actual CM3218 sensor address.
> 
>  From the ACPI/x86 side devices with more then 1 I2cSerialBus ACPI-resource
> are handled by the drivers/platform/x86/i2c-multi-instantiate.c code.
> This code will instantiate "cm32181" i2c_client-s for both resources.
> 
> Add a check to cm32181_probe() for the client's address being the ARA
> address, and in that case fail the probe with -ENODEV.
> 
> On these ACPI systems the sensor may have a SMBus Alert asserted at boot,
> if this is the case the sensor will not respond to any i2c_transfers on
> its actual address until we read from the ARA register to clear the Alert.
> 
> Therefor we must (try to) read a byte from the client with the ARA
> register, before returning -ENODEV, so that we clear the Alert and when
> we get called again for the client instantiated for the second
> I2cSerialBus ACPI-resource the sensor will respond to our i2c-transfers.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

So this assumes that i2c-multi-inst will be used for ACPI
CPLM3218 device nodes and we get 2 separate i2c_clients for
the ARA, resp. the real address. This has been discussed on the
linux-acpi list and the conclusion is that that instanting 2
full i2c_clients is not the right solution.

Instead the cm32181 driver should create a "dummy" client
for the second address (which is part of the same chip)
itself, using an acpi version of i2c_new_dummy_device() or
i2c_new_ancillary_device()

I will prepare a v3
of this series with a better solution.

Regards,

Hans



> ---
> Changes in v2
> - s/i2c_client-s/I2C clients/ in added comment
> ---
>   drivers/iio/light/cm32181.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index fd371b36c7b3..4c26a4a8a070 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -51,6 +51,8 @@
>   #define CM32181_CALIBSCALE_RESOLUTION	1000
>   #define MLUX_PER_LUX			1000
>   
> +#define SMBUS_ALERT_RESPONSE_ADDRESS	0x0c
> +
>   static const u8 cm32181_reg[CM32181_CONF_REG_NUM] = {
>   	CM32181_REG_ADDR_CMD,
>   };
> @@ -333,6 +335,20 @@ static int cm32181_probe(struct i2c_client *client,
>   	struct iio_dev *indio_dev;
>   	int ret;
>   
> +	/*
> +	 * Some ACPI systems list 2 I2C resources for the CM3218 sensor, the
> +	 * SMBus Alert Response Address (ARA, 0x0c) and the actual I2C address.
> +	 * drivers/platform/x86/i2c-multi-instantiate.c instantiates "cm32181"
> +	 * I2C clients for both resources, ignore the ARA client.
> +	 * On these systems the sensor may have a SMBus Alert asserted at boot,
> +	 * in that case the ARA must be read to clear the Alert otherwise the
> +	 * sensor will not respond on its actual I2C address.
> +	 */
> +	if (client->addr == SMBUS_ALERT_RESPONSE_ADDRESS) {
> +		i2c_smbus_read_byte(client);
> +		return -ENODEV;
> +	}
> +
>   	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*cm32181));
>   	if (!indio_dev) {
>   		dev_err(&client->dev, "devm_iio_device_alloc failed\n");
> 


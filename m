Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248A27F132F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Nov 2023 13:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbjKTMZ1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Nov 2023 07:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbjKTMZ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 07:25:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0621AD2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 04:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700483121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SBUze4Br3/h3ENFWEagU3cqYBL/h55Cp7994NDkXm2g=;
        b=Yb+lqtJgwo/KC3aMgyZ8NqRfhjA8ySWOnq1ihdYYCPERDRu0f1yjDDm1x6O0Ad5cgutd0q
        T7xUkjtx/oHXfgS8xnVm6N1jVKEurMmxoWXoAPdSkWHQpc/K9tDUmIl8OTx+NgNAM92l2h
        rp0j1xEsZjFo5ZBuv18hJDNefWv9dZc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-rCSzZFhlPDWcX5vcoo6Eag-1; Mon, 20 Nov 2023 07:25:20 -0500
X-MC-Unique: rCSzZFhlPDWcX5vcoo6Eag-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5444a9232a9so3275187a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 04:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700483119; x=1701087919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUze4Br3/h3ENFWEagU3cqYBL/h55Cp7994NDkXm2g=;
        b=h8RrvvMu7AgR8eiYN8r56mZaPjvBLPz1gTanwBwjZy8fuJEHaK540a0HjR6LxKQNfS
         m7Fdsjyd6vt1IqhqJrcncxj8pwqOt25W867+w5x3sf5a2wY4xAE69D88cEPjC7ro5Wtl
         q3pW/2SIbqw+xtWecftwBReQ9UsTD9VqRBHKp53qhbLlmT/VlbfnZF1uuIs3jBjJLvyd
         upbQyemwAqna4JjdM9/A2ICJrPlmUGCB6qKMyeRalnp+jw4AbtUmP0XfS5SP88+8ZvkK
         W3VGAPjqlchvI+nsacHO/lFgRyAeXS+zFIpQcwNiRDPoXFavUv4Bh3f9rUIr6Xi2chWy
         NNqg==
X-Gm-Message-State: AOJu0YyU3Tm7P8FItkqOEYjPavLlHnWMMOO9+rHOgbsSGlp9JtTFGd0D
        LJ8yjFYxjVmExnjuj5jN0jK5Q7+CONAX2Sfw61c1dnRI3kr3RJOPAKiRZvepE0xpfqg1LuwcRRz
        sIEqgIl6C3kpEx5S3Pj3K2qakgmnFPfnNbg==
X-Received: by 2002:a05:6402:42c7:b0:53f:bab5:1949 with SMTP id i7-20020a05640242c700b0053fbab51949mr6286472edc.12.1700483119311;
        Mon, 20 Nov 2023 04:25:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKFrVIwqRbrGAZFq9EclcZRxWlr5WL2EMV/hTWmOrYYQF5I7StcjCYVKlVy0rGTPS6aIs3fA==
X-Received: by 2002:a05:6402:42c7:b0:53f:bab5:1949 with SMTP id i7-20020a05640242c700b0053fbab51949mr6286455edc.12.1700483118901;
        Mon, 20 Nov 2023 04:25:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j19-20020aa7ca53000000b005488ae52752sm1921822edt.18.2023.11.20.04.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 04:25:18 -0800 (PST)
Message-ID: <e2448c2c-db08-47d4-b859-d1f063b1cc7a@redhat.com>
Date:   Mon, 20 Nov 2023 13:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ACPI: scan: Add LNXVIDEO HID to
 ignore_serial_bus_ids[]
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <20231104205828.63139-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231104205828.63139-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 11/4/23 21:58, Hans de Goede wrote:
> The I2C-core already has filtering to skip i2c_client instantiation for
> LNXVIDEO acpi_device-s with I2cSerialBus resources, since LNXVIDEO devices
> are not i2c_client-s and are handled by the acpi_video driver.
> 
> This filtering was added to i2c-core-acpi.c in commit 3a4991a9864c ("i2c:
> acpi: Do not create i2c-clients for LNXVIDEO ACPI devices").
> 
> Now a similar problem has shown up where the SPI-core is instantiating
> an unwanted SPI-device for a SpiSerialBus resource under a LNXVIDEO
> acpi_device. On a Lenovo Yoga Tab 3 YT3-X90F this unwanted SPI-device
> instanstantiation causes the SPI-device instanstantiation for the WM5102
> audio codec to fail with:
> 
> [   21.988441] pxa2xx-spi 8086228E:00: chipselect 0 already in use
> 
> Instead of duplicating the I2C-core filtering in the SPI-core code, push
> the filtering of SerialBus resources under LNXVIDEO acpi_device-s up into
> the ACPI-core by adding the LNXVIDEO HID to ignore_serial_bus_ids[].
> 
> Note the filtering in the I2C-core i2c_acpi_do_lookup() function is still
> necessary because this not only impacts i2c_client instantiation but it
> also makes the I2C-core ignore the I2cSerialBus resource when checking what
> the maximum speed is the I2C bus supports, which is still necessary.
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/acpi/scan.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 691d4b7686ee..4b6faa2350f5 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1727,6 +1727,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  	 * Some ACPI devs contain SerialBus resources even though they are not
>  	 * attached to a serial bus at all.
>  	 */
> +		{ACPI_VIDEO_HID, },
>  		{"MSHW0028", },
>  	/*
>  	 * HIDs of device with an UartSerialBusV2 resource for which userspace


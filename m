Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9C047088E
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Dec 2021 19:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbhLJS00 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Dec 2021 13:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54936 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231716AbhLJS00 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Dec 2021 13:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639160570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nZEdGnstxQ8PoTabR6E6wRag+oPqL+RCSE7JPAUHZTU=;
        b=ekoEHwa0TuOrQ5vnyq1bIQIEO7gbyMww9VEkh0bKPi9jMRqIp39HV3CVvzlACeBIrJmkWN
        plDhQg5k0GmDyb1GP8KrCeyJZgo41jgg+OHI/Bt3pnA1+PjH+em19oK4Tpztv03MXVo5dD
        E20XcsJ443LTnoCCPBDgcEsRz7Bj/vQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-FB834t8dOMK-Qb5f2XrGrQ-1; Fri, 10 Dec 2021 13:22:49 -0500
X-MC-Unique: FB834t8dOMK-Qb5f2XrGrQ-1
Received: by mail-wr1-f71.google.com with SMTP id q5-20020a5d5745000000b00178abb72486so2613781wrw.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Dec 2021 10:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nZEdGnstxQ8PoTabR6E6wRag+oPqL+RCSE7JPAUHZTU=;
        b=Amq2Lq9gRK+0VX4CoFnxLYrK+CMgodJr9NaBDFUEX7B+xzjVrVgiKd75hRIrH3izJZ
         nj9LfUvbQtjvpKs+GTN3PJHlRT8Tc2RdGQ1i7yddTxBigLG8ncK+m5LvJimVGDvbGaMx
         LQstNVgqGEwqx1QjeuD3R/grPoRhi312t//MuQDsDSPJBfOpkvTfxiCEo0JdlOB22sU/
         xLJzKCAbJB8oFcSYFDSpRLmf8cGGk4cKOHoajCknU7BQn36PZePqUU8UOeRd4V8D/ENv
         nErAEVaF/f3ZS4oYjU41XSbHpu0G9gh7VQnApYeZWoIbWWK9QC8x04urbyaVjMd7Vcem
         A7Cg==
X-Gm-Message-State: AOAM5300ILeXfFUl2L1N126yzkgUdqZs7eow+utP2+e/Z/mN4c2wctPK
        k5aiDXYsujCp2U+Wt9s1JhpcUWt5RdOLNrevu/A8ao92d85X938f/fn8NuZWEKJISedth5ikYHF
        mqpONb3TXoVMCvmqedNQVFIxQWssmmqOb7A==
X-Received: by 2002:adf:eac4:: with SMTP id o4mr713922wrn.690.1639160568185;
        Fri, 10 Dec 2021 10:22:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6nhHXYerqIXAuvpATTJJeDQXMUHYl68D08WgHnAzNZ7gCdpfn4qi7oHPJKgkEEBsrCS8LsQ==
X-Received: by 2002:adf:eac4:: with SMTP id o4mr713883wrn.690.1639160567889;
        Fri, 10 Dec 2021 10:22:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a1sm4209149wri.89.2021.12.10.10.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 10:22:47 -0800 (PST)
Message-ID: <628226e2-6e1c-a05d-fc00-82c7496da38d@redhat.com>
Date:   Fri, 10 Dec 2021 19:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] spi: Revert "spi: Remove unused function
 spi_busnum_to_master()"
Content-Language: en-US
To:     Lucas tanure <tanureal@opensource.cirrus.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Cc:     Mark Brown <broonie@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20211202162421.7628-1-sbinding@opensource.cirrus.com>
 <Yan6JVpS50keP2Pl@smile.fi.intel.com>
 <a1f546c2-5c63-573a-c032-603c792f3f7c@redhat.com>
 <85e9e11d-a4fc-44a9-55c2-3a4d2de7769d@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <85e9e11d-a4fc-44a9-55c2-3a4d2de7769d@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/10/21 19:10, Lucas tanure wrote:
> On 12/3/21 11:14, Hans de Goede wrote:
>> Hi,
>>
>> On 12/3/21 12:06, Andy Shevchenko wrote:
>>> On Thu, Dec 02, 2021 at 04:24:19PM +0000, Stefan Binding wrote:
>>>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>>
>>>> Revert commit bdc7ca008e1f ("spi: Remove unused function
>>>> spi_busnum_to_master()")
>>>> This function is needed for the spi version of i2c multi
>>>> instantiate driver.
>>>
>>> I understand the intention, but I have no clue from this series (it lacks of
>>> proper cover letter, it lacks of much better and justified commit message in
>>> the patch 3) what is the actual issue. Without these to be provided it's no go
>>> for the series. Please, provide much better description what is the actual
>>> issue you are trying to solve (from patch 3 my guts telling me that this can
>>> be achieved differently without this code being involved).
>>
>> Yes I assume that eventually there will be a follow-up which will
>> actually add some new ACPI HIDs to the new bus-multi-instantiate.c file ?
>>
> Yes, we are developing an HDA sound driver for the HID CSC3551,
> which is used for laptops that use SPI or I2C.
> And in that series is where we plan to put a patch to add that HID.
> 
>> Can we please have (some of) those patches as part of the next
>> version, so that we can see how you will actually use this?
> The series is this one https://lkml.org/lkml/2021/11/23/723, but
> the SPI HID was not ready to be sent in that version, but will be
> part of the next submission.
> 
>>
>> Also I'm wondering is this actually about ACPI device's having multiple
>> SpiSerialBusV2 resources in a single _CRS resource list ?
> yes, a single _CRS with 2 or 4 SpiSerialBusV2 inside.
> 
>>
>> Or do you plan to use this for devices with only a single
>> I2cSerialBusV2 or SpiSerialBusV2 resource to e.g. share IRQ lookup
>> code between the 2 cases ?
> No, the minimum number SpiSerialBusV2 or I2cSerialBusV2 inside the
> _CRS is two.
> 
>>
>> If you plan to use this for devices with only a single
>> I2cSerialBusV2 or SpiSerialBusV2 resource, then I'm going to have to
>> nack this.
>>
>> Each ACPI HID which needs to be handled in this code also needs an
>> entry in the i2c_multi_instantiate_ids[] list in drivers/acpi/scan.c
>> which is code which ends up loaded on every single ACPI system, so
>> we really only want to add HIDs there for the special case of having
>> multiple I2cSerialBusV2 or SpiSerialBusV2 resources in a single
>> ACPI Device / ACPI fwnode.
>>
>> If you are looking to use this as a way to share code for other reasons
>> (which is a good goal to strive for!) please find another way, such
>> as e.g. adding some helper functions to drivers/gpio/gpiolib-acpi.c
>> (note there already are a couple of helpers there which you may use).
> No, we only want to multi instantiate SPI or I2C devices from a single _CRS.

Ok, that is fine, thank you for clarifying things.

Regards,

Hans


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE474675FA
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Dec 2021 12:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380310AbhLCLR5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Dec 2021 06:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30294 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380305AbhLCLR4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Dec 2021 06:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638530072;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QkzbCStca4hNYmo0e9TkCL4ZSJm7vJBNxNGPGTXnbPU=;
        b=abWqjoUUiP3b1zl+QH3bj5+k0ol3+6TMEyCAQcRx8iwqeC2d1pW/+LI8BNlgQ/KyFwIdhe
        WqkAownePZVwGn0uwddH5TsOXuQpVFq01G2ZzS7/hAu38bxaFdYpe9Y/tdDTeocMI57rA+
        NUHAUZ9jq4zYadBIKhJqwULUXXsByac=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123--n0gkF60M0a57V4Lr1pL-w-1; Fri, 03 Dec 2021 06:14:30 -0500
X-MC-Unique: -n0gkF60M0a57V4Lr1pL-w-1
Received: by mail-ed1-f69.google.com with SMTP id v1-20020aa7cd41000000b003e80973378aso2266287edw.14
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Dec 2021 03:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QkzbCStca4hNYmo0e9TkCL4ZSJm7vJBNxNGPGTXnbPU=;
        b=L5PlKRRRctYa0ds1Liz3v2w4PBcfgwDv66oqARU5OvFuIoqf2tX///ZW0oCZJdvv0+
         euq2hcUxHhdHh+H7uO6cgKmHr1BWdE3JeSw9w5/7ZmVdJkCvpfEKVMp4mDtTXOXwMoJw
         Lb8vVAvb9TLWzwOtk35W4nHvYWmyzJd1axFM8kVePODMPxVeycCoR1I2FR7S5CJuQeiR
         qM3D0jc1YcPyqUgG23ixSA13/pqyqyf+o57GLkeCSGgOgB+bYVMH5kABYvYLc3cGjHMx
         spTRpKzPZUPrey3k0ck6O8nvTvqhqZAcxkNEXmZKbh7CsgQK3ep9xLbRurfco87bynJi
         insA==
X-Gm-Message-State: AOAM5306OLEt2Ui7aYWSA0Jq8jamz6mwKk9dXALOPeWqr3Cv/ITR/6dH
        V8wXFxbUZiSZoIsiDdXFHFGyC7p6synNH3flqTPtJqTqGsx3ky7cfto3UeCOgbLSWL6VcH4+WyE
        4n0aKDh8iqRpDrrVZlj749D0B1a7pmeVqvw==
X-Received: by 2002:a50:d49d:: with SMTP id s29mr25605740edi.55.1638530069762;
        Fri, 03 Dec 2021 03:14:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhFZCEpKOOhtBu3/bixz8Mpj8tiuA/KCe5gzSlthPY4klqcLCd4BDpFiU7X/6QsKzywNJoVg==
X-Received: by 2002:a50:d49d:: with SMTP id s29mr25605713edi.55.1638530069563;
        Fri, 03 Dec 2021 03:14:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c11sm1851940ede.32.2021.12.03.03.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 03:14:29 -0800 (PST)
Message-ID: <a1f546c2-5c63-573a-c032-603c792f3f7c@redhat.com>
Date:   Fri, 3 Dec 2021 12:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] spi: Revert "spi: Remove unused function
 spi_busnum_to_master()"
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Cc:     Mark Brown <broonie@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@opensource.cirrus.com,
        Lucas Tanure <tanureal@opensource.cirrus.com>
References: <20211202162421.7628-1-sbinding@opensource.cirrus.com>
 <Yan6JVpS50keP2Pl@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yan6JVpS50keP2Pl@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/3/21 12:06, Andy Shevchenko wrote:
> On Thu, Dec 02, 2021 at 04:24:19PM +0000, Stefan Binding wrote:
>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>
>> Revert commit bdc7ca008e1f ("spi: Remove unused function
>> spi_busnum_to_master()")
>> This function is needed for the spi version of i2c multi
>> instantiate driver.
> 
> I understand the intention, but I have no clue from this series (it lacks of
> proper cover letter, it lacks of much better and justified commit message in
> the patch 3) what is the actual issue. Without these to be provided it's no go
> for the series. Please, provide much better description what is the actual
> issue you are trying to solve (from patch 3 my guts telling me that this can
> be achieved differently without this code being involved).

Yes I assume that eventually there will be a follow-up which will
actually add some new ACPI HIDs to the new bus-multi-instantiate.c file ?

Can we please have (some of) those patches as part of the next
version, so that we can see how you will actually use this?

Also I'm wondering is this actually about ACPI device's having multiple
SpiSerialBusV2 resources in a single _CRS resource list ?

Or do you plan to use this for devices with only a single
I2cSerialBusV2 or SpiSerialBusV2 resource to e.g. share IRQ lookup
code between the 2 cases ?

If you plan to use this for devices with only a single
I2cSerialBusV2 or SpiSerialBusV2 resource, then I'm going to have to
nack this.

Each ACPI HID which needs to be handled in this code also needs an
entry in the i2c_multi_instantiate_ids[] list in drivers/acpi/scan.c
which is code which ends up loaded on every single ACPI system, so
we really only want to add HIDs there for the special case of having
multiple I2cSerialBusV2 or SpiSerialBusV2 resources in a single
ACPI Device / ACPI fwnode.

If you are looking to use this as a way to share code for other reasons
(which is a good goal to strive for!) please find another way, such
as e.g. adding some helper functions to drivers/gpio/gpiolib-acpi.c
(note there already are a couple of helpers there which you may use).

Regards,

Hans


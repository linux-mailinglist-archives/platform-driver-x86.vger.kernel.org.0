Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92F5428C44
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Oct 2021 13:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbhJKLpr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 Oct 2021 07:45:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21357 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234399AbhJKLpp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 07:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633952624;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sLERr4wwqXS0zpFcNWBnvOvmmDhWW73fjpWHdhZQYhI=;
        b=Nl7C079gA4K0aKVX3UIKYhoMQ/fshtvJBW1YH6viejuSFVir9Q031jWLSlQvaGHczaTFF9
        0qUqKNYupT5U3vuyMUBSI3yU2O1+7vEoY/X++zU4Oq1VHXvo9yLbCBKt+yuSyMwzBdJPBR
        +iIG6WjfiwPJTIVaHJa3q/orfwVDY/0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-dWJJPLPVM12i2Ep2jc1rhA-1; Mon, 11 Oct 2021 07:43:43 -0400
X-MC-Unique: dWJJPLPVM12i2Ep2jc1rhA-1
Received: by mail-ed1-f71.google.com with SMTP id p20-20020a50cd94000000b003db23619472so15655340edi.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 04:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sLERr4wwqXS0zpFcNWBnvOvmmDhWW73fjpWHdhZQYhI=;
        b=CjwBRkFdPlww3yDODtLuJ7PjbKGCDZwPPLFZq+a8qc0kv3ZyzSH/hML/ib0lcmRHca
         krv4cyR353X16B5PWshitDsoFaJxizJA+mf315+P13byC/0l2FcfZyRI3yzV7VuXc91n
         G0xEo2n38rJplp7ADnwMyQe4mZDexQiQTI2M3+LqVuzQs2oQBRHUqX7sOWSBiwrnb29X
         0JmfJ0OruuY9jUfIWEthERsvYeiLJendpAtwZJfDasMYMzgQEdWR88n1i+XAz/kuxSSP
         tswMCnZUvTg8qSlM6vxC/jI50RsWKpR18k/36gM6DNhNRJv5xGV89OWLtkIp99VfAtYv
         0MdQ==
X-Gm-Message-State: AOAM530o7J6S8SHBb5HJGLgPpZMqqMkMt6PE0ttx7k/rncCgwzBRZPCw
        TjosvrmHmen/CwKE0RRFyvmQ5SEyhoCwKhQOYkxYlTgIDgSUAAfbzLtLMj97wUE9wBMjBH6i5Ej
        alI1c/OXuDbE3u5ltvUTwq9M6fdh4k/9yOQ==
X-Received: by 2002:a50:e142:: with SMTP id i2mr39787469edl.107.1633952621876;
        Mon, 11 Oct 2021 04:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoBMlYivGscv/CpFZXt+Isxb/TUwR/lh7DEa3/tPor+O3a4b49kIUWc1t55oZdKq8JCUSS4w==
X-Received: by 2002:a50:e142:: with SMTP id i2mr39787430edl.107.1633952621702;
        Mon, 11 Oct 2021 04:43:41 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id g9sm3400631ejo.60.2021.10.11.04.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 04:43:41 -0700 (PDT)
Subject: Re: [PATCH 05/12] regulator: Introduce tps68470-regulator driver
To:     Mark Brown <broonie@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211008162121.6628-1-hdegoede@redhat.com>
 <20211008162121.6628-6-hdegoede@redhat.com> <YWQU/SYTT5Vk24XH@sirena.org.uk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f6f2d7e8-fdb8-ed64-0cdd-65aded9fc42c@redhat.com>
Date:   Mon, 11 Oct 2021 13:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWQU/SYTT5Vk24XH@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/11/21 12:42 PM, Mark Brown wrote:
> On Fri, Oct 08, 2021 at 06:21:14PM +0200, Hans de Goede wrote:
> 
>> +++ b/drivers/regulator/tps68470-regulator.c
>> @@ -0,0 +1,194 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Regulator driver for TPS68470 PMIC
>> + *
> 
> Please make the entire comment a C++ one so things look more
> intentional.

Ok, will do so for the next version.


>> +
>> +/*
>> + * The ACPI tps68470 probe-ordering depends on the clk/gpio/regulator drivers
>> + * being registered before the MFD cells are created (the MFD driver calls
>> + * acpi_dev_clear_dependencies() after the cell creation).
>> + * subsys_initcall() ensures this when the drivers are builtin.
>> + */
>> +static int __init tps68470_regulator_init(void)
>> +{
>> +	return platform_driver_register(&tps68470_regulator_driver);
>> +}
>> +subsys_initcall(tps68470_regulator_init);
> 
> If this is actually required then the driver is broken for modular use
> which frankly is just generally broken.  I don't understand why this
> driver would require this when other drivers don't, or what the actual
> requirement is here - what does the call do and why is the ordering
> important?

For the camera-sensor which is a consumer of this devices to be able
to get the regulators (and not end up with a dummy regulator) the
consumer info added through the constraints passed as platform data
must be available to the regulator framework before the sensor-driver's
probe() method tries to get the regulators.

The ACPI fwnode describing the sensor has an ACPI _DEP dependency on
the ACPI fwnode describing the PMIC. To ensure that the PMIC driver
binds first patches 1 + 2 of this series make the ACPI code use this
dependency to not instantiate the i2c-client for the sensor until
the PMIC driver has bound.

The PMIC driver is a MFD driver creating GPIO, clk and regulator
MFD cells. So in order for the ACPI code delaying the instantiation
to help, the regulator constraints / consumer info must be registered
when the MFD driver is done binding. This means that the regulator
driver for the regulator MFD cells must be registered before the
platform_dev-s for the cell is instantiated, so that the driver
binds immediately (during instantiation) and thus the regulator
consumer info is available before the PMIC-MFD-driver's probe()
method is done.

The use of a subsys_initcall() here ensures that when builtin
the regulator driver is registered before the PMIC-MFD-driver
is registered (the PMIC driver uses a normal device_initcall).

To make this work when everything is build as a module patch 12/12
adds the following to the PMIC-MFD-driver:

MODULE_SOFTDEP("pre: clk-tps68470 tps68470-regulator");

This will make modprobe load the clk and regulator drivers
before it loads the main/MFD tps68470 driver.

I've tested this with everything built as module (the typical
setup for standard x86 setups) and without the MODULE_SOFTDEP
the sensor driver ends up with a dummy regulator (illustrating
the problem) and with the SOFTDEP in place everything works
as it should.

I hope this helps explain things.

Regards,

Hans


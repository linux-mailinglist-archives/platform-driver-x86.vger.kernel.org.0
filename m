Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5144419EA
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 Nov 2021 11:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhKAKeC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 1 Nov 2021 06:34:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59175 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231936AbhKAKeB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 06:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635762688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dp8l/RCsxjlz7Zk0ZyfQ5HSkUFJxSL+4S21cue4eFb8=;
        b=cpyIiBQbFwj/YIIR5WmHwh4OdbbGUJcV16fS4yXLsb229aUk1ykgh/v4DsiZBc4gFpzRz/
        AuJjTEBsXsbki1Ub1donz6fkSFMVdRFnVIyN+jIPSYv8N9y05AHks1OhY0wQCySH58+PdF
        LaMguBOlbUgN1YagJSYz/Y8ip55XIds=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-299KyDqIM_SFeUSxoqmztw-1; Mon, 01 Nov 2021 06:31:27 -0400
X-MC-Unique: 299KyDqIM_SFeUSxoqmztw-1
Received: by mail-ed1-f72.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso15064155edj.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Nov 2021 03:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dp8l/RCsxjlz7Zk0ZyfQ5HSkUFJxSL+4S21cue4eFb8=;
        b=wYPa5xhi2lJpILjJaeetlR/JIGfYoBh/9TZSrXsPBlJ8qhsbVdvCanpQ44XuOg4ejZ
         UTUq4cSK5bcsTKN9z+zlfN40q2/T8yQUq3GvJbNTq1OKkOhWs1uWae66jav4lm47rJzX
         +IS04+XJypGUdTTPqe3jerx62pPj33DAUbIer0kCEzTP1g/40PT9ZEwKCp/SDS/Cq+36
         0eJtQRNPlt/fAKhkmy09sIMCaYwkF23pKCp/KFUS9ix96Lxf3JLcCStYZPOpGxc0xGq2
         /1kSQZYMiWpEs6ZcEEAU7pTgaCn+GO3ENEag7ED0QjaW08DI4zEBji5U8eep0suEa1NK
         Qp1Q==
X-Gm-Message-State: AOAM532yvZKOsmtho7DK3jdH921MqLWe41vhLsMLPFGcjm9bYMns38i6
        qtDF9IRs6VKdznrAlLNJXuLGNiCdHZ7eTXcH02Sp9N3Uddy/3P2vDYd1h6KI6eqWucCv7fBvBlP
        YpNHKMqvV0osbzxyiy8DYKAkBwuZvdoDoHQ==
X-Received: by 2002:aa7:c158:: with SMTP id r24mr24743085edp.65.1635762686392;
        Mon, 01 Nov 2021 03:31:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa7LV21EyQYFUAKgymc9bpXOYimSIdWdyjMthwHi/ngQYC/LDQgfr3s2AHIBJ3JsdSa+W3bQ==
X-Received: by 2002:aa7:c158:: with SMTP id r24mr24743063edp.65.1635762686258;
        Mon, 01 Nov 2021 03:31:26 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id dp8sm7011007ejc.83.2021.11.01.03.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 03:31:25 -0700 (PDT)
Message-ID: <8804fa29-d0d9-14a9-e48e-268113a79d07@redhat.com>
Date:   Mon, 1 Nov 2021 11:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 08/11] platform/x86: int3472: Add
 get_sensor_adev_and_name() helper
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-9-hdegoede@redhat.com>
 <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/25/21 13:31, Andy Shevchenko wrote:
> On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The discrete.c code is not the only code which needs to lookup the
>> acpi_device and device-name for the sensor for which the INT3472
>> ACPI-device is a GPIO/clk/regulator provider.
>>
>> The tps68470.c code also needs this functionality, so factor this
>> out into a new get_sensor_adev_and_name() helper.
> 
> ...
> 
>> +int skl_int3472_get_sensor_adev_and_name(struct device *dev,
>> +                                        struct acpi_device **sensor_adev_ret,
>> +                                        const char **name_ret)
>> +{
>> +       struct acpi_device *adev = ACPI_COMPANION(dev);
>> +       struct acpi_device *sensor;
>> +       int ret = 0;
>> +
>> +       sensor = acpi_dev_get_first_consumer_dev(adev);
>> +       if (!sensor) {
>> +               dev_err(dev, "INT3472 seems to have no dependents.\n");
>> +               return -ENODEV;
>> +       }
>> +
>> +       *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
>> +                                  acpi_dev_name(sensor));
>> +       if (!*name_ret)
>> +               ret = -ENOMEM;
>> +
>> +       if (ret == 0 && sensor_adev_ret)
>> +               *sensor_adev_ret = sensor;
>> +       else
>> +               acpi_dev_put(sensor);
>> +
>> +       return ret;
> 
> The error path is twisted a bit including far staying ret=0 assignment.
> 
> Can it be
> 
>        int ret;
>        ...
>        *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
>                                   acpi_dev_name(sensor));
>        if (!*name_ret) {
>                acpi_dev_put(sensor);
>                return -ENOMEM;
>        }
> 
>        if (sensor_adev_ret)
>                *sensor_adev_ret = sensor;
> 
>        return 0;
> 
> ?

That misses an acpi_dev_put(sensor) when sensor_adev_ret == NULL.

Regards,

Hans


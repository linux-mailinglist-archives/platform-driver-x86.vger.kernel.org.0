Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78AD6443105
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Nov 2021 15:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbhKBPCW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Nov 2021 11:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39057 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233658AbhKBPCU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 11:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635865185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s2qlvsp2B/ajzGnaxNanhBYqk1Fo8lMuMvQWyew1YE4=;
        b=R5MDtdtCnUXB4MhBXt08sdLBchpzq9Jqrl98/HHZ0PkgCpUWJ9HkK5q98I96+Z39SpzWER
        VGlAETlFqnqWx2ao+NYjTQrVUXzlaVxXSscdMvDFhr+YMrlhvq9mLZ7wJFPTLgBPdUap/i
        1ktqiv5Wmvbr6hgXrhuzeqeNskUDPK0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-BCoiVEfXOEuusJGoVK_r4g-1; Tue, 02 Nov 2021 10:59:44 -0400
X-MC-Unique: BCoiVEfXOEuusJGoVK_r4g-1
Received: by mail-ed1-f69.google.com with SMTP id w26-20020a056402071a00b003e28a389d04so6798090edx.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Nov 2021 07:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s2qlvsp2B/ajzGnaxNanhBYqk1Fo8lMuMvQWyew1YE4=;
        b=SrUVI1fieuLc1m2Yk9InzQ4dCMqfQAOuGlAMrk3V/sEsnxsAjhvaqOhe1MRE95t2ZG
         1LlbOCdTvz3utWVbpHRU+nWo/QOAPLRvZm7Z7ktLiWZwhVlQ4oqmBg27BtcYbCxzffI0
         FKxSdEqPTzPzg8wfXBJGh8rCKANMpmqixJNI2If+Yl8zEXxaT+m+atZuEkwVBQpes+i5
         6v2qbA7OWCSsBD3Zmxjq4wUF+phlQGrxZkDuAZLBaCPCHObIjWgnk5E8SyPphlVsB0uQ
         24dbPtG8vtzx5T9HuveVFb8xQ7GDPqKi630cgD3wErB+XnjIcb96Cdg/mCHQaaBlC0mA
         1qtg==
X-Gm-Message-State: AOAM530EVAYtxGjkAqgLvw0OVtY+25lFx2XcUNFohRGveMMFY/zQxFQf
        1So4xo3pswgCBfLncMPB/N3mHUWAEwnUE3nq/XHD6BU4AWKoQixRtcCuU6mO4/ALFRlUCh0Rm3E
        k6afi2/QKvkblFwGjP9+GimrpB4F8UcXEng==
X-Received: by 2002:a17:906:c283:: with SMTP id r3mr25294499ejz.138.1635865183301;
        Tue, 02 Nov 2021 07:59:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKFQbu2utF1Nmvh8J5nGyiXWxLqQwUpuqFEbRaoqq44byXxZI0wBMOszsSdo8mNls2SFQ1cw==
X-Received: by 2002:a17:906:c283:: with SMTP id r3mr25294449ejz.138.1635865183026;
        Tue, 02 Nov 2021 07:59:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bm2sm9241694edb.39.2021.11.02.07.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 07:59:42 -0700 (PDT)
Message-ID: <1f4377bb-2902-05e9-95c7-ad924477b543@redhat.com>
Date:   Tue, 2 Nov 2021 15:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 10/11] platform/x86: int3472: Pass
 tps68470_regulator_platform_data to the tps68470-regulator MFD-cell
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
References: <20211102094907.31271-1-hdegoede@redhat.com>
 <20211102094907.31271-11-hdegoede@redhat.com>
 <CAHp75Vd-xY43H8jPOUqJp55Rq3Wuhsdzctfhqq300S0vAKTzpw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd-xY43H8jPOUqJp55Rq3Wuhsdzctfhqq300S0vAKTzpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/2/21 15:34, Andy Shevchenko wrote:
> On Tue, Nov 2, 2021 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Pass tps68470_regulator_platform_data to the tps68470-regulator
>> MFD-cell, specifying the voltages of the various regulators and
>> tying the regulators to the sensor supplies so that sensors which use
>> the TPS68470 can find their regulators.
>>
>> Since the voltages and supply connections are board-specific, this
>> introduces a DMI matches int3472_tps68470_board_data struct which
>> contains the necessary per-board info.
>>
>> This per-board info also includes GPIO lookup information for the
>> sensor IO lines which may be connected to the tps68470 GPIOs.
> 
> ...
> 
>> +               board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>> +               if (!board_data) {
>> +                       dev_err(&client->dev, "No board-data found for this laptop/tablet model\n");
>> +                       return -ENODEV;
> 
> It's fine to use dev_err_probe() for known error codes.
> 
>> +               }
> 
> ...
> 
>> +               cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> 
> Do we need casting?

Yes, the cast casts away a "const", the const is correct
since the data only ever gets read by the regulator driver,
but platform_data pointers are normally not const, so it
is either the cast, or loose the const on the definition
of the struct to which board_data->tps68470_regulator_pdata
points...

So not good choice here really, only chosing between bad
options and I picked the lets do the cast "least worse"
option (at least to me). I'm open to changing this.



> ...
> 
>> +#include <linux/dmi.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/platform_data/tps68470.h>
>> +#include <linux/regulator/machine.h>
> 
> string.h  for strcmp() ?
> kernel.h for ARRAY_SIZE() ?

Ack.

Regards,

Hans



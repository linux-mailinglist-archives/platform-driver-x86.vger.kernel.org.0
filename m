Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09EE44339B
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Nov 2021 17:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbhKBQto (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Nov 2021 12:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59012 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234685AbhKBQto (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 12:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635871628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OXCcgVDujHkdu74YmEm/6uZxSbK6QTtbfJnMu16uuZU=;
        b=hgaFsWGpl073kSM7zs0J6RIyNgrUoIZOtWxnxxV+pwq2kUlSeXihoak9vycHUtuIZayYpl
        3z0RRwqlJMe8+lzBK+qFyLGcWUPAPLmWM8mmX4cjhdbGV1iL7Ew5gWNos08lw5wjqMtGuS
        hiq8B/1WE1hv4VIZK1lkvGELnlOwkXw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-wl7gs1IoOq6d-ICUE6ppGg-1; Tue, 02 Nov 2021 12:11:30 -0400
X-MC-Unique: wl7gs1IoOq6d-ICUE6ppGg-1
Received: by mail-ed1-f72.google.com with SMTP id f20-20020a0564021e9400b003e2ad3eae74so595269edf.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Nov 2021 09:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OXCcgVDujHkdu74YmEm/6uZxSbK6QTtbfJnMu16uuZU=;
        b=5ks5rhqTASVrmT39m5mL5+5MUXrAkLMchVSr44w9DsXa1zVfZsShw0uV2lqToTKFTx
         EAtsPSVCKXb3ICNjvO05PbmIhxyT9co1xZII9AMOfzyQu9X3m9jvzGENXG5ojEmySCoc
         jrdlymKrLoRswU7m3dOMjDtOHdaA3LaLJVfDLcjqhi1KVWblIb+q4RWMPr3yaStP7rJl
         Ksk3rCNlL5tXAruDf8suXVIez9QaWcajI6BNh5QiTlwBikUymHVxovwJc3xWJSP86pXe
         hjX0fajWgyMERaaYvPC58dZ9gglBWpGQoAXnUNOkzeVPsPAc35//mnu0fZyjLEk/j2VQ
         Z5bQ==
X-Gm-Message-State: AOAM530PP6W8oUEu9WKlx2GNFobzJg8Q2noRh2dMOKPrgzmHbLVsC4fs
        +q8sErhiHVVhNOz9yBzBXd2m8LvACljxpYaZRzOSg1fj2VBZaG6/dkGd5WfBN//3VsI8CvdwJsN
        YXc4IabzI4wfbIAeGK49RxhRXiSnvyePgRw==
X-Received: by 2002:a17:906:ce2b:: with SMTP id sd11mr41196389ejb.357.1635869489716;
        Tue, 02 Nov 2021 09:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc7xvozzFCrT+ldZQZpz2qqh+5IJOeJ4jcizwG2L2dQLGetL43/Fnv4jvYRJN+ddJ55lpktA==
X-Received: by 2002:a17:906:ce2b:: with SMTP id sd11mr41196329ejb.357.1635869489417;
        Tue, 02 Nov 2021 09:11:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j3sm8322037ejo.2.2021.11.02.09.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 09:11:28 -0700 (PDT)
Message-ID: <69cc36ec-0674-2acb-6d23-4d7bc8c63fd9@redhat.com>
Date:   Tue, 2 Nov 2021 17:11:27 +0100
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
 <1f4377bb-2902-05e9-95c7-ad924477b543@redhat.com>
 <CAHp75VfJZYiVvE0uQ6ahOJo9wxh0EwjgkeN81vas89pNMDv3GQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfJZYiVvE0uQ6ahOJo9wxh0EwjgkeN81vas89pNMDv3GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/2/21 16:52, Andy Shevchenko wrote:
> On Tue, Nov 2, 2021 at 4:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/2/21 15:34, Andy Shevchenko wrote:
>>> On Tue, Nov 2, 2021 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +               board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>>>> +               if (!board_data) {
>>>> +                       dev_err(&client->dev, "No board-data found for this laptop/tablet model\n");
>>>> +                       return -ENODEV;
>>>
>>> It's fine to use dev_err_probe() for known error codes.
>>>
>>>> +               }
>>>
>>> ...
>>>
>>>> +               cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>>>
>>> Do we need casting?
>>
>> Yes, the cast casts away a "const", the const is correct
>> since the data only ever gets read by the regulator driver,
>> but platform_data pointers are normally not const, so it
>> is either the cast, or loose the const on the definition
>> of the struct to which board_data->tps68470_regulator_pdata
>> points...
>>
>> So not good choice here really, only chosing between bad
>> options and I picked the lets do the cast "least worse"
>> option (at least to me). I'm open to changing this.
> 
> Hmm... Okay, I was under the impression that MFD is using const for
> that field...

Nope, I just double-checked and it is a plain "void *" 

Regards,

Hans


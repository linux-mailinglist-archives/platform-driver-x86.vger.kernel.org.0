Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5BF5E91D9
	for <lists+platform-driver-x86@lfdr.de>; Sun, 25 Sep 2022 11:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiIYJXJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 25 Sep 2022 05:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiIYJXI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Sep 2022 05:23:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A862870F
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Sep 2022 02:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664097787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ONaR+TCccbPpPu/c7+KO08GDygkFAs/H7dNqppcGxT4=;
        b=iZL0KZiayUNAou73OoeJoK1Aab1cjarXdtWMOVtB6kXCuaqCyG2Vcttri7AbKrdiiY5lcR
        8RPW3FlbEaH7obbfAUvh9YCK9u95kYvm2b3yawH7p5oT8L76xl5ysnvH4+feD+KJ12BK64
        QHxY+BVubZUeqNJWh19rVw1FuYpqGW8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-BmkJNL3mMpe7CaMTGanhUQ-1; Sun, 25 Sep 2022 05:23:03 -0400
X-MC-Unique: BmkJNL3mMpe7CaMTGanhUQ-1
Received: by mail-ed1-f70.google.com with SMTP id t13-20020a056402524d00b00452c6289448so3169098edd.17
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Sep 2022 02:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ONaR+TCccbPpPu/c7+KO08GDygkFAs/H7dNqppcGxT4=;
        b=jYbyIpgoFfGAa41MZ3wkq87ORqEEkxKpY0gTG9IZ870AqcxmLEu/qKO5S1Iq48Kt1l
         YJ9IM130y1hC5f8CM7LFDz/JTeaTEfoI23avo8kI/hqgVkJ3VXNcMeCUy3J0F6QtC2+Z
         BwHviIcf+2tdi8Gfq1X26wleePunZmIcyECEqe3Xii3lVD2POtt+YFcG/x57SqL2/NHx
         vhsXMAZ4/lvqB+wlG6qB6hinvyXnc4wTGSeo3eRXBjAdYLuPt6LaP//EV2dOn94sRr3m
         +5pp6xrPvN0o+e2yx4T9UkndMP0JEaP+h5EtnGNvnJRpH7QjVxeIB3dxcg7y6wYwyr1R
         ZPzw==
X-Gm-Message-State: ACrzQf0g/2GHWJEnFUNL5v7N9Hgjp8c+a5krVi9g4P3+awyom+mkqrUs
        5FP6fodIUxLROv7chQKxudFHJETtSupX5bXOYaxMbXJRdcsJz2R6AHs6+Q8v+MyitamJxNXsI7q
        tRve1nS3abjVqTqFN1P7yCjd0gVwlZUrTAQ==
X-Received: by 2002:a05:6402:2926:b0:457:3c2c:4ab with SMTP id ee38-20020a056402292600b004573c2c04abmr752873edb.388.1664097782795;
        Sun, 25 Sep 2022 02:23:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ow9sBjVEZHPPBMjM/K0ms0gNeKRGh76tlI/Y3a8SR/nTJM+4Fla1ynEJ6zxk8BhRfU1zswQ==
X-Received: by 2002:a05:6402:2926:b0:457:3c2c:4ab with SMTP id ee38-20020a056402292600b004573c2c04abmr752862edb.388.1664097782611;
        Sun, 25 Sep 2022 02:23:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g5-20020a056402320500b00456ddead51asm3778836eda.16.2022.09.25.02.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 02:23:02 -0700 (PDT)
Message-ID: <6c6654c7-bdca-27d9-ad80-a50d4df27426@redhat.com>
Date:   Sun, 25 Sep 2022 11:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 0/5] Add multiple-consumer support to int3472-tps68470
 driver
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Daniel Scally <djrscally@gmail.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Robert Moore <robert.moore@intel.com>
References: <20220921230439.768185-1-djrscally@gmail.com>
 <b3855fe0-4b85-a442-1835-3e62456b3206@redhat.com>
 <CAJZ5v0gB=jztBtmcfmuXNiNd2s+ftQRF1fqYHQApFsX_yEvkMQ@mail.gmail.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gB=jztBtmcfmuXNiNd2s+ftQRF1fqYHQApFsX_yEvkMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/24/22 19:15, Rafael J. Wysocki wrote:
> On Thu, Sep 22, 2022 at 10:55 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> On 9/22/22 01:04, Daniel Scally wrote:
>>> Hello all
>>>
>>> At the moment there are a few places in the int3472-tps68470 driver that are
>>> limited to just working with a single consuming device dependent on the PMIC.
>>> There are systems where multiple camera sensors share a single TPS68470, so
>>> we need to extend the driver to support them. This requires a couple of tweaks
>>> to the ACPI functions to fetch dependent devices, which also assumes that only
>>> a single dependent will be found.
>>>
>>> The v2 for this series was some time ago...it's kept falling to the back of my
>>> to-do list so I've only just gotten round to it; sorry about that. v2 here:
>>>
>>> https://lore.kernel.org/linux-acpi/20220327161344.50477-1-djrscally@gmail.com/
>>
>> Rafael, I would like to merge this through the pdx86 tree may I have your
>> ack for patches 1 + 2 for this. As a reminder (since it has been a while)
>> here are your review remarks to v2 of patch 1:
>>
>> https://lore.kernel.org/platform-driver-x86/CAJZ5v0i2ciLHP-=8eQcZc0v0xCzhKHKpxLC=Kgv6W5E_5=HQJA@mail.gmail.com/
>>
>> (which both seem to have been addressed)
>>
>> AFAICT you did not have any remarks for v2 of patch 2.
> 
> No, I didn't.
> 
> However, because acpi_bus_get_acpi_device() becomes
> acpi_get_acpi_dev() in my tree, I think it's better to route this
> material through it, if that's not a problem.

Routing it to your tree is fine.

> I've tentatively queued it up for 6.1.

Great, thank you!

Regards,

Hans



>> p.s.
>>
>> Dan, if I want to give the IR cam a test run on my own Surface Go (version 1)
>> I guess I may need a sensor driver? Where can I find that sensor driver and
>> what do I need in userspace to test this ?
>>
>>
>>
>>> Daniel Scally (5):
>>>   ACPI: scan: Add acpi_dev_get_next_consumer_dev()
>>>   ACPI: bus: Add iterator for dependent devices
>>>   platform/x86: int3472: Support multiple clock consumers
>>>   platform/x86: int3472: Support multiple gpio lookups in board data
>>>   platform/x86: int3472: Add board data for Surface Go2 IR camera
>>>
>>>  drivers/acpi/scan.c                           | 40 +++++++---
>>>  drivers/clk/clk-tps68470.c                    | 13 +++-
>>>  drivers/platform/x86/intel/int3472/common.c   |  2 +-
>>>  drivers/platform/x86/intel/int3472/tps68470.c | 76 ++++++++++++++++---
>>>  drivers/platform/x86/intel/int3472/tps68470.h |  3 +-
>>>  .../x86/intel/int3472/tps68470_board_data.c   | 54 ++++++++++++-
>>>  include/acpi/acpi_bus.h                       | 15 +++-
>>>  include/linux/platform_data/tps68470.h        |  7 +-
>>>  8 files changed, 177 insertions(+), 33 deletions(-)
>>>
>>
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6506F9182
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 May 2023 13:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjEFL0t (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 6 May 2023 07:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjEFL0s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 May 2023 07:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C26F8A56
        for <platform-driver-x86@vger.kernel.org>; Sat,  6 May 2023 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683372367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gUcUVRlRH6PyFTG3mB3fIiakfk06mGOT19vfGJUDy5w=;
        b=QQPvaMgAWRKc3fKZ6BQhaNVZy1qTlPp309nKJMO31AmeeGZ3LEhLZz6VtAVbd0VvSJkLJu
        B961M1mZt/gK/im85QTsoXiJvvPUyetHqNNrtlqYdvHxJLEJqt5Rk6VbAwXg+dqyKD8i4o
        THsuyzLW3QIOXvuF19Q0LTnPcUdNfUg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-H5lk42qXMg2Ec0UMlWY-qA-1; Sat, 06 May 2023 07:26:05 -0400
X-MC-Unique: H5lk42qXMg2Ec0UMlWY-qA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9662960d1e4so10806066b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 May 2023 04:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683372364; x=1685964364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUcUVRlRH6PyFTG3mB3fIiakfk06mGOT19vfGJUDy5w=;
        b=keiRAXt/TcpnKsWGoLsRaujaPzBWXyDavettbVTFAoUuSiVA62LwT0Nxtz8dHQkTVC
         QzimJQiwwUlHT47RG//dnc9kmCpsEYlrB/1TrfRHKSLJ+GHPqCyPkLgHaGL0hwgPoggp
         7hqb+vPDkk8iea86aKPfJ3oswfSyjZxtE2V8lNZOxDUoydTLukTCb5lmE3xj1Er0hsu8
         UNuvgKC5maGAVcP6vNspuPhxXOr693cezncBWRJlSgZI3npthy/VHPxQtf6jEsGP3lv6
         nyOUUMN2ElK4KUgMnfDgUfqffsLpaMJ3P5MvZh/lNEXT2h+X3o65XUQopQw/nDbcwf/+
         ftRg==
X-Gm-Message-State: AC+VfDwZeEeVnaP93W1m0JJjQi/RbRDPy+klCzcwuoraqWtQQlRPW9Jh
        WKCtmoZmLPQUGXoAplgUFLKstnJ9eS40eDob9U1LoM3gPz7PVtUt/iAP0HW3njyrPfrn5oAY2+v
        AHXM/pKjPOHZy6bVzLY8FLoBFPvRqu7lNyw==
X-Received: by 2002:a17:907:1c85:b0:92b:6b6d:2daf with SMTP id nb5-20020a1709071c8500b0092b6b6d2dafmr3850932ejc.77.1683372364538;
        Sat, 06 May 2023 04:26:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JcRbKIXVw+F4IF/Wn7eZgU785K940V++/yjd6HAjt0oWhsOsDW4IxAiCxc9jZZsSxpSvrPg==
X-Received: by 2002:a17:907:1c85:b0:92b:6b6d:2daf with SMTP id nb5-20020a1709071c8500b0092b6b6d2dafmr3850925ejc.77.1683372364261;
        Sat, 06 May 2023 04:26:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hy19-20020a1709068a7300b00961277a426dsm2167879ejc.205.2023.05.06.04.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 04:26:03 -0700 (PDT)
Message-ID: <b61d7ca2-a1db-05a1-fee5-b68e0e94b99f@redhat.com>
Date:   Sat, 6 May 2023 13:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 18/19] platform/x86: lenovo-yogabook: Add keyboard
 backlight control to platform driver
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20230430165807.472798-1-hdegoede@redhat.com>
 <20230430165807.472798-19-hdegoede@redhat.com>
 <20230504165307.tydqlk6sml7sp5qe@pengutronix.de>
 <CAHp75VdgFFk=q-=ZDiKwV02Tin19ZSmSS=fhwgRrE6v48s-u0w@mail.gmail.com>
 <20230505092111.qknupa2vooi7mqwl@pengutronix.de>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230505092111.qknupa2vooi7mqwl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Uwe, Andy,

On 5/5/23 11:21, Uwe Kleine-König wrote:
> On Fri, May 05, 2023 at 12:07:02PM +0300, Andy Shevchenko wrote:
>> On Thu, May 4, 2023 at 7:53 PM Uwe Kleine-König
>> <u.kleine-koenig@pengutronix.de> wrote:
>>> On Sun, Apr 30, 2023 at 06:58:06PM +0200, Hans de Goede wrote:
>>
>> ...
>>
>>> I don't know much about x86, but I think the table belongs to where this
>>> "80862289:00" device is created.
>>
>> Just for your information, it's in drivers/acpi/acpi_lpss.c.
> 
> Compared to drivers/platform/x86/lenovo-yogabook-wmi.c this file is
> never compiled as a module and so patch #1 would become unnecessary.
> 
> That file also already has a pwm_lookup table.

Right, the Cherry Trail SoCs in question have 2 PWM controllers
the first controller is pretty much always used to control
the brightness of the LCD screen. So we have a fixed pwm_lookup
table for it there using the SoC's builtin display controller's
device_name() as consumer-device-name.

The second PWM controller however is different it is mostly unused
I'm aware of 2 cases where it is used and in both cases it is used
to control the brightness of a backlight for fixed (etched into the
glass) touch controls.

The problem is that in these cases there will be 2 totally different
consumer devices. Looking at the lookup tabel checks in pwm_get()
I see that it is possible to add a lookup which matches only by
dev_id. So I could use this here and this would then also be in
place for when I get around to writing a driver for the second
case (that I'm ware of) which needs access to the second PWM controller.

So this then just leaves the question of what to name the con-id,
since we won't be specifying a consumer-device-name I think it is
best to keep the con_id quite generic, e.g.:

"pwm_soc_lpss_2"

to match with the existing:

"pwm_soc_backlight"

for the first PWM controller.

Uwe, Andy, is using a pwm_lookup with only a con_id match on
"pwm_soc_lpss_2" ok with you ?

Regards,
Hans



Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E51363D3A3
	for <lists+platform-driver-x86@lfdr.de>; Wed, 30 Nov 2022 11:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiK3KlJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 30 Nov 2022 05:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233789AbiK3Kku (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 05:40:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1194842D
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669804787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IWf7oyH1nHYeZwWc6j8aR0Iwv4vleAhnmkH4VGWDvEs=;
        b=bT+ALZLYURmAxIitByV5O+uUIOjhe7EMx1beJmixwBoo3cvkh261GveKr86LaJ0i8kdgUs
        PlD7eCOjyg2bh948TI7SLv8JXRyLkOE67dPIDxXn5KKA8cIdS4Kp3qBAVeNtCMksmeX9+y
        xU4WS8RXZ9kuB9G1r7eJ51nMf1Njcyo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-i-mtkSWIMZe4O_00uKlIDw-1; Wed, 30 Nov 2022 05:39:45 -0500
X-MC-Unique: i-mtkSWIMZe4O_00uKlIDw-1
Received: by mail-ej1-f70.google.com with SMTP id ga41-20020a1709070c2900b007aef14e8fd7so8399597ejc.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWf7oyH1nHYeZwWc6j8aR0Iwv4vleAhnmkH4VGWDvEs=;
        b=DcGNh/aJpJuTrEfH6eUFkg/6D0GrIt+UDHPSSS5rQXWggCdv+arY95WB1vrNeZ2fwE
         baleQukXN/fFEpWOqo6602iUKSft2VXfWffsszc9Ye/0LodGyjmUIMR4krsOLFODjaTc
         LRFrtk0b5uiNeZfSMEMw9CXTwJcFZ1Zrjkm0zdntvb36DIUz6mGQ/Rr1EMYh7u53MXj9
         Hzi8mHuX2x5t72OmbzQXMowzQ6/CU1RRTso+vRKt5/b2Ci0vkW/ciO+ZIS7/U0Vc4z1L
         t7BcHYnNSPN8cFx95osay+yqqurBUoEBpyaDWTI86S45BUmWmut8qW+PZ9Vsz9g1dPDs
         akMA==
X-Gm-Message-State: ANoB5plwXRcuO7QqNK2vzc198BOLkHsGWMAr8JDpTXw7+oNgAsP1GZUf
        6Kka5GIq6JsUyeW0MOtV6bcCJopgV0eyUzvzhRaduBkTu5eSFO36m/1Po8QpK234uvHkIWUCM1a
        +kBYDhy27hgUK0PiR/cy+CTVdFNExvxJXYQ==
X-Received: by 2002:a05:6402:143:b0:463:f8aa:d2bf with SMTP id s3-20020a056402014300b00463f8aad2bfmr55814977edu.358.1669804783982;
        Wed, 30 Nov 2022 02:39:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7kmkSrBlsiz/30NQQFxM7yD9+xU/ZEz0cwBtyd9mLmwtMvRyxTGjP3C3EuY8upT7kkmJAyJg==
X-Received: by 2002:a05:6402:143:b0:463:f8aa:d2bf with SMTP id s3-20020a056402014300b00463f8aad2bfmr55814961edu.358.1669804783770;
        Wed, 30 Nov 2022 02:39:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l20-20020aa7d954000000b00459f4974128sm479269eds.50.2022.11.30.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:39:43 -0800 (PST)
Message-ID: <7a110978-268d-811d-daa6-39f78f802e2c@redhat.com>
Date:   Wed, 30 Nov 2022 11:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 6/6] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-7-hdegoede@redhat.com>
 <CAHp75Vc2nYtvHhrsNPe8JwbK_665F5_Z6bMDfvmtBKr0HomycA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc2nYtvHhrsNPe8JwbK_665F5_Z6bMDfvmtBKr0HomycA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/22 11:01, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> According to:
>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>
>> Bits 31-24 of the _DSM pin entry integer value codes the active-value,
>> that is the actual physical signal (0 or 1) which needs to be output on
>> the pin to turn the sensor chip on (to make it active).
>>
>> So if bits 31-24 are 0 for a reset pin, then the actual value of the reset
>> pin needs to be 0 to take the chip out of reset. IOW in this case the reset
>> signal is active-high rather then the default active-low.
>>
>> And if bits 31-24 are 0 for a clk-en pin then the actual value of the clk
>> pin needs to be 0 to enable the clk. So in this case the clk-en signal
>> is active-low rather then the default active-high.
>>
>> IOW if bits 31-24 are 0 for a pin, then the default polarity of the pin
>> is inverted.
>>
>> Add a check for this and also propagate this new polarity to the clock
>> registration.
> 
> I like it in this form, thanks!
> 
> ...
> 
>> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> 
> Perhaps
> 
> static inline str_high_low(bool v)
> {
>   return v ? "high" : "low";
> }
> 
> In the string_helpers.h? If you are okay with the idea, you may use my
> tag ahead for that patch.

That is an interesting idea. but IMHO best done in a follow-up series
after checking for similar code in the rest of the kernel.

This is based on the assumption that "selling" this new helper to
the string_helpers.h maintainer will be easier if there are multiple
consumers of it right away.

Regards,

Hans




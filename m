Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53731799DE3
	for <lists+platform-driver-x86@lfdr.de>; Sun, 10 Sep 2023 13:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346636AbjIJL33 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 10 Sep 2023 07:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346089AbjIJL33 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Sep 2023 07:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A873CD1
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Sep 2023 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694345319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DtJY7joP5rMZ4hZmyJv0BTWzcaAlrQTPMl4QnW8+5Gw=;
        b=ekiaFPdXnXbCTVJrcLBiexvt3coeVhJmOD7MjjM6s069irP4kxtKZrEtfbFZx0Bm+mJiGs
        MhbfsOrZRbkpLOwcxbMvuhcLZvJMq4i3QXhxd/jyK3+Q4cQMhwMSBS0c8Mx2DYYUQ2oYtP
        JlO7MVaUHZ9OlSzkiL15RyPSuw3rlf8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-NkJSINpDPci_lHrFvRUXGQ-1; Sun, 10 Sep 2023 07:28:38 -0400
X-MC-Unique: NkJSINpDPci_lHrFvRUXGQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99388334de6so229099966b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Sep 2023 04:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694345317; x=1694950117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtJY7joP5rMZ4hZmyJv0BTWzcaAlrQTPMl4QnW8+5Gw=;
        b=VxxKrLhnaJdjmosaygzUT2aUqk4WpRAEN0W8iEgyxSHK9CmB6xGOG7FgJTMdlTggCL
         QXv4vvBbBPt1TUuy14ZHqzOUKAImzLGyXkm4etW8DVYrJQwieihPitVLuWiMYJA+AAT6
         HgOz5Ugd4v+9ET4p8hxaamqj9uDaXTWxa5rjc3QKNvX6B1uJTqDHAzn7SYK29GXtyAr2
         TtLCaQmo+xnVc0Z4kYZqcJWGsR3D/LSOvVxerFd/Vb7WVcAAjrYt0JG4WitcRJh7ALrG
         kZr+IEcX/hzIYbgtCBjx6UbnMagk8qfG6aDUm2XwEzaQoFSnP/1XY7lqlVGIPxofBos/
         QH8Q==
X-Gm-Message-State: AOJu0YzrtABHHAoIpAPDmLYkU5DqlzL9KACpIWXVX4oshbxfpQZ8IMli
        hHk/msbXSYnmYHVMei3Uzs656QgIBLjSaKjD8fAOPlCxB6BKjA5isMs4XFr2Mfh7bcQ9rAZgRt+
        Q9g3UEQvSXIv36zs8h5QJcg/Pzm+/83Hg4u2u8EpFnA==
X-Received: by 2002:a17:907:77c9:b0:9a9:e5bb:edc5 with SMTP id kz9-20020a17090777c900b009a9e5bbedc5mr6525360ejc.65.1694345316930;
        Sun, 10 Sep 2023 04:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfPgAreIi4AcTewEx7Rreohfe0JGTDJU3IvqbKOB0uvh3a4giSBffifzD0j+gbOCjkQrjKxA==
X-Received: by 2002:a17:907:77c9:b0:9a9:e5bb:edc5 with SMTP id kz9-20020a17090777c900b009a9e5bbedc5mr6525352ejc.65.1694345316675;
        Sun, 10 Sep 2023 04:28:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ov27-20020a170906fc1b00b00992c92af6f4sm3696906ejb.144.2023.09.10.04.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 04:28:35 -0700 (PDT)
Message-ID: <b54ee1c8-8d63-f698-4dc9-dfda4b3a3455@redhat.com>
Date:   Sun, 10 Sep 2023 13:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] platform/x86: x86-android-tablets: Stop using gpiolib
 private APIs
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20230909141816.58358-1-hdegoede@redhat.com>
 <20230909141816.58358-7-hdegoede@redhat.com>
 <CAHp75Ve888X7xJ0VrQfswaStL8C3SHXjnJV35O2ajZVq6=KfMQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve888X7xJ0VrQfswaStL8C3SHXjnJV35O2ajZVq6=KfMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

I missed 1 remark:

On 9/10/23 10:24, Andy Shevchenko wrote:
>> -       ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
>> +       ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, "bq25892_0_ce",
>> +                                          true, GPIOD_OUT_HIGH, NULL);
>>         if (ret < 0)
>>                 return ret;
> 
> Hmm... Maybe better this function to return an error pointer or valid
> pointer, and in the code you choose what to do with that?
> 
> ...
> 
>>         /* OTG pin */
>> -       ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
>> +       ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, "bq25892_0_otg",
>> +                                          false, GPIOD_OUT_LOW, NULL);
> 
> Ditto.

Yes I did consider that, but x86_android_tablet_get_gpiod() already followed
the return-by-reference model and I did not want to add changing that into
the changes this patch already makes.

Regards,

Hans




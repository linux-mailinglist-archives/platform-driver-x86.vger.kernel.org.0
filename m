Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC0258D59E
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Aug 2022 10:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbiHIIq1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 9 Aug 2022 04:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239056AbiHIIqR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Aug 2022 04:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DC49220FB
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Aug 2022 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660034775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jaq03+KQYvPWrhdnqM1mj3r1Ie88ciNsACbCUOzVw+0=;
        b=EpqtKpYqoNUAc8Wh+D7ebYE3TrEjn5mebE6JOjyNHkAOviyHyqYrH1db0AszlMeudRdVXF
        DgWnH0MbJ/3OOanY4+fylXAcQvn+Ua/GnTfiZRdzK0zCkKMNWXMVu1Ota6QUzLA+5zQlYI
        x8BIHlL1vEX+FKl3SOENMVdYOCMPwk0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-Shb-RFIQMaiI9qkmPiTMxQ-1; Tue, 09 Aug 2022 04:46:14 -0400
X-MC-Unique: Shb-RFIQMaiI9qkmPiTMxQ-1
Received: by mail-ed1-f72.google.com with SMTP id q18-20020a056402519200b0043dd2ff50feso6862666edd.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Aug 2022 01:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=jaq03+KQYvPWrhdnqM1mj3r1Ie88ciNsACbCUOzVw+0=;
        b=ipa6rilQnlngXjYRIEqFkRe3jtoJWr1FchHN/EVq9dI9r02EBN8KbzKwhgqkXSdSc6
         0Cf0LHvqFCDO+vWL08sGhYD65xDxdExHS3K+BdjgE1FPmK2o8SNHWUZ7InZ7eKgxDj5T
         lxxYiN4Srvns7UdFmw0lMr7k4sngja2dvSEKhH3/qcKI92Xn9ZhxxY4RWdR/Z9udjQRB
         ce4iZfahTN6DjTQO7XEwpai8s6jQrdQqVYrB7PLDslluhQ8qpTFDM2kzYLG1wepnQ+Y4
         dkbPaSHVWwLknaNE1h9n3JxX1TB7rcukZdYFT734GiQkAfixJDTsDhE3VbbDA7McnCC0
         j+7g==
X-Gm-Message-State: ACgBeo2kYCerWEw1oKeMEuHfoDhkm9efCJ3JJ4rKr2ISRgyKeCc75+db
        XXA4/95rIDkHllPZQmKT2BzLc55eL4Ex7Uc29IbL4a1eaXdM69eXTNVmQML25Z4OTrPARUzdSjq
        MPteWuep08gfmBQgVL3+q/C711mkRyYdTmA==
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id dd3-20020a1709069b8300b00730b3ae0343mr17022672ejc.670.1660034772845;
        Tue, 09 Aug 2022 01:46:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5KxB7CeMHwSWISG3iCZ0m1EID+v/ZwlOpnEekw9+qvE0R6X982djrb+Kwdr6dAEKJ2OPR60Q==
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id dd3-20020a1709069b8300b00730b3ae0343mr17022663ejc.670.1660034772690;
        Tue, 09 Aug 2022 01:46:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id dm13-20020a05640222cd00b0043cb1a83c9fsm5758408edb.71.2022.08.09.01.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 01:46:12 -0700 (PDT)
Message-ID: <e6370233-eae5-5668-3f07-d1a70eb92690@redhat.com>
Date:   Tue, 9 Aug 2022 10:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] asus-wmi: Add support for ROG X13 tablet mode
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220809033048.1634583-1-luke@ljones.dev>
 <20220809033048.1634583-3-luke@ljones.dev>
 <CAHp75VeAMBM+itfAn8hRDykV9rRLGXzck8L2kBgpGkVRsPUm5g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeAMBM+itfAn8hRDykV9rRLGXzck8L2kBgpGkVRsPUm5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/9/22 10:40, Andy Shevchenko wrote:
> On Tue, Aug 9, 2022 at 5:31 AM Luke D. Jones <luke@ljones.dev> wrote:
>>
>> Add quirk for ASUS ROG X13 Flow 2-in-1 to enable tablet mode with
>> lid flip (all screen rotations).
> 
> ...
> 
>>         { KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
>>         { KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
>> +       { KE_KEY, 0xBD, { KEY_PROG2 } }, /* Lid flip action on ROG xflow laptops */
> 
> Shouldn't you keep it sorted by value?

Actually as I mentioned in my review of v1, we don't want this
addition at all, see:

https://lore.kernel.org/platform-driver-x86/d9d79f9b-f3ab-c07e-9e18-5760ff828487@redhat.com/

Regards,

Hans


> 
> ...
> 
>>  #define NOTIFY_KBD_FBM                 0x99
>>  #define NOTIFY_KBD_TTP                 0xae
>>  #define NOTIFY_LID_FLIP                        0xfa
>> +#define NOTIFY_LID_FLIP_ROG            0xbd
> 
> Ditto.
> 
> ...
> 
>> +static void lid_flip_rog_tablet_mode_get_state(struct asus_wmi *asus)
>> +{
>> +       int result;
>> +
>> +       result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP_ROG);
>> +       if (result >= 0) {
> 
> You missed the second part of my comment. Please, read carefully _all_
> reviewer's comments.
> 
>> +               input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>> +               input_sync(asus->inputdev);
>> +       }
>> +}
> 
> ...
> 
> Overall, it's getting better!
> 


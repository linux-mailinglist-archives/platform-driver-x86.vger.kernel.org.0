Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBD255204A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Jun 2022 17:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243864AbiFTPRo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Jun 2022 11:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243580AbiFTPRf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 11:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D41ED1ADBA
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655737690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nOQ6e6pAcimxOwwNtbbgCCN0/d+i6E7YaBaKogZ6pjQ=;
        b=GrrojHCfKboX0skcXTA1uS5Mo3kjy2fFWCmORD+aL40cfCl1lW1g3L6F65bjeti0Ce58hc
        Z0KzDd5SDDCSlSZnm5Hp3SKdITGE6BFhb+McvXfvHhad2/LZ+Pa4da9LdoVUrvsiVn9RbR
        /t45HZwoy0/JDkiCuKq40NsK8bFXEUg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-e-kqId3KPFi4E_gCfOB97Q-1; Mon, 20 Jun 2022 11:08:06 -0400
X-MC-Unique: e-kqId3KPFi4E_gCfOB97Q-1
Received: by mail-ed1-f69.google.com with SMTP id m5-20020a056402430500b004319d8ba8afso8941573edc.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 08:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nOQ6e6pAcimxOwwNtbbgCCN0/d+i6E7YaBaKogZ6pjQ=;
        b=EHgBeYzHHDKdhynVtK6V+sVixfpryhImhjN5/YPmR+oa+lpaJxvmW6MAz/tdoVoyw9
         HWTVKHHKjwsO1DFwqXmz0JhD9E99nBdopau+2fTEIRSiyo9Z3x2Lwu+2QWzkIk9CgFZh
         5QMIV7M/P3B2yUaXZRxKdDvoxb3aA5gKwChW9MBF7K9xhvwViQAhbZRSOZGSCqdF/Nh3
         IuagZKsGZD7c3+zVAibnNPArO/wqGcVoc20mOpn3/pUi/OWkWFXWQomuSuISCA74pNXK
         q751/9Wpb8gfMj6wR+WR29IsiUEWOxBba9WLEaDyxkwCFu4O8hy1BYortbf5Ld7wKTLW
         711A==
X-Gm-Message-State: AJIora+59TawJk3uLtRZJ0uYM+9oPyino1INkaVS7s4vccqht9pr6snK
        sG/q6wgzMY7LGSoH3uVaEobF8JyRe5HZPWxlEAk24DHb+TDbZSFJ7sQXoE1onw4uz+3BaG2fCy7
        8qYOc8k92S4K1p7ew8isbAJWWkIjEFbW0qg==
X-Received: by 2002:a17:906:38d0:b0:715:8483:e01e with SMTP id r16-20020a17090638d000b007158483e01emr22134663ejd.265.1655737684707;
        Mon, 20 Jun 2022 08:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAnhocu7zzqOnvIChRoIB6PdhC4SoZp9rxJRlpwZNjYXy9x9UEnuqQFGmUC9iV6bqJIQDJuA==
X-Received: by 2002:a17:906:38d0:b0:715:8483:e01e with SMTP id r16-20020a17090638d000b007158483e01emr22134631ejd.265.1655737684433;
        Mon, 20 Jun 2022 08:08:04 -0700 (PDT)
Received: from [10.0.0.147] (D57D5A4B.static.ziggozakelijk.nl. [213.125.90.75])
        by smtp.gmail.com with ESMTPSA id d20-20020a50fb14000000b004357558a243sm4973553edq.55.2022.06.20.08.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 08:08:03 -0700 (PDT)
Message-ID: <19e590f1-e865-ad19-e9e4-df1f9274663c@redhat.com>
Date:   Mon, 20 Jun 2022 17:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] platform/x86: panasonic-laptop: allow to use all
 hotkeys
Content-Language: en-US
To:     Stefan Seyfried <stefan.seyfried@googlemail.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Seyfried <seife+kernel@b1-systems.com>
References: <20200821181433.17653-8-kenneth.t.chan@gmail.com>
 <20220612090507.20648-1-stefan.seyfried@googlemail.com>
 <20220612090507.20648-3-stefan.seyfried@googlemail.com>
 <CAHp75Ve+vrfSu6pD+AKe-eCVA2pC5o520y4gVwLNg9Dtk0U5bw@mail.gmail.com>
 <CAHp75VdFPUHTeDBY5ukFgVqJJn7BbTHxrxKUGOLB6P1UX-utAg@mail.gmail.com>
 <d80789bc-a8fc-de5f-164a-75adf7097311@message-id.googlemail.com>
 <6969ca0e-4a4c-c995-02a2-6645f875338c@redhat.com>
 <CAPqSeKu9csK_u0S6MiRay_mvfYejUhKbb=wvJO7F_Z-JL6F7DA@mail.gmail.com>
 <5f03f5b9-87bb-e27d-ce51-9c1572221f21@redhat.com>
 <89398c05-92c6-120d-ed51-ab62f1f404eb@message-id.googlemail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <89398c05-92c6-120d-ed51-ab62f1f404eb@message-id.googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Thank you for the quick testing.

On 6/17/22 15:07, Stefan Seyfried wrote:
> Hi Hans,
> 
> On 17.06.22 13:07, Hans de Goede wrote:
> 
>> Thank you for providing this info. Can you please give
>> the attached patch series a try, this includes Stefan's 1/2 patch
>> and replaces Stefan's 2/2 patch.
>>
>> This will hopefully fix the double key-presses for you, while
>> also keeping everything working for Stefan without requiring
>> a module option or DMI quirks.
>>
>> Stefan can you also give this series a try please?
> 
> Works for me, almost out of the box.
> I need to enable "report_key_events=1" in the video module, then the panasonic-acpi module starts reporting brightness up/down keys.

Ok, so you need another module option that is not really helpful.

The idea behind the acpi_video_handles_brightness_key_presses() check
is that if the ACPI video bus device is present it is expected to
already report brightness up/down keypresses and we want to avoid
duplicates.

Can you check with evtest or evemu-record that the brightness
events are not already being delivered by the "Video Bus"
input device ?

> Volume and mute keys work without manual changes.

Good.
 
> (I tested against 5.18.2 because that's what was already prepared. That old machine takes quite some time, even to just compile the platform/x86 subdirectory ;-) but I don't think this is relevant. If you think it is, I can also test against latest 5.19-rc code)

Testing against 5.18 is fine .

>> Looking at this has also brought up an unrelated backlight question:
>>
>> Kenneth, since you have acpi-video reporting keypresses you will
>> likely also have an acpi_video (or perhaps a native intel) backlight
>> under /sys/class/backlight and I noticed that panasonic-laptop
>> uncondirionally registers its backlight so you may very well end
>> up with 2 backlight controls under /sys/class/backlight, which
>> we generally try to avoid (so that userspace does not have to
>> guess which one to use).
>>
>> Can you do:
>> ls /sys/class/backlight
> 
> toughbook:~ # ls -l /sys/class/backlight/
> total 0
> lrwxrwxrwx 1 root root 0 Jun 17 14:45 intel_backlight -> ../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-LVDS-1/intel_backlight
> lrwxrwxrwx 1 root root 0 Jun 17 14:49 panasonic -> ../../devices/virtual/backlight/panasonic
> 
>> and let me know the output?
>>
>> Also if there are 2 backlights there then please do:
>> cat /sys/class/backlight/<name>/max_brightness
>> to find out the range (0-value)
> 
> toughbook:/sys/class/backlight # grep . */max_brightness
> intel_backlight/max_brightness:19531
> panasonic/max_brightness:255
> 
>> and then try if they both work by doing:
>>
>> echo $number > /sys/class/backlight/<name>/brightness
>>
>> with different $number values in the range and see
>> if this actually changes the brightness.
> 
> intel_backlight: does not work
> panasonic: does work

Ok, so that suggests that the ACPI video bus on your
device is defunct, so I guess it also does not report
key-presses (see above) ?

This will also need some work then because we want to move
to there only being 1 (actually working) backlight-class
device. Rather then having multiple and let userspace
guess which one it needs to use.

>> While we are at it, Stefan can you do the same please?
> 
> See above.
> But hey, this is an i855GM graphics chip, I'm happy if it is still working *at all* (for example I need to avoid the xf86-intel driver and use the modesetting driver instead to get a usable sytstem)
> 
> And I'm totally happy if all I have to do in the future is a
> 
> option video report_key_events=1
> 
> modprobe.conf file ;-)

We really don't want people to have to specify module-options just
to have things working.

Stefam, at least for the backlight class-device issue we will need a DMI
quirk, so can you run:

sudo dmidecode > dmidecode.txt

and then attach the output to your next email, or send me a copy
privately ?

Regards,

Hans



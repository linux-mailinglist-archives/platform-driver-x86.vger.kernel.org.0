Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6374259FC58
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Aug 2022 15:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238102AbiHXN4L (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Aug 2022 09:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239114AbiHXNzl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 09:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C3798A60
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661349271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wr8KgnMtkCR9B9otR9q22zR3K3afEw0yeN69ojoHLHc=;
        b=fK6c68OwUZ6cTuxeDvgrAnSkQiwCazfZyNJH3anmP2MNUeXfY4GDWETWqLme/2xptX9g5G
        BJfLS9gUobO6g0rNVuPv5onEgXDcUHdFaTEBWTMZwG3heZVMG28/HjdBd4zWctxici8I3E
        U9YfQRaeY/08WQMMY8xGQc1kBNkBgA8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-iKEsDwUNPlqfksj2tpWuIg-1; Wed, 24 Aug 2022 09:54:30 -0400
X-MC-Unique: iKEsDwUNPlqfksj2tpWuIg-1
Received: by mail-ed1-f70.google.com with SMTP id q18-20020a056402519200b0043dd2ff50feso10907774edd.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 06:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Wr8KgnMtkCR9B9otR9q22zR3K3afEw0yeN69ojoHLHc=;
        b=Edy3BAENJ62PqWwjWh58eR/Hx9OUfaK2NXFfeYoVG2dNoktnnYObLDtwBC1fDz5cbZ
         Ba5cN3FBt57GeBAydkFkGNWbJu7PkUfvuT4Jig5riAZhaNbuhs0yMVdpnDsfYpb2ONAJ
         AKVTIXGffNnqnHPWPSUe+kaoep9PG+zl3/sksMrOUyqQHuTsjWeyrskJNtur2hrvu3hB
         emCNLxKDA9FDALS2nlhchD/NEEUK5lgj6X2CDTqpf7gdY437rmuuJqRi+ziOGbQwDvo2
         0o/GpYyibGP0oZmDX9hfRUMSUjJo8CyvnnyWlmQ8f/L1i6edRPTyXSOEbGabwl9cILGQ
         7dUw==
X-Gm-Message-State: ACgBeo2OmJOepuN8EzCObnIQZXN8B7zON1s/K4GCaSEI35YgKHy73uxd
        MDZe/7MIdZVAeC6bD6juxGYhuWefcH2ehSW7SB0l45v/6KrV4Q2DGlBu6ywqQ41QnPG6BZe/UgI
        kJARyd5OFPVBv6d+vJ6TO1Kvw1MdQB+/L8g==
X-Received: by 2002:a17:907:2894:b0:73d:9072:ade5 with SMTP id em20-20020a170907289400b0073d9072ade5mr3029448ejc.2.1661349269293;
        Wed, 24 Aug 2022 06:54:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5X9zIsvF/lL31ytSGvhEZFsWTti9w00rfwCBFR4vVWOFdnPkX3ZrafIoGvDEWUC+nxKbyaPQ==
X-Received: by 2002:a17:907:2894:b0:73d:9072:ade5 with SMTP id em20-20020a170907289400b0073d9072ade5mr3029435ejc.2.1661349269114;
        Wed, 24 Aug 2022 06:54:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906319300b00738795e7d9bsm1229632ejy.2.2022.08.24.06.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:54:28 -0700 (PDT)
Message-ID: <a001efb5-95a3-d89d-32bd-557b6f11bb80@redhat.com>
Date:   Wed, 24 Aug 2022 15:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/5] gpio-f7188x: Add GPIO support for Nuvoton NCT6116
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        simon.guinot@sequanux.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>
References: <20220823102344.17624-1-henning.schild@siemens.com>
 <20220823102344.17624-2-henning.schild@siemens.com>
 <YwToilxquEZGqzQD@smile.fi.intel.com>
 <20220823165459.143e1c30@md1za8fc.ad001.siemens.net>
 <YwYjXzsSHNe+J3aO@76cbfcf04d45>
 <20220824155038.5aa19495@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220824155038.5aa19495@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Henning,

On 8/24/22 15:50, Henning Schild wrote:
> Am Wed, 24 Aug 2022 15:10:55 +0200
> schrieb simon.guinot@sequanux.org:
> 
>> On Tue, Aug 23, 2022 at 04:54:59PM +0200, Henning Schild wrote:
>>> Am Tue, 23 Aug 2022 17:47:38 +0300
>>> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:  
>>
>> Hi Andy,
>>
>> Thanks for this new version. It is looking good to me.
>>
>>>   
>>>> On Tue, Aug 23, 2022 at 12:23:40PM +0200, Henning Schild wrote:  
>>>>> Add GPIO support for Nuvoton NCT6116 chip. Nuvoton SuperIO
>>>>> chips are very similar to the ones from Fintek. In other
>>>>> subsystems they also share drivers and are called a family of
>>>>> drivers.
>>>>>
>>>>> For the GPIO subsystem the only difference is that the direction
>>>>> bit is reversed and that there is only one data bit per pin. On
>>>>> the SuperIO level the logical device is another one.
>>>>>
>>>>> On a chip level we do not have a manufacturer ID to check and
>>>>> also no revision.    
>>>>
>>>> ...
>>>>   
>>>>> - * GPIO driver for Fintek Super-I/O F71869, F71869A, F71882,
>>>>> F71889 and F81866
>>>>> + * GPIO driver for Fintek and Nuvoton Super-I/O chips    
>>>>
>>>> I'm not sure it's good idea to drop it from here. It means reader
>>>> has to get this info in a hard way.
>>>>
>>>> ...  
>>>
>>> Let us see what others say. I wanted to keep this in line with what
>>> Kconfig says and the oneliner in the Kconfig was getting pretty
>>> longish. Hence i decided to shorten that. Other drivers also seem to
>>> not list all the possible chips in many places, it is all maint
>>> effort when a new chips is added and the list is in like 5 places.  
>>
>> I agree with you that we can drop this line. It was already incomplete
>> and the information is quite readable a few lines below in both the
>> define list and the chip enumeration.
>>
>>>   
>>>>> +#define gpio_dir_invert(type)	((type) == nct6116d)
>>>>> +#define gpio_data_single(type)	((type) == nct6116d)    
>>>>
>>>> What's prevents us to add a proper prefix to these? I don't like
>>>> the idea of them having "gpio" prefix.
>>>>
>>>> ...
>>>>   
>>>>> +		pr_info(DRVNAME ": Unsupported device
>>>>> 0x%04x\n", devid);
>>>>> +			pr_debug(DRVNAME ": Not a Fintek
>>>>> device at 0x%08x\n", addr);
>>>>> +	pr_info(DRVNAME ": Found %s at %#x\n",
>>>>> +		pr_info(DRVNAME ":   revision %d\n",    
>>>>
>>>> Can we, please, utilize pr_fmt()?
>>>>   
>>>>> +			(int)superio_inb(addr,
>>>>> SIO_FINTEK_DEVREV));    
>>>>
>>>> Explicit casting in printf() means wrong specifier in 99% of
>>>> cases. 
>>>
>>> For all the other comments i will wait for a second opinion. I
>>> specifically did not change existing code for more than the
>>> functional changes needed. And a bit of checkpatch.pl fixing.
>>> Beautification could be done on the way but would only cause
>>> inconsistency. That driver is what it is, if someone wants to
>>> overhaul the style ... that should be another patch. One likely not
>>> coming from me.  
>>
>> About the int cast, I think you can drop it while you are updating
>> this line. It is unneeded.
> 
> Ok two voices for doing that one fix along the way. I will send a v5
> and hope nobody insists on me fixing the other findings in code i never
> wrote.

You did not write it, but you are using it to do hw-enablement for
your company's products. So being asked to also some touch-ups
left and right while you are at it really is not unexpected IMHO.

Regards,

Hans


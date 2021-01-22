Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A42300E80
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 Jan 2021 22:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbhAVVGG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 Jan 2021 16:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27139 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728368AbhAVVFq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Jan 2021 16:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611349451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ojBbmib3HW+Vk8eHI0XyBI6yZ25pUk4R+YG8M8Azs8Q=;
        b=R68lkk8+18Qm9yxFjSabM8MMI5kLlAZxSbKgOZN2wq5xzhnq7UEHRV/mX75WuggBdA3gLm
        SkriYYt656HHpZJxZoK002+e08kfin00nK2hClDOMrlBFHvRQT5waEnYYdDJ5rJnG+vu9I
        RHVSBJt4025MDM9KCfxpjHlbaN6CA78=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-XUGtPX_ZP6qcyaJkGshAew-1; Fri, 22 Jan 2021 16:04:09 -0500
X-MC-Unique: XUGtPX_ZP6qcyaJkGshAew-1
Received: by mail-ej1-f70.google.com with SMTP id n25so2432004ejd.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Jan 2021 13:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ojBbmib3HW+Vk8eHI0XyBI6yZ25pUk4R+YG8M8Azs8Q=;
        b=AnYhDB9joKwOPCiVtbrzINZkl/y9AI73QQGIyOkpIPZFv45gW8WScwRVNcG25Ba4fn
         6/ClzmVwMyPZ43Fi6gP1jQHCZN+xIw12OaW5sGCKqffwQV4wbLHQ9mMA1rBXpFyZ4U8v
         2V2BFDZuyiB+mDZQo+5QuInFhHSYnvpJktQEULxVD9JU/HENARX3oOC0sgUIL2JRR35g
         oroklgFIHNbm5I2pSCr7edZPbGGdrZRAdreMRaDqdlMtXDbF2E+7PyVvAl6V8VfPghSJ
         lf5TsZdL/MDMo6IicZlzPRcI0C3t65j21EmFfXi76KlzVaGGMqfvr47pwSQKuuLljmGh
         pOMA==
X-Gm-Message-State: AOAM531ZL4TmAT8pWQ8pyKGmtblbykHnk3zo0yyvWEHSxSYTWwo2P8DR
        SdpPbTXBT6z/3HeUE5nE/lJi/SzBjAhtJx9FGXAEmMqltj0ops+U2ja20mmylfYUB8sbWyZxxp2
        x7DOq0ax0jtWZg++H9nfE65w2REjp7RUo5g==
X-Received: by 2002:a17:907:7252:: with SMTP id ds18mr4272393ejc.239.1611349448605;
        Fri, 22 Jan 2021 13:04:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9MLCCtbPCyhHqfL3DjFawychQZ/BSSkESjO+dy5CJSr0XHbHZaRsDEncNSaKanNsoT+PPYQ==
X-Received: by 2002:a17:907:7252:: with SMTP id ds18mr4272367ejc.239.1611349448347;
        Fri, 22 Jan 2021 13:04:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id h12sm5923735edb.16.2021.01.22.13.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 13:04:07 -0800 (PST)
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com>
 <YArtsQSQsGdfNlBI@smile.fi.intel.com> <YArzAvcZXfv8DaI4@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4ba64643-9254-055d-49a0-55104b8669d8@redhat.com>
Date:   Fri, 22 Jan 2021 22:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YArzAvcZXfv8DaI4@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/22/21 4:45 PM, Andy Shevchenko wrote:
> +Cc: Arnd, RTC maintainers, Lee
> 
> On Fri, Jan 22, 2021 at 05:22:25PM +0200, Andy Shevchenko wrote:
>> On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> What is the plan for merging this series ?
>>>
>>> It touches files under:
>>> arch/x86
>>> drivers/watchdog
>>> drivers/platform/x86
>>>
>>> It is probably best if the entire series is merged through a single
>>> tree. I don't expect this to cause any conflicts with current / upcoming
>>> changes under drivers/platform/x86, so I'm fine with this being merged
>>> through another tree.
>>>
>>> Or if I can get an ack for that from the x86 and watchdog maintainers
>>> I can merge the entire series through the pdx86 tree.
>>
>> For time being I'm collecting tags and comments.
>> As of today this series is independent per se, but other (later) clean up
>> patches may rely on this.
>>
>> One strategy can be providing an immutable branch for anybody who wants it and
>> merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
>> are more patches touching other stuff, though independently, in this matters).
> 
> Yes, I think one more time and guess the best is:
>  - get tags from x86 / watchdog
>  - get tag from RTC
>  - collect everything in PDx86 immutable branch

Ok, that works for me. I assume that it is best for the other subsystems
if I create an immutable branch for this based on 5.11-rc1
(and then merge that into pdx86/for-next) ?

Guenter, I believe you have already reviewed all the watchdog changes,
are you ok with me creating an immutable branch for the entire series
and then sending you a pull-req for that ?

And x86 folks, can I get an Ack for merging the:
rename arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c => drivers/platform/x86/intel_scu_wdt.c

Change through an PDx86 immutable branch (for which you will then
get a pull-req) ?

Regards,

Hans






>  - part 2 can be merged thru Lee's MFD tree with taking above mentioned branch
>    as a base
>  - part 3 (SFI removal) can be done based on Lee's branch and via tip tree
> 
> in this case we won't wait all maintainers to give a tag in a short period of
> time (like couple of weeks from now on).
> 
> The full series (all three parts) are located in [1].
> 
> [1]: https://gitlab.com/andy-shev/next/-/tree/topic/mid-removal-next
> 


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95BA4A4978
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Jan 2022 15:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238756AbiAaOjk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Jan 2022 09:39:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56034 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238231AbiAaOjk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jan 2022 09:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643639979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R0oDEaFGdibME6lqfi97Zey91X/PgbW0htlflxKdk5k=;
        b=Lt718/7zxLrylDXof826XEVZDl4FuiQ8DOBycpbkeXeIdoiTHs98UryBeOJI9OBQhJE/q4
        TLQqH3hAuawP5RviXQ9ATkoaSZWGptIZZyOD5gVg8yiXGMrmwYBR3NwBoiQuFZNLQIhqoO
        r9MJnZgL1hH8/eBPKacUqkmsqfFDs2c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-JjhohY_NPZO9sCy3YCdDow-1; Mon, 31 Jan 2022 09:39:38 -0500
X-MC-Unique: JjhohY_NPZO9sCy3YCdDow-1
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a0564020f1600b00407b56326a2so7061384eda.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jan 2022 06:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R0oDEaFGdibME6lqfi97Zey91X/PgbW0htlflxKdk5k=;
        b=66eHE4aa0lLNJqjaEd/TlHgPp90QnVpMWgM6wlx+MnvfOA3kRqpoMzto6rIbFiNC1A
         2NsrLMlbhZrjrLjzo+BkhH6KmVPoLlNVd4NlM7FRAchV6IuS4rSquk5Su/LjuDXLsEju
         jEY2rMJTZcsulWXBHbg/iCX3XE/Dry64v5/oLCZNqkQAAbLMgCgxM6ERMZvoUNlEIH3l
         LpzmgyRAmTVP0dfkvflaoewEnOezq59NJm4PKmlSl94Bb4HB76QeYS9geqUrbieIAYW4
         WPaIwUgrpDA5ek9KByM0v9492Wt9RXyTtflPcGSPiz6euwdickdVJmsJbPOw3ui2/3v1
         817Q==
X-Gm-Message-State: AOAM532WCM2u25q7tpoWzeegM2nmD3bsLmzP3l9hl8M61rN1hFE1XHdc
        c3vVuH+OCk0LW5YubcuFiE8GKSj4bPsS/tu9fLN9p7TQYuoQbbTTZ0osqmozaLul6N2pC6pDje6
        jKME0lq+9hMHuZ64gNfmlYkeGQxEqpdzAMw==
X-Received: by 2002:a17:907:3d01:: with SMTP id gm1mr1106330ejc.695.1643639977286;
        Mon, 31 Jan 2022 06:39:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzix88rypjQ9PzeqG917MJ5ZswKyPWRnGuIiC5bkUAy88MpUabwzv3XiWV6ICCl8U202+QhVQ==
X-Received: by 2002:a17:907:3d01:: with SMTP id gm1mr1106311ejc.695.1643639977039;
        Mon, 31 Jan 2022 06:39:37 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s20sm13504159ejc.189.2022.01.31.06.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 06:39:36 -0800 (PST)
Message-ID: <91bfb535-9442-9413-cfca-1b5cb08826ed@redhat.com>
Date:   Mon, 31 Jan 2022 15:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 01/20] power: supply: core: Refactor
 power_supply_set_input_current_limit_from_supplier()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
References: <20220130204557.15662-1-hdegoede@redhat.com>
 <20220130204557.15662-2-hdegoede@redhat.com>
 <YffmDCHY6csr0uyD@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YffmDCHY6csr0uyD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

Thank you for the reviews.

On 1/31/22 14:37, Andy Shevchenko wrote:
> On Sun, Jan 30, 2022 at 09:45:38PM +0100, Hans de Goede wrote:
>> Some (USB) charger ICs have variants with USB D+ and D- pins to do their
>> own builtin charger-type detection, like e.g. the bq24190 and bq25890 and
>> also variants which lack this functionality, e.g. the bq24192 and bq25892.
>>
>> In case the charger-type; and thus the input-current-limit detection is
>> done outside the charger IC then we need some way to communicate this to
>> the charger IC. In the past extcon was used for this, but if the external
>> detection does e.g. full USB PD negotiation then the extcon cable-types do
>> not convey enough information.
>>
>> For these setups it was decided to model the external charging "brick"
>> and the parameters negotiated with it as a power_supply class-device
>> itself; and power_supply_set_input_current_limit_from_supplier() was
>> introduced to allow drivers to get the input-current-limit this way.
>>
>> But in some cases psy drivers may want to know other properties, e.g. the
>> bq25892 can do "quick-charge" negotiation by pulsing its current draw,
>> but this should only be done if the usb_type psy-property of its supplier
>> is set to DCP (and device-properties indicate the board allows higher
>> voltages).
>>
>> Instead of adding extra helper functions for each property which
>> a psy-driver wants to query from its supplier, refactor
>> power_supply_set_input_current_limit_from_supplier() into a
>> more generic power_supply_get_property_from_supplier() function.
> 
> ...
> 
>> +	ret = power_supply_get_property_from_supplier(bdi->charger,
>> +						      POWER_SUPPLY_PROP_CURRENT_MAX,
>> +						      &val);
>> +	if (ret == 0)
> 
> Can it be as simple as
> 
> 	if (ret)
> 		return;
> 
> 	...
> 
> 
> ?
> 
> Or did I misunderstand the meaning of 0?

Yes that would be better and together with some of the other tweaks
you've suggested I believe that this warrants a version 5. So I'll
address a v5 addressing all your comment.

Regards,

Hans


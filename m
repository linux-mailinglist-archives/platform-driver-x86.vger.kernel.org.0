Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F151634E304
	for <lists+platform-driver-x86@lfdr.de>; Tue, 30 Mar 2021 10:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhC3IUb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 30 Mar 2021 04:20:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49527 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231246AbhC3IU0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Mar 2021 04:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617092426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I+M6rfEdqHD/iwsrMrrsO1PDAZO7gUFfGaQ3zN/fzu0=;
        b=HrJQ8cpmxB+HT10sQNw6VssnZAdKNgovCppsW07ygQ80LyL8lQ+8RijCybe6C2SzofJRoa
        ahFUs7mc5u8reYaXKejLrDqH7nr7bPFvObuLFN+JnpK1SitU/rtWMtQNQko4MSttMcWLpN
        tHzn5mhnkSAQvgQE7bLZbDX2hR2f+Yk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-x58yHFqTP3i7zH8B4b_rYw-1; Tue, 30 Mar 2021 04:20:24 -0400
X-MC-Unique: x58yHFqTP3i7zH8B4b_rYw-1
Received: by mail-ed1-f70.google.com with SMTP id n20so9901788edr.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Mar 2021 01:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I+M6rfEdqHD/iwsrMrrsO1PDAZO7gUFfGaQ3zN/fzu0=;
        b=uHd4WIb/ACpNY+XnBzYp/+OKGBQe5s7i6VG7mJswqZyxM9iyuvfm/AYwUU+9Q2or1v
         pqqL1fHl45TxWH82Vc3/9JK6KXwiyg2amf1XcFNOYQ+XDFJ0KIltO/pE9SXZjyK4vrNn
         XoOU85fgIh9KZlsta6Tg1P17hJ0lzMq9N1vMebIG/DgBI9iYoBvLSifoSkYZMQoeWdAm
         jX65ElY6huAfcrqfhJNXn9NDxm3sdlIOEGp+vLuvSOgggxUPu+roXImBteEA13b4I72k
         p4TgD481cKi0KaEIfHZztlIqmXs4KS7nqt+9YkA04NuB2lBMg1hmUj2qVzxoGDy0xP23
         K4Lw==
X-Gm-Message-State: AOAM533SNXk+jreTQf6MiqK9JNhf7/cXGjMWyWXxaGTOA1Tuwuc1r4YL
        MJXWBtmg/Trnkhp/Roysj5YQvTfatGUXiphykcRKHP+jhEZuO+Fok+MYy40w+Lr1rD2AFPQCB8J
        lKSCLisYSSgQyLCBmJqgDE/zewhw9lSqTaQ==
X-Received: by 2002:a17:906:7150:: with SMTP id z16mr31682363ejj.103.1617092422979;
        Tue, 30 Mar 2021 01:20:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKf3fHrqwpzXoidrs/h/BZIhTMF9RUogZRxWBboRnMWrpamIzZqE1BSxlWvk/85UBYKf62Rg==
X-Received: by 2002:a17:906:7150:: with SMTP id z16mr31682347ejj.103.1617092422808;
        Tue, 30 Mar 2021 01:20:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y2sm9545381ejf.30.2021.03.30.01.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 01:20:22 -0700 (PDT)
Subject: Re: [PATCH 00/10] platform/x86: toshiba_acpi: move acpi add/remove to
 device-managed routines
To:     Alexandru Ardelean <aardelean@deviqon.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
Cc:     coproscefalo@gmail.com, mgross@linux.intel.com, jic23@kernel.org,
        linux@deviqon.com
References: <20210324125548.45983-1-aardelean@deviqon.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0fba6355-aaec-b214-cf12-1add08cfca38@redhat.com>
Date:   Tue, 30 Mar 2021 10:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324125548.45983-1-aardelean@deviqon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Alexadru, Jonathan,

On 3/24/21 1:55 PM, Alexandru Ardelean wrote:
> This changeset tries to do a conversion of the toshiba_acpi driver to use
> only device-managed routines. The driver registers as a singleton, so no
> more than one device can be registered at a time.
> 
> My main intent here is to try to convert the iio_device_alloc() and
> iio_device_register() to their devm_ variants.
> 
> Usually, when converting a registration call to device-managed variant, the
> init order must be preserved. And the deregistration order must be a mirror
> of the registration (in reverse order).
> 
> This change tries to do that, by using devm_ variants where available and
> devm_add_action_or_reset() where this isn't possible.
> Some deregistration ordering is changed, because it wasn't exactly
> mirroring (in reverse) the init order.
> 
> For the IIO subsystem, the toshiba_acpi driver is the only user of
> iio_device_alloc(). If this changeset is accepted (after discussion), I
> will propose to remove the iio_device_alloc() function.
> 
> While I admit this may look like an overzealous effort to use devm_
> everywhere (in IIO at least), for me it's a fun/interesting excercise.

Alexadru, thank you for the patches.

Jonathan, thank you for the reviews.

To be honest I'm currently inclined to not accept / merge these patches,
this is based on 2 assumptions from me, which might be wrong. let me explain.

If I understand things correctly, the main reason for this rework of
the toshiba_acpi code is to move iio_device_alloc() and iio_device_register()
to their devm_ variants, converting the last users in the tree ?

This would allow these 2 iio functions to then be e.g. marked as static /
private helpers inside the iio core, so that all new users can only use
the devm_ versions. But if I'm reading Jonathan's reaction correctly then
Jonathan is not planning to do that because they might still be useful
in some cases.

Jonathan have I correctly understood that you don't plan to make any
changes to the iio_device_alloc() and iio_device_register() functions
even if this gets merged ?

Which brings me to my next assumption, Alexandru, I don't read anything
about testing anywhere. So I'm currently under the assumption that
you don't have any hardware using the toshiba_acpi driver and that this
is thus untested ?

The not being tested state is my main reason for not wanting to merge
this. The toshiba_acpi driver likely does not have a whole lot of users,
so the chances of someone running release candidates or even just the
latest kernels on hardware which uses it are small.  This means that if
we accidentally introduce a bug with this series it might not get caught
until say lots of people start upgrading to Ubuntu 22.04 which is
the first Ubuntu kernel with your changes; and then at least one of the
hit users needs to have the skills to find us and get in contact about that.

TL;DR: we might break stuff and if we do it might be a long time until we
find out we did and then we have been shipping broken code for ages...

Regards,

Hans





> 
> Alexandru Ardelean (10):
>   platform/x86: toshiba_acpi: bind life-time of toshiba_acpi_dev to
>     parent
>   platform/x86: toshiba_acpi: use devm_add_action_or_reset() for
>     singleton clear
>   platform/x86: toshiba_acpi: bind registration of miscdev object to
>     parent
>   platform/x86: toshiba_acpi: use device-managed functions for input
>     device
>   platform/x86: toshiba_acpi: register backlight with device-managed
>     variant
>   platform/x86: toshiba_acpi: use devm_led_classdev_register() for LEDs
>   platform/x86: toshiba_acpi: use device-managed functions for
>     accelerometer
>   platform/x86: toshiba_acpi: use device-managed for wwan_rfkill
>     management
>   platform/x86: toshiba_acpi: use device-managed for sysfs removal
>   platform/x86: toshiba_acpi: bind proc entries creation to parent
> 
>  drivers/platform/x86/toshiba_acpi.c | 249 +++++++++++++++++-----------
>  1 file changed, 150 insertions(+), 99 deletions(-)
> 


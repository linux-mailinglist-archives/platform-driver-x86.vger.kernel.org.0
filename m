Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2D5CCA17
	for <lists+platform-driver-x86@lfdr.de>; Sat,  5 Oct 2019 15:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbfJENU5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 5 Oct 2019 09:20:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59866 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726125AbfJENU5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Oct 2019 09:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570281655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v19mNPkRJ9AE8uxKqZArmEnab1FDl/k/mlgPV+xCOYk=;
        b=T8CcrEqPghxbLA5BT3arfI2jxE5iIvHFMlNlhoqTQP6WqKSyz99cJAjiQPMb5bNOUC5J3G
        QVQr+OJMgNW9AXvdo/Eo4OdA5YBVrP8xmbutdpOrTA4fSM9+4rz4mS9735s2msl4ZBZL8p
        z4iz4j1+QtJR1GC7UshZ7yGy5z6bQs8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-aK7AT7WtPsCT6oMx2MvgUg-1; Sat, 05 Oct 2019 09:20:54 -0400
Received: by mail-wr1-f70.google.com with SMTP id 32so4179041wrk.15
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Oct 2019 06:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UJR8lqM5VkVKo9oBw0pEtSAy8UtflGegNgDHZMNB8ts=;
        b=kKJRHKAH1J/3k7tQdb/K+ItwD8IBXmvUhAaesJ1tI96IiFGI1DEHqZU+B3u6vjE/ai
         T8Oj9qUDd7pHXqyXS2TeDL+pof9ebBClNohOCLFKvl86aQdHx7eE+iQ2KN7xw7DV/QBu
         Odu44dGdX5rG92AIo7mQwX2BXXvnv7p7c0aBvl+7nz0hmj2tnYqongfERFRUI6aq1dvA
         cdHStvMfOVDJ9PDA+oGoaVyZIBbxX4GDoK3K5Zl7hZM7TerWeJRtuCT4+Nyled38ZG+o
         SLnUhZZmj0AMFHf0zXlYSEZXBgJJrYjt4pk6ztnjfcjeRLwv6+B8OfgBOeXCH2rqOLZ8
         kyJQ==
X-Gm-Message-State: APjAAAX7bfQcToG6oECkUkJf8REVfoOP2zACka90Qi3JeKhgoCSSCj23
        yD8E8MWcvZmxIa9B3VSVvEOnzFBoHSixrP+VSggw/XMN/OYdX8auosflh6tn6u24HtsXBRdMKgT
        tKFa8IFL4h5bR+iXFPvO+sxesrTiNC65RiA==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr4788399wrv.124.1570281653247;
        Sat, 05 Oct 2019 06:20:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlNkl7ZfSWs+3sYpNvrdOU/jVesoaEKe1ah1PinI5JHbJVH7S7suZLVlWiKs/ptZNLlvmhbA==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr4788390wrv.124.1570281653007;
        Sat, 05 Oct 2019 06:20:53 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id y14sm15566463wrd.84.2019.10.05.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 06:20:52 -0700 (PDT)
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191005105551.353273-1-hdegoede@redhat.com>
 <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
Date:   Sat, 5 Oct 2019 15:20:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
Content-Language: en-US
X-MC-Unique: aK7AT7WtPsCT6oMx2MvgUg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 05-10-2019 14:17, Maximilian Luz wrote:
> Hi,
>=20
> sorry for the inconvenience this change has caused.
>=20
> On 10/5/19 12:55 PM, Hans de Goede wrote:
>> Note ideally this seamingly unrelated change would have been made in a
>> separate commit, with a message explaining the what and why of this
>> change.
>=20
> Would I have known the impact, then yes. This change was added due to
> some reported instances where it seems that soc_button_array would
> occasionally load on MSHW0040 before the GPIO controller was ready,
> causing power and volume buttons to not work.
>=20
>> I guess this change may have been added to deal with -EPROBE_DEFER error=
s,
>=20
> Correct. After a comment mentioned that gpiod_get() returning
> -EPROBE_DEFER would be the proper way to detect this, I decided on this
> change.

Ok, on x86 the GPIO drivers really should all be builtin because
various ACPI methods including device D0 / D3 (power-on/off) methods
may depend on them. So normally this should never happen.

If this (-EPROBE_DEFER on surface devices) somehow still is happening
please let me know and we will figure something out.

> Might I suggest the following addition:
>=20
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

S-o-b is only for patches which pass through your hands, e.g. if
you make changes to my patch and submit a v2 of it.

I guess you mean / want one of:

Acked-by: ...

or

Reviewed-by: ...


?

Regards,

Hans



> ---
>  =C2=A0drivers/input/misc/soc_button_array.c | 25 ++++++++++++++++++++---=
--
>  =C2=A01 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/s=
oc_button_array.c
> index 97e3639e99d0..a0f0c977b790 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -92,11 +92,18 @@ soc_button_device_create(struct platform_device *pdev=
,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio =3D soc_button_loo=
kup_gpio(&pdev->dev, info->acpi_index);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gpio < 0 && gpio !=3D -EN=
OENT) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error=
 =3D gpio;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
err_free_mem;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (!gpio_is_valid(gpi=
o)) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Sk=
ip GPIO if not present */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!gpio_is_valid(gpio)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * Skip GPIO if not present. Note we deliberately
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * ignore -EPROBE_DEFER errors here. On some devices
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * Intel is using so called virtual GPIOs which are not
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * GPIOs at all but some way for AML code to check some
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * random status bits without need a custom opregion.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * In some cases the resources table we parse points to
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * such a virtual GPIO, since these are not real GPIOs
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * we do not have a driver for these so they will never
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * show up, therefor we ignore -EPROBE_DEFER.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> @@ -429,6 +436,14 @@ static int soc_device_check_MSHW0040(struct device *=
dev)
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "OEM Platform Revision %llu\n", oe=
m_platform_rev);
>=20
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Explicitly check if GPIO controller is ready.=
 This check is done here
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to avoid issues with virtual GPIOs on other c=
hips, as elaborated above.
> +=C2=A0=C2=A0=C2=A0=C2=A0 * We are at least expecting one GPIO pin for th=
e power button (index 0).
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if (soc_button_lookup_gpio(dev, 0) =3D=3D -EPROBE_DEF=
ER)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPROBE_DEFER;
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>  =C2=A0}
>=20


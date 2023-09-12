Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 466DA79AD6C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Sep 2023 01:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355948AbjIKWC3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 Sep 2023 18:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237440AbjIKMvN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 08:51:13 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA6EE40
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 05:51:09 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4935f2d6815so2752540e0c.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694436668; x=1695041468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6UC8FbJRnPQ7ZD0ReOlZPTmyF8Yoq6dUR2p60YXF9I=;
        b=k7JizPrL8b5nsitOdPvyjHvhWVLWd7yOjRv0J0hYmffNEYbybS+qqC+KWQhpW+nOLU
         2QBjzbAPVolunq7/sJVOQBBDbBvqdLpgLTgFNSMXymaXniHQenWOTybDSJulTEbuowK/
         pKuTcT/XMePkR06PvLOeZZyD8dzvYm5NVjDUO59iOY+KHhYlU256uzIuVHhJpplE6VWj
         G9Rb6ibBKWcz7Kmhvyv0zT6DZq9PBD6SdqcbLvqFpSKsckyWhUMCE/5OHOLVHbMssJnK
         krcxb2mjMsC+JKKvheIor7mf2CkekNjc4XS051nJy20jKLmfmCyOlpwTUe106lfsE/dX
         NK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694436668; x=1695041468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6UC8FbJRnPQ7ZD0ReOlZPTmyF8Yoq6dUR2p60YXF9I=;
        b=fTXCw3mKQ9aADUfQIDWWXeivb918sQ1EnDbe5fQM+unVVL715UdbcEsPfPc/BU4jsC
         PHLGTSDPeT42JG9sZYgCf908LUq7m2SlZ9rLRE52ed1Wgs/OALCh5x89IbYwqLYrpYzT
         VhTdktgTTQYpglBo6Y6flu3SJt9iQ8mXSsqcVUYb1Bbmn9OqxZYl+/w1goZVArfnqyPr
         1r7tiUXhxTpmyDUv/D9dH4QdBjZyR5I5YhD92qih3ZbvZC4HBfblfQP2umss4xQDLAcB
         6W6LMqK6gCW2p+nhwCVIHuo8KaKyYCPfjfLe765VucdhxGjrmAgKXnlt3YxA4314dkcf
         8WDQ==
X-Gm-Message-State: AOJu0YzHXqjHUWUmr4cqxRYMEUh0ZxSczj/djpSQQf1vRl9OErklmGa6
        Ri8Wg+/5tgxCrIS0RDw1F2ktQ0FZRHQWPbWfJxhCiQ==
X-Google-Smtp-Source: AGHT+IEgFqLrfkfnYxc00t1yJAQxjV1vCpl1FovrLEWk0fRy8zkAgiq/ouRKpLyb/73QkSWuZWaN/UkdCfmWP1WdVGI=
X-Received: by 2002:a1f:2cd4:0:b0:48e:1463:914e with SMTP id
 s203-20020a1f2cd4000000b0048e1463914emr4025807vks.7.1694436668228; Mon, 11
 Sep 2023 05:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com> <20230909141816.58358-7-hdegoede@redhat.com>
In-Reply-To: <20230909141816.58358-7-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 14:50:57 +0200
Message-ID: <CAMRc=MfeKirks7N7scu+dh+M1Nf0bNxzC7PE2Q7J4bxgpRnECw@mail.gmail.com>
Subject: Re: [PATCH 6/8] platform/x86: x86-android-tablets: Stop using gpiolib
 private APIs
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Sep 9, 2023 at 4:18=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Refactor x86_android_tablet_get_gpiod() to no longer use
> gpiolib private functions like gpiochip_find().
>
> As a bonus this allows specifying that the GPIO is active-low,
> like the /CE (charge enable) pin on the bq25892 charger on
> the Lenovo Yoga Tablet 3.
>
> Reported-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Closes: https://lore.kernel.org/platform-driver-x86/20230905185309.131295=
-12-brgl@bgdev.pl/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../platform/x86/x86-android-tablets/asus.c   |  1 +
>  .../platform/x86/x86-android-tablets/core.c   | 51 +++++++++++--------
>  .../platform/x86/x86-android-tablets/lenovo.c | 28 +++++-----
>  .../platform/x86/x86-android-tablets/other.c  |  6 +++
>  .../x86-android-tablets/x86-android-tablets.h |  6 ++-
>  5 files changed, 55 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/pl=
atform/x86/x86-android-tablets/asus.c
> index f9c4083be86d..227afbb51078 100644
> --- a/drivers/platform/x86/x86-android-tablets/asus.c
> +++ b/drivers/platform/x86/x86-android-tablets/asus.c
> @@ -303,6 +303,7 @@ static const struct x86_i2c_client_info asus_tf103c_i=
2c_clients[] __initconst =3D
>                         .index =3D 28,
>                         .trigger =3D ACPI_EDGE_SENSITIVE,
>                         .polarity =3D ACPI_ACTIVE_LOW,
> +                       .con_id =3D "atmel_mxt_ts_irq",
>                 },
>         },
>  };
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/pl=
atform/x86/x86-android-tablets/core.c
> index 3d3101b2848f..673f3a14941b 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -12,7 +12,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
> -#include <linux/gpio/driver.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/irq.h>
>  #include <linux/module.h>
> @@ -21,35 +21,39 @@
>  #include <linux/string.h>
>
>  #include "x86-android-tablets.h"
> -/* For gpiochip_get_desc() which is EXPORT_SYMBOL_GPL() */
> -#include "../../../gpio/gpiolib.h"
> -#include "../../../gpio/gpiolib-acpi.h"
>
>  static struct platform_device *x86_android_tablet_device;
>
> -static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
> -{
> -       return gc->label && !strcmp(gc->label, data);
> -}
> -
> -int x86_android_tablet_get_gpiod(const char *label, int pin, struct gpio=
_desc **desc)
> +int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *=
con_id,
> +                                bool active_low, enum gpiod_flags dflags=
,
> +                                struct gpio_desc **desc)
>  {
> +       struct gpiod_lookup_table *lookup;
>         struct gpio_desc *gpiod;
> -       struct gpio_chip *chip;
>
> -       chip =3D gpiochip_find((void *)label, gpiochip_find_match_label);
> -       if (!chip) {
> -               pr_err("error cannot find GPIO chip %s\n", label);
> -               return -ENODEV;
> -       }
> +       lookup =3D kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
> +       if (!lookup)
> +               return -ENOMEM;
> +
> +       lookup->dev_id =3D KBUILD_MODNAME;
> +       lookup->table[0].key =3D chip;
> +       lookup->table[0].chip_hwnum =3D pin;
> +       lookup->table[0].con_id =3D con_id;
> +       lookup->table[0].flags =3D active_low ? GPIO_ACTIVE_LOW : GPIO_AC=
TIVE_HIGH;
> +
> +       gpiod_add_lookup_table(lookup);
> +       gpiod =3D devm_gpiod_get(&x86_android_tablet_device->dev, con_id,=
 dflags);
> +       gpiod_remove_lookup_table(lookup);
> +       kfree(lookup);
>

Any reason for not creating static lookup tables for GPIOs here?

Bart

> -       gpiod =3D gpiochip_get_desc(chip, pin);
>         if (IS_ERR(gpiod)) {
> -               pr_err("error %ld getting GPIO %s %d\n", PTR_ERR(gpiod), =
label, pin);
> +               pr_err("error %ld getting GPIO %s %d\n", PTR_ERR(gpiod), =
chip, pin);
>                 return PTR_ERR(gpiod);
>         }
>

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EC23E4586
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Aug 2021 14:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhHIMXR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Aug 2021 08:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbhHIMXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Aug 2021 08:23:16 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EE7C0613D3;
        Mon,  9 Aug 2021 05:22:56 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u16so16155756ple.2;
        Mon, 09 Aug 2021 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZozHPN5A0DW3qZDlh5+jVQhUsRKVEgmhxlS9Pcy2SpQ=;
        b=O6W3MZXs6fnpJH16hwmynecWnukJw8HtBQoVtnh3zMEDQDm5bz/mLgbkznKa1/SoQu
         60tkpckZzDNuvV68n4/smYsnm5AFytn2pLiQX8YRAPGy2xv4/1l584kneAZFbkObRvIS
         cEfTeM03dgAZ7u4TWNSlKyKnMs/w/GYWh4fWMCFPdYwnpHwBb3BgKHKXu/EtFiKMPlGU
         r7KsZk+w5owRN1TpKzJrCnUuAcRmA1KPqDrKYKGM08NFEZA+Cs8pvkAXVZSbE9LgfOae
         qbgBxUrnGZNZ1mIQpOha/9GDl6sZ1J/jHAloegxFRnMhu0/bgCSB9bgLIItT1IDGRO8n
         ok6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZozHPN5A0DW3qZDlh5+jVQhUsRKVEgmhxlS9Pcy2SpQ=;
        b=NeEb2oC7jCczDBLWaMiIHDoar5ho7M5cPb7EawmbZFeFG45N8htRiyvTe86UjnfREk
         ol1Th3mZLraz3Yw8nhPQnfs71UKenXdk4miH2Pp33puhFFvQCnETFlD5w3jddaixIb02
         COwLQMN5+wqTyAJGxUa578racr2OkPww0tTD5uk6C/v9YYlhlOtugTVOj8EvRfK9jHNP
         nGpaiv7LIWDPr2O0CGd0n/JHA+xJIXftFaZC7bBJhuL1M2xMnbB3et5GctaKuuUn0qGo
         ezrk0ppJv5+NEuKadg8x19nqW7hrjftE7yIvgW9Hn/YECL0y8GAjspK9cxFIP+n27M8p
         QVJw==
X-Gm-Message-State: AOAM533nPvOKcVhUGvi+nchBwwqKbBSKSiy3lcwN+3rIoNZNx3VU/tki
        U2dUDjXBiSwIqgainpWGuVlvyMfjnKt/4i9aRgg=
X-Google-Smtp-Source: ABdhPJwTER/FTD0Ez+yw3PnNczUX9V7VDyo6qWj0RIaYbrSr1gWm9qfdIJc0KUH9OM+l1hQHs6pwQYWXe4FmfmArmIE=
X-Received: by 2002:a17:90b:33c5:: with SMTP id lk5mr36483327pjb.129.1628511775974;
 Mon, 09 Aug 2021 05:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210809121345.967597-1-chrisrblake93@gmail.com>
In-Reply-To: <20210809121345.967597-1-chrisrblake93@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Aug 2021 15:22:19 +0300
Message-ID: <CAHp75VfQr6XKQ0UDQDq0pH7TK=_WUGBhRKcC_=-zzUGOwO8tWQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: add meraki-mx100 platform driver
To:     Chris Blake <chrisrblake93@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 9, 2021 at 3:13 PM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> network appliance. This sets up the network LEDs and Reset
> button.

Almost good to me, see below for some comments. After addressing them
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> Depends-on: ef0eea5b151ae ("mfd: lpc_ich: Enable GPIO driver for DH89xxCC")
> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> ---
>
> Changelog:
> V3: Additional cleanups, formatting changes
> V2: Move to using gpiod lookup tables, misc cleanups
> V1: Initial Patch
>
>  drivers/platform/x86/Kconfig        |  13 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/meraki-mx100.c | 202 ++++++++++++++++++++++++++++
>  3 files changed, 218 insertions(+)
>  create mode 100644 drivers/platform/x86/meraki-mx100.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7d385c3b2239..8d70176e335f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -302,6 +302,19 @@ config ASUS_NB_WMI
>           If you have an ACPI-WMI compatible Asus Notebook, say Y or M
>           here.
>
> +config MERAKI_MX100
> +       tristate "Cisco Meraki MX100 Platform Driver"
> +       depends on GPIOLIB
> +       depends on GPIO_ICH
> +       depends on LEDS_CLASS
> +       select LEDS_GPIO
> +       help
> +         This driver provides support for the front button and LEDs on
> +         the Cisco Meraki MX100 (Tinkerbell) 1U appliance.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called meraki-mx100.
> +
>  config EEEPC_LAPTOP
>         tristate "Eee PC Hotkey Driver"
>         depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..25c5aee1cde7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_NB_WMI)     += asus-nb-wmi.o
>  obj-$(CONFIG_EEEPC_LAPTOP)     += eeepc-laptop.o
>  obj-$(CONFIG_EEEPC_WMI)                += eeepc-wmi.o
>
> +# Cisco/Meraki
> +obj-$(CONFIG_MERAKI_MX100)     += meraki-mx100.o
> +
>  # Dell
>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)                += dell/
>
> diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/meraki-mx100.c
> new file mode 100644
> index 000000000000..eebbd0a3d806
> --- /dev/null
> +++ b/drivers/platform/x86/meraki-mx100.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Cisco Meraki MX100 (Tinkerbell) board platform driver
> + *
> + * Based off of arch/x86/platform/meraki/tink.c from the
> + * Meraki GPL release meraki-firmware-sources-r23-20150601
> + *
> + * Format inspired by platform/x86/pcengines-apuv2.c
> + *
> + * Copyright (C) 2021 Chris Blake <chrisrblake93@gmail.com>
> + */
> +
> +#define pr_fmt(fmt)    KBUILD_MODNAME ": " fmt
> +
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/gpio_keys.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/input.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define TINK_GPIO_DRIVER_NAME "gpio_ich"
> +
> +/* LEDs */
> +static const struct gpio_led tink_leds[] = {
> +       {
> +               .name = "mx100:green:internet",
> +               .default_trigger = "default-on",
> +       },
> +       {
> +               .name = "mx100:green:lan2",
> +       },
> +       {
> +               .name = "mx100:green:lan3",
> +       },
> +       {
> +               .name = "mx100:green:lan4",
> +       },
> +       {
> +               .name = "mx100:green:lan5",
> +       },
> +       {
> +               .name = "mx100:green:lan6",
> +       },
> +       {
> +               .name = "mx100:green:lan7",
> +       },
> +       {
> +               .name = "mx100:green:lan8",
> +       },
> +       {
> +               .name = "mx100:green:lan9",
> +       },
> +       {
> +               .name = "mx100:green:lan10",
> +       },
> +       {
> +               .name = "mx100:green:lan11",
> +       },
> +};
> +
> +static const struct gpio_led_platform_data tink_leds_pdata = {
> +       .num_leds       = ARRAY_SIZE(tink_leds),
> +       .leds           = tink_leds,
> +};
> +
> +static struct gpiod_lookup_table tink_leds_table = {
> +       .dev_id = "leds-gpio",
> +       .table = {
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 11,
> +                               NULL, 0, GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 18,
> +                               NULL, 1, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 20,
> +                               NULL, 2, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 22,
> +                               NULL, 3, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 23,
> +                               NULL, 4, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 32,
> +                               NULL, 5, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 34,
> +                               NULL, 6, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 35,
> +                               NULL, 7, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 36,
> +                               NULL, 8, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 37,
> +                               NULL, 9, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 48,
> +                               NULL, 10, GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 16,
> +                               NULL, 11, GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 7,
> +                               NULL, 12, GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 21,
> +                               NULL, 13, GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 19,
> +                               NULL, 14, GPIO_ACTIVE_LOW),
> +               {} /* Terminating entry */
> +       }
> +};
> +
> +/* Reset Button */
> +static struct gpio_keys_button tink_buttons[] = {
> +       {
> +               .desc                   = "Reset",
> +               .type                   = EV_KEY,
> +               .code                   = KEY_RESTART,
> +               .active_low             = 1,
> +               .debounce_interval      = 100,
> +       },
> +};
> +
> +static const struct gpio_keys_platform_data tink_buttons_pdata = {
> +       .buttons        = tink_buttons,
> +       .nbuttons       = ARRAY_SIZE(tink_buttons),
> +       .poll_interval  = 20,
> +       .rep            = 0,
> +       .name           = "mx100-keys",
> +};
> +
> +static struct gpiod_lookup_table tink_keys_table = {
> +       .dev_id = "gpio-keys-polled",
> +       .table = {
> +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 60,
> +                               NULL, 0, GPIO_ACTIVE_LOW),
> +               {} /* Terminating entry */
> +       }
> +};
> +
> +/* Board setup */
> +static const struct dmi_system_id tink_systems[] __initconst = {
> +       {
> +               .matches = {
> +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
> +               },
> +       },
> +       {} /* Terminating entry */
> +};
> +MODULE_DEVICE_TABLE(dmi, tink_systems);
> +
> +static struct platform_device *tink_leds_pdev;
> +static struct platform_device *tink_keys_pdev;
> +
> +static struct platform_device * __init tink_create_dev(
> +       const char *name, const void *pdata, size_t sz)
> +{
> +       struct platform_device *pdev;
> +
> +       pdev = platform_device_register_data(NULL,
> +               name, PLATFORM_DEVID_NONE, pdata, sz);
> +       if (IS_ERR(pdev))
> +               pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> +
> +       return pdev;
> +}
> +
> +static int __init tink_board_init(void)
> +{
> +       if (!dmi_first_match(tink_systems))
> +               return -ENODEV;
> +
> +       /*
> +        * We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> +        * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> +        * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> +        */
> +       outl(inl(0x530) | BIT(28), 0x530);
> +
> +       gpiod_add_lookup_table(&tink_leds_table);
> +       gpiod_add_lookup_table(&tink_keys_table);
> +
> +       tink_leds_pdev = tink_create_dev("leds-gpio",
> +               &tink_leds_pdata, sizeof(tink_leds_pdata));

Seems you forgot to add
if (IS_ERR())
  return PTR_ERR();

here...

> +       tink_keys_pdev = tink_create_dev("gpio-keys-polled",
> +               &tink_buttons_pdata, sizeof(tink_buttons_pdata));

and

if (IS_ERR()) {
 pdev_unreg();
 return PTR_ERR();
}

here.

> +       return 0;
> +}
> +module_init(tink_board_init);
> +
> +static void __exit tink_board_exit(void)
> +{
> +       platform_device_unregister(tink_keys_pdev);
> +       platform_device_unregister(tink_leds_pdev);
> +       gpiod_remove_lookup_table(&tink_keys_table);
> +       gpiod_remove_lookup_table(&tink_leds_table);
> +}
> +module_exit(tink_board_exit);
> +
> +MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
> +MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:meraki-mx100");
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko

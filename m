Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9AA3E457D
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Aug 2021 14:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbhHIMUk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Aug 2021 08:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbhHIMUk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Aug 2021 08:20:40 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40B5C0613D3;
        Mon,  9 Aug 2021 05:20:19 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id z9-20020a9d62c90000b0290462f0ab0800so8353539otk.11;
        Mon, 09 Aug 2021 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=oGsAvSdgKRu8fhmRgYOCEUPwgqjzXbVYGJowCGAt0iQ=;
        b=htdm9KXqHhQmGU4mscn7Vn6FITaNgXVfZAmH6G8vYskf9veKzp0iy4QV7gEz3kuCTm
         ncZAH931uMM66sxJJ+STasgMOpsmf0m7pks0ZBkJDjJlb4foq5dR2bTwSvs/6QzcyeVA
         VRu5s3D62K2S/6AoskZNiYvhyZ0YEDLcLBZmtmooLx7MEEgc6nfIbJ0WR6ks1C/MOG4N
         RrVnggb+IueBAwlwwOB63JYUowS0EJ/tkU4/2tBqTsAUvhK/raeMNMWWiBJruNDNcq/V
         4n6Y8cOPvbVVjgTjMCklRpdzV9BfeegkpUpTDequauiuyGsu/QeIk+snS5tkka0qENQT
         I9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=oGsAvSdgKRu8fhmRgYOCEUPwgqjzXbVYGJowCGAt0iQ=;
        b=ZEjDG555aHdV3fZ2zQPzuOFt9QOlETNbCN4HKkvda/PIM4531mKinaotx7uLIwxVd/
         FbtsTV5kfUqoU5El7aKAexK2g4KiQwbgVAxHqAhnTfx0qzRuHXBuf1WLIqcsjEtLB4hJ
         c/4XDtaV9X6l9NP46/yOM2+DhtIjGuZBhujD+R09JZEMWRyBSW9W3SaQWjKsbu6JDOIG
         2uVRccIm7yY4Vwa8SVPXiKouOn05bX/2rLjY490Ok1sAa3YO0gxLQ2kqlWmbwYiKBx3P
         3BJ36kjTPWho//uvod2s83qqWk4FSqyTjfSFKIl7Bp6bKwgNk63y+EFTGVO25dl6XH9Y
         dSAw==
X-Gm-Message-State: AOAM5336XJWDVUHFeJQGetrCl0BFYjq3Splif9C2gxveNQ0hOXJRb0cf
        SKfU3+p5kWFjNVF+c23zKgxFq7+Sn77FaEr1prG1IuLYOM0J5A==
X-Google-Smtp-Source: ABdhPJw67yUdh5QbdTBEQ5snA09MNJQZc/uBHr1QS9ALxamQ414IpvWvvUdqjFC7FMALu1lvGsAAddWPijiLuzz4fhA=
X-Received: by 2002:a9d:2609:: with SMTP id a9mr491716otb.365.1628511618857;
 Mon, 09 Aug 2021 05:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210809121345.967597-1-chrisrblake93@gmail.com>
In-Reply-To: <20210809121345.967597-1-chrisrblake93@gmail.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Mon, 9 Aug 2021 07:20:07 -0500
Message-ID: <CALpBJjoc91-WWFYE4h-2eT-wf2Gv8fc8Mn57vq-nD_LG1MKuXQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: add meraki-mx100 platform driver
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 9, 2021 at 7:13 AM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> network appliance. This sets up the network LEDs and Reset
> button.
>
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
> +
> +       tink_keys_pdev = tink_create_dev("gpio-keys-polled",
> +               &tink_buttons_pdata, sizeof(tink_buttons_pdata));
> +
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

Please do not merge, I just realized I forgot to add in 2x LEDs after
the move to gpiod lookup tables. Expect a V4 in the future.

Regards,
Chris B

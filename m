Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92ABE22FC16
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Jul 2020 00:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgG0WYT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 18:24:19 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:22466 "EHLO
        mail-40140.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgG0WYT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 18:24:19 -0400
X-Greylist: delayed 531 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Jul 2020 18:24:15 EDT
Date:   Mon, 27 Jul 2020 22:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595888122;
        bh=6vTlEPTJQBepU2CKP/b9S9CdiOKiPO1Yo8hmBzyXfBY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=n3d4jTNSj8wWFpdwugDrubNmTVdtkhSaJkaZrYPsqkQqpZVOMRfT3In7vzxlnMM8j
         HDeFgCBJ4O5OSQHDHLsYiyWGh6f/yEJlVTuibVNhKQADm2yBMexJiZHAd3Rs4JDZOP
         EzVEwwHyG9/sascIy+Hm4hzBXlZA3oSpeHSfr95g=
To:     Daniel Dadap <ddadap@nvidia.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Aaron Plattner <aplattner@nvidia.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Message-ID: <ZmhDkePhxJBYh0z12GllQuY_EV0Xog34L_Qd53D0nK2fqlKzRXIJgDrxp8mVwDhjngxlfyFmtW3VQ-Wy5lIbkIIhqBKbnJSQZa7TOWoNdpg=@protonmail.com>
In-Reply-To: <20200727205703.28140-1-ddadap@nvidia.com>
References: <20200727205703.28140-1-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am no authority here to say if this patch is good or bad, but I hope to h=
elp with my comments.


> A number of upcoming notebook computer designs drive the internal
> display panel's backlight PWM through the Embedded Controller (EC).
> This EC-based backlight control can be plumbed through to an ACPI
> "WMAA" method interface, which in turn can be wrapped by WMI with
> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>
> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
> backlight class driver to control backlight levels on systems with
> EC-driven backlights.
>
> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  MAINTAINERS                               |   6 +
>  drivers/platform/x86/Kconfig              |  11 ++
>  drivers/platform/x86/Makefile             |   2 +
>  drivers/platform/x86/wmaa-backlight-wmi.c | 153 ++++++++++++++++++++++
>  4 files changed, 172 insertions(+)
>  create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeff55560759..e5ce6544a3c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18249,6 +18249,12 @@ L:=09linux-wireless@vger.kernel.org
>  S:=09Odd fixes
>  F:=09drivers/net/wireless/wl3501*
>
> +WMAA BACKLIGHT DRIVER
> +M:=09Daniel Dadap <ddadap@nvidia.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Supported
> +F:=09drivers/platform/x86/wmaa-backlight-wmi.c
> +
>  WOLFSON MICROELECTRONICS DRIVERS
>  L:=09patches@opensource.cirrus.com
>  T:=09git https://github.com/CirrusLogic/linux-drivers.git
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0ad7ad8cf8e1..db342e480aa9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1368,6 +1368,17 @@ config INTEL_TELEMETRY
>  =09  directly via debugfs files. Various tools may use
>  =09  this interface for SoC state monitoring.
>
> +config WMAA_BACKLIGHT_WMI
> +=09tristate "ACPI WMAA Backlight Driver"
> +=09depends on ACPI_WMI
> +=09depends on ACPI
> +=09depends on BACKLIGHT_CLASS_DEVICE
> +=09help
> +=09  This driver provides a sysfs backlight interface for notebook
> +=09  systems which expose the WMAA ACPI method and an associated WMI
> +=09  wrapper to drive LCD backlight levels through the system's
> +=09  Embedded Controller.
> +
>  endif # X86_PLATFORM_DEVICES
>
>  config PMC_ATOM
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 53408d965874..fb6e16d62031 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)=09=09+=3D intel_telemet=
ry_core.o  =09=09   intel_telemetry_pltdrv.o  =09=09=09=09=09   intel_telem=
etry_debugfs.o
>  obj-$(CONFIG_PMC_ATOM)=09=09=09+=3D pmc_atom.o
> +
> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)=09+=3D wmaa-backlight-wmi.o
> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform=
/x86/wmaa-backlight-wmi.c
> new file mode 100644
> index 000000000000..890e9371f91a
> --- /dev/null
> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * WMAA Backlight WMI driver
> + *
> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/backlight.h>
> +
> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
> +MODULE_LICENSE("GPL v2");
> +
> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> +
> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
> +
> +static struct backlight_device *backlight;
> +
> +enum wmaa_method {
> +=09WMAA_BRIGHTNESS_LEVEL =3D 1,
> +=09WMAA_BRIGHTNESS_SOURCE =3D 2,
> +};
> +
> +enum wmaa_get_or_set {
> +=09WMAA_GET =3D 0,
> +=09WMAA_SET =3D 1,
> +=09WMAA_GET_MAX =3D 2, // for WMAA_BRIGHTNESS_LEVEL only
> +};
> +
> +enum wmaa_source {
> +=09WMAA_SOURCE_CLEAR =3D 0,
> +=09WMAA_SOURCE_GPU =3D 1,
> +=09WMAA_SOURCE_EC =3D 2,
> +=09WMAA_SOURCE_AUX =3D 3,
> +=09WMAA_SOURCE_COUNT
> +};
> +
> +struct wmaa_args {
> +=09u32 set;
> +=09u32 val;
> +=09u32 ret;
> +=09u32 ignored[3];
> +};
> +
> +static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set s=
et,
> +=09=09=09 u32 *val)
> +{
> +=09struct wmaa_args args =3D {
> +=09=09.set =3D set,
> +=09=09.val =3D 0,
> +=09=09.ret =3D 0,
> +=09};
> +=09struct acpi_buffer buf =3D { (acpi_size)sizeof(args), &args };
> +=09acpi_status status;
> +
> +=09if (set =3D=3D WMAA_SET)
> +=09=09args.val =3D *val;
> +
> +=09status =3D wmi_evaluate_method(WMAA_WMI_GUID, 0, method, &buf, &buf);
> +=09if (ACPI_FAILURE(status))
> +=09=09return status;
> +=09if (set !=3D WMAA_SET)
> +=09=09*val =3D args.ret;
> +=09return status;
> +}
> +

This might be a moot point, but can't the conversion from acpi_status to in=
t have unwanted effects? And furthermore, as far as I see, ACPICA error con=
stants do not map to Exxxx constants, so either an Exxxx constant should be=
 returned from wmi_call_wmaa() on error, or it should return an acpi_status=
 value, and the conversion should be handled in the functions using wmi_cal=
l_wmaa(), in my opinion.


> +static int wmaa_get_brightness(u32 *level)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
> +}
> +
> +static int wmaa_set_brightness(u32 level)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
> +}
> +
> +static int wmaa_backlight_update_status(struct backlight_device *bd)
> +{
> +=09return wmaa_set_brightness(bd->props.brightness);
> +}
> +
> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
> +{
> +=09u32 level;
> +=09int ret =3D wmaa_get_brightness(&level);
> +
> +=09WARN_ON(ret !=3D 0);
> +=09return level;
> +}
> +

Also another moot point, but wouldn't it be "safer" (certainly more determi=
nistic) to return zero if something goes wrong? (As far as I see, the error=
 codes are not handled by the backlight subsystem for get_brightness.)


> +static const struct backlight_ops wmaa_backlight_ops =3D {
> +=09.update_status =3D wmaa_backlight_update_status,
> +=09.get_brightness =3D wmaa_backlight_get_brightness,
> +};
> +
> +static int wmaa_get_max_brightness(u32 *level)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
> +}
> +
> +static int wmaa_get_brightness_source(u32 *source)
> +{
> +=09return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
> +}
> +
> +static int __init wmaa_backlight_wmi_init(void)
> +{
> +=09struct backlight_properties props;

And a third possibly insignificant point: shouldn't the power and scale mem=
bers of props be initialized as well?


> +=09u32 source;
> +
> +=09if (!wmi_has_guid(WMAA_WMI_GUID))
> +=09=09return -ENODEV;
> +
> +=09if (wmaa_get_brightness_source(&source))
> +=09=09return -EINVAL;
> +=09if (source !=3D WMAA_SOURCE_EC)
> +=09=09return -ENODEV;
> +
> +=09// Register a backlight handler
> +=09props.type =3D BACKLIGHT_PLATFORM;
> +=09if (wmaa_get_max_brightness(&props.max_brightness) ||
> +=09    wmaa_get_brightness(&props.brightness))
> +=09=09return -EINVAL;
> +
> +=09backlight =3D backlight_device_register("wmaa_backlight", NULL, NULL,
> +=09=09=09=09=09      &wmaa_backlight_ops, &props);
> +=09if (IS_ERR(backlight))
> +=09=09return PTR_ERR(backlight);
> +
> +=09return 0;
> +}
> +
> +static void __exit wmaa_backlight_wmi_exit(void)
> +{
> +=09backlight_device_unregister(backlight);
> +}
> +
> +module_init(wmaa_backlight_wmi_init);
> +module_exit(wmaa_backlight_wmi_exit);
> --
> 2.18.4



I think this should be sent to the subsystem maintainers as well, so I CCd =
them.


Barnab=C3=A1s P=C5=91cze

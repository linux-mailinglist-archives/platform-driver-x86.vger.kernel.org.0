Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D71D23134D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Jul 2020 21:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgG1T6X (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Jul 2020 15:58:23 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9106 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728906AbgG1T6X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jul 2020 15:58:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2083510000>; Tue, 28 Jul 2020 12:58:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jul 2020 12:58:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jul 2020 12:58:23 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 19:58:22 +0000
Subject: Re: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based backlight
 control
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Aaron Plattner <aplattner@nvidia.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
References: <20200727205703.28140-1-ddadap@nvidia.com>
 <ZmhDkePhxJBYh0z12GllQuY_EV0Xog34L_Qd53D0nK2fqlKzRXIJgDrxp8mVwDhjngxlfyFmtW3VQ-Wy5lIbkIIhqBKbnJSQZa7TOWoNdpg=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <a0d74722-7a37-5a82-3b26-85db84a66f9d@nvidia.com>
Date:   Tue, 28 Jul 2020 14:59:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ZmhDkePhxJBYh0z12GllQuY_EV0Xog34L_Qd53D0nK2fqlKzRXIJgDrxp8mVwDhjngxlfyFmtW3VQ-Wy5lIbkIIhqBKbnJSQZa7TOWoNdpg=@protonmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595966289; bh=nIM//5nld4qO+u8BV4zH4WzC/wT+ia8hdhWUgI1aIj8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=jaXxWWxaqyjVm4spMJOZUnIKWtzppHYSpqTwaKq3Mvwe+KnER23HNSqwnZqEl3WtM
         6/EQiwGvWsRCDaM+lBdAIYOV7nr3p/oTjRkIfAuKiPLfL1OHnAArMgA8Zi6xucQcJW
         nZ80BpJ2QiDIGV9scgwx5SAa6bMmyDd/WAGrhjqN8G9f4wuZybwoA+6pOHccqjqdQ4
         9YHraTwV5DTmjMjX9LZQkArdMyhx+lcJZc6WcVkY/C+g+uuowGeeJn3JAOW/bRxOC9
         jsJxz9PxxsdEtaQuwyBePT+ovMbdW55yzvzhlf+XKtuGprNOpvGeKgZs1QpoJgogGr
         A97CSPsWPnyBw==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for your comments. I'll send a v2 patch as soon as I can get an=20
answer about the values for the power and scale members of the struct=20
backlight_properties record. Additional responses below:

On 7/27/20 5:15 PM, Barnab=C3=A1s P=C5=91cze wrote:
> I am no authority here to say if this patch is good or bad, but I hope to=
 help with my comments.
>
>
>> A number of upcoming notebook computer designs drive the internal
>> display panel's backlight PWM through the Embedded Controller (EC).
>> This EC-based backlight control can be plumbed through to an ACPI
>> "WMAA" method interface, which in turn can be wrapped by WMI with
>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>
>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>> backlight class driver to control backlight levels on systems with
>> EC-driven backlights.
>>
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   MAINTAINERS                               |   6 +
>>   drivers/platform/x86/Kconfig              |  11 ++
>>   drivers/platform/x86/Makefile             |   2 +
>>   drivers/platform/x86/wmaa-backlight-wmi.c | 153 ++++++++++++++++++++++
>>   4 files changed, 172 insertions(+)
>>   create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index eeff55560759..e5ce6544a3c8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18249,6 +18249,12 @@ L:   linux-wireless@vger.kernel.org
>>   S:   Odd fixes
>>   F:   drivers/net/wireless/wl3501*
>>
>> +WMAA BACKLIGHT DRIVER
>> +M:   Daniel Dadap <ddadap@nvidia.com>
>> +L:   platform-driver-x86@vger.kernel.org
>> +S:   Supported
>> +F:   drivers/platform/x86/wmaa-backlight-wmi.c
>> +
>>   WOLFSON MICROELECTRONICS DRIVERS
>>   L:   patches@opensource.cirrus.com
>>   T:   git https://github.com/CirrusLogic/linux-drivers.git
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 0ad7ad8cf8e1..db342e480aa9 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1368,6 +1368,17 @@ config INTEL_TELEMETRY
>>          directly via debugfs files. Various tools may use
>>          this interface for SoC state monitoring.
>>
>> +config WMAA_BACKLIGHT_WMI
>> +     tristate "ACPI WMAA Backlight Driver"
>> +     depends on ACPI_WMI
>> +     depends on ACPI
>> +     depends on BACKLIGHT_CLASS_DEVICE
>> +     help
>> +       This driver provides a sysfs backlight interface for notebook
>> +       systems which expose the WMAA ACPI method and an associated WMI
>> +       wrapper to drive LCD backlight levels through the system's
>> +       Embedded Controller.
>> +
>>   endif # X86_PLATFORM_DEVICES
>>
>>   config PMC_ATOM
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
>> index 53408d965874..fb6e16d62031 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)             +=3D intel=
_telemetry_core.o                  intel_telemetry_pltdrv.o                =
                        intel_telemetry_debugfs.o
>>   obj-$(CONFIG_PMC_ATOM)                       +=3D pmc_atom.o
>> +
>> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)     +=3D wmaa-backlight-wmi.o
>> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platfor=
m/x86/wmaa-backlight-wmi.c
>> new file mode 100644
>> index 000000000000..890e9371f91a
>> --- /dev/null
>> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
>> @@ -0,0 +1,153 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * WMAA Backlight WMI driver
>> + *
>> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify=
 it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHO=
UT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> + * more details.
>> + *
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/backlight.h>
>> +
>> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
>> +MODULE_LICENSE("GPL v2");
>> +
>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>> +
>> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
>> +
>> +static struct backlight_device *backlight;
>> +
>> +enum wmaa_method {
>> +     WMAA_BRIGHTNESS_LEVEL =3D 1,
>> +     WMAA_BRIGHTNESS_SOURCE =3D 2,
>> +};
>> +
>> +enum wmaa_get_or_set {
>> +     WMAA_GET =3D 0,
>> +     WMAA_SET =3D 1,
>> +     WMAA_GET_MAX =3D 2, // for WMAA_BRIGHTNESS_LEVEL only
>> +};
>> +
>> +enum wmaa_source {
>> +     WMAA_SOURCE_CLEAR =3D 0,
>> +     WMAA_SOURCE_GPU =3D 1,
>> +     WMAA_SOURCE_EC =3D 2,
>> +     WMAA_SOURCE_AUX =3D 3,
>> +     WMAA_SOURCE_COUNT
>> +};
>> +
>> +struct wmaa_args {
>> +     u32 set;
>> +     u32 val;
>> +     u32 ret;
>> +     u32 ignored[3];
>> +};
>> +
>> +static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set =
set,
>> +                      u32 *val)
>> +{
>> +     struct wmaa_args args =3D {
>> +             .set =3D set,
>> +             .val =3D 0,
>> +             .ret =3D 0,
>> +     };
>> +     struct acpi_buffer buf =3D { (acpi_size)sizeof(args), &args };
>> +     acpi_status status;
>> +
>> +     if (set =3D=3D WMAA_SET)
>> +             args.val =3D *val;
>> +
>> +     status =3D wmi_evaluate_method(WMAA_WMI_GUID, 0, method, &buf, &bu=
f);
>> +     if (ACPI_FAILURE(status))
>> +             return status;
>> +     if (set !=3D WMAA_SET)
>> +             *val =3D args.ret;
>> +     return status;
>> +}
>> +
> This might be a moot point, but can't the conversion from acpi_status to =
int have unwanted effects? And furthermore, as far as I see, ACPICA error c=
onstants do not map to Exxxx constants, so either an Exxxx constant should =
be returned from wmi_call_wmaa() on error, or it should return an acpi_stat=
us value, and the conversion should be handled in the functions using wmi_c=
all_wmaa(), in my opinion.


Good point. I've adjusted this to return -EIO in the case of an ACPI=20
error, with a print to indicate the particular error.


>
>> +static int wmaa_get_brightness(u32 *level)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
>> +}
>> +
>> +static int wmaa_set_brightness(u32 level)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
>> +}
>> +
>> +static int wmaa_backlight_update_status(struct backlight_device *bd)
>> +{
>> +     return wmaa_set_brightness(bd->props.brightness);
>> +}
>> +
>> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +     u32 level;
>> +     int ret =3D wmaa_get_brightness(&level);
>> +
>> +     WARN_ON(ret !=3D 0);
>> +     return level;
>> +}
>> +
> Also another moot point, but wouldn't it be "safer" (certainly more deter=
ministic) to return zero if something goes wrong? (As far as I see, the err=
or codes are not handled by the backlight subsystem for get_brightness.)


Perhaps; however, it does seem that at least some other backlight=20
handlers return negative error codes from their get_brightness=20
functions, so I'll wait for comment from the subsystem maintainers.


>
>> +static const struct backlight_ops wmaa_backlight_ops =3D {
>> +     .update_status =3D wmaa_backlight_update_status,
>> +     .get_brightness =3D wmaa_backlight_get_brightness,
>> +};
>> +
>> +static int wmaa_get_max_brightness(u32 *level)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
>> +}
>> +
>> +static int wmaa_get_brightness_source(u32 *source)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
>> +}
>> +
>> +static int __init wmaa_backlight_wmi_init(void)
>> +{
>> +     struct backlight_properties props;
> And a third possibly insignificant point: shouldn't the power and scale m=
embers of props be initialized as well?


Probably. I'll need to check to see what the appropriate values are for=20
this hardware. In the meantime I'll zero-initialize the whole struct=20
until I can get the correct values.


>
>> +     u32 source;
>> +
>> +     if (!wmi_has_guid(WMAA_WMI_GUID))
>> +             return -ENODEV;
>> +
>> +     if (wmaa_get_brightness_source(&source))
>> +             return -EINVAL;
>> +     if (source !=3D WMAA_SOURCE_EC)
>> +             return -ENODEV;
>> +
>> +     // Register a backlight handler
>> +     props.type =3D BACKLIGHT_PLATFORM;
>> +     if (wmaa_get_max_brightness(&props.max_brightness) ||
>> +         wmaa_get_brightness(&props.brightness))
>> +             return -EINVAL;
>> +
>> +     backlight =3D backlight_device_register("wmaa_backlight", NULL, NU=
LL,
>> +                                           &wmaa_backlight_ops, &props)=
;
>> +     if (IS_ERR(backlight))
>> +             return PTR_ERR(backlight);
>> +
>> +     return 0;
>> +}
>> +
>> +static void __exit wmaa_backlight_wmi_exit(void)
>> +{
>> +     backlight_device_unregister(backlight);
>> +}
>> +
>> +module_init(wmaa_backlight_wmi_init);
>> +module_exit(wmaa_backlight_wmi_exit);
>> --
>> 2.18.4
>
>
> I think this should be sent to the subsystem maintainers as well, so I CC=
d them.
>
>
> Barnab=C3=A1s P=C5=91cze

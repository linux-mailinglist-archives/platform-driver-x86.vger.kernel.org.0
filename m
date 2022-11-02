Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D98D616E5C
	for <lists+platform-driver-x86@lfdr.de>; Wed,  2 Nov 2022 21:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiKBULS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 2 Nov 2022 16:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiKBULQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Nov 2022 16:11:16 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B3E102;
        Wed,  2 Nov 2022 13:11:13 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id n130so22469891yba.10;
        Wed, 02 Nov 2022 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EC+nTL7ucIkRzaLT4YjgZoMvniGw2lsLRYEZN2/yT0=;
        b=VEXgUbkLqJFQTIXsEkFJsA/NVwA4wJpJXkIY7pFTIZe6GY2QB2XGWlgYFEpM362YPD
         NP9y0qw5qxZla3ROnDxvDxhuzlQFTmdg5gIbM6bu0mV/02wBpriY1mEQhmkw7EDzKy8F
         op+Hl1KyOYl4GuR20GlHenaEXQ/mon3ok7RjQfp804M2kjcX4QxV8ECIPRpyeEfQVlqt
         /QAfoZKo1ibrc1DbYqqy/aFlW0fC3ulAduwsoFcldT/jGkp3cweONQ2WTlWzcCxQtM4D
         8OJlr+xAm8mmiCmoSPlrwRl/neyNEwMZQAr7qSC3WNl05JVsU86uQTJDl0pw6wUJ1KI3
         o7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EC+nTL7ucIkRzaLT4YjgZoMvniGw2lsLRYEZN2/yT0=;
        b=hUJUibmpL3TuHvduQ6BY/5lclaaF5MEUoJ7DvSPH0+DP+KocLroKMQnqCZ/e01zJyk
         lqraKJjwoa+Aaoz+0W54Wm7o0mzJkz4j3VHsHvXX7wjRuiJ/KUZQ0OEGkcWRmMX2KNxc
         BVLHMbfPNJE78hiQX7Yzc3ZgZCjgDB7u/DBWJVO288ltJvVXdLWIZyL5eSXH8ieqmIls
         q1KMZ61Ku2qSkeJj1b8RTnloOfNxmMKlSDEnuAerOvbtjBd2WTeSL0dtRUxt9KSulfF0
         kh+1U3DC8PI+XegMYawFeonjbhE/+pDtbUGLJ+vdf+2MfiznBmPsO1wXsMANjhPjquc1
         CS3A==
X-Gm-Message-State: ACrzQf1ZWN8iu4r1tlePBsKWZKbcrvKtUS9RG5mlBxbN47h7+CSlZvWd
        Zuxo8UE9uH2ZA6B4EBP39x7hDmAqedKKJYWyhm8=
X-Google-Smtp-Source: AMsMyM7AdqJMftpMIFgX0SSPIG/2yoe2bh0th7h1OW7gM5FqBPsYyWy0yCkOaWX6AnV6OwY40D/T1TW09vq5hfJoDvg=
X-Received: by 2002:a05:6902:70f:b0:6ca:7254:c2ea with SMTP id
 k15-20020a056902070f00b006ca7254c2eamr27212572ybt.476.1667419872563; Wed, 02
 Nov 2022 13:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221102150440.208228-1-samsagax@gmail.com> <20221102180430.GC2913353@roeck-us.net>
In-Reply-To: <20221102180430.GC2913353@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Wed, 2 Nov 2022 17:11:00 -0300
Message-ID: <CABgtM3jXVTjxEJXmCXG+z_DGaHAkFFVjZBa2bOCbeqFveesWrA@mail.gmail.com>
Subject: Re: [PATCH v4] Add OneXPlayer mini AMD sensors driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

El mi=C3=A9, 2 nov 2022 a la(s) 15:04, Guenter Roeck (linux@roeck-us.net) e=
scribi=C3=B3:
>
> On Wed, Nov 02, 2022 at 12:04:40PM -0300, Joaqu=C3=ADn Ignacio Aramend=C3=
=ADa wrote:
> > Sensors driver for OXP Handhelds from One-Netbook that expose fan readi=
ng
> > and control via hwmon sysfs.
> >
> > As far as I could gather all OXP boards have the same DMI strings and
> > they are told appart by the boot cpu vendor (Intel/AMD).
> > Currently only AMD boards are supported.
> >
> > Fan control is provided via pwm interface in the range [0-255]. AMD
> > boards have [0-100] as range in the EC, the written value is scaled to
> > accommodate for that.
> >
> > Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> > ---
> > Added Documentation entry
> > Added MAINTAINERS entry
> > Removed unnecessary code complexity
> > Fixed all checkpatch --strict checks
> > ---
> >  Documentation/hwmon/index.rst       |   1 +
> >  Documentation/hwmon/oxp-sensors.rst |  24 +++
> >  MAINTAINERS                         |   6 +
> >  drivers/hwmon/Kconfig               |  11 ++
> >  drivers/hwmon/Makefile              |   1 +
> >  drivers/hwmon/oxp-sensors.c         | 254 ++++++++++++++++++++++++++++
> >  6 files changed, 297 insertions(+)
> >  create mode 100644 Documentation/hwmon/oxp-sensors.rst
> >  create mode 100644 drivers/hwmon/oxp-sensors.c
> >
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.=
rst
> > index c1d11cf13eef..098986bfbfdd 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -160,6 +160,7 @@ Hardware Monitoring Kernel Drivers
> >     nzxt-kraken2
> >     nzxt-smart2
> >     occ
> > +   oxp-sensors
> >     pc87360
> >     pc87427
> >     pcf8591
> > diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/=
oxp-sensors.rst
> > new file mode 100644
> > index 000000000000..023441d17a45
> > --- /dev/null
> > +++ b/Documentation/hwmon/oxp-sensors.rst
> > @@ -0,0 +1,24 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +Kernel driver oxp-sensors
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +Authors:
>
> s/Authors/Author/

Done

> > +    - Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> > +
> > +Description:
> > +------------
> > +
> > +One X Player devices from One Netbook provide fan readings and fan con=
trol
> > +through its Embedded Controller.
> > +
> > +Currently only supports AMD boards from the One X Player lineup. Intel=
 boards
> > +could be supported if we could figure out the EC registers and values =
to write
> > +to since the EC layout and model is different.
> > +
> > +Sensor values are read and written from EC registers, and to avoid rac=
e with
> > +the board firmware the driver acquires ACPI mutex.
> > +
> > +Fan control is provided via pwm sysfs attribute in the range [0-255]. =
AMD
> > +boards use [0-100] as range values in the EC, the value is scaled to
> > +accommodate for that.
>
> Drop the last two paragraphs; those are implementation details
> which belong into the driver.
>
> List the supported sysfs attributes instead (without the scaling detail).
> See other driver documentation for examples.

Done

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2034e7d26684..c2e24a830875 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15337,6 +15337,12 @@ S:   Maintained
> >  F:   drivers/mtd/nand/onenand/
> >  F:   include/linux/mtd/onenand*.h
> >
> > +ONEXPLAYER FAN DRIVER
> > +M:   Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> > +L:   linux-hwmon@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/hwmon/oxp-sensors.c
> > +
> >  ONION OMEGA2+ BOARD
> >  M:   Harvey Hunt <harveyhuntnexus@gmail.com>
> >  L:   linux-mips@vger.kernel.org
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 7ac3daaf59ce..993ffa26e44f 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1607,6 +1607,17 @@ config SENSORS_NZXT_SMART2
> >
> >  source "drivers/hwmon/occ/Kconfig"
> >
> > +config SENSORS_OXP
> > +     tristate "OneXPlayer EC fan control"
> > +     depends on ACPI
> > +     depends on X86
> > +     help
> > +             If you say yes here you get support for fan readings and =
control over
> > +             OneXPlayer handheld devices. Only OneXPlayer mini AMD han=
dheld variant
> > +             boards are supported.
> > +
> > +             Can also be built as a module. In that case it will be ca=
lled oxp-sensors.
> > +
> >  config SENSORS_PCF8591
> >       tristate "Philips PCF8591 ADC/DAC"
> >       depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 11d076cad8a2..35824f8be455 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NSA320)      +=3D nsa320-hwmon=
.o
> >  obj-$(CONFIG_SENSORS_NTC_THERMISTOR) +=3D ntc_thermistor.o
> >  obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) +=3D nzxt-kraken2.o
> >  obj-$(CONFIG_SENSORS_NZXT_SMART2) +=3D nzxt-smart2.o
> > +obj-$(CONFIG_SENSORS_OXP) +=3D oxp-sensors.o
> >  obj-$(CONFIG_SENSORS_PC87360)        +=3D pc87360.o
> >  obj-$(CONFIG_SENSORS_PC87427)        +=3D pc87427.o
> >  obj-$(CONFIG_SENSORS_PCF8591)        +=3D pcf8591.o
> > diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> > new file mode 100644
> > index 000000000000..00b3aacfb017
> > --- /dev/null
> > +++ b/drivers/hwmon/oxp-sensors.c
> > @@ -0,0 +1,254 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Platform driver for OXP Handhelds that expose fan reading and contr=
ol
> > + * via hwmon sysfs.
> > + *
> > + * All boards have the same DMI strings and they are told appart by th=
e
> > + * boot cpu vendor (Intel/AMD). Currently only AMD boards are supporte=
d
> > + * but the code is made to be simple to add other handheld boards in t=
he
> > + * future.
> > + * Fan control is provided via pwm interface in the range [0-255]. AMD
> > + * boards use [0-100] as range in the EC, the written value is scaled =
to
> > + * accommodate for that.
> > + *
> > + * Copyright (C) 2022 Joaqu=C3=ADn I. Aramend=C3=ADa <samsagax@gmail.c=
om>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/dmi.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/processor.h>
> > +
> > +/* Handle ACPI lock mechanism */
> > +static u32 oxp_mutex;
> > +
> > +#define ACPI_LOCK_DELAY_MS   500
> > +
> > +static bool lock_global_acpi_lock(void)
> > +{
> > +     return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS, =
&oxp_mutex));
> > +}
> > +
> > +static bool unlock_global_acpi_lock(void)
> > +{
> > +     return ACPI_SUCCESS(acpi_release_global_lock(oxp_mutex));
> > +}
> > +
> > +#define OXP_SENSOR_FAN_REG           0x76 /* Fan reading is 2 register=
s long */
> > +#define OXP_SENSOR_PWM_ENABLE_REG    0x4A /* PWM enable is 1 register =
long */
> > +#define OXP_SENSOR_PWM_REG           0x4B /* PWM reading is 1 register=
 long */
> > +
> > +static const struct dmi_system_id dmi_table[] =3D {
> > +     {
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONE XPLAYER"),
> > +             },
> > +     },
> > +     {},
> > +};
> > +
> > +/* Helper functions to handle EC read/write */
> > +static int read_from_ec(u8 reg, int size, long *val)
> > +{
> > +     int i;
> > +     int ret;
> > +     u8 buffer;
> > +
> > +     if (!lock_global_acpi_lock())
> > +             return -EBUSY;
> > +
> > +     *val =3D 0;
> > +     for (i =3D 0; i < size; i++) {
> > +             ret =3D ec_read(reg + i, &buffer);
> > +             if (ret)
> > +                     return ret;
> > +             *val <<=3D i * 8;
> > +             *val +=3D buffer;
> > +     }
> > +
> > +     if (!unlock_global_acpi_lock())
> > +             return -EBUSY;
> > +
> > +     return 0;
> > +}
> > +
> > +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> > +{
> > +     int ret;
> > +
> > +     if (!lock_global_acpi_lock())
> > +             return -EBUSY;
> > +
> > +     ret =3D ec_write(reg, value);
> > +
> > +     if (!unlock_global_acpi_lock())
> > +             return -EBUSY;
> > +
> > +     return ret;
> > +}
> > +
> > +static int oxp_pwm_enable(const struct device *dev)
> > +{
> > +     return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x01);
> > +}
> > +
> > +static int oxp_pwm_disable(const struct device *dev)
> > +{
> > +     return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x00);
> > +}
> > +
> > +/* Callbacks for hwmon interface */
> > +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
> > +                                    enum hwmon_sensor_types type, u32 =
attr, int channel)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             return 0444;
> > +     case hwmon_pwm:
> > +             return 0644;
> > +     default:
> > +             return 0;
> > +     }
> > +     return 0;
>
> I think you can drop the above since all branches of the switch statement
> return.

Ok. Done.

> > +}
> > +
> > +static int oxp_platform_read(struct device *dev, enum hwmon_sensor_typ=
es type,
> > +                          u32 attr, int channel, long *val)
> > +{
> > +     int ret;
> > +
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             switch (attr) {
> > +             case hwmon_fan_input:
> > +                     return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
> > +             default:
>
> Missing break;

Oops. Is not really needed but I'll add them.

> > +             }
> > +             break;
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_input:
> > +                     ret =3D read_from_ec(OXP_SENSOR_PWM_REG, 2, val);
> > +                     *val =3D (*val * 255) / 100;
>
> That isn't really clean since it will overwrite *val after an error.
>
>                         if (ret)
>                                 return ret;
>                         *val =3D (*val * 255) / 100;
>                         return 0;
>
> would be more appropriate.

Much better, thanks for suggestion.

> > +                     return ret;
> > +             case hwmon_pwm_enable:
> > +                     return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1,=
 val);
> > +             default:
>
>
> Missing break;

Added

> > +             }
> > +             break;
> > +     default:
>
> Missing break;
>
> > +     }
> > +     dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);
>
> That isn't really useful since it will never happen.

Dropped the message.

> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static int oxp_platform_write(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > +                           u32 attr, int channel, long val)
> > +{
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_enable:
> > +                     if (val =3D=3D 1)
> > +                             return oxp_pwm_enable(dev);
> > +                     else if (val =3D=3D 0)
> > +                             return oxp_pwm_disable(dev);
> > +                     else
> > +                             return -EINVAL;
>
> else after return is unnecessary.

Removed

> > +             case hwmon_pwm_input:
> > +                     if (val < 0 || val > 255)
> > +                             return -EINVAL;
> > +                     val =3D (val * 100) / 255;
> > +                     return write_to_ec(dev, OXP_SENSOR_PWM_REG, val);
> > +             default:
> > +                     break;
> > +             }
>
>                 break;

Added

> > +     default:
>
>                 break;

Added

> > +     }
> > +     dev_dbg(dev, "Unknown sensor type: %d", type);
>
> Same as above. It just increases code size for no good reason.

Removed the message entirely.

> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +/* Known sensors in the OXP EC controllers */
> > +static const struct hwmon_channel_info *oxp_platform_sensors[] =3D {
> > +     HWMON_CHANNEL_INFO(fan,
> > +                        HWMON_F_INPUT),
> > +     HWMON_CHANNEL_INFO(pwm,
> > +                        HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> > +     NULL,
> > +};
> > +
> > +static const struct hwmon_ops oxp_ec_hwmon_ops =3D {
> > +     .is_visible =3D oxp_ec_hwmon_is_visible,
> > +     .read =3D oxp_platform_read,
> > +     .write =3D oxp_platform_write,
> > +};
> > +
> > +static const struct hwmon_chip_info oxp_ec_chip_info =3D {
> > +     .ops =3D &oxp_ec_hwmon_ops,
> > +     .info =3D oxp_platform_sensors,
> > +};
> > +
> > +/* Initialization logic */
> > +static int oxp_platform_probe(struct platform_device *pdev)
> > +{
> > +     const struct dmi_system_id *dmi_entry;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device *hwdev;
> > +
> > +     /* Have to check for AMD processor here because DMI strings are t=
he
> > +      * same between Intel and AMD boards, the only way to tell them a=
ppart
> > +      * is the CPU.
> > +      * Intel boards seem to have different EC registers and values to
> > +      * read/write.
> > +      */
>
> /*
>  * Please use standard multi-line comments
>  */

Fixed

> > +     dmi_entry =3D dmi_first_match(dmi_table);
> > +     if (!dmi_entry || boot_cpu_data.x86_vendor !=3D X86_VENDOR_AMD)
> > +             return -ENODEV;
> > +
> > +     hwdev =3D devm_hwmon_device_register_with_info(dev, "oxpec", NULL=
,
> > +                                                  &oxp_ec_chip_info, N=
ULL);
> > +
> > +     return PTR_ERR_OR_ZERO(hwdev);
> > +}
> > +
> > +static struct platform_driver oxp_platform_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "oxp-platform",
> > +     },
> > +     .probe =3D oxp_platform_probe,
> > +};
> > +
> > +static struct platform_device *oxp_platform_device;
> > +
> > +static int __init oxp_platform_init(void)
> > +{
> > +     oxp_platform_device =3D
> > +             platform_create_bundle(&oxp_platform_driver,
> > +                                    oxp_platform_probe, NULL, 0, NULL,=
 0);
> > +
> > +     if (IS_ERR(oxp_platform_device))
> > +             return PTR_ERR(oxp_platform_device);
>
> Why not PTR_ERR_OR_ZERO() here ?

This function can be dropped if using module_platform_driver()
Removed entirely.

> > +
> > +     return 0;
> > +}
> > +
> > +static void __exit oxp_platform_exit(void)
> > +{
> > +     platform_device_unregister(oxp_platform_device);
> > +     platform_driver_unregister(&oxp_platform_driver);
> > +}
> > +
> > +MODULE_DEVICE_TABLE(dmi, dmi_table);
> > +module_init(oxp_platform_init);
> > +module_exit(oxp_platform_exit);
>
> Can you use module_platform_driver() instead ?

The original module had this. I'll bring it back and drop init/exit functio=
ns.

> > +
> > +MODULE_AUTHOR("Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com=
>");
> > +MODULE_DESCRIPTION("Platform driver that handles EC sensors of OneXPla=
yer devices");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.38.1
> >

Thanks for your time and feedback!

--=20
Joaqu=C3=ADn I. Aramend=C3=ADa

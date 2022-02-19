Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C00B4BCAAE
	for <lists+platform-driver-x86@lfdr.de>; Sat, 19 Feb 2022 22:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiBSVJd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 19 Feb 2022 16:09:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiBSVJc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 19 Feb 2022 16:09:32 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1AE5C874;
        Sat, 19 Feb 2022 13:09:11 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j9-20020a05600c190900b0037bff8a24ebso10969415wmq.4;
        Sat, 19 Feb 2022 13:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYTvBr6rEXrdA7eOAr6gvqJGcp8OD3Mli3q6LDtg8b0=;
        b=MLt4SM4JArEPkepiJUVvtHr7Qzd8sbFUOVKNg8Mb6rThCcMlogwampHIWFHNa6tVNA
         MlWXzyYRxyU1tsT/LrM+ahOjF9EBO+kaMpNAaZu0j0h4x1FRWlamfsqJ4yyu0ZJgQZ5b
         ofoQMe0wI8cBKjsMiA1xkw/VHkg4HaQOZ8+HkFkBcxsyEK1JsTLIuSHeBkjkoxHjOq/V
         uL4eMJ0zkVATjB3QNAkEUul/3z3vpNC3DE78KLKWUAeFLo41ufWn4wQGCmesIXmVAg5O
         3B8UWeqpFZ6rpIrzSYCJT/ngyYsb/oZj+C/LAglUwPPrEWFJWBAaeLukUE81etuHWwqN
         YY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYTvBr6rEXrdA7eOAr6gvqJGcp8OD3Mli3q6LDtg8b0=;
        b=YAibZWnYDC6Nw61mul9lTnGA2H7hHV27SwSuFS+jcAi8zw/IreN/yzSUC1D4GN4f3Q
         i5ZHahsdEOJx9jATRIEJU7arixRQUl6wujioUar9HpdP+qE7tIWF4wMaMxnc28X2dDp5
         OQKhvZRRcISXLpap0/qQqCEFWPuoisY0FEhjLNNL8+lpPvTlclUAy0+ZstrQb2gLzSbI
         LiLJaSaz0o5a34TIIDRaVcym5ZtQmI2jEMaUfBM86oHxy7mFB6SUHMPQso89sAyt0iMd
         q1sKgnebfjBuEUgUS7PAiuw7lzD1GYedEvunUd6ieRyXTuf3T5kr/dqxHxiqylezqxKX
         wPvA==
X-Gm-Message-State: AOAM531oF4lEXugMXpXNoOztpR7e7FK8U3B+kaPpKfEgW/JDCMxoyxGu
        MkMiWMu0T7Hu+96WlFkb7iNF17uNrH41AmyrYL0=
X-Google-Smtp-Source: ABdhPJwyJ9OetsNXe8M3ss8UZGkEf+2p/sJ5mRPQE6KuDzGRbuYu/YfUQLjUesqEIp22M1Jq5EgQQDfdhUX+aU/1CyU=
X-Received: by 2002:a05:600c:4205:b0:37c:9125:ac10 with SMTP id
 x5-20020a05600c420500b0037c9125ac10mr16275596wmh.117.1645304949531; Sat, 19
 Feb 2022 13:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20220206022023.376142-1-andrew.smirnov@gmail.com> <f5189aa3-77e1-f976-ac4b-5d1293dfa1b2@hansg.org>
In-Reply-To: <f5189aa3-77e1-f976-ac4b-5d1293dfa1b2@hansg.org>
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Sat, 19 Feb 2022 13:08:58 -0800
Message-ID: <CAHQ1cqHi5DmCB4ThQ_enr6BSOR-Oej19BprGZrphKeVzp5it4Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add Steam Deck driver
To:     Hans de Goede <hans@hansg.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 17, 2022 at 8:26 AM Hans de Goede <hans@hansg.org> wrote:
>
> Hi Andrey,
>
> On 2/6/22 03:20, Andrey Smirnov wrote:
> > Add a driver exposing various bits and pieces of functionality
> > provided by Steam Deck specific VLV0100 device presented by EC
> > firmware. This includes but not limited to:
> >
> >     - CPU/device's fan control
> >     - Read-only access to DDIC registers
> >     - Battery tempreature measurements
> >     - Various display related control knobs
> >     - USB Type-C connector event notification
> >
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Mark Gross <markgross@kernel.org>
> > Cc: Jean Delvare <jdelvare@suse.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: linux-kernel@vger.kernel.org (open list)
> > Cc: platform-driver-x86@vger.kernel.org
> > Cc: linux-hwmon@vger.kernel.org
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> The .c file says: "Copyright (C) 2021-2022 Valve Corporation"
> yet you are using a personal email address. This is not really
> an issue, but it does look a bit weird.
>

I'm not an FTE at Valve, although I might have a dedicated address in
their e-mail system, however in my experience corporate emails
addresses come and go, so I prefer to put an address a) I won't have
to change few years down the road b) check regularly and try to
respond promptly on, so almost all of my kernel contributions have
been done using that address.


> > ---
> >
> > This driver is really a kitchen sink of various small bits. Maybe it
> > is worth splitting into an MFD + child drivers/devices?
>
> Yes with the extcon thing I think you should definitely go for
> a MFD device. In which case the main driver registering the
> regmap + the cells would go under drivers/mfd and most of the
> other drivers would go in their own subsystems.
>
> And as the drivers/platform/x86/ subsystem maintainer I guess
> that means I don't have to do much with this driver :)
>

Yep, that's my plan :-)

> I would still be happy to yake any bits which don't fit
> anywhere else attaching to say a "misc" MFD cell.
>
> Regards,
>
> Hans
>
>
>
> >
> >  drivers/platform/x86/Kconfig     |  15 +
> >  drivers/platform/x86/Makefile    |   2 +
> >  drivers/platform/x86/steamdeck.c | 523 +++++++++++++++++++++++++++++++
> >  3 files changed, 540 insertions(+)
> >  create mode 100644 drivers/platform/x86/steamdeck.c
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index c23612d98126..86f014e78a6e 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1136,6 +1136,21 @@ config SIEMENS_SIMATIC_IPC
> >         To compile this driver as a module, choose M here: the module
> >         will be called simatic-ipc.
> >
> > +config STEAMDECK
> > +       tristate "Valve Steam Deck platform driver"
> > +       depends on X86_64
> > +       help
> > +         Driver exposing various bits and pieces of functionality
> > +      provided by Steam Deck specific VLV0100 device presented by
> > +      EC firmware. This includes but not limited to:
> > +          - CPU/device's fan control
> > +          - Read-only access to DDIC registers
> > +          - Battery tempreature measurements
> > +          - Various display related control knobs
> > +          - USB Type-C connector event notification
> > +
> > +      Say N unless you are running on a Steam Deck.
> > +
> >  endif # X86_PLATFORM_DEVICES
> >
> >  config PMC_ATOM
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index c12a9b044fd8..2eb965e14ced 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -129,3 +129,5 @@ obj-$(CONFIG_PMC_ATOM)                    += pmc_atom.o
> >
> >  # Siemens Simatic Industrial PCs
> >  obj-$(CONFIG_SIEMENS_SIMATIC_IPC)    += simatic-ipc.o
> > +
> > +obj-$(CONFIG_STEAMDECK)                      += steamdeck.o
> > diff --git a/drivers/platform/x86/steamdeck.c b/drivers/platform/x86/steamdeck.c
> > new file mode 100644
> > index 000000000000..77a6677ec19e
> > --- /dev/null
> > +++ b/drivers/platform/x86/steamdeck.c
> > @@ -0,0 +1,523 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Steam Deck ACPI platform driver
> > + *
> > + * Copyright (C) 2021-2022 Valve Corporation
> > + *
> > + */
> > +#include <linux/acpi.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/extcon-provider.h>
> > +
> > +#define ACPI_STEAMDECK_NOTIFY_STATUS 0x80
> > +
> > +/* 0 - port connected, 1 -port disconnected */
> > +#define ACPI_STEAMDECK_PORT_CONNECT  BIT(0)
> > +/* 0 - Upstream Facing Port, 1 - Downdstream Facing Port */
> > +#define ACPI_STEAMDECK_CUR_DATA_ROLE BIT(3)
> > +/*
> > + * Debouncing delay to allow negotiation process to settle. 2s value
> > + * was arrived at via trial and error.
> > + */
> > +#define STEAMDECK_ROLE_SWITCH_DELAY  (msecs_to_jiffies(2000))
> > +
> > +struct steamdeck {
> > +     struct acpi_device *adev;
> > +     struct device *hwmon;
> > +     void *regmap;
> > +     long fan_target;
> > +     struct delayed_work role_work;
> > +     struct extcon_dev *edev;
> > +     struct device *dev;
> > +};
> > +
> > +static ssize_t
> > +steamdeck_simple_store(struct device *dev, const char *buf, size_t count,
> > +                    const char *method,
> > +                    unsigned long upper_limit)
> > +{
> > +     struct steamdeck *fan = dev_get_drvdata(dev);
> > +     unsigned long value;
> > +
> > +     if (kstrtoul(buf, 10, &value) || value >= upper_limit)
> > +             return -EINVAL;
> > +
> > +     if (ACPI_FAILURE(acpi_execute_simple_method(fan->adev->handle,
> > +                                                 (char *)method, value)))
> > +             return -EIO;
> > +
> > +     return count;
> > +}
> > +
> > +#define STEAMDECK_ATTR_WO(_name, _method, _upper_limit)                      \
> > +     static ssize_t _name##_store(struct device *dev,                \
> > +                                  struct device_attribute *attr,     \
> > +                                  const char *buf, size_t count)     \
> > +     {                                                               \
> > +             return steamdeck_simple_store(dev, buf, count,          \
> > +                                         _method,                    \
> > +                                         _upper_limit);              \
> > +     }                                                               \
> > +     static DEVICE_ATTR_WO(_name)
> > +
> > +STEAMDECK_ATTR_WO(target_cpu_temp, "STCT", U8_MAX / 2);
> > +STEAMDECK_ATTR_WO(gain, "SGAN", U16_MAX);
> > +STEAMDECK_ATTR_WO(ramp_rate, "SFRR", U8_MAX);
> > +STEAMDECK_ATTR_WO(hysteresis, "SHTS",  U16_MAX);
> > +STEAMDECK_ATTR_WO(maximum_battery_charge_rate, "CHGR", U16_MAX);
> > +STEAMDECK_ATTR_WO(recalculate, "SCHG", U16_MAX);
> > +
> > +STEAMDECK_ATTR_WO(led_brightness, "CHBV", U8_MAX);
> > +STEAMDECK_ATTR_WO(content_adaptive_brightness, "CABC", U8_MAX);
> > +STEAMDECK_ATTR_WO(gamma_set, "GAMA", U8_MAX);
> > +STEAMDECK_ATTR_WO(display_brightness, "WDBV", U8_MAX);
> > +STEAMDECK_ATTR_WO(ctrl_display, "WCDV", U8_MAX);
> > +STEAMDECK_ATTR_WO(cabc_minimum_brightness, "WCMB", U8_MAX);
> > +STEAMDECK_ATTR_WO(memory_data_access_control, "MDAC", U8_MAX);
> > +
> > +#define STEAMDECK_ATTR_WO_NOARG(_name, _method)                              \
> > +     static ssize_t _name##_store(struct device *dev,                \
> > +                                  struct device_attribute *attr,     \
> > +                                  const char *buf, size_t count)     \
> > +     {                                                               \
> > +             struct steamdeck *fan = dev_get_drvdata(dev);           \
> > +                                                                     \
> > +             if (ACPI_FAILURE(acpi_evaluate_object(fan->adev->handle, \
> > +                                                   _method, NULL, NULL))) \
> > +                     return -EIO;                                    \
> > +                                                                     \
> > +             return count;                                           \
> > +     }                                                               \
> > +     static DEVICE_ATTR_WO(_name)
> > +
> > +STEAMDECK_ATTR_WO_NOARG(power_cycle_display, "DPCY");
> > +STEAMDECK_ATTR_WO_NOARG(display_normal_mode_on, "NORO");
> > +STEAMDECK_ATTR_WO_NOARG(display_inversion_off, "INOF");
> > +STEAMDECK_ATTR_WO_NOARG(display_inversion_on, "INON");
> > +STEAMDECK_ATTR_WO_NOARG(idle_mode_on, "WRNE");
> > +
> > +#define STEAMDECK_ATTR_RO(_name, _method)                            \
> > +     static ssize_t _name##_show(struct device *dev,                 \
> > +                                 struct device_attribute *attr,      \
> > +                                 char *buf)                          \
> > +     {                                                               \
> > +             struct steamdeck *jup = dev_get_drvdata(dev);           \
> > +             unsigned long long val;                                 \
> > +                                                                     \
> > +             if (ACPI_FAILURE(acpi_evaluate_integer(                 \
> > +                                      jup->adev->handle,             \
> > +                                      _method, NULL, &val)))         \
> > +                     return -EIO;                                    \
> > +                                                                     \
> > +             return sprintf(buf, "%llu\n", val);                     \
> > +     }                                                               \
> > +     static DEVICE_ATTR_RO(_name)
> > +
> > +STEAMDECK_ATTR_RO(firmware_version, "PDFW");
> > +STEAMDECK_ATTR_RO(board_id, "BOID");
> > +STEAMDECK_ATTR_RO(pdcs, "PDCS");
> > +
> > +static umode_t
> > +steamdeck_is_visible(struct kobject *kobj, struct attribute *attr, int index)
> > +{
> > +     return attr->mode;
> > +}
> > +
> > +static struct attribute *steamdeck_attributes[] = {
> > +     &dev_attr_target_cpu_temp.attr,
> > +     &dev_attr_gain.attr,
> > +     &dev_attr_ramp_rate.attr,
> > +     &dev_attr_hysteresis.attr,
> > +     &dev_attr_maximum_battery_charge_rate.attr,
> > +     &dev_attr_recalculate.attr,
> > +     &dev_attr_power_cycle_display.attr,
> > +
> > +     &dev_attr_led_brightness.attr,
> > +     &dev_attr_content_adaptive_brightness.attr,
> > +     &dev_attr_gamma_set.attr,
> > +     &dev_attr_display_brightness.attr,
> > +     &dev_attr_ctrl_display.attr,
> > +     &dev_attr_cabc_minimum_brightness.attr,
> > +     &dev_attr_memory_data_access_control.attr,
> > +
> > +     &dev_attr_display_normal_mode_on.attr,
> > +     &dev_attr_display_inversion_off.attr,
> > +     &dev_attr_display_inversion_on.attr,
> > +     &dev_attr_idle_mode_on.attr,
> > +
> > +     &dev_attr_firmware_version.attr,
> > +     &dev_attr_board_id.attr,
> > +     &dev_attr_pdcs.attr,
> > +
> > +     NULL
> > +};
> > +
> > +static const struct attribute_group steamdeck_group = {
> > +     .attrs = steamdeck_attributes,
> > +     .is_visible = steamdeck_is_visible,
> > +};
> > +
> > +static const struct attribute_group *steamdeck_groups[] = {
> > +     &steamdeck_group,
> > +     NULL
> > +};
> > +
> > +static int steamdeck_read_fan_speed(struct steamdeck *jup, long *speed)
> > +{
> > +     unsigned long long val;
> > +
> > +     if (ACPI_FAILURE(acpi_evaluate_integer(jup->adev->handle,
> > +                                            "FANR", NULL, &val)))
> > +             return -EIO;
> > +
> > +     *speed = val;
> > +     return 0;
> > +}
> > +
> > +static int
> > +steamdeck_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > +                  u32 attr, int channel, long *out)
> > +{
> > +     struct steamdeck *sd = dev_get_drvdata(dev);
> > +     unsigned long long val;
> > +
> > +     switch (type) {
> > +     case hwmon_temp:
> > +             if (attr != hwmon_temp_input)
> > +                     return -EOPNOTSUPP;
> > +
> > +             if (ACPI_FAILURE(acpi_evaluate_integer(sd->adev->handle,
> > +                                                    "BATT", NULL, &val)))
> > +                     return -EIO;
> > +             /*
> > +              * Assuming BATT returns deg C we need to mutiply it
> > +              * by 1000 to convert to mC
> > +              */
> > +             *out = val * 1000;
> > +             break;
> > +     case hwmon_fan:
> > +             switch (attr) {
> > +             case hwmon_fan_input:
> > +                     return steamdeck_read_fan_speed(sd, out);
> > +             case hwmon_fan_target:
> > +                     *out = sd->fan_target;
> > +                     break;
> > +             case hwmon_fan_fault:
> > +                     if (ACPI_FAILURE(acpi_evaluate_integer(
> > +                                              sd->adev->handle,
> > +                                              "FANC", NULL, &val)))
> > +                             return -EIO;
> > +                     /*
> > +                      * FANC (Fan check):
> > +                      * 0: Abnormal
> > +                      * 1: Normal
> > +                      */
> > +                     *out = !val;
> > +                     break;
> > +             default:
> > +                     return -EOPNOTSUPP;
> > +             }
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +steamdeck_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
> > +                         u32 attr, int channel, const char **str)
> > +{
> > +     switch (type) {
> > +     case hwmon_temp:
> > +             *str = "Battery Temp";
> > +             break;
> > +     case hwmon_fan:
> > +             *str = "System Fan";
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +steamdeck_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> > +                   u32 attr, int channel, long val)
> > +{
> > +     struct steamdeck *sd = dev_get_drvdata(dev);
> > +
> > +     if (type != hwmon_fan ||
> > +         attr != hwmon_fan_target)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (val > U16_MAX)
> > +             return -EINVAL;
> > +
> > +     sd->fan_target = val;
> > +
> > +     if (ACPI_FAILURE(acpi_execute_simple_method(sd->adev->handle,
> > +                                                 "FANS", val)))
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> > +static umode_t
> > +steamdeck_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> > +                        u32 attr, int channel)
> > +{
> > +     if (type == hwmon_fan &&
> > +         attr == hwmon_fan_target)
> > +             return 0644;
> > +
> > +     return 0444;
> > +}
> > +
> > +static const struct hwmon_channel_info *steamdeck_info[] = {
> > +     HWMON_CHANNEL_INFO(temp,
> > +                        HWMON_T_INPUT | HWMON_T_LABEL),
> > +     HWMON_CHANNEL_INFO(fan,
> > +                        HWMON_F_INPUT | HWMON_F_LABEL |
> > +                        HWMON_F_TARGET | HWMON_F_FAULT),
> > +     NULL
> > +};
> > +
> > +static const struct hwmon_ops steamdeck_hwmon_ops = {
> > +     .is_visible = steamdeck_hwmon_is_visible,
> > +     .read = steamdeck_hwmon_read,
> > +     .read_string = steamdeck_hwmon_read_string,
> > +     .write = steamdeck_hwmon_write,
> > +};
> > +
> > +static const struct hwmon_chip_info steamdeck_chip_info = {
> > +     .ops = &steamdeck_hwmon_ops,
> > +     .info = steamdeck_info,
> > +};
> > +
> > +#define STEAMDECK_STA_OK                     \
> > +     (ACPI_STA_DEVICE_ENABLED |              \
> > +      ACPI_STA_DEVICE_PRESENT |              \
> > +      ACPI_STA_DEVICE_FUNCTIONING)
> > +
> > +static int
> > +steamdeck_ddic_reg_read(void *context, unsigned int reg, unsigned int *val)
> > +{
> > +     union acpi_object obj = { .type = ACPI_TYPE_INTEGER };
> > +     struct acpi_object_list arg_list = { .count = 1, .pointer = &obj, };
> > +     struct steamdeck *sd = context;
> > +     unsigned long long _val;
> > +
> > +     obj.integer.value = reg;
> > +
> > +     if (ACPI_FAILURE(acpi_evaluate_integer(sd->adev->handle,
> > +                                            "RDDI", &arg_list, &_val)))
> > +             return -EIO;
> > +
> > +     *val = _val;
> > +     return 0;
> > +}
> > +
> > +static int steamdeck_read_pdcs(struct steamdeck *sd, unsigned long long *pdcs)
> > +{
> > +     acpi_status status;
> > +
> > +     status = acpi_evaluate_integer(sd->adev->handle, "PDCS", NULL, pdcs);
> > +     if (ACPI_FAILURE(status)) {
> > +             dev_err(sd->dev, "PDCS evaluation failed: %s\n",
> > +                     acpi_format_exception(status));
> > +             return -EIO;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void steamdeck_usb_role_work(struct work_struct *work)
> > +{
> > +     struct steamdeck *sd =
> > +             container_of(work, struct steamdeck, role_work.work);
> > +     unsigned long long pdcs;
> > +     bool usb_host;
> > +
> > +     if (steamdeck_read_pdcs(sd, &pdcs))
> > +             return;
> > +
> > +     /*
> > +      * We only care about these two
> > +      */
> > +     pdcs &= ACPI_STEAMDECK_PORT_CONNECT | ACPI_STEAMDECK_CUR_DATA_ROLE;
> > +
> > +     /*
> > +      * For "connect" events our role is determined by a bit in
> > +      * PDCS, for "disconnect" we switch to being a gadget
> > +      * unconditionally. The thinking for the latter is we don't
> > +      * want to start acting as a USB host until we get
> > +      * confirmation from the firmware that we are a USB host
> > +      */
> > +     usb_host = (pdcs & ACPI_STEAMDECK_PORT_CONNECT) ?
> > +             pdcs & ACPI_STEAMDECK_CUR_DATA_ROLE : false;
> > +
> > +     WARN_ON(extcon_set_state_sync(sd->edev, EXTCON_USB_HOST,
> > +                                   usb_host));
> > +     dev_dbg(sd->dev, "USB role is %s\n", usb_host ? "host" : "device");
> > +}
> > +
> > +static void steamdeck_notify(acpi_handle handle, u32 event, void *context)
> > +{
> > +     struct device *dev = context;
> > +     struct steamdeck *sd = dev_get_drvdata(dev);
> > +     unsigned long long pdcs;
> > +     unsigned long delay;
> > +
> > +     switch (event) {
> > +     case ACPI_STEAMDECK_NOTIFY_STATUS:
> > +             if (steamdeck_read_pdcs(sd, &pdcs))
> > +                     return;
> > +             /*
> > +              * We process "disconnect" events immediately and
> > +              * "connect" events with a delay to give the HW time
> > +              * to settle. For example attaching USB hub (at least
> > +              * for HW used for testing) will generate intermediary
> > +              * event with "host" bit not set, followed by the one
> > +              * that does have it set.
> > +              */
> > +             delay = (pdcs & ACPI_STEAMDECK_PORT_CONNECT) ?
> > +                     STEAMDECK_ROLE_SWITCH_DELAY : 0;
> > +
> > +             queue_delayed_work(system_long_wq, &sd->role_work, delay);
> > +             break;
> > +     default:
> > +             dev_err(dev, "Unsupported event [0x%x]\n", event);
> > +     }
> > +}
> > +
> > +static void steamdeck_remove_notify_handler(void *data)
> > +{
> > +     struct steamdeck *sd = data;
> > +
> > +     acpi_remove_notify_handler(sd->adev->handle, ACPI_DEVICE_NOTIFY,
> > +                                steamdeck_notify);
> > +     cancel_delayed_work_sync(&sd->role_work);
> > +}
> > +
> > +static const unsigned int steamdeck_extcon_cable[] = {
> > +     EXTCON_USB,
> > +     EXTCON_USB_HOST,
> > +     EXTCON_CHG_USB_SDP,
> > +     EXTCON_CHG_USB_CDP,
> > +     EXTCON_CHG_USB_DCP,
> > +     EXTCON_CHG_USB_ACA,
> > +     EXTCON_NONE,
> > +};
> > +
> > +static int steamdeck_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct steamdeck *sd;
> > +     acpi_status status;
> > +     unsigned long long sta;
> > +     int ret;
> > +
> > +     static const struct regmap_config regmap_config = {
> > +             .reg_bits = 8,
> > +             .val_bits = 8,
> > +             .max_register = 255,
> > +             .cache_type = REGCACHE_NONE,
> > +             .reg_read = steamdeck_ddic_reg_read,
> > +     };
> > +
> > +     sd = devm_kzalloc(dev, sizeof(*sd), GFP_KERNEL);
> > +     if (!sd)
> > +             return -ENOMEM;
> > +     sd->adev = ACPI_COMPANION(&pdev->dev);
> > +     sd->dev = dev;
> > +     platform_set_drvdata(pdev, sd);
> > +     INIT_DELAYED_WORK(&sd->role_work, steamdeck_usb_role_work);
> > +
> > +     status = acpi_evaluate_integer(sd->adev->handle, "_STA",
> > +                                    NULL, &sta);
> > +     if (ACPI_FAILURE(status)) {
> > +             dev_err(dev, "Status check failed (0x%x)\n", status);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if ((sta & STEAMDECK_STA_OK) != STEAMDECK_STA_OK) {
> > +             dev_err(dev, "Device is not ready\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /*
> > +      * Our ACPI interface doesn't expose a method to read current
> > +      * fan target, so we use current fan speed as an
> > +      * approximation.
> > +      */
> > +     if (steamdeck_read_fan_speed(sd, &sd->fan_target))
> > +             dev_warn(dev, "Failed to read fan speed");
> > +
> > +     sd->hwmon = devm_hwmon_device_register_with_info(dev,
> > +                                                      "steamdeck",
> > +                                                      sd,
> > +                                                      &steamdeck_chip_info,
> > +                                                      steamdeck_groups);
> > +     if (IS_ERR(sd->hwmon)) {
> > +             dev_err(dev, "Failed to register HWMON device");
> > +             return PTR_ERR(sd->hwmon);
> > +     }
> > +
> > +     sd->regmap = devm_regmap_init(dev, NULL, sd, &regmap_config);
> > +     if (IS_ERR(sd->regmap))
> > +             dev_err(dev, "Failed to register REGMAP");
> > +
> > +     sd->edev = devm_extcon_dev_allocate(dev, steamdeck_extcon_cable);
> > +     if (IS_ERR(sd->edev))
> > +             return -ENOMEM;
> > +
> > +     ret = devm_extcon_dev_register(dev, sd->edev);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to register extcon device: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * Set initial role value
> > +      */
> > +     queue_delayed_work(system_long_wq, &sd->role_work, 0);
> > +     flush_delayed_work(&sd->role_work);
> > +
> > +     status = acpi_install_notify_handler(sd->adev->handle,
> > +                                          ACPI_DEVICE_NOTIFY,
> > +                                          steamdeck_notify,
> > +                                          dev);
> > +     if (ACPI_FAILURE(status)) {
> > +             dev_err(dev, "Error installing ACPI notify handler\n");
> > +             return -EIO;
> > +     }
> > +
> > +     ret = devm_add_action_or_reset(dev, steamdeck_remove_notify_handler,
> > +                                    sd);
> > +     return ret;
> > +}
> > +
> > +static const struct acpi_device_id steamdeck_device_ids[] = {
> > +     { "VLV0100", 0 },
> > +     { "", 0 },
> > +};
> > +MODULE_DEVICE_TABLE(acpi, steamdeck_device_ids);
> > +
> > +static struct platform_driver steamdeck_driver = {
> > +     .probe = steamdeck_probe,
> > +     .driver = {
> > +             .name = "steamdeck",
> > +             .acpi_match_table = steamdeck_device_ids,
> > +     },
> > +};
> > +module_platform_driver(steamdeck_driver);
> > +
> > +MODULE_AUTHOR("Andrey Smirnov <andrew.smirnov@gmail.com>");
> > +MODULE_DESCRIPTION("Steam Deck ACPI platform driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.25.1
> >

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2633B25E1A9
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Sep 2020 20:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgIDS4G (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 4 Sep 2020 14:56:06 -0400
Received: from mail-40141.protonmail.ch ([185.70.40.141]:25108 "EHLO
        mail-40141.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgIDS4F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Sep 2020 14:56:05 -0400
Date:   Fri, 04 Sep 2020 18:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1599245762;
        bh=gLLoOls/J6O39tTWcq4a3nRoCK8C+J4aPajxuu+zpl8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Da7bpcLpPczgQ6zbEvQLgXJ0Oitk7jUtH7VM8OABBJJfZu/qaR4BpjqsSPAO/xr/t
         VZjVvoS+96qhDPpfgZEGWpruTRBCOSE4Ao0EJwu33+Plo6ea/XfNdcve9hP1Op8wBp
         Hgzdx8UOdtTVTyrGrC81G7VrNJ2PE4Kd6wLLrGvA=
To:     Jeremy Soller <jeremy@system76.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        =?utf-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 1/2] platform/x86: system76_acpi: Add hwmon driver
Message-ID: <ExXpTGiXzjPu4heSLv0yKPDi0nqcealPWHV_kid9zBw--uILyb4WVmxNEcdTRW9rfXAaDi_-2b3yGRx5jLiyw4ssWkDY8wTfghjdABTDB6c=@protonmail.com>
In-Reply-To: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I have a couple minor comments.


> [...]
> +// Get a System76 ACPI device value by name with index

Shouldn't the comments be the original C-style?


> +static int system76_get_index(struct system76_data *data, char *method, =
int index)
> +{
> +=09union acpi_object obj;
> +=09struct acpi_object_list obj_list;
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09unsigned long long ret =3D 0;

Minor thing, but isn't this initialization unnecessary?


> +
> +=09obj.type =3D ACPI_TYPE_INTEGER;
> +=09obj.integer.value =3D index;
> +=09obj_list.count =3D 1;
> +=09obj_list.pointer =3D &obj;
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_integer(handle, method, &obj_list, &ret);
> +=09if (ACPI_SUCCESS(status))
> +=09=09return (int)ret;
> +=09else
> +=09=09return -1;

I'd personally return -EIO or something similar here. And possibly use
acpi_handle_err() + acpi_format_exception().


> +}
> +
> +// Get a System76 ACPI device object by name
> +static int system76_get_object(struct system76_data *data, char *method,=
 union acpi_object **obj)
> +{
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_object(handle, method, NULL, &buf);
> +=09if (ACPI_SUCCESS(status)) {
> +=09=09*obj =3D (union acpi_object *)buf.pointer;

Casting from 'void*' is redundant.


> +=09=09return 0;
> +=09} else {
> +=09=09return -1;

Same here: I'd return -EIO or something similar.


> +=09}
> +}
> +
> [...]
> +
> +static int thermal_read(
> +=09struct device *dev,
> +=09enum hwmon_sensor_types type,
> +=09u32 attr,
> +=09int channel,
> +=09long *val)
> +{
> +=09struct system76_data *data =3D dev_get_drvdata(dev);
> +=09int raw;
> +
> +=09if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input) {
> +=09=09raw =3D system76_get_index(data, "GFAN", channel);
> +=09=09if (raw >=3D 0) {
> +=09=09=09*val =3D (long)((raw >> 8) & 0xFFFF);
> +=09=09=09return 0;
> +=09=09}
> +=09} else if (type =3D=3D hwmon_pwm && attr =3D=3D hwmon_pwm_input) {
> +=09=09raw =3D system76_get_index(data, "GFAN", channel);
> +=09=09if (raw >=3D 0) {
> +=09=09=09*val =3D (long)(raw & 0xFF);
> +=09=09=09return 0;
> +=09=09}
> +=09} else if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input) {
> +=09=09raw =3D system76_get_index(data, "GTMP", channel);
> +=09=09if (raw >=3D 0) {
> +=09=09=09*val =3D (long)(raw * 1000);
> +=09=09=09return 0;
> +=09=09}
> +=09}
> +=09return -EINVAL;

It's a minor thing, but this function returns EINVAL even if the ACPI call =
failed.


> +}
> +
> [...]
> +
> +// Allocate up to 8 fans and temperatures
> +static const struct hwmon_channel_info *thermal_channel_info[] =3D {
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL),
> +=09HWMON_CHANNEL_INFO(pwm,
> +=09=09=09HWMON_PWM_INPUT,
> +=09=09=09HWMON_PWM_INPUT,
> +=09=09=09HWMON_PWM_INPUT,
> +=09=09=09HWMON_PWM_INPUT,
> +=09=09=09HWMON_PWM_INPUT,
> +=09=09=09HWMON_PWM_INPUT,
> +=09=09=09HWMON_PWM_INPUT,
> +=09=09=09HWMON_PWM_INPUT),
> +=09HWMON_CHANNEL_INFO(temp,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09HWMON_T_INPUT | HWMON_T_LABEL),

Any reason why the last two channels are indented +1 tabs?


> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info thermal_chip_info =3D {
> +=09.ops =3D &thermal_ops,
> +=09.info =3D thermal_channel_info,
> +};
> +
>  // Handle ACPI notification
>  static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>  {
> @@ -346,6 +513,17 @@ static int system76_add(struct acpi_device *acpi_dev=
)
>  =09=09=09return err;
>  =09}
>
> +=09system76_get_object(data, "NFAN", &data->nfan);
> +=09system76_get_object(data, "NTMP", &data->ntmp);

Shouldn't the return values be checked? (At least using WARN_ON[_ONCE]?)


> +=09data->therm =3D devm_hwmon_device_register_with_info(
> +=09=09&acpi_dev->dev,
> +=09=09"system76_acpi",
> +=09=09data,
> +=09=09&thermal_chip_info,
> +=09=09NULL);
> +=09if (IS_ERR(data->therm))
> +=09=09return PTR_ERR(data->therm);
> +
>  =09return 0;
>  }
> [...]



Barnab=C3=A1s P=C5=91cze

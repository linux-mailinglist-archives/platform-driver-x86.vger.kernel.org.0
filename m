Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C063225E16E
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Sep 2020 20:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgIDSU1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 4 Sep 2020 14:20:27 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:18674 "EHLO
        mail-40140.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgIDSU0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Sep 2020 14:20:26 -0400
Date:   Fri, 04 Sep 2020 18:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1599243623;
        bh=V/Q6mvdoUXey6IdzmT/QDvHVsuqz1ARcOtKp1ofh1jU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=CFG6C69HY7vf5dJi8X1R7fp8wPB99PxTWAod2JPKLL0StzS6EQl6A7G9ojMbWcQcm
         71AAdoqMkt+3+e5hBCnEjtLjghdA5VZ9bhTLnmwJzPwaqxaYaMmLb1lAhVQLCl+RiI
         aRdtsVYxqX1fTgEfY/zz774npFVC0KAx4RSS2Irg=
To:     Jeremy Soller <jeremy@system76.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        =?utf-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 2/2] platform/x86: system76_acpi: Add input driver
Message-ID: <BAH8gRbpLk_cHH1yK9d7JrKitwVru-ZNmQ2D_wvEOr4SavRgSBRAsnLBlf1mq6r89xYcZhUk3bEAYNCeBq464tUO85CfK6A20rGWtwVHjVg=@protonmail.com>
In-Reply-To: <179d3595-dda8-4c50-84e3-5f447ef5e34b@www.fastmail.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com> <179d3595-dda8-4c50-84e3-5f447ef5e34b@www.fastmail.com>
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

> [...]
> +static void input_key(struct system76_data *data, unsigned int code)
> +{
> +=09input_report_key(data->input, code, 1);
> +=09input_sync(data->input);
> +
> +=09input_report_key(data->input, code, 0);
> +=09input_sync(data->input);
> +}
> +
>  // Handle ACPI notification
>  static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>  {
> @@ -459,6 +470,9 @@ static void system76_notify(struct acpi_device *acpi_=
dev, u32 event)
>  =09case 0x84:
>  =09=09kb_led_hotkey_color(data);
>  =09=09break;
> +=09case 0x85:
> +=09=09input_key(data, KEY_SCREENLOCK);
> +=09=09break;
>  =09}
>  }
>
> @@ -524,6 +538,21 @@ static int system76_add(struct acpi_device *acpi_dev=
)
>  =09if (IS_ERR(data->therm))
>  =09=09return PTR_ERR(data->therm);
>
> +=09data->input =3D devm_input_allocate_device(&acpi_dev->dev);
> +=09if (!data->input)
> +=09=09return -ENOMEM;
> +=09data->input->name =3D "System76 ACPI Hotkeys";
> +=09data->input->phys =3D "system76_acpi/input0";
> +=09data->input->id.bustype =3D BUS_HOST;
> +=09data->input->dev.parent =3D &acpi_dev->dev;
> +=09set_bit(EV_KEY, data->input->evbit);
> +=09set_bit(KEY_SCREENLOCK, data->input->keybit);
> +=09err =3D input_register_device(data->input);
> +=09if (err) {
> +=09=09input_free_device(data->input);
> +=09=09return err;
> +=09}
> +
>  =09return 0;
>  }

Hi,

wouldn't sparse_keymap be a better choice here?


Barnab=C3=A1s P=C5=91cze

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D7C2D0EC
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 May 2019 23:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfE1VWi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 May 2019 17:22:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41047 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbfE1VWi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 May 2019 17:22:38 -0400
Received: by mail-pf1-f193.google.com with SMTP id q17so83980pfq.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2019 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=50/Xsj2LKY8CwAMNgsVgvv5+QnRXiqhLmyb8OWBrLu4=;
        b=2SH/1M2uQW6uvZeCyQu8fC6BcYQ3yqdZ8EgQBBcyrkw4bTuCBW3zOJCtu3LjIfGuG9
         AfMl60xPrtJoep6zX9v1XBa2OzPki8CqmG6azhB7pX3EK6UfVDE+YhC/ux+FEnGquNXv
         SxZFZlB5lZEh0a/sfmfmR7qds9ll/OR8u3yaBiWCSQOL9JTUc5rCpyyzPSqOnvF0HR8C
         Q7WSiXFExN2gfjRJ69RtgE58rLDC+HHboKvRpqcXYquCp+D14H39ro5bA4s0A0yRxH/+
         EprtNEnP4wK2n/4woptN5mdCkjgAOGhrtZPcHkOZRZULWEkT1gQA7WEI8Wyh84/FtTgn
         o98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=50/Xsj2LKY8CwAMNgsVgvv5+QnRXiqhLmyb8OWBrLu4=;
        b=T//7aXmi8+e1POTNs2QYm6eygpx28i7z6zvZz7kT8+3Xa4pE1DY5o2DFK7dop/S7zH
         ZKVg+cyD/mQ1TbBtTeqMUxlyT5tqKcmZ5orpKlt7vur9ugjZotTtx+AyHDOy75NfDMSB
         jHfbCDwykCvY9jbR4U53QqBHszQdzL8SvF/IsDPuvsJfbLld8o182Aag16qMmF5GyMmg
         04R9eSRUQO62abo5psxfktUaIzKbD1dFV6dGb0MD0R270/j9cZ5sIupdWUGbQ4jIkxGZ
         CvprwNDpFi/e2qk+77epRO/9GASyM7d5jPiUE4KLIQDuGGYmdhpf/mX6rZr4w4pqQ/kd
         SQPw==
X-Gm-Message-State: APjAAAXEX5hbq9WgXzjymbTqKDvUTHDNg6OZMtuFlQXd7gcCTS1NXCq0
        YIjg4X70N49McxFK/jrlNfv3/IWACmOgScQ74T+W5mq+LNc=
X-Google-Smtp-Source: APXvYqwb6MZNmqK0KRTAYP5e9AcJC0N/JrtcrMOV7A3hOzZrACc13edLiwyHZ6IduYWq704otoqMs1isqThGvgPPCdo=
X-Received: by 2002:a63:6884:: with SMTP id d126mr135366636pgc.154.1559078557010;
 Tue, 28 May 2019 14:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190521062837.3887-1-hdegoede@redhat.com>
In-Reply-To: <20190521062837.3887-1-hdegoede@redhat.com>
From:   =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
Date:   Tue, 28 May 2019 14:22:24 -0700
Message-ID: <CAOcMMifdq8PcnwANKxGtAmB+5nNOv-aEW3aFJyfPNngXeYCK5A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Only Tell EC the OS will handle
 display hotkeys from asus_nb_wmi
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 20, 2019 at 11:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will
> handle the display off hotkey") causes the backlight to be permanently of=
f
> on various EeePC laptop models using the eeepc-wmi driver (Asus EeePC
> 1015BX, Asus EeePC 1025C).
>
> The asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL) call added
> by that commit is made conditional in this commit and only enabled in
> the quirk_entry structs in the asus-nb-wmi driver fixing the broken
> display / backlight on various EeePC laptop models.
>
> Cc: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> Fixes: 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will han=
dle the display off hotkey")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 8 ++++++++
>  drivers/platform/x86/asus-wmi.c    | 2 +-
>  drivers/platform/x86/asus-wmi.h    | 1 +
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/as=
us-nb-wmi.c
> index b6f2ff95c3ed..59f3a37a44d7 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -78,10 +78,12 @@ static bool asus_q500a_i8042_filter(unsigned char dat=
a, unsigned char str,
>
>  static struct quirk_entry quirk_asus_unknown =3D {
>         .wapf =3D 0,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_q500a =3D {
>         .i8042_filter =3D asus_q500a_i8042_filter,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  /*
> @@ -92,26 +94,32 @@ static struct quirk_entry quirk_asus_q500a =3D {
>  static struct quirk_entry quirk_asus_x55u =3D {
>         .wapf =3D 4,
>         .wmi_backlight_power =3D true,
> +       .wmi_backlight_set_devstate =3D true,
>         .no_display_toggle =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_wapf4 =3D {
>         .wapf =3D 4,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_x200ca =3D {
>         .wapf =3D 2,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_ux303ub =3D {
>         .wmi_backlight_native =3D true,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_x550lb =3D {
> +       .wmi_backlight_set_devstate =3D true,
>         .xusb2pr =3D 0x01D9,
>  };
>
>  static struct quirk_entry quirk_asus_forceals =3D {
> +       .wmi_backlight_set_devstate =3D true,
>         .wmi_force_als_set =3D true,
>  };
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index ee1fa93708ec..a66e99500c12 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2131,7 +2131,7 @@ static int asus_wmi_add(struct platform_device *pde=
v)
>                 err =3D asus_wmi_backlight_init(asus);
>                 if (err && err !=3D -ENODEV)
>                         goto fail_backlight;
> -       } else
> +       } else if (asus->driver->quirks->wmi_backlight_set_devstate)
>                 err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2=
, NULL);
>
>         status =3D wmi_install_notify_handler(asus->driver->event_guid,
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-=
wmi.h
> index 6c1311f4b04d..57a79bddb286 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -44,6 +44,7 @@ struct quirk_entry {
>         bool store_backlight_power;
>         bool wmi_backlight_power;
>         bool wmi_backlight_native;
> +       bool wmi_backlight_set_devstate;

Wouldn't it be better to add this field to struct asus_wmi_driver
instead, and set it in asus_nb_wmi_driver only? This way we wouldn't
need to make sure it is present in all quirk entries from this driver,
current and future.

I've tested both the original patch and my suggestion above and in
both cases the "turn off backlight" hotkey continued to work fine on a
machine where asus-nb-wmi is used (I don't have access to any machine
using the eeepc driver).

>         bool wmi_force_als_set;
>         int wapf;
>         /*
> --
> 2.21.0
>

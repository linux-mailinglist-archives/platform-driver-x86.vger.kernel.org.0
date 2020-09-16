Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DF726CD58
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 22:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgIPU6R (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 16:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgIPQd1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 12:33:27 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C75C02C289
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 09:19:54 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k13so3457987plk.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hf/dTBE7F1btJpdTwDehX3c+LqFnWcxDkNHGM3PnOEk=;
        b=HqDN3XNa2saEe0mX0Jw+WZ7rNyKAtdPlJWZFtjnCnAmbw4Cr0D+Jxr5TF79KMp5o29
         Wvpo5mXFV36OpF8lyrTBm7y/qlYK5kkYYNfhroShJ3oo69wtpy81+PvzWKcH6CaT0Ed1
         /eiOMHmG8qVgxuACVNBg3eQSo0SDeZ4/jvyxtyId0QhTgloo6ABYYqwTKimkp+qku7nK
         nAPVhLcR/Hc26EEtx+qvIsBaOjSxyvvMPnX0qCqPJL+mAF+g5NgfKlx/S3j8JKelaYTS
         9tXmRBV6yQYTRUOiz909tCOkuZnMOw/x9AEouEP0nsN0I2EcEpxiDg0IYBi1rjIebxr1
         tHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hf/dTBE7F1btJpdTwDehX3c+LqFnWcxDkNHGM3PnOEk=;
        b=cRDu+q7+8tPmILEksyBFO1ZNCHXrCp705/DqlIKzRZnwY3NM78qMsAm2CyPVZLMLxE
         OnBefZ3gyPy1qXWv3VwW/V0ZIyXoGhsOCi6J1FJq0gmNymtxQgxqxxFlDBv8iYQkxw4I
         SFlCO1nF8OE5uJyrq/1y4TmeaZ46Ne0af2Y1lbAxzMcNL9IcVd58HFDjq6FSs0eMNmj9
         cJvTq2+dTTAcfWhsP6M1KXJnjKAoirGxmfvCzwoUuoMTy/A2eqe2DfC5Bd8i/1BZVchz
         OBhUmv+9kddpvOcDpupHsZf2cEWou63LKUywdvtkomyCvLw386ydFtKzN+2wHJaDlzSJ
         3jeA==
X-Gm-Message-State: AOAM533cMXxc1uUI2Kxn4A9Ct+LzywYTOGheR15nrDkmougiTkO/qY7W
        omI6E/wIEwsDIYEObOoTN3EOhQ4CWDjvZNS3JKU=
X-Google-Smtp-Source: ABdhPJx/Qv+PER5/r/vB54JgY3IcAaf26JwL/7LnTGZWWIvf6wS6WzgBYYYI54wUoiVkEDmvnGLjH2//IC2N4zpn8Lo=
X-Received: by 2002:a17:902:778b:b029:d1:bb21:513d with SMTP id
 o11-20020a170902778bb02900d1bb21513dmr20287648pll.17.1600273194042; Wed, 16
 Sep 2020 09:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200916154703.76643-1-hdegoede@redhat.com>
In-Reply-To: <20200916154703.76643-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Sep 2020 19:19:36 +0300
Message-ID: <CAHp75VfkS61=3GvhfiBDO=j-YEdsjnSNMD9+6-N-QShZ9QipCw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always
 reporting 1 on many different models
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 16, 2020 at 6:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit b0dbd97de1f1 ("platform/x86: asus-wmi: Add support for
> SW_TABLET_MODE") added support for reporting SW_TABLET_MODE using the
> Asus 0x00120063 WMI-device-id to see if various transformer models were
> docked into their keyboard-dock (SW_TABLET_MODE=3D0) or if they were
> being used as a tablet.
>
> The new SW_TABLET_MODE support (naively?) assumed that non Transformer
> devices would either not support the 0x00120063 WMI-device-id at all,
> or would NOT set ASUS_WMI_DSTS_PRESENCE_BIT in their reply when querying
> the device-id.
>
> Unfortunately this is not true and we have received many bug reports abou=
t
> this change causing the asus-wmi driver to always report SW_TABLET_MODE=
=3D1
> on non Transformer devices. This causes libinput to think that these are
> 360 degree hinges style 2-in-1s folded into tablet-mode. Making libinput
> suppress keyboard and touchpad events from the builtin keyboard and
> touchpad. So effectively this causes the keyboard and touchpad to not wor=
k
> on many non Transformer Asus models.
>
> This commit fixes this by using the existing DMI based quirk mechanism in
> asus-nb-wmi.c to allow using the 0x00120063 device-id for reporting
> SW_TABLET_MODE on Transformer models and ignoring it on all other models.
>
> Fixes: b0dbd97de1f1 ("platform/x86: asus-wmi: Add support for SW_TABLET_M=
ODE")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D209011

> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1875339
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1875828
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1876997

Do we need all three from the same bug tracker? Could they be marked
as duplicate to some (meta?) bug?

> Reported-by: Samuel =C4=8Cavoj <samuel@cavoj.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 32 ++++++++++++++++++++++++++++++
>  drivers/platform/x86/asus-wmi.c    | 16 ++++++++-------
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/as=
us-nb-wmi.c
> index 680c3640e013..1d9fbabd02fb 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -115,6 +115,10 @@ static struct quirk_entry quirk_asus_vendor_backligh=
t =3D {
>         .wmi_backlight_set_devstate =3D true,
>  };
>
> +static struct quirk_entry quirk_asus_use_kbd_dock_devid =3D {
> +       .use_kbd_dock_devid =3D true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>         pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -488,6 +492,34 @@ static const struct dmi_system_id asus_quirks[] =3D =
{
>                 },
>                 .driver_data =3D &quirk_asus_vendor_backlight,
>         },
> +       {
> +               .callback =3D dmi_matched,
> +               .ident =3D "Asus Transformer T100TA / T100HA / T100CHI",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> +                       /* Match *T100* */
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "T100"),
> +               },
> +               .driver_data =3D &quirk_asus_use_kbd_dock_devid,
> +       },
> +       {
> +               .callback =3D dmi_matched,
> +               .ident =3D "Asus Transformer T101HA",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "T101HA"),
> +               },
> +               .driver_data =3D &quirk_asus_use_kbd_dock_devid,
> +       },
> +       {
> +               .callback =3D dmi_matched,
> +               .ident =3D "Asus Transformer T200TA",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "T200TA"),
> +               },
> +               .driver_data =3D &quirk_asus_use_kbd_dock_devid,
> +       },
>         {},
>  };
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 8f4acdc06b13..ae6289d37faf 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -365,12 +365,14 @@ static int asus_wmi_input_init(struct asus_wmi *asu=
s)
>         if (err)
>                 goto err_free_dev;
>
> -       result =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_=
DOCK);
> -       if (result >=3D 0) {
> -               input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MOD=
E);
> -               input_report_switch(asus->inputdev, SW_TABLET_MODE, !resu=
lt);
> -       } else if (result !=3D -ENODEV) {
> -               pr_err("Error checking for keyboard-dock: %d\n", result);
> +       if (asus->driver->quirks->use_kbd_dock_devid) {
> +               result =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DE=
VID_KBD_DOCK);
> +               if (result >=3D 0) {
> +                       input_set_capability(asus->inputdev, EV_SW, SW_TA=
BLET_MODE);
> +                       input_report_switch(asus->inputdev, SW_TABLET_MOD=
E, !result);
> +               } else if (result !=3D -ENODEV) {
> +                       pr_err("Error checking for keyboard-dock: %d\n", =
result);
> +               }
>         }
>
>         err =3D input_register_device(asus->inputdev);
> @@ -2114,7 +2116,7 @@ static void asus_wmi_handle_event_code(int code, st=
ruct asus_wmi *asus)
>                 return;
>         }
>
> -       if (code =3D=3D NOTIFY_KBD_DOCK_CHANGE) {
> +       if (asus->driver->quirks->use_kbd_dock_devid && code =3D=3D NOTIF=
Y_KBD_DOCK_CHANGE) {
>                 result =3D asus_wmi_get_devstate_simple(asus,
>                                                       ASUS_WMI_DEVID_KBD_=
DOCK);
>                 if (result >=3D 0) {
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-=
wmi.h
> index 4f31b68642a0..1a95c172f94b 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -33,6 +33,7 @@ struct quirk_entry {
>         bool wmi_backlight_native;
>         bool wmi_backlight_set_devstate;
>         bool wmi_force_als_set;
> +       bool use_kbd_dock_devid;
>         int wapf;
>         /*
>          * For machines with AMD graphic chips, it will send out WMI even=
t
> --
> 2.28.0
>


--=20
With Best Regards,
Andy Shevchenko

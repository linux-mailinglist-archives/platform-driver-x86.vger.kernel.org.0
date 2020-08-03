Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F6423A75D
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 15:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgHCNUu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 09:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgHCNUu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 09:20:50 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E208C06174A
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2020 06:20:49 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 184so15430090wmb.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2020 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KdicIldghy0+x1yDFdc53zEgJy/tX151ZbQLKnDhb3U=;
        b=Yoc17axY4QzqCUaX57Is8o/laHdasgB3ewU9vfyU80GQrJb1sdgWzjWUxkTddnGMg/
         5FX11zidsSJHiFbAT/3vYyd48Wnt9+7usqsHHdSkwQSM0vvpbhu81N6V2EogCrfpti+u
         qYSAaq1H+jmzkVPZ5JoqJ0jAxG14daSV9jgdRJJPQt11tkoDB0EShkXTluZIBK2Q+0Rh
         9kO42WgbEcg1fjWp5D0yyCwric0TsZKmAyqOc3cMsh9IhXvJKiwzeVi/Dv7sXOIItXff
         QWey530ep2Sa7RT2B2MrdGrYQTU0Eo+x26qOEZ+S7OS/s4GkNkvtWwVfBMx0ZCFJeDap
         yNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KdicIldghy0+x1yDFdc53zEgJy/tX151ZbQLKnDhb3U=;
        b=DV0yecxIPfbjRNNpNwkdfHG8Fslh8RLMYOOdQkdL+33WK9LxjyiZ8bTyxBbZ9OfbSf
         4VYYqoClm9BzwwHOVKcuu3kxup//2AWTZT9Hp/LjyVpvjsoL+prX8ZrUCzWw86zBkAPV
         8K4el55aVwbnhnAb1VW2qjyY4eSJQVwQ02efDO7QSzGfsH/UHGeEUx9MHgVMh/30aHw/
         D0efgl2uItQtxeA+rUJMvSDO/a02WuvfDqIqw36N8WNajgzk+GjBsIV6sLoCyQCcW3cl
         9/zn+7Ly5DQtGcPgNa3rnhnfK/SSn+JsgaUemYk3KR5LOAHOe77cQjjZPAgRFTt9oy19
         /uwQ==
X-Gm-Message-State: AOAM530vo+MWcrug0+PDZVls7CEFytzBTiLtNBE8ry63jWRKiuXr5Nbz
        mPMivu6vxou49deDF6IgPpXNyMjABhCAnJkcoeLAz6sn
X-Google-Smtp-Source: ABdhPJxFdM0FGzALl37ijtLUqD7on8noSCKzLFJze6/bUJ0/vMx6jqLO8VUBUXVtEwlASiJIC+Nr7fzccM0wAxC3FD0=
X-Received: by 2002:a1c:6408:: with SMTP id y8mr57167wmb.52.1596460848328;
 Mon, 03 Aug 2020 06:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHms=eZm3LY-Z4p+TkfZ+vyxGd_7XKPBsSEM_Mvnx2s-GO2c9w@mail.gmail.com>
In-Reply-To: <CAHms=eZm3LY-Z4p+TkfZ+vyxGd_7XKPBsSEM_Mvnx2s-GO2c9w@mail.gmail.com>
From:   Elvis Stansvik <elvstone@gmail.com>
Date:   Mon, 3 Aug 2020 15:20:37 +0200
Message-ID: <CAHms=eYpcy__Km_9O4MUtLxpasH1sAgQEmcapOhV79j01twhow@mail.gmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH v5] platform/x86: thinkpad_acpi: lap or
 desk mode interface
To:     markpearson@lenovo.com
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, andy.shevchenko@gmail.com,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

(I forgot a bunch of recipients in my original reply. Now added.
Apologies to those of you who now get it twice)

See my reply below.

Cheers,
Elvis

Den s=C3=B6n 2 aug. 2020 kl 23:10 skrev Elvis Stansvik <elvstone@gmail.com>=
:
>
> (Apologies in advance for missing In-Reply-To header in this reply. I sub=
scribed to the list just now.)
>
> Den fre 3 juli 2020 kl 01:24 skrev Mark Pearson <markpearson@lenovo.com>:
> > Newer Lenovo Thinkpad platforms have support to identify whether the
> > system is on-lap or not using an ACPI DYTC event from the firmware.
> >
> > This patch provides the ability to retrieve the current mode via sysfs
> > entrypoints and will be used by userspace for thermal mode and WWAN
> > functionality
>
> I tried the patch out on my X1C6 (20KH007BMX), running Lenovo firmware ve=
rsion 0.1.49.
>
> The sysfs path /sys/devices/platform/thinkpad_acpi/dytc_lapmode is showin=
g up, but it's reporting 0 regardless if the laptop is in my lap or on a de=
sk.
>
> I tested this by having the laptop in my lap for five minutes, and then o=
n a desk for five minutes. The value reported through /sys/devices/platform=
/thinkpad_acpi/dytc_lapmode was always 0.
>
> Regards,
> Elvis
>
> >
> > Co-developed-by: Nitin Joshi <njoshi1@...>
> > Signed-off-by: Nitin Joshi <njoshi1@...>
> > Reviewed-by: Sugumaran <slacshiminar@...>
> > Reviewed-by: Bastien Nocera <bnocera@...>
> > Signed-off-by: Mark Pearson <markpearson@...>
> > ---
> > Changes in v5:
> >  - Updated with review changes from Andy Shevchenko
> >  - Added ABI information to thinkpad-acpi.rst
> >  - improved error handling and parameter passing as recommended
> >  - code cleanup as recommended
> >  - added review tag from bnocera
> > Changes in v4:
> >  - Correct hotkey event comment as we're handling event
> >  - Remove unnecessary check in dytc_lapmode_refresh
> > Changes in v3:
> > - Fixed inaccurate comments
> > - Used BIT macro to check lapmode bit setting as recommended and update
> >   define name
> > - Check for new_state =3D=3D dytc_lapmode in dytc_lapmode_refresh
> > Changes in v2:
> > - cleaned up initialisation sequence to be cleaner and avoid spamming
> >   platforms that don't have DYTC with warning message. Tested on P52
> > - Adding platform-driver-x86 mailing list for review as requested
> >
> >  .../admin-guide/laptops/thinkpad-acpi.rst     |  15 +++
> >  drivers/platform/x86/thinkpad_acpi.c          | 111 +++++++++++++++++-
> >  2 files changed, 124 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Docu=
mentation/admin-guide/laptops/thinkpad-acpi.rst
> > index 822907dcc845..99066aa8d97b 100644
> > --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > @@ -50,6 +50,7 @@ detailed description):
> >   - WAN enable and disable
> >   - UWB enable and disable
> >   - LCD Shadow (PrivacyGuard) enable and disable
> > + - Lap mode sensor
> >
> >  A compatibility table by model and feature is maintained on the web
> >  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> > @@ -1432,6 +1433,20 @@ The first command ensures the best viewing angle=
 and the latter one turns
> >  on the feature, restricting the viewing angles.
> >
> >
> > +DYTC Lapmode sensor
> > +------------------
> > +
> > +sysfs: dytc_lapmode
> > +
> > +Newer thinkpads and mobile workstations have the ability to determine =
if
> > +the device is in deskmode or lapmode. This feature is used by user spa=
ce
> > +to decide if WWAN transmission can be increased to maximum power and i=
s
> > +also useful for understanding the different thermal modes available as
> > +they differ between desk and lap mode.
> > +
> > +The property is read-only. If the platform doesn't have support the sy=
sfs
> > +class is not created.
> > +
> >  EXPERIMENTAL: UWB
> >  -----------------
> >
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
> > index ff7f0a4f2475..037eb77414f9 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -4022,8 +4022,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
> >   return true;
> >   case TP_HKEY_EV_THM_CSM_COMPLETED:
> >   pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n"=
);
> > - /* recommended action: do nothing, we don't have
> > - * Lenovo ATM information */
> > + /* Thermal event - pass on to event handler */
> > + tpacpi_driver_event(hkey);
> >   return true;
> >   case TP_HKEY_EV_THM_TRANSFM_CHANGED:
> >   pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
> > @@ -9795,6 +9795,105 @@ static struct ibm_struct lcdshadow_driver_data =
=3D {
> >   .write =3D lcdshadow_write,
> >  };
> >
> > +/*********************************************************************=
****
> > + * DYTC subdriver, for the Lenovo lapmode feature
> > + */
> > +
> > +#define DYTC_CMD_GET          2 /* To get current IC function and mode=
 */
> > +#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> > +
> > +static bool dytc_lapmode;
> > +
> > +static void dytc_lapmode_notify_change(void)
> > +{
> > + sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> > +}
> > +
> > +static int dytc_command(int command, int *output)
> > +{
> > + acpi_handle dytc_handle;
> > +
> > + if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle)))=
 {
> > + /* Platform doesn't support DYTC */
> > + return -ENODEV;
> > + }
> > + if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
> > + return -EIO;
> > + return 0;
> > +}
> > +
> > +static int dytc_lapmode_get(bool *state)
> > +{
> > + int output, err;
> > +
> > + err =3D dytc_command(DYTC_CMD_GET, &output);
> > + if (err)
> > + return err;
> > + *state =3D output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
> > + return 0;
> > +}
> > +
> > +static void dytc_lapmode_refresh(void)
> > +{
> > + bool new_state;
> > + int err;
> > +
> > + err =3D dytc_lapmode_get(&new_state);
> > + if (err || (new_state =3D=3D dytc_lapmode))
> > + return;
> > +
> > + dytc_lapmode =3D new_state;
> > + dytc_lapmode_notify_change();
> > +}
> > +
> > +/* sysfs lapmode entry */
> > +static ssize_t dytc_lapmode_show(struct device *dev,
> > + struct device_attribute *attr,
> > + char *buf)
> > +{
> > + return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
> > +}
> > +
> > +static DEVICE_ATTR_RO(dytc_lapmode);
> > +
> > +static struct attribute *dytc_attributes[] =3D {
> > + &dev_attr_dytc_lapmode.attr,
> > + NULL,
> > +};
> > +
> > +static const struct attribute_group dytc_attr_group =3D {
> > + .attrs =3D dytc_attributes,
> > +};
> > +
> > +static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
> > +{
> > + int err;
> > +
> > + err =3D dytc_lapmode_get(&dytc_lapmode);
> > + /* If support isn't available (ENODEV) then don't return an error
> > + * but just don't create the sysfs group
> > + */
> > + if (err =3D=3D -ENODEV)
> > + return 0;
> > + /* For all other errors we can flag the failure */
> > + if (err)
> > + return err;
> > +
> > + /* Platform supports this feature - create the group */
> > + err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> > + return err;
> > +}
> > +
> > +static void dytc_exit(void)
> > +{
> > + sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> > +}
> > +
> > +static struct ibm_struct dytc_driver_data =3D {
> > + .name =3D "dytc",
> > + .exit =3D dytc_exit,
> > +};
> > +
> >  /*********************************************************************=
*******
> >   *********************************************************************=
*******
> >   *
> > @@ -9842,6 +9941,10 @@ static void tpacpi_driver_event(const unsigned i=
nt hkey_event)
> >
> >   mutex_unlock(&kbdlight_mutex);
> >   }
> > +
> > + if (hkey_event =3D=3D TP_HKEY_EV_THM_CSM_COMPLETED)
> > + dytc_lapmode_refresh();
> > +
> >  }
> >
> >  static void hotkey_driver_event(const unsigned int scancode)
> > @@ -10280,6 +10383,10 @@ static struct ibm_init_struct ibms_init[] __in=
itdata =3D {
> >   .init =3D tpacpi_lcdshadow_init,
> >   .data =3D &lcdshadow_driver_data,
> >   },
> > + {
> > + .init =3D tpacpi_dytc_init,
> > + .data =3D &dytc_driver_data,
> > + },
> >  };
> >
> >  static int __init set_ibm_param(const char *val, const struct kernel_p=
aram *kp)
> > --
> > 2.26.2

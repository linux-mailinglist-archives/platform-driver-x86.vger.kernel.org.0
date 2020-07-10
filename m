Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C03721BEAF
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jul 2020 22:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgGJUje (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jul 2020 16:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgGJUje (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jul 2020 16:39:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E620C08C5DC
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 13:39:34 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so3042706pfi.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOy3WRzQtRC4Q2JOAJBpU3Jt3236sbY/Ra6/MJZGQiY=;
        b=qbJfRyl6ikf8c8bq2TQBhxM14A6c7+KVmLonsdD56whoQO00jbwWKAuur9qMZLb7aM
         OLAQbRWnQ/WmXcfaSZD11zBc92/jWfDmGxbhdVblq5jEpIqrtkCSFY+PP56oiOZambBa
         buPrJNDgKlBGCps+VuFZvNRpdN0Rla5XSk4LQuJXkgLAckIV6xY/mmG7ZRIlJ7l//j3l
         ZFJZP02+v+Iuv0ycd0dUsnt5eCh93LblWcOXsrkmMAbCiJVntnbaoEKnr9B0q5M5pvAx
         KQ8idd5UICNC7ejjXzAELgOBsixvBF7AMrYIZyOJS+4Ap57J18IG/QQvTaLZG0gxejnD
         Myig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOy3WRzQtRC4Q2JOAJBpU3Jt3236sbY/Ra6/MJZGQiY=;
        b=p4IywlWukn6XAjSeJ1aQ6tpecRr4E7XFnOYLc9DlTimNYc7Ln3s6TeCTZMSl8xYdJt
         s/ZKP+tqzHTFrH6rqxNxT7NaJYrvEhn866TVtnP9SgiC+YHGb5Hmq0F1a/G5gnZk/uRD
         ht6eiXDl85H+mbKBGgkSrEkr1xBV8AVPz8Q93ZhJy8aWV9oUIzr6WDF6cKcf/x5R338V
         WpRpcBBoP5uDteoUzWN+tyxmHXQZoD3CtjGuJgA1eN5v4OoVD4rwlOSQo/P4q/OICf4P
         TI1lO5/ijl+2mKbaIGwclpOAj/FJcYtvCDiFgJx5ve2xu0K5DKTqSKQGSk/prvR6TAJS
         DXYQ==
X-Gm-Message-State: AOAM530Qqi0wmc8fTRfaupSxUxzJh3WZYtaqI4HUclr9IQZGO1f7muhX
        lzA+94oKDt8NEvF4jQVwRZFbvHrleUQyjJPXZWrGf1eT+4E=
X-Google-Smtp-Source: ABdhPJweorVSib19TBYf2eX82367jKl/Bk/GYW+qYWWs6/OPc4yIODCbRGqsE00WX1PO47r+jlGlp1+vPBs/p/IdEVU=
X-Received: by 2002:a63:924b:: with SMTP id s11mr58092425pgn.74.1594413573715;
 Fri, 10 Jul 2020 13:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20200703012353.26413-1-markpearson@lenovo.com>
In-Reply-To: <20200703012353.26413-1-markpearson@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Jul 2020 23:39:17 +0300
Message-ID: <CAHp75VfQWL9TEhmPi6Svj8Y39DrXa-p-Gko-_u+sMVNz41FYXQ@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: thinkpad_acpi: lap or desk mode interface
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jul 3, 2020 at 4:24 AM Mark Pearson <markpearson@lenovo.com> wrote:
>
> Newer Lenovo Thinkpad platforms have support to identify whether the
> system is on-lap or not using an ACPI DYTC event from the firmware.
>
> This patch provides the ability to retrieve the current mode via sysfs
> entrypoints and will be used by userspace for thermal mode and WWAN
> functionality
>

Pushed to my review and testing queue, thanks!

> Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> Reviewed-by: Sugumaran <slacshiminar@lenovo.com>
> Reviewed-by: Bastien Nocera <bnocera@redhat.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v5:
>  - Updated with review changes from Andy Shevchenko
>  - Added ABI information to thinkpad-acpi.rst
>  - improved error handling and parameter passing as recommended
>  - code cleanup as recommended
>  - added review tag from bnocera
> Changes in v4:
>  - Correct hotkey event comment as we're handling event
>  - Remove unnecessary check in dytc_lapmode_refresh
> Changes in v3:
> - Fixed inaccurate comments
> - Used BIT macro to check lapmode bit setting as recommended and update
>   define name
> - Check for new_state == dytc_lapmode in dytc_lapmode_refresh
> Changes in v2:
> - cleaned up initialisation sequence to be cleaner and avoid spamming
>   platforms that don't have DYTC with warning message. Tested on P52
> - Adding platform-driver-x86 mailing list for review as requested
>
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  15 +++
>  drivers/platform/x86/thinkpad_acpi.c          | 111 +++++++++++++++++-
>  2 files changed, 124 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 822907dcc845..99066aa8d97b 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -50,6 +50,7 @@ detailed description):
>         - WAN enable and disable
>         - UWB enable and disable
>         - LCD Shadow (PrivacyGuard) enable and disable
> +       - Lap mode sensor
>
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1432,6 +1433,20 @@ The first command ensures the best viewing angle and the latter one turns
>  on the feature, restricting the viewing angles.
>
>
> +DYTC Lapmode sensor
> +------------------
> +
> +sysfs: dytc_lapmode
> +
> +Newer thinkpads and mobile workstations have the ability to determine if
> +the device is in deskmode or lapmode. This feature is used by user space
> +to decide if WWAN transmission can be increased to maximum power and is
> +also useful for understanding the different thermal modes available as
> +they differ between desk and lap mode.
> +
> +The property is read-only. If the platform doesn't have support the sysfs
> +class is not created.
> +
>  EXPERIMENTAL: UWB
>  -----------------
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index ff7f0a4f2475..037eb77414f9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4022,8 +4022,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>                 return true;
>         case TP_HKEY_EV_THM_CSM_COMPLETED:
>                 pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
> -               /* recommended action: do nothing, we don't have
> -                * Lenovo ATM information */
> +               /* Thermal event - pass on to event handler */
> +               tpacpi_driver_event(hkey);
>                 return true;
>         case TP_HKEY_EV_THM_TRANSFM_CHANGED:
>                 pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
> @@ -9795,6 +9795,105 @@ static struct ibm_struct lcdshadow_driver_data = {
>         .write = lcdshadow_write,
>  };
>
> +/*************************************************************************
> + * DYTC subdriver, for the Lenovo lapmode feature
> + */
> +
> +#define DYTC_CMD_GET          2 /* To get current IC function and mode */
> +#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> +
> +static bool dytc_lapmode;
> +
> +static void dytc_lapmode_notify_change(void)
> +{
> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> +}
> +
> +static int dytc_command(int command, int *output)
> +{
> +       acpi_handle dytc_handle;
> +
> +       if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
> +               /* Platform doesn't support DYTC */
> +               return -ENODEV;
> +       }
> +       if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
> +               return -EIO;
> +       return 0;
> +}
> +
> +static int dytc_lapmode_get(bool *state)
> +{
> +       int output, err;
> +
> +       err = dytc_command(DYTC_CMD_GET, &output);
> +       if (err)
> +               return err;
> +       *state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
> +       return 0;
> +}
> +
> +static void dytc_lapmode_refresh(void)
> +{
> +       bool new_state;
> +       int err;
> +
> +       err = dytc_lapmode_get(&new_state);
> +       if (err || (new_state == dytc_lapmode))
> +               return;
> +
> +       dytc_lapmode = new_state;
> +       dytc_lapmode_notify_change();
> +}
> +
> +/* sysfs lapmode entry */
> +static ssize_t dytc_lapmode_show(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       char *buf)
> +{
> +       return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
> +}
> +
> +static DEVICE_ATTR_RO(dytc_lapmode);
> +
> +static struct attribute *dytc_attributes[] = {
> +       &dev_attr_dytc_lapmode.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group dytc_attr_group = {
> +       .attrs = dytc_attributes,
> +};
> +
> +static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
> +{
> +       int err;
> +
> +       err = dytc_lapmode_get(&dytc_lapmode);
> +       /* If support isn't available (ENODEV) then don't return an error
> +        * but just don't create the sysfs group
> +        */
> +       if (err == -ENODEV)
> +               return 0;
> +       /* For all other errors we can flag the failure */
> +       if (err)
> +               return err;
> +
> +       /* Platform supports this feature - create the group */
> +       err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +       return err;
> +}
> +
> +static void dytc_exit(void)
> +{
> +       sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +}
> +
> +static struct ibm_struct dytc_driver_data = {
> +       .name = "dytc",
> +       .exit = dytc_exit,
> +};
> +
>  /****************************************************************************
>   ****************************************************************************
>   *
> @@ -9842,6 +9941,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>
>                 mutex_unlock(&kbdlight_mutex);
>         }
> +
> +       if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
> +               dytc_lapmode_refresh();
> +
>  }
>
>  static void hotkey_driver_event(const unsigned int scancode)
> @@ -10280,6 +10383,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>                 .init = tpacpi_lcdshadow_init,
>                 .data = &lcdshadow_driver_data,
>         },
> +       {
> +               .init = tpacpi_dytc_init,
> +               .data = &dytc_driver_data,
> +       },
>  };
>
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F59EAC809
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Sep 2019 19:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392516AbfIGRWg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 7 Sep 2019 13:22:36 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33278 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbfIGRWg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Sep 2019 13:22:36 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so6597007pfl.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Sep 2019 10:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8sl6fvlM6HqUKP8nWMYPv1mB4mnKsanphlTfUwQCseQ=;
        b=lv2aqUxZug8eXElsGkPmhsJf9h7O93z0vQM2m5Jj7Wk4tQYwxaNdqnS0wUKg6ZCsR2
         7QFCRsu0Sz7gJZE9wekCWUbFmjAAuhiwBHuEFVak2YrEykugbaQ8BGuIWBzWdph51D3K
         po0f+5vThIpvSNvHZqaQsa2wFKI0l0TD8fOY5T5bOQrKICoN24RGR6Hz1oCmCMroUndd
         GSQ7LCZ3ALQwzsPajupNGlCoxRhnzFzQOZfnQ4U/la1NA5zpcA4E3Lip/3XBavmiSShz
         OoBvhtBXUcoPTPK4VLpxuJs0M7kIBactYxJopfkmENbST20UmAjE4cQ/MU8ASB6D/RSw
         JmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8sl6fvlM6HqUKP8nWMYPv1mB4mnKsanphlTfUwQCseQ=;
        b=RAFaqrNQAwbz2kZi9D4SuTVeTPoJ/Qictn/sI6ZOUU+klkDLxTMzhyGBiIn8q6XGc7
         24emUsCyfWQc9X8hS8zG8uRfccrYidkQbyC6W60EkijCeCZJRv19EzGNBA2qNTDk/q7w
         sx/7sQ1syP+9vMcojk4uQgHadtGbAGICnQxzZOSow7qZb+K7GSqy2h7lcAeAyXXdyP2o
         /ZSRZod0r8DBzLKmKTEX/KRVaSFoUaF8kvB3TF/VJ5e7ooMIlDY4kYqsSSdcvhKKYcUK
         FH4J05Z+GU62dZKQexO8sL9MSfpGE1kRCR+nWMy35JWhtR498P6ah8SqvziQ8rRw9d94
         v4Tg==
X-Gm-Message-State: APjAAAVs99drrLHlJzHCihgXq9qWYHHxKbDoxgd29HHquvDp73AIoWn7
        sg3elVp4itmEFAIUik0R8rJ8v2ILfvR/FOpEo/k=
X-Google-Smtp-Source: APXvYqw/ydR1gnNzvXrtJInF55/5d8qMpRdI8twQKKEDmutTYvx3cEpoenhMSWW09WGddtdW+kr+nQW7wMD7wxgchOI=
X-Received: by 2002:a63:c842:: with SMTP id l2mr13434220pgi.4.1567876955245;
 Sat, 07 Sep 2019 10:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VdMZMxGJpmi6wQMa8FJdzpkPq7nA=kFf4pUSrskrTtFeA@mail.gmail.com>
 <20190822114833.29885-1-alex@alexanderweb.de>
In-Reply-To: <20190822114833.29885-1-alex@alexanderweb.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 7 Sep 2019 20:22:23 +0300
Message-ID: <CAHp75Vf4mxmA-35pqP=Go8wDzpXfj6Ydzz2cVSbfgea9y7PgMQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.
To:     Alexander Schremmer <alex@alexanderweb.de>
Cc:     Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 22, 2019 at 2:48 PM Alexander Schremmer
<alex@alexanderweb.de> wrote:
>
> This feature is found optionally in T480s, T490, T490s.
>
> The feature is called lcdshadow and visible via
> /proc/acpi/ibm/lcdshadow.
>
> The ACPI methods \_SB.PCI0.LPCB.EC.HKEY.{GSSS,SSSS,TSSS,CSSS} are
> available in these machines. They get, set, toggle or change the state
> apparently.
>
> The patch was tested on a 5.0 series kernel on a T480s.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Alexander Schremmer <alex@alexanderweb.de>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  23 ++++
>  drivers/platform/x86/thinkpad_acpi.c          | 112 ++++++++++++++++++
>  2 files changed, 135 insertions(+)
>
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index adea0bf2acc5..822907dcc845 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -49,6 +49,7 @@ detailed description):
>         - Fan control and monitoring: fan speed, fan enable/disable
>         - WAN enable and disable
>         - UWB enable and disable
> +       - LCD Shadow (PrivacyGuard) enable and disable
>
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1409,6 +1410,28 @@ Sysfs notes
>         Documentation/driver-api/rfkill.rst for details.
>
>
> +LCD Shadow control
> +------------------
> +
> +procfs: /proc/acpi/ibm/lcdshadow
> +
> +Some newer T480s and T490s ThinkPads provide a feature called
> +PrivacyGuard. By turning this feature on, the usable vertical and
> +horizontal viewing angles of the LCD can be limited (as if some privacy
> +screen was applied manually in front of the display).
> +
> +procfs notes
> +^^^^^^^^^^^^
> +
> +The available commands are::
> +
> +       echo '0' >/proc/acpi/ibm/lcdshadow
> +       echo '1' >/proc/acpi/ibm/lcdshadow
> +
> +The first command ensures the best viewing angle and the latter one turns
> +on the feature, restricting the viewing angles.
> +
> +
>  EXPERIMENTAL: UWB
>  -----------------
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7bde4640ef34..12bf573c6568 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9714,6 +9714,114 @@ static struct ibm_struct battery_driver_data = {
>         .exit = tpacpi_battery_exit,
>  };
>
> +/*************************************************************************
> + * LCD Shadow subdriver, for the Lenovo PrivacyGuard feature
> + */
> +
> +
> +static int lcdshadow_state;
> +
> +static int lcdshadow_on_off(bool state)
> +{
> +       acpi_handle set_shadow_handle;
> +       int output;
> +
> +       if (ACPI_FAILURE(acpi_get_handle(
> +                                       hkey_handle,
> +                                       "SSSS",
> +                                       &set_shadow_handle))) {
> +               pr_warn("Thinkpad ACPI has no %s interface.\n", "SSSS");
> +               return -EIO;
> +       }
> +
> +       if (!acpi_evalf(set_shadow_handle, &output, NULL, "dd", (int)state))
> +               return -EIO;
> +
> +       lcdshadow_state = state;
> +       return 0;
> +}
> +
> +static int lcdshadow_set(bool on)
> +{
> +       if (lcdshadow_state < 0)
> +               return lcdshadow_state;
> +       if (lcdshadow_state == on)
> +               return 0;
> +       return lcdshadow_on_off(on);
> +}
> +
> +static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
> +{
> +       acpi_handle get_shadow_handle;
> +       int output;
> +
> +       if (ACPI_FAILURE(acpi_get_handle(
> +                                       hkey_handle,
> +                                       "GSSS",
> +                                       &get_shadow_handle))) {
> +               lcdshadow_state = -ENODEV;
> +               return 0;
> +       }
> +
> +       if (!acpi_evalf(get_shadow_handle, &output, NULL, "dd", 0)) {
> +               lcdshadow_state = -EIO;
> +               return -EIO;
> +       }
> +       if (!(output & 0x10000)) {
> +               lcdshadow_state = -ENODEV;
> +               return 0;
> +       }
> +       lcdshadow_state = output & 0x1;
> +
> +       return 0;
> +}
> +
> +static void lcdshadow_resume(void)
> +{
> +       if (lcdshadow_state >= 0)
> +               lcdshadow_on_off(lcdshadow_state);
> +}
> +
> +static int lcdshadow_read(struct seq_file *m)
> +{
> +       if (lcdshadow_state < 0) {
> +               seq_puts(m, "status:\t\tnot supported\n");
> +       } else {
> +               seq_printf(m, "status:\t\t%d\n", lcdshadow_state);
> +               seq_puts(m, "commands:\t0, 1\n");
> +       }
> +
> +       return 0;
> +}
> +
> +static int lcdshadow_write(char *buf)
> +{
> +       char *cmd;
> +       int state = -1;
> +
> +       if (lcdshadow_state < 0)
> +               return -ENODEV;
> +
> +       while ((cmd = next_cmd(&buf))) {
> +               if (strlencmp(cmd, "0") == 0)
> +                       state = 0;
> +               else if (strlencmp(cmd, "1") == 0)
> +                       state = 1;
> +       }
> +
> +       if (state == -1)
> +               return -EINVAL;
> +
> +       return lcdshadow_set(state);
> +}
> +
> +static struct ibm_struct lcdshadow_driver_data = {
> +       .name = "lcdshadow",
> +       .resume = lcdshadow_resume,
> +       .read = lcdshadow_read,
> +       .write = lcdshadow_write,
> +};
> +
>  /****************************************************************************
>   ****************************************************************************
>   *
> @@ -10195,6 +10303,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>                 .init = tpacpi_battery_init,
>                 .data = &battery_driver_data,
>         },
> +       {
> +               .init = tpacpi_lcdshadow_init,
> +               .data = &lcdshadow_driver_data,
> +       },
>  };
>
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> --
> 2.20.1
>


--
With Best Regards,
Andy Shevchenko

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F274575600
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 Jul 2019 19:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391394AbfGYRpW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 25 Jul 2019 13:45:22 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35800 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388291AbfGYRpW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jul 2019 13:45:22 -0400
Received: by mail-pg1-f193.google.com with SMTP id s1so17089830pgr.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2019 10:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z2hXS4aIp+askbelNzmRZr64ww76nj816fhIYHKfid0=;
        b=TKxARAgSY0MaF5npCa8QyKHGHrSB8zoud/0I97Dd9q4WqJlXU27cAi821Wf0SFpL2k
         b8n5Mpmkz7Ez0Ec8F9KFn0hPS/1288nYa9oPXF2gR03K5HklKRUWTGzrEXd0ZSlHpRoX
         WfZV40Y5/y/DnOhngkvzYUbjlVUkIS2QnIMDtYwOAuyYfX4eHYvjFeDpf/ewZF0fo1Rf
         YzZwRKUd4Ks2mekPOEpztfyve2WooCE4+8UesCs0+lHfCaOvzo++Iwt1w76barf2nicW
         otmWPWmr6SFu2CoHutra6ApCplxaILq2APmK5XFPb9R2vNzSjFG2CsbIVKscYYdOROPW
         9UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z2hXS4aIp+askbelNzmRZr64ww76nj816fhIYHKfid0=;
        b=O2mvovYN3w9c861JNeIWP7Xes874wgtjXlKpp5JewJdM4Kd+tBviZQ3dI2mvhbyIcK
         MXpYnQlFHCTcWnqEE2H0q3KmXd5RX8aiRlBzHcgTFr9UgLhDoR52/y8ulsajQJgq+gXK
         R4Mkwok9gq9lHAxS17sivAJqmyTBPtfDjsDB2HcjkvMOy5ITNOsWcHYttqLjl98Iw52s
         JVEH5aaDdBVDM/6xMfg2lw4Uxuei1WvB3dhHnXIHmBCUK/k1V1Sy0LApPvrCJgFNiTLL
         NwDhNUTqfoSiQYf/Uw5V0blWQWDHNeX7qjuPJCOFC8lmpjcExPAFoNm0p8zt9N1km2oJ
         uatg==
X-Gm-Message-State: APjAAAXaPk2ocCf65BZNHPP0Qh9EMNqYmuoIdRC93JWj1dB9/vbbm5jV
        SgNaqXkuKjAddKqXUEUJSqwD3wcWN+as1SzSt8O1IUXh
X-Google-Smtp-Source: APXvYqwVBom4fhXMf/vAR9/ZNTopQUXBsvevI47d8tMUhvs1nHabju5viI+imt3t/vctNEMVQL5sgCn0vMFXLGQ2WR8=
X-Received: by 2002:a62:16:: with SMTP id 22mr18486351pfa.151.1564076721123;
 Thu, 25 Jul 2019 10:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VdzPvs0x_gT4HAMFj8KRYcQgk+ZXgC4yCPA25mS6qFFiQ@mail.gmail.com>
 <20190710153221.379-1-alex@alexanderweb.de>
In-Reply-To: <20190710153221.379-1-alex@alexanderweb.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Jul 2019 20:45:09 +0300
Message-ID: <CAHp75VdMZMxGJpmi6wQMa8FJdzpkPq7nA=kFf4pUSrskrTtFeA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.
To:     Alexander Schremmer <alex@alexanderweb.de>
Cc:     Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jul 10, 2019 at 6:32 PM Alexander Schremmer
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

Thanks for an update!
Unfortunately it doesn't apply since big batch of txt->rst conversion
happened in this cycle. Care to fix and resend?

> Signed-off-by: Alexander Schremmer <alex@alexanderweb.de>
> ---
>  Documentation/laptops/thinkpad-acpi.txt |  22 +++++
>  drivers/platform/x86/thinkpad_acpi.c    | 112 ++++++++++++++++++++++++
>  2 files changed, 134 insertions(+)
>
> diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
> index 6cced88de6da..3fff4b5b6aab 100644
> --- a/Documentation/laptops/thinkpad-acpi.txt
> +++ b/Documentation/laptops/thinkpad-acpi.txt
> @@ -46,6 +46,7 @@ detailed description):
>         - Fan control and monitoring: fan speed, fan enable/disable
>         - WAN enable and disable
>         - UWB enable and disable
> +       - LCD Shadow (PrivacyGuard) enable and disable
>
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1341,6 +1342,27 @@ Sysfs notes:
>         Documentation/rfkill.txt for details.
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
> +procfs notes:
> +
> +The available commands are:
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
> index 71cfaf26efd1..8907b183b940 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9729,6 +9729,114 @@ static struct ibm_struct battery_driver_data = {
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
> @@ -10210,6 +10318,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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

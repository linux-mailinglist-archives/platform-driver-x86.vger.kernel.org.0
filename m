Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D9F5AB6A
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Jun 2019 15:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfF2NPk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Jun 2019 09:15:40 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36576 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfF2NPk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Jun 2019 09:15:40 -0400
Received: by mail-pf1-f193.google.com with SMTP id r7so4340834pfl.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Jun 2019 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p/g2jEkcBrLVYJpS61NrU0i8yrQ9NSsj8NhWssa8/VQ=;
        b=Jk2WP1zO+mraAchFVtFRdRStiitIE/ZN0jUZ0agJrBNRQsOKwB/Oww+bkSF8aHx2zf
         jAjXxpOgsNaLxbzLxYejrOIVRuEpVhP6BueFSmx3AFc7OHom7COd86UJCOYJzG8Ny2NE
         EKXe8fjqPAucJMdzz2dDX/TK8SYllA3A0z8FEY0/RsqoA4ZzE7zOeA8xfTHchGvnuzcJ
         jTROQz/v6qLWrT+SewFaemGzxY+r7ZQBGMVpFccN6ZyWmuIAQ43ySzdhw5DOaK6Binu5
         Zx/tu2xdN3DLPtho288L/1m0KuI3Dhx/r8n9g+N7f5GvA7mcn8WqBFh92XLeuCKYgVPL
         6XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/g2jEkcBrLVYJpS61NrU0i8yrQ9NSsj8NhWssa8/VQ=;
        b=PEjdBZOdLKNR+6Hok2367fC0+OB4/8wShYw27A9eFTTrUnVU26gQQjrPjrAiY//hiD
         WNFfVprQfMaAekbRb41v0NqxbCCqoQHTwW4N40zkZ2pPHRJx1ZjyXWjLLxFPvg37f+JK
         rrK8tZ5WVk1+/c7GLs2W+Kew35euSB0L1FnJ7hom6lYHbOpj37lQSQwafINEeFlMGzSc
         jtSDQjHkwM8M+TfLEP3w37PBy+UUwE3DWo9UW+0mBlIwScMy/CY9vR82SCYRhfUjGZn6
         +t+4lU+ZFUs5YTC2TGDRL2Qo4piM3+h5R5ZBDt2Sm8+zEHsiJPhLlF+S2fD6byANGsCP
         Hdiw==
X-Gm-Message-State: APjAAAUmBxEU1Ad42sN1xdeCzfaMYWz9h+N/lhdphJPCogM1zVltKOkW
        2v5U8dJIOpBDocnAslgZJIEllUF5srF+2soeeszsPpqAEAk=
X-Google-Smtp-Source: APXvYqyrr2VdDEUbHcWCcC7jOxqs4kbZzHpOndIKoaaxDdhFzv2Wy1ibW4hykZTFhtupft9pzPhoRjd/2CbJ3QZSt4Q=
X-Received: by 2002:a63:f346:: with SMTP id t6mr15060141pgj.203.1561814139378;
 Sat, 29 Jun 2019 06:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <E1hSOxT-00005q-An@tuxpaddy.alexanderweb.homeip.net>
In-Reply-To: <E1hSOxT-00005q-An@tuxpaddy.alexanderweb.homeip.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 Jun 2019 16:15:28 +0300
Message-ID: <CAHp75VdzPvs0x_gT4HAMFj8KRYcQgk+ZXgC4yCPA25mS6qFFiQ@mail.gmail.com>
Subject: Re: [PATCH] Add Lenovo PrivacyGuard feature found in T480s, T490, T490s
To:     Alexander Schremmer <alex@alexanderweb.de>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, May 19, 2019 at 7:46 PM Alexander Schremmer
<alex@alexanderweb.de> wrote:
>
> From 6bfe30cae2be3f4fbe9f9990a4e83302569ff7e9 Mon Sep 17 00:00:00 2001
> From: Alexander Schremmer <alex@alexanderweb.de>
> Date: Sun, 19 May 2019 18:13:05 +0200
> Subject: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.
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

While being in my review and testing queue it doesn't produce any
warnings the ABI extension lacks of documentation part.

>
> Signed-off-by: Alexander Schremmer <alex@alexanderweb.de>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 108 +++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 71cfaf26efd1..f2603643b067 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9729,6 +9729,110 @@ static struct ibm_struct battery_driver_data = {
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
> +       if (lcdshadow_state < 0 || lcdshadow_state == on)
> +               return lcdshadow_state;
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
> +       if (!acpi_evalf(get_shadow_handle, &output, NULL, "dd", 0))
> +               return -EIO;
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
> @@ -10210,6 +10314,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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

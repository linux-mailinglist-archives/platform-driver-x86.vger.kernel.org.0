Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED061B7159
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Apr 2020 11:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDXJ7i (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 Apr 2020 05:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgDXJ7h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Apr 2020 05:59:37 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1E8C09B045
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2020 02:59:37 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so4417873pgg.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2020 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HhH1pcgnoBgpP2EEG5vM3hm8Uw4CbJfjI0kvdOw3oUI=;
        b=mZlDM/sOp2/PNqWIeXqtQCj5hrJ/0l1EVIWEH99CfyU+JiaQVls9OfT+qIqJikk7GC
         GXqz1WE0Cl0N4DCvupOxUtqPGPvMn2xDoQcBsZSo81fqLglOmeZeuJRq2t27Ox1ZTdUr
         cEQvixtZ8bay4JbRDpvisz3Di1XXPtx4GffnVGs8YI2t3A0EY3w9dkE3kJLymp4qpqrb
         3WlMAWpqiq4MZ2oNpsqAe6LqPYJglHQ2/3L5SjVrr7mDAOw/yN4/7o4riOOhOmNP63LQ
         7ZMyLm+bTrfAOC3+3u1gVE3GnsQaI5RAUuNn8J2An2h/I9kZoBXhxKWJJnIQzXjbd3FB
         fkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HhH1pcgnoBgpP2EEG5vM3hm8Uw4CbJfjI0kvdOw3oUI=;
        b=ptgvn+iCLryhPGLRoWflDhkfH/NGY1znKDTpJuTS0B/R/PhWfZxefNoHFgTJQT8NRG
         Tcv3+RBMB2gq/alWpDAnHLF7286mUoE8/1jE8Jvwl7Wtzgpicvs5vnxWJOieApLl9dfs
         M59EFvz65wu8J2IAb49YxsmMU0xerchvFsWKSPn318ePn7ilunlL2OhFfG+2y0czYpiq
         PCxlftQEX24xTccSPnlebMbh7+1tS5F9lEGvvPN6Ycu7FlA59/CfvdlIjhF6qK5w2F4w
         LprgsnW/BlO7PAyluv+BAPjmVS2wrFCuz0d5q6UKDKst6nJ+DcTJ+QBsoUYxn3JRQDMu
         hZYw==
X-Gm-Message-State: AGi0PuaSAAfR59xhxN1yTdR2SLwYLC6JmHubD+rjvtlGbGGLhtXh2SwQ
        /Xp4rCC6/IzuVMn6EXxt8+NDLOin7rYRaNccpPA=
X-Google-Smtp-Source: APiQypJ9rGr3BCmHvMoKXeWORpGrn5QcR8S7jh5VsG/SrTKaQlS+EszMGdUfmkzDbC3YvFuyD8Ym0XJG6VHxGeM+LKI=
X-Received: by 2002:a63:1d4:: with SMTP id 203mr8120019pgb.74.1587722377158;
 Fri, 24 Apr 2020 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org>
In-Reply-To: <20200423215709.72993-1-larsh@apache.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Apr 2020 12:59:29 +0300
Message-ID: <CAHp75VdZtrGr597WK6gCrpGDKct12xSScJKNMV8LNmmgBYNe_w@mail.gmail.com>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual fan control on
 select models
To:     Lars <larsh@apache.org>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Kevin Slagle <kjslag@gmail.com>,
        =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner@gmail.com>,
        Dario Messina <nanodario@gmail.com>,
        Stefan Assmann <sassmann@kpanic.de>,
        Alexander Kappner <agk@godking.net>, arc@osknowledge.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Apr 24, 2020 at 12:57 AM Lars <larsh@apache.org> wrote:
>
> This adds dual fan control for the following models:
> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
>
> Both fans are controlled together as if they were a single fan.
>
> Tested on an X1 Extreme Gen1, an X1 Extreme Gen2, and a P50.
>
> The patch is defensive, it adds only specific supported machines, and falls
> back to the old behavior if both fans cannot be controlled.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always
> changed together. So rather than adding controls for each fan, this controls
> both fans together as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan tool
> [1].
> All BIOS ids are taken from there. The X1E gen2 id is verified on my machine.
>
> Thanks to GitHub users voidworker and civic9 for the earlier patches and BIOS
> ids, and to users peter-stoll and sassman for testing the patch on their
> machines.
>

Pushed to my review and testing queue, thank you!

> [1]: https://github.com/vmatare/thinkfan/issues/58
>
> Signed-off-by: Lars <larsh@apache.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 ++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index da794dcfdd92..9e0f65e567be 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -318,6 +318,7 @@ static struct {
>         u32 uwb:1;
>         u32 fan_ctrl_status_undef:1;
>         u32 second_fan:1;
> +       u32 second_fan_ctl:1;
>         u32 beep_needs_two_args:1;
>         u32 mixer_no_level_control:1;
>         u32 battery_force_primary:1;
> @@ -8325,11 +8326,19 @@ static int fan_set_level(int level)
>
>         switch (fan_control_access_mode) {
>         case TPACPI_FAN_WR_ACPI_SFAN:
> -               if (level >= 0 && level <= 7) {
> -                       if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> -                               return -EIO;
> -               } else
> +               if ((level < 0) || (level > 7))
>                         return -EINVAL;
> +
> +               if (tp_features.second_fan_ctl) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan_ctl = 0;
> +                       }
> +                       fan_select_fan1();
> +               }
> +               if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> +                       return -EIO;
>                 break;
>
>         case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8346,6 +8355,15 @@ static int fan_set_level(int level)
>                 else if (level & TP_EC_FAN_AUTO)
>                         level |= 4;     /* safety min speed 4 */
>
> +               if (tp_features.second_fan_ctl) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_ec_write(fan_status_offset, level)) {
> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan_ctl = 0;
> +                       }
> +                       fan_select_fan1();
> +
> +               }
>                 if (!acpi_ec_write(fan_status_offset, level))
>                         return -EIO;
>                 else
> @@ -8764,6 +8782,7 @@ static const struct attribute_group fan_attr_group = {
>
>  #define TPACPI_FAN_Q1  0x0001          /* Unitialized HFSP */
>  #define TPACPI_FAN_2FAN        0x0002          /* EC 0x31 bit 0 selects fan2 */
> +#define TPACPI_FAN_2CTL        0x0004          /* selects fan2 control */
>
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>         TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8772,6 +8791,13 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>         TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>         TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>         TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +       TPACPI_Q_LNV3('N', '1', 'D', TPACPI_FAN_2CTL),  /* P70 */
> +       TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2CTL),  /* P50 */
> +       TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),  /* P71 */
> +       TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),  /* P51 */
> +       TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),  /* P52 / P72 */
> +       TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),  /* P1 / X1 Extreme (1st gen) */
> +       TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),  /* P1 / X1 Extreme (2nd gen) */
>  };
>
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8789,6 +8815,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>         fan_watchdog_maxinterval = 0;
>         tp_features.fan_ctrl_status_undef = 0;
>         tp_features.second_fan = 0;
> +       tp_features.second_fan_ctl = 0;
>         fan_control_desired_level = 7;
>
>         if (tpacpi_is_ibm()) {
> @@ -8813,8 +8840,12 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>                                 fan_quirk1_setup();
>                         if (quirks & TPACPI_FAN_2FAN) {
>                                 tp_features.second_fan = 1;
> -                               dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
> -                                       "secondary fan support enabled\n");
> +                               pr_info("secondary fan support enabled\n");
> +                       }
> +                       if (quirks & TPACPI_FAN_2CTL) {
> +                               tp_features.second_fan = 1;
> +                               tp_features.second_fan_ctl = 1;
> +                               pr_info("secondary fan control enabled\n");
>                         }
>                 } else {
>                         pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
> --
> 2.25.3
>


-- 
With Best Regards,
Andy Shevchenko

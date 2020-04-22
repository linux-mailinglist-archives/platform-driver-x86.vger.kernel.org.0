Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CE11B469F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Apr 2020 15:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgDVNuX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Apr 2020 09:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgDVNuW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Apr 2020 09:50:22 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5C2C03C1A9
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2020 06:50:22 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id s10so970145plr.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2020 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r5MLAjwUMHzpyOBbOYuDtWflGns31bS16OANHFpjwJ8=;
        b=fgTey+yYPysoaosTlfluB5bIRY0uHn//1s5f7GoTenq2wfpb/A7uLk8Iiws+NyYbhi
         0XacLwD6QTO2RwtKzl6aN2iNLcVZYrdXjv8M9/5ev31lC0iSS113gxqkDlgqB+wMwFeT
         jR8vsdy01cBg7pS2YDFH4q0HRFErpHLGsSL8v31YMEo5gkQHxQSOiAsOdef2vXY2kEFE
         889SpZQC8P0NVVzPOTG8C+frqYzEeVYvjloma2p9W9fN+kd4rxyfl9Fd9eEkUNxrswA3
         2Wvg5YrK/5nDOHVQydfQUybxv0PCOoJ/BBwqh0kC/wjBmGAStkmwXbyUgRLpZ6LsCZUm
         4SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r5MLAjwUMHzpyOBbOYuDtWflGns31bS16OANHFpjwJ8=;
        b=GTywbR6G6Ed4ZmbRchitnz9Cmjra4ogg4rGqh+NtYHTWaAaeiMlHgf3HOlVQYAjGNO
         5xkS1mb9jruwV+ZhNFwbBCpfYr7YmgjjUtrutjUfvqUji6FO1DR1RHm/ARkApmhSLTh9
         rQRXjsrG/MU9GcVvAMuIjRBHAP5d0xLB/eZPnLF/6sox4ihxG+AQqpisYJs7aCkSlIy9
         xmy8izyDhi2tKEdZEtd8Ll1S3UE/xV/eF3ayNs+kEM1yT8svYbucgQ7e7pysXA6g+DzN
         NAdHp6Oq+GCyZ2DGav9qXc8hzc59LQAWPWFgTuWlCKTOnY7jy6FaM5men4wZLORR/VeQ
         U7+A==
X-Gm-Message-State: AGi0PuYEG/b88Czqg6+Ocz+HSiKiBtf850truHbH/PNPCQvuVLWPblIy
        K7JmKiHK9JgSaymv1AZXntDLJAYPIZqYOrb5DGI=
X-Google-Smtp-Source: APiQypL9ddSXj7lwQj0CDL3++9JDcqjY7PsV7+jcCWxUvmQmAA5G6O7YSySCnSwWxZvkFgRAYOY94NLa6IbFLj00QgQ=
X-Received: by 2002:a17:90a:2401:: with SMTP id h1mr12281685pje.1.1587563422323;
 Wed, 22 Apr 2020 06:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200417201426.24033-1-larsh@apache.org>
In-Reply-To: <20200417201426.24033-1-larsh@apache.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Apr 2020 16:50:15 +0300
Message-ID: <CAHp75VexAMt3yM+p7HeXdyO51BfB5FOuoEjq9xTUi+tR-jj4JA@mail.gmail.com>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for dual fan control on
 select models
To:     Lars <larsh@apache.org>, Kevin Slagle <kjslag@gmail.com>,
        =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner@gmail.com>,
        Dario Messina <nanodario@gmail.com>,
        Stefan Assmann <sassmann@kpanic.de>,
        Alexander Kappner <agk@godking.net>,
        Marc Burkhardt <marc@osknowledge.org>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: people who lately involved in 2nd fan discussions here and there

Lars, also one question regarding the code below.

On Fri, Apr 17, 2020 at 11:15 PM Lars <larsh@apache.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks. Both fans are controlled together.
>
> Tested on an X1 Extreme Gen2.
>
> The patch is defensive, it adds only specific supported machines, and falls back to the old behavior if both fans cannot be controlled.
> However, it does attempt single fan control for all previously white-listed Thinkpads.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always changed together.
> So rather than adding controls for each fan, this controls both fans together as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan tool (https://github.com/vmatare/thinkfan/issues/58).
> (Thanks to Github users voidworker, and civic9.)
>
> The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id is verified on my machine.
>
> (In the first version my mail client botched the white-spacing - my apologies, this is my first Kernel patch. Used git send-email and gmail this time.)
>
> Signed-off-by: Lars <larsh@apache.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 33 +++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 8eaadbaf8ffa..cbc0e85d89d2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8324,11 +8324,20 @@ static int fan_set_level(int level)
>
>         switch (fan_control_access_mode) {
>         case TPACPI_FAN_WR_ACPI_SFAN:
> -               if (level >= 0 && level <= 7) {
> -                       if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> -                               return -EIO;
> -               } else
> +               if (((level < 0) || (level > 7)))
>                         return -EINVAL;
> +
> +               if (tp_features.second_fan) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
> +                               fan_select_fan1();
> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan = 0;
> +                       }
> +                       fan_select_fan1();
> +               }
> +               if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> +                       return -EIO;
>                 break;
>
>         case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8345,6 +8354,16 @@ static int fan_set_level(int level)
>                 else if (level & TP_EC_FAN_AUTO)
>                         level |= 4;     /* safety min speed 4 */
>
> +               if (tp_features.second_fan) {
> +                       if (!fan_select_fan2() ||
> +                           !acpi_ec_write(fan_status_offset, level)) {

> +                               fan_select_fan1();

(1)

> +                               pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                               tp_features.second_fan = 0;
> +                       }

> +                       fan_select_fan1();

(2)

I'm not sure I got a logic behind this. Why do you need to call it twice?

> +
> +               }
>                 if (!acpi_ec_write(fan_status_offset, level))
>                         return -EIO;
>                 else
> @@ -8771,6 +8790,9 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>         TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>         TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>         TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +       TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),  /* P52 / P72 */
> +       TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),  /* X1 Extreme (1st gen) */
> +       TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),  /* X1 Extreme (2nd gen) */
>  };
>
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8812,8 +8834,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>                                 fan_quirk1_setup();
>                         if (quirks & TPACPI_FAN_2FAN) {
>                                 tp_features.second_fan = 1;
> -                               dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
> -                                       "secondary fan support enabled\n");
> +                               pr_info("secondary fan support enabled\n");
>                         }
>                 } else {
>                         pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
> --
> 2.25.2
>
--
With Best Regards,
Andy Shevchenko

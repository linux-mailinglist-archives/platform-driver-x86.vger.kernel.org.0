Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D04C1ADE53
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Apr 2020 15:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbgDQNaq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Apr 2020 09:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730370AbgDQNap (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Apr 2020 09:30:45 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDACC061A0C
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 06:30:45 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h11so963958plr.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CfxDvscs6inoxPlLGG6JGorGBBJuPb+9bbRKa/YGS8E=;
        b=OLK9yTSNlPOHsw768/DpY9TC/fUCbjBH8geh5booZZkqZ+N2PDhUKVozKmmHQ/mQUS
         VGEEuk8SkvjEVKc0O/bWDd1pWX4DjN6As6ngVBL/ZkaprkX4O0ZOF6hIKnu7kNcftPGp
         tplmmw/9/6ugjDnmk4gl5aJPrlvkWPmBvvmRjy55Nhtj6yYiwtRli29dY7MR7ljd8YB2
         IS2Nvj07A1BdwAdUuthbOatF3joQcXFfA6sCXV2xPbbh3FKY796VJqqgSE5RwgmTdb0R
         1v1xaEHtzB4j0/qLNBlKJn0Zin9/hHSRoCMvjuPjbvh5N+R7PAIymFqf126tJodFD5dp
         LHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CfxDvscs6inoxPlLGG6JGorGBBJuPb+9bbRKa/YGS8E=;
        b=EEeJ9gchaV6GtZcJF5T/TWwdUxOph82HjNQTW5u6CjGEWuy5Wv4efe6OP1SFdxzSww
         wt4smuGqvelWZIe/RCoPBYWt4doNUVqcm8iQ78UEeD3fxJle60H4ZpYkzSyzAFNobetG
         ZQnKGZ0VRxoRwzY5AVjz/61/UVY5ZKBgsmCw4zSrFWH5BWax3SbP+RwfIsGR1/okT1EG
         5czgkkxDgv9yER+BF65vcRF5FJDtzf4krr5auxL0smdcz0oqytBgqqUrCB0upX1IDGoc
         tH8N33O/cY2F0LDegcJCD/gq7ewSyNBdTZg2Pjm+YXUP9nNse4qdg/KuLWpyngddG1kb
         /jFQ==
X-Gm-Message-State: AGi0PubxK9PzKljrgkzZjz7T0TJyKGvPyfpufoBobh4ImqgXBu3b8iIg
        5MNEz9+ofinfx23krd0e4g+5WBOKCVcLjJUnzvHGCBxZNnPZ/g==
X-Google-Smtp-Source: APiQypJqlcwl7MBcyJj1Hz16wVf1+XgGfkDSK7YQdgtO3J1V7zD8vOfNyTLdyVg6PweE4ajWPWiPdSQoeEOfM179hv4=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr4383743pjb.143.1587130245270;
 Fri, 17 Apr 2020 06:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <970969929.574750.1586116726988.ref@mail.yahoo.com> <970969929.574750.1586116726988@mail.yahoo.com>
In-Reply-To: <970969929.574750.1586116726988@mail.yahoo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 16:30:38 +0300
Message-ID: <CAHp75VdUtjr0kJDt0Wz05W73ZiN6nedeYdaw4RL34rbvpA_2+A@mail.gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for dual fan control on select models
To:     "larsh@apache.org" <larsh@apache.org>
Cc:     "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Apr 5, 2020 at 11:00 PM larsh@apache.org <larsh@apache.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen to dual fan quirks. Both fans are controlled together.
>
> Tested on an X1 Extreme Gen2.
>
> The patch is defensive, it adds only specific supported machines, and falls back to the old behavior if both fans cannot be controlled.
> It does attempt single fan control for all previously white-listed Thinkpads.
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

It doesn't apply :-(
Please, fix and resend.

> Signed-off-by: Lars Hofhansl <larsh@apache.org>
>
> ---
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index da794dcfdd92..8d46b4c2bde8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8325,11 +8325,20 @@ static int fan_set_level(int level)
>
>      switch (fan_control_access_mode) {
>      case TPACPI_FAN_WR_ACPI_SFAN:
> -        if (level >= 0 && level <= 7) {
> -            if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> -                return -EIO;
> -        } else
> +        if (((level < 0) || (level > 7)))
>              return -EINVAL;
> +
> +        if (tp_features.second_fan) {
> +            if (!fan_select_fan2() ||
> +                !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
> +                fan_select_fan1();
> +                pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                tp_features.second_fan = 0;
> +            }
> +            fan_select_fan1();
> +        }
> +        if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> +            return -EIO;
>          break;
>
>      case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8346,6 +8355,16 @@ static int fan_set_level(int level)
>          else if (level & TP_EC_FAN_AUTO)
>              level |= 4;    /* safety min speed 4 */
>
> +        if (tp_features.second_fan) {
> +            if (!fan_select_fan2() ||
> +                !acpi_ec_write(fan_status_offset, level)) {
> +                fan_select_fan1();
> +                pr_warn("Couldn't set 2nd fan level, disabling support\n");
> +                tp_features.second_fan = 0;
> +            }
> +            fan_select_fan1();
> +
> +        }
>          if (!acpi_ec_write(fan_status_offset, level))
>              return -EIO;
>          else
> @@ -8772,6 +8791,9 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>      TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>      TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>      TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +    TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),    /* P52 / P72 */
> +    TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),    /* X1 Extreme (1st gen) */
> +    TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),    /* X1 Extreme (2nd gen) */
>  };
>
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8813,8 +8835,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>                  fan_quirk1_setup();
>              if (quirks & TPACPI_FAN_2FAN) {
>                  tp_features.second_fan = 1;
> -                dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
> -                    "secondary fan support enabled\n");
> +                pr_info("secondary fan support enabled\n");
>              }
>          } else {
>              pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");



-- 
With Best Regards,
Andy Shevchenko

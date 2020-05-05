Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653D61C53CF
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 12:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEEK6p (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 06:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEK6p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 06:58:45 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0673DC061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 03:58:44 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v63so714860pfb.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 03:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eeB+d79Hgqd4cafLZBPvkatxr9uScnWbEN9ebTmczXg=;
        b=FQamejbuwQouoHIcLAoNvrrZZooR2W0k3ikq83UR/AJyFqkkBFdH31/KP/vZJoyKXm
         OUk2+FYKYR8zPMrwJCdjpT3CSLyV2taOr0/JBAQpN/WPEGyD7BM6ojSEu6Pr+3NB66Y1
         Cgq8gIai/YZiKlxaFd+eENhxocJX0UkzA/+fcBfVrrVS6o5Cg1xRdeRn9m511ReoMXej
         e9ixoDhStNC4LHAQWl+ik6W8KEol/l7mrv8JU0u1hkWd57m2DitRu8xibhtgWmoO2MeU
         pumbO1UyXa9r0EzNO4MEh0qMpLrdNvdWZdI6hCAAUn142tJfbXDw9FpWhoi7moHqaCyP
         3sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eeB+d79Hgqd4cafLZBPvkatxr9uScnWbEN9ebTmczXg=;
        b=ZZKs/xCpfk4M9mrJB1BoBbE4HrYsZtdj4LID0Ztn9T1YGEf3NF2HhkxqM/yqmEsfDf
         bB7AIrJF7c0CEDyOKa+oLavAYdS7/QFgc3cIqZMZTU/PY1f7fsW5VsBrUrUN+0maaiwi
         KVc6WUqZti0ljh2AzVwIlTLlXEC1cMK6CSiX99YtmXqlcDfT7YA7D7CLuPgnlc/6Xhxy
         XfRwLGeoN8f4RWO3/uOCJepl29s0gLo0ZvjvfPAz9NLPZ3SxPzx+469xVXZxDLPSXr1D
         LM569I6TbuvRG1go/n6W4gaoEvdi+fAJBfw6uIw7PauI5wYzKXboTbTDuhvPQQjuF4tx
         VkkQ==
X-Gm-Message-State: AGi0PuYbP63ql+dpC1Iq/8zRo9kXEwRluYb5SSALhA6VsrWbeyfEnIE8
        Yl7vJhYUU/mV01ecX2k9Hai6cNajs2vIkShNN88=
X-Google-Smtp-Source: APiQypIaek7R78prvG+IFmTHzkrq3ZcH9+kb/szMMJZ0vcPm9QhZymvYdn1ITBD148JHEJKkqL6LzdswsSuCQ4NPEZM=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr2506576pgb.203.1588676323556;
 Tue, 05 May 2020 03:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200505092825.145092-1-a@dun.ai>
In-Reply-To: <20200505092825.145092-1-a@dun.ai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 13:58:37 +0300
Message-ID: <CAHp75Vf3vTu+jR05WcN-SKFaS5Z+T7dq-WLqARDH_pM8U4rSjQ@mail.gmail.com>
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
To:     Andrew Dunai <a@dun.ai>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 5, 2020 at 12:29 PM Andrew Dunai <a@dun.ai> wrote:

Thank you for an update!

The things are still missing:
- versioning (run `git format-patch -v<n> ... `, where `<n>` is a
version number.
- Cc to PDx86 maintainers (Hans is the driver maintainer, and not the
subsystem one)
- commit message

But since it has SoB tag we may wait for Hans to Ack or NAK this one.

>
> Signed-off-by: Andrew Dunai <a@dun.ai>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 93177e6e5..a3ab19ab0 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -640,6 +640,20 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
>         .properties     = trekstor_surftab_wintron70_props,
>  };
>
> +static const struct property_entry vinga_twizzle_j116_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data vinga_twizzle_j116_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = vinga_twizzle_j116_props,
> +};
> +
>  /* NOTE: Please keep this table sorted alphabetically */
>  static const struct dmi_system_id touchscreen_dmi_table[] = {
>         {
> @@ -1054,6 +1068,13 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
>                 },
>         },
> +       {
> +               /* Vinga Twizzle J116 */
> +               .driver_data = (void *)&vinga_twizzle_j116_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
> +               },
> +       },
>         { },
>  };
>
> --
> 2.26.2
>
>


-- 
With Best Regards,
Andy Shevchenko

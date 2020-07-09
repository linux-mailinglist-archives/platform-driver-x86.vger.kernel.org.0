Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5705621A7A6
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgGITSv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgGITSu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:18:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA025C08C5CE
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2020 12:18:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ch3so1544935pjb.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5InImVCaQxa1ZBQiQs6M0IA9cKSuJ4WthCo5Eq37Jhw=;
        b=Q9BRFyZK85KwR8u/jgdYjjsBgqmaEAlBiRhqRw383pnUCyjMm6eDiaPZ4LsKXwY/J+
         tjUH8acPBxUIfFyKpQ2KuSB567veqQwB185Z2lpCiur7rCaoJOEUdXpvb+JM8MZNO5qh
         qx+txbo6Z+5GIw1bi0OD2yOZ9bdiynic5DKP2j93EtBqizDDkW3m/548nfMch0tSLBnL
         OQ79OfdyvvGz8rhhFkt399CgE8e5ZiTpRqaEQzQLTyKambmDi77yQqRZTbfYHrxPyKpH
         ieYqS+A1Jj3+hOnUPvCiVKVQl6k56W2Q9cqWtFu2X0WBfnotTQp4fkk958zeui2dQ8jK
         C+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5InImVCaQxa1ZBQiQs6M0IA9cKSuJ4WthCo5Eq37Jhw=;
        b=jTvbU4IEyBoRfgkI8gctDfNa8QqOO+yZr6Nxk8YfyFiPH7VJHXMnY6qvoVVqltzW+T
         mgmnns/Y3LNlCmd3WKzLwNxbZ4xWP1jxD+HhM+jRhq3npyMWtYKFd9rIqobot+c8dLe/
         7wwXy/7rSYe7Ce4/I/3qoGLuuEvFLWC7cKkHunGV2VxU40V31dkZlb8m0KQpcqFnWsOi
         IUvzFtqVQoLPN3i3OerQuXbnweeqK3ksO/u+31kGHOXx/8Te03uqy7cJLGHcGp+/u62x
         I9mVxIEITnZ0nEHakvy/yCYBuoEb8YEdJyqH4V8wBfyM8hT8dHFc22xOe7uiYuIQQmlC
         jsZw==
X-Gm-Message-State: AOAM533HC5IrNK2m5w/XzqZgq0HYoev8t8+dlukqhmVEGS7/0FIEHzo0
        FFP0M75hsWUcT5hqwJOFU/vbfS3zqF23a3ZM3kc=
X-Google-Smtp-Source: ABdhPJyA/wdhlTOCD1tOsZPZDvZC36EYcABs2Yu/TEpzu8+7FL0Y3uAnRRwLmAVPZQI8uPyLQT9saFIAkksK1o842ew=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr1613853pjb.181.1594322330234;
 Thu, 09 Jul 2020 12:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <4033154a9e166a37acb5c0491fa0b85f8b0fc032.camel@retarded.farm>
In-Reply-To: <4033154a9e166a37acb5c0491fa0b85f8b0fc032.camel@retarded.farm>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 22:18:33 +0300
Message-ID: <CAHp75VeubEjv_2WPeHK5twWYhK58xJ2L6Pcu3ibVEO-C24AsWQ@mail.gmail.com>
Subject: Re: [PATCH] support for ASUS ROG G14 (G401I) series asus-wmi.c/asus-nb-wmi.c
To:     Armas Spann <zappel@retarded.farm>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 17, 2020 at 3:02 PM Armas Spann <zappel@retarded.farm> wrote:
>
> Support for the currently unsupported ASUS G14 Notebooks (GA401I series) to the asus(-nb)-wmi.c sources.
> First change is the on the input buffer, the new devices are sending 5 DWORD instead of 3 as it was definded before. (might be already submitted upstream)
>
> The second part of the patch adds the correct device dmi identificator.

I can't take patch w/o Signed-off-by. See [1] for the details.

On top of that it doesn't apply. And it clashes with already applied
7b91f1565fbf ("platform/x86: asus_wmi: Reserve more space for struct bias_args")


>
>
>
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -116,6 +116,8 @@
>         u32 arg0;
>         u32 arg1;
>         u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
> +        u32 arg3; /* At least ROG Zephyrus G14 series uses 5 dword input buffer */
> +        u32 arg4;
>  } __packed;
>
>  /*
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -110,6 +110,12 @@
>         .wmi_force_als_set = true,
>  };
>
> +static struct quirk_entry quirk_asus_ga401i = {
> +       .wapf = 4, // not sure if that is correct
> +       .wmi_backlight_power = true,
> +       .wmi_backlight_set_devstate = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>         pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -411,7 +417,25 @@
>                 },
>                 .driver_data = &quirk_asus_forceals,
>         },
> -       {},
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. GA401IV",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
> +               },
> +               .driver_data = &quirk_asus_ga401i,
> +       },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. GA401IU",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
> +               },
> +               .driver_data = &quirk_asus_ga401i,
> +       },
> +       {},
>  };
>
>  static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
>


-- 
With Best Regards,
Andy Shevchenko

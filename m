Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C5B8FF96
	for <lists+platform-driver-x86@lfdr.de>; Fri, 16 Aug 2019 12:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfHPKA2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 16 Aug 2019 06:00:28 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42428 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHPKA2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Aug 2019 06:00:28 -0400
Received: by mail-pl1-f196.google.com with SMTP id y1so2250784plp.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Aug 2019 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KyIeIrOcGD0b4Fk4I3OXA3l6qQOR1N65XYe481MO3+A=;
        b=KrZhBfHcrYYGGYKsE4ohFYCoegTThDe7DhMFEWjSGFcjkoyqkY3auj4YTT1XoLyCRx
         wHHRvmir46c0Xa+IotRwG5OWn+psXnzTWkVyOOf01kO+O5lQ0Tk6kTkcVV+XN0x4zyim
         yLG5t2n1qrvwkGy/lQGU5rFq6dZq3+tSPmM0uv2nVfrDl1d98HKR6ejWuE2u20Zuf2kL
         SWiYGh+rVYCY+mbwQD9XRwLN9nTBmM/rqxg0D/3c2fRsjByX8JcX7xRgmCeg496xa2qQ
         /n0IkSG8cgHBRdRwryGUdIclq6j0ZVkaPNDCRCW5fOCaUmvsoSScf+M0Gkxsop8njmWl
         f5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KyIeIrOcGD0b4Fk4I3OXA3l6qQOR1N65XYe481MO3+A=;
        b=KBQMSZoaWPbAfZnZIUC7C5pm79WFOOwGKTx88bXOYNkc+RVPxRvtAkug1ZiCYC6T7I
         1RG9K/c1rZbH4WC4m1lMuOm6Yw4NLh0IJHynf0FwY0M8ryjz92QHzWy0r6bEsPIROlTV
         KRylHywrNbl5mwSLjL1HftsLGccAozpN9DgNs3A78Owdl6fW40BFIST/W1Kv+D2CMsgd
         kRqvKLJEZ12dIgTTIOXsJF2cjSHm/aYOfrqPTwn3CDVBWbgL+SQTfXEITy1DlDUHZlF3
         0k5slhr3MtpsErbXTHTxTyvCBm8OQ5r9I5d47v+wklCyhzPEJrFfCgA/f1s5fdiE95Lb
         4XZQ==
X-Gm-Message-State: APjAAAUQYipnKcrbbhuFyaOXXbs5N5yLaO8KC19fEuHxDzjnP7ZhTx/m
        Dh7/nW9SFtQI9MfhUors8mMm9obG2NAn/L1e4JuI3qP+QIs=
X-Google-Smtp-Source: APXvYqwolEtcJ151r6CkNVr/+rXHI1GUnh1Wj2kPG887NwI4OIujiVEq2K2hoYokUl3DMs18Gd9g6Tl0SoA21zIW0Uo=
X-Received: by 2002:a17:902:9348:: with SMTP id g8mr8657962plp.18.1565949627904;
 Fri, 16 Aug 2019 03:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190804152142.7956-1-kristian@klausen.dk>
In-Reply-To: <20190804152142.7956-1-kristian@klausen.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Aug 2019 13:00:16 +0300
Message-ID: <CAHp75VeQsk541RJZbbvjLT5YL+cmVqQ9UmxGu5OchPv2TsMG7g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Support ALS on the Zenbook UX430UNR
To:     Kristian Klausen <kristian@klausen.dk>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 4, 2019 at 6:32 PM Kristian Klausen <kristian@klausen.dk> wrote:
>
> This patch adds support for ALS on the Zenbook UX430UNR to the asus_nb_wmi
> driver.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
> There is a few other laptops in the UX430 series (UX430UA, UX430UN,
> UX430UAR), which probably need the same fix.
> Would it be better to match against UX430?

Let's see when we need to add next one.

>
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 2ebde0174937..b361c73636a4 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -402,6 +402,15 @@ static const struct dmi_system_id asus_quirks[] = {
>                 },
>                 .driver_data = &quirk_asus_forceals,
>         },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. UX430UNR",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "UX430UNR"),
> +               },
> +               .driver_data = &quirk_asus_forceals,
> +       },
>         {},
>  };
>
> --
> 2.22.0
>


-- 
With Best Regards,
Andy Shevchenko

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFA921C425
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Jul 2020 14:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgGKMUh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Jul 2020 08:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgGKMUh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Jul 2020 08:20:37 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935FEC08C5DD
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 05:20:37 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id p1so3347504pls.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZKZMKxFL7rw310HDyDmypSj9AoPeNWZweKrzC+2B3c=;
        b=YolYyDSqXQMb7PvP14kLiFcoENeXOUUQEZXxNms2fjtVuuNiohOtyk4N9w/fxDHkDP
         MzsSUYG/FY9CuMz0QMdjVeMDOktX7a2MuFRKONLKAsJ+KQruGAIAq8hz2kd2SbNGSoS3
         yEPqpxnxeYU6+qHcu1XxXH6LF0H5x+bVUTJLMXmm1Sp4ZT3tm7BIPC2nQMtLNQApTOuc
         fKAucOhJIyTtV8MyKGV5gQsrFMmkOuPHljoTPXZ30e22rx6tLwsJz8TUKyr3uz0uetOn
         qu06X8V0N/wGOtkk/AEcZL0dW0h0GC8XOr1zjrumwcR160IabF/DJ97Tm9RsCKDUs+c1
         Pelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZKZMKxFL7rw310HDyDmypSj9AoPeNWZweKrzC+2B3c=;
        b=WlBCTAvcY7VG/zWtWKF9eOpY8m14HF5DBgLtnK+Dk3As3w1Qv+2cEJlvj9+edXKoFy
         qm07rvTGi4B5eh8yWyF23vvAQaUBcOdKpCpnK9eBE2rq/jE0hGurwKyuY1dRFIbxiwZR
         5viLveyidK4DBhuMT9uRyQ1h1vvG2neesnwfpXa/S/cPka0Mwf6TOuHJui+axgrgioj9
         /6THZ3U5ODgY790y0tr8NXa1LDVBt7rgQUZ4Mn86mFloWdPKenPKUdpZ5q6LZFNAN/Pa
         CQ4zyb0hrHTxXpHzboArZyYMVT2s+O/Fv6mf80xGpibfXMLdeiZr1Yee8Lvwpf6MhVW3
         66+A==
X-Gm-Message-State: AOAM533MON9rkQmClCsIwMKKjr/Di3eDO9noTfTytyue7WHaM8tQztIa
        YWcP3i1+oG44c4VyyjcXk7NqBemTKNcNElsK0nA=
X-Google-Smtp-Source: ABdhPJzoundy3OFWby4BeeYk0M2R7M3s3DCTFscd5IrJUrrpwjCkBT2Mtzy5s3eYz6yLx9qn2nqzidiH1S3U8sST9aQ=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr10409514pjb.181.1594470036995;
 Sat, 11 Jul 2020 05:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200711094321.6615-1-zappel@retarded.farm>
In-Reply-To: <20200711094321.6615-1-zappel@retarded.farm>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 11 Jul 2020 15:20:20 +0300
Message-ID: <CAHp75Veq6Upg2-b0cNWamb9b5hB0zUznVoKcLaS7GLvipC5mGQ@mail.gmail.com>
Subject: Re: [PATCH v3] Added device support for the new ASUS ROG Zephyrus G14
 (GA401I) and G15 (GA502I) series.
To:     Armas Spann <zappel@retarded.farm>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jul 11, 2020 at 12:43 PM Armas Spann <zappel@retarded.farm> wrote:
>
> This is accomplished by two new quirk_entry structs (one for each series),
> as well as all current available G401I/G502I DMI_PRODUCT_NAMES to match
> the corresponding devices.
>

I'm going to apply this, but for the future...

> Signed-off-by: Armas Spann <zappel@retarded.farm>
> ---

>  asus-nb-wmi: add support for ASUS ROG Zephyrus G14 (GA401I) and G15 (GA502I)

...this actually should be a subject of the patch. But here you put
something like:

>
>  drivers/platform/x86/asus-nb-wmi.c | 82 ++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 8c4d00482ef0..2794b840fc29 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -110,6 +110,16 @@ static struct quirk_entry quirk_asus_forceals = {
>         .wmi_force_als_set = true,
>  };
>
> +static struct quirk_entry quirk_asus_ga401i = {
> +       .wmi_backlight_power = true,
> +       .wmi_backlight_set_devstate = true,
> +};
> +
> +static struct quirk_entry quirk_asus_ga502i = {
> +       .wmi_backlight_power = true,
> +       .wmi_backlight_set_devstate = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>         pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -411,6 +421,78 @@ static const struct dmi_system_id asus_quirks[] = {
>                 },
>                 .driver_data = &quirk_asus_forceals,
>         },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. GA401IH",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
> +               },
> +               .driver_data = &quirk_asus_ga401i,
> +       },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. GA401II",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
> +               },
> +          .driver_data = &quirk_asus_ga401i,
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
> +               .ident = "ASUSTeK COMPUTER INC. GA401IVC",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
> +               },
> +               .driver_data = &quirk_asus_ga401i,
> +       },
> +               {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. GA502II",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
> +               },
> +          .driver_data = &quirk_asus_ga502i,
> +       },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. GA502IU",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
> +               },
> +               .driver_data = &quirk_asus_ga502i,
> +       },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. GA502IV",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
> +               },
> +               .driver_data = &quirk_asus_ga502i,
> +       },
>         {},
>  };
>
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko

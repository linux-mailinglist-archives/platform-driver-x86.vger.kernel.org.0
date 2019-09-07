Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6477AC8C6
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Sep 2019 20:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390886AbfIGSXy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 7 Sep 2019 14:23:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42498 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729261AbfIGSXy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Sep 2019 14:23:54 -0400
Received: by mail-pf1-f193.google.com with SMTP id w22so6622764pfi.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Sep 2019 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxAciqGOwA+IFLQXwo2cQWCNAu43cenH5uWAEP6iLyw=;
        b=MS0A0NZEmWYfECzupnHGswRf4uxHNJOwfUE2hswzbw1CGBLbZUwmPD1IUhMVB/3R8L
         g2b0nTzVx5cxy1dn1tBIDhEVu0Flf5/dgKIvp0WguF+g3yKpM4QYtg2tEQTED4hr/LBZ
         QnddhY8H2lTgA3/AxzrTH+iO2bHcCK1YFT2yeh8X0ZN5HdLBv3pwmGcJJMKOQM1/LDLK
         cB0yOF7Dubho+HM7H6qg4xlnlc/oAFXq/X7JXsKOls/GaXFfgRBnVeJinBErXjH2NQ0y
         EcYQlgWhN6rai61efJosmYG5W31NFH6GfSaU7clOVzFSOEK8C5UiAL6+Oa9GrZnsAvQI
         hVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxAciqGOwA+IFLQXwo2cQWCNAu43cenH5uWAEP6iLyw=;
        b=mBgwjikyF96arMrofq+EwgEXccaYwMKHykN/rNp5VkjQ05I3iPRCA9rwevsjHL82cZ
         HrgrqAMxbt2RJoESlAW7KXrZ/GhDosH1GzC2FFXQaoVQRicPJCmGH78ZkcWDZQGlS8HF
         e/6GQ8NUAFs2jDZvA7AIIsB5jkNwCgoMt7pCzg/Jeu0j3L32PMtXEV6gLapPWFuSJioN
         XD7zREz1JUJoHle8YUUb9ya+WNlPnUxM2FhAjWjtrTjpuaiuE5aSTLh4XsvAo2t2CAgt
         HgSb1BQ1RSfBpsP3qXgxHNUt5r1cfsblWPIRRscPtX0IfpY2b8w1OJNeP2lwOs22D6DE
         2BeQ==
X-Gm-Message-State: APjAAAVNAoHLn8MtCJ1rfhjqBGyRTt8nGAvJDEDROj/TMCVlVN19d051
        JAUGEKa1A4f79BwPDgW+tzUJ8oHENQS+CSH0jwg=
X-Google-Smtp-Source: APXvYqyQXpQ7H8kb1Vft1aoleyPMm6W37LlsRBgh9wog1oMzH2BuRCJW6Ftye9gGUWMYN9nOmUgFQcpTjC2AG+FiNqI=
X-Received: by 2002:a63:c842:: with SMTP id l2mr13627399pgi.4.1567880633154;
 Sat, 07 Sep 2019 11:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190905064707.7640-1-drake@endlessm.com> <20190905064707.7640-2-drake@endlessm.com>
In-Reply-To: <20190905064707.7640-2-drake@endlessm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 7 Sep 2019 21:23:42 +0300
Message-ID: <CAHp75VerAt+mQ9NYUHVXdem2DYrWMM8Ospz2btoUq-sjnK6Qkg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hp_accel: fix accelerometer orientation for EliteBook 840
To:     Daniel Drake <drake@endlessm.com>
Cc:     Eric Piel <eric.piel@tremplin-utc.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>, pavel@suse.cz,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>,
        burman.yan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Sep 5, 2019 at 9:47 AM Daniel Drake <drake@endlessm.com> wrote:
>
> The HP EliteBook 840 G1 accelerometer does not behave according to the
> current "EliteBook 84" driver quirk.
>
> Instead, it needs all three axes inverted in order to achieve the
> behaviour described in the lis3lv02d.rst documentation. We have confirmed
> this on multiple units.
>
> Add a new product-specific quirk to correct this, but also leave the
> previous match in place, assuming that it is correct for other models
> that will continue to match that one instead.
>
> DMI data of this product is:
> Handle 0x000D, DMI type 1, 27 bytes
> System Information
>         Manufacturer: Hewlett-Packard
>         Product Name: HP EliteBook 840 G1
>         Version: A3009DD10303
>         Serial Number: 5CG51115YS
>         SKU Number: F9W96UP#ABA
>         Family: 103C_5336AN G=N L=BUS B=HP S=ELI
>
> Handle 0x000E, DMI type 2, 16 bytes
> Base Board Information
>         Manufacturer: Hewlett-Packard
>         Product Name: 198F
>         Version: KBC Version 15.59
>         Serial Number: PDXVC00WB8G0Y2
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
>  drivers/platform/x86/hp_accel.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 7a2747455237..bbacaa21d539 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -162,6 +162,7 @@ static int lis3lv02d_dmi_matched(const struct dmi_system_id *dmi)
>  DEFINE_CONV(normal, 1, 2, 3);
>  DEFINE_CONV(y_inverted, 1, -2, 3);
>  DEFINE_CONV(x_inverted, -1, 2, 3);
> +DEFINE_CONV(xyz_inverted, -1, -2, -3);
>  DEFINE_CONV(x_inverted_usd, -1, 2, -3);
>  DEFINE_CONV(z_inverted, 1, 2, -3);
>  DEFINE_CONV(xy_swap, 2, 1, 3);
> @@ -237,6 +238,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
>         AXIS_DMI_MATCH("Mini510x", "HP Mini 510", xy_rotated_left_usd),
>         AXIS_DMI_MATCH("HPB63xx", "HP ProBook 63", xy_swap),
>         AXIS_DMI_MATCH("HPB64xx", "HP ProBook 64", xy_swap),
> +       AXIS_DMI_MATCH("HPEB840", "HP EliteBook 840", xyz_inverted),
>         AXIS_DMI_MATCH("HPB64xx", "HP EliteBook 84", xy_swap),
>         AXIS_DMI_MATCH("HPB65xx", "HP ProBook 65", x_inverted),
>         AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko

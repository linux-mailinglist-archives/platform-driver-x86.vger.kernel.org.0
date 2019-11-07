Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9A5F3539
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 Nov 2019 17:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbfKGQ7e (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 Nov 2019 11:59:34 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41656 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728847AbfKGQ7e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Nov 2019 11:59:34 -0500
Received: by mail-pg1-f194.google.com with SMTP id h4so2430873pgv.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Nov 2019 08:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7A4eU5cps6Xs0zckFNZIiSLIWdga/M78whGyMBu6ZFk=;
        b=DdnT6Up2EpV+2RK9pnGcmx9rEjyGe6i3qd8eIxIm7q988KVa4aqO6XVnOauk8lwHKF
         2WrNcNDG291nZHBqzW5auowt+f1mDJTrjUXyhhx5VMkC779uoCJdfI60YFByWTk1cdLx
         iKizIN3nbiNMc60dZApvOEFz+zhDf0auP5uCDruGcb8ADE0U6wEDmZ/6kxfc2rPNFaXr
         NeI2RHVKCmiymtpwC+91UQUA8BXT292m8wj6JItB7S3s+6lq4IIhKsSDpco2RTPEInLd
         7hsIBVbnCrxwBBGoU78IXjVEW6ZVEqGURobr/i+FFN4hsSI7yAL4t11lx9FoGqQsstOs
         J5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7A4eU5cps6Xs0zckFNZIiSLIWdga/M78whGyMBu6ZFk=;
        b=LLXP67BJDx/YFu6LHyK9QhcVC2vzIOmJKcD6Zy7Zc6FdXklbP+x29mQNR88dVHAcVm
         nPsQc33ao8Te9F0VrN49ZaYQiS2FZm9z/PSfa0SVi1FWH/zDNsDVkPEy505j16Vkir7V
         hRHlgZcgrSjhSVpkeENXpk2HFkXz8MJH8p3edQzNCwya8OvkS+UEBg1Wtm2s31/180EA
         yOv3Ex9WO53p0bz3w0Fla3+7yRpXohjk5tTt3SqrMvQ9gq8eeBDHEiiq0mKVkqXmiwWP
         pcvXQ6M0IsYAJlveQ9GxU2o19eKPz9WYTDmkX56AqPIdw0HiGOLLjH1ix/6gdg4cECqk
         z3Hw==
X-Gm-Message-State: APjAAAWywjBmk88lHoCodfiltmAWRkm3KGtH+toQpxKkP0cyuQN0+5KW
        1G2eaVaXc7AX6vHAhmzRTvcEAvpKX/J5LC8FwkU=
X-Google-Smtp-Source: APXvYqweQXn49QMXpJ06RZNgnQuVpX6tfJ5v+CttlW8MZnMzpRmmChz0j9ruI2qodDPHZiQA5yzj8hmsr0SRxbs3Plw=
X-Received: by 2002:a63:3c6:: with SMTP id 189mr5651340pgd.4.1573145972292;
 Thu, 07 Nov 2019 08:59:32 -0800 (PST)
MIME-Version: 1.0
References: <214485435.80619.1571852088722@nm83.abv.bg>
In-Reply-To: <214485435.80619.1571852088722@nm83.abv.bg>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 7 Nov 2019 18:59:21 +0200
Message-ID: <CAHp75VdqFQ5Ri2YNfZbbm9BukYtbXjjtnRYe-Dc+xN-_gkgsfw@mail.gmail.com>
Subject: Re: ASUS FX505DT wmi backlight/amdgpu backlight conflict
To:     Kristian Angelov <kristiana2000@abv.bg>,
        Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thank you for your report. Unfortunately I have no such device to test.
Nevertheless, I Cc'ed to people who may share their thoughts about the topic.

Note, you should Cc maintainers of subsystem and driver in question in
the first place.

On Thu, Oct 24, 2019 at 11:50 AM Kristian Angelov <kristiana2000@abv.bg> wrote:
>
> Hello,
>
>
> I own an ASUS FX505DT (integrated vega amdgpu), and the backlight control seems
> to be conflicting with the asus-nb-wmi driver.
>
>
> Upon booting normally with a standard kernel 5.3.7 on Arch, the asus-nb-wmi
> driver gets loaded properly. It does not create any backlight devices in
> /sys/class/backlight. However, ACPI-video seems to fail to get created and I get
> This in my systemd log:
>
>
> systemd-backlight[771]: Failed to get backlight or LED device 'backlight:acpi_vi
> deo0': No such device
>
>
> This implies that acpi_video0 gets registered by systemd but fails early on
> during the boot process. Regardless, backlight seems to work fine using the
> hotkeys as the only device present in /sys/class/backlight is amdgpu_bl0.
>
>
> As any sane person, I want to remove those nasty fail messages from my log. with
> the solution being to set acpi_backlight=vendor in my boot flags, which stops
> acpi_video0 from being registered and removes the log, however asus-nb-wmi kicks
> in and registers it's own backlight device. There are two backlight devices
> currently active amdgpu_bl0 and asus-nb-wmi and the latter does not control the
> backlight but seems to take priority in the keybinds.
>
>
> I looked throught the driver and implemented the following:
>
>
> index b361c73..e0ca145 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -105,6 +105,11 @@ static struct quirk_entry quirk_asus_x550lb = {
>         .xusb2pr = 0x01D9,
>  };
>
> +static struct quirk_entry quirk_asus_fx505dt = {
> +       .wmi_backlight_power = true,
> +       .wmi_backlight_set_devstate = true,
> +};
> +
>  static struct quirk_entry quirk_asus_forceals = {
>         .wmi_backlight_set_devstate = true,
>         .wmi_force_als_set = true,
> @@ -411,6 +416,15 @@ static const struct dmi_system_id asus_quirks[] = {
>                 },
>                 .driver_data = &quirk_asus_forceals,
>         },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. FX505DT TESTING",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "FX505DT"),
> +               },
> +               .driver_data = &quirk_asus_fx505dt,
> +       },
>         {},
>  };
>
>
> where wmi_backlight_power is supposed to prevent the creation (or use) of this
> new backlight device. However this does not seem to be the case. So far the only
> way the backlight works is with acpi_backlight not defined at all. If I set it
> to anything, even video, it creates another worthless backlight device. I do
> believe this is either a bug in asus-wmi and wmi_backlight_power doing not what
> it's supposed to. Either that or I am mistaken as to how any of this works, and
> would like help with implementing my device.



-- 
With Best Regards,
Andy Shevchenko

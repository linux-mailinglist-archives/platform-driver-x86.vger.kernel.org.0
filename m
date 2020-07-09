Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD70A21A748
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 20:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgGISu5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 14:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGISu4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 14:50:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85273C08C5CE
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2020 11:50:56 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p3so1365921pgh.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xzMlsA2h+yPbeLAJolQe5XonvTmgMY9nrap1BIBTlKY=;
        b=bpItGWHK0dWgwDJ5rhTo77p1SmjZjB9OEtvzeqcHGMdH2payTIkix0BEnfwckNzZWw
         Xu+v15EQ/juxP3BSL1DHUM8vOLHkfgIyJIs6pks54ishaiCpU3929BP2atFVLORwtNJE
         GbvfcyUradin/A5zsB1N8+cpKYJPNt60XGGhe5tOjRuZ4CVHMueHLuM1ZcFZw8/54HLy
         nZQLsonTQgOcGbytGaA5InXcNrGjFy5dTIRm2OdpwBb+NvHWHPZetbpMvnvfoyd072VL
         JVqP6/6N1OfWUXshJwRuwx0b7ujmhotDF3NDErMpceAPwjCL4jtb563IhY3sjyPR8Ni4
         hd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xzMlsA2h+yPbeLAJolQe5XonvTmgMY9nrap1BIBTlKY=;
        b=FDny1sjeINzdegnEOggFDV+vPsPFaSXGBIn9AlHrAiGFc8p6bRUfiyv4dAmi4R4oMX
         rQxWdq7V7VLXUUQO0L6InERVfyW24/RW9SkVpCPooZzf//8+PmrNegVbhBCxk12T4JAt
         8200ruz3cN0brkZ1VwgPm2eGfUMpC9/8WLm/GifDyTGsLoXXTcIouX263zrFaiL0h5EU
         zrpYhA6d2w6xwe5I3KEvLLX+ufj9o6t4FwNrR3z7a1SvmZrz40Igokbi32Ess5kZg4iI
         tCCAuPRPbqpSrvPcwkyHfalZbYzsHrdRXyErkQdL6A+NwnlpRThNYs9PRVMWM2qMGyxo
         Zgog==
X-Gm-Message-State: AOAM533IUz7q1bTx39/w1t0R/Z8TD0OzEzqIwSYBAWkIiWfq25S9G1hm
        8cjQJk8AkucrzRatZhjdmrDkaA05SlCLcQI/S3kGVW5N
X-Google-Smtp-Source: ABdhPJzjxIZX2akvRmyO6iuhHcUt8MDby8flWN9Dodu1LRSwf/GeCDAwZE6CeuY3Lbfclxk+nz0Yy28LNCt/1caUvSI=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr32307052pgi.203.1594320656008;
 Thu, 09 Jul 2020 11:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
In-Reply-To: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 21:50:39 +0300
Message-ID: <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
Subject: Re: [RESEND PATCH] system76-acpi: Fix brightness_set schedule while atomic
To:     Nick Shipp <git@segbrk.com>
Cc:     Jeremy Soller <jeremy@system76.com>, productdev@system76.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 23, 2020 at 5:44 PM Nick Shipp <git@segbrk.com> wrote:
>
> And here's a fix for my email client and bad copy-paste, sorry about that noise.
>
> `system76_set' was set as an LED `brightness_set' callback, but it calls
> `acpi_evaluate_object' which is not atomic-safe. Switched to the
> `brightness_set_blocking' LED callback instead.
>
> Signed-off-by: Nick Shipp <git@segbrk.com>

This patch is mangled and can not be applied.

> ---
>  drivers/platform/x86/system76_acpi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/system76_acpi.c
> b/drivers/platform/x86/system76_acpi.c
> index 4f6e4c342382..c14fd22ba196 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -103,12 +103,12 @@ static enum led_brightness ap_led_get(struct
> led_classdev *led)
>  }
>
>  // Set the airplane mode LED brightness
> -static void ap_led_set(struct led_classdev *led, enum led_brightness value)
> +static int ap_led_set(struct led_classdev *led, enum led_brightness value)
>  {
>         struct system76_data *data;
>
>         data = container_of(led, struct system76_data, ap_led);
> - system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
> + return system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
>  }
>
>  // Get the last set keyboard LED brightness
> @@ -121,13 +121,13 @@ static enum led_brightness kb_led_get(struct
> led_classdev *led)
>  }
>
>  // Set the keyboard LED brightness
> -static void kb_led_set(struct led_classdev *led, enum led_brightness value)
> +static int kb_led_set(struct led_classdev *led, enum led_brightness value)
>  {
>         struct system76_data *data;
>
>         data = container_of(led, struct system76_data, kb_led);
>         data->kb_brightness = value;
> - system76_set(data, "SKBL", (int)data->kb_brightness);
> + return system76_set(data, "SKBL", (int)data->kb_brightness);
>  }
>
>  // Get the last set keyboard LED color
> @@ -313,7 +313,7 @@ static int system76_add(struct acpi_device *acpi_dev)
>         data->ap_led.name = "system76_acpi::airplane";
>         data->ap_led.flags = LED_CORE_SUSPENDRESUME;
>         data->ap_led.brightness_get = ap_led_get;
> - data->ap_led.brightness_set = ap_led_set;
> + data->ap_led.brightness_set_blocking = ap_led_set;
>         data->ap_led.max_brightness = 1;
>         data->ap_led.default_trigger = "rfkill-none";
>         err = devm_led_classdev_register(&acpi_dev->dev, &data->ap_led);
> @@ -323,7 +323,7 @@ static int system76_add(struct acpi_device *acpi_dev)
>         data->kb_led.name = "system76_acpi::kbd_backlight";
>         data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
>         data->kb_led.brightness_get = kb_led_get;
> - data->kb_led.brightness_set = kb_led_set;
> + data->kb_led.brightness_set_blocking = kb_led_set;
>         if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
>                 data->kb_led.max_brightness = 255;
>                 data->kb_toggle_brightness = 72;
> --
> 2.27.0



-- 
With Best Regards,
Andy Shevchenko

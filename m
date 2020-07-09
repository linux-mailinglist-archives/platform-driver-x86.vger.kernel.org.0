Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E6021A7DF
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgGITfh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgGITfh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:35:37 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F78C08C5CE
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2020 12:35:37 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id md7so1557222pjb.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YsNDkYaISgV2+92QS0X2z0XFnVeFW7ovX0Tb4PBU86o=;
        b=nL4XZoCiwU2Ri3yX6vI2LIj0aMRquWhI9heZ43RWIc1AGOExCeiaa8tRk+6YIokyOT
         BlUkkavp6K7Wc9I6EVHiw6KM+xpefSH2/j2IexreeJu62apQiM52FpbWNOSMCU48DfFX
         mlZ0BmeBRAvt6MX1zYEf26jRwgKoAxRaGTfJc7dc+syIyBLeLQk7Psxf9iYaCOUJBVkS
         dIFGcfX5k5nhIZWCTUtGjNN1V6uMwazypfZqcRsKLpKfNwdgSnaefALdMHLAKOz5xb/M
         peqBLj0HO/3V+5vgpukmTKLZK4Hd5YlD7v14AGsAPB2OKdkfAWLWyTc588diZ2E2SxTt
         JhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YsNDkYaISgV2+92QS0X2z0XFnVeFW7ovX0Tb4PBU86o=;
        b=k9hWrRu40YWvcLiQBTZn3v5c3/mVmjs541Jk/u8DFF/Ntbu7PZTJqgmRzyRx7dUR4h
         eg3OsLj8LxbhPB3tH+N10vseZLmteDhMPyc9PQsAKre9B7BjdRzhQzERV5XMzfJwy4X6
         VZMiTQdlYrETl5hdq5SobB7icA+LTyHQG4GU83sEf5cp3q+XkGZi/UcwW2pXxUFmk/4+
         KQPrQG1fETAAqANJBSRk3x6gOj48n8N0Q3hlZ72OXMRLxFSiNqSAx4sRH+bQvffk1wXW
         OqH2vqkTyyjmqrlVaHqIA8EGwE1aHmwmXdLlkCZ08gK6oEFFxSIYnu16hM149kCQBiAv
         6W6A==
X-Gm-Message-State: AOAM531+zTI3xgnka8+BW0o3h6srq1mm7xHSeBSeeVs5pTkQtDL/qWyN
        MsBlGxqkqG0fzBPlq1itSZuc8yQJCdLM/pScZG4=
X-Google-Smtp-Source: ABdhPJw7UJV5XDZUm60BQGVnzgVSSNHrU8ncToR9NJO0gd7JqH7ihivj+xguEl9PZG5vH2yU6wVU6JEYeTnARqMGJhc=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr1788244pjb.129.1594323336825;
 Thu, 09 Jul 2020 12:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
 <CADjEuPtkKjBqCXxVUHX9f19cAkW10uss2QyYn5P-b=XNeg6gRg@mail.gmail.com>
 <CAHp75VeubG03p=A8aEERjsnF1idVc40gmGAwgB=8rp9ZOHPZGw@mail.gmail.com> <20200709192925.GA27478@penyfal.localdomain>
In-Reply-To: <20200709192925.GA27478@penyfal.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 22:35:20 +0300
Message-ID: <CAHp75VcwnumhpOJGzZzOGH2wy0Ma_qk5DR9sKoT9fhE+Vns31g@mail.gmail.com>
Subject: Re: [PATCH v2] system76-acpi: Fix brightness_set schedule while atomic
To:     Nick Shipp <git@segbrk.com>
Cc:     Jeremy Soller <jeremy@system76.com>, productdev@system76.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 9, 2020 at 10:32 PM Nick Shipp <git@segbrk.com> wrote:
>
>
> `system76_set' was set as an LED `brightness_set' callback, but it calls
> `acpi_evaluate_object' which is not atomic-safe. Switched to the
> `brightness_set_blocking' LED callback instead.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Nick Shipp <git@segbrk.com>
> ---
> Changes in v2:
> - Fixed patch formatting (whitespace)
> ---
>  drivers/platform/x86/system76_acpi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index 4f6e4c342382..c14fd22ba196 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -103,12 +103,12 @@ static enum led_brightness ap_led_get(struct led_classdev *led)
>  }
>
>  // Set the airplane mode LED brightness
> -static void ap_led_set(struct led_classdev *led, enum led_brightness value)
> +static int ap_led_set(struct led_classdev *led, enum led_brightness value)
>  {
>         struct system76_data *data;
>
>         data = container_of(led, struct system76_data, ap_led);
> -       system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
> +       return system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
>  }
>
>  // Get the last set keyboard LED brightness
> @@ -121,13 +121,13 @@ static enum led_brightness kb_led_get(struct led_classdev *led)
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
> -       system76_set(data, "SKBL", (int)data->kb_brightness);
> +       return system76_set(data, "SKBL", (int)data->kb_brightness);
>  }
>
>  // Get the last set keyboard LED color
> @@ -313,7 +313,7 @@ static int system76_add(struct acpi_device *acpi_dev)
>         data->ap_led.name = "system76_acpi::airplane";
>         data->ap_led.flags = LED_CORE_SUSPENDRESUME;
>         data->ap_led.brightness_get = ap_led_get;
> -       data->ap_led.brightness_set = ap_led_set;
> +       data->ap_led.brightness_set_blocking = ap_led_set;
>         data->ap_led.max_brightness = 1;
>         data->ap_led.default_trigger = "rfkill-none";
>         err = devm_led_classdev_register(&acpi_dev->dev, &data->ap_led);
> @@ -323,7 +323,7 @@ static int system76_add(struct acpi_device *acpi_dev)
>         data->kb_led.name = "system76_acpi::kbd_backlight";
>         data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
>         data->kb_led.brightness_get = kb_led_get;
> -       data->kb_led.brightness_set = kb_led_set;
> +       data->kb_led.brightness_set_blocking = kb_led_set;
>         if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
>                 data->kb_led.max_brightness = 255;
>                 data->kb_toggle_brightness = 72;
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283663F7385
	for <lists+platform-driver-x86@lfdr.de>; Wed, 25 Aug 2021 12:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238358AbhHYKmT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 25 Aug 2021 06:42:19 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58330
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239059AbhHYKmR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 06:42:17 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0ED03406F6
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629888091;
        bh=Oxyb4/7dNbWqufhYGfyP8zbjEkPz5KhgsxW9V/GeIM0=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=l/VDtKqwCvvOPUojL3naxPPGvZhImFuFCtbUski6Ht8J7SJSFcbDfb3LhODKY0N6A
         DvBm4b5a3fqpLnWLS6hpnXi99RMDyTzLTKgPHJT+bQjLNfKsmJ6a2vrBkc6Mn+SKpN
         p21+HaNTobISaO5K51GbE/uCRaTcbeSWNvh4IKMUFteiGY2To9k5NNae5pZkc9Vubs
         n4XJm35pX5ZTfKTpWVF070y49Vbmd9UHdq79HfVvmCYSFfQi+qAlTdhhvZlzKB2gQH
         nlBbyrXLDdPILXK18Pr1fXspg25qCpwyUcPC2gIdyFIMrA/EhIB16m6Ko/m7CNrgjR
         kgKwCClAkweYQ==
Received: by mail-ed1-f72.google.com with SMTP id b8-20020a056402350800b003c5e3d4e2a7so1106527edd.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 03:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oxyb4/7dNbWqufhYGfyP8zbjEkPz5KhgsxW9V/GeIM0=;
        b=f2Gh920YCTd9OsRPhAI2bld7ySt/tZFlXsJ/aGN92aBK8/6euLWRClEyGybKjrWnFc
         DAc8/U5m6YE/SPmTRBa5nwXGLnY7KFL5Bx8IIUtmd0ibmt+jeLy/fLWR20tGJmj5VKOD
         RUi688k2dPzhyOGiDoDsEr+/wkKnPTLAF6JVQUzbpx41glkjlf0WE39FvpUOymzv8gU1
         XHE3BAf3b9Du4UATABef8K+dDoVHwtwnhmXg728f8k11CeWIW1k3hiBNg+ZcpLEkvJ4X
         Q6F7H6v3qIDGTBYE6AVGzA8K0Dn3LnVhZt7l8rU6rmYTugaQ9PYpjVLomdm+gVP322S8
         0Rdg==
X-Gm-Message-State: AOAM531ulXqH71Nr37SLDKVDtanDuSQJ6WYw6GFim+MQNxUDgVdPXzv/
        MbNqJO4Apo1fPGVmzcpjqYF4rqRPfVViIklby+apsuTxcQljVU4gfpBadhGmtla3mcY5ByACpiP
        tMMh5C29vjh8oeCPMs1CJD10agCE987dRRO4lkAU6bz2b4SA2COi3PvsN8DcQCS3xlBo=
X-Received: by 2002:a17:906:25d7:: with SMTP id n23mr23979078ejb.322.1629888090616;
        Wed, 25 Aug 2021 03:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjV71Nc3TjmUQOwgv8Kf5NYNz0fIFcee6b9iOgFtRlx1KdvFj6QNk1Sm8HjAA+L6TNmnak+23CyVPJyUN7saU=
X-Received: by 2002:a17:906:25d7:: with SMTP id n23mr23979050ejb.322.1629888090295;
 Wed, 25 Aug 2021 03:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210823093222.19544-1-andriy.shevchenko@linux.intel.com> <20210823093222.19544-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210823093222.19544-3-andriy.shevchenko@linux.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Wed, 25 Aug 2021 18:41:19 +0800
Message-ID: <CAAd53p6pQcura_tejtW7osiHfSnn6pCcxfm1e13==qmQA8C1bw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: hp_accel: Convert to be a platform driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 23, 2021 at 5:32 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> ACPI core in conjunction with platform driver core provides
> an infrastructure to enumerate ACPI devices. Use it in order
> to remove a lot of boilerplate code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The lis3lv02d still works with this patch.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

> ---
>  drivers/platform/x86/hp_accel.c | 64 ++++++++-------------------------
>  1 file changed, 14 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 54a4addc7903..cc53f725c041 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -28,9 +28,6 @@
>  #include <linux/serio.h>
>  #include "../../misc/lis3lv02d/lis3lv02d.h"
>
> -#define DRIVER_NAME     "hp_accel"
> -#define ACPI_MDPS_CLASS "accelerometer"
> -
>  /* Delayed LEDs infrastructure ------------------------------------ */
>
>  /* Special LED class that can defer work */
> @@ -269,30 +266,6 @@ static struct delayed_led_classdev hpled_led = {
>         .set_brightness = hpled_set,
>  };
>
> -static acpi_status
> -lis3lv02d_get_resource(struct acpi_resource *resource, void *context)
> -{
> -       if (resource->type == ACPI_RESOURCE_TYPE_EXTENDED_IRQ) {
> -               struct acpi_resource_extended_irq *irq;
> -               u32 *device_irq = context;
> -
> -               irq = &resource->data.extended_irq;
> -               *device_irq = irq->interrupts[0];
> -       }
> -
> -       return AE_OK;
> -}
> -
> -static void lis3lv02d_enum_resources(struct acpi_device *device)
> -{
> -       acpi_status status;
> -
> -       status = acpi_walk_resources(device->handle, METHOD_NAME__CRS,
> -                                       lis3lv02d_get_resource, &lis3_dev.irq);
> -       if (ACPI_FAILURE(status))
> -               printk(KERN_DEBUG DRIVER_NAME ": Error getting resources\n");
> -}
> -
>  static bool hp_accel_i8042_filter(unsigned char data, unsigned char str,
>                                   struct serio *port)
>  {
> @@ -322,23 +295,19 @@ static bool hp_accel_i8042_filter(unsigned char data, unsigned char str,
>         return false;
>  }
>
> -static int lis3lv02d_add(struct acpi_device *device)
> +static int lis3lv02d_probe(struct platform_device *device)
>  {
>         int ret;
>
> -       if (!device)
> -               return -EINVAL;
> -
> -       lis3_dev.bus_priv = device;
> +       lis3_dev.bus_priv = ACPI_COMPANION(&device->dev);
>         lis3_dev.init = lis3lv02d_acpi_init;
>         lis3_dev.read = lis3lv02d_acpi_read;
>         lis3_dev.write = lis3lv02d_acpi_write;
> -       strcpy(acpi_device_name(device), DRIVER_NAME);
> -       strcpy(acpi_device_class(device), ACPI_MDPS_CLASS);
> -       device->driver_data = &lis3_dev;
>
>         /* obtain IRQ number of our device from ACPI */
> -       lis3lv02d_enum_resources(device);
> +       ret = platform_get_irq_optional(device, 0);
> +       if (ret > 0)
> +               lis3_dev.irq = ret;
>
>         /* If possible use a "standard" axes order */
>         if (lis3_dev.ac.x && lis3_dev.ac.y && lis3_dev.ac.z) {
> @@ -371,11 +340,8 @@ static int lis3lv02d_add(struct acpi_device *device)
>         return ret;
>  }
>
> -static int lis3lv02d_remove(struct acpi_device *device)
> +static int lis3lv02d_remove(struct platform_device *device)
>  {
> -       if (!device)
> -               return -EINVAL;
> -
>         i8042_remove_filter(hp_accel_i8042_filter);
>         lis3lv02d_joystick_disable(&lis3_dev);
>         lis3lv02d_poweroff(&lis3_dev);
> @@ -386,7 +352,6 @@ static int lis3lv02d_remove(struct acpi_device *device)
>         return lis3lv02d_remove_fs(&lis3_dev);
>  }
>
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int lis3lv02d_suspend(struct device *dev)
>  {
> @@ -422,17 +387,16 @@ static const struct dev_pm_ops hp_accel_pm = {
>  #endif
>
>  /* For the HP MDPS aka 3D Driveguard */
> -static struct acpi_driver lis3lv02d_driver = {
> -       .name  = DRIVER_NAME,
> -       .class = ACPI_MDPS_CLASS,
> -       .ids   = lis3lv02d_device_ids,
> -       .ops = {
> -               .add     = lis3lv02d_add,
> -               .remove  = lis3lv02d_remove,
> +static struct platform_driver lis3lv02d_driver = {
> +       .probe  = lis3lv02d_probe,
> +       .remove = lis3lv02d_remove,
> +       .driver = {
> +               .name   = "hp_accel",
> +               .pm     = HP_ACCEL_PM,
> +               .acpi_match_table = lis3lv02d_device_ids,
>         },
> -       .drv.pm = HP_ACCEL_PM,
>  };
> -module_acpi_driver(lis3lv02d_driver);
> +module_platform_driver(lis3lv02d_driver);
>
>  MODULE_DESCRIPTION("Glue between LIS3LV02Dx and HP ACPI BIOS and support for disk protection LED.");
>  MODULE_AUTHOR("Yan Burman, Eric Piel, Pavel Machek");
> --
> 2.32.0
>

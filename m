Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCF21C9714
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 19:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgEGRFo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 13:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726367AbgEGRFn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 13:05:43 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E81C05BD43
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 10:05:43 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id x2so1492000ilp.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhMdI68GxmM2/TpI4f24ZbSehXjdI3UOoYDFkcvNus8=;
        b=nGZT+7woblZD8e8jFW2CJzEmOJ5BFpEdBvnaR5LRXjqJu2xRQTeUeJ5zXQPoQBv3OE
         2ZZ5s42uP53sUUlFc9l4BT/xibKJfb4X5aViZjInG9k7iYrAFrBKulzKotIIf7ZPNV82
         P/MreQjfGerW608Ii3/3QoUdE92RHrso8akpm6bR+AWbik7A5CU2Jdm9fIQrwwyniHOp
         AnbND53KOc/oGT/S1P/EIlHU6mgKzwRBUPdaKzDsWlf29lfMi9lXTnnuq9t2qVYlbl93
         QaUyZNdEujB6Jl6bdF+34vivxcPemyCnxwmOwQW8QMgkEpJG2xUVM/cFx4kzxs6Gz0Ya
         fvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhMdI68GxmM2/TpI4f24ZbSehXjdI3UOoYDFkcvNus8=;
        b=Sd2DsTOkMJT3GgWTE7smnkfHcsqJKT5icuQagDssDdfXixTOMiB/6dBPycpq3eCJ0b
         npYGKdIV+24S5nwes9QY1kGxF7HLwATMEl4nFJ2pVy69/8lOIj3D0AKXdwyFSa0H9sMq
         k6Y/42K7DyS9UYA40qDtX3KemToB4g7JRa80c97pQheVBsIz+CjVkhu9un1XP8UzbvHZ
         W/FRk54XaGQ+WXPb9uGsmFs21a2qZGpiDUhB775haZFMc5sdPgoeYySuZSJmj5Zl1uVV
         vZQUCQFVn22A8a9SUSTMeZkFunJeoJfBbcw1qsc1Qg8b2iU9xYbcslhaoNDTyaHDn0H/
         KEhg==
X-Gm-Message-State: AGi0PuaTiapjmzf6a6sJXgYqCJMizxBBkIvmlcph3YSiFCVn5keW5LMW
        xP/KgvB6vP/c42Yntu+tXP+/gfiRdPnkCba0fpRDRA==
X-Google-Smtp-Source: APiQypIEaxEPlu5s2U+5cAac/7UBCSdL/etDNK33LN2FlOhkvR23aOObctkvLIc2pQFBDrAA7Vpj4EHpHQ4Tnjy9jMg=
X-Received: by 2002:a92:ddca:: with SMTP id d10mr16285146ilr.166.1588871142871;
 Thu, 07 May 2020 10:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
In-Reply-To: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Thu, 7 May 2020 19:05:31 +0200
Message-ID: <CABxcv=kTL_grDUL00c_e2jyPD4hTtFS8Jze6pQBEz_arR6TPVA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
To:     Richard Hughes <hughsient@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Richard,

On Wed, May 6, 2020 at 5:52 PM Richard Hughes <hughsient@gmail.com> wrote:
>
> Export standard LPC configuration values from various LPC/eSPI
> controllers. This allows userspace components such as fwupd to
> verify the most basic SPI protections are set correctly.
> For instance, checking BIOSWE is disabled and BLE is enabled.
>
> More cutting-edge checks (e.g. PRx and BootGuard) can be added
> once the basics are in place. Exporting these values from the
> kernel allows us to report the security level of the platform
> without rebooting and running an unsigned EFI binary like
> chipsec.
>
> Signed-off-by: Richard Hughes <richard@hughsie.com>
> ---

The patch looks good to me, I just have some small comments.

> +config INTEL_SPI_LPC
> +       tristate "Intel SPI LPC configuration"
> +       depends on SECURITY

Maybe "depends on SECURITYFS" instead? I would also add ||
COMPILE_TEST to have more build coverage.

Another option is to not even add a dependency here since the
securityfs_*() functions are still defined if SECURITYFS isn't
enabled. They just return -ENODEV.

[snip]

> +       spi_dir = securityfs_create_dir("spi", NULL);
> +       if (IS_ERR(spi_dir))
> +               return -1;
> +
> +       spi_bioswe =
> +           securityfs_create_file("bioswe",
> +                                  0600, spi_dir, NULL,
> +                                  &spi_bioswe_ops);
> +       if (IS_ERR(spi_bioswe))
> +               goto out;
> +       spi_ble =
> +           securityfs_create_file("ble",
> +                                  0600, spi_dir, NULL,
> +                                  &spi_ble_ops);
> +       if (IS_ERR(spi_ble))
> +               goto out;
> +       spi_smm_bwp =
> +           securityfs_create_file("smm_bwp",
> +                                  0600, spi_dir, NULL,
> +                                  &spi_smm_bwp_ops);
> +       if (IS_ERR(spi_smm_bwp))
> +               goto out;
> +
> +       return 0;
> +out:
> +       securityfs_remove(spi_bioswe);
> +       securityfs_remove(spi_ble);
> +       securityfs_remove(spi_smm_bwp);

I don't think this is needed since if smm_bwp was successfully created
then it will never reach the error handling.

> +       securityfs_remove(spi_dir);

The convention is to remove these in the reverse order that were created, i.e:

securityfs_remove(spi_ble);
securityfs_remove(spi_bioswe);
securityfs_remove(spi_dir);

> +static void __exit mod_exit(void)
> +{
> +       securityfs_remove(spi_bioswe);
> +       securityfs_remove(spi_ble);
> +       securityfs_remove(spi_smm_bwp);
> +       securityfs_remove(spi_dir);
> +}
> +

Same here. It makes it easier if in the future other entries are added.

I wonder if these new entries should be documented in
Documentation/ABI/. Or maybe that's not a requirement for securityfs?

Best regards,
Javier

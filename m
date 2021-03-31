Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0712134E183
	for <lists+platform-driver-x86@lfdr.de>; Tue, 30 Mar 2021 08:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhC3Gtx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 30 Mar 2021 02:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhC3Gtq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Mar 2021 02:49:46 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E94C061764
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Mar 2021 23:49:46 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id w63so3330039vkf.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Mar 2021 23:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tf2KzUlyksDFUDRISHkB0sElt3B4+D1u0mtS+5lxeuA=;
        b=GjV6UMKOXOseT3Sqr7BuWmhe6oAE3wXsIuhOD1r28O4ehqpMfZsjPzj+pfMJerPAwJ
         Utw1oegCbKxUG9FHhXr3Uspq2CcUWlU2miMod9GIyh2ep1YtF3oXT4BcUIt82DiPkoKH
         0scxjMU6a/OkCtTMhZD4qHWxTTbipBQqwAPaZQTms5et6cTDwoMiJ9SLuHD5U8Fo+pNb
         7Did25h38asg5xPJMX4ArFyV1mwqTz4vbVIKCHYaeKuM+lyCa79ck97pLOv9eAtFsGCl
         AVvRqqb+23eAp2s1VkRMf0CPaEZ0MOPtRZt66QLBdsY4om+r7nyUoiYFwHLEatpRd8hb
         aotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tf2KzUlyksDFUDRISHkB0sElt3B4+D1u0mtS+5lxeuA=;
        b=aNSqnNnT7oKeIC8e2FBaNsCPZPmuE0uedgVSblxAlgT9Ycqbg8D1dTL/2+FZa0qmrA
         dSojazQtn67OEMpvLYW3Iv2XDDcALc0VfHq21aPVZvymWYXSBOmPd5Iel7B6xgu55Pm7
         26ojM57JjObx0e6KdVUgJhq1zH/D4Pa5cVIsihyPqagTgfAbpjEQbMBI5qsw7BX6yIiO
         PFyf1ZRyOmuz4TGWpknuRYosIAQr6ueGaAwJroiMI4HaZpv06pKFVyeG8JfXRThS1R4L
         eBgZNaQRGyvcvSuGk9A+ZiLDKwnn8DbbJ/B92lbKRbQ6YknSDf9H0tvgywWcAE/F/N4u
         89sQ==
X-Gm-Message-State: AOAM5320a+zoZWXzh3plOuWYd8YEjKMfEoHyNEye6RD5nlcKFyWtHWM/
        VQVqMezB0mlPTyUjEp1DS3yomV4jPy2KLSNrf83MoL3NcjHAIw==
X-Google-Smtp-Source: ABdhPJzCqUzElRvOlJEi5Dts0dowTDaJFhNXQpbCsA1NGWQiHbo38LeVxiLnqXS4SfAslDDedekqISDB49avU1orJwM=
X-Received: by 2002:a1f:18c9:: with SMTP id 192mr17037924vky.11.1617086985525;
 Mon, 29 Mar 2021 23:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210324125548.45983-1-aardelean@deviqon.com> <20210324125548.45983-2-aardelean@deviqon.com>
 <20210329153047.57904ab4@jic23-huawei>
In-Reply-To: <20210329153047.57904ab4@jic23-huawei>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Tue, 30 Mar 2021 09:49:34 +0300
Message-ID: <CAASAkob8J0KJwOb0ENgzYJSvnXazdNpvcrF8C77qxMfEFmA3vw@mail.gmail.com>
Subject: Re: [PATCH 01/10] platform/x86: toshiba_acpi: bind life-time of
 toshiba_acpi_dev to parent
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-iio@vger.kernel.org, coproscefalo@gmail.com,
        hdegoede@redhat.com, mgross@linux.intel.com, linux@deviqon.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 29 Mar 2021 at 17:30, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Wed, 24 Mar 2021 14:55:39 +0200
> Alexandru Ardelean <aardelean@deviqon.com> wrote:
>
> > The 'toshiba_acpi_dev' object is allocated first and free'd last. We can
> > bind it's life-time to the parent ACPI device object. This is a first step
> > in using more device-managed allocated functions for this.
> >
> > The main intent is to try to convert the IIO framework to export only
> > device-managed functions (i.e. devm_iio_device_alloc() and
> > devm_iio_device_register()). It's still not 100% sure that this is
> > possible, but for now, this is the process of taking it slowly in that
> > direction.
> >
> > Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
>
> Might just be me, but naming anything dev that isn't a struct device *
> is downright confusing?
>

I found it a bit odd as well, but I decided to not take it in
consideration for now.

>
>
>
> > ---
> >  drivers/platform/x86/toshiba_acpi.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> > index fa7232ad8c39..6d298810b7bf 100644
> > --- a/drivers/platform/x86/toshiba_acpi.c
> > +++ b/drivers/platform/x86/toshiba_acpi.c
> > @@ -2998,8 +2998,6 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
> >       if (toshiba_acpi)
> >               toshiba_acpi = NULL;
> >
> > -     kfree(dev);
> > -
> >       return 0;
> >  }
> >
> > @@ -3016,6 +3014,7 @@ static const char *find_hci_method(acpi_handle handle)
> >
> >  static int toshiba_acpi_add(struct acpi_device *acpi_dev)
> >  {
> > +     struct device *parent = &acpi_dev->dev;
> >       struct toshiba_acpi_dev *dev;
> >       const char *hci_method;
> >       u32 dummy;
> > @@ -3033,7 +3032,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
> >               return -ENODEV;
> >       }
> >
> > -     dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> > +     dev = devm_kzalloc(parent, sizeof(*dev), GFP_KERNEL);
> >       if (!dev)
> >               return -ENOMEM;
> >       dev->acpi_dev = acpi_dev;
> > @@ -3045,7 +3044,6 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
> >       ret = misc_register(&dev->miscdev);
> >       if (ret) {
> >               pr_err("Failed to register miscdevice\n");
> > -             kfree(dev);
> >               return ret;
> >       }
> >
>

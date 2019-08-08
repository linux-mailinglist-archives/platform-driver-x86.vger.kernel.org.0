Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6406485C8B
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Aug 2019 10:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731642AbfHHINQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Aug 2019 04:13:16 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45675 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731781AbfHHINQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Aug 2019 04:13:16 -0400
Received: by mail-qt1-f196.google.com with SMTP id x22so17841317qtp.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Aug 2019 01:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=scFVLcR0B4hxfv/JyJSOB8HpFX6JF5BWL1PgDZOr8Ug=;
        b=i/iuYUAPmbwM92QItL6grRGUsJPYwe2np4PxCYEqwp8GDY2TMchCHosa8DSC860mGJ
         d5MysWY4HHgz6Ndrm+TGOx2qMvg/XWEwOojDqmrsDxNmEH7IjASIGS7f5cQpN25Eg1ML
         Gsg1EVB5E3dh6J4apEs9uM2M6cDSdd6jDRj2o8LSlj78eO5zPDoEj4VEDX0vBBSmYses
         qqb0yStGMqUqFp9GMhMrWo3OtB6g09AtdMbm1bAdm9P6UNI83znpjI9a0zfWWx++E02u
         8jziImzMxUGSywrzlHvjCcKryWlv4ei8I2ELwVy7GUpmx17/AVfxbOV2KmECavRd4Syz
         zuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=scFVLcR0B4hxfv/JyJSOB8HpFX6JF5BWL1PgDZOr8Ug=;
        b=ga5kzWhnwNUzx8LdG6jbYtXFnrhpFa0CQDP/b92lBnhSWCPVDcpFdN9Pz57Mz9VBqZ
         QmLuAuba3q/L0+H1lnpUjUSZ4tp7ZNAbNIMxYjKXGvtxrkBeosTseCmCXhr+1OJpcUM3
         qoahdxt+ttxXruBz23734sOruux/70RYiXs7AjWf+IOQuTnJp6RtrSEZSEKJ3mH7xuWJ
         O2IEmqkWpdsmphDRE4okSv1xrWykwRf9uTUhtGGSdRNZsIiWR7jEQOobyKs01tQh3L85
         QGP1PtuuFREx7rA3edVeOc3O5perbf+PIBBINFicIzrzqn7SHcIopZWf5qlI8NaQH7cT
         w5zQ==
X-Gm-Message-State: APjAAAUmu/6bJOYooZc8OO50AHsgx6aUNRpkhLgekQFbGgQ8EbeKOmfO
        030ifMKSjV+0mz9dnWawBTMpCDx/B2kQjwVfJAPZLw==
X-Google-Smtp-Source: APXvYqyZsoVNn/4wjZydjtb0qDg/6IrSd2Sm+yAB8Lb6atKjEd8saqbmBIcspch6zjBlpq6rjFez2nGQA0owUs1uFKg=
X-Received: by 2002:ac8:4687:: with SMTP id g7mr4620780qto.213.1565251995208;
 Thu, 08 Aug 2019 01:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190805192305.9692-1-kristian@klausen.dk>
In-Reply-To: <20190805192305.9692-1-kristian@klausen.dk>
From:   Daniel Drake <drake@endlessm.com>
Date:   Thu, 8 Aug 2019 16:13:04 +0800
Message-ID: <CAD8Lp44GEJTgxf+S6v8gZu0kABQodhGNuTz=TA-xwzuzkPWHwA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Add support for charge threshold
To:     Kristian Klausen <kristian@klausen.dk>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 6, 2019 at 3:23 AM Kristian Klausen <kristian@klausen.dk> wrote:
>
> Most newer ASUS laptops supports limiting the battery charge level, which
> help prolonging the battery life.
>
> Tested on a Zenbook UX430UNR.
>
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
> I'm not sure what to call it, is charge threshold good enough or do you
> have any better ideas?

The spec calls it "Maximum Charging Percentage". I think something
along those lines would be clearer.

It would be good to have a one line explanatory comment against where
you introduce the variable, so that it's clear from glancing at the
code (not just the commit message) what this functionality actually
is.

Also you need a Documentation/ entry for this new file where you can
describe it a little more verbosely.

The 0x00120057 device is officially called "Relative state of charge",
not sure if you want to somehow follow a similar naming scheme there,
I don't have a real preference.

>  /* Misc */
>  #define ASUS_WMI_DEVID_CAMERA          0x00060013
> +#define ASUS_WMI_CHARGE_THRESHOLD      0x00120057

Please keep the devices ordered numerically by their ID

Thanks
Daniel

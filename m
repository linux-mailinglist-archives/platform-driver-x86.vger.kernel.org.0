Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D971140D9
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Dec 2019 13:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbfLEMdD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Dec 2019 07:33:03 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46465 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbfLEMdD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Dec 2019 07:33:03 -0500
Received: by mail-pl1-f194.google.com with SMTP id k20so1190926pll.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2019 04:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mvIaX04c0v5eNf5tR2mJwHo1kMisCIrdVmQruzy/tMU=;
        b=F4zdK8TgfkjWOj6vd29J6t6IjlTZkSD27O/eqTRYWuJDqwigKGILGcrpDp6tqvjhzn
         Kb6e1pbTZiRsRQtMDLwnVKRddj06bV+S3xFs5AtYgVVlVGL7ui9jNzJoDVMlbqRFJcxZ
         O8PPaXi/y36usHKt2qyhc857qkuvhgIvzch5U+LkqcQ16oyQF5CbyKm2cs6qhRrfMCn8
         /ooNUYPxi39+mptlc6Bhj/iOleGzbTGIyMVm/hgrpBqnVJT1+Q+BkBJV3vwsNIPBFAJs
         OySunF9iHiEoCyaDgDbS3L+sb4A6G5Th+jEVfVAfSYd9dguBMbEg/QuyX6PLK/kI5YZM
         7Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mvIaX04c0v5eNf5tR2mJwHo1kMisCIrdVmQruzy/tMU=;
        b=f5FiikJhVwz87/UsiETSJBBpmkYxE2U11XeOvIQNLNGj1I5z3xihrcJatFncHocG57
         VUyJAme9Ulr7+IfPMywttGcorbLHKn8oFv1qXfEDDDVtboDQotZKLhxZ2QQwNrmXDC58
         QiUBNHIeYH4tpWewzuuMcDOecRO6bP5EABGzr/aHyUTMWnmKAR63ClHOr+ekNChJba9j
         5jXG57V7pGwS6MDS+WvHzSkgws0KQmJJMf8AldZDxmnPe5SKbYHpjz7k2YEUuB9Fxr7U
         93DGrkZ8op8fAzzfHcR4XLjne0xif2jLEOaQE9GdH0MzbyAN/KCftsTK0nRkSv21xmFb
         +Ckw==
X-Gm-Message-State: APjAAAXi4uEvehGZgIX0vjgim/FgDqpwBjJ4Blyk987kLk1Fjh3YBhif
        FyNfyMSAUQozBjMrf0OYadXsDG9wpHCURuVBB/fVNx2D
X-Google-Smtp-Source: APXvYqw0B7o8F6kqSN2q1M6tTE+px4VGGzoH/ydKr3nKxBbB8Iw5hdPFs3qpKjw87EBke3B2ISIlc/oKGnrDu+x0cKc=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr9291673pjq.132.1575549182410;
 Thu, 05 Dec 2019 04:33:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575103866.git.matan@svgalib.org> <61c52c2146085859728f496388d886581b877c41.1575103866.git.matan@svgalib.org>
 <b65e75e2-1036-8a4e-f72b-a70c3a390e83@metux.net>
In-Reply-To: <b65e75e2-1036-8a4e-f72b-a70c3a390e83@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 14:32:52 +0200
Message-ID: <CAHp75VdoiFyg+n0e42i3zJigX_=EwmH-qZxXf8pQTS49P0k2MA@mail.gmail.com>
Subject: Re: [PATCH V2 1/7] platform/x86: lg-laptop.c: Add module version and
 fix whitespace
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Dec 4, 2019 at 12:46 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 30.11.19 09:40, Matan Ziv-Av wrote:
> > Add module version and fix a small whitespace discrepancy.
> >
> > Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
> > ---
> >  drivers/platform/x86/lg-laptop.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> > index c0bb1f864dfe..78d3e3d2e51a 100644
> > --- a/drivers/platform/x86/lg-laptop.c
> > +++ b/drivers/platform/x86/lg-laptop.c
> > @@ -26,6 +26,7 @@
> >  MODULE_AUTHOR("Matan Ziv-Av");
> >  MODULE_DESCRIPTION("LG WMI Hotkey Driver");
> >  MODULE_LICENSE("GPL");
> > +MODULE_VERSION("1.1");
>
> Does MODULE_VERSION() really make sense ?
> What's the exact semantics behind those version numbers (in relation to
> kernel version) - when do they get increased ?

It makes no sense. The module version is equal to the kernel version
(SHA ID in custom cases).

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A181C56CD
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 15:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgEEN00 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 09:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbgEEN0Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 09:26:25 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BA3C061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 06:26:25 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l12so1010468pgr.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dgdt4pjsGC1uHIuhuEhWe8wGIqpGBeX0Wr1PKcCfJhA=;
        b=HSh3tgB9fKy4EeEyv7vC9CH/RujbnWwtAE1NXsw7NXsA/IJ3L2gmLQd9fbDxH2G6pY
         sdNtJuiEPlSmsoiGv2EdkOfP4hmT9RspUojHfS4g+En+Ifgqyh7y02sHalzeCrUQcEio
         bZ1J2OSv6JvnLl5NOGDoOjmXr0dXulFe/yivKf0rToZGA2jcaLSnmv/HyuxTKq0r61mc
         FyNY4n/6IMcEmNS3ug4IFrx7X9zC6unmQZlc8j/9fWkd2TYT/lZqNWUsPN0bij8ZBwyH
         Dli4QApJbyiJsAoYwE5yXotc62l694EG+iDppCCS5EzPbA1ndo1k+RigDhPjORizj/pI
         YZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dgdt4pjsGC1uHIuhuEhWe8wGIqpGBeX0Wr1PKcCfJhA=;
        b=siHlifg6NdqJXydRIgECnHVePqgZhlqq69jTPF9sVNoZw8StETHEK180FVFm4TkKtN
         ZWEieozYXiQoF01ptRN6CmfV3l/QZTsuv6FjUMpVRCPDJXA48j2TWRWpNh2B/GLxMp98
         gzZT5brZ9F4OjLk2wZM8fb41LyO71Q8x35VoArMCfr3xHLw8EGrGHCywZMHVfgzPYIh0
         ss3PC/V0HgBzFXGP2qFsdrgvNqdvN86RQJEHeDlPYTu2LWzcZgkMwV0LPXAIw+/K4+mW
         OjeX/u0s0NNzQvIq/34LvgRQeR/YnxslXeEBDdeFT/6MWeCfKfW2xNuPaU2okY2ek6gp
         zbTg==
X-Gm-Message-State: AGi0Pua85mQNXe+GY9pMcBMS387zMWNRDa616LAcXARbQEBD/OQYs1Ie
        9+s69Uo7YDwdGbRNBs4Th52VSdguZpYYWLEZOWnkG81M
X-Google-Smtp-Source: APiQypIEMubheihWxfEN4ZLk74E+NW3G7zxbE4s8e7115oAAgW+QMvaD8hDkpK2ABWp/POSM30W0rT9/wow4p0vznWM=
X-Received: by 2002:a65:6251:: with SMTP id q17mr2872156pgv.4.1588685184572;
 Tue, 05 May 2020 06:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200505111810.65586-1-malattia@linux.it> <20200505111810.65586-3-malattia@linux.it>
 <CAHp75VdCsscavP5sGrMjk5dWFZDYjevW94_RNRw50nAaM3jQpA@mail.gmail.com> <20200505141948.GA119615@taihen.jp>
In-Reply-To: <20200505141948.GA119615@taihen.jp>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 16:26:18 +0300
Message-ID: <CAHp75VdGemLeyujDZZ+fPZn-0hhTVcQjNkjU0MNEGJ+WS+ouSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] [sony-laptop] Don't use thermal handle if NULL
To:     Mattia Dongili <malattia@linux.it>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 5, 2020 at 4:17 PM Mattia Dongili <malattia@linux.it> wrote:
> On Tue, May 05, 2020 at 03:38:15PM +0300, Andy Shevchenko wrote:
> > On Tue, May 5, 2020 at 1:16 PM <malattia@linux.it> wrote:
> > >
> > > From: Mattia Dongili <malattia@linux.it>
> > >
> > > The thermal handle object may fail initialization when the module is
> > > loaded the first time.
> > >
> >
> > But isn't it a papering over the real issue that it fails first time?
> > AFAIU user needs to try first time and if it fails to try again. Can
> > we rather understand the root cause first?
>
> I think this is a bug regardless of what ACPICA does.

I didn't speak about ACPICA.

> If the driver fails completing whatever initialization, should it not
> avoid dereferencing a NULL pointer on resume?

Yes, but *why* it fails?

-- 
With Best Regards,
Andy Shevchenko

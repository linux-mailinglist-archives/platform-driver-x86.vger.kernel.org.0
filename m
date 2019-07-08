Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898946210C
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jul 2019 17:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730384AbfGHPCS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Jul 2019 11:02:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41456 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730281AbfGHPCR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Jul 2019 11:02:17 -0400
Received: by mail-pg1-f195.google.com with SMTP id q4so7836560pgj.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jul 2019 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TCkyfj5zkIAGRYzotBWrTg13lrS3rw2HrWrCo9hIKwM=;
        b=EU+hC9r0fQ0ChhRMEAJOnSn6OsM1zdpn7T3RFMecLIrOjltkHzNzSxsInYEGeRinQu
         P66mwWEkHj8759jf2/EJj367Ba95MTeo5XStpCe8EeQhFyd8ipm05Tn1qiwrimXc2HNd
         orv5/yWe914seZxf0jyBc7O4yDT2jfNr6rxsWnbfUO5Qtl9rWho89Fvu23g97YQIkP+B
         g1ym6XDaBpCJZc+n6yYTc0L1D+SUePozqtw9+6fr7wdMO+6Zp1maO2gwubxL2D0v0NQk
         f3j2ZIBIlCU6TS98scTtIRUxF5rqXhbE4uWenmt2jULYU4yhfg0nwvnI210R7w2eRY/n
         i3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TCkyfj5zkIAGRYzotBWrTg13lrS3rw2HrWrCo9hIKwM=;
        b=oqA5Ukz56KjlcpIjdS68Z82UvKwgSdLTANJOgTbAp9/z1epD5iVcCazFdksf5qSgU/
         /guAQRXGUfWdjJyhvrmyyJEYkOWRCuKpXIkv+F5Nl7VMF+Kyz9K9ikjBByyIOrXejgbl
         dbL82UYfn8aV3Z2qHxCFq8mQBSpMPE5Pxe4Ysff6hiLPD0D/dFowO/k48muZTuYKyrqV
         LqxxL3ggkS1EWZk4aUhrvxYJX5tKy/VBIPTGpLj1/Egyui28CamEt7TuXlYIzyhOYkc+
         JQJFscCfD5izih62tmzeD3VGGRs/lY26vLPd1jFSEqL7CIuq/4egRXw59Cm0clpO2VWJ
         v2mg==
X-Gm-Message-State: APjAAAWK+xOG09/2T/l3vmDJeRLIifNMVhMQR2n1xqSxoTu8npz4fIKK
        jYyxkx1nkxNH0UwLteayUAl+zUc/097A6TVUo6jvIMY43wI=
X-Google-Smtp-Source: APXvYqwPDp61iYfvbzG+tWLAba3guCu2Z9bz1u35h8ROeBXSpBVmtn3PQRTDIwAlFkmKfJkR4gVzuescasLUq+I2egA=
X-Received: by 2002:a63:f346:: with SMTP id t6mr25141472pgj.203.1562598137194;
 Mon, 08 Jul 2019 08:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190707113016.GA30635@arch> <CAHp75VfceRDnuRtdD_mR6mMZF_LH7u1ptPRXiA=DUfgTGebCPA@mail.gmail.com>
 <20190708085735.GA12241@arch>
In-Reply-To: <20190708085735.GA12241@arch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Jul 2019 18:02:05 +0300
Message-ID: <CAHp75VeDNeH1VzOvB3H5nrgint32BY9cGCNdE_pZZYT861ZrCQ@mail.gmail.com>
Subject: Re: [PATCH] cs5535: use BIT() macro for defining bit-flags
To:     Amol Surati <suratiamol@gmail.com>
Cc:     dilinger@queued.net, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-geode@lists.infradead.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 8, 2019 at 11:57 AM Amol Surati <suratiamol@gmail.com> wrote:
>
> On Mon, Jul 08, 2019 at 11:02:29AM +0300, Andy Shevchenko wrote:
> > On Sun, Jul 7, 2019 at 2:30 PM Amol Surati <suratiamol@gmail.com> wrote:
> > >
> > > The BIT() macro is available for defining the required bit-flags.
> >
> > Shouldn't bits.h be added?
> >
> > > Since it operates on an unsigned value and expands to an unsigned result,
> > > using it, instead of an expression like (1 << x), also fixes the problem
> > > of shifting a signed 32-bit value by 31 bits. (e.g. 1 << 31. See
> > > CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN).
> >
> > What problem?
> > You need to describe that (UB by the standard, though gcc works fine,
> > I never heard it utilizes such).
>
> Yes. I will send a new version. I also missed including
> <linux/bitops.h>, although the compilation with the default
> configuration of my distro still succeeds without it, by chance.
>
It's now in a separate bits.h. No need to include complete bitops.h.

> Thank you,
> -amol
>
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko

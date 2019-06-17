Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F3648284
	for <lists+platform-driver-x86@lfdr.de>; Mon, 17 Jun 2019 14:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfFQMdF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 17 Jun 2019 08:33:05 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44683 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfFQMdE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jun 2019 08:33:04 -0400
Received: by mail-pf1-f195.google.com with SMTP id t16so5608784pfe.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jun 2019 05:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BCRx9dqYov3qrXZBt8YHbkYEfGZRxQaFHHzck/GP3R4=;
        b=XQ+HqIz1l3G6SaMoMEwhTnmOCZM1qmZu4EHmZ1keXMoqn0p/lXdk0Mn3JABi6T3kAv
         1YRblgZlkWnj+SS+xZbY2c7zkOL79qoJ4EsvgibjcgmsnLZPZzOouNExK8Ut4C0h0+lP
         wqI9NX+ZPDnsfRGrOdflbzTWzeYX7B0FP/CKUjJvrgwrgNoRX42ZfUWUEcvpu65EOH/a
         X8ANsdIBoBNAxI+tAeQvG38G7P+0CTOK0rQStfry5CHaw91ObV8Zzq2dNKDhK2gOA9Ha
         QXUbZafaWY5XkE6HiuZ0CLLCQhu/le4INF3gkfO/Hj+L0eqPw0Kpgwo5y/RjsCqJWJpy
         J7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCRx9dqYov3qrXZBt8YHbkYEfGZRxQaFHHzck/GP3R4=;
        b=OYyx49WHQG8RtN7NVgJ1PW8cPxITGhLtab/ccA3X6sX6OFf+kSWyAVOoit36jwqwHH
         CvuaPBGcSG9QNB4iNfJ0emeuOk8dshpwYrA/mZRuC47lvzrrgDwYcmGRHthmomF1a78x
         IDozOgMg02e6KQeqXb+sS1RjcwuRXLuOsqYlw59X5RmTCp7wJ37yAdWm6sN0bJw70JL8
         RKvTagtyspqKTi23IZkDNuRNesiFsZG+W71WPukz2IJf9IO6GL92AdO7pwmdkTue9+bj
         lEfaXWEwUuIordag+d8trLV8ffJ+5NeGq55XZQrEK8GAyXzrdMg3ETwWPHCoQzocTi6f
         CX5g==
X-Gm-Message-State: APjAAAWXjAGfwIKsSUydIE61dkrJLWsr8FmazGGP2fGJOMVl21R3EmxT
        trc5ZgtiHiLM7hEt9d0eronDSwFIXvwaL+4jY1k=
X-Google-Smtp-Source: APXvYqw9J4NQJMUo8o+w9lP7kmytHrngG7ssmEuXRW7qeoIpYwFEM0wmqi8fcbTlfgY162WVBMhWFFdE0UYqGYA6BxM=
X-Received: by 2002:a62:16:: with SMTP id 22mr16624479pfa.151.1560774784111;
 Mon, 17 Jun 2019 05:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190603111446.5395-1-csindle@gmail.com> <CAB6-Ya3z1mZKa8LrJw30a7XV+wk51gy8nrd+AacCxrkc4aWXgA@mail.gmail.com>
 <CAHp75VderY4NJ=9wD=Q0ad3eHidcaw-N5tzJuzrMX9h+roiNRw@mail.gmail.com> <CAB6-Ya2VOj8A-EnxbN7fD0jK2z4XoLG0wNZ9wt0kHVE-OGNtxg@mail.gmail.com>
In-Reply-To: <CAB6-Ya2VOj8A-EnxbN7fD0jK2z4XoLG0wNZ9wt0kHVE-OGNtxg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 Jun 2019 15:32:53 +0300
Message-ID: <CAHp75VfRcSZXV9q_=upKtJ7haJayX4xakvsX5HCs6TQgAAaK9Q@mail.gmail.com>
Subject: Re: [PATCH] hp_accel: Add support for HP ProBook 450 G0.
To:     Colin Sindle <csindle@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 12, 2019 at 6:03 PM Colin Sindle <csindle@gmail.com> wrote:
>
> On Tue, 11 Jun 2019 at 18:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > Please, don't ping, especially privately.
> > This patch is in the queue of patchwork, so, it will be handled in the
> > future when I have dedicate time slot for it.
>
>
> I sincerely apologize.

No problem, and your patch is accepted.

-- 
With Best Regards,
Andy Shevchenko

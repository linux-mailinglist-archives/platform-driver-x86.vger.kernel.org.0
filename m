Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95F3341F7B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jun 2019 10:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731233AbfFLInQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Jun 2019 04:43:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38384 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731578AbfFLInP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jun 2019 04:43:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id a186so9235717pfa.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jun 2019 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxmVOY6xbcB4tQf+7Zy3JextLvZoLgOKaFo4BH81vdY=;
        b=LO9CpBp+rkrP9ifX++ttZFcDiikmUQ/GxWNN+QW/SDh2tkwpW37Vp7gi7UK/aS4bS5
         cUZx69nhCDtr9vNQXuKRR1CehupyRJZOJ+PXin2wOPkDhrc9St7OXc1Fq1cbaaMGrenW
         bQxwdYVGnPQE6wG4rR5pDGxjrYQBguMIQiTYofen7hiX591EwPaEN7L4By4wkSNiEsSl
         GxGHHTKCiWVSE1nNfrLjnPcLmD9GRdvPuSaQojmYkbe31cnad8yW673qroDWmPi057Xh
         7X0ipxElXNXWNTjWf95BYIam0a2fbJ4TpcsQIIfO2rf0aFWjYOGwZiJ7+dNyFods1uXW
         xtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxmVOY6xbcB4tQf+7Zy3JextLvZoLgOKaFo4BH81vdY=;
        b=RjLtE0oEsLfnbuOOiGBlwEoBqazRxOhWK0nltwVew8mUWzFR+3w+KBfvLQJnJNYEX+
         nVyuYOH6FkzXeDU4Ve74Bq3kCi7uwEvl9rE/tpnDeutHHtwk9HRkT/IsgTqvd6GUq5hz
         LFOoCPqRYd8h7KUluzxZ52b1O4qeZxHOywwREmAk8RIv3EQmTzFNNiGbjDF382SS/R3r
         2F0VW3U93F1k+/bLtyDgKeFgNwBCYNsuC8eOqBon+am8TDC5xYpTEkdzazQ4H7xv+Jqt
         OAWXUG5auRF8H/LKoI3DKtHVcmdlJCTeRR2iHT59R58Wp9n9STq8iB7W40fpg2EAiD/r
         DArA==
X-Gm-Message-State: APjAAAWX1Fxd23kP0awtQK7v4Tf7Be7M1fMl2hswdd2OtPKVhUZjeXXD
        flyUMuo7wlXEIkIZugv57yk8TLXphCnuPL7dT8H24f0m
X-Google-Smtp-Source: APXvYqx+qLl5BqKEmopTgKobM8vVcrg+jk9SDTbXtFzQkkMfukcW4D+2on4ANSfG09TYFByNWam2vwu9HokYqwVRAj4=
X-Received: by 2002:a63:f346:: with SMTP id t6mr17615148pgj.203.1560328994926;
 Wed, 12 Jun 2019 01:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190611103330.21306-1-jarkko.nikula@linux.intel.com>
 <CAHp75VdaafccAkuOnkh2M3LaOKT56FbMfRo1HWKnqcvm8W4Vcg@mail.gmail.com> <1363fbdd-30a8-240c-b242-b6018998979a@linux.intel.com>
In-Reply-To: <1363fbdd-30a8-240c-b242-b6018998979a@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 12 Jun 2019 11:43:04 +0300
Message-ID: <CAHp75VdJb6mrCoJw-Xe7DRok6Ro-=h8mH3Aiknu1Y7XN_RE=Gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/platform/intel-mid: Create pinctrl platform
 device at later initcall
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 12, 2019 at 11:21 AM Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
> On 6/11/19 3:58 PM, Andy Shevchenko wrote:
> >> Andy: I'm not sure is this with the next patch the right fix or would it be
> >> possible to just delete this "pinctrl-merrifield" initialization filei? I
> >> went to this path since I don't know are there platforms without
> >> "INTC1002" in their ACPI tables or do some users want to run non-ACPI
> >> kernels.
> >
> > I have locally one hack with another approach, i.e. check for SFI
> > availability like the rest of the files in this folder works, with few
> > exceptions as this one.
> >
> > So, something like
> >
> > if (sfi_disabled)
> >    return -EINVAL.
> >
> > If you have time, you can split and submit the
> > https://github.com/andy-shev/linux/commit/7a0cb10387a437f5811435b9c790043c64816d08
> >
> Seems to accomplish the same.

Yes.

> Are you planning to send it out

At some point. There is more important things to push first (make USB
OTG work on vanilla).
That's why I asked if you have time. The mentioned change should be
simple split and commit message massaged.

> and do you
> think are my patches needed after it? If you think they are needed I can
> rebase my patches on top of yours and resend.

I don't think they will be needed.

-- 
With Best Regards,
Andy Shevchenko

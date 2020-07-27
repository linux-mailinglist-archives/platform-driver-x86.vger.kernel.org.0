Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E60322EA30
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 12:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgG0KlT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 06:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgG0KlS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 06:41:18 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1C7C061794
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 03:41:18 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 72so7800407ple.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8h2XTFX6e5P+mWCky6dvv6lwENk0wwZUh4a847wcsyA=;
        b=d8hRRaX1nuwydilMuGv9PxYqAs4XMtUUe7f4Kav/U+2vcEdf0riMFILn8cXwYfzlNe
         F1s/BeCl7sMMtiaxOm0yL8Dg8Sum60GyvqAlLB/SN5Z01HMxl6Gtj4QGu5V48PLhalQk
         ix/w4C7If4/i8uWSzw+SJPyTHM/cVZgiiZjfYCkhPFpYKzOFA0AqneYp3gdu3xOC48QH
         k9ejuYQ5HVbCX4Fntu1dVK5ycX3DZ+xUO6GvyILotSlu0EG/AU6CcRv+QlmEs3/YeukL
         XhsnEeyHABP1r/YC4uOhCPX9T/SpkHNz5r9AZJLff7EWIsQieunVuUDTcc7TyNhhu5gR
         vIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8h2XTFX6e5P+mWCky6dvv6lwENk0wwZUh4a847wcsyA=;
        b=j/9XmX/gMrUZXL32BfskfLdnANg+bnm46Ez8brSkFy7nWGEMUl43d8gec2bUtBmCUk
         ElxOzJsg5/k79gTtYdC1zoxN5TLokX4fgVUdfcojOgwJOtcfcZ6A453i3wjuz75MZQ7I
         qpfwMJP0ISyajFzQZN1Fmh3D+eBdrBElhvnOEDNS1T5npH/0/EuwUQh4UrBs0/fBnG6d
         g4ULv3rDQwIDKvNNad8rOU4uf1SvhxJRV9dfM/uhXvJy5fDEbKBTqSf68x4dJlGOaavl
         tgK1j49bmZaykizrKNiERm0s9WyqJj4rc07K2U1hMXcpNLMt8PPuijcgV3j7H8wyIbe0
         rAvQ==
X-Gm-Message-State: AOAM533cQOnPE4LP2yb/qYtaNTVdamTX7WCfoJc9ZlbaiuxY6/wZVJpG
        9lK6y4mlqclMZeNXn5yMK/qfNk/QTRUSxFF4ugsBucWL2fE=
X-Google-Smtp-Source: ABdhPJzSxNI3ndBSo1O9efAgHF4F+xfX6rFmcCO5yMwbONjMaTOARYUjoaX/vDkAiBExqjhztoIjpo1DN5DKqvmsllw=
X-Received: by 2002:a17:90a:498b:: with SMTP id d11mr18970600pjh.129.1595846478321;
 Mon, 27 Jul 2020 03:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com>
 <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com>
 <CY28tpMZZdjz8B1hhBfutTgVSOQ_3WTvF2sXScGvbYxBsQI3ozKDDIzW6WFYoXoYljn0rXMqmjibx_8r_Zc4gzuZYqUVpfeHDHnmTQ6GeMA=@protonmail.com>
 <CAHp75VeZ4hEeHUe3E_UnYPLBCqF-PJwBVK3+2CG2J9qSJ4S0Ug@mail.gmail.com> <2FArDtricC8jlFcoJHfc05TW-HOn4s1wbI9nphTyia2_cUtV2bs3Qw0nC_DfM16GzZu6ulgKQdiNC1l_XEVa5q6PawEcxLWJWBX8aUkMwy0=@protonmail.com>
In-Reply-To: <2FArDtricC8jlFcoJHfc05TW-HOn4s1wbI9nphTyia2_cUtV2bs3Qw0nC_DfM16GzZu6ulgKQdiNC1l_XEVa5q6PawEcxLWJWBX8aUkMwy0=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 13:41:03 +0300
Message-ID: <CAHp75VdKC_s05wK5Km1taYz4bnmbvaXN7RQx1Pb=ZLpVDxs7oA@mail.gmail.com>
Subject: Re: platform/x86: status of thinkpad_acpi patch from January
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jul 26, 2020 at 10:31 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> 2020. j=C3=BAlius 26., vas=C3=A1rnap 20:46 keltez=C3=A9ssel, Andy Shevche=
nko =C3=ADrta:
> > On Sun, Jul 26, 2020 at 7:39 PM Barnab=C3=A1s P=C5=91cze wrote:

...

> > Either way documentation should be present in the ThinkPad one.
> >
>
> I am quite new to Linux kernel development, and I don't exactly understan=
d which piece of documentation you refer to. The only file under Documentat=
ion/ that contains "thinkpad" in its name is admin-guide/laptops/thinkpad-a=
cpi.rst, which makes no mention of battery charge limits. So it should be m=
entioned there? Or it should be documented in the driver itself that those =
two are obsolete, etc.? Or both?

This one: admin-guide/laptops/thinkpad-acpi.rst

> > > Possibly a warning could be emitted when software uses the old attrib=
utes? Or what do you recommend?
> >
> > No warning, just provide documentation.
> >
> > I'm fine if you (it seems the author is not you for that series?)
> > append a follow up patch with this.

> That is correct. I am not the author.

JFYI, I applied that series to my review and testing queue in a *hope*
that documentation will follow soon (from anybody, I don't care who).
It does not mean I'll propagate this w/o documentation to upstream.

--=20
With Best Regards,
Andy Shevchenko

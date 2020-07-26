Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C415322E242
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Jul 2020 21:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgGZTbq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 15:31:46 -0400
Received: from mail-40141.protonmail.ch ([185.70.40.141]:60074 "EHLO
        mail-40141.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgGZTbq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 15:31:46 -0400
Date:   Sun, 26 Jul 2020 19:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595791903;
        bh=63GmR1S8OW8TR/B7rUdICBXYjBhN0t8SFlInwd1c6T0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=OTiNiDsBwhAFqW0RwmX4H4wnKHvJm97e6TeEPoZ3QGJmfhHY3/FSbz+iN/aUhbr24
         vg5pIajTu7OB2C7kmMuRCHE5zvVCDNnYvbVKqTMB4c7HYhlAsOaekBiaLudjY54EKT
         Dl55ZrHsNUfSH+oD2Q0veos4K6WWsXqC9u3ob0QY=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: platform/x86: status of thinkpad_acpi patch from January
Message-ID: <2FArDtricC8jlFcoJHfc05TW-HOn4s1wbI9nphTyia2_cUtV2bs3Qw0nC_DfM16GzZu6ulgKQdiNC1l_XEVa5q6PawEcxLWJWBX8aUkMwy0=@protonmail.com>
In-Reply-To: <CAHp75VeZ4hEeHUe3E_UnYPLBCqF-PJwBVK3+2CG2J9qSJ4S0Ug@mail.gmail.com>
References: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com> <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com> <CY28tpMZZdjz8B1hhBfutTgVSOQ_3WTvF2sXScGvbYxBsQI3ozKDDIzW6WFYoXoYljn0rXMqmjibx_8r_Zc4gzuZYqUVpfeHDHnmTQ6GeMA=@protonmail.com> <CAHp75VeZ4hEeHUe3E_UnYPLBCqF-PJwBVK3+2CG2J9qSJ4S0Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2020. j=C3=BAlius 26., vas=C3=A1rnap 20:46 keltez=C3=A9ssel, Andy Shevchenk=
o =C3=ADrta:
> On Sun, Jul 26, 2020 at 7:39 PM Barnab=C3=A1s P=C5=91cze wrote:
>
> > 2020.  j=C3=BAlius 26., vas=C3=A1rnap 18:20 keltez=C3=A9ssel, Andy Shev=
chenko =C3=ADrta:
> >
> > > On Sun, Jul 26, 2020 at 6:45 PM Barnab=C3=A1s P=C5=91cze wrote:
>
> ...
>
> > > > A patch series1 has been submitted to the platform-driver-x86 list =
before I subscribed to that list, so I cannot react to it in the form of a =
reply,
> > >
> > > JFYI: patchwork allows you to download messages in mbox format which
> > > most of MUA allows to use and reply to.
> >
> > I have never heard of that, but I will try to keep it in mind. Thank yo=
u.
>
> You are welcome! It's usual practice how you can get a proper reply.
> Also another possibility is to get somewhere the Message-Id header.
> Most (good) MUAs allow inserting In-Reply-To (IIRC its name) header
> with the provided message ID (derived from the corresponding header).
>

Got it. Thanks.


> > > > so I resorted to writing to you personally, since you were the last=
 (and only) person to react to that series.
> > > > Patchwork shows its state as "Changes requested", but I don't see a=
ny comments on v3 of the series. Can you please take a look and explain wha=
t needs to be done for it to be merged?
> > >
> > > As pointed out during v2 review [2] the work is needed to be done, i.=
e.
> > > "Don't forget to update any documentation if needed."
> >
> > I don't know if it relevant, but in the first mail, the author writes:
> > "The old names were not documented explicitly and new generic software =
should automatically use the new attributes, which may allow to drop the ol=
d names."
> > As far as I see, that is correct, those attribute names are not documen=
ted anywhere in the kernel (except in the commit message of the patch that =
introduced them) (at least grep didn't show any results). And the new ones =
are documented in ABI/sysfs-class-power.
>
> Either way documentation should be present in the ThinkPad one.
>

I am quite new to Linux kernel development, and I don't exactly understand =
which piece of documentation you refer to. The only file under Documentatio=
n/ that contains "thinkpad" in its name is admin-guide/laptops/thinkpad-acp=
i.rst, which makes no mention of battery charge limits. So it should be men=
tioned there? Or it should be documented in the driver itself that those tw=
o are obsolete, etc.? Or both?


> > Possibly a warning could be emitted when software uses the old attribut=
es? Or what do you recommend?
>
> No warning, just provide documentation.
>
> I'm fine if you (it seems the author is not you for that series?)
> append a follow up patch with this.
>

That is correct. I am not the author.


> Thanks for pointing out to this series anyway.
>
> --
>
> With Best Regards,
> Andy Shevchenko



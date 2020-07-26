Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CD422E166
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Jul 2020 18:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgGZQjN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 12:39:13 -0400
Received: from mail-40141.protonmail.ch ([185.70.40.141]:39910 "EHLO
        mail-40141.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgGZQjN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 12:39:13 -0400
X-Greylist: delayed 18013 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 Jul 2020 12:39:12 EDT
Date:   Sun, 26 Jul 2020 16:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595781550;
        bh=bwPb/xT9QjHqWsCT5Bxsyrmhv4O/3mRB9AVywFlwtrw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=OrDQhsWZlEObmgEL9eMxO4QKb38+Utb3oBy1AkSGffwOjLNW+ZU1lfDFkaGhg3N9l
         xsoXSjOegliGim4rFsvXOLJwe3eDiZUi32M8ytXXQBl1w0jAp8Xp0vCwkxPLTIaeNZ
         frnga25kqFADMXhMiHLeYPIBiZEiX12NO8zWYHPY=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: platform/x86: status of thinkpad_acpi patch from January
Message-ID: <CY28tpMZZdjz8B1hhBfutTgVSOQ_3WTvF2sXScGvbYxBsQI3ozKDDIzW6WFYoXoYljn0rXMqmjibx_8r_Zc4gzuZYqUVpfeHDHnmTQ6GeMA=@protonmail.com>
In-Reply-To: <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com>
References: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com> <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com>
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

2020. j=C3=BAlius 26., vas=C3=A1rnap 18:20 keltez=C3=A9ssel, Andy Shevchenk=
o =C3=ADrta:

> On Sun, Jul 26, 2020 at 6:45 PM Barnab=C3=A1s P=C5=91cze wrote:
>
> > Hello Andy,
> > please excuse me that I am writing to you personally.
> > A patch series1 has been submitted to the platform-driver-x86 list befo=
re I subscribed to that list, so I cannot react to it in the form of a repl=
y,
>
> JFYI: patchwork allows you to download messages in mbox format which
> most of MUA allows to use and reply to.

I have never heard of that, but I will try to keep it in mind. Thank you.


> I'm Cc'ing this to a mailing list.
>
> > so I resorted to writing to you personally, since you were the last (an=
d only) person to react to that series.
> > Patchwork shows its state as "Changes requested", but I don't see any c=
omments on v3 of the series. Can you please take a look and explain what ne=
eds to be done for it to be merged?
>
> As pointed out during v2 review [2] the work is needed to be done, i.e.
>
> "Don't forget to update any documentation if needed."
>

I don't know if it relevant, but in the first mail, the author writes:

"The old names were not documented explicitly and new generic software shou=
ld automatically use the new attributes, which may allow to drop the old na=
mes."


As far as I see, that is correct, those attribute names are not documented =
anywhere in the kernel (except in the commit message of the patch that intr=
oduced them) (at least grep didn't show any results). And the new ones are =
documented in ABI/sysfs-class-power.

Possibly a warning could be emitted when software uses the old attributes? =
Or what do you recommend?


> So I'm waiting for either v4 with documentation update, or a comment
> explaining why it's not needed (however, I don't believe we shouldn't
> update it, b/c at least we shall mark the old interface obsolete and
> give people reference to a new (standard) one).
> Sorry if it wasn't clear.
>
> In any case it requires v4 for the matter of rebase to the latest code ba=
se.
>
> >
>
> [2]:https://patchwork.kernel.org/patch/11359999/
>
> ---------------------------------------------------
>
> With Best Regards,
> Andy Shevchenko



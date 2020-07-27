Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7E722EDE6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 15:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgG0Ntz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 09:49:55 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:61258 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG0Ntz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 09:49:55 -0400
Date:   Mon, 27 Jul 2020 13:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595857790;
        bh=PPVPDuvzuv3yxBYZ8q9Qp/vI4Stje1Ek7fFVxcshNeA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=wfMvv7BtC0KT3rwuG8GafyNu+rc5tM427nMwfAoCqmN8sNVsr+sQRdoqarvd9AUcJ
         HJ5OU4ujNsjzNOlhu0gAKLn9nq3360Y7dLHtLPNRgtWQGx+h+AFSAux3tWdGCy+pFP
         1CKzpbVjyvS4RKZagq1/A9Rndj9cvZ/yzkLHCiPE=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: platform/x86: status of thinkpad_acpi patch from January
Message-ID: <mTeuxZuZTffYeTFv_zEQQVbAfRh80v9kYOiQNZ-VJapOJ5Abb4e4BPO2ge3JPwyGKZ4_ZFMNNpK0QQbDJvCTSRltVxA21lOB4gsPwvs4f8Y=@protonmail.com>
In-Reply-To: <CAHp75VdKC_s05wK5Km1taYz4bnmbvaXN7RQx1Pb=ZLpVDxs7oA@mail.gmail.com>
References: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com> <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com> <CY28tpMZZdjz8B1hhBfutTgVSOQ_3WTvF2sXScGvbYxBsQI3ozKDDIzW6WFYoXoYljn0rXMqmjibx_8r_Zc4gzuZYqUVpfeHDHnmTQ6GeMA=@protonmail.com> <CAHp75VeZ4hEeHUe3E_UnYPLBCqF-PJwBVK3+2CG2J9qSJ4S0Ug@mail.gmail.com> <2FArDtricC8jlFcoJHfc05TW-HOn4s1wbI9nphTyia2_cUtV2bs3Qw0nC_DfM16GzZu6ulgKQdiNC1l_XEVa5q6PawEcxLWJWBX8aUkMwy0=@protonmail.com> <CAHp75VdKC_s05wK5Km1taYz4bnmbvaXN7RQx1Pb=ZLpVDxs7oA@mail.gmail.com>
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

2020. j=C3=BAlius 27., h=C3=A9tf=C5=91 12:41 keltez=C3=A9ssel, Andy Shevche=
nko =C3=ADrta:
> On Sun, Jul 26, 2020 at 10:31 PM Barnab=C3=A1s P=C5=91cze wrote:
>
> > 2020.  j=C3=BAlius 26., vas=C3=A1rnap 20:46 keltez=C3=A9ssel, Andy Shev=
chenko =C3=ADrta:
> >
> > > On Sun, Jul 26, 2020 at 7:39 PM Barnab=C3=A1s P=C5=91cze wrote:
>
> ...
>
> > > Either way documentation should be present in the ThinkPad one.
> >
> > I am quite new to Linux kernel development, and I don't exactly underst=
and which piece of documentation you refer to. The only file under Document=
ation/ that contains "thinkpad" in its name is admin-guide/laptops/thinkpad=
-acpi.rst, which makes no mention of battery charge limits. So it should be=
 mentioned there? Or it should be documented in the driver itself that thos=
e two are obsolete, etc.? Or both?
>
> This one: admin-guide/laptops/thinkpad-acpi.rst
>
> > > > Possibly a warning could be emitted when software uses the old attr=
ibutes? Or what do you recommend?
> > >
> > > No warning, just provide documentation.
> > > I'm fine if you (it seems the author is not you for that series?)
> > > append a follow up patch with this.
>
> > That is correct. I am not the author.
>
> JFYI, I applied that series to my review and testing queue in ahope
> that documentation will follow soon (from anybody, I don't care who).
> It does not mean I'll propagate this w/o documentation to upstream.
>

That is entirely understandable. Thank you. I have written a section about =
these attributes in the mentioned file. What do you think the best way to s=
ubmit it would be? Should I submit is as a completely separate new patch or=
 is it possible to "append" that it to the original?


> --
>
> With Best Regards,
> Andy Shevchenko



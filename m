Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2412E2F8FAF
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Jan 2021 23:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhAPWWA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 16 Jan 2021 17:22:00 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:58789 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAPWWA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 17:22:00 -0500
Date:   Sat, 16 Jan 2021 22:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610835677;
        bh=2c9WOXPISV+z9IQTjztvP8yM9kpEjYzbGAP6zsJtvW4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=UYNs6XltXK8NQzQEP+8Dsqz6WxGS4R6NbObLNeHgpptkgVNdzCQsMFnulfl/NG6ai
         q0VB8avVhgsvRKEJVQxoyXw0umBP3dNIfBLtfYmUJgc6FoUuJHQO4UmpZ9fIksk8sV
         +d8ZZb/Lhg/g6Dv9bX26MsX4vDSwNEjM4ZDqNUFk=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 13/24] platform/x86: ideapad-laptop: rework is_visible() logic
Message-ID: <GFjexByUwomkq1jtqoU26Z0QnimZ4Q_erOtoX0L-oOMW46o28XbGSaMUEi-CPgLigJ-xTbKM6B19KPAczx6Z1OWcnTyqRVKMrXZD7cXVe4o=@protonmail.com>
In-Reply-To: <CAHp75VdfTjwN_5CusbzFExPxm=--ePoS7+YrUVSWzP=OqkE6+g@mail.gmail.com>
References: <20210113182016.166049-14-pobrn@protonmail.com> <CAHp75VdfTjwN_5CusbzFExPxm=--ePoS7+YrUVSWzP=OqkE6+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. janu=C3=A1r 16., szombat 20:58 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:

> On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze wrote:
> >
> > Store the supported features in the driver private data, and modify the
> > is_visible() callback to use it, and create ideapad_check_features() to
> > populate it.
>
> ...
>
> > +       struct {
> > +               bool hw_rfkill_switch     : 1,
>
> Does it make sense? Not to me.
> Why not put all of them (I don't like comma and single occurrence of
> the type, it may be problematic in the future) as unsigned int, or
> something like that?

I will add the full declaration for each, with type and semicolon in each
line. Would you prefer the type to be `unsigned int` instead of `bool`, or
could you clarify what you mean by the second question?


> Also, is it okay to have bit fields (I mean from synchronization p.o.v.)?

I am fairly certain it is since this bit-field is only ever written in
`ideapad_check_features()` which is called from `ideapad_acpi_add()`. Apart=
 from
two instances they are only read indirectly by `ideapad_acpi_add()`, and ev=
en
in those two cases if the values are read as false instead of their real
value, it cannot cause significant issues as far as I see.


>
> > +                    fan_mode             : 1,
> > +                    touchpad_ctrl_via_ec : 1,
> > +                    conservation_mode    : 1,
> > +                    fn_lock              : 1;
> > +       } features;
> >  };
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze

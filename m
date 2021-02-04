Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8C830F366
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Feb 2021 13:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbhBDMqf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Feb 2021 07:46:35 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:44185 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235482AbhBDMqa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 07:46:30 -0500
Date:   Thu, 04 Feb 2021 12:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612442747;
        bh=ennRVXr+rvriPuccKfQPzEZbdCjZuxbNtb0k69DPiTI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Y4R7uzlJ86/XSFyFgpzfXPshe9HwkZJZQzh+wbP3Kq10aao0s4syAmfgOyNCWwNcj
         kRbT7WNRYVXDijqXMngfSA8aRZfCkO0EBCGOa1FH+rJwU2cOBAelJKg/6dtp6tkbdM
         Uw9eLfPjm3yEiD72LJP7jDQ1IfkmB+d/sX1QmuGA=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v3 24/29] platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent style
Message-ID: <TpRuYoh3r3tsFcaDiM7VGsvO7fxuxkjRJFafIrdnNX4WY4Bl8iiiqHS2Yiy9pg2hpLtw-olz7sT_2FmEJggNXlSMJrnoWoQnFXvUg5B-YZw=@protonmail.com>
In-Reply-To: <070b8c56-5b04-c50b-2e72-7dba07b02ed4@redhat.com>
References: <20210203215403.290792-25-pobrn@protonmail.com> <070b8c56-5b04-c50b-2e72-7dba07b02ed4@redhat.com>
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


2021. febru=C3=A1r 4., cs=C3=BCt=C3=B6rt=C3=B6k 9:58 keltez=C3=A9ssel, Hans=
 de Goede =C3=ADrta:

> Hi,
>
> On 2/3/21 10:56 PM, Barnab=C3=A1s P=C5=91cze wrote:
>
> > Fix all checkpatch warnings. Reorder variable definitions from
> > longest to shortest. Add more whitespaces for better readability.
> > Rename variables named `ret` to `err` where appropriate. Reorder
> > sysfs attributes show/store callbacks and the `ideapad_attributes`
> > array in lexicographic order. And other minor formatting changes.
> > No significant functional changes are intended.
> > Signed-off-by: Barnab=C3=A1s P=C5=91cze pobrn@protonmail.com
>
> Ugh, this is a big patch with a lot of things going on.
>
> I will take this patch as is this time, but next time please
> split patches like this up a bit:
>
> 1.  The reworking of the sysfs show/store functions really belongs in a s=
eparate patch
> 2.  That separate rework sysfs show/store functions patch itself should b=
e 2 patches:
>     2.1 Move the various show/store functions around to their final alpha=
betical order
>     without any further changes, just move the blocks. And explicitly men=
tion this
>     in the commit message, to make life easier for the reviewer
>     2.2 And then do the actual reworking in a separate patch, that makes =
reviewing this
>     much much easier, now I had to jump back and forth between the old an=
d new blocks
>     (which were not in the same place) to make sure that nothing has chan=
ged.
>     Note doing things like this (first move without any changes other the=
n moving)
>     also makes checking your own work easier.
>
> 3.  This change:
>
> > @@ -773,7 +801,10 @@ static void dytc_profile_refresh(struct ideapad_pr=
ivate *priv)
> > return;
> > perfmode =3D (output >> DYTC_GET_MODE_BIT) & 0xF;
> >
> > -   convert_dytc_to_profile(perfmode, &profile);
> >
> > -
> > -   if (convert_dytc_to_profile(perfmode, &profile))
> > -       return;
> >
> >
> > -   if (profile !=3D priv->dytc->current_profile) {
> >     priv->dytc->current_profile =3D profile;
> >     platform_profile_notify();
> >
>
> Although a good change, clearly is not just a checkpatch / style change a=
nd as
> such really should have been in its own commit!


Yes, I'm sorry, I apologize for the inconvenience, this really should've be=
en split up
and I failed to do so. If you want, I can still split it up and send the wh=
ole
(or part of the) series again?


Regards,
Barnab=C3=A1s P=C5=91cze

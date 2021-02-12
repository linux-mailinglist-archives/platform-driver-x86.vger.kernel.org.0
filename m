Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6315D319BCB
	for <lists+platform-driver-x86@lfdr.de>; Fri, 12 Feb 2021 10:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhBLJWP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 12 Feb 2021 04:22:15 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:11869 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhBLJWK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Feb 2021 04:22:10 -0500
Date:   Fri, 12 Feb 2021 09:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1613121687;
        bh=02kwwtvFvj1hLZ+22CxvgNBmSVev0VuJSGEqe221w1s=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=l3NTQGGbgyHoBbXdFlkqHXNO/ALva3Inbma937CPKCVUpl8jTkY5Efv0FbcVsteHh
         wqtSK58ak3T9B+O47dryIkjzfL1YGOywuI5r8jbu0Ewwre+muiMjw7WQFcj22w6y5O
         ARJOLmKdiDIR1OzhnqphAi0S0uZom104zSixufXw=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [RFC PATCH 0/2] platform/x86: thinkpad_acpi/ideapad-laptop: move into subfolder and extract common DYTC code
Message-ID: <X16Aff5XNZJUdPgCctMfdEHS4iaksw387ELGh5uKz9FXoJka4upg3Fsnw1j9RdkJVVeHrEiA3DYZ-TySG8GBrFyv-YcILAz_lnw92QK65Mo=@protonmail.com>
In-Reply-To: <0ba8d0b2-222b-3ac2-b84a-d623b7c6badc@redhat.com>
References: <20210204203933.559752-1-pobrn@protonmail.com> <0ba8d0b2-222b-3ac2-b84a-d623b7c6badc@redhat.com>
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


2021. febru=C3=A1r 12., p=C3=A9ntek 9:40 keltez=C3=A9ssel, Hans de Goede =
=C3=ADrta:

> [...]
> I like the series but I would like to see the 3th patch to go even
> further wrt removing duplication between thinkpad_acpi and ideapad-laptop=
.
>
> The big difference between the 2 drivers is thinkpad_acpi relying on glob=
al
> variables while ideapad-laptop stores everything in a driver data-struct.
>
> What you can do is add a struct which holds all the necessary data for th=
e
> dytc code, struct ideapad_dytc_priv is a start for this I guess. Lets say
> we rename struct ideapad_dytc_priv to struct dytc_priv, then thinkpad_acp=
i.c
> can have a:
>
> static struct dytc_priv *dytc_priv;
>
> And there can be a shared dytc probe function like this:
>
> static int dytc_profile_init(struct dytc_priv **dytc_priv_ret)
> {
> =09struct dytc_priv *dytc_priv;
>
> =09...
>
> =09*dytc_priv_ret =3D dytc_priv;
> =09return NULL;
>
> error:
> =09// clean stuff
> =09*dytc_priv_ret =3D NULL;
> =09return err;
> }
>
> Which thinkpad_acpi can then call on its global dytc_priv pointer:
>
> =09err =3D dytc_profile_init(&dytc_priv);
>
> Where as ideapad_laptop would use the pointer inside its data struct:
>
>         err =3D dytc_profile_init(&priv->dytc);
>
>
> I think this way we should be able to share almost all of the dytc code
> not just the 2 convert functions.
>

How exactly do you imagine that? In separate (e.g. "lenovo-dytc") kernel mo=
dule?
And I assume platform profile registration/etc. should be done by shared co=
de as well?


> One difference between the 2 which I'm aware of is that ideapad_laptop ca=
ches
> the handle, where as thinkpad_acpi looks it up everytime.
>
> Caching obviously is better, so the shared code should just cache it
> (add a copy of the handle pointer to the dytc_priv struct).
>
> I guess you may hit some other issues but those should all be fixable.
> So over all I think sharing most of the dytc code should be doable and
> we really should move in that direction.
>
> Note it would be best to do the further duplication removal in a
> third patch, or even in multiple further patches to make reviewing this
> easier.
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9AAC3569BF
	for <lists+platform-driver-x86@lfdr.de>; Wed,  7 Apr 2021 12:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244420AbhDGKdz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Apr 2021 06:33:55 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:53948 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235624AbhDGKdy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 06:33:54 -0400
Date:   Wed, 07 Apr 2021 10:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1617791623;
        bh=W2i4t3c5hO2+yxa8Vd/UPUq8nc+zc1aqqf2qHjv7WCE=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=dziWVecpviWfJwvs15nOi0DU6wd9qIannU4yyhFR8viG1QWHVl6Z7jbfJI8m/WOHN
         fnhfc08Zv8Xrv4HZFob0NnCyzXYlEU+VrRABKBkWCzgL5UmDnDmn/FXkKgJGuO1x+h
         H31Dmoce84WD0c244+BgdmNLm/SZoTxiiQ87Uhdw=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>,
        "jwrdegoede@fedoraproject.org" <jwrdegoede@fedoraproject.org>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>,
        "linrunner@gmx.net" <linrunner@gmx.net>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
Message-ID: <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
In-Reply-To: <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com> <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
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


2021. =C3=A1prilis 7., szerda 12:24 keltez=C3=A9ssel, Hans de Goede =C3=
=ADrta:

> Hi Nicola,
>
> Thank you for your patch series.
>
> I'm not sure what to do with these. I have a couple of concerns here:
>
> 1. These features are useful, but not super useful and as such I wonder
> how often they are used and this how well tested the firmware is wrt thes=
e.
> I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you
> comment on if it is ok from a firmware pov to try and use the following
> battery related ACPI methods on all thinkpads? :
>
> #define GET_DISCHARGE=09"BDSG"
> #define SET_DISCHARGE=09"BDSS"
> #define GET_INHIBIT=09"PSSG"
> #define SET_INHIBIT=09"BICS"
>
>
> 2. If we add support for this to the kernel we should probably
> first agree on standardized power-supply class property names for
> these, rather then coming up with our own names. ATM we register
> 2 names for the charge start threshold, the one which the thinkpad_acpi
> code invented and the standardized name which was later added.
>
> I've added Sebastian, the power-supply class / driver maintainer to
> the Cc. for this. Sebastian Nicolo wants to add support for 2 new
> features as power-supply properties:
>
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> ...
> +Battery forced discharging
> +--------------------------
> +
> +sysfs attribute:
> +/sys/class/power_supply/BATx/force_discharge
> +
> +Setting this attribute to 1 forces the battery to discharge while AC is =
attached.
> +Setting it to 0 terminates forced discharging.
> +
> +Battery charge inhibiting
> +--------------------------
> +
> +sysfs attribute:
> +/sys/class/power_supply/BATx/inhibit_discharge
> +
> +Setting this attribute to 1 stops charging of the battery as a manual ov=
erride
> +over the threshold attributes. Setting it to 0 terminates the override.
>

"inhibit_**discharge**"
"stops **charging** of the battery"

I'm wondering if it should be "inhibit_charge" or something like that?


> Sebastian, I believe that this should be changes to instead be documented
> in: Documentation/ABI/testing/sysfs-class-power
> and besides the rename I was wondering if you have any remarks on the pro=
posed
> API before Nicolo sends out a v2 ?
>
> Regards,
>
> Hans
>
>
> On 3/17/21 3:01 PM, Nicolo' Piazzalunga wrote:
> > Lenovo ThinkPad systems have a feature that lets you
> > force the battery to discharge when AC is attached.
> >
> > This patch implements that feature and exposes it via the generic
> > ACPI battery driver in the generic location:
> >
> > /sys/class/power_supply/BATx/force_discharge
> >
> > Signed-off-by: Ognjen Galic <smclt30p@gmail.com>
> > Signed-off-by: Thomas Koch <linrunner@gmx.net>
> > Signed-off-by: Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze

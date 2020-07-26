Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884A522DF77
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Jul 2020 15:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgGZN3a (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 09:29:30 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:37575 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbgGZN3a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 09:29:30 -0400
Date:   Sun, 26 Jul 2020 13:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595770166;
        bh=N/35i5OhRNomgov11FLXVlVt0+OFjV1nHYgOBhWGWsc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=gk+LccQwNyFdsuiVHedmOD6EUnMxpwrgUukCPGS7qeSDIlJ7ri1l8XG3W8JTHdcCl
         BMFeb/GJ3Bf4zKtF/WPoFOIriYkts0K2PPY9fzTCqGqAYPQLQnAvGl53FuQ9NG1pm3
         bi14EVwwL2ZPAz5Yhm1tAXeX+5zocOXroh6RMotQ=
To:     Kristian Klausen <kristian@klausen.dk>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Ognjen Galic <smclt30p@gmail.com>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: platform/x86: asus-wmi, huawei-wmi, thinkpad_acpi: inconsistent battery charge threshold attribute names
Message-ID: <SoKizdz_2DgRY8OVhNxtv2HSWdowgPJld1s-J7dZw3nXs57yuyRQtBNRJLTfMU3DsQ4x1EVSMBNWXiKPMyxSqJX0KSGcgqvApwo52c4GO6E=@protonmail.com>
In-Reply-To: <416665e3-8b53-5189-8944-2e143736c5db@klausen.dk>
References: <vtiHxEss03uciUomJSQ3Cf-m8xxvUUxqsaPRimyVrrMG7e9QItw2SngGu6b6tJ3N8PXOnMBwIys3BliV6rXJqEwaQguEp0pVpl5BmoCAzz4=@protonmail.com> <416665e3-8b53-5189-8944-2e143736c5db@klausen.dk>
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

2020. j=C3=BAlius 26., vas=C3=A1rnap 14:40 keltez=C3=A9ssel, Kristian Klaus=
en =C3=ADrta:

> On 26.07.2020 13.38, Barnab=C3=A1s P=C5=91cze wrote:
>
> > Hello all,
> > The asus-wmi, huawei-wmi, and thinkpad_acpi drivers all utilize the bat=
tery hooking system provided by the acpi/battery driver to provide function=
ality to specify the battery charge limits.
> > The first two drivers create the following attributes for the battery t=
o achieve the functionality:
> >
> > -   charge_control_start_threshold (only huawei-wmi)
> > -   charge_control_end_threshold,
> >
> > while thinkpad_acpi uses the following names:
> >
> > -   charge_start_threshold
> > -   charge_stop_threshold.
> >
> > The userspace utility TLP looks for the attributes defined by the think=
pad_acpi driver. In my opinion this inconsistency should be promptly resolv=
ed and the preferred names documented.
>
> The preferred names is already documented:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D813cab8f3994250e136819ae48fbd1c95d980466
>

Thank you for bringing attention to this, I forgot to actually look for it =
in the documentation. Thanks to this most of my initial email can be disreg=
arded, and the only significant part is that thinkpad_acpi does not use the=
se documented attribute names. I guess it is because the attributes were ad=
ded back in 2018 to the driver, more than a year before that commit. So tha=
t should be fixed, no?


> > A further detail that's worth documenting is the accepted range of valu=
es. thinkpad_acpi accepts [0, 99] for the start value, and [1, 100] for the=
 stop value. On the other hand asus-wmi, and huawei-wmi accept [0, 100] for=
 the stop value, and huawei-wmi accepts [0, 100] for the start value. (asus=
-wmi does not support specifying a start value).
> > I am in the process of writing a platform driver which provides this ex=
act functionality, that is why I would like both of the aforementioned deta=
ils to be set down. I'd prefer the names used by TLP and thinkpad_acpi, but=
 it's really not important, I just want them to be the same for all drivers=
, and that these names be documented.
> > Secondly, one thing I can imagine is having two another attributes: cha=
rge_start_threshold_range and charge_stop_threshold_range, that contain two=
 integers "a b", which means the valid range of values is [a, b]. Then I gu=
ess there needs to be another value that is handled, something like "off", =
which restores the platform defaults. This is, of course, requires more com=
plex implementation, but is quite flexible. Although I am not sure this fle=
xibility is worth the complexity.
>
> I'm not aware of any platforms with defaults implemented in
> firmware/hardware, besides start at 0% and stop at ~100%?
>

Me neither, but who knows what is/will be out there?


> > Or a simpler option is accepting [0, 100] for both attributes and retur=
ning -EINVAL if the provided value is out of range or the driver cannot set=
 it on that particular machine due to hardware limitations or something. Al=
ternatively thinkpad_acpi behavior could be adopted as well ([0, 99] for st=
art, and [1, 100] for stop).
>
> I don't think charge_{start,stop}_threshold_range is worth the effort,
> lets KISS.
>

I tend to agree, the complexity is probably not worth it.


> > In both of the previous cases the behavior of the edge cases should be =
agreed upon: for example, what does 0 for charge_stop_threshold mean? Does =
it restore the default, or does it really stop charging at 0%, keeping the =
battery empty? And so on.
>
> +1 for keeping the battery empty.
>
> > What do you think?
> > Thank you for your attention
> > Barnab=C3=A1s P=C5=91cze

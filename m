Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38257231CB7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 12:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2K3r (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 Jul 2020 06:29:47 -0400
Received: from mail-40132.protonmail.ch ([185.70.40.132]:19895 "EHLO
        mail-40132.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2K3r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jul 2020 06:29:47 -0400
Date:   Wed, 29 Jul 2020 10:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1596018584;
        bh=mecLqEAd9h6CSGW/q2YGUOSNYajeNFKFbLzTQ+hjmTw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=dtYSJxrj5odizOGmqjA9ftqEJ9KewNQN34wMv9F/nI+6SH22XUb5QZOwQKIcW3wPX
         2xWdahMFXxR0lhtbcp1ki/B0As607DoTk1TRam4OlfvxPQrNG57bRytynjVRLDOlxs
         fkqpQoIhdfXbsYQNjasy93GqjZHJfhk/60zfDp88=
To:     Daniel Dadap <ddadap@nvidia.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: Add new vga-switcheroo gmux driver for ACPI-driven muxes
Message-ID: <LE94tOCscM8Ks6-w8T82hGynVJkk6JTSnaVRDXXZS8Tl14o9t5bTlPQWTa-5Bl9b0VXYnfG-yCH5xlX_lxMFF8CsCgLicLYh245hMC8ofUY=@protonmail.com>
In-Reply-To: <1a760896-171f-e2d3-241f-e7b5fec51929@nvidia.com>
References: <20200727205752.28224-1-ddadap@nvidia.com> <OZ6ZQHG1FUrYVeq4WcEmCVJICyUzTAglUv2n5kB0QV1Fd2jodRhmB3jI9F2tPgPDcFbbdPNU9DnJaeousfdWl46UqgKIvb_aIM_hg-fyb8k=@protonmail.com> <1a760896-171f-e2d3-241f-e7b5fec51929@nvidia.com>
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

2020. j=C3=BAlius 29., szerda 5:17 keltez=C3=A9ssel, Daniel Dadap <ddadap@n=
vidia.com> =C3=ADrta:

> Thanks for your comments. A v2 patch will follow after I've had some
> time to test it more; in the meantime, I've responded to your
> suggestions inline:
>
> [...]
> >> +
> >> +static int mxds_gmux_init(void)
> >> +{
> >> +     int ret =3D 0;
> >> +     struct pci_dev *dev =3D NULL;
> >> +     static struct vga_switcheroo_handler handler =3D {
> >> +             .switchto =3D mxds_gmux_switchto,
> >> +             .get_client_id =3D mxds_gmux_get_client_id,
> >> +     };
> >> +
> > Any reason why "handler" is inside the function and not const?
> >
>
> You're right, it can be const. I have it in the function (with static
> storage) because we don't need to reference it anywhere else. I'd think
> the static storage would allow the pointer to the struct to stay alive
> even after the init function exits, but if you think it would be better
> to have it out of the function's scope I can move it.
>

I see. I think having it out of the function better signals the intention t=
hat
this variable is supposed to live as long as the module is loaded. Furtherm=
ore,
- although I am not sure about this, but - I think having a function static=
 variable
here prevents mxds_gmux_init() from being marked __init.

Also, I forgot to mention before, but mxds_gmux_fini() is not marked __exit=
.
Any reason why?


> [...]


Barnab=C3=A1s P=C5=91cze

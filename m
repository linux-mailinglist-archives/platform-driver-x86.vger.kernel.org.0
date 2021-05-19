Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D437388C54
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 May 2021 13:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346007AbhESLHG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 19 May 2021 07:07:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41234 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242675AbhESLHF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 07:07:05 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 26E141C0B7F; Wed, 19 May 2021 13:05:43 +0200 (CEST)
Date:   Wed, 19 May 2021 13:05:42 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jafar Akhondali <jafar.akhoondali@gmail.com>, jlee@suse.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: acer-wmi: Add support for Acer Helios 300
 RGB keyboard backlight
Message-ID: <20210519110542.GA24621@duo.ucw.cz>
References: <CAMW3L+24ZGowtpURUbjoCoA+eZMF0wDae1izxS+HM2uz1L9Rig@mail.gmail.com>
 <9e455325-d9d6-557d-e9a5-779f59e2af4c@redhat.com>
 <20210519085429.GA2025@bug>
 <e933a326-830c-4df8-eeb0-f8e48a4b9627@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <e933a326-830c-4df8-eeb0-f8e48a4b9627@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
> >>> The Acer helios 300 provides gaming functions WMI that is available in
> >>> Windows, however this was not implemented in Linux. The process of fi=
nding
> >>> the related method was done by decompiling PredatorSense(official Acer
> >>> gaming functions software for Predator series) and decompiling WQ
> >>> buffers. This patch provides a gaming interface which will then expos=
e a
> >>> character device named "acer-gkbbl". This character device accepts 16
> >>> bytes long config, which is specific for the backlight method. The
> >>> meaning of each bytes ordered by bit position is as follows:
> >>>
> >>> Bit 0 -> Backlight modes:
> >>> 1: Breath
> >>> 2: Neon
> >>> 3: Wave
> >>> 4: Shifting
> >>> 5: Zoom
> >>> Bit 1 -> Animation Speed: from 1 to 9 ( 1 is slowest, 9 is fastest)
> >>> Bit 2 -> Brightness from 0 to 100 ( 0 is no backlight, 100 is brighte=
st)
> >>> Bit 3 -> Unknown. Wave effect uses 8, other modes must use 0
> >>> Bit 4 -> Animation Direction:
> >>> 1: Right-to-Left
> >>> 2: Left-to-Right
> >>> Bit 5 -> Red Color Selection
> >>> Bit 6 -> Green Color Selection
> >>> Bit 7 -> Blue Color Selection
> >>> Bit 8 -> Currently unknown, or not used in known model
> >>> Bit 9 -> Currently unknown, or not used in known model
> >>> Bit 10 -> Currently unknown, or not used in known model
> >>> Bit 11 -> Currently unknown, or not used in known model
> >>> Bit 12 -> Currently unknown, or not used in known model
> >>> Bit 13 -> Currently unknown, or not used in known model
> >>> Bit 14 -> Currently unknown, or not used in known model
> >>> Bit 15 -> Currently unknown, or not used in known model
> >>>
> >>> Filling this config is out of scope for the kernel module, and this m=
odule
> >>> only acts as an interface.
> >>>
> >>> Currently, I'm not sure with the method for communicating with user-s=
pace,
> >>> but since leds.h subsystem wouldn't fit for complex actions such as t=
his
> >>> complex config, I couldn't find any better method than char dev.
> >>
> >> Thank you for your patch, given that there is no existing kernel
> >> interface which is a good match for the features exported by this
> >> keyboard I'm fine with just having a raw interface where userspace
> >> writes GAMING_KBBL_CONFIG_LEN bytes as you suggest.
> >=20
> > Keyboard backlight goes through LED interface (so please cc the mailing=
 list) and
> > no, passing raw bytes to hardware is not an acceptable interface.
> >=20
> >> But lets not use a classdev + chardev for this please, you can
> >> just add a binary write-only sysfs-atrribute under the wmi-dev for
> >> this with a name like (for example) gaming_kbd_backlight_config
> >> and then userspace can write to that without needing a class + char
> >> dev just for this single write.
> >=20
> > NAK. We have existing interfaces for this.
>=20
> I don't think we have existing interfaces for things like wave / zoom /
> neon effects.  I guess this could use the new CONFIG_LEDS_CLASS_MULTICOLOR
> API to set the color + overall brightness, combined with a custom sysfs a=
ttribute
> under the led_classdev's device's dir for selecting the things for which =
there
> is no standard API ?

We do have RGB LEDs, and some of them can do hardware-accelerated
effects. We do have pattern trigger.

We do have other hardware (Mauro is just trying to merge support) that
has limited set of effects.

Yes, some work remains to be done. But no, introducing custom
interface for this is not acceptable.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYKTxBgAKCRAw5/Bqldv6
8sOvAKCELBJTazSe0VLEp//QjVU3Rf/1JwCeKCfuOPK98bBB16Alx6f0fnkZvkE=
=6gWc
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--

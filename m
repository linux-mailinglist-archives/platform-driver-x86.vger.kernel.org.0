Return-Path: <platform-driver-x86+bounces-1243-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFF2847DB1
	for <lists+platform-driver-x86@lfdr.de>; Sat,  3 Feb 2024 01:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B5471F252DA
	for <lists+platform-driver-x86@lfdr.de>; Sat,  3 Feb 2024 00:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B52D368;
	Sat,  3 Feb 2024 00:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bluemarch.art header.i=@bluemarch.art header.b="DK+b11JL"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C3C62B
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 Feb 2024 00:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706919509; cv=none; b=e/x3HfSaes1oKAJkK55X+THvuJ5BtD1bpqu0dQ4dEI16vFs7KcTRwlmTgujEZFNlz0mDfOTqaTqt+yT7MBTpbMArz5pla8zzN8K10oa5o6h7bYoEybCRuRqGbEdBWPpcCSm/cR1krhxMSU5yQnwc87NS/rF78CSSuCZMDrHtmd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706919509; c=relaxed/simple;
	bh=mqxplJHyussdBw3oUYPnNHFPjyBO9Gnif+4tCHH2tlM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tymRmTtApAXFtZ36UNOndpCxdFf4ZK+TxxB5gCD5Zzqa+de9akK3ENAGeIUxTqtF8OG6uDCra286ExhpIUM0RM8H605JwlhdFKyy+8Z12LThFO4Zm9fmGueT5lXm3SG2rZOYxr8I48M94Wq4QmfJ7gZvByzPpDuWfoMXq5+D3mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bluemarch.art; spf=pass smtp.mailfrom=bluemarch.art; dkim=pass (2048-bit key) header.d=bluemarch.art header.i=@bluemarch.art header.b=DK+b11JL; arc=none smtp.client-ip=185.70.40.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bluemarch.art
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bluemarch.art
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bluemarch.art;
	s=protonmail; t=1706919496; x=1707178696;
	bh=aDFKjB8QJjhd8Vsyx9c1H7TbrDmkFDkzPMpMRo2YCH8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DK+b11JLY0nZgMIO8So9hk1h+Hx/xXNi/2xel91Yyh3utcEWSShXYdl5eSNc8zkCL
	 Ngg5StbuYAM5Znq0GhkNTZEDXLjlBOE73RGjr4EgseDgqErVNWL6B1cVHKfIxHtaRP
	 jXnBVqY3PnrK98ljfHoKc7OoCjOS6zrC+eISHOYjQHCRK4SN+Offt+FiZmEcPKGTVE
	 SH/2wMs6eiCVsTDubiME9GOBhkvh/npXll7mHC1yYTDG6R+4/p5fiQZ9qEpFOl1avs
	 xU94anz0abnldQPQ4nSe2wI4BSppsV7qi2I2Zi8JarQxAp6MsF9SoLgVk7KrkEDg49
	 66ZlzKg6FN+Og==
Date: Sat, 03 Feb 2024 00:17:58 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: Szilard Fabian <szfabian@bluemarch.art>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jwoithe@just42.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v2] platform/x86/fujitsu-laptop: Add battery charge control support
Message-ID: <Zb2GMCSIz1MuWpQZ@N>
In-Reply-To: <fabf391c-933c-4a7b-a23c-d361ad3d7cc0@gmx.de>
References: <20240129163502.161409-2-szfabian@bluemarch.art> <20240129175714.164326-2-szfabian@bluemarch.art> <fabf391c-933c-4a7b-a23c-d361ad3d7cc0@gmx.de>
Feedback-ID: 87830438:user:proton
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 30, 2024 at 03:02:09AM +0100, Armin Wolf wrote:
> Am 29.01.24 um 19:00 schrieb Szilard Fabian:
> > +
> > +=09return sprintf(buf, "%d\n", status);
> > +}
> > +
> > +static DEVICE_ATTR_RW(charge_control_end_threshold);
> > +
> > +/* ACPI battery hook */
> > +
> > +static int fujitsu_battery_add(struct power_supply *battery,
> > +=09=09=09       struct acpi_battery_hook *hook)
> > +{
> > +=09/* Check if there is an existing FUJ02E3 ACPI device. */
> > +=09if (fext =3D=3D NULL)
> > +=09=09return -ENODEV;
>=20
> Can you put the struct acpi_battery_hook into the struct fujitsu_laptop
> and then use container_of() to retrieve the ACPI device from there?
> The dell-wmi-ddv driver does something similar.
>=20
> This would guarantee that the battery hook always accesses the correct AC=
PI device
> and you could drop this check.
>=20
> > +
> > +=09/*
> > +=09 * Check if the S006 0x21 method exists by trying to get the curren=
t
> > +=09 * battery charge limit.
> > +=09 */
> > +=09int s006_cc_return;
> > +=09s006_cc_return =3D call_fext_func(fext, FUNC_S006_METHOD,
> > +=09=09=09=09=09CHARGE_CONTROL_RW, 0x21, 0x0);
> > +=09if (s006_cc_return =3D=3D UNSUPPORTED_CMD)
> > +=09=09return -ENODEV;
>=20
> Maybe this check should be done once during probe?
What about the following scenario?
- Put a bool into the struct fujitsu_laptop to store information about the
  machine's charge control ability.
- The S006 0x21 method check with `battery_hook_register` gets moved into
  an 'init function'. In that 'init function' the bool gets set accordingly=
.
- `battery_hook_unregister` gets moved into an 'exit function', where the
  bool gets read and when it's false nothing happens.
- `fext` check gets removed from `fujitsu_battery_add` because it's
  redundant (more about that later).
- The 'init function' gets called in `acpi_fujitsu_laptop_add` and the 'exi=
t
  function' gets called in `acpi_fujitsu_laptop_remove`.

With that scenario the code could be a little bit clearer in my opinion.
And it is possible to drop the `fext` check because if the FUJ02E3 ACPI
device exists `fext` gets set in the `acpi_fujitsu_laptop_add` function wit=
h
an error check.
(And the `fujitsu_battery_add` `fext` check was already redundant because
`battery_hook_register` got called in `acpi_fujitsu_laptop_add`. `fext`
gets set in the same function, and there is an error check already.)

Thanks,
Szilard




Return-Path: <platform-driver-x86+bounces-13408-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7148B0B1C0
	for <lists+platform-driver-x86@lfdr.de>; Sat, 19 Jul 2025 22:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 817AAAA520E
	for <lists+platform-driver-x86@lfdr.de>; Sat, 19 Jul 2025 20:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B981E25F8;
	Sat, 19 Jul 2025 20:19:53 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7A14F98
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Jul 2025 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752956393; cv=none; b=OQ/nSN6JbXa+pT4pt+FrICi1nwvFpbXHj+8D61wlweT5xHEuT2C1DqbvtCn8nEN/pvPrQAp7IBU3cjkLJZEiUd19l6P4AznoZEKYfJmDWsd3RIDzgJEJhxeP85KGAirAI13EjqV3vW4aW5aSeDExYYOwSoc2HVlhf62paMZGgSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752956393; c=relaxed/simple;
	bh=WXGaLWW64jzTdsfrBeffgb/mP86/ZZBG06qzXoVpX3k=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZmTRuVLGTemH4z1mKPQC/CFtYmYqUybWVCP2lN7fSQN4JLMlWsuVUs0OgGwwrn904mLHkJ+PhIPZpukxhIyun7hQ5zEW6+3rteHhbqPCOwaRAu1Ff08n7isxAxxqI7MwCW0UU7axsNIo+vBF9UX4Jd4flMuINX5QskyRl7Ec0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se; spf=pass smtp.mailfrom=benis.se; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benis.se
Date: Sat, 19 Jul 2025 20:19:25 +0000
To: Zhang Rui <rui.zhang@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, "rb_eddie@gmx.de" <rb_eddie@gmx.de>
From: =?utf-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
Message-ID: <tZDJlprhLriFb89pD_hEuI9r5MWf8J43NSBBtSwijh3tXJUCrr0TJxKw3nR3_YvAbvnyxdNP6hktgiEQdQmNH2vv_fFyqbwzWf8gd6w91EM=@benis.se>
In-Reply-To: <4d0e07edfa83653fa8330e08fb4520f07bb38448.camel@intel.com>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se> <3b25e59bc1b162ee8f43ffbd3c50589a52d540af.camel@intel.com> <rFJU7KbF6iq0CxJtSjPu4vLVjWata5hY1Kl-wOv253p0C2W7egJQQrkUnkSqmr1vXDXeTwwtwp0u5ZnQU6pZmPuJ7TnNBVgudMG-q5MRHyM=@benis.se> <c6Eep72y6E7gc-wUMdcIS9JfNN1_OBjlwGUrd4yGvp2R-PW2-OOoQngQt5H5kiZIccxFAPswaN9G6wVpHuewtoEvUkT52UCzHPibVJh7iYY=@benis.se> <65f3a229f70279ab0da7efa878b863c7798d4427.camel@intel.com> <uWQ7r_hhvTbLE0QDEfkt_V2Mf39SRnexnRQCZ8lrUv3hDKfAK1jpr5AeVug8wBfz3cDhu-bYnx9zvCoU5Ch-AMaVlQHwqPmZgn3a4OMRek8=@benis.se> <1e02c8f28200d8e3f27589e0ba75a67f2e99d1a4.camel@intel.com> <Hsi54U41U6V6LB65SJ9b8D_q4OsW-xsvWJSQmvmxo7EfsebwJKc6NnNHLO20CerbcNGL-Q8huoeWtzNuGsCVNrQvJW8ndwTdnIKZJIDbTjg=@benis.se> <4d0e07edfa83653fa8330e08fb4520f07bb38448.camel@intel.com>
Feedback-ID: 18592338:user:proton
X-Pm-Message-ID: 69d4b90795fe5b0dd2d47bf3bcd656ef37927bec
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





Best regards,
Benjamin Hasselgren-Hall=C3=A9n


On Thursday, 17 July 2025 at 03:15, Zhang, Rui <rui.zhang@intel.com> wrote:

> On Mon, 2025-07-07 at 19:55 +0000, Benjamin Hasselgren-Hall=C3=A9n wrote:
>=20
> > Best regards,
> > Benjamin Hasselgren-Hall=C3=A9n
> >=20
> > On Wednesday, 2 July 2025 at 10:00, Zhang, Rui rui.zhang@intel.com
> > wrote:
> >=20
> > > Remove the list as I want to grab more details.
> > >=20
> > > On Tue, 2025-07-01 at 07:44 +0000, Benjamin Hasselgren-Hall=C3=A9n wr=
ote:
> > >=20
> > > > with thermald
> > > > https://drive.benis.se/s/bF5AfDGBw6DFNZt
> > > >=20
> > > > without thermald
> > > > https://drive.benis.se/s/47xJdg33ayHerDF
> > >=20
> > > There is no much difference, which is expected.
> > >=20
> > > > journald
> > > > https://drive.benis.se/s/8JdDJG2bFbHeDmz
> > >=20
> > > The log doesn't have anything useful.
> > > It shows your last launch of thermald failed
> > >=20
> > > Jul 01 09:38:36 computer thermald[10950]: Couldn't get lock file
> > > 10950
> > > Jul 01 09:38:36 computer thermald[10950]: An instance of thermald is
> > > already running, exiting ...
> > >=20
> > > BTW, when do you start to hear the fan spinning? upon changing
> > > platform
> > > profile? upon launching thermald?
> > > is there anyway to figure out what fan device brings this noise?
> >=20
> > I can get the fans starting by activating performance and do any work
> > more or less.
> >=20
> > I have thermald enabled all the time now. I think that as long as I
> > don't have the fans active while suspending - it's fine.
>=20
>=20
> Now I'm confused.
> The fan issue is related via platform profile or thermald?
>=20
> say, after a refresh boot, does the fan spin during suspend when
> 1. thermald is NOT activated and platform profile is NOT changed?
> 2. thermald is NOT activated and platform profile is changed?
> 3. thermald is activated and platform profile is NOT changed?
> 4. thermald is activated and platform profile is changed?
>=20
> Or, what change does it make by switching platform profile only?
> what change does it make by activating thermald only?

The combination of thermald + running the fan while suspending keeps the fa=
n running. Dunno for how long (if it's for ever or just for a while).

However, thermald helps a bit but the system still under performance quite =
a lot.=20

I am regulary trying latest kernel + latest linux-firmware but no changes.=
=20

Anything else we can do?=20

>=20
>=20
> thanks,
> rui


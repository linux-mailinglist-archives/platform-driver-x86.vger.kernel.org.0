Return-Path: <platform-driver-x86+bounces-13032-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4604AEC25C
	for <lists+platform-driver-x86@lfdr.de>; Fri, 27 Jun 2025 23:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1A04A54B7
	for <lists+platform-driver-x86@lfdr.de>; Fri, 27 Jun 2025 21:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7042628B7E0;
	Fri, 27 Jun 2025 21:56:16 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425C2BCFB
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751061376; cv=none; b=jYWgXf1OEQhk5TtFiML11o3OtYgLQnwepuV/yoD3iamGFoYXsGfutrhByLzpyr8Zeq8SKLkMdfWFlaYEsDpIjyPjQj9a7AM4Q3aZswqh1sq4yMQugza7WTO1lCCGEU68NsxhQ1YHBmybtu2ZKh1ujUiHA7okwPdSA+2n6FE13nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751061376; c=relaxed/simple;
	bh=51oqGs1SiNokUEcwH6oPT8/D4gUY5tYN0DUVhVQQI8o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Errbvh6giFUcvHXlh2IMGT+OfJYu/smek4QvHxR55NQXLMUZode4OU+gYgpFsS1TUYa1B8eKQsc9DwJs6p7NV3eW268KS/lCRC88k1pl7tGL9+Kq0zyW+4I2vkoFnvU3BuqN+B5EpukFUcMiXyWMIgRxq68aofr0Vj9K0OHe2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se; spf=pass smtp.mailfrom=benis.se; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benis.se
Date: Fri, 27 Jun 2025 21:56:04 +0000
To: Kurt Borja <kuurtb@gmail.com>
From: =?utf-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Cc: Armin Wolf <W_Armin@gmx.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Linux PM <linux-pm@vger.kernel.org>
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
Message-ID: <ilIo-AIjpnkWmahXpgmQeK_6mFWl5s7x7jf0qSdGlpHSGMK1KJDdFjKLQ3t--U-cEUKtpx7s49njQx1I_nU100aE_ca4frY50L4miN8LCks=@benis.se>
In-Reply-To: <jCZyBwYNgVSM_Qk2XkfweZRlZNiSh06WVUBqya9leWoWXAmNFL9fdbgBX038OzfQUEaGE5PU8yhtJL2zq_PRW67FmLYTnoK_SPUPmzoTdco=@benis.se>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se> <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de> <5I8UDmgF_DcJBmBE0zgCXjuvmmhLamDCHkpnkAwRjSAkCa5xcFUvU-SmAeymxTajjDPR8avuW55RxOjhd8idK6jLy-hz8i-Ma3RHSaFy2Gs=@benis.se> <9642ad7e-3e57-45f9-bfd9-beac3e55418e@gmx.de> <GXC8NQl6AY_N7nQAOCRLt7SDGjFNll_TnqQyzYnP_b1weGkRqITOR-kHKcM66lPonOCo9xO2nSWXr7yycwfFuKmjRMtXVlJKya8-qvvkGik=@benis.se> <de8321ce-e595-460a-81d7-f7dae8a7b790@gmx.de> <X-40AqXfdmQw5shUOk3VSaHSXmwJYWHPmDDMLyGUH6GpMt56ty5SbNg8EVfyI_uC9J07uqZ2TtGJmmpB_x8-xpcVOw29fnKzJZ4n9L0x78A=@benis.se> <9439ec38-aadd-4aac-ba51-a8786ba50239@gmx.de> <DAXK1634VYQI.1PEUCTQIYAF3Y@gmail.com> <jCZyBwYNgVSM_Qk2XkfweZRlZNiSh06WVUBqya9leWoWXAmNFL9fdbgBX038OzfQUEaGE5PU8yhtJL2zq_PRW67FmLYTnoK_SPUPmzoTdco=@benis.se>
Feedback-ID: 18592338:user:proton
X-Pm-Message-ID: 127d65eaf45a725634246f1e1c58f196faf03748
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

One more thing: I noticed this during boot (before entering password for di=
sk encryption)
https://drive.benis.se/s/5wMkEMKs6SELQzt

Thermal trip point bug and other stuff, might be something?



Best regards,
Benjamin Hasselgren-Hall=C3=A9n


On Friday, 27 June 2025 at 22:49, Benjamin Hasselgren-Hall=C3=A9n <benjamin=
@benis.se> wrote:

> Hi Kurt,
>=20
> I do not experience the same error messages as in the bug report - no err=
or message at all. It respons to changing power profile without any errors.
> I also tried 6.12 but same behaviour as 6.15.3 (just getting some gpu gli=
tches - problably because of Lunar Lake).
>=20
> I am trying to understand how power profiles work - I guess on a high lev=
el it's controlled by uefi and the profile is set by the OS? Or is it more =
complicated than that?
>=20
>=20
>=20
> Best regards,
> Benjamin Hasselgren-Hall=C3=A9n
>=20
>=20
>=20
>=20
> On Friday, 27 June 2025 at 21:15, Kurt Borja kuurtb@gmail.com wrote:
>=20
> > Hi all,
> >=20
> > On Fri Jun 27, 2025 at 2:10 PM -03, Armin Wolf wrote:
> >=20
> > > Am 26.06.25 um 15:20 schrieb Benjamin Hasselgren-Hall=C3=A9n:
> > >=20
> > > > Hi again,
> > > >=20
> > > > dmesg: https://drive.benis.se/s/2crz7zPzkrzaqXN
> > >=20
> > > The following message intrigues me:
> > >=20
> > > platform_profile: Failed to get profile for handler hp-wmi
> >=20
> > This might be a regression.
> >=20
> > This was reported a couple months ago and I completely forgot until I
> > saw this thread. See [1].
> >=20
> > @Benjamin: Can you please check if your power profiles work on Linux
> > v6.12 (LTS)?
> >=20
> > Also try:
> >=20
> > $ cat /sys/firmware/acpi/platform_profile
> >=20
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220008
> >=20
> > --
> > ~ Kurt


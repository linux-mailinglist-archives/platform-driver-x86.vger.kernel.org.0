Return-Path: <platform-driver-x86+bounces-6994-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64CF9C6310
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Nov 2024 22:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCA8AB47702
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Nov 2024 20:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C048219E5E;
	Tue, 12 Nov 2024 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hm0ggcuY"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6DA219CB2;
	Tue, 12 Nov 2024 20:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731443165; cv=none; b=dkOUB20qmgfosqeYbfQi1mgiAfxnFkBR3QyCARvBr5OWoG/U0sbhg88QHVVaRcR+6GE3lvSGfD0CxSeazvk4yxRrdvNDApKrtD467HZ7u11kgIeJi7OjJi3LsCWLafzwskkSvZrew+aHzA5aZ3d2nIC7oCDzr1jVeya5vatLwCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731443165; c=relaxed/simple;
	bh=Qcum8ubMRfMH0pNAD4awTm1xz9Aql0UVEtVhsoAChAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBL+6ikG0XX/2xbcBl0EMI83YVh4ZBEyJ4D8XNLSmSDLYZtzalXLPX+EPeoXbJcCixVeIChpdDM+zUQcoQ3Y1pkwAsbMyzX+QykkxYibtM3n1JWV5/M/5IXEGhx/WRmWKCGcj+1PnOt0EiCqwljBV2prKOIbC9ecO/yMskypznw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hm0ggcuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC98EC4CEDC;
	Tue, 12 Nov 2024 20:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731443164;
	bh=Qcum8ubMRfMH0pNAD4awTm1xz9Aql0UVEtVhsoAChAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hm0ggcuYlNUiIp9CbUr+YPxnNSMRhz0e+TTYH8gJBQIauhGSxC4ZefsUdoMreszHv
	 MfjOWDKCin5gSVwTgo3nvFRJXhSLe8wHIqkPnM1ph7elEcTEpMxUDo6FIW6ft4KM2q
	 Gs2ey3lwLwygEC3lflIWorsAuo69u1xeT6lj514pf78WC4CtO3w5JChOfhqcb6JLD6
	 v9Dsv5UJknEllMOIPrrKewKIdF24kH6GYgInusc+l//Db1+v1fMwHYfWwmqpGRczB4
	 xYC5Kcpk8lc11bu54p7XEhFV42EinBx/NcVscbkGqfBzkD8Ko+xHjgOPRgN4CVyezf
	 pcZrHdGwNZEGQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ebc349204cso2798717eaf.3;
        Tue, 12 Nov 2024 12:26:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULS5HWvl8nz8aX3VXeAWBVTSa4rCjWmsFLNQ1G9KlQ2xdSblsFi+n5uBClop6QO2xFa688URTm/ECEJYrc@vger.kernel.org, AJvYcCUMW5g+uXV1SddproIkeDkeYq4tyNabrhYjML4F36ujAc4+FUd1cSWAT8++USAvR4UrQ+dJZvEXAlxlO5rzusioSXZEiA==@vger.kernel.org, AJvYcCXP8+TPRcLIq56eaZsqeWRGEORfGV3ZZZmcQ5hU6USAXbTZ6LXwO9kTOiIhgK4HGciIRWoH+gwTUTJw@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQc3i2VB/2ZTULcMc3sfj+R1Q1DsU/eEtKzUOTH8bMZVL1jbp
	qIaDhCgQhytc0QdVuSPnbuetW+HQOEBhtfMacDmHJMGMJbAMP1v3FF0D94Sx1BH9Pqk1X8r4L0g
	KaZPKBKyawWOxnrSuvBbGfkWZ5KA=
X-Google-Smtp-Source: AGHT+IGueUF6YygHSoCLSttKQ5J82xFSJpZu1XOHp1U7sZTwXBi/RujuKdVKS0T4WDHw3EaUOQdo0MG0CaeY9cW9fsA=
X-Received: by 2002:a05:6820:1f08:b0:5eb:85ee:2cbd with SMTP id
 006d021491bc7-5ee57c60694mr12148398eaf.6.1731443164001; Tue, 12 Nov 2024
 12:26:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109044151.29804-1-mario.limonciello@amd.com>
 <CAJZ5v0gaNKKbf29WD5keQxJdgP93P_iWiQMwp7cOL9NCUumeZA@mail.gmail.com> <411286d5-83c2-471f-a723-6a00aee3cc89@amd.com>
In-Reply-To: <411286d5-83c2-471f-a723-6a00aee3cc89@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 12 Nov 2024 21:25:52 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gj7qoSHd54q+KCLz44Hj+MpkgU7LZG1nNBHf+4dwVHpw@mail.gmail.com>
Message-ID: <CAJZ5v0gj7qoSHd54q+KCLz44Hj+MpkgU7LZG1nNBHf+4dwVHpw@mail.gmail.com>
Subject: Re: [PATCH v6 00/22] Add support for binding ACPI platform profile to
 multiple drivers
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, Lee Chun-Yi <jlee@suse.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D . Jones" <luke@ljones.dev>, Ike Panhc <ike.pan@canonical.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Alexis Belmonte <alexbelm48@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Ai Chao <aichao@kylinos.cn>, Gergo Koteles <soyer@irl.hu>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:ACPI" <linux-acpi@vger.kernel.org>, 
	"open list:MICROSOFT SURFACE PLATFORM PROFILE DRIVER" <platform-driver-x86@vger.kernel.org>, 
	"open list:THINKPAD ACPI EXTRAS DRIVER" <ibm-acpi-devel@lists.sourceforge.net>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Matthew Schwartz <matthew.schwartz@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 9:20=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 11/12/2024 14:16, Rafael J. Wysocki wrote:
> > On Sat, Nov 9, 2024 at 5:42=E2=80=AFAM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> Currently there are a number of ASUS products on the market that happe=
n to
> >> have ACPI objects for amd-pmf to bind to as well as an ACPI platform
> >> profile provided by asus-wmi.
> >>
> >> The ACPI platform profile support created by amd-pmf on these ASUS
> >> products is "Function 9" which is specifically for "BIOS or EC
> >> notification" of power slider position. This feature is actively used
> >> by some designs such as Framework 13 and Framework 16.
> >>
> >> On these ASUS designs we keep on quirking more and more of them to tur=
n
> >> off this notification so that asus-wmi can bind.
> >>
> >> This however isn't how Windows works.  "Multiple" things are notified =
for
> >> the power slider position. This series adjusts Linux to behave similar=
ly.
> >>
> >> Multiple drivers can now register an ACPI platform profile and will re=
act
> >> to set requests.
> >>
> >> To avoid chaos, only positions that are common to both drivers are
> >> accepted when the legacy /sys/firmware/acpi/platform_profile interface
> >> is used.
> >>
> >> This series also adds a new concept of a "custom" profile.  This allow=
s
> >> userspace to discover that there are multiple driver handlers that are
> >> configured differently.
> >>
> >> This series also allows dropping all of the PMF quirks from amd-pmf.
> >>
> >> ---
> >> v6:
> >>   * Add patch dev patch but don't make mandatory
> >
> > Probably a typo?
>
> Ah whoops, yes.
>
> >
> > Which patch is it, BTW?
>
> Patch 3.
>
> >
> > In any case, if the merge window for 6.13 starts on the upcoming
> > weekend, which is likely to happen AFAICS, I'll defer applying this
> > series until 6.13-rc1 is out.
> >
> > It's larger and it's been changing too often recently for me to catch
> > up and I'll be much more comfortable if it spends some time in
> > linux-next before going into the mainline (and not during a merge
> > window for that matter).
> >
>
> I'm thankful; Armin ended up having a lot of very valuable feedback.
>
> Yeah, it makes sense to defer to next cycle.
>
> Would you prefer me to rebase and resend as v7 after the merge window or
> will you just add it to a TODO?

If rebasing is needed, it will be welcome.  Also if you need/want to
make any changes in the meantime, please respin.  Otherwise I can just
pick up the current series.

> >>   * See other patches changelogs for individualized changes
> >>
> >> Mario Limonciello (22):
> >>    ACPI: platform-profile: Add a name member to handlers
> >>    platform/x86/dell: dell-pc: Create platform device
> >>    ACPI: platform_profile: Add device pointer into platform profile
> >>      handler
> >>    ACPI: platform_profile: Add platform handler argument to
> >>      platform_profile_remove()
> >>    ACPI: platform_profile: Pass the profile handler into
> >>      platform_profile_notify()
> >>    ACPI: platform_profile: Move sanity check out of the mutex
> >>    ACPI: platform_profile: Move matching string for new profile out of
> >>      mutex
> >>    ACPI: platform_profile: Use guard(mutex) for register/unregister
> >>    ACPI: platform_profile: Use `scoped_cond_guard`
> >>    ACPI: platform_profile: Create class for ACPI platform profile
> >>    ACPI: platform_profile: Add name attribute to class interface
> >>    ACPI: platform_profile: Add choices attribute for class interface
> >>    ACPI: platform_profile: Add profile attribute for class interface
> >>    ACPI: platform_profile: Notify change events on register and
> >>      unregister
> >>    ACPI: platform_profile: Only show profiles common for all handlers
> >>    ACPI: platform_profile: Add concept of a "custom" profile
> >>    ACPI: platform_profile: Make sure all profile handlers agree on
> >>      profile
> >>    ACPI: platform_profile: Check all profile handler to calculate next
> >>    ACPI: platform_profile: Notify class device from
> >>      platform_profile_notify()
> >>    ACPI: platform_profile: Allow multiple handlers
> >>    platform/x86/amd: pmf: Drop all quirks
> >>    Documentation: Add documentation about class interface for platform
> >>      profiles
> >>
> >>   .../ABI/testing/sysfs-platform_profile        |   5 +
> >>   .../userspace-api/sysfs-platform_profile.rst  |  28 +
> >>   drivers/acpi/platform_profile.c               | 537 ++++++++++++++--=
--
> >>   .../surface/surface_platform_profile.c        |   8 +-
> >>   drivers/platform/x86/acer-wmi.c               |  12 +-
> >>   drivers/platform/x86/amd/pmf/Makefile         |   2 +-
> >>   drivers/platform/x86/amd/pmf/core.c           |   1 -
> >>   drivers/platform/x86/amd/pmf/pmf-quirks.c     |  66 ---
> >>   drivers/platform/x86/amd/pmf/pmf.h            |   3 -
> >>   drivers/platform/x86/amd/pmf/sps.c            |   4 +-
> >>   drivers/platform/x86/asus-wmi.c               |  10 +-
> >>   drivers/platform/x86/dell/alienware-wmi.c     |   8 +-
> >>   drivers/platform/x86/dell/dell-pc.c           |  36 +-
> >>   drivers/platform/x86/hp/hp-wmi.c              |   8 +-
> >>   drivers/platform/x86/ideapad-laptop.c         |   6 +-
> >>   .../platform/x86/inspur_platform_profile.c    |   7 +-
> >>   drivers/platform/x86/thinkpad_acpi.c          |  16 +-
> >>   include/linux/platform_profile.h              |   9 +-
> >>   18 files changed, 553 insertions(+), 213 deletions(-)
> >>   delete mode 100644 drivers/platform/x86/amd/pmf/pmf-quirks.c
> >>
> >>
> >> base-commit: d68cb6023356af3bd3193983ad4ec03954a0b3e2
> >> --
> >> 2.43.0
> >>
>


Return-Path: <platform-driver-x86+bounces-15036-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A73C194F2
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Oct 2025 10:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 85E394FA33C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Oct 2025 08:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF55C31CA7D;
	Wed, 29 Oct 2025 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Q5oHeBf6"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2D31E11C
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727707; cv=none; b=gLRflNc+1WWsNcv9y8geQvOV4SjFMIhcn/NrxRtmwJ5PVd+sEZ3pRuHLa96GRhZXZ5hzO/+MHPPTaq7cjE2izhJV1NrPFPBLq+i4OSmYTdR8xzXcJDLBMuVI25LSKuYSplElh+dO6X1Tg8pWK22+zofOerjtFMaKWOsVfZDDjKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727707; c=relaxed/simple;
	bh=yh7c4Ylk4+/9RB6DYBt8/t+H/Eabv/blc9DxcFBeDSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZO6VGHYJNMRXDTeVixGYt8HDd2AtAqlBRbDmdz9PibHF1jQ/mz8QpCc7gslMWGGrHjdDW+Dlz7EMi5fuRE6jCM03l6Za0umeTmj1ugdaTufW186eR8CaKzaB1m5fBntxmhqN/qNDOI30eD2w3w32JROH2cUFThW6stLdZMYgaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Q5oHeBf6; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 971F8C38FE
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 10:48:22 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id C43FBC391A
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 10:48:21 +0200 (EET)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 36730200A61
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 10:48:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761727701;
	bh=mNSDBQEwxVVs1bjYpr4Sf3PAgnnt9gD+9WzwsjYTCGM=;
	h=Received:From:Subject:To;
	b=Q5oHeBf6JOhZ3R4/C2SavNYext4AKsZrJymKhG/vAMhxPdIxTs81dxSQx3hWNGgFy
	 cKf6GLAhB1ZfMI1Q4/5NxhShBvCD9pUZw3WRT/bo85uPvnUD9ND6C06V9S37cQSqBW
	 mQ7ldyK/qa31Hz8fKgv7T7Hwr1uiPaam7L05teiuCbO/FhVd7ShDOkwllBUFoQ5yTx
	 liVqpQ+8S4KxLsXCCUhVZ2vTdn+8URRpAmnG24KbhJyxW5m+WxdmEdfmbNEZxGshM4
	 MNtyR3toGudaV4IWVgwRWL07XxoMsoF0LYeL8Sa8elLvg9NWcqwS9FzqiCIRJ7wDCu
	 SvVW/YYeDsm3g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-378cffe5e1aso73598301fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 29 Oct 2025 01:48:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YwZHuAwQcL9vg/BmD9Izk6556BQ6M25v3ZhiN4aBcvPFcLnZUWi
	NeZfD5wXeftrYSqLdzp3vbZaJZASCQmLpPHMsD21+5VCx7g7VUL2W3Hg+O20DDwePppgCi2a9ML
	g7EsOXqeM7nBbOl9o84kmnrlbs+D4Aig=
X-Google-Smtp-Source: 
 AGHT+IFPhpMsBge65ema/+f0f/vFwVTN3LMRvJUEhqNerjqJ060aA6UVrizzpKox/k91CCiFIDUGyegDMp/mslBKrxk=
X-Received: by 2002:a2e:8f88:0:b0:379:77e:7230 with SMTP id
 38308e7fff4ca-37a023d715emr6367241fa.22.1761727700605; Wed, 29 Oct 2025
 01:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084414.1391595-1-lkml@antheas.dev>
 <20251015084414.1391595-7-lkml@antheas.dev>
 <38a49942-58d3-49cf-90d7-1af570918ae5@kernel.org>
 <CAGwozwEmjms0H=GPbevuOjJfed6x69wmg8E9begBhUKbF8B2AQ@mail.gmail.com>
 <000cd38e-7052-4987-b5bc-b8de176363cf@kernel.org>
 <CAGwozwFDsn0xm_mG4ypEym=K8c81qqi=qtJL=06nP6SzdFaFoQ@mail.gmail.com>
 <b98a8486-e90a-4bd5-b3a7-3b2ba1b16398@kernel.org>
In-Reply-To: <b98a8486-e90a-4bd5-b3a7-3b2ba1b16398@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 29 Oct 2025 09:48:08 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHa3GSNGyRRp4=bR+Wsy2VLgwAbSmcdWb2=5rEyi7jdQw@mail.gmail.com>
X-Gm-Features: AWmQ_bkAPApCWyTanKZngK8tMXg4_CkUbw6X6yHW0pBnhPtJwHTxCbKcR4H5jdU
Message-ID: 
 <CAGwozwHa3GSNGyRRp4=bR+Wsy2VLgwAbSmcdWb2=5rEyi7jdQw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176172770144.2357559.7880102491168658394@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 29 Oct 2025 at 04:36, Mario Limonciello (AMD) (kernel.org)
<superm1@kernel.org> wrote:
>
>
>
> On 10/28/2025 4:39 PM, Antheas Kapenekakis wrote:
> > On Tue, 28 Oct 2025 at 22:21, Mario Limonciello <superm1@kernel.org> wrote:
> >>
> >> On 10/28/25 3:34 PM, Antheas Kapenekakis wrote:
> >>>>> The fan speed is also lost during hibernation, but since hibernation
> >>>>> failures are common with this class of devices
> >> Why are hibernation failures more common in this class of device than
> >> anything else?  The hibernation flow is nearly all done in Linux driver
> >> code (with the exception of ACPI calls that move devices into D3 and out
> >> of D0).
> >
> > I should correct myself here and say hibernation in general in Linux
> > leaves something to be desired.
> >
> > Until secure boot supports hibernation, that will be the case because
> > not enough people use it.
>
> The upstream kernel has no tie between UEFI secure boot and hibernation.
>   I think you're talking about some distro kernels that tie UEFI secure
> boot to lockdown.  Lockdown does currently prohibit hibernation.
>
> >
> > I have had it break for multiple reasons, not incl. the ones below and
> > the ones we discussed last year where games are loaded.
> >
> > For a few months I fixed some of the bugs but it is not sustainable.
> >
> >> Perhaps you're seeing a manifestation of a general issue that we're
> >> working on a solution for here:
> >>
> >> https://lore.kernel.org/linux-pm/20251025050812.421905-1-safinaskar@gmail.com/
> >>
> >> https://lore.kernel.org/linux-pm/20251026033115.436448-1-superm1@kernel.org/
> >>
> >> https://lore.kernel.org/linux-pm/5935682.DvuYhMxLoT@rafael.j.wysocki/T/#u
> >>
> >> Or if you're on an older kernel and using hybrid sleep we had a generic
> >> issue there as well which was fixed in 6.18-rc1.
> >>
> >> Nonetheless; don't make policy decisions based upon kernel bugs.  Fix
> >> the kernel bugs.
> >
> > My problem is I cannot in good conscience restore a fan speed before
> > the program responsible for it is guaranteed to thaw.
> >
> > The best solution I can come up with would be in freeze save if manual
> > control is enabled, disable it, and then on resume set a flag that
> > makes the first write to fan speed also set pwm to manual.
> >
> > This way suspend->hibernate flows, even if hibernation hangs when
> > creating the image, at least have proper fan control because they are
> > unattended, and resume hangs work similarly.
> >
> > Antheas
> >
>
> This sounds like a workable approach for what I understand to be your
> current design; but let me suggest some other ideas.
>
> What happens if you're running something big and the OOM comes and
> whacks the process?  Now you don't have fan control running anymore.
>
> So I see two options to improve things.
>
> 1) You can have userspace send a "heartbeat" to kernel space.  This can
> be as simple as a timestamp of reading a sysfs file.  If userspace
> doesn't read the file in X ms then you turn off manual control.

The OOT scenario is something I have not handled yet specifically, or
have had happen.

Systemd will restart the service in the case of OOT after 5 seconds
and in the case of a crash there are multiple fallbacks to ensure the
custom curve turns off.

Most of the hibernation hangs that I have experienced happen before
journalctl turns on, so I assumed that it's before userspace
unfreezes. I am also not sure if restore() gets to run in those cases
or not.

Re: heart beat, read below.

> 2) You move everything to a kthread.  Userspace can read some input
> options or maybe pick a few curve settings, but leave all the important
> logic in that kthread.

I think this is what Luke tried to do with the Zotac Zone. But in the
end, the kernel is limited to what calculations it can do, esp.
floating point and what it can access, so you end up with a worse
curve with limited extendability, and a driver specific ABI. And we
also risk duplicating all of this code on hwmon drivers and making it
harder to access.

I think part of this reason is why the platform side of the Zotac
stuff has not been upstreamed, even though the driver itself other
than that is pretty straightforward with an established ABI by now.
And it is also the reason we have not been able to add the module to
Bazzite, because 1) we cannot validate the new fan curve calculations
without a device and 2) they are worse that what we provide through
userspace (a polynomial ramp-up which embeds hysteresis to avoid
jittering, plus choice for both Edge and Tctl sensors).

In summary, I think there would great potential for a common set of
"hwmon" helpers that can use a temperature function and a speed set
function to handle a basic multi-point curve for basic, e.g., udev
use-cases. To that end, there could be a helper with a 5 second
timeout that turns off the custom speed. But it would be good for that
to be implemented globally, so it does not block device hw enablement.

As far as this driver is concerned, I will handle the hibernation case
with a lazy resume, per what I said in the previous email.

Antheas

>
>



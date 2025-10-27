Return-Path: <platform-driver-x86+bounces-14978-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BBDC0B6F7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Oct 2025 00:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7E4A4EBAB2
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Oct 2025 23:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1423B2FFF95;
	Sun, 26 Oct 2025 23:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="lQrV3J/5"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A3A2FFDD2
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 23:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520658; cv=none; b=qrZh8LTgX/KaUevu9Q/89ukXfmy9Qd3bb6JhqIAJiW1QekufRhy2rxn74XQNBfAWpR2ypI1wYA2wOJbBdjp8/H5Q3vdZx3cP1/wypCwutiSqV5Ieu1zAUjKFbmKgGNVOwq4vC+qfXLOy8P4VVuEcbRnp+SgANCmy3c1hgBVEKp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520658; c=relaxed/simple;
	bh=0Eblrr0rQZHjmoM8FhZsrjb4gQPrP3t6Hlax/MDvvM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhDdfBsL81KaOvA2Kq6dql87zgPEJ4TN1mZvoUCSN0A8RBfbTrFO1uu0CeGWgZtcaYXQ4ZXanIURfs8MJsYaWImCaRSDx0QbdmSB74kqDbQ+McSfHfiozPWK2TX+11XDRCk8OcyssXV5PdQsvYddrqRcyljq5YFkU/06kOjfp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=lQrV3J/5; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 478945E537
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 01:17:32 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 314E55E514
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 01:17:31 +0200 (EET)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 16DDE201918
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 01:17:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761520650;
	bh=NLLhv4W6vg+uqkKQKr1d0rnjNBVPg3Q90Yj6Z1QOohs=;
	h=Received:From:Subject:To;
	b=lQrV3J/5QRG2o7U0R/AyNQ6H26WKxv1nveTFsefCxRtX8yKjBBwBf4+xzB/vmGw3w
	 rfeGX+Z/hWptLbVvuttzHV5IEG3N7xlBHOYMYNts5h5LaYvIr07yZPbXXHuMiy1liJ
	 r7rqvd3LPhJfIZkeF+I/V248ElO4KictsyjT9rtvLsWhkQR5N68qE+91ObN46dMjjc
	 F5qqkUG1QMRkr+GwwZ3iBIURaCO+YsDEpdfmEt7lGIgt9PxR1++h6ev6bujlDkk28y
	 QvyoNs71mxveRUN1kI6s41Bkpd0QOGnNz9knQ5UfApPpOHRLqgzF6wFB6DDmzTL2LY
	 J0CvD1ADCr0sQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-378ddffb497so37159291fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 26 Oct 2025 16:17:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YwBHNMKq/g5SHh+9Co9Zs1u/p0crIzcXV/gNdR4ek3wnVyv+vxI
	Bi43CfxazICfLXj8F/pl3QpZl1YvI2TOCWYzVH5s6Lmrxr6XixBP2BdBjq8vTcJrt+zCw+3/vpc
	naBViQC7yea1cJ7bYdzAvRqROdyEe2tM=
X-Google-Smtp-Source: 
 AGHT+IF+hOy1JUlRDSLwAnFSRjjFUusa/46QRrgNSniA7IHw4k4MPNiKsp/8aOC45osMCehRlShRPvXlBfB66NWzQYw=
X-Received: by 2002:a05:651c:438d:20b0:378:d69f:af51 with SMTP id
 38308e7fff4ca-378d69fb29fmr30006271fa.23.1761520649446; Sun, 26 Oct 2025
 16:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084414.1391595-1-lkml@antheas.dev>
 <20251015084414.1391595-7-lkml@antheas.dev>
 <63f0221d-4436-4d1e-a933-8b12f392cac6@gmx.de>
In-Reply-To: <63f0221d-4436-4d1e-a933-8b12f392cac6@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 27 Oct 2025 00:17:18 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHsFEU1nZNe-7HEv86Oi8VTX=qHO-Tz76uRJVeFTUDv5g@mail.gmail.com>
X-Gm-Features: AWmQ_bkT1BFV1BoAROk7zo1d9f-a5mQkYakihyu3LLTsXKjAjtlTIYIhG0371kA
Message-ID: 
 <CAGwozwHsFEU1nZNe-7HEv86Oi8VTX=qHO-Tz76uRJVeFTUDv5g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176152065032.2014722.5999614291059775007@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 26 Oct 2025 at 23:50, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 15.10.25 um 10:44 schrieb Antheas Kapenekakis:
>
> > The Ayaneo EC resets after hibernation, losing the charge control state.
> > Add a small PM hook to restore this state on hibernation resume.
> >
> > The fan speed is also lost during hibernation, but since hibernation
> > failures are common with this class of devices, setting a low fan speed
> > when the userspace program controlling the fan will potentially not
> > take over could cause the device to overheat, so it is not restored.
>
> I am still not happy with potentially breaking fancontrol on this device.
> Most users expect fancontrol to continue working after hibernation, so not
> restoring the fan speed configuration seems risky to me. Would it be enough
> to warn users about his inside the documentation?

This device features two modes of operation: a factory fan curve
managed by the EC and a fixed speed set via override of the EC.

The factory curve is tuned by the manufacturer to result in safe
operation in all conditions by monitoring the CPU temperature and is
not adjustable.

The fixed speed, on its own when set manually, is not use-able,
because this device has a fluctuating temperature based on workload.
So to meet the varying conditions, its speed would either have to be
set too high, leading to excess noise, or too low, potentially
overheating. Therefore, users of this interface control it via a
userspace program, e.g., hhd, coolercontrol, which allows creating a
custom fan curve based on measurements of temperature sensors.

When entering hibernation, the userspace program that controls the fan
speed is frozen, so the fan remains at its previous speed regardless
of temperature readings and there are no safety checks.

When resuming from hibernation, the EC takes over and monitors the
temperature, so it is safe until the userspace program is thawed. If
we introduce a resume hook, we take over from the EC before the
program is ready, introducing a gap where the device can potentially
overheat. If anything, the freeze hook should remove the fan speed
override instead, because suspend-then-hibernate is more of a
liability for overheating if hibernation hangs.

Other devices feature adjustable EC fan curves (e.g., Lenovo, Asus,
AYN, MSI). Since the EC monitors the temperature there, it is fine to
restore the fan curve. Speaking of, I am having quite a few issues
with MSI Claws, so that series is a bit on the back burner, so I plan
to push these series first.

I will try to tend to this series in the next days. I wanted to push
the Asus stuff first though.


Antheas

> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/ayaneo-ec.c | 42 ++++++++++++++++++++++++++++++++
> >   1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > index 73e9dd39c703..8529f6f8dc69 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -37,6 +37,8 @@
> >   #define AYANEO_MODULE_LEFT  BIT(0)
> >   #define AYANEO_MODULE_RIGHT BIT(1)
> >
> > +#define AYANEO_CACHE_LEN     1
> > +
> >   struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> >       bool has_charge_control;
> > @@ -47,6 +49,8 @@ struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> >       struct acpi_battery_hook battery_hook;
> > +
> > +     u8 cache[AYANEO_CACHE_LEN];
> >   };
> >
> >   static const struct ayaneo_ec_quirk quirk_fan = {
> > @@ -464,10 +468,48 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >       return 0;
> >   }
> >
> > +static int ayaneo_freeze(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret, i = 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret = ec_read(AYANEO_CHARGE_REG, &data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ayaneo_thaw(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret, i = 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret = ec_write(AYANEO_CHARGE_REG, data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ayaneo_pm_ops = {
> > +     .freeze = ayaneo_freeze,
> > +     .thaw = ayaneo_thaw,
> > +};
> > +
> >   static struct platform_driver ayaneo_platform_driver = {
> >       .driver = {
> >               .name = "ayaneo-ec",
> >               .dev_groups = ayaneo_ec_groups,
> > +             .pm = &ayaneo_pm_ops,
>
> Please use pm_sleep_ptr() here.
>
> Thanks,
> Armin Wolf
>
> >       },
> >       .probe = ayaneo_ec_probe,
> >   };
>



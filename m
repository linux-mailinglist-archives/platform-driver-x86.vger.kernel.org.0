Return-Path: <platform-driver-x86+bounces-14925-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330CC07322
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Oct 2025 18:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1191E19A7837
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Oct 2025 16:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB71533438F;
	Fri, 24 Oct 2025 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="cT43xEIo"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D95333457
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322153; cv=none; b=SoBccvAWIlKVe6dN89tSJs+unXRqyK/Qb8aejiyX08ijiUw8qH3HNxJJNar9ijcgIIKl4s7VtBhrMXAFJaYXGnnIZQ5JWDs0xMkGdFO1YHjyEiIz7smp3J5TtocLitCSypge4fwJHvLqsHSgSWJdV1AYq67iCfBGE5z0QcAF0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322153; c=relaxed/simple;
	bh=FLy/jcNF0lxX4tJCzzrr+1ORz+Lwhbua3yPXxcLI9Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEKTRJ/GnoI/38bXmkoWUVzTdFzJIZf9DrfodMXfeiTuPxQl5uwaEN6EssIyx18BagDbapc6v0JXPTg2h3Y+yAHGNsryfjNDwqS/031PxubwF7VzyAQ23lPYftGLrXiYHOsyHINPn/MXixgcp5tbnddAIiKZeaJFq9DiHc/fko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=cT43xEIo; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 34E12BDCBE
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 19:09:02 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 369D0BD98F
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 19:09:01 +0300 (EEST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B53901FC3A3
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 19:09:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761322140;
	bh=c6HxS6Zvm7NRv10KSWFGgdQGO5/rBFIB+mc4eI/omCg=;
	h=Received:From:Subject:To;
	b=cT43xEIoJSV5RPVBXaVTsUFPOLLXPFaOd5xgfEY/9mLQtbkANXa8RdP7/RgpWF1k7
	 6fO3sySza/uqdUiiTRrYadW1/ErQ8XItgrUVBDfV2bWxl7PQ9S/YbZ9wm65KdP5fbg
	 uv4ujLizwVB9cH3DoQHgO9AlC6luIZSNe6E2seL3/XHt+IXWBlknZk9hwB6PbbJg1k
	 ImMpCMVsLf50H+8RephBf+gfUlP9Xgpd2vZi8RRlPu82a5AfkdSizvopUQk0daWYVB
	 4WahwELwBgRsFWVQ5teddIlW4KVXvGdRx0UqbnUsu1MeFlvx2lKVvU2lprTSmCBlQb
	 H8nvA17XKD3tw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3717780ea70so30695131fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 24 Oct 2025 09:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVD2INDR9zTVs3L/OsLfCvmm/w32brd8uYJ2j6imXAaVY8MmcaggbuyYYf1PDKLOxy1wQS4ju5h9ZKqmFKkrARBQjlr@vger.kernel.org
X-Gm-Message-State: AOJu0YxRrB2wSAaTxaNannWVGVDRuKAZtiwlwJWMI/PeqGa7jK7bCmTr
	ronQ1ZE7pOCZ9Fzt7qBes1FxCXMscz1k9DYbS1G/o8kZsNVewCjjLtf8e6SsVPTH3NkR1B/u6lU
	hNGiZsoj2zYl762M9JRvmg9CoAVoYcF4=
X-Google-Smtp-Source: 
 AGHT+IGrtGMUbTKY3EJtLEoExINvTxhF1uNJ6b9fMUw+NXU6QFCVEzK+bhBzwXzHYYPoTCBgDT/ICF7dvjwKtksorfc=
X-Received: by 2002:a05:651c:1a08:b0:336:df0e:f4ac with SMTP id
 38308e7fff4ca-377979febaemr77151861fa.25.1761322140301; Fri, 24 Oct 2025
 09:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
In-Reply-To: <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 18:08:49 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
X-Gm-Features: AWmQ_bluSFRZs0j2QGdMRmJXJE4ND_MPKG9XbmD0AYwluvNUVV_Hqb-0t8edzEA
Message-ID: 
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176132214091.2527965.15426434681803248153@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> > The ROG Xbox Ally (non-X) SoC features a similar architecture to the
> > Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
> > this support was dropped by the Xbox Ally which only S0ix suspend.
> >
> > Since the handler is missing here, this causes the device to not suspend
> > and the AMD GPU driver to crash while trying to resume afterwards due to
> > a power hang.
> >
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/amd/pmc/pmc.c | 3 +++
> >   drivers/platform/x86/amd/pmc/pmc.h | 1 +
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> > index bd318fd02ccf..cae3fcafd4d7 100644
> > --- a/drivers/platform/x86/amd/pmc/pmc.c
> > +++ b/drivers/platform/x86/amd/pmc/pmc.c
> > @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> >       switch (dev->cpu_id) {
> >       case AMD_CPU_ID_PCO:
> >       case AMD_CPU_ID_RN:
> > +     case AMD_CPU_ID_VG:
> >       case AMD_CPU_ID_YC:
> >       case AMD_CPU_ID_CB:
> >               dev->num_ips = 12;
> > @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
> >       case AMD_CPU_ID_PCO:
> >               return MSG_OS_HINT_PCO;
> >       case AMD_CPU_ID_RN:
> > +     case AMD_CPU_ID_VG:
> >       case AMD_CPU_ID_YC:
> >       case AMD_CPU_ID_CB:
> >       case AMD_CPU_ID_PS:
> > @@ -717,6 +719,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
> >       { }
> > diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> > index 62f3e51020fd..fe3f53eb5955 100644
> > --- a/drivers/platform/x86/amd/pmc/pmc.h
> > +++ b/drivers/platform/x86/amd/pmc/pmc.h
> > @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
> >   #define AMD_CPU_ID_RN                       0x1630
> >   #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
> >   #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
> > +#define AMD_CPU_ID_VG                        0x1645
>
> Can you see if 0xF14 gives you a reasonable value for the idle mask if
> you add it to amd_pmc_idlemask_read()?  Make a new define for it though,
> it shouldn't use the same define as 0x1a platforms.

It does not work. Reports 0. I also tested the other ones, but the
0x1a was the same as you said. All report 0x0.

Any idea why the OS hint only works 90% of the time?

> >   #define AMD_CPU_ID_YC                       0x14B5
> >   #define AMD_CPU_ID_CB                       0x14D8
> >   #define AMD_CPU_ID_PS                       0x14E8
>
>



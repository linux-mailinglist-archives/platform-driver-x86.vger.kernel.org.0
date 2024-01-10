Return-Path: <platform-driver-x86+bounces-883-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2F827B9F
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Jan 2024 00:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9C81C21A14
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 23:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814345645C;
	Mon,  8 Jan 2024 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9xXHPh9"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D4611A;
	Mon,  8 Jan 2024 23:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97107C433C7;
	Mon,  8 Jan 2024 23:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704756785;
	bh=huX0SMEBlPdt6J14Ce6Q9C1v+sDOT6c9HCdktumcX7o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=P9xXHPh9HmpJJG8g2lH4JSRYF65/CfByoiB8E5YIY58GKfT8koywtNEMTao0eWawS
	 1AwsEB0Z0GsXZR08854AwuMsuJLAc/z+3+hcbMjgYiajmYa5fItrxwhabbywUM9aZq
	 sZJsHF6NdsC11m0aXxe3or5pVQ0MkDC1uArqMOD6CWh+VbafaWgDgVHs/PGGwBJYyN
	 A8HbND90PZKB+k9+4L4ZGliTD/DBBborWIvR2nGOd/5PVSlEFaVWnuQdMjio6AJtck
	 TzWlqegAAAygShkSvn15RtuAMWzEYDUG0jL2GOPmxbIymOu42Xn1I2DKIiQcFBrpNT
	 JydyJAL+f4bGA==
Message-ID: <a275f9b7b0b8fc9b2a65399b080c2f6c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240107140310.46512-2-hdegoede@redhat.com>
References: <20240107140310.46512-1-hdegoede@redhat.com> <20240107140310.46512-2-hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/5] clk: x86: Move clk-pmc-atom register defines to include/linux/platform_data/x86/pmc_atom.h
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-clk@vger.kernel.org
To: Andy Shevchenko <andy@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, H . Peter Anvin <hpa@zytor.com>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Johannes Stezenbach <js@sig21.net>, Michael Turquette <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.de>, Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 08 Jan 2024 15:33:03 -0800
User-Agent: alot/0.10

Quoting Hans de Goede (2024-01-07 06:03:06)
> Move the register defines for the Atom (Bay Trail, Cherry Trail) PMC
> clocks to include/linux/platform_data/x86/pmc_atom.h.
>=20
> This is a preparation patch to extend the S0i3 readiness checks
> in drivers/platform/x86/pmc_atom.c with checking that the PMC
> clocks are off on suspend entry.
>=20
> Note these are added to include/linux/platform_data/x86/pmc_atom.h rather
> then to include/linux/platform_data/x86/clk-pmc-atom.h because the former
> already has all the other Atom PMC register defines.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>


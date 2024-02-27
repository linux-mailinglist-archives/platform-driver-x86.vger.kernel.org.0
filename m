Return-Path: <platform-driver-x86+bounces-1626-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D929868FA1
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Feb 2024 13:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B53282AFE
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Feb 2024 12:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D9313A258;
	Tue, 27 Feb 2024 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bluemarch.art header.i=@bluemarch.art header.b="Phd3rW08"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEA13958B
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709035495; cv=none; b=XXxSyvGGmLxBqTBCNu72teNI9GxJXg9r2rNGukKSawsAyYtWL6GgxBsCKAXlQDnX2b7UU1XkDcR99Xu34Zwe9Iim4HemOCnYrkos8iquxo/NBuo4cyT1GVX9qUsND+WsR2AOv1XCaXcAAweidjbr5KWLvtaYcEz68VDab9++oHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709035495; c=relaxed/simple;
	bh=ucpK68cRYPMU8ItBXF65C5Zys1YQIbkV0cTTU1I/8y0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nuF47Xp0c4P1EO9QjumlMzB5xZoFBbeE28pL80joK/s2U0J40RdYAFVLMuZC2o48nXeewxHCs7Z3G2M5eZFq8opRM69oxBvoyBCtLBQFP7J814CR1kyeFm/hyAPZYk/M8YHX+HyDzjGvHVJm64hzE1t3e8fwjiQvLS7Acywalos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bluemarch.art; spf=pass smtp.mailfrom=bluemarch.art; dkim=pass (2048-bit key) header.d=bluemarch.art header.i=@bluemarch.art header.b=Phd3rW08; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bluemarch.art
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bluemarch.art
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bluemarch.art;
	s=protonmail; t=1709035489; x=1709294689;
	bh=ucpK68cRYPMU8ItBXF65C5Zys1YQIbkV0cTTU1I/8y0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Phd3rW08g6sUZC0v3azb8ZBIJAoKzFmduCxAfBTh1YlkCHX0DO1cMvHTmvvBhEjy3
	 /KzXJyOdmvWpxXXtRHXFDxHfTAwheox4aiIX03kq9KjotSLe6JaBXluBwW+/t6xvAU
	 dlRDKbdy9OtaXuq4wtVuQS1zaKyItbbDbyTcShQ7YnIRDOXE7+1vl/EZXUdoThxImx
	 gB+LrpfGPoTjwkSxKz8nE4OaZnoIdvToO7FKjQZMZm65fAAroj2QxboYpFsgxAC6iJ
	 /9rqiBWUjnygFkbWxukaT6hwwnaUFUd2fUY7On1R6gDJ0z1jdNWUpmyC5rx1TwlMPN
	 AN5VKZ7QmVwuw==
Date: Tue, 27 Feb 2024 12:04:30 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Szilard Fabian <szfabian@bluemarch.art>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, jwoithe@just42.net, Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de
Subject: Re: [PATCH v4] platform/x86/fujitsu-laptop: Add battery charge control support
Message-ID: <Zd3PxsHQEOQrf-9I@bluemarch.art>
In-Reply-To: <a4b35e55-1f29-6c98-745c-df6896e49270@linux.intel.com>
References: <20240129163502.161409-2-szfabian@bluemarch.art> <20240129175714.164326-2-szfabian@bluemarch.art> <20240207023031.56805-2-szfabian@bluemarch.art> <20240215203012.228758-2-szfabian@bluemarch.art> <170834440647.4050.13047961348645894978.b4-ty@linux.intel.com> <a4b35e55-1f29-6c98-745c-df6896e49270@linux.intel.com>
Feedback-ID: 87830438:user:proton
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:18:16AM +0100, Ilpo J=C3=A4rvinen wrote:
> Hi,
>=20
> Can you please take a look at the two build failures LKP has brought up.
> They looked like some depends on and/or select clauses missing from
> Kconfig.
Hi,

Modifying drivers/platform/x86/Kconfig to include `depends on ACPI_BATTERY`
in the FUJITSU_LAPTOP config block fixes the problem with gcc. I think this
should fix the problem with clang too.

I'll post v5 with that change in a moment.

Regards,
Szilard




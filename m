Return-Path: <platform-driver-x86+bounces-13153-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0350AEEFF2
	for <lists+platform-driver-x86@lfdr.de>; Tue,  1 Jul 2025 09:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01CCE3A6C0A
	for <lists+platform-driver-x86@lfdr.de>; Tue,  1 Jul 2025 07:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B8225CC42;
	Tue,  1 Jul 2025 07:44:40 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B919CC39
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Jul 2025 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355880; cv=none; b=H2YvZMo5WZS1suajsmnpaNt5f/pVHvkrPWGqPVvd5IlsIJjBfdsRl1HRS2TzMYIDa0N80qK8G3QWSDSiFFL8yRhUjI8V9qe/i9lQtIHivpHCATMR8x02M0FXzOiFXqtSuhShcD2Tkf5MKREKVtJscRsJtwcYaFogXyQ6gBQdsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355880; c=relaxed/simple;
	bh=Cxn69TnjAPE0GdI0pXrTeAGxsx2W0zjBbaSS3L/fCvw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEdkm4kDOPL6ETarn0gE622bBP7/T5Vqic5t2AFxpzrDmo5liMB0Zu5fqklZrQGkCZ/ux03B4v2vIrsFYL82eC6HiEhfctDHKWKln17QJFVLIHXk/bLAJcqbbniMGQejRSAt3L1EKdIc/zv9GGVvZ9BSImkeRPo0RRiebp9WK0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se; spf=pass smtp.mailfrom=benis.se; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benis.se
Date: Tue, 01 Jul 2025 07:44:25 +0000
To: "Zhang, Rui" <rui.zhang@intel.com>
From: =?utf-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "W_Armin@gmx.de" <W_Armin@gmx.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
Message-ID: <uWQ7r_hhvTbLE0QDEfkt_V2Mf39SRnexnRQCZ8lrUv3hDKfAK1jpr5AeVug8wBfz3cDhu-bYnx9zvCoU5Ch-AMaVlQHwqPmZgn3a4OMRek8=@benis.se>
In-Reply-To: <65f3a229f70279ab0da7efa878b863c7798d4427.camel@intel.com>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se> <GXC8NQl6AY_N7nQAOCRLt7SDGjFNll_TnqQyzYnP_b1weGkRqITOR-kHKcM66lPonOCo9xO2nSWXr7yycwfFuKmjRMtXVlJKya8-qvvkGik=@benis.se> <de8321ce-e595-460a-81d7-f7dae8a7b790@gmx.de> <X-40AqXfdmQw5shUOk3VSaHSXmwJYWHPmDDMLyGUH6GpMt56ty5SbNg8EVfyI_uC9J07uqZ2TtGJmmpB_x8-xpcVOw29fnKzJZ4n9L0x78A=@benis.se> <9439ec38-aadd-4aac-ba51-a8786ba50239@gmx.de> <3b25e59bc1b162ee8f43ffbd3c50589a52d540af.camel@intel.com> <rFJU7KbF6iq0CxJtSjPu4vLVjWata5hY1Kl-wOv253p0C2W7egJQQrkUnkSqmr1vXDXeTwwtwp0u5ZnQU6pZmPuJ7TnNBVgudMG-q5MRHyM=@benis.se> <c6Eep72y6E7gc-wUMdcIS9JfNN1_OBjlwGUrd4yGvp2R-PW2-OOoQngQt5H5kiZIccxFAPswaN9G6wVpHuewtoEvUkT52UCzHPibVJh7iYY=@benis.se> <65f3a229f70279ab0da7efa878b863c7798d4427.camel@intel.com>
Feedback-ID: 18592338:user:proton
X-Pm-Message-ID: fa054de96c72ff342f431d3832c0c3dad96f0033
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


On Tuesday, 1 July 2025 at 09:02, Zhang, Rui <rui.zhang@intel.com> wrote:

> > > > how do you suspend the system? and can you attach the dmesg output
> > > > after
> > > > system "suspended" and resumed?
> > >=20
> > > Will test later!
> >=20
> > https://drive.benis.se/s/sBZSFGAskp7YZy8
> >=20
> > I hope this is correct.
>=20
> Yeah, the log shows the system indeed ran a s2idle cycle.
> But there is nothing suspicious in the log. The ACPI errors should always
> be there no matter if thermald is activated or not.
>=20
> can you please do the following test?
> 1. make sure thermald is not activated
> 2. do a s2idle cycle and make sure that there is no fan spinning
> 3. launch thermald with --loglevel=3Ddebug
> 4. do a s2idle cycle and make sure that the fan is indeed spinning
> 5. attach the dmesg output and the output of "journalctl --since=3D-1h |
> grep thermal" and let's see what changes thermald has made.

with thermald
https://drive.benis.se/s/bF5AfDGBw6DFNZt

without thermald
https://drive.benis.se/s/47xJdg33ayHerDF

journald
https://drive.benis.se/s/8JdDJG2bFbHeDmz

I hopefully got everything by your instructions - otherwise let me know!=20

>=20
> thanks,
> rui


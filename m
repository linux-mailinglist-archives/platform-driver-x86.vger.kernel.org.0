Return-Path: <platform-driver-x86+bounces-9171-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA54A25DF2
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Feb 2025 16:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B99947A13EE
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Feb 2025 15:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318DE20896D;
	Mon,  3 Feb 2025 15:08:28 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168EB205AD5;
	Mon,  3 Feb 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595308; cv=none; b=eA4niBEO95C0DO0xVGdvXvgqFxnNH9I4DR2oCbFNdVvd1WsmA5oe7r3OrlyLNdTZG5+8gEx+XQtnE5EEuzze9CzYQDQBPw6H8odBQxyYBgudwH2cSQLLcrpSPH+Hg1JJNBnmKkM2MfREmCnIxiTk+norBr9spp1UX1G1FClcOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595308; c=relaxed/simple;
	bh=dKO5GkWUZU5gayOisHhrMC45mTSknVbvwTp14gr4dqk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ru01a22i8upr0ZZ0WIJ8MdlH2zm32eQNTO88f0aRHFo0G2xXCKPAJsPl1mZCXL6eSuDGyK++jAnzVdEH5Yrwc5PoOrqnpoVeaXMhL1NghEI4UMCNIByDdRKPbhlLurqQx8RJKahb9dCMZmciyEEeZdfvh03duWmUrEFDU1TQdms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B93C4CEE0;
	Mon,  3 Feb 2025 15:08:27 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 4025F1807D4; Mon, 03 Feb 2025 16:08:24 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250130140035.20636-1-hdegoede@redhat.com>
References: <20250130140035.20636-1-hdegoede@redhat.com>
Subject: Re: [PATCH] power: supply: core: Fix extension related lockdep
 warning
Message-Id: <173859530425.32012.15699999203802341443.b4-ty@collabora.com>
Date: Mon, 03 Feb 2025 16:08:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 30 Jan 2025 15:00:35 +0100, Hans de Goede wrote:
> Since commit 6037802bbae8 ("power: supply: core: implement extension API")
> there is the following ABBA deadlock (simplified) between the LED trigger
> code and the power-supply code:
> 
> 1) When registering a power-supply class device, power_supply_register()
> calls led_trigger_register() from power_supply_create_triggers() in
> a scoped_guard(rwsem_read, &psy->extensions_sem) context.
> led_trigger_register() then in turn takes a LED subsystem lock.
> So here we have the following locking order:
> 
> [...]

Applied, thanks!

[1/1] power: supply: core: Fix extension related lockdep warning
      commit: 64dd6edfc421479e416301c48b79cece8d0351fc

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>



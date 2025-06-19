Return-Path: <platform-driver-x86+bounces-12849-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A563ADFA61
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Jun 2025 02:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0754917F34C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Jun 2025 00:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147CA5789D;
	Thu, 19 Jun 2025 00:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBD5XHFx"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152B2111
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 00:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750294345; cv=none; b=bYHexpr7CK0AIYv/qYlOZA72jnsVYYSqQIFLrvCz+C8kyfY6oLBCb85y5xwvYzZYlVH1BdvHP6JsqCxqeB65ehLuRW7L7erO39fjc5zGHy5tcEMEqvRX1N1Pylnb8iCCZ4wRSir05CS8rJ15D7VQrwRWA+HDP1+AusLkKASuGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750294345; c=relaxed/simple;
	bh=CTnvukdGw9GPdwsCqMByPgIIJt5aAM3NdGVe7gJi468=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bGsc3Wv7r0ZSZTUkWOAvUNqDBQTbEbEzmnQdJ6UdodWqHDrqv8qV+o6Dsa3txLyadtVEk2V8zLwB17b2v56PTAghRN2TkZkM67GdTirKKw8RbHTSUbSfnWAgc0FcNowypAuxXD+a2PnALN8dTMJcin/ZncWem4XXHY2rOPvuL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBD5XHFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 856BCC4CEE7
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 00:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750294344;
	bh=CTnvukdGw9GPdwsCqMByPgIIJt5aAM3NdGVe7gJi468=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sBD5XHFxks7M87Vtr/eOwvTC6XiNbaGZCo9U6/9cpLJOPHQ8/T+kHiSVInr3F5KER
	 DNUPfMIH9U3m7D3exMPwKAUgJAtAhL2bO68WPl+K8uYNZCF+8T9OcHZqjscascJs9U
	 9qAorI2X5rJsAe/HVJKPQzazD1OnflPFS51INXJRpyZhR0xH6VDVQJl+pxjRgyRxP0
	 zdNEVrwSl2uhWWYpBOO2uDawc0y9vuEN13LS54Etoxj6wjMek+vk3Qo23dwYGKN2Zv
	 PFiiQvp/Y+2a9p/C4DCmS0Jk4KSHqCPreOKJKK47k9vROWxoPli/73cl7VxfPxIiMi
	 rYALPyvW3dhXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76610C3279F; Thu, 19 Jun 2025 00:52:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Thu, 19 Jun 2025 00:52:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-JM9oWml6vk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #17 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
(In reply to Armin Wolf from comment #16)
> I will prepare a patch to fix this, can you test it on your device?

Sure. Hopefully tomorrow I will have a chance to do it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


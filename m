Return-Path: <platform-driver-x86+bounces-13396-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6074B073D6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Jul 2025 12:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4454A18888FC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Jul 2025 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D6522F762;
	Wed, 16 Jul 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/Cd1m5m"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16F2E36F4
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662781; cv=none; b=PDl5Oj5nLOll3Y30PNrrcDk30KAmSwvDHZ+fCgZEzBTLQ77sk6A06SPwDIcYc12WK1jIP8Wjl7PJDLHqCwe/z6kLONo9BcevjrS50E7zSvmKgBHjMJfat3M7MySNYUWJ1tM6/iX6HNAcEjvdMpkJz8GNSRr88W03yJXn5ymkHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662781; c=relaxed/simple;
	bh=m7w5FXXePLMXj1fS3pRb4LPRMGYQ2QkTgXge66+VeKw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EIwPUTTU6pY2+1pNz6EBsf1VqiNxZjGY2jw3TyxqvUqbND42ySu8vcSAo0FhYxfUhlBiLz+7fn2+bJVA+1kMC2VP9syoGJ1ISPNzvxKhZA3Wp3KCGeRkY+FBR9ldCuCiaumIV04z+PVU1cmEUXsBaDvziqpmInroIUj/ELeuPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/Cd1m5m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61AB6C4CEF8
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2025 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752662781;
	bh=m7w5FXXePLMXj1fS3pRb4LPRMGYQ2QkTgXge66+VeKw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z/Cd1m5mFLFGbcQNfA01fNOXOZZkTkdAmAdJt0CMW7S5nkHwLiHmQZ+fLJ3Ou8t+Z
	 HOVV8M8z5ahULURiKUM+F2sINPeUAi1BVgnevIrMsTOuYDTggC4YEeXHF6l7EfGCjy
	 HB1ZQk/bRHj1ASu5EGN0D1xqU2YT5BCsC3rVtUqDbSzs6PMZiUP0KJiCcLCfVhNSz3
	 BogBuXdQluptv0ZJinz9acQiUSKsfg4rZoO6wwjpIqTzdvwUFpQvgaO6W/rANg1Sby
	 qoPNNpi4ed7VusbQbU0TPpLPrJQXQYfaUfTuLAbFLrws3l/e5p6RUhwxwMH6d1Dl9C
	 m7LxhTUKBVJkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 584ACC53BC5; Wed, 16 Jul 2025 10:46:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 16 Jul 2025 10:46:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kernel.org@axomail.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-CLQCRIQBi5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Henri (kernel.org@axomail.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel.org@axomail.de

--- Comment #95 from Henri (kernel.org@axomail.de) ---
For me, the patch did not completely fix the issue. From time to time, I st=
ill
experience my Ryzen to be stuck at 544 Mhz after unplugging it from the pow=
er,
while sleeping.

Laptop: HP Elitebook 845 G10
Processor: Ryzen 7 7840U

OS: NixOS 25.05
Kernel: 6.15.5 (linuxPackages_latest)

I have also run (an 4 month old version of) the s2_idle script, with the ou=
tput
being here: https://paste.debian.net/hidden/a701167b/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


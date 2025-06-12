Return-Path: <platform-driver-x86+bounces-12696-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F05AD7D90
	for <lists+platform-driver-x86@lfdr.de>; Thu, 12 Jun 2025 23:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E00201888EAD
	for <lists+platform-driver-x86@lfdr.de>; Thu, 12 Jun 2025 21:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BEB2DCC0C;
	Thu, 12 Jun 2025 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aURUAm4E"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFEF2DCBFD
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763693; cv=none; b=ORdL9aGTwTKfwj83Msz3v2ZMZl0KC85Xuc4PrRFWl1NuhnEe5Bz8rLiha/uj7vi2AZu8a5r2tJvK34ZQhaa44HMKNQxoaPQ5NaXc3QdOlpDJYAatE1k5uI6hyx4bhIR0Dtn3ppsklYClwfmHMh82IY3fkXrUQAwUaIGBk9oh9g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763693; c=relaxed/simple;
	bh=2E6iRU2z0kl+Pf0qzX1zloYFiduCtnj4WGKD1nFZIEM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jRO7p7JDA/cLcZoadTBTXdbR50s4GP5rN0l5YH+8TAbrHbQMH/o7BntvC3tse0KQzeVIcG55G90oN8t81qxYxrK6LmcjU5V2/l8/uykJzET6u9Jvd0C+b3i+SAVipWDKfO0PM6aquNWECM7YRstWBTM0FnkJbiCpjPPUmW5dI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aURUAm4E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D28DDC4CEEA
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749763692;
	bh=2E6iRU2z0kl+Pf0qzX1zloYFiduCtnj4WGKD1nFZIEM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aURUAm4EW8Ug2fwlhqK4DJV2SLfRq2+C2+PzUwpSclR+zN2GvbXpafMC635SFPnTm
	 N+mCbvaJDPXZ74WETAo24yeWlHZM8oXr8DeJMEytviA9jU54o1OfsJ5nVfXB2tx1/O
	 okGOmtZsdwRYqKyyoXAYs3LUnxDC1/YJblwaxtivC/SHJGR4M92qjt8/VcEXnSxVJD
	 yooz7IAFumcwOGQN1UE3UXiag/XdNJbwEfOwQIZ7ACPDlrR6yedLuwbE2nZGSco85Z
	 FGRCJIhp4epjY9yl0APqRHDoaOAruw/8TK1s0ihgH8aXOI0Hirg6KyETFvMSoz8Y+g
	 BFihGeUQPUD3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C8746C3279F; Thu, 12 Jun 2025 21:28:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Thu, 12 Jun 2025 21:28:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-K09iVNZ0kE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #5 from g.molinaro@linuxmail.org ---
### Errata Corrige
The LTS kernel version in the description should be 6.12.33, I forgot to up=
dade
the boiler plate...

The system also worked fine with every 6.14.x kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


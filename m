Return-Path: <platform-driver-x86+bounces-13077-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C1AED326
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Jun 2025 06:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A763A9DB6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Jun 2025 04:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB011624E9;
	Mon, 30 Jun 2025 04:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9wRIPWh"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757911185
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 04:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256201; cv=none; b=UlCuqYbXgJFeU6wx3WZoyK1OdeW1406165TeB8WN4VYELsbjMqWtNp+rLk5qWFG701S5sXAxeAexOQv1Y9eAeN2IEHa/6hQ8g0UGzTL9o7OQfOr31blydDP/U6jq24/hFws/rJnKHp/W+DQ7cEVCdbPliI/wHqnlX5MZXHlbb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256201; c=relaxed/simple;
	bh=fQA0DTBtyd8Mg8C5bobWyYxwGirMCjiCi6jjVRdMTSQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jyzGhtjeN3JXzmWEFX6m4tfih4PbqdJAmcCmJE+8ADcl1Rl+HQAUwXwnrGYfXf/W/ofL+ngKmCJ9xzaEj+ZTaJZSKsNgNhFktmGJsEg4zDfM/QeiTDSmkApopgFxwigFr+1fyJbS+mGdkebPPgcklPAycwUp0/9WyGf2oEBF+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9wRIPWh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0255CC4CEEF
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751256200;
	bh=fQA0DTBtyd8Mg8C5bobWyYxwGirMCjiCi6jjVRdMTSQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h9wRIPWhexxKDGZ+YyAoXrxNi7olw3EYDlGmsxpeaQlmGAC4KkPTrEl55cl6jWABa
	 cNoW50DdQR9Ri9akGkspSHSEYRO//eZn5c+3oISbKoM+nyEHEZuPZKbzFGXl4k13wX
	 gcqmBbmKy77Ag24+UDb/CMTBv5bLvdZ/S2li5usYgxrRVteEqttwbgOoUK7VJIt0MW
	 SshotJkpu7bl8Kzk0aChq3n0R7jgqMyaRgj/tHjeVhS/MADqEDYQRbnRC+8mE1PiAC
	 dl5Gt2sMq7yC3TUVGRzCwWaPu+8aVGPwCUjr7gY7d+uDgVgtZDBJhk3Q8p2ouTITFu
	 sOcCmwoQMTitw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E670AC3279F; Mon, 30 Jun 2025 04:03:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220290] Samsung Galaxy Book Pro 360: samsung_laptop module
 fails to load, keyboard backlight not working
Date: Mon, 30 Jun 2025 04:03:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kuurtb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220290-215701-Nxb1YV2XA6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220290-215701@https.bugzilla.kernel.org/>
References: <bug-220290-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220290

Kurt Borja (kuurtb@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kuurtb@gmail.com

--- Comment #1 from Kurt Borja (kuurtb@gmail.com) ---
Hi,

Can you please paste the output of:

# cat /sys/devices/platform/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


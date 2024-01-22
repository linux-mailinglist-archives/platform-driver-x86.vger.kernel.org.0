Return-Path: <platform-driver-x86+bounces-945-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2FF8359B7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 04:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D12461C2074A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 03:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B044A15CB;
	Mon, 22 Jan 2024 03:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SD75Wg97"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD997FA
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 03:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705893736; cv=none; b=aQ/cZZwnFg1PBQLcXTjjl8xOL9xywytfDZICBZl3eAK7Vk3qaiBH8JXpzEsYmt+dTMYe9sEkckDjogIujN4m+UXhgEzjzIgeWiWbVLAa0R9WxSAnZDf+qCfkCoxjKXoBo7Y3deNs0OqTr6FNLNxaorqtIAyVhKJVc2YtDgaHiQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705893736; c=relaxed/simple;
	bh=4N/kR+ym8+eBsPMdV1vvYFfrV4x/L3+88hY7p96FNCw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iweLKiEO/3n5iOXcZgHWqV1dojv15KHXacPeYtCWkCRdQi8QfllYNOGOcuv2Q7hVCTTMtLggo1xmLmCWx0K4apGcVcKwSw6Y3x5tBtxi2oXnrxqdCBEZkaz7WU27ty7sxnxF8P30F3m/n+zaLJepCj5qvVKnxoNzTh24IjZIqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SD75Wg97; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25476C433F1
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 03:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705893736;
	bh=4N/kR+ym8+eBsPMdV1vvYFfrV4x/L3+88hY7p96FNCw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SD75Wg97hyLoDV+ZFRXrhjQlrrwQf62AmTMAa3mUgcCjfBlKRWTJUcK8ld0zOufLo
	 OIlMorLEF9zyB4+4DrlA6GjevQf4eotEQrqUX6i01JKGX+MbpQ4cEvl8ehhmD/NUoj
	 27dC5gf6JRmspxonZKKYIAIZNlcAy372qpVbi5nDH8su0bzEmoKyDB+Gk/CkALTim3
	 yPvE1aPjINu90k/R1dEMad42CnQuG6b9huCWEdfrJncUmvyzirrYbmgatr4eg0DWI8
	 2Cvw7gro0QO4ORuJZhsqYi25juczx41OWW7SOMwKfSCWn/k2E2IAe+aZFzl8wTRFfZ
	 Hfu+1B+8EDabQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 09508C4332E; Mon, 22 Jan 2024 03:22:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 22 Jan 2024 03:22:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-hMhV1PjqBy@https.bugzilla.kernel.org/>
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

--- Comment #24 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
That's great news. Everyone who feels comfortable sharing your email address
feel free to reply to the post with a "Tested-by" tag.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <platform-driver-x86+bounces-957-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DE8836FD1
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 19:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A0628A5EF
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 18:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B534F201;
	Mon, 22 Jan 2024 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5l59oGi"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F234F88A
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705946058; cv=none; b=ajF6gZiXhKVhsqkYNQ6E9kh4rWI1AU2WgwTT5KosKeNzqccWfdGG81aZdrWKb3zSsVODzMAp4bxdp7dUI9a1bm+qQiw6vNvgeuQ835LVqy7N5zIHxlyQGsenvp63kF09L9n9aKKQWhPiwHfNOBkaXHkoK9GN9yFQFUbmkbZfAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705946058; c=relaxed/simple;
	bh=qPPMrFJCEzXuLcdhT4AUeZHHUDHcLBSBJScTdJyzx+0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C7CSvqSw6WCMVEPjtiftX46mgr3JbOIWr1JNsRhjss2kixKi8PyPt5PwiYQzNSLQyh0uhk9oXh7LuWcIv1xVGrGg42voW8fQHjF7Y923ndHNmA0zeIqkAn7Mlf1Z2Wh28LDmw01xrcyZUVOy5s1hz4tHBbvltolVLsDn/ZSzgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5l59oGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E794C43394
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705946058;
	bh=qPPMrFJCEzXuLcdhT4AUeZHHUDHcLBSBJScTdJyzx+0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O5l59oGixS/gzxPrx3QbX6sDpz2chGjQztIp2Nd8cR2wSBKsmjH13WMafyOsc1S/M
	 HPVkuUd3rkpbCMlMTsIDMaya+iqjXVn557rJghQ3j1hqqrj36VgXegnuGYog4T5gUM
	 dRtcein6ibicE8NapXowfS8lZPMDDAgCP3zsWuXt6Zqk/g3H7n/eZzrxaqjdNj5zAg
	 1GoBPN7iHJ+C2zL0Kru9SVgrIasYP+3my44XVs8MTVaoCPjz5Hz7h2XtieSEzGCovz
	 MYuaCN5wGft05SgSeaaOgWMgb8ns9gV7nr8VxX6TPWspwYNIsEozZ+ak3OJ6By/QFf
	 EBLHqxIScQIjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E4D97C4332E; Mon, 22 Jan 2024 17:54:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 22 Jan 2024 17:54:17 +0000
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
Message-ID: <bug-218305-215701-cOubCuQJwN@https.bugzilla.kernel.org/>
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

--- Comment #26 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
No need to share MSR values anymore.  I believe this this is the correct
solution.
If there are still problems with it they may be a secondary problem.

The MSR values are a little difficult to properly capture because each CPU =
has
it's own register value.  So a proper test would need to capture all of them
for all CPUs (not all may have this problem occurring).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


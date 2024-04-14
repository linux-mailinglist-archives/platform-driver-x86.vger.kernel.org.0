Return-Path: <platform-driver-x86+bounces-2668-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A8589CD25
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 22:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39AEF1F2244F
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 20:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC6E146D6C;
	Mon,  8 Apr 2024 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlU0Mvjg"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2C1EB46
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712609892; cv=none; b=eqJnAbmVH41rHUgUjr0Dv2zqzFOq08yM97+sfNmJ6Xg6Xue/9eDLlJ32q82/jtg3nbqIynUDZ6NUhclszxFDw3X+0gEc/WtBiplR+Ht6mxP2XBxGBZwelq5d0KLoxHOlbStA/ah3ZJcM4adk3L4H39I5Ec6JdL1CleEwzApZiQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712609892; c=relaxed/simple;
	bh=vm9zp4ah1YH7Uv+Bn2wres4TN6Gy5ovJQlQ4F0liC14=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JX00iYylCnRnOL2NPbdFdSDOGUGiwvhWKUh2TsjtHMYXOhV4OxYzRk5/xC3s0khRSDPen2h1jvOF7SaYqDdxmWhVIRFYnCdbSmxzeZv6Ty0+09bqz7GSxJDPw4nGrpPGRlWcGCV+n1FXhhNFMhY8FfJkUUDWwG1zyoj+IBA6B3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlU0Mvjg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1126AC433F1
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712609892;
	bh=vm9zp4ah1YH7Uv+Bn2wres4TN6Gy5ovJQlQ4F0liC14=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hlU0MvjgGiu25O4ALv+SLI7Nyird7lksP0R7w7T7+DuUFLzkcl6pk7zZClXuS4g/P
	 ajyBRrnUbUrXC/5sLgehubUgtDODmCYFtCRdvgUZNVVe9L4j+p8J/fA0Wqw/6GIcu3
	 fU+l6fsIJpTnwvCo4nP+3MkYiutLdR6gZEZ6onf4NHro3P5tk7LYK66bOJ6LNHOYtU
	 2r+FeuGkEvVdHY/Vwimbksvs2NnPboVUq27EuBVUFIMjOiNoAJdyVL/PPR1Jr53D15
	 EnDWe1cjZo/ZQHpn/WE2LwUCZMaazV8Qnvdb2NjNAXfRhk31G5Meg+eXNXPRW8UgJU
	 CHcd+uHUgPC8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F220BC4332E; Mon,  8 Apr 2024 20:58:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Mon, 08 Apr 2024 20:58:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-218696-215701-DzQAe5H2p4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

Lucas M=C3=BClling (lmulling@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|DYTC frequency scaling      |DYTC frequency scaling
                   |deterioration               |deterioration and event
                   |                            |spam

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


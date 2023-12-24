Return-Path: <platform-driver-x86+bounces-615-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C15681DB02
	for <lists+platform-driver-x86@lfdr.de>; Sun, 24 Dec 2023 16:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A1A91C20B2C
	for <lists+platform-driver-x86@lfdr.de>; Sun, 24 Dec 2023 15:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA305672;
	Sun, 24 Dec 2023 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfIu51we"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C39566B
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 708ECC433C8
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703430216;
	bh=j6sVRfHbE+l1p/bsGALCQr8RREpxLzWSovPEId295kE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qfIu51weS/czpCIbhjLGhADpocxGs1UrG/zlYiCVE9gzCx2+P+R4Cx7Ni5MEHXC6d
	 EAwjs+a3Xfe9b4giUSLsWkP3hiYS1Jspk8yovkll5H6mtqO1vZ29XFM4FPo2rqhd50
	 Wo+qcNXkmN1vl+huUQnk2d7jWEzdRtH06Cttuz0eos9ExOH6pPy57wLpBdZELbuh1d
	 cU2eNJV+Vnl/At4vAdCCfbETjEzD2S72RvUmsgVe3aS0JpFewTJGKcUC4Zw8Spv8Of
	 q7ZKnZZIbCLSrWatLu+2htTOdte9ZkYO3Pa4caYuxcRwDXT+llxqx4HOBUUBugKcu9
	 /ZBKiubH6NJvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54FD1C4332E; Sun, 24 Dec 2023 15:03:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sun, 24 Dec 2023 15:03:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-Oti2sZ6Gmb@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #2 from Armin Wolf (W_Armin@gmx.de) ---
Does the issue also happen if you dont use ryzenadj?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


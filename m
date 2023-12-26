Return-Path: <platform-driver-x86+bounces-651-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32B281E7FC
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 16:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4B4281144
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 15:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A36C4EB2D;
	Tue, 26 Dec 2023 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtbWqYzC"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0C4F5E3
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 15:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86ABFC433C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703604327;
	bh=i9qDlb/ULrKD3XRadEmYdtIxlJE+vtYhRgXj+uVrz34=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FtbWqYzCxtPxjlun9/bOFH/E3QsVKWPSF7cD5qqpNz68bgw8IQR3Fx0K71uF9Nkiq
	 5zKJwvNPg4LwDARSZY61EssKH/TL7+9F8BvRUQEjdIv/QR1pgKMZBbezKwlpt2oDZA
	 Y3yhUA/nOSIjtjnyXpBtF/mqNP2k6UT8nayZydsH4Q7k8hltre9k4SjMhKuZ6Es79w
	 qh4v0y6RosJiuVw11bc/5XspxvTqNsMN7VZ30r7LwNWwlRYTfrj/ecscI+8gJej0d8
	 /qXdJ+bLli7ONqQVP9/cAycBzgoU/LS2eErBZxwij8YlZABsFZNswTOob18dKhX5Bx
	 3kVQFF4FWLpRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A534C4332E; Tue, 26 Dec 2023 15:25:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Tue, 26 Dec 2023 15:25:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-yUtYU93DTa@https.bugzilla.kernel.org/>
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

--- Comment #11 from Artem S. Tashkinov (aros@gmx.com) ---
Created attachment 305659
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305659&action=3Dedit
The contents of /sys/devices/system/cpu/cpufreq/*

Switching between power modes using
/sys/devices/system/cpu/cpufreq/*/energy_performance_preference does nothin=
g.

The exact per CPU frequency stats:
# cat /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq
400000
544395
400000
544099
400000
400000
400000
400000
400000
544189
400000
544181
400000
400000
544007
542947

No idea where 544MHz comes from.

BTW here's another bug, either firmware or something in the kernel reports
wrong max frequency:

# cat /sys/devices/system/cpu/cpufreq/policy*/scaling_max_freq
5137000
6080000
6080000
5764000
5764000
5924000
5924000
5137000
6080000
6080000
5608000
5608000
5293000
5293000
5449000
5449000

I'm not aware of any Zen 4 CPUs which can run at 6080000KHz frequency by
default, let alone mobile parts.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


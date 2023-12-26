Return-Path: <platform-driver-x86+bounces-652-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10081E7FF
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 16:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC231C20E27
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Dec 2023 15:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5F24EB35;
	Tue, 26 Dec 2023 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIIiO7Km"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BEC4F5E1
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 15:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 990AEC433C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703604587;
	bh=XVGiROCDZPU+e3eDCbi10VZPKKO18OF+/ytbQzpdm4I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qIIiO7KmTjI+W12BWd6KZu4PVv61W3vaBnChF8kl73AT6PQtbr9279py9bZnNnx8Q
	 0FVLG84qOGN5eTEtKmTbU9TmsbxmZqEloPut1ZNG4Ew/HU6SgKOG3vQTSlLLEdwEJL
	 W2z/c+fqYWAI8X21ElMwI5tovyPQOHBu6eG8WS2BU9yFtxJoXguhRuCDPaKzZL0zzu
	 iDuBX45QQFGaRNKaXLXZry8K0Of8174ppZhxuyyKkpP2B8WA7i2ZiM84md5spJIM8S
	 uOsUl/E7aVmiaYFe/67a2BEnstYDlRBxfB/ecgBDF75GyV4jGk34JkjKIG4aP9Wir9
	 Usa/tihmxQBFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 819F2C4332E; Tue, 26 Dec 2023 15:29:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Tue, 26 Dec 2023 15:29:47 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-tsqdNRnR7y@https.bugzilla.kernel.org/>
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

--- Comment #12 from Artem S. Tashkinov (aros@gmx.com) ---
> BTW here's another bug, either firmware or something in the kernel reports
> wrong max frequency:

Max frequency is reported correctly only for two out of sixteen logical cor=
es.
It's wrong for all other cores. Would be great if AMD fixed this.

Speaking of my firmware, it's:

https://support.hp.com/us-en/drivers/hp-elitebook-845-14-inch-g10-notebook-=
pc/2101628462

> Description:
>=20
> This package is used to update the supported firmware on HP Business Note=
book
> systems with a V82 family BIOS. This package is provided for supported
> computer systems that are running a supported operating system.
>=20
> Fix and enhancements:
>=20
> - Fixes an issue where the Performance page in AMD Software: Adrenalin
> Edition does not display correctly. - Adds the Gaming Optimized mode to v=
ideo
> memory size.
>=20
> - Includes the following firmware:
> AMD Graphics Output Protocol (GOP) Firmware, version 3.7.10
> AMD PSP Firmware, version 0.2D.6.6C
> AMD SMU Firmware, version 0.76.65.0
> Embedded Controller (EC) Firmware, version 60.28.00
> Intel/Realtek UEFI PXE ROM, version 2.041
> TI Power Delivery (PD) Firmware, version 4.1.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


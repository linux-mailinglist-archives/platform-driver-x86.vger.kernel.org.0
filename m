Return-Path: <platform-driver-x86+bounces-14180-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB2B7D524
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Sep 2025 14:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E5EE7B22E3
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Sep 2025 22:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFE2329505;
	Tue, 16 Sep 2025 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJfJdVch"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068A4323F7F
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758060865; cv=none; b=mEHElLR2ty3HHXHs7KOFRTH0YfYD/0LuNPPL6LLETRB0iwBI9s/4qHuMlmbXnBPz3Em6dzU/YtY0AATRhD8uKeTlKEl/u0CrmON1pXzbO4YdMLVsZJ8o/wPccmrSpNgMftRVzZEOZm60p5YyyhC12wt1hvbEAdFjeSimbFrO9pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758060865; c=relaxed/simple;
	bh=R4PnQJ/70C8PYWCOxWIipU12iVgk1amu3jHArILEpNw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DvvTUXhTqNkJVohL58ha8Y+LfAnGKjpn7ZrdJnwQujf3nDTUFNByZiO9QEA+ID4cebhAqXIjzRbPSi6sefa/As0ibbFi7BIaxGaezih2PyeqSbye+JsbhVPv9ovn7CvXtH3Q2OzOhxyyL0QpXQncxSiBgTRZ8NfjMMuU84yJEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJfJdVch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 919ACC116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 22:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758060863;
	bh=R4PnQJ/70C8PYWCOxWIipU12iVgk1amu3jHArILEpNw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CJfJdVchfARNCYmqaolgsbqURCD1Vt49uXYgLlXmJ38GXfyn5pWOvniUhHe+RmkxK
	 srwCH0SLDgQrj1nMxG7e1kOVlezLYwVGRCSIDKsoNAsdHh8S3JieDORuEcSVSKRpMi
	 UUluzZqYSsZmOZnYbS/aqFMENtHvRB83O++yAf3r6ebbC8ouPfHJD8cw/v/La8syPO
	 XK1VLn5+woo49ZywWwnkK2Mpt5qirSPkdx/5oNDzMrHajji56S54oYTzx+Gyq9vcWd
	 5rSJ7JRYtdfFpfoRIZnLSaU/ZdlipV6zquiOI5WjuYz/kKD3A1wBXAEPQ0tKB1P/1h
	 K/31PHqYolfsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8612AC53BC5; Tue, 16 Sep 2025 22:14:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Tue, 16 Sep 2025 22:14:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-EmQwg5klFx@https.bugzilla.kernel.org/>
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

--- Comment #130 from M=C3=A1rcio (marciosr10@gmail.com) ---
Which scenario produce the useful log? A, B or C?
I can repeat that one as much as needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <platform-driver-x86+bounces-2705-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311789F0E6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Apr 2024 13:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2ED028BD92
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Apr 2024 11:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B86D15E5D0;
	Wed, 10 Apr 2024 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olUpPAEF"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3AE15AAD6
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748560; cv=none; b=ZFow9wycZ/C2V76yaYoHB8i4vrlQuJkfxuBGR4FE40ukShad3baC5yf3/FvU10JKRuqz9KRzjlkHAo35q4pTjrby6dtKHyxl9X4N7tVe3PE4jMZTw3opi2Vc2eN2heBZzpibtAYwm+4FKxjX8ijuXCvLzXcrdCeHVniinshknB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748560; c=relaxed/simple;
	bh=VC3hTDWGIM3PgMfVAawMCYItp9KENBYMEgmBhxPnMFg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CA9v+4kkGp8eUZ8Qq4bOg//XwVr0269ZQ8W57sZgbyP/U5U/djtip6GTQ40Srv2qWqmPXY0Ob1i7AitwzgulHntPq67xFr+z51yGJP9cQ2pwnjvmf6a4kmxR6cgaURWtc17BjdcbtVVMXsilfPaFoDhGucx9+TaYovl5pc0fvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olUpPAEF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69B1BC43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712748559;
	bh=VC3hTDWGIM3PgMfVAawMCYItp9KENBYMEgmBhxPnMFg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=olUpPAEF9tzHnsJeGGXrG7OLrQJnBGIhTHT7cOjTWGPypvfYTthxEqb80k4YUIPrx
	 dR7dVx300TI3FIvx+9oUkbVqJqnvCHQz17cjLIA7qXS7dGVyiZ0j+I9WaEJOFAzHrM
	 X+rovLbfsz/OZzTuJIkJLfaHisM6oauywgvESFrEUv+S7VGh7v8P3zwT2WkcExtb2p
	 9RphDqCTrOIeNwVwJAGg4ZEgX/AVG1kG5cG3qc1AXBSnQbPbP/YYqp1umhCLQO/U5g
	 M0aATx26+acY0ZuuoHTzKnmSmZWkGOvrRFYHslzic9l3+j4D6pdMUPhS0Dm9Ql4Bgw
	 KrYUscPojn1HQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 566CFC4332E; Wed, 10 Apr 2024 11:29:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:29:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-ZbQh7vWxPz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #25 from al0uette@outlook.com ---
(In reply to Mario Limonciello (AMD) from comment #24)
> And before we decide al0uette did you already update to the latest BIOS
> available by Asus? Issue still exists?

Definitely, I've updated to the latest BIOS(version 303)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


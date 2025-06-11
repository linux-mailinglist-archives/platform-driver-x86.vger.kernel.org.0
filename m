Return-Path: <platform-driver-x86+bounces-12680-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E2AD5A27
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Jun 2025 17:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0808E7A7359
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Jun 2025 15:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2521A3148;
	Wed, 11 Jun 2025 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOWEXWwI"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747019CCFA
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655191; cv=none; b=hwASW13+ezLAmkhBB+qlXAIM/sdbvz+wDYpy3v2vzFK1hgSCsD7WSeQualpA+mmsNYgl/EDaMSVtNLeLoVKu5Vj8uDxZyDxSB8rIgur3rWo7LxV7NiRr60UpeRtK9SFRXR4L0e3VfYoN6TLAnc5CczIwbtRjyjIgaqUPNtFkuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655191; c=relaxed/simple;
	bh=lASLLEF9L1j6RkmFHcCQpyWpb7gsiVkdhTKkdzvCtBE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbDJVO/gygOakxyGRmLw6ABNoB1WHWpUGXCpucNWXBiV/j0eW43Zue2J6+wujnUMptTd6KmM6Ufjx4H/DlZJDcEQfED66OGoB2bWm1udI4zOwmlappjWH3Hhl7IDl/OZQWEUTIXlahh32Mr7loPHBHAcV7gRJlpoW/xuFfoe7+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOWEXWwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22172C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655191;
	bh=lASLLEF9L1j6RkmFHcCQpyWpb7gsiVkdhTKkdzvCtBE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XOWEXWwIyQyGzk3/6mTmUpgeU7D3mEq95vB1smIPvIxRdBTvwJXWaexeXzj8QlWQC
	 6FeByNUxl9X3fMeeGUgrBGanBFPNBEX3GpjrQlh9+FcVRO3nynzol5vDlqXzaLvCOc
	 RcyLvzebQLHOswvPqYOv7F6Bx4DnP5sLW0X0gLYfi19/3ReoHpgbel+weKMmm16XFp
	 GH1TUtlKvjTJmOUizzbAoEbF6+9va83qBHcL2u4Xv2DpsBh6NH/ETYdl/8CyEmOSyz
	 k8RJdNtGmSobVC2D2R7UC4YtAZvyAeKzjujmEOOGUi+nS7ps/IB3RUbGj8b8kJC72g
	 GV8bVM83Ge4ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15A88C41614; Wed, 11 Jun 2025 15:19:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 11 Jun 2025 15:19:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-ZSmPuKsdHn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #27 from raoul (ein4rth@gmail.com) ---
Just to be sure before I compile, is the new .ident line in the patch corre=
ct?
(it says MECHREVO)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=


Return-Path: <platform-driver-x86+bounces-12481-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B543AACF62A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Jun 2025 20:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3584A16B82F
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Jun 2025 18:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CBD274FE1;
	Thu,  5 Jun 2025 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWA7MLLA"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153024400
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146697; cv=none; b=OGybLJB8QVasO6a2UKgYgq+0+h8+z6FV6eEkXQSnu46KYmsRK7cswK4i0TL3y29aZ6XQ/zc0eO6Z8R/sP14kMeaihGrRi7he4ss0t2Efa3m7Tm6kvBf/jkqldKZ1VIsj8XVNJfT5eQg7CHD/6W0pxIpcHmv7SeL0MHhStXDIt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146697; c=relaxed/simple;
	bh=RtE7DqxXhEOXcyO7Pfqs+6Xtre4SJTrgeEWxCk3f+VE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXmIRusGMMb8R+PL/oMCJLcl7dSiCjyYPTkjy+nQri6M7Kwdob0lE0W7+pD1NYEGHDKMQygOGMal/jSLX8oLW8FJVxNnIWtASFbdx4sFH52b3Ayb1bwVGA6xMSQ+nC0GkZZMi/X5yzLTNYvwQc0OBepJYFeXVvBSk8M9pyRGFeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWA7MLLA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F4FBC4CEF0
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749146696;
	bh=RtE7DqxXhEOXcyO7Pfqs+6Xtre4SJTrgeEWxCk3f+VE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SWA7MLLAYYffjgR1lHlhsQYafEqVaJG9BhoipvFsidmPXCg24kuF3c6P/MLjTijhu
	 H+Dh9AcvdJIQ8zir9ZD8y1XS6ONWEK3pFoNfkZXYsJ88k67Jg19kPXYc0l1nuU3F0v
	 WxX5PbJeEl7DOnXN/31KLwKOC/oH5nYnq2ljtyPecoyTELiVwn+lt85avQcmhmiBy9
	 3Nqc76oYDZCiuoEv5b1poXH4AKUZdHsVkEQ/Joqrvq9XKMGCgUqQxRPdeSdJqQJBOp
	 1UPh3H8zsO+TjtcyQKZRPQgK7tMEdSKFN8ypo0S1WwKOxEDx5ZuslRDrZ+/6UWC6Og
	 eIWKjB9NsC+tQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 830AAC53BC9; Thu,  5 Jun 2025 18:04:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Thu, 05 Jun 2025 18:04:56 +0000
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
Message-ID: <bug-220116-215701-H8CMK9xD5b@https.bugzilla.kernel.org/>
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

--- Comment #24 from raoul (ein4rth@gmail.com) ---
Just reported both to https://lore.kernel.org/linux-input/ and to PCSpecial=
ist.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=


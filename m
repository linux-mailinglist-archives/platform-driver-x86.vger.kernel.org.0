Return-Path: <platform-driver-x86+bounces-12834-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A95ADF6E5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Jun 2025 21:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795A53B036F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Jun 2025 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06868200127;
	Wed, 18 Jun 2025 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEbFv6tw"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD23085A0
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275154; cv=none; b=hdNg2+/EID/79vuqrQLe4XcnJhy0OskvNuMuHF8a/FqwYwIo0qVwfzJ4BqSD3mZLPdinXbnF2YyBV4PXZG3tHYkvWqBh2W+FH5kiIEbLCBWCxyaUhCS4GRA7WcESFX9FzxHXynw459rlHYZ1TwjSyjPibw50RLN7LzJ/qgDjFf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275154; c=relaxed/simple;
	bh=YrbbP9+yNx/QSHVD6ckIeMfW6ddtygM0IbcA0C30fCc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ROgFYc3dLXHtnnknLBIoVnGRPazonKk5CV2mjFCRo/S04Wc3mrYrPewITGIowj68Q/EVLDBCVCXSr6PFqvtNUie11pbOyz4nVwDLkfhajp0NVuesM97oGdAjOClZcghu5vNWw8oGJqIFiDHAWsnEtPmgOBDsc8CHeqrgXZjB72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEbFv6tw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6387FC4CEEF
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 19:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750275154;
	bh=YrbbP9+yNx/QSHVD6ckIeMfW6ddtygM0IbcA0C30fCc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LEbFv6twq1Hy8kUdK626X4pqkoJctQoCeSaSbbA8flPH2/ocyQp4/IYU6jhXwUNLK
	 9b4MMvnfpG7LvGpGJHJXBoO/K5mhqhFkgaqSij+yZpkA3XMQIyixfDxTPSkZREaVNK
	 xtuD3T+UUP7UHGGnvL7He/JtJiguxPWgnXEHHym/F7tTOZrVXgkVJPqrSKlJrOhJN4
	 u/0WsokujcIxIOscknghRW1fbTAem1Vxx1ncefbnXyniw7KLev8pVyYvDnhJvYodlo
	 NGhg/q+AO/U66n5m3kBUc879XiHsJmONOhaie2rMAaQdaoaIl3E6/DpnVmR2aHx/Ow
	 aNw0X/EMlaYiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 517FCC3279F; Wed, 18 Jun 2025 19:32:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 19:32:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220246-215701-U53i8CSGsp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #5 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
Created attachment 308287
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308287&action=3Dedit
dmesg in 6.15

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


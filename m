Return-Path: <platform-driver-x86+bounces-7195-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E149D4986
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Nov 2024 10:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89B59281229
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Nov 2024 09:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F191BC091;
	Thu, 21 Nov 2024 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+nUN0h9"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C0F156257
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180079; cv=none; b=XIBQeWumutX+82DWv5hcUELf2tDDJi2YFiOYsyrfLc6qAqKUPlBCNcwgfsea6uwD68+R0keWwY+DTdBR73Gxu9d5l6zuf09M8+oB8u9STkaL8KxIkYb7R6a8pazYVo5Bxyh8dgPW8hPEqWlrTongLctB5f2wAwuFLtHg06U3TW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180079; c=relaxed/simple;
	bh=9wE+3lcUI/vgX0qQpp5gYL0Pr3qPRpUoiKlGm0GJu1s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mGHII4/fdaz3reZ2yBtCsN5qOEOTqCAdlTpCK/5bt0k+F7Gcec3x6ywRFoU4YdohW+W0P/AkNLnYZvICN3WHthy5Y8aQGJ+ij5Xae7MthH2bk8XqaPCSupwbC00LkEruj716cjr8ogW53MLLBr9gL2Cd/YQndg9r1GRl9g02VSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+nUN0h9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D061C4CECC
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732180078;
	bh=9wE+3lcUI/vgX0qQpp5gYL0Pr3qPRpUoiKlGm0GJu1s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G+nUN0h9buaeE7gd4ERaRZp0k1JJt36TqFVs2Rfi+94PjipIr9yrEJpzq6WkDnCVQ
	 IkoParyZh+IEGr96NhyVW0O3G54c04H6C9Lc+iS3bK0fBwbqTx13bkU0c4JFKdkEJa
	 76ICt+6SnF9JCwgvYdFqv1ZUGAROp7epbHox41kAsYYsPWD+QxhB7XqIrNvD5z0Agn
	 6Yk8JB9QA+AqId6qZ6JYZxj2sEDvjaJe73ThOd2xrp4YjOahg6tWQ+uOvORlzpGx19
	 QhefdcUKgw3+DwBsM7COxaxzuGz1bMdB1cyRIec57NlbTHLbyUnDQnnmjuGOhUXsvc
	 YyzfiXr70eiCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67D77C53BC5; Thu, 21 Nov 2024 09:07:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 09:07:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219517-215701-wabYct0L4l@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #6 from Michael (auslands-kv@gmx.de) ---
Created attachment 307260
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307260&action=3Dedit
acpidump of older kernel 6.9.12

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


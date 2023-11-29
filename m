Return-Path: <platform-driver-x86+bounces-143-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6247FD2FC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 10:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5341C20943
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 09:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2C217999;
	Wed, 29 Nov 2023 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlqM0hfI"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E474134C1
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2023 09:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 242A1C433C9
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2023 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701250823;
	bh=w1LXvajwScOvslMEsbGXVGNPTfdm8J6CKvHw/K6bMJY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IlqM0hfIEOFhVBizY59WDmAIDZB+3FQ3Efo04iv5h5CXAccV4YehimsUSP8K3Fukv
	 yE/Z0dKiX1+rBE3L8Q9GyxY9oXeYpDrvTWPr0bFfqBFJsNFgpQiJrPOxu8t+yfc1C0
	 1BUgSp17sS9Eo+BL6F0xzd+MfRppgnLK/UGGTuhqWpAfX4+wIjyFnid+69quuLQJxd
	 LKu5GDs3+jVKj2Tj+SjKCZ9Qd4KNXEg0FjTaGddfM1UxaFGSGl5FRkV0tUOr5rhh63
	 tjPRxXtrIVs0VxXmaiTsqb2ObbRZZlJwhbNJ9kA7jZ7lQZXdBbzyHck9nYkfGmM2NV
	 euL5cf4dX61XQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 04243C4332E; Wed, 29 Nov 2023 09:40:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Wed, 29 Nov 2023 09:40:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-Gu1o5o2KBx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218188-215701@https.bugzilla.kernel.org/>
References: <bug-218188-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218188

--- Comment #22 from Alexis Belmonte (alexbelm48@gmail.com) ---
I believe linux-next OR my WMI patch messes up my EC so badly that it makes=
 my
laptop freeze after a couple of minutes, to the point that it requires me to
reset my UEFI settings...

I'll try to compile the stable repo with my patch and see if this both fixe=
s my
touchpad/Nvidia issues AND makes my laptop alive even if I add back my WMI
patch...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


Return-Path: <platform-driver-x86+bounces-109-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F437FB288
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 08:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31E121C2031E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 07:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F4012E43;
	Tue, 28 Nov 2023 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwfM7vS4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95356CA73
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Nov 2023 07:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22393C433C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Nov 2023 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701155871;
	bh=yE69W6PcLk9wP+4PuZpkBG7sU5ow4L0rJeQhOkFCfR8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IwfM7vS4BbOiCrkVQLiq/bont2ftSshWIVBPXnz5BjRnZABVGAxxHfn5PL1Dw/cnv
	 IOWPrp1NKiLqN4nJO/zJHRm0EgxhNna5qIXluK3Mnhl5VGIQ52qKrDBdYrTyRH1Z63
	 2o6fKHkw9i2npeSGX3XE3KB0TIuozRGkv4CCpc+wmATp1MhnYnjMWp8+aNlQ2sCGIP
	 LKF0e01Btru39zh4bhJzQOF3cghYSmqPHZ2UHBtf4mVDacPnGV9730KX/QI2mM0rLU
	 gPDDbwo1okqZc/fAUmD9caXSWO1UVtUVpvJV0sWlecbT6DmHs4VOo+kF7H304zb5Xl
	 PO2Sb7JgQJChQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1284CC4332E; Tue, 28 Nov 2023 07:17:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Tue, 28 Nov 2023 07:17:50 +0000
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
Message-ID: <bug-218188-215701-Q5FvY3zcKn@https.bugzilla.kernel.org/>
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

--- Comment #21 from Alexis Belmonte (alexbelm48@gmail.com) ---
And PINCTRL_INTEL_PLATFORM makes my system stuck on initramfs... :[

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


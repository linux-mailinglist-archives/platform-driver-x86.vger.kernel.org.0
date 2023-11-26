Return-Path: <platform-driver-x86+bounces-76-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41527F952A
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Nov 2023 21:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419E2280C58
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Nov 2023 20:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A3B12B76;
	Sun, 26 Nov 2023 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoYmRXEg"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054A2D52A
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 20:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 479C3C433C9
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701029291;
	bh=o92wu7jrmUNCD63fBZZXDbSJFktAuKGGgwnheIqRL+w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BoYmRXEgVvgIlwOvoPfUPudmJg1paJPodLb7sVHwOaaloJUs7EeE/MzJqK6N/CrHv
	 6MYnUWJUJmfXSzKampFV2O3bYxQ4OcBB1pNzHLZ/M47+gyaJaGUXDUOnPNvhfaq6hr
	 sCbIRtYVskX9ejIsvoCcWdGs22ViSN/9IfD+upl3vYdb5qwtDvBdghHor2efvq0M1h
	 Mk5a//ciu+Uuf2UGyGIj+YegnZ1dbBJ8D31H83hBlP8IBaj67jT4FaaujfXL+iqH3N
	 yLK/YCnw9gW1rMU4ncL5CBYtkl3mzW7mJuc9VHppPSB4+sIiC6Q0hVPa8AvzVpwySK
	 LG0hjJwZ34YRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F145C53BC6; Sun, 26 Nov 2023 20:08:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sun, 26 Nov 2023 20:08:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-CaIfagTMdD@https.bugzilla.kernel.org/>
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

--- Comment #15 from Armin Wolf (W_Armin@gmx.de) ---
So the WMI patch could be the reason for the regressions?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


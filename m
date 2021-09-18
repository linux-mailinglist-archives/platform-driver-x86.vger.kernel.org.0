Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD4D41077B
	for <lists+platform-driver-x86@lfdr.de>; Sat, 18 Sep 2021 17:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237245AbhIRP7q (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 18 Sep 2021 11:59:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:45172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240028AbhIRP7q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Sep 2021 11:59:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C2C0361350
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Sep 2021 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631980702;
        bh=oVRwSv+oLn3TViCs7A2I/HNAkzIXKxzOdCOlBHn6SS8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BaRSVxuBUPcUGHJ1zcMk/7kSOZJBjTDn6kmVss2FwF5MI2ZpTYb/g52emisDWKrnh
         Dm4TOP3SZ54LN/xljG3c0ZVmGgRMa6qkDl+2b78K56iZbAoonjwKRf03alGy/3DXR1
         5x0tgoI/1QuIbSy+OqdGt2lYMnbW7rwlLqfRyF8AEKk6B+mS2RgFcoBgr/+kZbPSbi
         KP+e5eI1WsuW1mXV/dM+4BDvbmqV+Q7kxxrvH2y0U9dYJIzYIS5z0U4XS7XuWCFzma
         EJpDXc3YwHk2VHoyBSQVxY+IB0cBKxmjUGRrH6N2w67Ly93mGMk79fS0Suju5iMx15
         YmyoJFgnx5sPg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id BE8F1610FF; Sat, 18 Sep 2021 15:58:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 18 Sep 2021 15:58:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pehlm@pekholm.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-uopBYoExvy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #116 from P=C3=A4r Ekholm (pehlm@pekholm.org) ---
Thank you very much for your work, Denis!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

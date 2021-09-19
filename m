Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0CD410B4B
	for <lists+platform-driver-x86@lfdr.de>; Sun, 19 Sep 2021 13:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhISLeg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 19 Sep 2021 07:34:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:42640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230051AbhISLef (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 07:34:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D88406128A
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632051190;
        bh=snkaU02hMg5ac/ndTRakwy/wA1Pz+7yy+CImThIJgIw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XgQFWlhZNDjJyrFmcAwT6sgH1D/tuzwWvIlX7hZw7IcF80+tn0/UZ+GaSVXehuWt8
         oNfE6/S2B2oNTRxNAoxtV6bpRP5JKVjUbUxIoN2WSmb1Uq4rBeTpmKqpPYr9Q6g2yi
         BcC+nhL/avsMO2lkJWwhXTN3PfltY4Wppk1DABa9knIxFYEnmHreMU2fwZgEGV7/Lm
         E6XErhB8SOzEBUBsgBxvChTPzuCm2kk5nUB8yyIPk0m6Q5856dmH4U7jPyjpH4bbGo
         Na8oNKtGcGy+1YtBez9vLTjVlH9gxZ6fA3ScCB/zLvoV+Scl+B49vQM+vb5Nh2CxcB
         BBW+4N1/qmwXQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D560560E4A; Sun, 19 Sep 2021 11:33:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 11:33:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nutodafozo@freeweb.email
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-a17WYv2HEq@https.bugzilla.kernel.org/>
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

nutodafozo@freeweb.email changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nutodafozo@freeweb.email

--- Comment #119 from nutodafozo@freeweb.email ---
does this patch change how kernel reads the sensor values (e.g. to that bug=
gy
asus wmi interface) or it merely sets specifically for nct67 module what
"acpi_enforce_resources=3Dlax" does?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59EAB4506F5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Nov 2021 15:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhKOOdn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Nov 2021 09:33:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:44098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236544AbhKOObU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Nov 2021 09:31:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3435A610CA
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Nov 2021 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636986505;
        bh=3hPIcT6ry7kI1C0QJKFr7IWCxxCWYVhsEOiR44KxGVw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cQcnzxGhUfhyCX9WN/XKDV7GbFge4Hlz/cRadQSu8c1DahAnY0ZkxSJ9wZoUn0rat
         rIp3oxNmBXFz0KiZ3t0XpEAcHtRXWHpDTLfeT/uswyypfzTz9rsc5cL26lfZjQaN2f
         QG2puSAuZ4OabhiUeXkwuvoX3eZ10ss/6WCT0A9XPJOb5UyM7D4CHxdgeI7CEzR9x1
         b+3Qi0V+aNZaHZpEs9smKGYa4kHByw+r+DgfY5xw6TMzsfvbh6QDuUPfsLjoWCbaRz
         5m1eFFt1lry+GpJNNzGzGSEleEQgFKt4EEiVbmFk8nrO0Ng8XbNzpbl0Xv+omATBZY
         s6L1P12NSAUoQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 23F7860F26; Mon, 15 Nov 2021 14:28:25 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Mon, 15 Nov 2021 14:28:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-f0UVOSbzOw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #18 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Just a quick update that this is still on my radar, but unfortunately so far
I've not found the time to do a deep dive into the DSDT.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF3C40B5B7
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Sep 2021 19:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhINRMm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 Sep 2021 13:12:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:60678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231366AbhINRMg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Sep 2021 13:12:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C00161165
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Sep 2021 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631639478;
        bh=Ab9wewYj/Fvb/vEyvRgIJ/lMg09o0/9LtuR8cfgJEwg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k+TR6TlwYEwsFK7rEUohpp9R8x4bBnZ4SLWRw2pWYHa9jn0lYZdvuSbTcpOSkSRfV
         8yot+80xeQkVYx4kAkwqdIuqfaA6ejO2qIfkw6DIhXixS1MwWR4mzbBzfNdY+kJvlF
         JaG4citTaASvpck4kTGUJ+EDN+k9q7MTm7GJTa6fun9a23wfW3P2EAHXrVkvVB80jn
         VRRSAtwUns71jIQdeKBy9RfkeiFGmputL7M4+gdeqbzL9W7Hf1Rf8dSvAQVybnJvu9
         cXsWS9+Lhd6+kbYdj3P/dl55VPk6WyfJvdyGDTOCi7WUU5Tyo49IenixLxvEMLIGmL
         7VYB4lz+bZucg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 392AC60F9D; Tue, 14 Sep 2021 17:11:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Sep 2021 17:11:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: damir.perisa@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-BuIUn4QYv0@https.bugzilla.kernel.org/>
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

Damir Perisa (damir.perisa@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |damir.perisa@gmail.com

--- Comment #108 from Damir Perisa (damir.perisa@gmail.com) ---
i can confirm for "ROG CROSSHAIR VIII DARK HERO" (Rev X.0x):

[    3.360424] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[    3.360433] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20210604/utaddress-204)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

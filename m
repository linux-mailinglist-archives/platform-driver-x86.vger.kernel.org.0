Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7611344733
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Mar 2021 15:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCVObl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 22 Mar 2021 10:31:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhCVOba (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 10:31:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C1B0C61992
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616423489;
        bh=CGFFqpzK/N+5lf70kAlw5FJ+yUvEXc3IGRrA1tHwOqA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oMcRUV4RI1Ht/j8XARRsBxDSxJAEc0nDfRl05eCihY3ZPkoKH2i/q0zQIVJq97WRk
         90TZsbAYPGMKcA3J95AP7esGoQ90cv3mchaFshxo3RHLdDn0p6THvw2+tbfXtcWEeX
         rN7GyjHbRm6dXA93eo9BFL4fkoPNeiUtVZRY/wlrAUp736XQu6tMr4lIueQIldzrtn
         j+LqYJpxXJMLSW9xM4lLNUZ4rkQa5i28dcW51lnTY21bxmzEinbdiZSuwahMGnpCpE
         kBHeKsq52BTJuNfXYaIsCLiz+pJ2dU2yXVW9yyYCJabL72HATBS9wo9BhNhC3IP4jg
         Ddd2usyqbIhTw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id BECE862AB2; Mon, 22 Mar 2021 14:31:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 22 Mar 2021 14:31:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-lnS4YIeLMV@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #53 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I'm also removing myself from the Cc of this bug because the discussion here
does not seem to be productive. If anyone wants to implement the solution w=
hich
I outlined in command 47, drop me an email at hdegoede@redhat.com .

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

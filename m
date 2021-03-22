Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C84343D8B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Mar 2021 11:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCVKNA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 22 Mar 2021 06:13:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:49106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhCVKMu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 06:12:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 45F746198C
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616407970;
        bh=np+rMe+8bYAGz0qUc6qnir6OkEenf0F+wpmf5HwN148=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kmGG1Pv9JmPrnjvNoFhnfd96vfb5K/nGIBUoCfxuFJ1DHLi7b+vThehN+Xcl7Kpzi
         tvTblTR8DvoZaLp5Z/ClL6YMeT552d3tXpAouhi0GkBl/nCLEtcbNbPbv6HGOAgO2u
         LxD5Qgv5HSmsNYVPCarzPnSiW0826ViDi0er+6lG/0pl3E4KgKGho2OyPNtkwHcA8u
         kaYedGrxz7oP5y+LZ55ENhG+UQykqw2XpALHAhI+jMYvjCZUHUCcVWxQJJRFwe6VhG
         bUUfwpMB0Cpfku5maSJAEaJrlZHJQ5x46S7ZVp+9VwEdt3IZvRaV+wrVr3vOXOnVNn
         KHFbqJC6Nf52w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 42FD862AB6; Mon, 22 Mar 2021 10:12:50 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 22 Mar 2021 10:12:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-WvYeI8ziEM@https.bugzilla.kernel.org/>
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

--- Comment #48 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Artem,
Matthew gave a really good explanation on techical background what's going =
on.
What you really need is to amend existing driver(s) or provide a new one to
fulfill the functionality you want to have.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

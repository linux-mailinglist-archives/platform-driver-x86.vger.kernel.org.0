Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F95F2AA8F6
	for <lists+platform-driver-x86@lfdr.de>; Sun,  8 Nov 2020 04:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgKHDNP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 7 Nov 2020 22:13:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:60386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbgKHDNP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Nov 2020 22:13:15 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 200885] missing Lenovo Yoga 530 in ideapad_laptop rfkill
 blacklist
Date:   Sun, 08 Nov 2020 03:13:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sergio@serjux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-200885-215701-qXzUK687cd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200885-215701@https.bugzilla.kernel.org/>
References: <bug-200885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=200885

Sérgio M Basto (sergio@serjux.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sergio@serjux.com

--- Comment #2 from Sérgio M Basto (sergio@serjux.com) ---
(In reply to Philipp from comment #1)
> adding the dmi information to the blacklist and deploying the patched module
> gets it working as expected.

who do you add dmi information to the blacklist ?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

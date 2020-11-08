Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6975A2AAA62
	for <lists+platform-driver-x86@lfdr.de>; Sun,  8 Nov 2020 10:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgKHJgK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 8 Nov 2020 04:36:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:54008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgKHJgJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 8 Nov 2020 04:36:09 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 200885] missing Lenovo Yoga 530 in ideapad_laptop rfkill
 blacklist
Date:   Sun, 08 Nov 2020 09:36:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-200885-215701-WYMfNjVo6f@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |CODE_FIX

--- Comment #4 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
The no_hw_rfkill DMI list has been dropped (by me) about 18 months ago since
there was an endless list new yoga models which needed to be on the list:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/ideapad-laptop.c?id=5105e78e5b2414ec39efaadca1802e37e7105bb1

Instead there now is a list for models which do actually have a hardware rfkill
switch (and during the last 18 months 0 entries have been added to this list).

So this is resolved for any kernel which includes commit 5105e78e5b2414ec,
closing.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

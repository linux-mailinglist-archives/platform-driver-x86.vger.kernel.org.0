Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA3B301BBC
	for <lists+platform-driver-x86@lfdr.de>; Sun, 24 Jan 2021 13:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbhAXMF3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 24 Jan 2021 07:05:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:60468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbhAXMFX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 24 Jan 2021 07:05:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9809322D37
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Jan 2021 12:04:42 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8F9A981F0C; Sun, 24 Jan 2021 12:04:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 24 Jan 2021 12:04:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@richard-neumann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-Uum9gxrEC0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=199715

--- Comment #56 from Richard Neumann (mail@richard-neumann.de) ---
@Dimitris, @Luya
I have added DMI-based model detection to my driver [1] (v. 2.9.8 in the AUR).
I successfully tested it on my system.
Please make sure that you disable i.e. comment out any sensor override if you
want to test whether it works on your systems. The quirk should enable only the
accelerometer and magnetometer for the devices that Luya and I posted above.

[1] https://github.com/conqp/amd-sfh-hid-dkms/blob/master/amd-sfh-quirks.c

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

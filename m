Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CA92E73E8
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Dec 2020 21:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgL2USy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 29 Dec 2020 15:18:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:60240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbgL2USx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1E09522227
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Dec 2020 20:18:07 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1B68481F1E; Tue, 29 Dec 2020 20:18:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 32742] Keyboard backlight does not work on Toshiba Satellite M
 series laptops
Date:   Tue, 29 Dec 2020 20:18:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: chris@ckvsoft.at
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-32742-215701-VluMDUsPuB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-32742-215701@https.bugzilla.kernel.org/>
References: <bug-32742-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=32742

Christian (chris@ckvsoft.at) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chris@ckvsoft.at

--- Comment #115 from Christian (chris@ckvsoft.at) ---
Hi

Wow, very long time. I can confirm that kernel 5.8.0 from ubuntu also not work.
The Trick will work on Toshiba P750, but FN-Y never worked under Linux
I can boot with LED On, but can't change the state.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAD62FC14A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 19 Jan 2021 21:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbhASUio convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 19 Jan 2021 15:38:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:60682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727186AbhASUhb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Jan 2021 15:37:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BC1A023134
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jan 2021 20:36:50 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CD6CF815C5; Tue, 19 Jan 2021 20:36:50 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Tue, 19 Jan 2021 20:36:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmaroulidis@dimitrismaroulidis.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-VM9zjKfSSw@https.bugzilla.kernel.org/>
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

--- Comment #46 from Dimitris (dmaroulidis@dimitrismaroulidis.com) ---
@Hans I get 0 on the gyro, the magneto functions correctly (tested with Luya
method in comment #45) and the accelerometer also. I have no ALS detected.

My laptop model is Envy x360 13-ag0011nv (P/N: 5VZ54EA).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

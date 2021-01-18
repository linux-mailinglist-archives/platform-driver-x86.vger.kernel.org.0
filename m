Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338D32FA2FF
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Jan 2021 15:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392918AbhARO2a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 18 Jan 2021 09:28:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:45116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392889AbhARO2C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jan 2021 09:28:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0613D22B39
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2021 14:27:21 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E635F81649; Mon, 18 Jan 2021 14:27:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211117] [oxygen] [virtuoso] route, dmix and other alsa plugins
 produce garbage output with mem_encrypt on Ryzen platform
Date:   Mon, 18 Jan 2021 14:27:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: perex@perex.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-211117-215701-myZ7mLfb0s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211117-215701@https.bugzilla.kernel.org/>
References: <bug-211117-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=211117

Jaroslav Kysela (perex@perex.cz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Sound(ALSA)                 |Platform_x86
           Assignee|perex@perex.cz              |drivers_platform_x86@kernel
                   |                            |-bugs.osdl.org

--- Comment #15 from Jaroslav Kysela (perex@perex.cz) ---
It looks like an issue which is not related directly to audio, right?

Reassigning to Platform_X86 .

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

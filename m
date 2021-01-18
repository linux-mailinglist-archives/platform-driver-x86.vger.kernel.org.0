Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014062FA333
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Jan 2021 15:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390816AbhAROhG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 18 Jan 2021 09:37:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:46404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730501AbhAROgu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jan 2021 09:36:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C2F0D22472
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2021 14:36:09 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BEA2782AAE; Mon, 18 Jan 2021 14:36:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211117] dma_mmap_coherent() - garbage sound output with
 mem_encrypt on Ryzen platform
Date:   Mon, 18 Jan 2021 14:36:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211117-215701-KpNyLxxmRf@https.bugzilla.kernel.org/>
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

--- Comment #16 from Takashi Iwai (tiwai@suse.de) ---
Yes, this must be a generic issue.  I'll ask Christoph at first.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

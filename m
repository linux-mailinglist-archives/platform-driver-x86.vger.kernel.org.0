Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF82FA305
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Jan 2021 15:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392948AbhARO3b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 18 Jan 2021 09:29:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:45316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392942AbhARO33 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jan 2021 09:29:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 32D1F22B4E
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2021 14:28:49 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 20CDD81649; Mon, 18 Jan 2021 14:28:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211117] dma_mmap_coherent() - garbage sound output with
 mem_encrypt on Ryzen platform
Date:   Mon, 18 Jan 2021 14:28:49 +0000
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
X-Bugzilla-Changed-Fields: cc short_desc
Message-ID: <bug-211117-215701-HmQx4SuYIw@https.bugzilla.kernel.org/>
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
                 CC|                            |perex@perex.cz
            Summary|[oxygen] [virtuoso] route,  |dma_mmap_coherent() -
                   |dmix and other alsa plugins |garbage sound output with
                   |produce garbage output with |mem_encrypt on Ryzen
                   |mem_encrypt on Ryzen        |platform
                   |platform                    |

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

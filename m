Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952E73BACED
	for <lists+platform-driver-x86@lfdr.de>; Sun,  4 Jul 2021 13:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhGDLmB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 4 Jul 2021 07:42:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:60076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhGDLmA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Jul 2021 07:42:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 032B5613BD
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Jul 2021 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625398765;
        bh=4TmsWcpqkS9+89/SaZc0P0zUNHVlGagLcUI+3KuKGtk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mEDLO69tP0LbJRX7+j7/b4Z9ta3U5S/e/mtCmg7+FtPQGa03Ny5nxjEVjHqgtV6L0
         /yFi2IgAWA8zfNktoUIAcP4izW6oTRbUM2RYvIzD6Ko7O+C2GvFIAW/ekSDAmyY1Uz
         ygVh88rLZ8dTC9pPh162sJGdGCBgwLevlNqtKj7FVHbDzCPvLTzCV+ocJUaCvCcJ5o
         HuD+UNkJSaZxiPRQghDGNkiko/Ofpeylgy8sqBUsiWK/fgD2wH9R5UblQA9hTZjbMC
         KLQMH2OVFIGpk3KE3zXo7T5RzzIkSpld6wgSUe1cWPQw8h5aHY/6TORz9vx8ZWVbz/
         B+DDzB38Mer/g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E4D9D611F1; Sun,  4 Jul 2021 11:39:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Sun, 04 Jul 2021 11:39:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213579-215701-z3lgZ5Km08@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com

--- Comment #6 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Similar bug #211957 (on FYI basis).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

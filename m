Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2C03DDA32
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Aug 2021 16:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhHBOHb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 2 Aug 2021 10:07:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:52932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235787AbhHBOF1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Aug 2021 10:05:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 38F3B60F41
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 Aug 2021 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627913118;
        bh=1UnZQ811DdE5RU0L3RTifnBHiUFmBTtV8H4+IMlQO9Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xk+yAvrPDujR4R4N5ypJiiYOuQxcVj/HhTDGrsCNRRdnMmpNVnS04XjjTUs3mSHJV
         lp0e78PMDG2ufggVDabGpM7HZ0y+PFN+sYyDLI8rMT8R7LayGnV65XKg7MmObJ6mID
         pVanP4EIssRP1mM8fgZT+FPrsFsdEtowJQyG0rdgIBWWAF38RV2A1B9yiPX923/fXq
         kNF5bEpEgt7HpX8ImZvlVrbPlyh6gKJwiA3wIul4Nv/RN83v6AU6oWozaFKElF3vef
         T4nUipFLTQD+a4gnp5gXPaWmqFtSWgJzKskZq2tsKkc9/AyDcEO51Yp+PSZ7gdyaB1
         2MJwZxlhSSmZg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 20BA960E4E; Mon,  2 Aug 2021 14:05:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Mon, 02 Aug 2021 14:05:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-XirTMEi33m@https.bugzilla.kernel.org/>
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

--- Comment #45 from wse@tuxedocomputers.com ---
(In reply to wse from comment #44)
> Found the offending code bit in the dsdt:
>=20
>     Scope (_SB.PC00.I2C0)
>     {
>         Device (TPAD)
>         {
>             [...]
>             Method (_INI, 0, NotSerialized)  // _INI: Initialize
>             {
>                 BADR =3D SADR /* \_SB_.PC00.I2C0.TPAD.SADR */
>                 INTA =3D GNUM (0x0801000C)
>             }
>             [...]
>         }
>     }
>=20
> INTA should evaluate to 0x8C (140), but does evaluate to 0x2c (44).
> GNUM is some kind of offset calculation, ignoring the 0x08, taking values
> from an array based on the 0x01 and adding it to the 0x000C. You can check
> it in the disassembled dsdt. I don't know ofcourse if GNUM is buggy, the
> array is wrong, or the 0x0801000C input value is wrong (you can choose an
> input value that makes GNUM evaluate to 0x8C).

However: Building and using a dsdt with INTA hardcoded to 0x8C makes the
touchpad work on arbitrary kernels. Maybe a better workaround then a self
compiled kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

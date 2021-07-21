Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F82E3D0F2F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Jul 2021 15:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhGUM0y (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Jul 2021 08:26:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:59722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231791AbhGUM0y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 08:26:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 162836120C
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626872851;
        bh=wGuXb0RsqqE4974he4s5/TGNYFZn9AaTWUHDkqi1DTM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tETOU6gv0b1/3S0nKq2qasZ7D7E3g6vR3KKsp1yK8n8QC4eBTOrqHuUpt3JahDe5m
         m8ECTmpZUF4KG3vjCA2GXjVmHrWY/OlfPFYOJR8USjW8KKf1GQazBAq3MxrJSxpYMr
         CuOrQMJvvwDR3cDA0Ot+h59mpPl6yuuNv1Al3X2dT6+fJEku+AQZGPqUS9glp8oJn9
         cH5OcPob8OPLswsciKp9xTjb3aQmsxg70/uwIA2uk4/rTjVR898MEp9dnpC28o36mY
         K7kWWCcAFdygGtCrZMn+VbpvC2NFpfMtx0Fb687EDyu+OzA285z5khDa4p9OTcPhIn
         K0V7pw8o0ZcBg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id F200A61263; Wed, 21 Jul 2021 13:07:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 13:07:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-s597Ad8ldb@https.bugzilla.kernel.org/>
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

--- Comment #19 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to wse from comment #17)
> pin 57 (SLP_S0B) 44:INT34C6:00 mode 1 0x84000500 0x00000051 0x00000000 [A=
CPI]

What I'm wondering is if the pin list is broken and actual pin 57 is someth=
ing
else (+- few pins according to the current driver). May be someone can inst=
all
libgpiod tools (such as `gpiomon`) and run with pins that are already in GP=
IO
mode without [ACPI] bit set. Something like `gpiomon gpiochip0 43` (for pin
#56) and `gpiomon gpiochip0 47` (for pin #60). Then if touchpad (when being
touched I presume) generates the interrupts this will show them. But it's
unlikely as=20
per success story described in the bug #211957 where pin under question has
much higher number and any pin list disturbance will be noticed immediately.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

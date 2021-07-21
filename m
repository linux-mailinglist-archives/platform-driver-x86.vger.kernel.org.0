Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56AC3D194B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Jul 2021 23:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhGUU53 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Jul 2021 16:57:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:52220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhGUU52 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 16:57:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E68486135A
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 21:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626903484;
        bh=3rBg8Hh1gVk9mPVl2yshUSwKee2hBEf2oz+cG0Nz6Ko=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kQ7yhfDq56bU2spdIXDXqISShiVzDqbmiOSN7MasrEVpext2uaazxkYbm2LfriBFg
         Z9xgkFT54BNXzSNiJ4XAa+AiH5UOJhd4Cg2LpuJ38e+AiQ1cQdsQU36w1JaRjoTz8b
         3eeQ8Wv33HP3t28Y7onzVmPekiJDdf89b8VY5mFfml2y3a/5v8J386ytiCvzPyI0B/
         8GUyLeFrRTgu2zhR6aJ2RPffbgiA1CCp8ljh9Y/9gsWRp1C3S3mNYbXbJS/HGFLMtk
         eGAc3JpVwrSmxC9S1RgQPK8FRbkwA23GbMjsH9/YB0btq6hzo2OJLcNGbWpn0/BSOD
         12DY15m9aWSCA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D399161263; Wed, 21 Jul 2021 21:38:04 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 21:38:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213579-215701-W3gGx1S5VJ@https.bugzilla.kernel.org/>
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

--- Comment #33 from Riccardo Mori (patacca@autistici.org) ---
Created attachment 297991
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297991&action=3Dedit
dmesg working

Ok, with the map from pin 44 to pin 140 it is indeed working
So the issue is actually a wrong pin number.
At least now we have a workaround for this.

Thank you very much to everyone that helped.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

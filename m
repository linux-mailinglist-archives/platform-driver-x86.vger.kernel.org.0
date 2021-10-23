Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00979438333
	for <lists+platform-driver-x86@lfdr.de>; Sat, 23 Oct 2021 12:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhJWKZX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 23 Oct 2021 06:25:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230126AbhJWKZX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Oct 2021 06:25:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D11460F70
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Oct 2021 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634984584;
        bh=1yKisnXJ1QQhGwErJtynFfiKyyeJv1t4IFfceUUvGKg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BzNbUp95c3dAaFSlilFpvkv8W87eX4PrkP5yzSef9toKZJIyUxYB78fFgPEtpOLXM
         vAdCLMvBFbicqRSBSjBMCmAGYTH5g+aE30pPYA+1J6NLI0yYEqtr73pm5dnHObKEKc
         HxiUEnqdhxm8gGkzwcaTL9/4lEqCb+K7vr59SJRuWyseB5YuEcWNOgypk4RN/iS/I2
         2wz/Vq9l/Sdcvreb/B44B9XpMqTtODQeFQzPfr7AO0eUbj+Hy8zHbBlUNYadehjiN6
         oxXerdPogGaiF54OjjycaHtb3CUkQLapi12yyOt0ztUHTS04SImu4vasE0x80f7IwL
         klbeGU6uVPU9Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1573C60F43; Sat, 23 Oct 2021 10:23:04 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211977] System fails to resume the second time with 5.10.17,
 resumes fine with 5.10.13
Date:   Sat, 23 Oct 2021 10:23:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211977-215701-GqeCjch7Kz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211977-215701@https.bugzilla.kernel.org/>
References: <bug-211977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211977

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |UNREPRODUCIBLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

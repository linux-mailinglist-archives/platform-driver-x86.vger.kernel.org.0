Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE60F3D1339
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Jul 2021 18:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhGUPX1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Jul 2021 11:23:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229903AbhGUPX0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 11:23:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 40D4D61245
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626883443;
        bh=d05SN2Xo+B/iUk7/3mf1AF35OIRN4lZ4PRACmH9KbLI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k3QUy9w9oWSza2qSXvpm7eG3TMARJm0vDQhZBTtfzu+1Huz6Rx1UrZH8NXQgTtQaq
         6BsUKjfYFbyM6KdshBfdQwv0geqGg/YA/++REPCLflakILak4o5wOfLgO5kBCOkTjV
         bbVwp7iSk35RqAPvh2d8FTpO3CrTkqweJRvD0y5cO2tCWsuIl/EuIaxKfcLu6yuMU/
         h/S7bu3jvvyLO6LvblaJYG5ysb9Mf3Phji/vbIUBrTzujtPgmK+cIdjZtcobrYiucI
         5sRtebCR+PUfTUQx+O9j5YktOyiIpD2e4df9BJfXFXfDqeLtUnFVbrPk+Ih3DYskPg
         rbrmrumvMhyBQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2565561263; Wed, 21 Jul 2021 16:04:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 16:04:02 +0000
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
Message-ID: <bug-213579-215701-s3GTROhhg7@https.bugzilla.kernel.org/>
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

--- Comment #25 from wse@tuxedocomputers.com ---
Did i get it right that this are the actuall physical pins on the bottom of=
 the
cpu?

Does anyone have a schematic for a device available where this issue arises?

So we could check where the physical connections between the touchpad
controller and the cpu soc terminate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

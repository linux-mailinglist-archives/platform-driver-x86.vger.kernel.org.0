Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB0D342C6B
	for <lists+platform-driver-x86@lfdr.de>; Sat, 20 Mar 2021 12:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhCTLno (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 20 Mar 2021 07:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229877AbhCTLnn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 07:43:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C8D1C6199F
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 07:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616226663;
        bh=5nVPmHxgQnOirYOy4LYQtw6TQ/3oDys4Xfg4TU6SlAs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aeug9pfsTpCyhcNNJtvZXPuBiljOowsW2xDB5cEDJ2ieIQF7SV4wQdXrKyX9OUHCx
         ALnuZSwJHZjKjhVslmDZot9GVhaodjprUHpjLTfqVSZZDMPwb2dzo3BsUHCsLasctR
         8qE7dZ7mzafP3hOnLFyXACDzZDZYw6BXvMpZEBcno5hb9pokYG/7QyPxcri21k63Ld
         oKo3PeeXdXAuLg/zpCvZ/E/L0cpYokKbCorBkkGgJw/qPW2Ji09CItEt2OwgzlGaHi
         rI2OTTp/FjiqUl6ZxQNxUsDRzTIS+x3YToeDyqGhV9Ah3GA2mCb9DfoteYecsoJxvk
         o3mlpXCYQgkxw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C4FB062AA1; Sat, 20 Mar 2021 07:51:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 07:51:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-qphMartBbJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #39 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
As noted in https://twitter.com/james_hilliard/status/1373178256615211012,
there's actually a driver here:
https://github.com/electrified/asus-wmi-sensors/ . I did a quick search
earlier, but managed to miss this somehow.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F37C3F3EAE
	for <lists+platform-driver-x86@lfdr.de>; Sun, 22 Aug 2021 10:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbhHVIr5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 22 Aug 2021 04:47:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:45242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231147AbhHVIr4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Aug 2021 04:47:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A50D26135A
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Aug 2021 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629622034;
        bh=2zM3CUCKYyMNZ7eJB//B8csRMXZd19TW5BpUMXkH21M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JM0mq19AXiLQsSOrotjNvoR/fmi9lvQCuDAsesaPi6R/3DPBUzWVs1H2sWWGkm/ha
         0nKtqxZVwjDgnWdoo9Fk8UAbiHK/OV7rp1y4XoCr7tM5j3LQk4KqQzmbjum9zBYFKi
         QkRpC9YSei22DbA+J2dCa455b4WwfZRx/f24WjCEGj3+xhlo2zd1eHlQG3XU98DOCI
         OEtKJSN3qPBSn8KtVeZD5cqSDeY5INpY0aJJusgicoCfDrWj/RV5vkj/aeXzCLW9i5
         Is1Ba/oSZY1jjIrNdyDKB+lrclkmn+S+/rQ9v3PF4NXE0B/rzM9B1xvAjFb2/vqDKS
         kOku3+5y575Lg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A198C60F55; Sun, 22 Aug 2021 08:47:14 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 22 Aug 2021 08:47:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-ddzXygUlLn@https.bugzilla.kernel.org/>
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

--- Comment #84 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #83)
> (In reply to Andy Shevchenko from comment #82)
> >=20
> > The best what you can do is to go to the mailing list and discuss it th=
ere
> > with a respective maintainer.
>=20
> Meanwhile this bug is not resolved and there's no (accepted) patch. The b=
ug
> status is wrong and misleading but I'm not going to argue :-)

First of all, read comment #80, second, do not misinterpret the bug status.=
 It
shows exactly the current state of affairs. If nobody wants to work further=
 on
the offered change, it's not a problem of the community. Linux kernel does =
not
work on "take it or leave it" terms. So, instead of whining here, roll up y=
our
sleeves and finish the job, that would be much better!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

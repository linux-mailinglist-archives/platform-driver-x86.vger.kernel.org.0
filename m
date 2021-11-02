Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6FF443839
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Nov 2021 23:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhKBWJW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Nov 2021 18:09:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:33634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhKBWJV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 18:09:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F79D61050
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Nov 2021 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635890806;
        bh=FWYNuidMMTkk4l+tatoZheTVnMHz3EbyrRcVTrUJM7Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dg6IVmGpMrUeBkJOhq23vDYcBhYVbFpRroiYLXX2BXDI5SKmEST2C3r7kkdeE8vFz
         /bRZSP4jhkPwVrZur7WWONoIb9KtxGlwS1XAbHpJkVAKWRSw126GGZWHJqd3FpycEA
         DCWe/fn/O4aYs8Hm9ui/ckJmhZlAQP66s3yw4R3iHm+BRFo7pjJbaSaaTFMcHCyiDO
         XgXr7wL6yJrET9Hl/9gA2zObAy6GSfhZEmx3y6UfZMZO2FngCPu+KRWYfGL1tZppPN
         qoxv2U8YTjT/Q3md4gjYayeqHX/LC4hpV3VYkqsYonSMO+c0t9BafDq5j4Ki8kKGiz
         ab1TI4R4/FGWg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5AFC960F46; Tue,  2 Nov 2021 22:06:46 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Tue, 02 Nov 2021 22:06:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-AzCysdaNd2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #15 from Johannes P (johannes.penssel@gmail.com) ---
Unfortunately, your latest patch did not yield any results either. :(

In the meantime, I have discovered another peculiarity: the ACPI/WMI events
generated by this "open app" key are identical to the ones created by press=
ing
Fn + ESC. (i.e. toggling Fn lock) In fact, the WMI 0xd0 event is already
handled by ideapad driver in the ideapad_wmi_notify function. The only appa=
rent
difference between pressing "open app" and pressing Fn + ESC is that the la=
tter
also toggles the LED on the ESC key. This might be a firmware issue however=
, as
this key does nothing in Windows either.

Thanks a lot for your support!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

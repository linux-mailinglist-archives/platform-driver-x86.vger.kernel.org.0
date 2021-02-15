Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C7131B7DC
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Feb 2021 12:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhBOLRz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Feb 2021 06:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:48166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229890AbhBOLRx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 06:17:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C614D64E52
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613387832;
        bh=lOrtZDb7XlGh4VfpysmDFLXtg3Iq93N2Hl6JsVqk2Bk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nMOK12GrtUUymkPrHkUXKyQ56A0tyA34LN/ytrn1U7tDl8Uy2dlD4MAp4i+qwukE2
         FaAI/0/Qr4jVji+6x75W3/JwlkgdChqTooyWxiTTsvqaJ7WYcvZoDX27TjEMLms8Uz
         t2xmH+yTMyDNJus+Rm/cwsOqZFhV/TJVQ/kSQ/kwyUcGPH6dl+lKl1c8dErIgorIyo
         wci9IPnaAjvZrHDTIJ3RppTtHI2nRCDBqp+9cNV4R0IdmXLRzSGvlMrtvfKtmsg8lY
         88qyIUZ0EOc+4d00ZnyUsDxDbcd0fhkmvXcJssY4Z0JvzzVk690ok7ezAVoip+H9Hm
         5Vm264xFGIqCg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B4DD76017D; Mon, 15 Feb 2021 11:17:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 196871] iio accelerometer works correctly only if continously
 polled on Lenovo Yoga 520 80x8.
Date:   Mon, 15 Feb 2021 11:17:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-196871-215701-3PFv2o7PXy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-196871-215701@https.bugzilla.kernel.org/>
References: <bug-196871-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D196871

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com
          Component|I2C                         |Platform_x86
           Assignee|drivers-i2c@kernel-bugs.osd |drivers_platform_x86@kernel
                   |l.org                       |-bugs.osdl.org

--- Comment #4 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Sounds to me like a PDx86 issue, but maybe IIO. Move to PDx86 (on a FYI bas=
is),
although bug report is closed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
